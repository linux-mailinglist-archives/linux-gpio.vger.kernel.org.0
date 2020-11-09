Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA83E2AB1F2
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Nov 2020 08:57:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728951AbgKIH5L (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Nov 2020 02:57:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728904AbgKIH5L (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Nov 2020 02:57:11 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D305C0613D3
        for <linux-gpio@vger.kernel.org>; Sun,  8 Nov 2020 23:57:11 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id x13so7331149pfa.9
        for <linux-gpio@vger.kernel.org>; Sun, 08 Nov 2020 23:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JARJXkPhEWiu33v+1+8vkMu7S2fskALhXSmZ9yD+t4Q=;
        b=NAR6Lz7KspbsdLjr2mz5CiAQvEj/XR53nA53DrfaXq/8K0YC6ElWYDZMNOSTmQhKMa
         ujwxCsBuW4gZ1VJDt8So8X50nUD6IKGvMik9lDTrScFdRe8EtCTMmehfnCcMVMpZq/63
         HM/6oZfkNEV6bBbgtsKiDfln4ISKgl75q8r+0Ct8mP4INNnKRra+KFysabiYNJKpnWpS
         7LpB77esSljYXinMtXI9HzNChW+Gu5jIA6m2qOq9ZC3f6W0FtiOMPCXs0fhZLKXMfML8
         eQQTDqyjNlSFW+RmfaEvgO68HdN5oEnYkKrSSouuMYX2LwDgVhNpyMASPTIQzEX00+cn
         njbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JARJXkPhEWiu33v+1+8vkMu7S2fskALhXSmZ9yD+t4Q=;
        b=SaDu8ukKLGKry/GuETSF7OMqEXCpRd8lldsXo91BkE+Nf7ADipeNOxnqN1TbIMvxD3
         3+eMZKUvO9SuCjVhmLpYnfr/XSJsVqUMrasMfDfv46xLg6iuCuUPBXipvbZ2IBNijsjD
         Q4U2mB8FKltOk9elu597O95T5HnL6DwN9WIPeXFsqHC10djDOVSsCNQzQLp7d+vFPRil
         9N+HTCMmyJUcVeUmhXUQ9uYSSec/kvQpJ2+xddUuvEbvzStBBPRRwkg3hoU9dT7hjG3F
         PAQ3UJGolzhje8leiOsXi9rGhIkVeHT7en7Bc2/5h/e6a7O9zoGFGKcwgGaGFjNmxHkN
         9Lug==
X-Gm-Message-State: AOAM533Vjamp0ksCo8gizm51E8GRYe7gOLfz18oB/yyqt5tm3LuFLQ9c
        vEqll6dHrRpAa1XUvT0cAbUS1g==
X-Google-Smtp-Source: ABdhPJws5nG0ASg3JRadKHXCeozCXgSCoG2pnJp2fXYELbGioewsCzstSatDc/0St7K0W/r0YcYA5w==
X-Received: by 2002:aa7:9308:0:b029:18b:3a1b:f46a with SMTP id 8-20020aa793080000b029018b3a1bf46amr12783803pfj.64.1604908630838;
        Sun, 08 Nov 2020 23:57:10 -0800 (PST)
Received: from hsinchu02.internal.sifive.com (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
        by smtp.gmail.com with ESMTPSA id a184sm10117433pfa.86.2020.11.08.23.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2020 23:57:10 -0800 (PST)
From:   Greentime Hu <greentime.hu@sifive.com>
To:     greentime.hu@sifive.com, linux-kernel@vger.kernel.org,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
        palmer@dabbelt.com, paul.walmsley@sifive.com,
        andy.shevchenko@gmail.com, yash.shah@sifive.com
Subject: [PATCH] gpio: sifive: To get gpio irq offset from device tree data
Date:   Mon,  9 Nov 2020 15:57:02 +0800
Message-Id: <20201109075702.21370-1-greentime.hu@sifive.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We can get hwirq number of the gpio by its irq_data->hwirq so that we don't
need to add more macros for different platforms. This patch is tested in
SiFive Unleashed board and SiFive Unmatched board.

Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
---
 drivers/gpio/gpio-sifive.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
index c54dd08f2cbf..bfb915bf5d78 100644
--- a/drivers/gpio/gpio-sifive.c
+++ b/drivers/gpio/gpio-sifive.c
@@ -29,7 +29,6 @@
 #define SIFIVE_GPIO_OUTPUT_XOR	0x40
 
 #define SIFIVE_GPIO_MAX		32
-#define SIFIVE_GPIO_IRQ_OFFSET	7
 
 struct sifive_gpio {
 	void __iomem		*base;
@@ -37,7 +36,7 @@ struct sifive_gpio {
 	struct regmap		*regs;
 	unsigned long		irq_state;
 	unsigned int		trigger[SIFIVE_GPIO_MAX];
-	unsigned int		irq_parent[SIFIVE_GPIO_MAX];
+	unsigned int		irq_number[SIFIVE_GPIO_MAX];
 };
 
 static void sifive_gpio_set_ie(struct sifive_gpio *chip, unsigned int offset)
@@ -144,8 +143,10 @@ static int sifive_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
 					     unsigned int *parent,
 					     unsigned int *parent_type)
 {
+	struct sifive_gpio *chip = gpiochip_get_data(gc);
+	struct irq_data *d = irq_get_irq_data(chip->irq_number[child]);
+	*parent = irqd_to_hwirq(d);
 	*parent_type = IRQ_TYPE_NONE;
-	*parent = child + SIFIVE_GPIO_IRQ_OFFSET;
 	return 0;
 }
 
@@ -165,7 +166,7 @@ static int sifive_gpio_probe(struct platform_device *pdev)
 	struct irq_domain *parent;
 	struct gpio_irq_chip *girq;
 	struct sifive_gpio *chip;
-	int ret, ngpio;
+	int ret, ngpio, i;
 
 	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
 	if (!chip)
@@ -200,6 +201,9 @@ static int sifive_gpio_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	for (i = 0; i < ngpio; i++)
+		chip->irq_number[i] = platform_get_irq(pdev, i);
+
 	ret = bgpio_init(&chip->gc, dev, 4,
 			 chip->base + SIFIVE_GPIO_INPUT_VAL,
 			 chip->base + SIFIVE_GPIO_OUTPUT_VAL,
-- 
2.29.2

