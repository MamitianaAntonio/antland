import pygame, random, sys

pygame.init()
info = pygame.display.Info()
W, H = info.current_w, info.current_h
screen = pygame.display.set_mode((W, H), pygame.NOFRAME)
pygame.display.set_caption("sakura")
clock = pygame.time.Clock()

petals = []
for _ in range(80):
    petals.append({
        "x": random.randint(0, W),
        "y": random.randint(-H, 0),
        "speed": random.uniform(1, 3),
        "drift": random.uniform(-0.5, 0.5),
        "size": random.randint(4, 10),
        "alpha": random.randint(150, 255),
        "angle": random.uniform(0, 360),
        "spin": random.uniform(-2, 2),
    })

PINK = (255, 182, 193)

while True:
    for e in pygame.event.get():
        if e.type == pygame.QUIT:
            sys.exit()

    screen.fill((0, 0, 0, 0))
    screen.set_colorkey((0, 0, 0))

    for p in petals:
        p["y"] += p["speed"]
        p["x"] += p["drift"]
        p["angle"] += p["spin"]
        if p["y"] > H:
            p["y"] = random.randint(-50, 0)
            p["x"] = random.randint(0, W)

        surf = pygame.Surface((p["size"]*2, p["size"]*2), pygame.SRCALPHA)
        pygame.draw.ellipse(surf, (*PINK, p["alpha"]), (0, 0, p["size"]*2, p["size"]))
        rot = pygame.transform.rotate(surf, p["angle"])
        screen.blit(rot, (p["x"], p["y"]))

    pygame.display.flip()
    clock.tick(60)
