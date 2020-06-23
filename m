Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1FE1204856
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2020 06:04:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732344AbgFWEDW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Jun 2020 00:03:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732320AbgFWEDP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Jun 2020 00:03:15 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AFD0C061573;
        Mon, 22 Jun 2020 21:03:14 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id b7so646056pju.0;
        Mon, 22 Jun 2020 21:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gIH44XP+3+d8u/o5onM5jscJ417kAbas5Jl16ovp4QI=;
        b=QMxmJuYDSsMGB3THi0GFjsWzTVsTtKNeQWjpu++s0JBZgTJw/d9Z0lRU3ljYQjn5Hs
         08t5p8tjLUQvSV9s4enh2kw6ex9rvCfKwyXyzEnxHmti3gsye2etzlNYyAaAcVhOw+iu
         tpKfQsXSZOQnWWlw/WxtOr6VI6i9yb2CfXW+nTnZJKfRiWSo2/i6u1pLvQWRhkUHDPRp
         10FXo2Ms2sqVIUI/W0WTMwwmdi/6lZAuzS5ccLslonZInG716q9FPSLSHZLcLOHl5xHd
         iQnuzSEonnFrGbwOjuGPL3+ysZwnKqwkFyus8RNepnYWwAp0xsg8Na5FtgS6jePCHJrF
         hIjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gIH44XP+3+d8u/o5onM5jscJ417kAbas5Jl16ovp4QI=;
        b=lEAADc/LMFgY4MKn3UVXtlehKQSBirBxtIAvO6ejfWSXP0Yf7wcH/InJjXoU2F+HEV
         FzF8IECnjyViLqn0V4GCs4fvxzyfYlg+4+HRpCbui/PyA3TFthNrOKEKp61ISLTOKDLp
         p9NiqVMmMwRIFJncCZteIC4/O1vcTDyTBehwXH/CMNVIST81JzPG0ltFmnWGTsXupCnO
         iBzxggLED3Y6sW/yeKpF8s+/cgaDOhH/nXTBGGf4k8SLJYPO6QmH0kFrZTP4+gwau3SN
         zEx6EYCguco5k2CSlzHxhmuqOYy2/VdBnQCLeZG/9UpNw4NlTfDN6y49YXvK2WMY13Kf
         TrCw==
X-Gm-Message-State: AOAM533fK+4lUAQRgrU6twSsJT1y3KXqoCS9jjFcpIMnN1PHtbHuk4VI
        rKKzH3tibRYuaPY2nqaJXL6KfksVfss=
X-Google-Smtp-Source: ABdhPJyGwaSdjarOKsLbDjq6OvTWMzjLgHBCihVIyMjePQDTnc7tAGJ3lTxKgumy0S5EiUEDeKqNHw==
X-Received: by 2002:a17:90a:5c85:: with SMTP id r5mr21583673pji.40.1592884993354;
        Mon, 22 Jun 2020 21:03:13 -0700 (PDT)
Received: from sol.lan (220-235-126-59.dyn.iinet.net.au. [220.235.126.59])
        by smtp.gmail.com with ESMTPSA id n64sm12442315pga.38.2020.06.22.21.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 21:03:12 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 17/22] gpiolib: cdev: report edge detection in lineinfo
Date:   Tue, 23 Jun 2020 12:01:02 +0800
Message-Id: <20200623040107.22270-18-warthog618@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200623040107.22270-1-warthog618@gmail.com>
References: <20200623040107.22270-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Report the state of edge detection for a line in the gpioline_info_v2
returned by GPIO_GET_LINEINFO_V2_IOCTL, and indirectly for lines watched
by GPIO_GET_LINEINFO_WATCH_V2_IOCTL.

Signed-off-by: Kent Gibson <warthog618@gmail.com>

---
 drivers/gpio/gpiolib-cdev.c | 14 ++++++++++++++
 drivers/gpio/gpiolib.c      |  2 ++
 drivers/gpio/gpiolib.h      |  2 ++
 3 files changed, 18 insertions(+)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index d4a22d78953f..7ba0929b2741 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -566,6 +566,12 @@ static void edge_detector_stop(struct edge_detector *edet)
 static int edge_detector_setup(struct edge_detector *edet,
 			       struct gpioline_config *lc)
 {
+	struct gpio_desc *desc = edge_detector_desc(edet);
+
+	if (lc->edge_detection & GPIOLINE_EDGE_RISING)
+		set_bit(FLAG_EDGE_RISING, &desc->flags);
+	if (lc->edge_detection & GPIOLINE_EDGE_FALLING)
+		set_bit(FLAG_EDGE_FALLING, &desc->flags);
 	if (lc->edge_detection)
 		return edge_detector_start(edet);
 	return 0;
@@ -1574,6 +1580,14 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 	}
 
 	lc->edge_detection = 0;
+	if (test_bit(FLAG_EDGE_RISING, &desc->flags)) {
+		lc->flags |= GPIOLINE_FLAG_V2_EDGE_DETECTION;
+		lc->edge_detection |= GPIOLINE_EDGE_RISING;
+	}
+	if (test_bit(FLAG_EDGE_FALLING, &desc->flags)) {
+		lc->flags |= GPIOLINE_FLAG_V2_EDGE_DETECTION;
+		lc->edge_detection |= GPIOLINE_EDGE_FALLING;
+	}
 
 	spin_unlock_irqrestore(&gpio_lock, flags);
 }
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 517c99ddf6c8..a5f2795e17b7 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2041,6 +2041,8 @@ static bool gpiod_free_commit(struct gpio_desc *desc)
 		clear_bit(FLAG_PULL_UP, &desc->flags);
 		clear_bit(FLAG_PULL_DOWN, &desc->flags);
 		clear_bit(FLAG_BIAS_DISABLE, &desc->flags);
+		clear_bit(FLAG_EDGE_RISING, &desc->flags);
+		clear_bit(FLAG_EDGE_FALLING, &desc->flags);
 		clear_bit(FLAG_IS_HOGGED, &desc->flags);
 #ifdef CONFIG_OF_DYNAMIC
 		desc->hog = NULL;
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 2dee4e1e12dc..1dc6d2b191af 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -114,6 +114,8 @@ struct gpio_desc {
 #define FLAG_PULL_UP    13	/* GPIO has pull up enabled */
 #define FLAG_PULL_DOWN  14	/* GPIO has pull down enabled */
 #define FLAG_BIAS_DISABLE    15	/* GPIO has pull disabled */
+#define FLAG_EDGE_RISING     16	/* GPIO CDEV detects rising edge events */
+#define FLAG_EDGE_FALLING    17	/* GPIO CDEV detects falling edge events */
 
 	/* Connection label */
 	const char		*label;
-- 
2.27.0

