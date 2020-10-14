Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 700AA28DBD6
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Oct 2020 10:44:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727369AbgJNIok (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Oct 2020 04:44:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726655AbgJNIoi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Oct 2020 04:44:38 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D316C045872;
        Tue, 13 Oct 2020 23:14:40 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id az3so915609pjb.4;
        Tue, 13 Oct 2020 23:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vU3QvytPpHtbf9yc8gsF9TMtoXUu5z4Y0USqP8qEBzQ=;
        b=rh8LHnConGnaMhuWnvvi39r+f6oDapetaXGD9RBWlWpD5gVCjrZzlGMae29UUOFWwG
         5WSvV4ElwGPmjD7Opj0wRPanxzSIlxXtKMZs6idVIDi8VCVrXmf0VxcPfA00glGK4jyb
         MjecddnHy7bOAvgua3vjTya8ETbnd0jTYo+Y5Uw4UPArDMfhRqplPKvqnPYIyde5FNcO
         WB1ZfyCeaiPvtZy1njjTCHmvK6Rsp5y+AS+9tg5eCFwIur2xWEF+S4d6iWt6of39Vp9i
         ehXW4QC5MFbHKOyyHsvpwVY1tZsnnenNP+zOZ/U4uD1SHvYjWT0W4GkvxyfiDC7KXZH4
         jYUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vU3QvytPpHtbf9yc8gsF9TMtoXUu5z4Y0USqP8qEBzQ=;
        b=IdPoCrUxEjGSLIeJtvVnPO+9LL8LOoDorf0U17Upaj8QN8OJEKzoodXXDym3PEKo7n
         g+i3MB2Lk8Iq+2a9kY9dJvGnsGRnv+Fdjh4yesI6o930I5zpaCpNBklF1hpbv5Yxb7s9
         ASkKM6s5Se0F8EMO1ej4FNoOeNxQaz7DjxSP0dp6Ga5m3SQVhW/co2uQCpkhF4P3tkTh
         NARCiVTwgiaqzP+YhlpR8EFTW/bEiqKu28k2hW0ZJOv3WGCnU61cLCultUudM7CH8Mor
         w+nlGqRXtBD/fR1HMPIcG2tTPFTzUSIyL8ked66oE0FxLJMc9mdwkLTO/C7xJJkzv2wb
         bExA==
X-Gm-Message-State: AOAM530ORDjg+xMQrpNwBzjwsbRObNIHjAVJwnoBsMso520aw5QTgLsE
        1nSSaFzEhC4gjv35VgyhWOeNxSK4ya3tcA==
X-Google-Smtp-Source: ABdhPJyD7vZ4YhLmXDP4UCAtQFOWjA4gRo7am/gK9el3E8mIpK11ptPUMVfsnbjmfIBw3nhNNpMufg==
X-Received: by 2002:a17:90a:af88:: with SMTP id w8mr1977641pjq.156.1602656079603;
        Tue, 13 Oct 2020 23:14:39 -0700 (PDT)
Received: from sol.lan (106-69-182-59.dyn.iinet.net.au. [106.69.182.59])
        by smtp.gmail.com with ESMTPSA id b5sm1798067pfo.64.2020.10.13.23.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 23:14:38 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH] gpiolib: cdev: document that line eflags are shared
Date:   Wed, 14 Oct 2020 14:14:15 +0800
Message-Id: <20201014061415.76901-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The line.elags field is shared so document this fact and highlight it
throughout using READ_ONCE() and WRITE_ONCE() accessors.

Also use a local copy of the eflags in edge_irq_thread() to ensure
consistent control flow even if eflags changes.  This is only a defensive
measure as edge_irq_thread() is currently disabled when the eflags are
changed.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib-cdev.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 192721f829a3..678de9264617 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -428,6 +428,12 @@ struct line {
 	 */
 	struct linereq *req;
 	unsigned int irq;
+	/*
+	 * eflags is set by edge_detector_setup(), edge_detector_stop() and
+	 * edge_detector_update(), which are themselves mutually exclusive,
+	 * and is accessed by edge_irq_thread() and debounce_work_func(),
+	 * which can both live with a slightly stale value.
+	 */
 	u64 eflags;
 	/*
 	 * timestamp_ns and req_seqno are accessed only by
@@ -534,6 +540,7 @@ static irqreturn_t edge_irq_thread(int irq, void *p)
 	struct line *line = p;
 	struct linereq *lr = line->req;
 	struct gpio_v2_line_event le;
+	u64 eflags;
 
 	/* Do not leak kernel stack to userspace */
 	memset(&le, 0, sizeof(le));
@@ -552,8 +559,9 @@ static irqreturn_t edge_irq_thread(int irq, void *p)
 	}
 	line->timestamp_ns = 0;
 
