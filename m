Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB4F82EF09A
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jan 2021 11:23:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727217AbhAHKVy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jan 2021 05:21:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727406AbhAHKVx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jan 2021 05:21:53 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E98FDC0612FE
        for <linux-gpio@vger.kernel.org>; Fri,  8 Jan 2021 02:20:31 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by albert.telenet-ops.be with bizsmtp
        id EALU2400H4C55Sk06ALUtb; Fri, 08 Jan 2021 11:20:29 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kxose-001zdm-4B; Fri, 08 Jan 2021 11:20:28 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kxosd-008Ufu-FB; Fri, 08 Jan 2021 11:20:27 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v3 3/3] gpio: rcar: Add R-Car V3U (R8A779A0) support
Date:   Fri,  8 Jan 2021 11:20:26 +0100
Message-Id: <20210108102026.2024478-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210108102026.2024478-1-geert+renesas@glider.be>
References: <20210108102026.2024478-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for the GPIO controller block in the R-Car V3U (R8A779A0)
SoC, which is very similar to the block found on other R-Car Gen3 SoCs.
However, this block has a new General Input Enable Register (INEN),
whose reset state is to have all inputs disabled.

Enable input for all available pins in probe and resume, to support the
use of the General Input Register (INDT) for reading pin state at all
times.  This preserves backwards compatibility with other R-Car Gen3
SoCs, as recommended by the Hardware Manual.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v3:
  - Add Reviewed-by, Tested-by,
  - Fix SoC part number in oneline summary,
  - Rebase on top of commit 3a57026a83ba363e ("gpio: rcar: Remove
    redundant compatible values"),

v2:
  - Enable input unconditionally in probe and resume, instead of during
    GPIO line configuration and depending on GPIO line direction,
  - Assumed authorship, as this patch is very different from v1, written
    by Phong Hoang.
---
 drivers/gpio/gpio-rcar.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index edded6478792f7b8..e7092d5fe700d2ce 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -36,6 +36,7 @@ struct gpio_rcar_info {
 	bool has_outdtsel;
 	bool has_both_edge_trigger;
 	bool has_always_in;
+	bool has_inen;
 };
 
 struct gpio_rcar_priv {
@@ -63,6 +64,7 @@ struct gpio_rcar_priv {
 #define FILONOFF	0x28	/* Chattering Prevention On/Off Register */
 #define OUTDTSEL	0x40	/* Output Data Select Register */
 #define BOTHEDGE	0x4c	/* One Edge/Both Edge Select Register */
+#define INEN		0x50	/* General Input Enable Register */
 
 #define RCAR_MAX_GPIO_PER_BANK		32
 
@@ -392,22 +394,35 @@ static const struct gpio_rcar_info gpio_rcar_info_gen1 = {
 	.has_outdtsel = false,
 	.has_both_edge_trigger = false,
 	.has_always_in = false,
+	.has_inen = false,
 };
 
 static const struct gpio_rcar_info gpio_rcar_info_gen2 = {
 	.has_outdtsel = true,
 	.has_both_edge_trigger = true,
 	.has_always_in = false,
+	.has_inen = false,
 };
 
 static const struct gpio_rcar_info gpio_rcar_info_gen3 = {
 	.has_outdtsel = true,
 	.has_both_edge_trigger = true,
 	.has_always_in = true,
+	.has_inen = false,
+};
+
+static const struct gpio_rcar_info gpio_rcar_info_v3u = {
+	.has_outdtsel = true,
+	.has_both_edge_trigger = true,
+	.has_always_in = true,
+	.has_inen = true,
 };
 
 static const struct of_device_id gpio_rcar_of_table[] = {
 	{
+		.compatible = "renesas,gpio-r8a779a0",
+		.data = &gpio_rcar_info_v3u,
+	}, {
 		.compatible = "renesas,rcar-gen1-gpio",
 		.data = &gpio_rcar_info_gen1,
 	}, {
@@ -448,6 +463,17 @@ static int gpio_rcar_parse_dt(struct gpio_rcar_priv *p, unsigned int *npins)
 	return 0;
 }
 
+static void gpio_rcar_enable_inputs(struct gpio_rcar_priv *p)
+{
+	u32 mask = GENMASK(p->gpio_chip.ngpio - 1, 0);
+
+	/* Select "Input Enable" in INEN */
+	if (p->gpio_chip.valid_mask)
+		mask &= p->gpio_chip.valid_mask[0];
+	if (mask)
+		gpio_rcar_write(p, INEN, gpio_rcar_read(p, INEN) | mask);
+}
+
 static int gpio_rcar_probe(struct platform_device *pdev)
 {
 	struct gpio_rcar_priv *p;
@@ -537,6 +563,12 @@ static int gpio_rcar_probe(struct platform_device *pdev)
 		goto err1;
 	}
 
+	if (p->info.has_inen) {
+		pm_runtime_get_sync(p->dev);
+		gpio_rcar_enable_inputs(p);
+		pm_runtime_put(p->dev);
+	}
+
 	dev_info(dev, "driving %d GPIOs\n", npins);
 
 	return 0;
@@ -612,6 +644,9 @@ static int gpio_rcar_resume(struct device *dev)
 		}
 	}
 
+	if (p->info.has_inen)
+		gpio_rcar_enable_inputs(p);
+
 	return 0;
 }
 #endif /* CONFIG_PM_SLEEP*/
-- 
2.25.1

