Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E27E227BDF
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jul 2020 11:36:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728632AbgGUJgE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jul 2020 05:36:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728885AbgGUJf6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jul 2020 05:35:58 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C328DC061794;
        Tue, 21 Jul 2020 02:35:57 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id g75so2112641wme.5;
        Tue, 21 Jul 2020 02:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=maCZ643Vqsjv4Z94t/8MVEAEPkdFO2eHN3bkR1ZcrlE=;
        b=RpibQnFnnZttU2J78SYoYL7JrGoG8z9DaVtIGd0sS8PArtV0akiY+zW21bPA2H+nK6
         WAKPHq+zjQAQLfKmEmMsirBJoBhOs9tnLxC0wMqux4sstluT2WyETAlIbM5KASQIZCkI
         oyFaHLwsCLAyCnpnjxsnWc/F5DRBguwB5u5U4vFy7/EKFBDfLanbcqG/wX6DFvzl/hAe
         EYJiEXaOqWKhnqGbh52Het2Kv4mahGHK6VjfTz3RQ3yBanS1MrXi1DPrmIG7MXH5CEwI
         o50LgMvl1dsXGLtDNrMbV6xaLxPVoJerSA+ZiCkMi0zjWNdZ8GwoyxK+xgpzSJC7Yj1Q
         l7bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=maCZ643Vqsjv4Z94t/8MVEAEPkdFO2eHN3bkR1ZcrlE=;
        b=q+zMQN8bW4tIJDn5v3Urqcp6gnhA850V071itf8lI46H6AosClZCat5yXgt2eAjMNu
         y+tkc00LFXfrLLRbZG+OMND9QmZ/NozSmEtil1yDbOTGBusyyE/gUZYNHAutJ8Oa0HDJ
         eFfBGR9KfyqAyM+ulur76G7BIOd9mfUDcOB3nXk2+oJLNX+GNb4q2NZdWqQgwqOtlicm
         o9YNzk4DcjWVcCdTXni/bL6H9d/Px8wvGCKk6Jwl1yuS4FWMjmnrMS/DfY97lJrDUbSr
         UpHGf+/eyeXr/dID8R4QrRKnOeX5zOE/SDUEiLx9ep0SGNONCKY20YEY0ntRSkbjp7S5
         d7YQ==
X-Gm-Message-State: AOAM533i/iIc0r9P9s3OxoXZWqyyEul+/2Cbb+CWLeqmPjwuX9JHGj0a
        SChRYu2TAqY1y6C/lRiNRdY=
X-Google-Smtp-Source: ABdhPJxqCa/dEMdQS+el2Khmgxukw8FWh0kCzLYBzuE9dYi/6ArArvJLmVvyhjfPHTmrGHyFxwMg2Q==
X-Received: by 2002:a05:600c:4114:: with SMTP id j20mr3176796wmi.74.1595324156555;
        Tue, 21 Jul 2020 02:35:56 -0700 (PDT)
Received: from localhost ([41.37.22.226])
        by smtp.gmail.com with ESMTPSA id s15sm2868929wmj.41.2020.07.21.02.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 02:35:56 -0700 (PDT)
From:   Abanoub Sameh <abanoubsameh8@gmail.com>
X-Google-Original-From: Abanoub Sameh <abanoubsameh@protonmail.com>
To:     andy.shevchenko@gmail.com
Cc:     linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Abanoub Sameh <abanoubsameh@protonmail.com>
Subject: [PATCH 7/7] gpio: fixed coding style issues in gpio-sch.c
Date:   Tue, 21 Jul 2020 11:35:22 +0200
Message-Id: <20200721093522.2309530-7-abanoubsameh@protonmail.com>
X-Mailer: git-send-email 2.28.0.rc0
In-Reply-To: <20200721093522.2309530-1-abanoubsameh@protonmail.com>
References: <20200721093522.2309530-1-abanoubsameh@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Signed-off-by: Abanoub Sameh <abanoubsameh@protonmail.com>
---
 drivers/gpio/gpio-sch.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-sch.c b/drivers/gpio/gpio-sch.c
