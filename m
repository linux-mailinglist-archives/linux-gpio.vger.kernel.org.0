Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8E622282C0
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jul 2020 16:51:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729960AbgGUOvB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jul 2020 10:51:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729935AbgGUOvB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jul 2020 10:51:01 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16A62C061794;
        Tue, 21 Jul 2020 07:51:01 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id a15so6549691wrh.10;
        Tue, 21 Jul 2020 07:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bUoWPSXFfeMMtQtLLnTEpcxVteBTL0XZUGyYT/N/XI8=;
        b=tIB6GE7R8Nbhog9WRFYxS84y7B53odtEzhgB5KjvT+eigMV1aVkS1qgfU9YLghmiFs
         vx8xcsio5IsF4y40Uscw77oSWxy3QPPO6/FTwLjD2nDPzzUcuWz8w0GRY9sANAQDAoKW
         gJwlW5i4DMph5klYoEJWnWU9mgIBKL4+UvYSp1/SoAOfgi14NyBALRNmCYgeqBWzVlfP
         gBrVB9Mn7S56FPjkKYPP3CKpr9oNLuDFBkR8IAFz1LX8rMpqY01R/P7jF1eDd5ksTnd9
         vIrMhUUCt93bapp0VKLi7NTWU++3Zf6j8nqmj2Wn581cMIYB8nJlzcStRV4DpMpGItnt
         OWug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bUoWPSXFfeMMtQtLLnTEpcxVteBTL0XZUGyYT/N/XI8=;
        b=Gq3YGZydYqWMZKiTqUh/wJX709fRH8N9Rl2EohhjHApGZ4ARgBofEAsYdDE+t8pFRk
         lUBPw4BZlddS2N6twOgEGonEwvFwzLfcV3xkyXP1FpcksvKEtDZh4ec+IIXGzoB7X8C5
         +uqpJkiN5q29/9P3hw9PoFRqy63snM60fDeNrE4i8B5PpgJ/wlgbanA8AyNwArWhjcpX
         lnZQPtW36hMzSdovVwCGUduf6fo7AjMmHC/Nv5eCO+IwPIdsk9ju46KKhW4vPGafXM4+
         JdbleGqYBOv3bwwAizJmFJoqkFz77+eNh2dC3V/0yWjwgxQrjMx2n8Sy7aMHYMG/RoeY
         HVfw==
X-Gm-Message-State: AOAM532t9mUTgj4Wenw4UK+Fn4LLAySFyqdfSXRPU73aGA4Yoq1eyiWY
        Narl9KMMlrBdNIDQv1LswC8=
X-Google-Smtp-Source: ABdhPJzxHAlJrY0dwjdtYhWdc6VZG250UNW5nj6MTFyoJbMwUyAeBI1NkJVoqi6SnuUzA8lfmmA6fQ==
X-Received: by 2002:a5d:6646:: with SMTP id f6mr12351263wrw.155.1595343059740;
        Tue, 21 Jul 2020 07:50:59 -0700 (PDT)
Received: from localhost ([156.204.74.63])
        by smtp.gmail.com with ESMTPSA id f15sm3427212wmj.44.2020.07.21.07.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 07:50:59 -0700 (PDT)
From:   Abanoub Sameh <abanoubsameh8@gmail.com>
X-Google-Original-From: Abanoub Sameh <abanoubsameh@protonmail.com>
To:     andy.shevchenko@gmail.com
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abanoub Sameh <abanoubsameh@protonmail.com>
Subject: [PATCH 1/2] gpio: gpio-pch.c: changed every 'unsigned' to 'unsigned int'
Date:   Tue, 21 Jul 2020 16:50:45 +0200
Message-Id: <20200721145046.773419-1-abanoubsameh@protonmail.com>
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
 drivers/gpio/gpio-pch.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-pch.c b/drivers/gpio/gpio-pch.c
index e96d28bf43b4..71dde7ceb7af 100644
--- a/drivers/gpio/gpio-pch.c
+++ b/drivers/gpio/gpio-pch.c
@@ -95,7 +95,7 @@ struct pch_gpio {
 	spinlock_t spinlock;
 };
 
-static void pch_gpio_set(struct gpio_chip *gpio, unsigned nr, int val)
+static void pch_gpio_set(struct gpio_chip *gpio, unsigned int nr, int val)
 {
 	u32 reg_val;
 	struct pch_gpio *chip =	gpiochip_get_data(gpio);
@@ -112,14 +112,14 @@ static void pch_gpio_set(struct gpio_chip *gpio, unsigned nr, int val)
 	spin_unlock_irqrestore(&chip->spinlock, flags);
 }
 
-static int pch_gpio_get(struct gpio_chip *gpio, unsigned nr)
+static int pch_gpio_get(struct gpio_chip *gpio, unsigned int nr)
 {
 	struct pch_gpio *chip =	gpiochip_get_data(gpio);
 
 	return !!(ioread32(&chip->reg->pi) & BIT(nr));
 }
 
-static int pch_gpio_direction_output(struct gpio_chip *gpio, unsigned nr,
+static int pch_gpio_direction_output(struct gpio_chip *gpio, unsigned int nr,
 				     int val)
 {
 	struct pch_gpio *chip =	gpiochip_get_data(gpio);
@@ -146,7 +146,7 @@ static int pch_gpio_direction_output(struct gpio_chip *gpio, unsigned nr,
 	return 0;
 }
 
-static int pch_gpio_direction_input(struct gpio_chip *gpio, unsigned nr)
+static int pch_gpio_direction_input(struct gpio_chip *gpio, unsigned int nr)
 {
 	struct pch_gpio *chip =	gpiochip_get_data(gpio);
 	u32 pm;
@@ -196,7 +196,7 @@ static void __maybe_unused pch_gpio_restore_reg_conf(struct pch_gpio *chip)
 		iowrite32(chip->pch_gpio_reg.gpio_use_sel_reg, &chip->reg->gpio_use_sel);
 }
 
-static int pch_gpio_to_irq(struct gpio_chip *gpio, unsigned offset)
+static int pch_gpio_to_irq(struct gpio_chip *gpio, unsigned int offset)
 {
 	struct pch_gpio *chip = gpiochip_get_data(gpio);
 	return chip->irq_base + offset;
-- 
2.28.0.rc0

