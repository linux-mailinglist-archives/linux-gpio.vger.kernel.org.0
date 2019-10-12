Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E77D0D4BFA
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Oct 2019 03:57:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728111AbfJLB5D (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Oct 2019 21:57:03 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:44460 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727345AbfJLB5D (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Oct 2019 21:57:03 -0400
Received: by mail-pl1-f195.google.com with SMTP id q15so5249388pll.11
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2019 18:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Qv1ffV1J2AHPgs2jYfDAyydiPGBjRAY5RJPIZ/rc3d4=;
        b=uRpmcaAyU4eDoRzSEYlaVk8PtxfJabPDZyIuZQdiojVmpeje8eh+yC4VLCjk07Qs6O
         Wm5Z4r49OVCHLXDkkiRtOkLeFE3nwxltdBaVzWx2iFXGponkUD6+Wk+0IzFQf26UI8uI
         O4Q2EQzoQFfGl744mrt4FcoepZv9Vf6y2EH4oIh1sxrM9NA4NHBqH2+CZYyOZbpCAjQ8
         tO+pGia1SFe39uCDXvD1kqCztNlEIcaHtQDDKP5336yAEwqRho8vaCqQLygR2GsMKmmP
         krg6VFyE2I2tl+jK5sy0LZLNt6PwSS+Jiv37U9VTLYPNFUU9B3ks7+neOSvPeQxiFsT9
         lvyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Qv1ffV1J2AHPgs2jYfDAyydiPGBjRAY5RJPIZ/rc3d4=;
        b=o8ya3HuQbC6GEQdLJwzQ8qPZnRtG8+vZ/ZOZNS2hSARaPxbOpiBLORjwFbMt33xqBq
         KXWS1SAbKiazbDp5zjMHEsdvajOhKC7p89BuYAPIkR6TqQBKctJyR8dbdz+eRF/OjDsG
         wh49Udr1MJ1OAPe3Bqzpi7G6tmRIck2OAIZDDmc/MuWZvUtQyLVDTOdL4esVR9G6U/+o
         bXC3U9XOh0ICrSrvnF9vPpZIKbFqYGsjoClpKOiGPbqzENu6RZwfuPbbjNSChzrBqa+T
         kCesTNyT51OJQuuuFDEUfbJ/ZMvZzotvh5JDodKCyVfFd0C5NKBgaHKoeyXvsvwR7A0x
         UyhA==
X-Gm-Message-State: APjAAAVfTiHbCqOK11rv3fl+X1GTyTscxQ8AJXknW2mNN0axyzSs34Za
        TLRfUEHMqxYg41HFOpLI2awJ5EGzC88vHQ==
X-Google-Smtp-Source: APXvYqzYznrBg5yu4H0eoJ7zNhjuwvHCOv6pYT9ko7A9B/ARd65nvkWdGONE2YfWlQG+oVo+nTq6zA==
X-Received: by 2002:a17:902:bf0a:: with SMTP id bi10mr18633811plb.56.1570845420596;
        Fri, 11 Oct 2019 18:57:00 -0700 (PDT)
Received: from sol.lan (220-235-84-126.dyn.iinet.net.au. [220.235.84.126])
        by smtp.gmail.com with ESMTPSA id b20sm12042242pff.158.2019.10.11.18.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2019 18:57:00 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl,
        linus.walleij@linaro.org, bamv2005@gmail.com
Cc:     drew@pdp7.com, Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v2 2/6] gpiolib: add support for pull up/down to lineevent_create
Date:   Sat, 12 Oct 2019 09:56:24 +0800
Message-Id: <20191012015628.9604-3-warthog618@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191012015628.9604-1-warthog618@gmail.com>
References: <20191012015628.9604-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch adds support for pull up/down to lineevent_create.
Use cases include receiving asynchronous presses from a
push button without an external pull up/down.

Move all the flags sanitization before any memory allocation in
lineevent_create() in order to remove a couple unneeded gotos.
(from Bartosz Golaszewski <bgolaszewski@baylibre.com>)

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib.c | 60 +++++++++++++++++++++++++-----------------
 1 file changed, 36 insertions(+), 24 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 9d2a5e2f6e77..053847b6187f 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -905,6 +905,38 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 	if (copy_from_user(&eventreq, ip, sizeof(eventreq)))
 		return -EFAULT;
 
+	offset = eventreq.lineoffset;
+	lflags = eventreq.handleflags;
+	eflags = eventreq.eventflags;
+
+	if (offset >= gdev->ngpio)
+		return -EINVAL;
+
+	/* Return an error if a unknown flag is set */
+	if ((lflags & ~GPIOHANDLE_REQUEST_VALID_FLAGS) ||
+	    (eflags & ~GPIOEVENT_REQUEST_VALID_FLAGS))
+		return -EINVAL;
+
+	/* This is just wrong: we don't look for events on output lines */
+	if ((lflags & GPIOHANDLE_REQUEST_OUTPUT) ||
+	    (lflags & GPIOHANDLE_REQUEST_OPEN_DRAIN) ||
+	    (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE))
+		return -EINVAL;
+
+	/* PULL_UP and PULL_DOWN flags only make sense for input mode. */
+	if (!(lflags & GPIOHANDLE_REQUEST_INPUT) &&
+	    ((lflags & GPIOHANDLE_REQUEST_PULL_UP) ||
+	     (lflags & GPIOHANDLE_REQUEST_PULL_DOWN)))
+		return -EINVAL;
+
+	/*
+	 * Do not allow both pull-up and pull-down flags to be set as they
+	 *  are contradictory.
+	 */
+	if ((lflags & GPIOHANDLE_REQUEST_PULL_UP) &&
+	    (lflags & GPIOHANDLE_REQUEST_PULL_DOWN))
+		return -EINVAL;
+
 	le = kzalloc(sizeof(*le), GFP_KERNEL);
 	if (!le)
 		return -ENOMEM;
@@ -922,30 +954,6 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 		}
 	}
 
-	offset = eventreq.lineoffset;
-	lflags = eventreq.handleflags;
-	eflags = eventreq.eventflags;
-
-	if (offset >= gdev->ngpio) {
-		ret = -EINVAL;
-		goto out_free_label;
-	}
-
-	/* Return an error if a unknown flag is set */
-	if ((lflags & ~GPIOHANDLE_REQUEST_VALID_FLAGS) ||
-	    (eflags & ~GPIOEVENT_REQUEST_VALID_FLAGS)) {
-		ret = -EINVAL;
-		goto out_free_label;
-	}
-
-	/* This is just wrong: we don't look for events on output lines */
-	if ((lflags & GPIOHANDLE_REQUEST_OUTPUT) ||
-	    (lflags & GPIOHANDLE_REQUEST_OPEN_DRAIN) ||
-	    (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE)) {
-		ret = -EINVAL;
-		goto out_free_label;
-	}
-
 	desc = &gdev->descs[offset];
 	ret = gpiod_request(desc, le->label);
 	if (ret)
@@ -955,6 +963,10 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 
 	if (lflags & GPIOHANDLE_REQUEST_ACTIVE_LOW)
 		set_bit(FLAG_ACTIVE_LOW, &desc->flags);
+	if (lflags & GPIOHANDLE_REQUEST_PULL_DOWN)
+		set_bit(FLAG_PULL_DOWN, &desc->flags);
+	if (lflags & GPIOHANDLE_REQUEST_PULL_UP)
+		set_bit(FLAG_PULL_UP, &desc->flags);
 
 	ret = gpiod_direction_input(desc);
 	if (ret)
-- 
2.23.0

