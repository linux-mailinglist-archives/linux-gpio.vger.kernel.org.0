Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E08714CADF
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jan 2020 13:30:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726271AbgA2Mab (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Jan 2020 07:30:31 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:46048 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726128AbgA2Mab (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jan 2020 07:30:31 -0500
Received: by mail-pg1-f193.google.com with SMTP id b9so8745930pgk.12
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jan 2020 04:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ingics-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EnCaoPKjD2/R/bx2gchlCXdcq08yj4Bbof75NeNjicI=;
        b=bQJu9jtmwTGnXDvE/HY2F7ayL8BYWR43Z2ZHHlKWn8pTzkpvCJHHk8AcPOFzQ4vZA/
         LwmGSbXmkqyoy9KZN7B8chTnfNImSmyTSVP6LhQ8TDbhZMYuC/whPq8C8Le+Twmz+D2L
         ApjgLC3zSvfZ/MzWMIdjXo71VCm/VS7pwBRMPI5SfCEPv9xmF5lB6Df0/ersVsL7fdK2
         2gcc8BclKPjXEKNj49iIeDKToFCLjIOMpcn0YH5n9kKgbiPfKOU6ppwhNomx+CSsr74n
         KEwCjL5lUDDmYplacUbYxR9hsrrK1cyZR1+6GTXulLNGYPzYI2RDhvoPQjGrEjkiOg0/
         TVyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EnCaoPKjD2/R/bx2gchlCXdcq08yj4Bbof75NeNjicI=;
        b=mL5YTT93ojlc6SlSF61iAJOW5qOr3UIXWFIxCDJl67SdKq6JoTTgYQ38mMxzdWmFxd
         S3BCftWONwoVV7d0qMZyIMm+4zN/ijHMLlZAxsxbsaQGnX+jDA4nuaCcjvfgM7BvKlkw
         XHjOqYizjeY9/YSRK2W1LCaefiGCf5otwynIzRqtpHX4xwjvgls35rpLnfiqm/peffMI
         3EJJ1YNt1Wg+PRhYkOE++hQpnvGyO3Tyq31/sAQZieBRK0p3q+Ya1vFbyAcTij5QIQfV
         V9hsRCnUcQsZrqT6gn2mkr7b43Rjnfqb/ANyUXfc61ZkBUrAJHUhVOg++S2fYZ0zCkzA
         Y4pw==
X-Gm-Message-State: APjAAAV315a4uYtwdFi4aIXXZAiORmej0mIV6B84Rdaz7/NNJQmwjxbL
        A5KKmC7fpymZpvx3VZMLVPyslw==
X-Google-Smtp-Source: APXvYqyQAfd0qbIupqRcE39B6CvO/X3RxjqWhV6OxT8ZDIUAzGT9AWmTtFMn2Nn+9i1ZqsnlLdhodw==
X-Received: by 2002:aa7:9dde:: with SMTP id g30mr6890390pfq.91.1580301030095;
        Wed, 29 Jan 2020 04:30:30 -0800 (PST)
Received: from localhost.localdomain (118-171-135-189.dynamic-ip.hinet.net. [118.171.135.189])
        by smtp.gmail.com with ESMTPSA id 136sm2558825pgg.74.2020.01.29.04.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2020 04:30:29 -0800 (PST)
From:   Axel Lin <axel.lin@ingics.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Axel Lin <axel.lin@ingics.com>
Subject: [PATCH] gpio: bd71828: Remove unneeded defines for GPIO_LINE_DIRECTION_IN/OUT
Date:   Wed, 29 Jan 2020 20:30:21 +0800
Message-Id: <20200129123021.26200-1-axel.lin@ingics.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

They are defined in gpio/driver.h now.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/gpio/gpio-bd71828.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/gpio/gpio-bd71828.c b/drivers/gpio/gpio-bd71828.c
index 04aade9e0a4d..3dbbc638e9a9 100644
--- a/drivers/gpio/gpio-bd71828.c
+++ b/drivers/gpio/gpio-bd71828.c
@@ -10,16 +10,6 @@
 #define GPIO_OUT_REG(off) (BD71828_REG_GPIO_CTRL1 + (off))
 #define HALL_GPIO_OFFSET 3
 
-/*
- * These defines can be removed when
- * "gpio: Add definition for GPIO direction"
- * (9208b1e77d6e8e9776f34f46ef4079ecac9c3c25 in GPIO tree) gets merged,
- */
-#ifndef GPIO_LINE_DIRECTION_IN
-	#define GPIO_LINE_DIRECTION_IN 1
-	#define GPIO_LINE_DIRECTION_OUT 0
-#endif
-
 struct bd71828_gpio {
 	struct rohm_regmap_dev chip;
 	struct gpio_chip gpio;
-- 
2.20.1