index c65f35b68202..3a1b1adb08c6 100644
--- a/drivers/gpio/gpio-sch.c
+++ b/drivers/gpio/gpio-sch.c
@@ -26,10 +26,10 @@ struct sch_gpio {
 	unsigned short resume_base;
 };
 
-static unsigned sch_gpio_offset(struct sch_gpio *sch, unsigned gpio,
-				unsigned reg)
+static unsigned int sch_gpio_offset(struct sch_gpio *sch, unsigned int gpio,
+				unsigned int reg)
 {
-	unsigned base = 0;
+	unsigned int base = 0;
 
 	if (gpio >= sch->resume_base) {
 		gpio -= sch->resume_base;
@@ -39,14 +39,14 @@ static unsigned sch_gpio_offset(struct sch_gpio *sch, unsigned gpio,
 	return base + reg + gpio / 8;
 }
 
-static unsigned sch_gpio_bit(struct sch_gpio *sch, unsigned gpio)
+static unsigned int sch_gpio_bit(struct sch_gpio *sch, unsigned int gpio)
 {
 	if (gpio >= sch->resume_base)
 		gpio -= sch->resume_base;
 	return gpio % 8;
 }
 
-static int sch_gpio_reg_get(struct sch_gpio *sch, unsigned gpio, unsigned reg)
+static int sch_gpio_reg_get(struct sch_gpio *sch, unsigned int gpio, unsigned int reg)
 {
 	unsigned short offset, bit;
 	u8 reg_val;
@@ -59,7 +59,7 @@ static int sch_gpio_reg_get(struct sch_gpio *sch, unsigned gpio, unsigned reg)
 	return reg_val;
 }
 
-static void sch_gpio_reg_set(struct sch_gpio *sch, unsigned gpio, unsigned reg,
+static void sch_gpio_reg_set(struct sch_gpio *sch, unsigned int gpio, unsigned int reg,
 			     int val)
 {
 	unsigned short offset, bit;
@@ -76,7 +76,7 @@ static void sch_gpio_reg_set(struct sch_gpio *sch, unsigned gpio, unsigned reg,
 		outb((reg_val & ~BIT(bit)), sch->iobase + offset);
 }
 
-static int sch_gpio_direction_in(struct gpio_chip *gc, unsigned gpio_num)
+static int sch_gpio_direction_in(struct gpio_chip *gc, unsigned int gpio_num)
 {
 	struct sch_gpio *sch = gpiochip_get_data(gc);
 
@@ -86,13 +86,14 @@ static int sch_gpio_direction_in(struct gpio_chip *gc, unsigned gpio_num)
 	return 0;
 }
 
-static int sch_gpio_get(struct gpio_chip *gc, unsigned gpio_num)
+static int sch_gpio_get(struct gpio_chip *gc, unsigned int gpio_num)
 {
 	struct sch_gpio *sch = gpiochip_get_data(gc);
+
 	return sch_gpio_reg_get(sch, gpio_num, GLV);
 }
 
-static void sch_gpio_set(struct gpio_chip *gc, unsigned gpio_num, int val)
+static void sch_gpio_set(struct gpio_chip *gc, unsigned int gpio_num, int val)
 {
 	struct sch_gpio *sch = gpiochip_get_data(gc);
 
@@ -101,7 +102,7 @@ static void sch_gpio_set(struct gpio_chip *gc, unsigned gpio_num, int val)
 	spin_unlock(&sch->lock);
 }
 
-static int sch_gpio_direction_out(struct gpio_chip *gc, unsigned gpio_num,
+static int sch_gpio_direction_out(struct gpio_chip *gc, unsigned int gpio_num,
 				  int val)
 {
 	struct sch_gpio *sch = gpiochip_get_data(gc);
@@ -123,7 +124,7 @@ static int sch_gpio_direction_out(struct gpio_chip *gc, unsigned gpio_num,
 	return 0;
 }
 
-static int sch_gpio_get_direction(struct gpio_chip *gc, unsigned gpio_num)
+static int sch_gpio_get_direction(struct gpio_chip *gc, unsigned int gpio_num)
 {
 	struct sch_gpio *sch = gpiochip_get_data(gc);
 
-- 
2.28.0.rc0

