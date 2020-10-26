Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 910ED298F03
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Oct 2020 15:19:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1781124AbgJZOTP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Oct 2020 10:19:15 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:50798 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1780407AbgJZOS5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Oct 2020 10:18:57 -0400
Received: by mail-wm1-f68.google.com with SMTP id 13so11828178wmf.0
        for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2020 07:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RuTd7negUPwt02PaCp84ssE86B/HsHi/fvXD5DdCdJU=;
        b=h8/G2ZyhvG4vPt6d8ZHwOCF/Xvfp5flUZnJqOJc0zjvEspgK/2URFa/9EXiLmm50Qi
         GrHvrb8AnNhCCERqieLeA/YU4sWFDLJ7NbeZ3D9fpl+oQQ7i+Rh9joe6aHo96Z3YZhG7
         AORx9IyC5PWYNF4RiZMgvJaFJ58DWiHz1NpoKv+Eh5Jm409SeZ869wNmMN+bpg8sLjMS
         tQ7B0CKj0OwVSUVaUW5rNcMZ0VmW3lUJO/69Xq+b+ru3LkITTCLJJmgVrPjLqXoVD1X5
         DOpS8j6orKc7AOPLzI4bYbF08nSAv+1nEWsOuZJmPVO7sdfHV7UGU+celwVXXlU5dzFv
         TGuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RuTd7negUPwt02PaCp84ssE86B/HsHi/fvXD5DdCdJU=;
        b=c2RxUGSCnHDoavBagE7oU32Dc0YDS5Dxn/n8mGPT2EdR832XxWrdojWDOFATCBDxqR
         cGDHb5su4M/mxm04dv3DCUQA4RNpD+82Dk71y9K7/CYB2Ur7JCByavsmv1ivSYguMSU8
         AuxIQ7mWbJIovOB+gympIvWNPpgcQaXC2WdfZOWS7+gqIBUsTdV7RxDiZenAq5p0PKNg
         uuD5nJzAJOChZvP2qsI6PEVkDlJDDF708ZUBut9qFEx9eNIHUiRjBA+AbEMcEdg6fAGr
         XMmyPNan6Vsqq77cx6j17ZKsUsqxvGCtJJEF3RowWI6/woCtoyyXf2rLPAHqbmmsofgb
         zHNA==
X-Gm-Message-State: AOAM530mtNVI5vIzatC66ZTEMLLQoGcMAAoGnzByITqsPRmcbJqyJv4a
        izLHOR8sSlYu0UCrQZuEl1ReSA==
X-Google-Smtp-Source: ABdhPJzcQZ4fk+J0C+WYbeCl5k8Vg4zRN+xiEyHm6nOKeGFqvOoXFwORHcT/Hg7VfyZ0VS/6Pv+Dtw==
X-Received: by 2002:a1c:a749:: with SMTP id q70mr692483wme.117.1603721935348;
        Mon, 26 Oct 2020 07:18:55 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id e15sm21920841wro.13.2020.10.26.07.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 07:18:54 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [RFT PATCH 5/7] gpio: exar: unduplicate address and offset computation
Date:   Mon, 26 Oct 2020 15:18:37 +0100
Message-Id: <20201026141839.28536-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201026141839.28536-1-brgl@bgdev.pl>
References: <20201026141839.28536-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Provide and use helpers for calculating the register address and bit
offset instead of hand coding it in every function.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-exar.c | 40 ++++++++++++++++++++++++++++------------
 1 file changed, 28 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-exar.c b/drivers/gpio/gpio-exar.c
index db366d85b6b4..629f4dad6919 100644
--- a/drivers/gpio/gpio-exar.c
+++ b/drivers/gpio/gpio-exar.c
@@ -33,6 +33,26 @@ struct exar_gpio_chip {
 	unsigned int first_pin;
 };
 
