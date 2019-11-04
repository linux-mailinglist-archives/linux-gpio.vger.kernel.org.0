Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65872EE40C
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2019 16:39:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729350AbfKDPjq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Nov 2019 10:39:46 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:39504 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729345AbfKDPjq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Nov 2019 10:39:46 -0500
Received: by mail-pf1-f196.google.com with SMTP id x28so9206248pfo.6
        for <linux-gpio@vger.kernel.org>; Mon, 04 Nov 2019 07:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PVF06suk+GS5QSDML5bLCCsO5ufmUnHDRZmiLrCd3J4=;
        b=YuVvIQPEoU+NVP+kfjbudXCbXF4kJvKzyxrxdB4QteyqiAfLUkZKJNSDSrXB+xybNR
         /IgZjjZNlx7MITZCV77oEa8RlTNh+7oHCLw058DgI7wmfcWJGYJFXb9zkxi3Q7rlpYTQ
         N7BZoPpdpQ3wUDbsKiH50hEgnI87kNe8cqwQYnLfCjzcyvjz1kCRggwRtKymGbbwBpF9
         xcoqwQp33Q+Vr2bg+698AlKGr3sOAovoVpLlMrXn6x76lfvZrf0ZrJTODbzjeLoOMe1Z
         C4IkqcPHc6go/VB76VZWd3mBKccymHoxPRUVWq4iGDGU2Ltu7zkKs46stSYtLB4bAsUD
         jiEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PVF06suk+GS5QSDML5bLCCsO5ufmUnHDRZmiLrCd3J4=;
        b=P2F8xd1/PRRqfCBfX/aTTu8RBW/QgRtouggvU5kajxnpF+6aykN5CLkqglFqrre62+
         IYl1uXYipVzPfwI8w2ntDYh2A0r5VsUO5AKBSKq0/ohK8A+YruMU/LJ4UNd9O7RPkn+L
         Go6dA/Br4t9LIupuyiNs81uWim1h6X910rQTih1Glx6QobHhFa5BLu9htvMftJG5jSm8
         ONnhgejiMRNuOwflTwEazqiR3FHKRBjo9jjHIRWMWfyYSonnJj5DCyTA1bo4I7BGkkfH
         n7uXDmSNKdfnexP/Z9reQHbzDR8OJSfncaQmdsBAAfFDThG8Qjz20Mnc8KIAyj982bDR
         YLzw==
X-Gm-Message-State: APjAAAVB/kRh8ZoYZha5PZ0pM4VJMCP7XQT/+n5nDDMa1V9ksiP5Dby+
        CpKo3n3v+ImOEDO99qGKcFrbCtwPdCR9AQ==
X-Google-Smtp-Source: APXvYqzL/SjRdKltoGZhpefGXoJF073+g1IuhThQXpAWzrks1HJJrSfhROSDsW88GGTHEB+GZCDbxA==
X-Received: by 2002:a63:4081:: with SMTP id n123mr4336543pga.444.1572881985188;
        Mon, 04 Nov 2019 07:39:45 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id a66sm5819761pfb.166.2019.11.04.07.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 07:39:44 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        linus.walleij@linaro.org, bamv2005@gmail.com
Cc:     drew@pdp7.com, thomas.petazzoni@bootlin.com,
        Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v5 6/7] gpiolib: move validation of line handle flags into helper function
Date:   Mon,  4 Nov 2019 23:38:40 +0800
Message-Id: <20191104153841.16911-7-warthog618@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191104153841.16911-1-warthog618@gmail.com>
References: <20191104153841.16911-1-warthog618@gmail.com>
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
index de08d1a4a3fb..dac1914155cc 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -427,6 +427,54 @@ struct linehandle_state {
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
@@ -528,48 +576,9 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 
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

