Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55D633DBAEF
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 16:44:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238909AbhG3OoI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jul 2021 10:44:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239185AbhG3OoG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jul 2021 10:44:06 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB374C061765
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 07:44:00 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id m19so6159328wms.0
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 07:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Luvvhav28WCtIao69tSg6PQqZIFcHGyK6Ef4arPcXeE=;
        b=ISTeJVaa5RHuNw27vyD310AXoLcgk+DTqe4dQDJwR3wAeWZy3FQQ6Wvzx1AqcbEw7K
         oC5NSXHAefpmVKu2UpyHjr0vGRJlapvpib3nJ0bD5kW3jcnblQJDIaYFC0XddNOevmuo
         Xsk5VVYBsAosRejJlGluyzVcDulb2Tc3MH8ZSFMi7lZVYlw1kQX15mPpLxkRiH0Wyv1J
         MpVPxMGyC/9c2GH/B6vs4JAdZyNa7aoXY0Za2HJPn5dsm2rlwQ5V+FswZlee2hNRYvBz
         Hfx3N2F/CGxI/h/zt/lBE/3hrCQgw6j13lywiDXy69ryWuLIMW8pE4GLqk9L5qUafzgP
         jEdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Luvvhav28WCtIao69tSg6PQqZIFcHGyK6Ef4arPcXeE=;
        b=Mmwcq/UssrnPDzMu4plgRokL+h3fGav3pMIDAR3SX3fMi5mszKJVNFUwZZqFThvouw
         W/lF6R3s+dBsxKspLnzfKEuB2XGEok63HZisapGggfN03RIJWgxdwi4BJeB9g4P8G9DX
         zMwgYJN6NuCptgBbeY41N625o7f5wAW8YdQXpXiU8wCz86MA9UMeDF5QRFp6H1LfwXog
         OWYQQt1D8xJ/YApqEwNb58Y2LCYUZWdqxUCTa0ZPilypGDmYlbjqjH0NF6wNh0OVnWAf
         ZE/yEXq/ZqR+PJpKqAWoG27RAGWqVZyYjmzKFpzohWm/Q1oKH8ZDO7wn5R0xczo0Fw9w
         U/yA==
X-Gm-Message-State: AOAM530Mwbp2xQijVEOn1GNkFVd8H9adA5/vfaw6mopJR1A8U+8bhual
        3QUFY14IhIOdNEasxXI70sX8QQ==
X-Google-Smtp-Source: ABdhPJyFHSReEKi80BTpiaxa/F5RT4dU2CRvTBOw+o7gKDkKQFebyzgl7vLQJBNPMSc6jCXaVGBaNw==
X-Received: by 2002:a1c:7515:: with SMTP id o21mr3465512wmc.65.1627656239595;
        Fri, 30 Jul 2021 07:43:59 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id o29sm1825029wms.13.2021.07.30.07.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 07:43:59 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Ben Hutchings <ben.hutchings@essensium.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod v2][PATCH 2/3] line-info: provide gpiod_line_info_get_event_clock()
Date:   Fri, 30 Jul 2021 16:43:55 +0200
Message-Id: <20210730144356.23079-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210730144356.23079-1-brgl@bgdev.pl>
References: <20210730144356.23079-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Provide a new getter for the line-info object that becomes the
counterpart for the setter used to configure the event clock type with
line_config. It allows to check which even clock the line uses for
edge detection.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 include/gpiod.h | 18 ++++++++++++++++++
 lib/line-info.c | 11 +++++++++++
 2 files changed, 29 insertions(+)

diff --git a/include/gpiod.h b/include/gpiod.h
index d3c327b..4506571 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -245,6 +245,16 @@ enum {
 	/**< Line detects both rising and falling edge events. */
 };
 
+/**
+ * @brief Possible event clock settings.
+ */
+enum {
+	GPIOD_LINE_EVENT_CLOCK_MONOTONIC = 1,
+	/**< Line uses the monotonic clock for edge event timestamps. */
+	GPIOD_LINE_EVENT_CLOCK_REALTIME,
+	/**< Line uses the realtime clock for edge event timestamps. */
+};
+
 /**
  * @brief Free a line info object and release all associated resources.
  * @param info GPIO line info object to free.
@@ -333,6 +343,14 @@ int gpiod_line_info_get_drive(struct gpiod_line_info *info);
  */
 int gpiod_line_info_get_edge_detection(struct gpiod_line_info *info);
 
+/**
+ * @brief Read the current event clock setting used for edge event timestamps.
+ * @param info GPIO line info object.
+ * @return Returns GPIOD_LINE_EVENT_CLOCK_MONOTONIC or
+ *         GPIOD_LINE_EVENT_CLOCK_REALTIME.
+ */
+int gpiod_line_info_get_event_clock(struct gpiod_line_info *info);
+
 /**
  * @brief Check if this line is debounced (either by hardware or by the kernel
  *        software debouncer).
diff --git a/lib/line-info.c b/lib/line-info.c
index aed8bee..0280981 100644
--- a/lib/line-info.c
+++ b/lib/line-info.c
@@ -17,6 +17,7 @@ struct gpiod_line_info {
 	int bias;
 	int drive;
 	int edge;
+	int event_clock;
 	bool debounced;
 	unsigned long debounce_period;
 };
@@ -86,6 +87,11 @@ GPIOD_API int gpiod_line_info_get_edge_detection(struct gpiod_line_info *info)
 	return info->edge;
 }
 
+GPIOD_API int gpiod_line_info_get_event_clock(struct gpiod_line_info *info)
+{
+	return info->event_clock;
+}
+
 GPIOD_API bool gpiod_line_info_is_debounced(struct gpiod_line_info *info)
 {
 	return info->debounced;
@@ -150,6 +156,11 @@ gpiod_line_info_from_kernel(struct gpio_v2_line_info *infobuf)
 	else
 		info->edge = GPIOD_LINE_EDGE_NONE;
 
+	if (infobuf->flags & GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME)
+		info->event_clock = GPIOD_LINE_EVENT_CLOCK_REALTIME;
+	else
+		info->event_clock = GPIOD_LINE_EVENT_CLOCK_MONOTONIC;
+
 	/*
 	 * We assume that the kernel returns correct configuration and that no
 	 * attributes repeat.
-- 
2.30.1

