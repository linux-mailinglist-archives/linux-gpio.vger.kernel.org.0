Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BE762DAD61
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Dec 2020 13:40:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726156AbgLOMkk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Dec 2020 07:40:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725535AbgLOMkk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Dec 2020 07:40:40 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7E16C06179C
        for <linux-gpio@vger.kernel.org>; Tue, 15 Dec 2020 04:39:59 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id o19so13293758lfo.1
        for <linux-gpio@vger.kernel.org>; Tue, 15 Dec 2020 04:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2u+g101SrX2cbAexKAHiTmYjfJwI9XfuubnmRIODs2o=;
        b=A6DUYu1KA4eS/fJx/o82Aq9L85RD5+0wgKBCCNrWsNcQszcQHP/sD6uM1gBgHOU7D4
         Mj1kcTkqdL++H0LI2I0zXJoKBypOEJJns2XqnTprwSBfBvK7ktrRaWkU05RiKEQCOTFg
         jl1LYXK4KUqfOxuHsrw3YwJGfSS/YRPy0aJTbUXte3qTS3ldyGQGB0GqeR2ytnO5R8SR
         nRxKEE5rwBv0uuG6MYRT4llSTF0/lht3n8HvcdDnhc3CwiA+7BmgW14tCuemW/67vHrE
         VinQ6LugDB6mNYYp6iPVkhUIblm0tpXt/nrf/FgfTTn6JZhGSiYJuvM6OJKBxgru2PGa
         XtRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2u+g101SrX2cbAexKAHiTmYjfJwI9XfuubnmRIODs2o=;
        b=LiEesdEW6NHz3yjLpwaoMrja90U5MAJZg6fT2dZQFzqf0JvVsM72rZb1n6RyY9w0jl
         HuuFSSWqdnAOWr8nTqEAIpd7jXLrsaIPf/2H89aSyeufuvV16LNt20lnsWZqy+3Tu2Mn
         NeZQcw9GBdDZzSDLsv80PxypL+frcTVhSIrgvCznTi0mW3Zs+9z/CmVfInKgSncL0m1c
         nIm0LQbKYqm7+UcTWLseeeh86ftMeaMI1cGeTby81kd3UlhltE6Eu+cuY6QghdaRwVeD
         l+sdG4xLH3IMwQtlZcWc0lbMSdRYz1odHsPvHZfXnSv9SxCAr6P1c/iJ5QLBDKmtYeoE
         /hDA==
X-Gm-Message-State: AOAM5316wyl7mbC0+FvjQ6XGs3zaCuMvQOa25fY0vjqWqPSSU+Q/HUJP
        /DZXBJ7+foOCjgtUk0u9lzImwAfeXFO3ynNm
X-Google-Smtp-Source: ABdhPJxKiob/4LKHAnPv1rEv/CFDeOOZM+xmiVWz9Rv5EA3pcdqfl59f7Dim+FLC7uiuTAdKHaUtKQ==
X-Received: by 2002:a2e:7212:: with SMTP id n18mr8704169ljc.399.1608035997937;
        Tue, 15 Dec 2020 04:39:57 -0800 (PST)
Received: from localhost.localdomain (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id t28sm1918036ljo.45.2020.12.15.04.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 04:39:57 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Guillaume Tucker <guillaume.tucker@collabora.com>
Subject: [PATCH] gpio: Skip over NULL and (empty string) line names
Date:   Tue, 15 Dec 2020 13:37:55 +0100
Message-Id: <20201215123755.438369-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The core will warn if we try to assign the name ''
(empty string) to two lines. Actively ignore NULL
and empty string in the name assignment loop.

Reported-by: Guillaume Tucker <guillaume.tucker@collabora.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 26c75499d549..d07da3ffd140 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -343,6 +343,10 @@ static int gpiochip_set_desc_names(struct gpio_chip *gc)
 	for (i = 0; i != gc->ngpio; ++i) {
 		struct gpio_desc *gpiod;
 
+		/* Skip NULL or '(empty string)' names */
+		if (!gc->names[i] || !strlen(gc->names[i]))
+			continue;
+
 		gpiod = gpio_name_to_desc(gc->names[i]);
 		if (gpiod && (gpiod->gdev == gdev)) {
 			dev_err(&gdev->dev,
@@ -352,8 +356,12 @@ static int gpiochip_set_desc_names(struct gpio_chip *gc)
 	}
 
 	/* Then add all names to the GPIO descriptors */
-	for (i = 0; i != gc->ngpio; ++i)
+	for (i = 0; i != gc->ngpio; ++i) {
+		/* Skip NULL or '(empty string)' names */
+		if (!gc->names[i] || !strlen(gc->names[i]))
+			continue;
 		gdev->descs[i].name = gc->names[i];
+	}
 
 	return 0;
 }
@@ -404,6 +412,9 @@ static int devprop_gpiochip_set_names(struct gpio_chip *chip)
 	for (i = 0; i < count; i++) {
 		struct gpio_desc *gpiod;
 
+		/* Skip NULL or '(empty string)' names */
+		if (!names[i] || !strlen(names[i]))
+			continue;
 		gpiod = gpio_name_to_desc(names[i]);
 		if (gpiod && (gpiod->gdev == gdev)) {
 			dev_err(&gdev->dev,
-- 
2.28.0

