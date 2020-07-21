Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFEB42282B2
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jul 2020 16:50:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728775AbgGUOu3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jul 2020 10:50:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726522AbgGUOu2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jul 2020 10:50:28 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35FD9C061794;
        Tue, 21 Jul 2020 07:50:28 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id z15so21466045wrl.8;
        Tue, 21 Jul 2020 07:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rsrc+BUXsBd0EOvP1wgqFyzSVkzaRwISm5nTyINW+SI=;
        b=jfyaNVJLyFqL8RfqmLsI5XAOVkWWz+RmSCY0ACCO+7ppP5JgGTv5g/7VqNcJ0vJzvO
         y3U6hP3Y4z/ui0s/mWl20SihNdHsd9eDNa1L3+ik6G7w+oNTKTDPqWDMb70td0f9gCkg
         lJ0rc3XRZW6avH2B/7mGhLdPHO7ShE4KhFsHv5FU/00E0oVq8h7VihowBcr1cFcSgE40
         JnIh/LUXmbUrwqqvq3aoIwsjeWEfJhCmqIespNg58XfYKsjqZDHbal7QF5ifBk7+2xhX
         1WVynmEyg2HNM/8MMXqnb7/UKVGO4N6y8N+orKJ0478MfEgoNB1dhs1a4Ik85KpSqU5X
         Z2aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rsrc+BUXsBd0EOvP1wgqFyzSVkzaRwISm5nTyINW+SI=;
        b=egHuP9m3KqPnA5lwBQ6ICldPxf4CtA3GZBHm5jCH63dWFkddUKJAez4Rlh9XKi1EyB
         gHYqIHBadsFzcgbNdG1EFEjgsJiBCsm22B0ruguT6JygQrTx9aZPPd9CY4z6uya3MhHd
         ZCZEG0kZ/Y0fzB3PCZMzBk9VKRDpVPqp1jJ6Y4mkyx9gRT9AZFpSsPwROtz9X2piH4N/
         To8IKwQShPyMwg6gIEOVkP7jdYXKz2Xx47l08YxJH3jFzAMMRtySZbrnZbvzp0ZhRbtH
         lSdFZoIEjhVVEkblW8MF3uSrFI8Ddbux1qQ+99mmBeJUPetISkj1+6CIYo9kcxUrEFi3
         hT9g==
X-Gm-Message-State: AOAM532tJn8NPD/Ccd4TD+gEtaeAI9Cin25qbM8Sg02adFdDuVSQhUnV
        Agpwl7AI+dpNy2XUS88VLFk=
X-Google-Smtp-Source: ABdhPJyViqSs4nlC3fQwSx81PKwNb4UYI4YPELa3g46relAbKp6ItT6eZ0oNYE6M9uVmnZMX3cl3eg==
X-Received: by 2002:a5d:4401:: with SMTP id z1mr10792529wrq.305.1595343026762;
        Tue, 21 Jul 2020 07:50:26 -0700 (PDT)
Received: from localhost ([156.204.74.63])
        by smtp.gmail.com with ESMTPSA id s203sm3835340wms.32.2020.07.21.07.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 07:50:26 -0700 (PDT)
From:   Abanoub Sameh <abanoubsameh8@gmail.com>
X-Google-Original-From: Abanoub Sameh <abanoubsameh@protonmail.com>
To:     andy.shevchenko@gmail.com
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abanoub Sameh <abanoubsameh@protonmail.com>
Subject: [PATCH 1/2] gpio: gpio-ml-ioh.c: changed every 'unsigned' to 'unsigned int'
Date:   Tue, 21 Jul 2020 16:50:11 +0200
Message-Id: <20200721145012.767722-1-abanoubsameh@protonmail.com>
X-Mailer: git-send-email 2.28.0.rc0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Changed 'unsigned' to 'unsigned int'.
This makes the code more uniform, and compliant with the kernel coding style.

Signed-off-by: Abanoub Sameh <abanoubsameh@protonmail.com>
---
 drivers/gpio/gpio-ml-ioh.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-ml-ioh.c b/drivers/gpio/gpio-ml-ioh.c
index 92b6e958cfed..f1b754b60413 100644
--- a/drivers/gpio/gpio-ml-ioh.c
+++ b/drivers/gpio/gpio-ml-ioh.c
@@ -89,7 +89,7 @@ struct ioh_gpio {
 
 static const int num_ports[] = {6, 12, 16, 16, 15, 16, 16, 12};
 
-static void ioh_gpio_set(struct gpio_chip *gpio, unsigned nr, int val)
+static void ioh_gpio_set(struct gpio_chip *gpio, unsigned int nr, int val)
 {
 	u32 reg_val;
 	struct ioh_gpio *chip =	gpiochip_get_data(gpio);
@@ -106,14 +106,14 @@ static void ioh_gpio_set(struct gpio_chip *gpio, unsigned nr, int val)
 	spin_unlock_irqrestore(&chip->spinlock, flags);
 }
 
-static int ioh_gpio_get(struct gpio_chip *gpio, unsigned nr)
+static int ioh_gpio_get(struct gpio_chip *gpio, unsigned int nr)
 {
 	struct ioh_gpio *chip =	gpiochip_get_data(gpio);
 
 	return !!(ioread32(&chip->reg->regs[chip->ch].pi) & (1 << nr));
 }
 
-static int ioh_gpio_direction_output(struct gpio_chip *gpio, unsigned nr,
+static int ioh_gpio_direction_output(struct gpio_chip *gpio, unsigned int nr,
 				     int val)
 {
 	struct ioh_gpio *chip =	gpiochip_get_data(gpio);
@@ -139,7 +139,7 @@ static int ioh_gpio_direction_output(struct gpio_chip *gpio, unsigned nr,
 	return 0;
 }
 
-static int ioh_gpio_direction_input(struct gpio_chip *gpio, unsigned nr)
+static int ioh_gpio_direction_input(struct gpio_chip *gpio, unsigned int nr)
 {
 	struct ioh_gpio *chip =	gpiochip_get_data(gpio);
 	u32 pm;
@@ -209,7 +209,7 @@ static void ioh_gpio_restore_reg_conf(struct ioh_gpio *chip)
 }
 #endif
 
-static int ioh_gpio_to_irq(struct gpio_chip *gpio, unsigned offset)
+static int ioh_gpio_to_irq(struct gpio_chip *gpio, unsigned int offset)
 {
 	struct ioh_gpio *chip = gpiochip_get_data(gpio);
 	return chip->irq_base + offset;
-- 
2.28.0.rc0

