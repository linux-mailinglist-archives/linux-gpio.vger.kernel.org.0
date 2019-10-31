Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 845A6EB31B
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2019 15:49:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727990AbfJaOtB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 31 Oct 2019 10:49:01 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:40933 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727841AbfJaOtB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Oct 2019 10:49:01 -0400
Received: by mail-pl1-f193.google.com with SMTP id e3so689709plt.7
        for <linux-gpio@vger.kernel.org>; Thu, 31 Oct 2019 07:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H8ar5IOsC7difEPwk7MYWfDqH58Z8xE8CDFxr3/ifJs=;
        b=DhqUGCSdZqpf3HkyGptB6HNCFMp38b5IdcuuLhEmf0vesrMYOo2Zn0rW6R9ZenXLf5
         KF3RGJ7b0EcRwLWEhhnl7MIdZK7Ufbz72e8v2TWyWlii3dGzSWKoMukO+ZCbCWzljPrN
         p87jfmj9r6r8nDHhRD46SkITknm1+itZCVXXZI/XZwPVQC9n+F+CKibM1DBc55iTPKzu
         L+wqCUkS3HeDtGld5ng29QVxFc9avwml8w+WEdqa9oiS/DDrpLxngyx9nPlpItWM4K3x
         PWHTGjIXDf9YiJ6vFFHqyTz9R7mngDCa42PIWZ5+pd4WbpQMXOGXSNgfuKnMWthsY1L+
         FyAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H8ar5IOsC7difEPwk7MYWfDqH58Z8xE8CDFxr3/ifJs=;
        b=eaIG6mEJaGD4NZo9qIuRvwsLmP5vw0ELApKG6DpKaicDLa0EJjxudLF6jTP5mCu/TQ
         NsKdAl2vkR0aF0Z2gcuZj15NrCOmhnzmvrIwK9W2dXl21BpTzPp/9VWHm1CFTkzfzJUa
         tl25OvBpHu4xOc2/Elhq7KaB9fCLhwyz80w1m636akXD7aNaapHRzCfs4o9+SphIxDCZ
         n09ru2HLA5yaXh7XqBK+0dnPSXzouN6105zJraOpbehmk76BWFp53VGlDzkhDoSCHHhI
         A0xXELW3M82bajG9dakgICZie3a5ZCeInq6ZFEfc7vjOR/bTgf32+bwZgdrKQ5qc7umF
         U1/A==
X-Gm-Message-State: APjAAAVwxAU3/lFO8DwUyLPBeW9DjKK03jo07qr5LFrUtA/A8MyIF4Uh
        MHCffIf0iakNDE8j7/DCJjIafc2ZoICwBA==
X-Google-Smtp-Source: APXvYqxHF7rNxD9WUwfwlEJP5sENL6clgC2BaR7iidugj0uA1ROv9uu2ZkFbj35s+8BWa8X6tCzB7Q==
X-Received: by 2002:a17:902:bd06:: with SMTP id p6mr6460789pls.120.1572533340126;
        Thu, 31 Oct 2019 07:49:00 -0700 (PDT)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id y126sm4568456pfg.74.2019.10.31.07.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2019 07:48:59 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v2 1/2] gpiolib: move validation of line handle flags into helper function
Date:   Thu, 31 Oct 2019 22:48:24 +0800
Message-Id: <20191031144825.32105-2-warthog618@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191031144825.32105-1-warthog618@gmail.com>
References: <20191031144825.32105-1-warthog618@gmail.com>
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
index df27f05f9b8d..4e8fbd74a29c 100644
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

