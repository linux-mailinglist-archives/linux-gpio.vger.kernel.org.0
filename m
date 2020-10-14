Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B801228DC14
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Oct 2020 10:55:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730242AbgJNIyg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Oct 2020 04:54:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727452AbgJNIyg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Oct 2020 04:54:36 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9FFDC04587D;
        Tue, 13 Oct 2020 23:29:32 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id ds1so931204pjb.5;
        Tue, 13 Oct 2020 23:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m8Vu+AjSbSKeBaM7oKUj4uXYWa8NW3k6+RiOkrCn5q8=;
        b=RdlINmbb4AVCuFSGfKKDVXDdHQTEdcFR7kig9SJtGD1McccS0vo2Rn09iR6egWMJOq
         2wf2yTkMrjuQ3SOKqiJnzEovbw0EibyXwEtKovZT6HG9ak6ZAXwwsCb5NcUtuDAv/oew
         7MUZw9f+NEhGluxgovarOl6K7zoX751zNJLgNOWsQmN/uJ2yaeWSWqOtXVl9VK9F58EP
         mw24lEvoDqYuxMZNhGjFuZXbOecWt5v7fN25wGVEzZm3wwuJ2IGoByWlnCibAWaD67iI
         A3Qch67vqDYSIY17iNiT+DOocf3sTurNWOrt3zLAZKGZp+eP2ZjfRliCFd6/c9XugNx9
         wAuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m8Vu+AjSbSKeBaM7oKUj4uXYWa8NW3k6+RiOkrCn5q8=;
        b=EiNEEMp3jZdEbbqXckUXCbVvu7Ch/XSDfy7s7x4u659RJp60HxvjfYwjGPHTNBRi8d
         qAr1SsExpHlP5Ia6/MxA5GP+XlBv5k4Pg5r5eLa4xoHTfDfFWWfqBMMEvuPsxPnqffM6
         AngVkjloW3EW2YjyHhNDIEDQJFQJomO87LYQS8zUYlYylcbtmx0FAVwYmPdfdFCD8ipJ
         NyrZQykiJFHFXjLlgVlB+DVIIWR0UtwaZ4rNJCrz7UnEAMJOw535YZr+VtyBzMdxbLZp
         e0pLyB7jTegWctKVUp/hfRYaLgnI3MEasFDbUIBPzWlenqUeau4lFpEbLinxWi9JjZIl
         zuZQ==
X-Gm-Message-State: AOAM532dfBaZb5E6rb/34fjFjNiPWAGGmtmVlhP2cUY/MrX7tQ/cjRlN
        MI4ZJU2M6ZcpMHNa5VvjixRBWPtwwjF1mA==
X-Google-Smtp-Source: ABdhPJz6luhYLvwWoxFig/8oFQqZwewaeY/h0SiQqCQ1eAIu9SZvHMiluLXheCeo54HfRIjsG2f+PQ==
X-Received: by 2002:a17:90a:a782:: with SMTP id f2mr2075621pjq.50.1602656972130;
        Tue, 13 Oct 2020 23:29:32 -0700 (PDT)
Received: from sol.lan (106-69-182-59.dyn.iinet.net.au. [106.69.182.59])
        by smtp.gmail.com with ESMTPSA id a9sm1612945pjm.40.2020.10.13.23.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 23:29:31 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v2] gpiolib: cdev: document that line eflags are shared
Date:   Wed, 14 Oct 2020 14:29:21 +0800
Message-Id: <20201014062921.79112-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The line.eflags field is shared so document this fact and highlight it
throughout using READ_ONCE() and WRITE_ONCE() accessors.

Also use a local copy of the eflags in edge_irq_thread() to ensure
consistent control flow even if eflags changes.  This is only a defensive
measure as edge_irq_thread() is currently disabled when the eflags are
changed.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---

Changes for v2:
 - fixed typo in commit comment.
 
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