+static unsigned int
+exar_offset_to_sel_addr(struct exar_gpio_chip *exar_gpio, unsigned int offset)
+{
+	return (offset + exar_gpio->first_pin) / 8 ? EXAR_OFFSET_MPIOSEL_HI
+						   : EXAR_OFFSET_MPIOSEL_LO;
+}
+
+static unsigned int
+exar_offset_to_lvl_addr(struct exar_gpio_chip *exar_gpio, unsigned int offset)
+{
+	return (offset + exar_gpio->first_pin) / 8 ? EXAR_OFFSET_MPIOLVL_HI
+						   : EXAR_OFFSET_MPIOLVL_LO;
+}
+
+static unsigned int
+exar_offset_to_bit(struct exar_gpio_chip *exar_gpio, unsigned int offset)
+{
+	return (offset + exar_gpio->first_pin) % 8;
+}
+
 static void exar_update(struct gpio_chip *chip, unsigned int reg, int val,
 			unsigned int offset)
 {
@@ -52,9 +72,8 @@ static int exar_set_direction(struct gpio_chip *chip, int direction,
 			      unsigned int offset)
 {
 	struct exar_gpio_chip *exar_gpio = gpiochip_get_data(chip);
-	unsigned int addr = (offset + exar_gpio->first_pin) / 8 ?
-		EXAR_OFFSET_MPIOSEL_HI : EXAR_OFFSET_MPIOSEL_LO;
-	unsigned int bit  = (offset + exar_gpio->first_pin) % 8;
+	unsigned int addr = exar_offset_to_sel_addr(exar_gpio, offset);
+	unsigned int bit = exar_offset_to_bit(exar_gpio, offset);
 
 	exar_update(chip, addr, direction, bit);
 	return 0;
@@ -75,9 +94,8 @@ static int exar_get(struct gpio_chip *chip, unsigned int reg)
 static int exar_get_direction(struct gpio_chip *chip, unsigned int offset)
 {
 	struct exar_gpio_chip *exar_gpio = gpiochip_get_data(chip);
-	unsigned int addr = (offset + exar_gpio->first_pin) / 8 ?
-		EXAR_OFFSET_MPIOSEL_HI : EXAR_OFFSET_MPIOSEL_LO;
-	unsigned int bit  = (offset + exar_gpio->first_pin) % 8;
+	unsigned int addr = exar_offset_to_sel_addr(exar_gpio, offset);
+	unsigned int bit = exar_offset_to_bit(exar_gpio, offset);
 
 	if (exar_get(chip, addr) & BIT(bit))
 		return GPIO_LINE_DIRECTION_IN;
@@ -88,9 +106,8 @@ static int exar_get_direction(struct gpio_chip *chip, unsigned int offset)
 static int exar_get_value(struct gpio_chip *chip, unsigned int offset)
 {
 	struct exar_gpio_chip *exar_gpio = gpiochip_get_data(chip);
-	unsigned int addr = (offset + exar_gpio->first_pin) / 8 ?
-		EXAR_OFFSET_MPIOLVL_HI : EXAR_OFFSET_MPIOLVL_LO;
-	unsigned int bit  = (offset + exar_gpio->first_pin) % 8;
+	unsigned int addr = exar_offset_to_lvl_addr(exar_gpio, offset);
+	unsigned int bit = exar_offset_to_bit(exar_gpio, offset);
 
 	return !!(exar_get(chip, addr) & BIT(bit));
 }
@@ -99,9 +116,8 @@ static void exar_set_value(struct gpio_chip *chip, unsigned int offset,
 			   int value)
 {
 	struct exar_gpio_chip *exar_gpio = gpiochip_get_data(chip);
-	unsigned int addr = (offset + exar_gpio->first_pin) / 8 ?
-		EXAR_OFFSET_MPIOLVL_HI : EXAR_OFFSET_MPIOLVL_LO;
-	unsigned int bit  = (offset + exar_gpio->first_pin) % 8;
+	unsigned int addr = exar_offset_to_sel_addr(exar_gpio, offset);
+	unsigned int bit = exar_offset_to_bit(exar_gpio, offset);
 
 	exar_update(chip, addr, value, bit);
 }
-- 
2.29.1

