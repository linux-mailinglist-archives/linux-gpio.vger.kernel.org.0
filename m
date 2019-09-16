Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32B65B376F
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Sep 2019 11:46:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729636AbfIPJq2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Sep 2019 05:46:28 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:35774 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729615AbfIPJq1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Sep 2019 05:46:27 -0400
Received: by mail-wr1-f65.google.com with SMTP id v8so2761873wrt.2
        for <linux-gpio@vger.kernel.org>; Mon, 16 Sep 2019 02:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hX0b7zC7u4DV3OF+QghzX3x2HnfB4enZLlboz/3QMWU=;
        b=KfDuj5Tw0d9lAA011CT56IlOxeT5+b42os5EcT1xOOoKs2ZS9keD0ad+1UskNMFL3X
         UkZFMGvHWE8Yeo8ZVG/CfLeVSKc/MB3Nn5V1CVFx13CyXY2DuKZr07r/4zfSmiqpHMXS
         j3GaSOvXnwKgS1g+/Vg6yBNUuJfsur2Iytnfs4e1JnhBxtF2MPASDsP/4Few/iP8as8N
         rezTO0l6hc5KJOFPHy39mW7646QvPtaI3KTilyStlfGnlDWQhBjwgOHIumN+BLFKCxsi
         941294jnJ1mAKM652I5pcyU0h2SqBgKheT+RZj+i5WQVR2oLJocq6Aw6TPzexSa+C+MD
         nfRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hX0b7zC7u4DV3OF+QghzX3x2HnfB4enZLlboz/3QMWU=;
        b=RP6K5cSqFVcliJOy8orfe6FUWGATzUo6E14SStAgafb/Sp1jW+l+461DVA9uE5b0Um
         A4XXrD2QOoglRb0r/Q6evro0eExz5pGoAwzSpvhU4UVvC0ivjDYqZ07/gv0CSwTjcFDa
         3Xum9YvwaP5MmmQ2VfIvxntrntODn2KsO/tB4Dh08jpEePCDH5zdzKIZvpO9QFkVwwdF
         lKpfgLMTUTFOmAqwVRUYvWSn1Miu7+9TKQAECqbHpzYGSAlaUlI1Bh0Cb+V/qjxf5G04
         J9Sh6cYUZSrZ2Oq1TB4iSfkqVNQHhWCyc9OEElWtbSP+lK/FJtoexeP6e0QCB9+7+B2X
         +6fg==
X-Gm-Message-State: APjAAAVPBGHh7cy8I2wbVs+n8Uk4LuxG0YaYNcmIC3M1XT0dIeNlfEhk
        OOy7F0L7NJ1JW3v71IhbEbHfaM8LYUE=
X-Google-Smtp-Source: APXvYqy8vo+FLXDSDTpi5E7qkxIeiJ6EwTo4fbKHUergwLitnTEA6T08YwwwN9PSmHTYFgN32oohKQ==
X-Received: by 2002:a5d:5403:: with SMTP id g3mr6821829wrv.338.1568627186233;
        Mon, 16 Sep 2019 02:46:26 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id r20sm1261251wmh.37.2019.09.16.02.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2019 02:46:25 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH] gpiolib: sanitize flags before allocating memory in lineevent_create()
Date:   Mon, 16 Sep 2019 11:46:23 +0200
Message-Id: <20190916094623.12125-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Move all the flags sanitization before any memory allocation in
lineevent_create() in order to remove a couple unneeded gotos.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpiolib.c | 42 ++++++++++++++++++------------------------
 1 file changed, 18 insertions(+), 24 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index d9074191edef..194b0bcdcfb7 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -899,6 +899,24 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 
 	if (copy_from_user(&eventreq, ip, sizeof(eventreq)))
 		return -EFAULT;
+	
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
 
 	le = kzalloc(sizeof(*le), GFP_KERNEL);
 	if (!le)
@@ -917,30 +935,6 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
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
-- 
2.21.0

