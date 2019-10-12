Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 826CCD4BFD
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Oct 2019 03:57:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728171AbfJLB5L (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Oct 2019 21:57:11 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:46401 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727345AbfJLB5L (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Oct 2019 21:57:11 -0400
Received: by mail-pg1-f196.google.com with SMTP id b8so6749404pgm.13
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2019 18:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AOT7vFL3O4ZceBzvBdGY8FMxY/oQKy8m5KQbEXrjZS8=;
        b=Fkvq2sLveLjXEcRLunmQpckHPJHjl6+cMWtyAbsizQ1v6/AwNUQ3KWLQd1k/8r7Ums
         qKs6BKCr72BTP5dzs1G9UT8FdBGhxrp7fx0copCnVP7J9XEfvoxcicwjfhfKrijCkDfK
         p8K1fIIEPSSbutUveHUd1KdsmMhzeCBLoVAbrcvP5pX6xkvz0/nGlUnEbPR69Gic/n1L
         9b2kQQAyUQESb8z9mwULMOC7msz+g+G0huaV3taCzQ5so+Rpk0Aam0f5HawYH2FE1/Ob
         bNPrOXbKQ6b4Pwood3LnkcZ5eWMgn4CT1/7HcCMnFGxJPikcDVY2FL5X9I4QZ0Rtu7Ve
         spCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AOT7vFL3O4ZceBzvBdGY8FMxY/oQKy8m5KQbEXrjZS8=;
        b=VYI8ICFipfOMH27W/ikc0QDO9JCeb8lKMhisdBMxDjOciTvewk7gFJgLi7nIDBcGRR
         K1Peeewx4IajAQG/CuVrEI04v/binDe3m4BoF25AkhHbGeDWXHtRahfk2WhFmVFnWuer
         CXiIH8xtbqYrsSmiY1DrAQWpKFryO5GTDz+qIO545D2BesuGQ3ztfnRINoKMZYE9ZdVK
         pERAQ7ZMShDTRsJdTAcUQsLVAQ1FGD2FJvoBCGN/a6nDyuuvLYise9RCzHrwYenWjAoc
         Y0c7cMqbl9qhLnlrtYWBjmS7uFu71Em286oYg2FV/s2w0KTKuHGCVzF4aMu3xEWuutDo
         tACA==
X-Gm-Message-State: APjAAAU7Il0sQQ6nOxsT7O7xYF1oi5SUH84dN7yviNe9wz3YLXop+ipn
        uL0FbNuNECObiJaBwPc2y7IS61qjjhfccA==
X-Google-Smtp-Source: APXvYqyR3XdtAMDR1xDLVV5NdP5i2qzMxDfH+aOOgrmpANGmncC5o9dPCVbOFRTaTxcIVu6PPrMSUA==
X-Received: by 2002:a63:1b10:: with SMTP id b16mr216609pgb.235.1570845430571;
        Fri, 11 Oct 2019 18:57:10 -0700 (PDT)
Received: from sol.lan (220-235-84-126.dyn.iinet.net.au. [220.235.84.126])
        by smtp.gmail.com with ESMTPSA id b20sm12042242pff.158.2019.10.11.18.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2019 18:57:10 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl,
        linus.walleij@linaro.org, bamv2005@gmail.com
Cc:     drew@pdp7.com, Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v2 5/6] gpiolib: disable bias on inputs when pull up/down are both set
Date:   Sat, 12 Oct 2019 09:56:27 +0800
Message-Id: <20191012015628.9604-6-warthog618@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191012015628.9604-1-warthog618@gmail.com>
References: <20191012015628.9604-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch allows pull up/down bias to be disabled, allowing
the line to float or to be biased only by external circuitry.
Use case is for where the bias has been applied previously,
either by default or by the user, but that setting may
conflict with the current use of the line.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 647334f53622..f90b20d548b9 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -539,11 +539,6 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 	    (lflags & GPIOHANDLE_REQUEST_OUTPUT))
 		return -EINVAL;
 
-	/* Same with pull-up and pull-down. */
-	if ((lflags & GPIOHANDLE_REQUEST_PULL_UP) &&
-	    (lflags & GPIOHANDLE_REQUEST_PULL_DOWN))
-		return -EINVAL;
-
 	/*
 	 * Do not allow OPEN_SOURCE & OPEN_DRAIN flags in a single request. If
 	 * the hardware actually supports enabling both at the same time the
@@ -935,14 +930,6 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 	     (lflags & GPIOHANDLE_REQUEST_PULL_DOWN)))
 		return -EINVAL;
 
-	/*
-	 * Do not allow both pull-up and pull-down flags to be set as they
-	 *  are contradictory.
-	 */
-	if ((lflags & GPIOHANDLE_REQUEST_PULL_UP) &&
-	    (lflags & GPIOHANDLE_REQUEST_PULL_DOWN))
-		return -EINVAL;
-
 	le = kzalloc(sizeof(*le), GFP_KERNEL);
 	if (!le)
 		return -ENOMEM;
@@ -2931,6 +2918,7 @@ static int gpio_set_config(struct gpio_chip *gc, unsigned offset,
 	unsigned arg;
 
 	switch (mode) {
+	case PIN_CONFIG_BIAS_DISABLE:
 	case PIN_CONFIG_BIAS_PULL_DOWN:
 	case PIN_CONFIG_BIAS_PULL_UP:
 		arg = 1;
@@ -2991,7 +2979,11 @@ int gpiod_direction_input(struct gpio_desc *desc)
 	if (ret == 0)
 		clear_bit(FLAG_IS_OUT, &desc->flags);
 
-	if (test_bit(FLAG_PULL_UP, &desc->flags))
+	if (test_bit(FLAG_PULL_UP, &desc->flags) &&
+		test_bit(FLAG_PULL_DOWN, &desc->flags))
+		gpio_set_config(chip, gpio_chip_hwgpio(desc),
+				PIN_CONFIG_BIAS_DISABLE);
+	else if (test_bit(FLAG_PULL_UP, &desc->flags))
 		gpio_set_config(chip, gpio_chip_hwgpio(desc),
 				PIN_CONFIG_BIAS_PULL_UP);
 	else if (test_bit(FLAG_PULL_DOWN, &desc->flags))
@@ -4462,7 +4454,7 @@ int gpiod_configure_flags(struct gpio_desc *desc, const char *con_id,
 
 	if (lflags & GPIO_PULL_UP)
 		set_bit(FLAG_PULL_UP, &desc->flags);
-	else if (lflags & GPIO_PULL_DOWN)
+	if (lflags & GPIO_PULL_DOWN)
 		set_bit(FLAG_PULL_DOWN, &desc->flags);
 
 	ret = gpiod_set_transitory(desc, (lflags & GPIO_TRANSITORY));
-- 
2.23.0

