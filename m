Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 488EED6105
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2019 13:12:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731261AbfJNLMI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Oct 2019 07:12:08 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:42135 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731821AbfJNLMI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Oct 2019 07:12:08 -0400
Received: by mail-lj1-f194.google.com with SMTP id y23so16172854lje.9
        for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2019 04:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lLAwKxjizePuXeriEk6s9/kmuKqiEm1PHCLwIUVIM74=;
        b=Tr9zIIauf9j6fhMn/KOnEVIsQZhdZ37zsRPpjiSsxZNRf+QtlGRU/24omlNIz9ancV
         /f66nTB4d0aKCWhOOiit93ikxbtPbsLqGRgVsnkWrwwWlBFIOYEUhyoeQwUKnHujLmSi
         0fbAgpQjryL/1mJAV97OHO2XtELragcu+6gwwa8kLDLPzx/VKyl423nTZBtPP+Rxv/nA
         DAm1uAAKQOAtKhiep6fF0wcHRPSh8gTXAgmwAnZGnq/NB96CqnGmcIcokf9utT6NuP/N
         QqaipDmIgh2ZFsROPZ5rrEZRLtP/nU8UAQu1LITZsjoylxEWodqt8jdnVmP4j7O55wUr
         DlNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lLAwKxjizePuXeriEk6s9/kmuKqiEm1PHCLwIUVIM74=;
        b=auCK9deSQC8hjjyNqo0GQ/uoFUjccJCrdWYpMd0bZOggQy48d3RQmRQqt2AluGJVOc
         KOrjNXG284Cs1beciskMy0qx470J54rkzDMwxZglWbzps1iniPa+VNzDAS8PyAyhSv0u
         swobhp24SLGDpjVvujBeaBV5ZuRm9ZCdNNCnBDBmJurvYHvJ1aWVvwURV0sBgNCYBR5P
         kJ7q6R5oMiyhsVVFfxLxfPA3FSIGfXVSymHLxlY/SPKZRwN2eJVgUCsn4jPB6LhhwH/s
         WlHQQxyxhXE2CjqwLOxxRksCAD8dRVEjw2IT4BNeDq3GCcQVeFMjJHa+uHClz5lEZ6yq
         6+8Q==
X-Gm-Message-State: APjAAAXgkjINZbkyis1yMWkp6W12Poq48V22DAG7qBrcZWj1lmzOSt2+
        xl+WPsrFQC/ljYZdZKbW0xDjgLAuWJ8=
X-Google-Smtp-Source: APXvYqyK9El7AfJ3K/iPeukOJiSR/kgw05FwBlHH/twos3zsOA7yJ8eZL3u8wH79WwnVah72foA1Bw==
X-Received: by 2002:a2e:9695:: with SMTP id q21mr18237842lji.105.1571051525713;
        Mon, 14 Oct 2019 04:12:05 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id v1sm4251873lfa.87.2019.10.14.04.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 04:12:04 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 3/3] pinctrl: nomadik: Simplify interrupt handler
Date:   Mon, 14 Oct 2019 13:11:54 +0200
Message-Id: <20191014111154.9731-3-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191014111154.9731-1-linus.walleij@linaro.org>
References: <20191014111154.9731-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The inner interrupt handler was for the latent IRQ handling,
and that will never be used, inline the unnecessary function.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/nomadik/pinctrl-nomadik.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik.c b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
index b7992da8b569..95f864dfdef4 100644
--- a/drivers/pinctrl/nomadik/pinctrl-nomadik.c
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
@@ -799,13 +799,19 @@ static void nmk_gpio_irq_shutdown(struct irq_data *d)
 	clk_disable(nmk_chip->clk);
 }
 
-static void __nmk_gpio_irq_handler(struct irq_desc *desc, u32 status)
+static void nmk_gpio_irq_handler(struct irq_desc *desc)
 {
 	struct irq_chip *host_chip = irq_desc_get_chip(desc);
 	struct gpio_chip *chip = irq_desc_get_handler_data(desc);
+	struct nmk_gpio_chip *nmk_chip = gpiochip_get_data(chip);
+	u32 status;
 
 	chained_irq_enter(host_chip, desc);
 
+	clk_enable(nmk_chip->clk);
+	status = readl(nmk_chip->addr + NMK_GPIO_IS);
+	clk_disable(nmk_chip->clk);
+
 	while (status) {
 		int bit = __ffs(status);
 
@@ -816,19 +822,6 @@ static void __nmk_gpio_irq_handler(struct irq_desc *desc, u32 status)
 	chained_irq_exit(host_chip, desc);
 }
 
-static void nmk_gpio_irq_handler(struct irq_desc *desc)
-{
-	struct gpio_chip *chip = irq_desc_get_handler_data(desc);
-	struct nmk_gpio_chip *nmk_chip = gpiochip_get_data(chip);
-	u32 status;
-
-	clk_enable(nmk_chip->clk);
-	status = readl(nmk_chip->addr + NMK_GPIO_IS);
-	clk_disable(nmk_chip->clk);
-
-	__nmk_gpio_irq_handler(desc, status);
-}
-
 /* I/O Functions */
 
 static int nmk_gpio_get_dir(struct gpio_chip *chip, unsigned offset)
-- 
2.21.0