-	if (line->eflags == (GPIO_V2_LINE_FLAG_EDGE_RISING |
-			     GPIO_V2_LINE_FLAG_EDGE_FALLING)) {
+	eflags = READ_ONCE(line->eflags);
+	if (eflags == (GPIO_V2_LINE_FLAG_EDGE_RISING |
+		       GPIO_V2_LINE_FLAG_EDGE_FALLING)) {
 		int level = gpiod_get_value_cansleep(line->desc);
 
 		if (level)
@@ -562,10 +570,10 @@ static irqreturn_t edge_irq_thread(int irq, void *p)
 		else
 			/* Emit high-to-low event */
 			le.id = GPIO_V2_LINE_EVENT_FALLING_EDGE;
-	} else if (line->eflags == GPIO_V2_LINE_FLAG_EDGE_RISING) {
+	} else if (eflags == GPIO_V2_LINE_FLAG_EDGE_RISING) {
 		/* Emit low-to-high event */
 		le.id = GPIO_V2_LINE_EVENT_RISING_EDGE;
-	} else if (line->eflags == GPIO_V2_LINE_FLAG_EDGE_FALLING) {
+	} else if (eflags == GPIO_V2_LINE_FLAG_EDGE_FALLING) {
 		/* Emit high-to-low event */
 		le.id = GPIO_V2_LINE_EVENT_FALLING_EDGE;
 	} else {
@@ -634,6 +642,7 @@ static void debounce_work_func(struct work_struct *work)
 	struct line *line = container_of(work, struct line, work.work);
 	struct linereq *lr;
 	int level;
+	u64 eflags;
 
 	level = gpiod_get_raw_value_cansleep(line->desc);
 	if (level < 0) {
@@ -647,7 +656,8 @@ static void debounce_work_func(struct work_struct *work)
 	WRITE_ONCE(line->level, level);
 
 	/* -- edge detection -- */
-	if (!line->eflags)
+	eflags = READ_ONCE(line->eflags);
+	if (!eflags)
 		return;
 
 	/* switch from physical level to logical - if they differ */
@@ -655,8 +665,8 @@ static void debounce_work_func(struct work_struct *work)
 		level = !level;
 
 	/* ignore edges that are not being monitored */
-	if (((line->eflags == GPIO_V2_LINE_FLAG_EDGE_RISING) && !level) ||
-	    ((line->eflags == GPIO_V2_LINE_FLAG_EDGE_FALLING) && level))
+	if (((eflags == GPIO_V2_LINE_FLAG_EDGE_RISING) && !level) ||
+	    ((eflags == GPIO_V2_LINE_FLAG_EDGE_FALLING) && level))
 		return;
 
 	/* Do not leak kernel stack to userspace */
@@ -755,7 +765,7 @@ static void edge_detector_stop(struct line *line)
 
 	cancel_delayed_work_sync(&line->work);
 	WRITE_ONCE(line->sw_debounced, 0);
-	line->eflags = 0;
+	WRITE_ONCE(line->eflags, 0);
 	/* do not change line->level - see comment in debounced_value() */
 }
 
@@ -774,7 +784,7 @@ static int edge_detector_setup(struct line *line,
 		if (ret)
 			return ret;
 	}
-	line->eflags = eflags;
+	WRITE_ONCE(line->eflags, eflags);
 	if (gpio_v2_line_config_debounced(lc, line_idx)) {
 		debounce_period_us = gpio_v2_line_config_debounce_period(lc, line_idx);
 		ret = debounce_setup(line, debounce_period_us);
@@ -817,13 +827,13 @@ static int edge_detector_update(struct line *line,
 	unsigned int debounce_period_us =
 		gpio_v2_line_config_debounce_period(lc, line_idx);
 
-	if ((line->eflags == eflags) && !polarity_change &&
+	if ((READ_ONCE(line->eflags) == eflags) && !polarity_change &&
 	    (READ_ONCE(line->desc->debounce_period_us) == debounce_period_us))
 		return 0;
 
 	/* sw debounced and still will be...*/
 	if (debounce_period_us && READ_ONCE(line->sw_debounced)) {
-		line->eflags = eflags;
+		WRITE_ONCE(line->eflags, eflags);
 		WRITE_ONCE(line->desc->debounce_period_us, debounce_period_us);
 		return 0;
 	}
-- 
2.28.0

