Return-Path: <linux-gpio+bounces-739-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2677FE343
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 23:37:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB3AB2822E1
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 22:37:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA54F47A55;
	Wed, 29 Nov 2023 22:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XhemESQ6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E53BC4
	for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2023 14:37:47 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2c9c5d30b32so4139511fa.2
        for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2023 14:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701297465; x=1701902265; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bxjDHRvqNf8As8nbmBC+EVTyuwWGJO53SVyTTlAXxs4=;
        b=XhemESQ6L4viGgH9/2ksBl2n+XF3of44KapZZz2ZdR0xEd/n4g2SsRF/bxiKpy0162
         p/1JMQXc9WKpHZ4ff6bnxHl63cBB0vK59pMc4ZL+VMcXajdNRWiPBo8UBYoAol3zcKyE
         7zzJhRuHec3XurvJI66QhsNg++4qGW9Szviw8/+gcCZwbE5D2sLfelo0GqS2py4A1dhZ
         MDae8xZU/7iVVZP2xoDsPlw5/UidY8cjxWC8nQhxX0XXvjdd21C8zui4TTzQJGnvgGti
         nsdzESfQpvGf31QxCZh0/T7glGTMbwK/cXkiNZrGlx8NfEgZtxJc4lr6aw2gS+h+YuHp
         8SkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701297465; x=1701902265;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bxjDHRvqNf8As8nbmBC+EVTyuwWGJO53SVyTTlAXxs4=;
        b=Gp7opiE9k7dOajcfi1IIFLBzoVi2937KeZQvVT6Jp0tCOS0BHSU6LF9XMHUxjlIXH2
         f8MeAyu9YlcnmXX6fzHy2yzStwPuYCJNlx7HFDOBFUbmk4AIFVdRT5Y1vfoi5+ymlwM8
         cwnD46zacdImjgWSXHXjhb9e/w2BLvmnuS8gcjjf6s6MdT8ToH0yjRq7ytRImrZLPWQ3
         iUyT9xYttAxzHgHuEcvPrzIrZP8vAutvf1P/niBJ5C0a+t7JNglZHRokYvaPuQ4QHbDF
         TYsraovNXe9wT6sUYm1/vRs78mS7nAoY6BuxZ2VeYxgYHmgBqmh+3z+W8u5p6Exo19kN
         27sg==
X-Gm-Message-State: AOJu0Ywb4MTpjNOTAwUpWjf45CA0Jou2wv8YxZ6Odu+Nr3sqWXyuY4g7
	QzyANnt53heJOR4IVuFmkKs3JQ==
X-Google-Smtp-Source: AGHT+IGqOHMpkJNi3MHQWntyW7OBj8quotaGsS43d+srALwTxtmGgH9ibFvTtPCcGtW9LJXOIuEtQQ==
X-Received: by 2002:a2e:b003:0:b0:2c9:bc45:3206 with SMTP id y3-20020a2eb003000000b002c9bc453206mr3360214ljk.43.1701297465599;
        Wed, 29 Nov 2023 14:37:45 -0800 (PST)
Received: from [192.168.1.2] (c-21d3225c.014-348-6c756e10.bbcust.telenor.se. [92.34.211.33])
        by smtp.gmail.com with ESMTPSA id s16-20020a2eb8d0000000b002c02cf6cac5sm2092680ljp.83.2023.11.29.14.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 14:37:45 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Nov 2023 23:37:41 +0100
Subject: [PATCH v4] gpio: ixp4xx: Handle clock output on pin 14 and 15
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231129-ixp4xx-gpio-clocks-v4-1-345f79058c6b@linaro.org>
X-B4-Tracking: v=1; b=H4sIADS9Z2UC/33Nyw6CMBCF4VcxXVvTTsulrnwP44LLFCYSSlpDM
 IR3t7DCSFz+J5lvZhbQEwZ2Pc3M40iBXB9Dn0+saou+QU51bAYClDAgOU2DnibeDOR41bnqGXi
 GOUBurC5LxeLh4NHStKH3R+yWwsv59/ZjlOv6lxslFzzJtNFQWqN1ceuoL7y7ON+w1Rthb8ChA
 dEQIBNEKUyW1j+G2hvq0FDRSFObW9SYWZl8GcuyfACMCopwPQEAAA==
To: Linus Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>, 
 Krzysztof Halasa <khalasa@piap.pl>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4

This makes it possible to provide basic clock output on pins
14 and 15. The clocks are typically used by random electronics,
not modeled in the device tree, so they just need to be provided
on request.

In order to not disturb old systems that require that the
hardware defaults are kept in the clock setting bits, we only
manipulate these if either device tree property is present.
Once we know a device needs one of the clocks we can set it
in the device tree.

Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
The GPIO block on the very legacy IXP4xx GPIO can provide
a generated clock output on GPIO 14 and GPIO 15. This
provides a straight-forward solution with a flag for each
clock output.

