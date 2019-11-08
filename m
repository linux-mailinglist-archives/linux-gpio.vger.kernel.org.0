Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFD5CF4FC4
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Nov 2019 16:34:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726349AbfKHPeD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Nov 2019 10:34:03 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:44695 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726095AbfKHPeC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Nov 2019 10:34:02 -0500
Received: by mail-wr1-f67.google.com with SMTP id f2so7471268wrs.11;
        Fri, 08 Nov 2019 07:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i5BiRiXwtTJW/SQvDixJhjF3Xysb1UvK7UuuGE5cBs8=;
        b=otfC+53S7HNwtFGG0pY92rNtOKi6jf8xa0ncJ555Hm3vMQjUEitvj7dHWV9XITZ7yB
         TgF9d4XowUCgYZal6R9mWTNCzrcOknLS79vG6Iofhn2B2j2wmOraElxezsTqfPCasid1
         8Q292bbS+BIQ/z+gW5TPR58vOv6U5EPx1b14PEEQzSvhqn7BW685hnVK0C8Q+p6c8Zr5
         e5+9Nto06Vw/Cka5dVJlLGzQbhm/+eXFECkq/aDcW6cY5n+vZVn6xx9CX7zk2dFUpPjw
         XqoFUslitPr/RSWgm1tkefluE3NSI7dAMuoL+wK1c699jk8uVIknLDAcpgzyMNB3KvLF
         eb8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i5BiRiXwtTJW/SQvDixJhjF3Xysb1UvK7UuuGE5cBs8=;
        b=sIlsxmRzGxStIpWqymv2Zp+M0qDWe12NgAQ0M5pu/Z8QG6tspejnv8qjlBijMlQMDu
         vmYvQnvVnyuY5g3WmvgSf8Co0jApHK4DHF+axr+PEOo5rEZHOqgVYnYRnCDA+bm+WftM
         r8VWRrvR+x9wC5dOIlS/UugcP2vHDtWxGhWZNOLivF1kYt2NRyTmIN+WJ3K7W9A9/Tkc
         0F8BRL2Vht8Q+Go17Cm9WPX1kgql5AJHY9H+H8AxyjZZQtil8C0M63aIXgPuH3V22cPZ
         qThRDCay7xv+TJOaKQ5wC4IsBFu7nPIO0582Zx+TZ9hOSF00dUwnmNgsae78/fzUQJmK
         9RBg==
X-Gm-Message-State: APjAAAX9H8Tipem8Nj168C+GChzd8W5L87r2w7vJluiqewxrV3ybC/Mv
        U3nbQYkISeL4t/KzBRDJcQ6YDwpVxVI=
X-Google-Smtp-Source: APXvYqzG2T5miJO7s2m/EiQ0gpp1Z9UTG5Sv/xnrwBi7yPAIGDbhuN4bT0Jq9mLZVmG4f3qfFJt/GA==
X-Received: by 2002:adf:9e05:: with SMTP id u5mr2734373wre.239.1573227238813;
        Fri, 08 Nov 2019 07:33:58 -0800 (PST)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id k125sm7293890wmf.2.2019.11.08.07.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2019 07:33:57 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, Vidya Sagar <vidyas@nvidia.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 1/3] gpio: tegra186: Derive register offsets from bank/port
