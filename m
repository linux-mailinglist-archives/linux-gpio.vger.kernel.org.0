Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A85C87AC36D
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Sep 2023 18:02:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231284AbjIWQCm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 23 Sep 2023 12:02:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230257AbjIWQCl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 23 Sep 2023 12:02:41 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12ADA1A6
        for <linux-gpio@vger.kernel.org>; Sat, 23 Sep 2023 09:02:35 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2c147b96af8so24567541fa.0
        for <linux-gpio@vger.kernel.org>; Sat, 23 Sep 2023 09:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695484953; x=1696089753; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qT4V244MIYb7HC5hpsM98rjOj8T0H65YgdniWFrcK+Y=;
        b=GQMEX6Mb28TzLNs/mriGVQDv/8QUlo2bFvUKzUzjGueF0eZOpYR4S3ANmBjiXE/ikg
         v75o4L5BHTAsZwF5XwuBQHHIDy9iV6HY9Q+8pGVcuvWB86XJzVEmnjJWAQpV2cxodywi
         wDRJbtc9Wi4EppCXJst5qdpqhoHJ5dj0wlKqgI1iScDMqIsfKcToMrHwcQdC9zj+EJaE
         gY2OupKl9xP9qMO9DtCOcGk2BPd4Fsb5ZkooShba+RKYAlVcvUzxhr2S2wmGaYkmuVS0
         KTT3aTR52Nn+81z8Zf2UWzWIgIDK44lb9mYrNCGUk53HzDJmQmdqbea26JMuo7ocEhqz
         s4MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695484953; x=1696089753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qT4V244MIYb7HC5hpsM98rjOj8T0H65YgdniWFrcK+Y=;
        b=mmfFiZuTMWcODvVR1znu404guy7UqcGrmIe63bQ0g+yOLYVrmEhu/u4XmMmMO8um2B
         cbRiGmCyhGKGuDyp2CFkspcxNGN7bymYd+rqSzY00kEAghIJ9HnVnuPMqNpcWD6GcuGK
         TD0CEIUq++NdpClNTFlI5bnFBtxAmkdhvnzCe7yXRF1A72hzpt6geTJoiGbHsrOc7lHU
         Kkq1EvIFnZ+p3nOsdPcEdJ8BL/P3GYovj2ZOZad+5X0gx6Uv7G0/gv1Ot6mwfPJXjRkw
         hk8Iuv/12yzDMhfLUTgGOsW3QBCP9hFEVU9mwYxnqA7JuZzCbnfDmBvnElPVCmgz2zK2
         2w4A==
X-Gm-Message-State: AOJu0YxYYyLvU8kap0FdjPh8aEo5FhyHhtVa0J/2aMQunqLu+if0LbYz
        u6h3+OwfJYH1mE6MKBLYeRMm8Q==
X-Google-Smtp-Source: AGHT+IEKURJkGJhP0mJeakLX/wl7+J+oe8KSwlc2/02jmyzxZIWMc+9FCake5IJFQu/VzWEJmuYBCQ==
X-Received: by 2002:a05:6512:251e:b0:502:a588:6609 with SMTP id be30-20020a056512251e00b00502a5886609mr2212028lfb.3.1695484953360;
        Sat, 23 Sep 2023 09:02:33 -0700 (PDT)
Received: from [192.168.1.2] (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id v30-20020a056512049e00b004fdde1db756sm1132835lfq.26.2023.09.23.09.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Sep 2023 09:02:32 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 23 Sep 2023 18:02:29 +0200
Subject: [PATCH v3 2/2] gpio: ixp4xx: Handle clock output on pin 14 and 15
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230923-ixp4xx-gpio-clocks-v3-2-66f8fe4e7f15@linaro.org>
References: <20230923-ixp4xx-gpio-clocks-v3-0-66f8fe4e7f15@linaro.org>
In-Reply-To: <20230923-ixp4xx-gpio-clocks-v3-0-66f8fe4e7f15@linaro.org>
To:     Linus Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>,
        Krzysztof Halasa <khalasa@piap.pl>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This makes it possible to provide basic clock output on pins
14 and 15. The clocks are typically used by random electronics,
not modeled in the device tree, so they just need to be provided
on request.

In order to not disturb old systems that require that the
hardware defaults are kept in the clock setting bits, we only
manipulate these if either device tree property is present.
Once we know a device needs one of the clocks we can set it
in the device tree.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-ixp4xx.c | 49 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-ixp4xx.c b/drivers/gpio/gpio-ixp4xx.c
index dde6cf3a5779..1ca3217d0aab 100644
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
@@ -231,7 +245,40 @@ static int ixp4xx_gpio_probe(struct platform_device *pdev)
 	 */
 	if (of_machine_is_compatible("dlink,dsm-g600-a") ||
 	    of_machine_is_compatible("iom,nas-100d"))
-		__raw_writel(0x0, g->base + IXP4XX_REG_GPCLK);
+		val = 0;
+	else
+		val = __raw_readl(g->base + IXP4XX_REG_GPCLK);
+
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
+	if (clk_14 || clk_15) {
+		val &= ~(IXP4XX_GPCLK_MUX14 | IXP4XX_GPCLK_MUX15);
+		val &= ~IXP4XX_GPCLK_CLK0_MASK;
+		val &= ~IXP4XX_GPCLK_CLK1_MASK;
+		if (clk_14) {
+			val |= (0 << IXP4XX_GPCLK_CLK0DC_SHIFT);
+			val |= (1 << IXP4XX_GPCLK_CLK0TC_SHIFT);
+			val |= IXP4XX_GPCLK_MUX14;
+		}
+
+		if (clk_15) {
+			val |= (0 << IXP4XX_GPCLK_CLK1DC_SHIFT);
+			val |= (1 << IXP4XX_GPCLK_CLK1TC_SHIFT);
+			val |= IXP4XX_GPCLK_MUX15;
+		}
+	}
+
+	__raw_writel(val, g->base + IXP4XX_REG_GPCLK);
 
 	/*
 	 * This is a very special big-endian ARM issue: when the IXP4xx is

-- 
2.41.0

