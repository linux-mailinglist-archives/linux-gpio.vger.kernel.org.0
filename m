Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF41944DC77
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Nov 2021 21:25:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233625AbhKKU2C (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Nov 2021 15:28:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233717AbhKKU2A (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Nov 2021 15:28:00 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 975E4C06120A
        for <linux-gpio@vger.kernel.org>; Thu, 11 Nov 2021 12:25:10 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id o29so6066537wms.2
        for <linux-gpio@vger.kernel.org>; Thu, 11 Nov 2021 12:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z2g/uVLpdJOSWBXqMKJurgcvfEliD2/GKX54HgxUsmE=;
        b=sXosC0JyM9mFRFos9YzDDaYdi7N/7yvazPRDLR4HN8jLI5n4fZ5OQcLY3yQcYr2nVP
         /drAOKgofSS0WSKiFzuaepOPMufEL3lyz6Kc4JUy4cE67FxWI2MHvhZo7Hqu1wKMygCI
         KMM0S03NtEoO6S4xHhLCLvmPogpvW/RSRqFa0pkKnkGN0ZFsTQKLJM0Dpqc7G5rRg1Kg
         J8jGPaebIXX0alFp1nIjCbcSHePdX76oIl9lMp6sthtokfKYwkZkxkSQTvOqaqK1V3kn
         IcYMdfxUy8fihIxecv1uQc9pAVZgFq4id/9yTqPc15wbzGMrx1K33F34PJaiXAR7GprY
         j2hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z2g/uVLpdJOSWBXqMKJurgcvfEliD2/GKX54HgxUsmE=;
        b=RBGY8fUfHZkzbjqefaoeiIU4ezTKjHrMXH8or9TNfykHR6W9UyIrXgsAbxDLu4XVvJ
         As1alrYAmQL4HGwQc0JHHrAM4J9MH2DUXjPE55Sp1kly3baolU1QlNkJm/ejrBQLT5Vh
         WQLExQD+ghItUyxQSBGGRSlIdiJZlLIMFLscdVP9WnijeDpSclIGZAtk3Xs91sEi/1Ps
         zZ5tjt/QB+oF3v/nYbgRs8CwGR4K4j7ftkVFWkCQ7YG5FUgl+ZpH/9n9rGBZ3ZIODC4g
         n6/BNTpPvpFHerIdAjadPFYFi5m+sytay2Q1xT3rrCVGRaKn8feObqacrnQ2OE4kDim8
         unTg==
X-Gm-Message-State: AOAM532Iw1gAlnMDItcd+1vLl/rclTfM6EGbHmmxNBYpxHXx817F8NU1
        uJ8EhQFW6XCq3iZEg7P3WMHGiA==
X-Google-Smtp-Source: ABdhPJzaKgQmDjIBXNK9Fgmf/8ZmpNzCoWrisU/a/Wem9g0P1PExpNx0EIaI0t0ljbftCuM6C7tIEg==
X-Received: by 2002:a1c:1b15:: with SMTP id b21mr10916878wmb.174.1636662309190;
        Thu, 11 Nov 2021 12:25:09 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id t11sm3819907wrz.97.2021.11.11.12.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 12:25:08 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH RFC 2/2] gpiolib: check the 'ngpios' property in core gpiolib code
Date:   Thu, 11 Nov 2021 21:25:06 +0100
Message-Id: <20211111202506.19459-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20211111202506.19459-1-brgl@bgdev.pl>
References: <20211111202506.19459-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Several drivers read the 'ngpios' device property on their own, but
since it's defined as a standard GPIO property in the device tree bindings
anyway, it's a good candidate for generalization. If the driver didn't
set its gc->ngpio, try to read the 'ngpios' property from the GPIO
device's firmware node before bailing out.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 4c34c96ef136..23b0478163d4 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -598,6 +598,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	struct gpio_device *gdev;
 	unsigned long flags;
 	unsigned int i;
+	u32 ngpios;
 
 	/*
 	 * First: allocate and populate the internal stat container, and
@@ -646,9 +647,15 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	}
 
 	if (gc->ngpio == 0) {
-		chip_err(gc, "tried to insert a GPIO chip with zero lines\n");
-		ret = -EINVAL;
-		goto err_free_descs;
+		ret = fwnode_property_read_u32(gdev->dev.fwnode, "ngpios",
+					       &ngpios);
+		if (ret == 0) {
+			gc->ngpio = ngpios;
+		} else {
+			chip_err(gc, "tried to insert a GPIO chip with zero lines\n");
+			ret = -EINVAL;
+			goto err_free_descs;
+		}
 	}
 
 	if (gc->ngpio > FASTPATH_NGPIO)
-- 
2.30.1

