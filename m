Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B256F2A8D44
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Nov 2020 03:58:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725852AbgKFC6y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 21:58:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbgKFC6y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2020 21:58:54 -0500
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E5A3C0613CF
        for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2020 18:58:54 -0800 (PST)
Received: by mail-pl1-x642.google.com with SMTP id p4so3634plr.1
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2020 18:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j/IwG69As01vkurELrZjlxWULg4rCN71pSp13igOTSw=;
        b=T52XGD4jcHFlhP+uETcaw0rLP1WvsLZjzmde/uvRYkqmrtH3+csM7TI0/Rc41bCfZk
         meaef3wIrDALcLoMbLyoDDRoHcpOnCEqCBtbzewQw/BEJ0uKOOSmOGm4gfHQhT+Z8UgM
         C5O6MjYFqkO0ce3BrmsaeiMcDlozTpp+O88gqTdt9VuUlcJe5v5XvcmiaTmtzw8/Szii
         XfVIjf0M4P6+pc6Q8hi1GzixCmx/4tqYEUVyyQGwt+2FH93WEJo8wPhDpF0HaXTS/lvi
         V8NJlAxSwzWMmDCdIi/BdqMsSCXBw0q/L8jiIyP/a9LU31muy94+r4Wftca/gCHuZoNr
         aEmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j/IwG69As01vkurELrZjlxWULg4rCN71pSp13igOTSw=;
        b=sqOU8RTnf6BlFjLnC0/zo7PYCekKF7cxnNvleQvOgUs5NO9doirML2b6lw6B2EukFW
         gE2ymr8vQfslrakNiK4pBJTJ7viZ0mQ4jv58ii1LhHitKovNshD6YLO+uGffTvgZ/LWF
         XgA2F6Wk9ooYXgpCIvJGlm9tuKi5IT2G9H0tLsTKUo5aL9glWaNVhXtQPEWQFrJ7unP2
         g1ncm5+gf/dnFPg8EbxiDQa5pqlexWB7CxEBtgm2eQX1DWSVfH/rfifu6bNY6aCZhi+G
         emnkQmsdnLi0UyipvgYr6lE+lEXpYZ9whamFodEpyDP7b9RZ1mFBqscbSgKfpNRY8jao
         HPCg==
X-Gm-Message-State: AOAM53164nmy4S+lJMToWlGQLRhKo+4vL0ByHgOR4+Wme06HlmBiiPOu
        qGcQSWctIbet3PWi6/W8Q2VGRg==
X-Google-Smtp-Source: ABdhPJyoYAkt/8qlfuBZLghCFj4//jXpw3xyNocSLEbNZeaxlBGfZhaYfNSnJsqDrZIyrPaxxlWHIQ==
X-Received: by 2002:a17:902:b203:b029:d2:1fde:d452 with SMTP id t3-20020a170902b203b02900d21fded452mr5110470plr.36.1604631534085;
        Thu, 05 Nov 2020 18:58:54 -0800 (PST)
Received: from hsinchu02.internal.sifive.com (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
        by smtp.gmail.com with ESMTPSA id c11sm3822572pgl.20.2020.11.05.18.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 18:58:53 -0800 (PST)
From:   Greentime Hu <greentime.hu@sifive.com>
To:     greentime.hu@sifive.com, linux-kernel@vger.kernel.org,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
        palmer@dabbelt.com, paul.walmsley@sifive.com
Cc:     Yash Shah <yash.shah@sifive.com>
Subject: [RFC PATCH 1/1] gpio: sifive: To get gpio irq offset from device tree data
Date:   Fri,  6 Nov 2020 10:58:49 +0800
Message-Id: <802c8865b70c3bdf70e44d37f14e7767b6495e88.1604631371.git.greentime.hu@sifive.com>
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
Reviewed-by: Yash Shah <yash.shah@sifive.com>
---
 drivers/gpio/gpio-sifive.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
index c54dd08f2cbf..e8cd8741dbae 100644
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
+	*parent = d->hwirq;
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
+		chip->irq_number[i] = irq_of_parse_and_map(node, i);
+
 	ret = bgpio_init(&chip->gc, dev, 4,
 			 chip->base + SIFIVE_GPIO_INPUT_VAL,
 			 chip->base + SIFIVE_GPIO_OUTPUT_VAL,
-- 
2.29.2

