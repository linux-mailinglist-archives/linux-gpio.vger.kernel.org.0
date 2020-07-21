Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C844227BD8
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jul 2020 11:35:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728535AbgGUJfx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jul 2020 05:35:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725984AbgGUJfv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jul 2020 05:35:51 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED23AC061794;
        Tue, 21 Jul 2020 02:35:50 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id b6so20476702wrs.11;
        Tue, 21 Jul 2020 02:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tR+ThjHA7URp6FC70qaJ5ZjLy+S7M0+LYd2O9AhQXXU=;
        b=FWtGRrnuSvpOH/EiOUwOwmERwxSmFVOiibqp3fX/buBho2rt/t9qYX+PqrWnJ2N8nu
         XxysbsG1noW8GFUMH+zBZoJOCk6I0Pt+4NPwYFOry1VVDbHPGxPq3tVgelCVMv5QjlLW
         mqoV3UBNUFkjmiZ6FxgYVapa3vT/H9144nVFNyCvsers2E97eFMu+YLHE2K6tBwuKxpB
         SXolo72bTKWiqAfn/5XBC8b6NVo2pVorcj7YIaaE+iy82C4+0ZRxDqmcKJDmmOWgodZ6
         GCuaHx7a2aJZkIK90gPZv3HNgud+V+Vr/8klnGOl+jkKUaHwUv4wG/xVpqmykkat4HOs
         TdrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tR+ThjHA7URp6FC70qaJ5ZjLy+S7M0+LYd2O9AhQXXU=;
        b=SHOXs96ExuV4Mf6EaCPwsVTiyS7aORRb4Ou+6f2bOkOOI98LVP/de80fl6+0ocYyC1
         y1zIpUM/rJCIBOItSx0TPm5NZ2X6Q8zAH6ksammKFUOKGjIxYHRXt0wLvzzNC2UKkg8m
         yRZQu6elM7XlcQFjLMWeh/+CjrnB0IDVk6YQrorEeLW6DL0id8KAc2Sb8cb2XEFq+mHo
         VTQDzuLFKxmJcnbegevXXxX/lU8s1CtpY8t9ysoSjvwEUFRzqrokKn/wjhkWqOsmQaFn
         TlNxNjQEC1OYulgmuXz12AnN7W6/C7CAdrMiGYsNLVt4M/tY/6bq3TJmxNE1NfEUWm1w
         MEHQ==
X-Gm-Message-State: AOAM530D9kqb4PV1J+LGPhRkEhmxpmvOCFKrU3WRhl/VV0Np/SICiAC/
        nAnuY+fyEjCndQ+0B1xzFyI=
X-Google-Smtp-Source: ABdhPJw8SvrQwPQh2wu0MiHbj4IxdsnuxajaUjWbMZKS2Q88Z4JcPIHQEoB9lPGg6685LhkhndyyUg==
X-Received: by 2002:adf:c185:: with SMTP id x5mr28061588wre.403.1595324149736;
        Tue, 21 Jul 2020 02:35:49 -0700 (PDT)
Received: from localhost ([41.37.22.226])
        by smtp.gmail.com with ESMTPSA id y16sm37846726wro.71.2020.07.21.02.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 02:35:49 -0700 (PDT)
From:   Abanoub Sameh <abanoubsameh8@gmail.com>
X-Google-Original-From: Abanoub Sameh <abanoubsameh@protonmail.com>
To:     andy.shevchenko@gmail.com
Cc:     linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Abanoub Sameh <abanoubsameh@protonmail.com>
Subject: [PATCH 4/7] gpio: fixed coding style issues in gpio-ml-ioh.c
Date:   Tue, 21 Jul 2020 11:35:19 +0200
Message-Id: <20200721093522.2309530-4-abanoubsameh@protonmail.com>
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
 drivers/gpio/gpio-ml-ioh.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-ml-ioh.c b/drivers/gpio/gpio-ml-ioh.c
index 92b6e958cfed..7007621a5b55 100644
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
@@ -209,9 +209,10 @@ static void ioh_gpio_restore_reg_conf(struct ioh_gpio *chip)
 }
 #endif
 
-static int ioh_gpio_to_irq(struct gpio_chip *gpio, unsigned offset)
+static int ioh_gpio_to_irq(struct gpio_chip *gpio, unsigned int offset)
 {
 	struct ioh_gpio *chip = gpiochip_get_data(gpio);
+
 	return chip->irq_base + offset;
 }
 
-- 
2.28.0.rc0

