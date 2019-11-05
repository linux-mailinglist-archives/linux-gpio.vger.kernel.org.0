Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77F5AEF33B
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 03:05:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729784AbfKECFQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Nov 2019 21:05:16 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:39682 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729524AbfKECFQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Nov 2019 21:05:16 -0500
Received: by mail-pf1-f193.google.com with SMTP id x28so10742243pfo.6
        for <linux-gpio@vger.kernel.org>; Mon, 04 Nov 2019 18:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fw2PW7qNL/6bRnNXL8/vV6sHrljxoktUhGM7caUNnrw=;
        b=jOWot4rKyzGEmhv9bJuCFXFt1DRz1fEpj01NcUAfgrIdLaiNTkq3zwlJ60HeUezINK
         w7AsKIR2LTU3TOjYcvqhLwObuJwIdyU2ybT1WkrFzca64fx6cBtIwqrh6Dazs1hsuH/j
         E25Ru/xgeVQxPP0UMw7AAEOja2hdYMoMgbKQYbSk5P67JXUxj++NHtzmzVy9mFsrEw85
         O+An/5CEE17fBXR39A5PqyNOGHGQDgK0qoDIotxMD1TUMKirfHgORcHddg/CW5dvhk6N
         IypWmPUAwia8D+RWkkhQuGzkcvwiIHUIyG78OCr2VkLKjss2MA5R9cOCVOJ0xRsrjEub
         ARrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fw2PW7qNL/6bRnNXL8/vV6sHrljxoktUhGM7caUNnrw=;
        b=AjYMC9919DZrfJW84kIUF8WMZL6DMHEqhvcg7XTVcWMzC3TKS/ONaTosZ39jDz8F2B
         b+HYeqMklwVoAf0AllzOomBAgN7KhnUs/n6PthXSof7FEOzuRBEchxSScqUAkbEH95MM
         LzqNq7j5ubbRiUEW+UVpImYIBJOSyJX83P7JVGtXZlpF0JIShSC0gohBtYY9jyvjSCMF
         PYgdcbiRrBSNz0gTKDZ9UTo4ydmCME7TuPpU8fDK71A/8vDO994bgkyLsARzCaRsO2t3
         WjGS5uTPSPNREwYiTwkWLhUOZng8ZFI93uTJ8tDLuZKLlY5U0wP7RsBiBk5aXkUGcENM
         uqIA==
X-Gm-Message-State: APjAAAVeVWxGs4u53Wp+4AsZVNfJCuaTANiBYP1kcVAp1CqnbabQb7x0
        uYUsaXKCtqm+g+tYFuACUB7+qAFptF+GPA==
X-Google-Smtp-Source: APXvYqzvbuxxCusV6mKeCseY8IEJ6YX1WiSi6M+JhhmXh1gw4VYZsDE8p6Qngd2mXC5cL1fMN3AZhQ==
X-Received: by 2002:a63:955a:: with SMTP id t26mr29738134pgn.280.1572919513496;
        Mon, 04 Nov 2019 18:05:13 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id r184sm11641909pfc.106.2019.11.04.18.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 18:05:12 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        linus.walleij@linaro.org, bamv2005@gmail.com
Cc:     drew@pdp7.com, thomas.petazzoni@bootlin.com,
        Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v6 6/7] gpiolib: move validation of line handle flags into helper function
Date:   Tue,  5 Nov 2019 10:04:28 +0800
Message-Id: <20191105020429.18942-7-warthog618@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191105020429.18942-1-warthog618@gmail.com>
References: <20191105020429.18942-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Move validation of line handle flags into helper function.
This reduces the size and complexity of linehandle_create and allows the
validation to be reused elsewhere.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib.c | 93 +++++++++++++++++++++++-------------------
 1 file changed, 51 insertions(+), 42 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index f852ff60ae6e..8d6e5dd3d1cf 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -428,6 +428,54 @@ struct linehandle_state {
 	GPIOHANDLE_REQUEST_OPEN_DRAIN | \
 	GPIOHANDLE_REQUEST_OPEN_SOURCE)
 
