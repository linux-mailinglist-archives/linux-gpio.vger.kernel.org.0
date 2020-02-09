Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF16C1569D8
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Feb 2020 10:56:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726078AbgBIJ43 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 9 Feb 2020 04:56:29 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:35041 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726081AbgBIJ43 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 9 Feb 2020 04:56:29 -0500
Received: by mail-pj1-f68.google.com with SMTP id q39so2890345pjc.0;
        Sun, 09 Feb 2020 01:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=f1E1/w19Qu5aMo04MgssFNFLVo1fElkYxiMw+uBiQUs=;
        b=g6S8AjqMZKNCsl7saMmNX7owbWy1Zlje6wjQsyQhO84iRivgSjtMXB8NP2bbQd62o1
         IoUs0o55M7dwlUybPJdHpz5AjcrNhTWbrg3pfDFQxpN3FKQUf8IZAmsTDJ4DzUEfkdVj
         vM85z9kDJyOE8tD7eaW6WYPuQMSQAVE74xjz5tXl6Df2juN5caBoXTl3FmJ1mb3GJ8WP
         BMu0IHrqmlI+0bSPZ1g6z/vIlXimZGPDC2qh35fHAC6eZck+1WgXcr9mxqXIlfbrdSZ9
         CdHU5kIsjU1RHY048KMti9YjTVUILx9+FVanXmN+Vd5hrsz71H00cQLC6bL+hzofC6Z4
         RTLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=f1E1/w19Qu5aMo04MgssFNFLVo1fElkYxiMw+uBiQUs=;
        b=MomccZ/seH37bZ/O7jwbHzRU3iCZX1+U8GhVxKsEcNmzlSawLVq1JvKrAsdtys3Y16
         y11qnKr9D93aZTaIG1bJFTKOTsm+ZiRqhTi8axhIueSI1OCQRcEYPUAU4GItIi7RNz29
         XrNfpgpebeMdW48rrDmyoygfbGPqpug695yunyhwI75LVoTCDAvZiLuI4vUvZhjD+PqC
         kTVb0y5RVB/dFoBUvG2tR35DhBW7kachWccnaG+Qb5b2PJXbmpygRRa4t6anyUiE7ZrY
         ROzM7VjLax4foXUcUcmXDgxVtp/6tZTSRD+OPY98PgavCF9rrQaJBrgwgWYPO57AsSDa
         LeFw==
X-Gm-Message-State: APjAAAUL/MhuB0DTGNiW3G8Yh7I0RGO1uzKN+oBS9BSMaeiWTJwKtJoK
        MPt/foscDGJDW1DqUHuytEfTP9aQ
X-Google-Smtp-Source: APXvYqwdz5ERUWpbOVcVBBoVTMo8VAeWNxUd06Ice4slb3MLXIoLcKapG0PKHgrUKBCbhAVRz+7ksg==
X-Received: by 2002:a17:902:9a85:: with SMTP id w5mr7440957plp.290.1581242188942;
        Sun, 09 Feb 2020 01:56:28 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:16bb:2a17:2526:2889:13cc:ecf6])
        by smtp.gmail.com with ESMTPSA id o14sm8385968pgm.67.2020.02.09.01.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2020 01:56:28 -0800 (PST)
From:   Ashish Chavan <ashish.gschavan@gmail.com>
To:     bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        ashish.gschavn@gmail.com, Ashish Chavan <ashish.gschavan@gmail.com>
Subject: [PATCH] gpio: rcar: Fix typo in comment
Date:   Sun,  9 Feb 2020 15:26:00 +0530
Message-Id: <20200209095600.16394-1-ashish.gschavan@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

"Positive" is spelled incorrectly as "Postive" in
comment fix this.

Signed-off-by: Ashish Chavan <ashish.gschavan@gmail.com>
---
 drivers/gpio/gpio-rcar.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index f800b250971c..7284473c9fe3 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -116,7 +116,7 @@ static void gpio_rcar_config_interrupt_input_mode(struct gpio_rcar_priv *p,
 
 	spin_lock_irqsave(&p->lock, flags);
 
-	/* Configure postive or negative logic in POSNEG */
+	/* Configure positive or negative logic in POSNEG */
 	gpio_rcar_modify_bit(p, POSNEG, hwirq, !active_high_rising_edge);
 
 	/* Configure edge or level trigger in EDGLEVEL */
@@ -228,7 +228,7 @@ static void gpio_rcar_config_general_input_output_mode(struct gpio_chip *chip,
 
 	spin_lock_irqsave(&p->lock, flags);
 
-	/* Configure postive logic in POSNEG */
+	/* Configure positive logic in POSNEG */
 	gpio_rcar_modify_bit(p, POSNEG, gpio, false);
 
 	/* Select "General Input/Output Mode" in IOINTSEL */
-- 
2.17.1

