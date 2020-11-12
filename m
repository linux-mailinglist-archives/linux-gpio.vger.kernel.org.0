Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 373462B0379
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Nov 2020 12:07:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727986AbgKLLG5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Nov 2020 06:06:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727976AbgKLLGu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Nov 2020 06:06:50 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1B08C0613D4
        for <linux-gpio@vger.kernel.org>; Thu, 12 Nov 2020 03:06:49 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id 23so5926835wmg.1
        for <linux-gpio@vger.kernel.org>; Thu, 12 Nov 2020 03:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WAqmPOHRFqSMlXLiNxMATZKWDjI0pmaxH8q/sFjv5Mk=;
        b=d6G6vKJoVKuFnKXr9eM+rDK8sJN10HDjMy/r6Ui6UAuw4v09t4hEkezyGOtCVLoOP0
         4NrkiKnBV4G9SB058qWo7cudHYTCuQ6PPPxgj2lASMLzjzax5BVMCSUWjv3qZDLqbxOG
         EkiCelI8f7ckn2S5pQU1y+0kFNJSgxPQI9tsNFxATx1DEArMJpS5ZYYQwWEudXVrUDyC
         fv6b4pRI/x+04L24VWrh1kgEGQt5aE1ezCPA2g9trp1HE1w9q2aj2dUUpAE9uHav4EDV
         B900atrWy7h/thcOLburpwGzrcqOYoA/fJGH+iTPDHEkX/SgrROigl53C97pRjhZnMeS
         gw/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WAqmPOHRFqSMlXLiNxMATZKWDjI0pmaxH8q/sFjv5Mk=;
        b=BnrvXvig5jA9HMZBy+u6Yxe1+ieuVPo0juH3MknjOcSYpLNlM7I+dalEquAbKGrD7E
         8LzeD6e7kR8iHDcC+zH/7pf0mWbhjJPkptpRYVV18fwRfY49kMZEQkfcQuUGXO1fvuqR
         epDiAMha5VEIp+XemNfMVUzvygNXjI5YM7QRTs1Ndtmd2GxOWFH4HhkkBTN3sJQvlghW
         cpJysBMQFWPLONCoD4GE1ggmvQX3IijwSJXQ+fkHPwBf8qxWc4RNyz6v9JJLK8crDSLz
         zAzYVaXno22IC0wqs+N0WYqJesdn15T1IvzrIC4tocYczV5ToWY0ALGzQcOLp/6makBi
         /7ww==
X-Gm-Message-State: AOAM531G33qfQLB7/H0yyghuv6E7yteHY/mWLZWUJN+3KPm9vxpCdYBp
        dFxPgg2pZWNg9zruUu0v6ZmaEw==
X-Google-Smtp-Source: ABdhPJxvPr0NsqE6d9WNELZXUjibDdqMvTni4dLKlEOO1xvMoMi6JsboiWxcIkPoPLEwutw1uifLSg==
X-Received: by 2002:a05:600c:4147:: with SMTP id h7mr8902369wmm.186.1605179208545;
        Thu, 12 Nov 2020 03:06:48 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id q12sm5082413wrx.86.2020.11.12.03.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 03:06:48 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [libgpiod][PATCH 1/2] core: provide gpiod_line_bulk_clear()
Date:   Thu, 12 Nov 2020 12:06:41 +0100
Message-Id: <20201112110642.14903-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201112110642.14903-1-brgl@bgdev.pl>
References: <20201112110642.14903-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Provide a helper function that allows to reset an existing bulk object.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 include/gpiod.h | 6 ++++++
 lib/core.c      | 8 +++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/include/gpiod.h b/include/gpiod.h
index 8276f6a..7610eb1 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -649,6 +649,12 @@ gpiod_chip_find_lines(struct gpiod_chip *chip, const char **names) GPIOD_API;
  */
 struct gpiod_line_bulk *gpiod_line_bulk_new(unsigned int max_lines) GPIOD_API;
 
+/**
+ * @brief Reset a bulk object. Remove all lines and set size to 0.
+ * @param bulk Bulk object to reset.
+ */
+void gpiod_line_bulk_clear(struct gpiod_line_bulk *bulk) GPIOD_API;
+
 /**
  * @brief Release all resources allocated for this bulk object.
  * @param bulk Bulk object to free.
diff --git a/lib/core.c b/lib/core.c
index eb7d499..34f9017 100644
--- a/lib/core.c
+++ b/lib/core.c
@@ -106,12 +106,18 @@ struct gpiod_line_bulk *gpiod_line_bulk_new(unsigned int max_lines)
 	if (!bulk)
 		return NULL;
 
-	memset(bulk, 0, size);
 	bulk->max_lines = max_lines;
+	gpiod_line_bulk_clear(bulk);
 
 	return bulk;
 }
 
+void gpiod_line_bulk_clear(struct gpiod_line_bulk *bulk)
+{
+	bulk->num_lines = 0;
+	memset(bulk->lines, 0, bulk->max_lines * sizeof(struct line *));
+}
+
 void gpiod_line_bulk_free(struct gpiod_line_bulk *bulk)
 {
 	free(bulk);
-- 
2.29.1