+static int linehandle_validate_flags(u32 flags)
+{
+	/* Return an error if an unknown flag is set */
+	if (flags & ~GPIOHANDLE_REQUEST_VALID_FLAGS)
+		return -EINVAL;
+
+	/*
+	 * Do not allow both INPUT & OUTPUT flags to be set as they are
+	 * contradictory.
+	 */
+	if ((flags & GPIOHANDLE_REQUEST_INPUT) &&
+	    (flags & GPIOHANDLE_REQUEST_OUTPUT))
+		return -EINVAL;
+
+	/*
+	 * Do not allow OPEN_SOURCE & OPEN_DRAIN flags in a single request. If
+	 * the hardware actually supports enabling both at the same time the
+	 * electrical result would be disastrous.
+	 */
+	if ((flags & GPIOHANDLE_REQUEST_OPEN_DRAIN) &&
+	    (flags & GPIOHANDLE_REQUEST_OPEN_SOURCE))
+		return -EINVAL;
+
+	/* OPEN_DRAIN and OPEN_SOURCE flags only make sense for output mode. */
+	if (!(flags & GPIOHANDLE_REQUEST_OUTPUT) &&
+	    ((flags & GPIOHANDLE_REQUEST_OPEN_DRAIN) ||
+	     (flags & GPIOHANDLE_REQUEST_OPEN_SOURCE)))
+		return -EINVAL;
+
+	/* Bias flags only allowed for input or output mode. */
+	if (!((flags & GPIOHANDLE_REQUEST_INPUT) ||
+	      (flags & GPIOHANDLE_REQUEST_OUTPUT)) &&
+	    ((flags & GPIOHANDLE_REQUEST_BIAS_DISABLE) ||
+	     (flags & GPIOHANDLE_REQUEST_BIAS_PULL_UP) ||
+	     (flags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN)))
+		return -EINVAL;
+
+	/* Only one bias flag can be set. */
+	if (((flags & GPIOHANDLE_REQUEST_BIAS_DISABLE) &&
+	     (flags & (GPIOHANDLE_REQUEST_BIAS_PULL_DOWN |
+			GPIOHANDLE_REQUEST_BIAS_PULL_UP))) ||
+	    ((flags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN) &&
+	     (flags & GPIOHANDLE_REQUEST_BIAS_PULL_UP)))
+		return -EINVAL;
+
+	return 0;
+}
+
 static long linehandle_ioctl(struct file *filep, unsigned int cmd,
 			     unsigned long arg)
 {
@@ -529,48 +577,9 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 
 	lflags = handlereq.flags;
 
-	/* Return an error if an unknown flag is set */
-	if (lflags & ~GPIOHANDLE_REQUEST_VALID_FLAGS)
-		return -EINVAL;
-
-	/*
-	 * Do not allow both INPUT & OUTPUT flags to be set as they are
-	 * contradictory.
-	 */
-	if ((lflags & GPIOHANDLE_REQUEST_INPUT) &&
-	    (lflags & GPIOHANDLE_REQUEST_OUTPUT))
-		return -EINVAL;
-
-	/*
-	 * Do not allow OPEN_SOURCE & OPEN_DRAIN flags in a single request. If
-	 * the hardware actually supports enabling both at the same time the
-	 * electrical result would be disastrous.
-	 */
-	if ((lflags & GPIOHANDLE_REQUEST_OPEN_DRAIN) &&
-	    (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE))
-		return -EINVAL;
-
-	/* OPEN_DRAIN and OPEN_SOURCE flags only make sense for output mode. */
-	if (!(lflags & GPIOHANDLE_REQUEST_OUTPUT) &&
-	    ((lflags & GPIOHANDLE_REQUEST_OPEN_DRAIN) ||
-	     (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE)))
-		return -EINVAL;
-
-	/* Bias flags only allowed for input or output mode. */
-	if (!((lflags & GPIOHANDLE_REQUEST_INPUT) ||
-	      (lflags & GPIOHANDLE_REQUEST_OUTPUT)) &&
-	    ((lflags & GPIOHANDLE_REQUEST_BIAS_DISABLE) ||
-	     (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_UP) ||
-	     (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN)))
-		return -EINVAL;
-
-	/* Only one bias flag can be set. */
-	if (((lflags & GPIOHANDLE_REQUEST_BIAS_DISABLE) &&
-	     (lflags & (GPIOHANDLE_REQUEST_BIAS_PULL_DOWN |
-			GPIOHANDLE_REQUEST_BIAS_PULL_UP))) ||
-	    ((lflags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN) &&
-	     (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_UP)))
-		return -EINVAL;
+	ret = linehandle_validate_flags(lflags);
+	if (ret)
+		return ret;
 
 	lh = kzalloc(sizeof(*lh), GFP_KERNEL);
 	if (!lh)
-- 
2.23.0