Date:   Fri,  8 Nov 2019 16:33:51 +0100
Message-Id: <20191108153353.3149078-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The register offsets for a given bank and port can be easily derived
from the bank and port indices. Update the port descriptors to list only
the bank and port numbers to simplify this.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpio/gpio-tegra186.c | 195 ++++++++++++++++++-----------------
 1 file changed, 100 insertions(+), 95 deletions(-)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index 0cc3f781592d..32714cefdfde 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -44,9 +44,9 @@
 
 struct tegra_gpio_port {
 	const char *name;
-	unsigned int offset;
+	unsigned int bank;
+	unsigned int port;
 	unsigned int pins;
-	unsigned int irq;
 };
 
 struct tegra_gpio_soc {
@@ -90,12 +90,15 @@ static void __iomem *tegra186_gpio_get_base(struct tegra_gpio *gpio,
 					    unsigned int pin)
 {
 	const struct tegra_gpio_port *port;
+	unsigned int offset;
 
 	port = tegra186_gpio_get_port(gpio, &pin);
 	if (!port)
 		return NULL;
 
-	return gpio->base + port->offset + pin * 0x20;
+	offset = port->bank * 0x1000 + port->port * 0x200;
+
+	return gpio->base + offset + pin * 0x20;
 }
 
 static int tegra186_gpio_get_direction(struct gpio_chip *chip,
@@ -343,12 +346,14 @@ static void tegra186_gpio_irq(struct irq_desc *desc)
 
 	for (i = 0; i < gpio->soc->num_ports; i++) {
 		const struct tegra_gpio_port *port = &gpio->soc->ports[i];
-		void __iomem *base = gpio->base + port->offset;
 		unsigned int pin, irq;
 		unsigned long value;
+		void __iomem *base;
+
+		base = gpio->base + port->bank * 0x1000 + port->port * 0x200;
 
-		/* skip ports that are not associated with this controller */
-		if (parent != gpio->irq[port->irq])
+		/* skip ports that are not associated with this bank */
+		if (parent != gpio->irq[port->bank])
 			goto skip;
 
 		value = readl(base + TEGRA186_GPIO_INTERRUPT_STATUS(1));
@@ -562,7 +567,7 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 		const struct tegra_gpio_port *port = &gpio->soc->ports[i];
 
 		for (j = 0; j < port->pins; j++)
-			irq->map[offset + j] = irq->parents[port->irq];
+			irq->map[offset + j] = irq->parents[port->bank];
 
 		offset += port->pins;
 	}
@@ -581,38 +586,38 @@ static int tegra186_gpio_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#define TEGRA186_MAIN_GPIO_PORT(port, base, count, controller)	\
-	[TEGRA186_MAIN_GPIO_PORT_##port] = {			\
-		.name = #port,					\
-		.offset = base,					\
-		.pins = count,					\
-		.irq = controller,				\
+#define TEGRA186_MAIN_GPIO_PORT(_name, _bank, _port, _pins)	\
+	[TEGRA186_MAIN_GPIO_PORT_##_name] = {			\
+		.name = #_name,					\
+		.bank = _bank,					\
+		.port = _port,					\
+		.pins = _pins,					\
 	}
 
 static const struct tegra_gpio_port tegra186_main_ports[] = {
-	TEGRA186_MAIN_GPIO_PORT( A, 0x2000, 7, 2),
-	TEGRA186_MAIN_GPIO_PORT( B, 0x3000, 7, 3),
-	TEGRA186_MAIN_GPIO_PORT( C, 0x3200, 7, 3),
-	TEGRA186_MAIN_GPIO_PORT( D, 0x3400, 6, 3),
-	TEGRA186_MAIN_GPIO_PORT( E, 0x2200, 8, 2),
-	TEGRA186_MAIN_GPIO_PORT( F, 0x2400, 6, 2),
-	TEGRA186_MAIN_GPIO_PORT( G, 0x4200, 6, 4),
-	TEGRA186_MAIN_GPIO_PORT( H, 0x1000, 7, 1),
-	TEGRA186_MAIN_GPIO_PORT( I, 0x0800, 8, 0),
-	TEGRA186_MAIN_GPIO_PORT( J, 0x5000, 8, 5),
-	TEGRA186_MAIN_GPIO_PORT( K, 0x5200, 1, 5),
-	TEGRA186_MAIN_GPIO_PORT( L, 0x1200, 8, 1),
-	TEGRA186_MAIN_GPIO_PORT( M, 0x5600, 6, 5),
-	TEGRA186_MAIN_GPIO_PORT( N, 0x0000, 7, 0),
-	TEGRA186_MAIN_GPIO_PORT( O, 0x0200, 4, 0),
-	TEGRA186_MAIN_GPIO_PORT( P, 0x4000, 7, 4),
-	TEGRA186_MAIN_GPIO_PORT( Q, 0x0400, 6, 0),
-	TEGRA186_MAIN_GPIO_PORT( R, 0x0a00, 6, 0),
-	TEGRA186_MAIN_GPIO_PORT( T, 0x0600, 4, 0),
-	TEGRA186_MAIN_GPIO_PORT( X, 0x1400, 8, 1),
-	TEGRA186_MAIN_GPIO_PORT( Y, 0x1600, 7, 1),
-	TEGRA186_MAIN_GPIO_PORT(BB, 0x2600, 2, 2),
-	TEGRA186_MAIN_GPIO_PORT(CC, 0x5400, 4, 5),
+	TEGRA186_MAIN_GPIO_PORT( A, 2, 0, 7),
+	TEGRA186_MAIN_GPIO_PORT( B, 3, 0, 7),
+	TEGRA186_MAIN_GPIO_PORT( C, 3, 1, 7),
+	TEGRA186_MAIN_GPIO_PORT( D, 3, 2, 6),
+	TEGRA186_MAIN_GPIO_PORT( E, 2, 1, 8),
+	TEGRA186_MAIN_GPIO_PORT( F, 2, 2, 6),
+	TEGRA186_MAIN_GPIO_PORT( G, 4, 1, 6),
+	TEGRA186_MAIN_GPIO_PORT( H, 1, 0, 7),
+	TEGRA186_MAIN_GPIO_PORT( I, 0, 4, 8),
+	TEGRA186_MAIN_GPIO_PORT( J, 5, 0, 8),
+	TEGRA186_MAIN_GPIO_PORT( K, 5, 1, 1),
+	TEGRA186_MAIN_GPIO_PORT( L, 1, 1, 8),
+	TEGRA186_MAIN_GPIO_PORT( M, 5, 3, 6),
+	TEGRA186_MAIN_GPIO_PORT( N, 0, 0, 7),
+	TEGRA186_MAIN_GPIO_PORT( O, 0, 1, 4),
+	TEGRA186_MAIN_GPIO_PORT( P, 4, 0, 7),
+	TEGRA186_MAIN_GPIO_PORT( Q, 0, 2, 6),
+	TEGRA186_MAIN_GPIO_PORT( R, 0, 5, 6),
+	TEGRA186_MAIN_GPIO_PORT( T, 0, 3, 4),
+	TEGRA186_MAIN_GPIO_PORT( X, 1, 2, 8),
+	TEGRA186_MAIN_GPIO_PORT( Y, 1, 3, 7),
+	TEGRA186_MAIN_GPIO_PORT(BB, 2, 3, 2),
+	TEGRA186_MAIN_GPIO_PORT(CC, 5, 2, 4),
 };
 
 static const struct tegra_gpio_soc tegra186_main_soc = {
@@ -622,23 +627,23 @@ static const struct tegra_gpio_soc tegra186_main_soc = {
 	.instance = 0,
 };
 
-#define TEGRA186_AON_GPIO_PORT(port, base, count, controller)	\
-	[TEGRA186_AON_GPIO_PORT_##port] = {			\
-		.name = #port,					\
-		.offset = base,					\
-		.pins = count,					\
-		.irq = controller,				\
+#define TEGRA186_AON_GPIO_PORT(_name, _bank, _port, _pins)	\
+	[TEGRA186_AON_GPIO_PORT_##_name] = {			\
+		.name = #_name,					\
+		.bank = _bank,					\
+		.port = _port,					\
+		.pins = _pins,					\
 	}
 
 static const struct tegra_gpio_port tegra186_aon_ports[] = {
-	TEGRA186_AON_GPIO_PORT( S, 0x0200, 5, 0),
-	TEGRA186_AON_GPIO_PORT( U, 0x0400, 6, 0),
-	TEGRA186_AON_GPIO_PORT( V, 0x0800, 8, 0),
-	TEGRA186_AON_GPIO_PORT( W, 0x0a00, 8, 0),
-	TEGRA186_AON_GPIO_PORT( Z, 0x0e00, 4, 0),
-	TEGRA186_AON_GPIO_PORT(AA, 0x0c00, 8, 0),
-	TEGRA186_AON_GPIO_PORT(EE, 0x0600, 3, 0),
-	TEGRA186_AON_GPIO_PORT(FF, 0x0000, 5, 0),
+	TEGRA186_AON_GPIO_PORT( S, 0, 1, 5),
+	TEGRA186_AON_GPIO_PORT( U, 0, 2, 6),
+	TEGRA186_AON_GPIO_PORT( V, 0, 4, 8),
+	TEGRA186_AON_GPIO_PORT( W, 0, 5, 8),
+	TEGRA186_AON_GPIO_PORT( Z, 0, 7, 4),
+	TEGRA186_AON_GPIO_PORT(AA, 0, 6, 8),
+	TEGRA186_AON_GPIO_PORT(EE, 0, 3, 3),
+	TEGRA186_AON_GPIO_PORT(FF, 0, 0, 5),
 };
 
 static const struct tegra_gpio_soc tegra186_aon_soc = {
@@ -648,43 +653,43 @@ static const struct tegra_gpio_soc tegra186_aon_soc = {
 	.instance = 1,
 };
 
-#define TEGRA194_MAIN_GPIO_PORT(port, base, count, controller)	\
-	[TEGRA194_MAIN_GPIO_PORT_##port] = {			\
-		.name = #port,					\
-		.offset = base,					\
-		.pins = count,					\
-		.irq = controller,				\
+#define TEGRA194_MAIN_GPIO_PORT(_name, _bank, _port, _pins)	\
+	[TEGRA194_MAIN_GPIO_PORT_##_name] = {			\
+		.name = #_name,					\
+		.bank = _bank,					\
+		.port = _port,					\
+		.pins = _pins,					\
 	}
 
 static const struct tegra_gpio_port tegra194_main_ports[] = {
-	TEGRA194_MAIN_GPIO_PORT( A, 0x1400, 8, 1),
-	TEGRA194_MAIN_GPIO_PORT( B, 0x4e00, 2, 4),
-	TEGRA194_MAIN_GPIO_PORT( C, 0x4600, 8, 4),
-	TEGRA194_MAIN_GPIO_PORT( D, 0x4800, 4, 4),
-	TEGRA194_MAIN_GPIO_PORT( E, 0x4a00, 8, 4),
-	TEGRA194_MAIN_GPIO_PORT( F, 0x4c00, 6, 4),
-	TEGRA194_MAIN_GPIO_PORT( G, 0x4000, 8, 4),
-	TEGRA194_MAIN_GPIO_PORT( H, 0x4200, 8, 4),
-	TEGRA194_MAIN_GPIO_PORT( I, 0x4400, 5, 4),
-	TEGRA194_MAIN_GPIO_PORT( J, 0x5200, 6, 5),
-	TEGRA194_MAIN_GPIO_PORT( K, 0x3000, 8, 3),
-	TEGRA194_MAIN_GPIO_PORT( L, 0x3200, 4, 3),
-	TEGRA194_MAIN_GPIO_PORT( M, 0x2600, 8, 2),
-	TEGRA194_MAIN_GPIO_PORT( N, 0x2800, 3, 2),
-	TEGRA194_MAIN_GPIO_PORT( O, 0x5000, 6, 5),
-	TEGRA194_MAIN_GPIO_PORT( P, 0x2a00, 8, 2),
-	TEGRA194_MAIN_GPIO_PORT( Q, 0x2c00, 8, 2),
-	TEGRA194_MAIN_GPIO_PORT( R, 0x2e00, 6, 2),
-	TEGRA194_MAIN_GPIO_PORT( S, 0x3600, 8, 3),
-	TEGRA194_MAIN_GPIO_PORT( T, 0x3800, 8, 3),
-	TEGRA194_MAIN_GPIO_PORT( U, 0x3a00, 1, 3),
-	TEGRA194_MAIN_GPIO_PORT( V, 0x1000, 8, 1),
-	TEGRA194_MAIN_GPIO_PORT( W, 0x1200, 2, 1),
-	TEGRA194_MAIN_GPIO_PORT( X, 0x2000, 8, 2),
-	TEGRA194_MAIN_GPIO_PORT( Y, 0x2200, 8, 2),
-	TEGRA194_MAIN_GPIO_PORT( Z, 0x2400, 8, 2),
-	TEGRA194_MAIN_GPIO_PORT(FF, 0x3400, 2, 3),
-	TEGRA194_MAIN_GPIO_PORT(GG, 0x0000, 2, 0)
+	TEGRA194_MAIN_GPIO_PORT( A, 1, 2, 8),
+	TEGRA194_MAIN_GPIO_PORT( B, 4, 7, 2),
+	TEGRA194_MAIN_GPIO_PORT( C, 4, 3, 8),
+	TEGRA194_MAIN_GPIO_PORT( D, 4, 4, 4),
+	TEGRA194_MAIN_GPIO_PORT( E, 4, 5, 8),
+	TEGRA194_MAIN_GPIO_PORT( F, 4, 6, 6),
+	TEGRA194_MAIN_GPIO_PORT( G, 4, 0, 8),
+	TEGRA194_MAIN_GPIO_PORT( H, 4, 1, 8),
+	TEGRA194_MAIN_GPIO_PORT( I, 4, 2, 5),
+	TEGRA194_MAIN_GPIO_PORT( J, 5, 1, 6),
+	TEGRA194_MAIN_GPIO_PORT( K, 3, 0, 8),
+	TEGRA194_MAIN_GPIO_PORT( L, 3, 1, 4),
+	TEGRA194_MAIN_GPIO_PORT( M, 2, 3, 8),
+	TEGRA194_MAIN_GPIO_PORT( N, 2, 4, 3),
+	TEGRA194_MAIN_GPIO_PORT( O, 5, 0, 6),
+	TEGRA194_MAIN_GPIO_PORT( P, 2, 5, 8),
+	TEGRA194_MAIN_GPIO_PORT( Q, 2, 6, 8),
+	TEGRA194_MAIN_GPIO_PORT( R, 2, 7, 6),
+	TEGRA194_MAIN_GPIO_PORT( S, 3, 3, 8),
+	TEGRA194_MAIN_GPIO_PORT( T, 3, 4, 8),
+	TEGRA194_MAIN_GPIO_PORT( U, 3, 5, 1),
+	TEGRA194_MAIN_GPIO_PORT( V, 1, 0, 8),
+	TEGRA194_MAIN_GPIO_PORT( W, 1, 1, 2),
+	TEGRA194_MAIN_GPIO_PORT( X, 2, 0, 8),
+	TEGRA194_MAIN_GPIO_PORT( Y, 2, 1, 8),
+	TEGRA194_MAIN_GPIO_PORT( Z, 2, 2, 8),
+	TEGRA194_MAIN_GPIO_PORT(FF, 3, 2, 2),
+	TEGRA194_MAIN_GPIO_PORT(GG, 0, 0, 2)
 };
 
 static const struct tegra_gpio_soc tegra194_main_soc = {
@@ -694,20 +699,20 @@ static const struct tegra_gpio_soc tegra194_main_soc = {
 	.instance = 0,
 };
 
-#define TEGRA194_AON_GPIO_PORT(port, base, count, controller)	\
-	[TEGRA194_AON_GPIO_PORT_##port] = {			\
-		.name = #port,					\
-		.offset = base,					\
-		.pins = count,					\
-		.irq = controller,				\
+#define TEGRA194_AON_GPIO_PORT(_name, _bank, _port, _pins)	\
+	[TEGRA194_AON_GPIO_PORT_##_name] = {			\
+		.name = #_name,					\
+		.bank = _bank,					\
+		.port = _port,					\
+		.pins = _pins,					\
 	}
 
 static const struct tegra_gpio_port tegra194_aon_ports[] = {
-	TEGRA194_AON_GPIO_PORT(AA, 0x0600, 8, 0),
-	TEGRA194_AON_GPIO_PORT(BB, 0x0800, 4, 0),
-	TEGRA194_AON_GPIO_PORT(CC, 0x0200, 8, 0),
-	TEGRA194_AON_GPIO_PORT(DD, 0x0400, 3, 0),
-	TEGRA194_AON_GPIO_PORT(EE, 0x0000, 7, 0)
+	TEGRA194_AON_GPIO_PORT(AA, 0, 3, 8),
+	TEGRA194_AON_GPIO_PORT(BB, 0, 4, 4),
+	TEGRA194_AON_GPIO_PORT(CC, 0, 1, 8),
+	TEGRA194_AON_GPIO_PORT(DD, 0, 2, 3),
+	TEGRA194_AON_GPIO_PORT(EE, 0, 0, 7)
 };
 
 static const struct tegra_gpio_soc tegra194_aon_soc = {
-- 
2.23.0