More complicated solutions are thinkable, but I deemed them
overdesigned for this legacy SoC.
---
Changes in v4:
- Drop the merged bindings patch from the series.
- Fix a small optimization suggested by andy.
- Do not |= zeroes on registers, just put in a comment.
- Link to v3: https://lore.kernel.org/r/20230923-ixp4xx-gpio-clocks-v3-0-66f8fe4e7f15@linaro.org

Changes in v3:
- Make sure to only manipulate the clock bits if one of the clock
  DT properties is set. Devices we can't test may rely on HW defaults being
  preserved in the clock bits.
- Link to v2: https://lore.kernel.org/r/20230922-ixp4xx-gpio-clocks-v2-0-0215ee10976d@linaro.org

Changes in v2:
- Fixed formatting pipe | in bindings
- Fixed som blank lines in bindings
- When we will just blank out the clock register settings,
  don't spend time reading the initial value.
- Link to v1: https://lore.kernel.org/r/20230921-ixp4xx-gpio-clocks-v1-0-574942bf944a@linaro.org
---
 drivers/gpio/gpio-ixp4xx.c | 51 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 50 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-ixp4xx.c b/drivers/gpio/gpio-ixp4xx.c
index dde6cf3a5779..c5a9fa640566 100644
--- a/drivers/gpio/gpio-ixp4xx.c
+++ b/drivers/gpio/gpio-ixp4xx.c
@@ -38,6 +38,18 @@
 #define IXP4XX_GPIO_STYLE_MASK		GENMASK(2, 0)
 #define IXP4XX_GPIO_STYLE_SIZE		3
 
+/*
+ * Clock output control register defines.
+ */
+#define IXP4XX_GPCLK_CLK0DC_SHIFT	0
+#define IXP4XX_GPCLK_CLK0TC_SHIFT	4
+#define IXP4XX_GPCLK_CLK0_MASK		GENMASK(7, 0)
+#define IXP4XX_GPCLK_MUX14		BIT(8)
+#define IXP4XX_GPCLK_CLK1DC_SHIFT	16
+#define IXP4XX_GPCLK_CLK1TC_SHIFT	20
+#define IXP4XX_GPCLK_CLK1_MASK		GENMASK(23, 16)
+#define IXP4XX_GPCLK_MUX15		BIT(24)
+
 /**
  * struct ixp4xx_gpio - IXP4 GPIO state container
  * @dev: containing device for this instance
@@ -202,6 +214,8 @@ static int ixp4xx_gpio_probe(struct platform_device *pdev)
 	struct ixp4xx_gpio *g;
 	struct gpio_irq_chip *girq;
 	struct device_node *irq_parent;
+	bool clk_14, clk_15;
+	u32 val;
 	int ret;
 
 	g = devm_kzalloc(dev, sizeof(*g), GFP_KERNEL);
@@ -225,13 +239,48 @@ static int ixp4xx_gpio_probe(struct platform_device *pdev)
 	}
 	g->fwnode = of_node_to_fwnode(np);
 
+	/*
+	 * If either clock output is enabled explicitly in the device tree
+	 * we take full control of the clock by masking off all bits for
+	 * the clock control and selectively enabling them. Otherwise
+	 * we leave the hardware default settings.
+	 *
+	 * Enable clock outputs with default timings of requested clock.
+	 * If you need control over TC and DC, add these to the device
+	 * tree bindings and use them here.
+	 */
+	clk_14 = of_property_read_bool(np, "intel,ixp4xx-gpio14-clkout");
+	clk_15 = of_property_read_bool(np, "intel,ixp4xx-gpio15-clkout");
+
 	/*
 	 * Make sure GPIO 14 and 15 are NOT used as clocks but GPIO on
 	 * specific machines.
 	 */
 	if (of_machine_is_compatible("dlink,dsm-g600-a") ||
 	    of_machine_is_compatible("iom,nas-100d"))
-		__raw_writel(0x0, g->base + IXP4XX_REG_GPCLK);
+		val = 0;
+	else {
+		val = __raw_readl(g->base + IXP4XX_REG_GPCLK);
+
+		if (clk_14 || clk_15) {
+			val &= ~(IXP4XX_GPCLK_MUX14 | IXP4XX_GPCLK_MUX15);
+			val &= ~IXP4XX_GPCLK_CLK0_MASK;
+			val &= ~IXP4XX_GPCLK_CLK1_MASK;
+			if (clk_14) {
+				/* IXP4XX_GPCLK_CLK0DC implicit low */
+				val |= (1 << IXP4XX_GPCLK_CLK0TC_SHIFT);
+				val |= IXP4XX_GPCLK_MUX14;
+			}
+
+			if (clk_15) {
+				/* IXP4XX_GPCLK_CLK1DC implicit low */
+				val |= (1 << IXP4XX_GPCLK_CLK1TC_SHIFT);
+				val |= IXP4XX_GPCLK_MUX15;
+			}
+		}
+	}
+
+	__raw_writel(val, g->base + IXP4XX_REG_GPCLK);
 
 	/*
 	 * This is a very special big-endian ARM issue: when the IXP4xx is

---
base-commit: b85ea95d086471afb4ad062012a4d73cd328fa86
change-id: 20230921-ixp4xx-gpio-clocks-7e82289f4bb3

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


