Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AD2391F4D
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Aug 2019 10:49:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726186AbfHSItK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Aug 2019 04:49:10 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:37237 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725768AbfHSItK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Aug 2019 04:49:10 -0400
Received: by mail-lj1-f194.google.com with SMTP id t14so986941lji.4
        for <linux-gpio@vger.kernel.org>; Mon, 19 Aug 2019 01:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZsQfLpei7nj2tl+B7srXcwekQFx0RlmqVNmiItyNH/w=;
        b=GbFlVw+nGjx9GyheQhUtckeHf0k12rGScL0ZbVj8CnglKrgF90thar4K8R9Ri57I3T
         D12bKH41Ebb1h7zF5Sy+qSdKvmXeWwuG23n9MfsjvolstLQbTqEMg5BX5DXNmCj2w5BH
         jNFI3si200j5l5bHpWvUUmvgWYCDUDnSvMr810cCu32UprgjGyEwbRgHkvIerDO5KKqq
         j+kLIODm9Dy5VUipnd/7B+tksJ2Z/jjByBUNDsTLZNNJ9rIkqbtNMaiOl5SgptVyugB+
         iR3Tm+L/+c1kEeDPo4Ok5RKfNLvVALR4XC9ZGNEeHgjeFEOstlxF3oC/SKPcM0wDJqXq
         v0ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZsQfLpei7nj2tl+B7srXcwekQFx0RlmqVNmiItyNH/w=;
        b=Ty5Whjc4yI/EbrjPjM75SW0pgqeoR0JWTBt9LvS94OM39Fk/GNvACH3YOPo90b/Z+z
         +AkZjRYQ01470/jm+i9rJ53rDuDR8G271fDtlM1jc7G/4G4mWCT9mPGHY6qMjpM44VD+
         K9stHkDAR++E4jjtSFl9U5vQ35uJ6TKS7Z5wbOS1f5Ugne+V2z3JFDDkSdbTPwxh5D31
         Vc4CCu/xe7f6thqT3GJ88qnNY+NR8YjP538djntkwFuPTA2lXe59KwtpWmrQSHQFRMQS
         uykdpXV/i9Kd9w0H3YQZ97UESUFgHT7909hQgv5vQyAAmsuUc9t/deYdGd8oPzlnvcDX
         7Tsw==
X-Gm-Message-State: APjAAAX1VY2iiCDd2ShZUp0flDrBvX2NjlfHdP9Q2mFzAraH04EkwMWK
        7OYbZmwP/SbhkJUF4aVBEnzIm69kiRs=
X-Google-Smtp-Source: APXvYqxbI9YjMpvm4I9uOnW+7IVx9NT9SkaAyAh2twyqtrZtYaedJKrjQCUbFfo5cYBobIQHqM9KQA==
X-Received: by 2002:a2e:968e:: with SMTP id q14mr11124845lji.195.1566204547858;
        Mon, 19 Aug 2019 01:49:07 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id f6sm2215391lja.16.2019.08.19.01.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2019 01:49:06 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] gpio: Pass mask and size with the init_valid_mask()
Date:   Mon, 19 Aug 2019 10:49:04 +0200
Message-Id: <20190819084904.30027-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

It is more helpful for drivers to have the affected fields
directly available when we use the callback to set up the
valid mask. Change this and switch over the only user
(MSM) to use the passed parameters. If we do this we can
also move the mask out of publicly visible struct fields.

Cc: Stephen Boyd <swboyd@chromium.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c             |  8 +++++---
 drivers/pinctrl/qcom/pinctrl-msm.c | 19 ++++++++++---------
 include/linux/gpio/driver.h        |  4 +++-
 3 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 5277b8f1ff7c..22b87c6e8cd5 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -375,10 +375,12 @@ static int gpiochip_alloc_valid_mask(struct gpio_chip *gc)
 	return 0;
 }
 
-static int gpiochip_init_valid_mask(struct gpio_chip *gpiochip)
+static int gpiochip_init_valid_mask(struct gpio_chip *gc)
 {
-	if (gpiochip->init_valid_mask)
-		return gpiochip->init_valid_mask(gpiochip);
+	if (gc->init_valid_mask)
+		return gc->init_valid_mask(gc,
+					   gc->valid_mask,
+					   gc->ngpio);
 
 	return 0;
 }
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 7f35c196bb3e..a5d8f75da4a7 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -593,24 +593,25 @@ static void msm_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 #define msm_gpio_dbg_show NULL
 #endif
 
-static int msm_gpio_init_valid_mask(struct gpio_chip *chip)
+static int msm_gpio_init_valid_mask(struct gpio_chip *gc,
+				    unsigned long *valid_mask,
+				    unsigned int ngpios)
 {
-	struct msm_pinctrl *pctrl = gpiochip_get_data(chip);
+	struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
 	int ret;
 	unsigned int len, i;
-	unsigned int max_gpios = pctrl->soc->ngpios;
 	const int *reserved = pctrl->soc->reserved_gpios;
 	u16 *tmp;
 
 	/* Driver provided reserved list overrides DT and ACPI */
 	if (reserved) {
-		bitmap_fill(chip->valid_mask, max_gpios);
+		bitmap_fill(valid_mask, ngpios);
 		for (i = 0; reserved[i] >= 0; i++) {
-			if (i >= max_gpios || reserved[i] >= max_gpios) {
+			if (i >= ngpios || reserved[i] >= ngpios) {
 				dev_err(pctrl->dev, "invalid list of reserved GPIOs\n");
 				return -EINVAL;
 			}
-			clear_bit(reserved[i], chip->valid_mask);
+			clear_bit(reserved[i], valid_mask);
 		}
 
 		return 0;
@@ -622,7 +623,7 @@ static int msm_gpio_init_valid_mask(struct gpio_chip *chip)
 	if (ret < 0)
 		return 0;
 
-	if (ret > max_gpios)
+	if (ret > ngpios)
 		return -EINVAL;
 
 	tmp = kmalloc_array(len, sizeof(*tmp), GFP_KERNEL);
@@ -635,9 +636,9 @@ static int msm_gpio_init_valid_mask(struct gpio_chip *chip)
 		goto out;
 	}
 
-	bitmap_zero(chip->valid_mask, max_gpios);
+	bitmap_zero(valid_mask, ngpios);
 	for (i = 0; i < len; i++)
-		set_bit(tmp[i], chip->valid_mask);
+		set_bit(tmp[i], valid_mask);
 
 out:
 	kfree(tmp);
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 72d48a2bab65..dc03323897ef 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -363,7 +363,9 @@ struct gpio_chip {
 	void			(*dbg_show)(struct seq_file *s,
 						struct gpio_chip *chip);
 
-	int			(*init_valid_mask)(struct gpio_chip *chip);
+	int			(*init_valid_mask)(struct gpio_chip *chip,
+						   unsigned long *valid_mask,
+						   unsigned int ngpios);
 
 	int			base;
 	u16			ngpio;
-- 
2.21.0

