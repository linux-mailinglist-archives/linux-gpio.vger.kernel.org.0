Return-Path: <linux-gpio+bounces-5071-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4529789843D
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Apr 2024 11:36:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0B6D28A701
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Apr 2024 09:36:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A69A83CA5;
	Thu,  4 Apr 2024 09:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="gYZuhYkC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E904C82871
	for <linux-gpio@vger.kernel.org>; Thu,  4 Apr 2024 09:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712223221; cv=none; b=NXPQQXchh5B8c78HMCBPLHN1zTWVSHbqEu9K9FEDBXi+tYIz6Zxk10u1FlS3EAFcA3Q1Bb78tcczfZRam0DVYlgQvDaUKZ3x+iYcj3mApxaPn0EkTV6GLiQsrjDe4PaoCW5WMZS1V/4EKIbpnP5/kjbS8eIdUaDjvpaesBYV4R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712223221; c=relaxed/simple;
	bh=QikKFsZX5Z+SQME56UGEE4G7WVpkXWaJpct3ts0Ipc8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q88ByZMR+z/dT2GNUhOn3Gvw6ruGhoMnJbuVsrpLUy+mu95Qic2E4cv1CCc9/ztLL9YaVRcwlutr1TT5qffPvB+30Au/jiRRSN4RKioUI8nZIN4Tx/mB9KRH0ZE6km5aBQ8b4dHYIKjExSjPJW5/2vAtqlaIrkTSDtEFa6hXwxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=gYZuhYkC; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-343cfa6faf0so8392f8f.0
        for <linux-gpio@vger.kernel.org>; Thu, 04 Apr 2024 02:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1712223217; x=1712828017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qbnVrvd22lq0FsuqRTbRtCkxT8J8OwHTwKvqCj8JxUU=;
        b=gYZuhYkCmSQM23wfzmyDfHLLvPED4Wl4mOgWYUOe1wVSBG8B/BgZ+NmNjPplVkp28F
         PP7oTAv+NWWzoAJeQt8/SmhqlvRgBB5MB25APnFqIRLpX3cL5jj+AbhEWIB3pK4ACXXu
         NOWqg0SyEIBvy0j7uDNxmOCvbV46xBclFU2MxB9wKAcxKk8p2v7AJz0AJB6EYXjKl+11
         P46WvFau/yoB/ht+tVsB5ELkS5Y32fK9ANb9afde22CT3qdmYTjduXsjudZAw/DSlAP2
         R+OzRPorUxtLMYPgTZx1FHitg0vDQSnIGP1CglJPQiRwhuMNzukQvjjHJtGZWfqZUPz0
         c65w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712223217; x=1712828017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qbnVrvd22lq0FsuqRTbRtCkxT8J8OwHTwKvqCj8JxUU=;
        b=Jto/xq97viO0ItSaJaUNkIDJ4GTVuRoaRwqvsYC5wZKZqHhCZOnhjPBhbPNRFwQsNW
         tnNVZSPH9C29rJLJkOvoS9RV/QrkDRXteThdyy/07hxWRJCGtk3x4PQOJzFXbCewh0xd
         z9T/XRj6ZJhxIpdaIxvBFzojjNjl0xqu+0cwB4B5MHsDtakpJt/kPbUAbaIhH5cy169C
         TWz7mct9Xi8ysqyOV48q+d6JLJofTx/YboNrCpsV01DPfY5TxgIOjD7oC13CHSaD+RD4
         Hw8ARASomZImXjY/fvfRUl+EpZZMoIrcJM5tCI3nByqIXyYEUykM1oEPAl94KAvrh/Ou
         B8gw==
X-Gm-Message-State: AOJu0Yyeb8a74Kasf4V+t449dQNExtUi7aJk/umGQXvj5TiBUGXA42xG
	3Rg3EQ3s5l95gzBHU6rZE3B75fWL3sEjaDRFGodt4iy2hkEoGsDcsgyextc13CQ=
X-Google-Smtp-Source: AGHT+IH4Xuhodhs7j0LM3R9BjUEjQahSlYUFbtB6dhoYLc15+hktejYI24fxveoEX5zCL0O3Jf423g==
X-Received: by 2002:a5d:568a:0:b0:33e:cf4d:c583 with SMTP id f10-20020a5d568a000000b0033ecf4dc583mr1724153wrv.16.1712223217370;
        Thu, 04 Apr 2024 02:33:37 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:220a:565e:2927:8cf0])
        by smtp.gmail.com with ESMTPSA id dj13-20020a0560000b0d00b0033e9fca1e49sm19436385wrb.60.2024.04.04.02.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 02:33:36 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexey Dobriyan <adobriyan@gmail.com>,
	stable@vger.kernel.org,
	Stefan Wahren <wahrenst@gmx.net>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 2/2] gpio: cdev: fix missed label sanitizing in debounce_setup()
Date: Thu,  4 Apr 2024 11:33:28 +0200
Message-Id: <20240404093328.21604-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240404093328.21604-1-brgl@bgdev.pl>
References: <20240404093328.21604-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kent Gibson <warthog618@gmail.com>

When adding sanitization of the label, the path through
edge_detector_setup() that leads to debounce_setup() was overlooked.
A request taking this path does not allocate a new label and the
request label is freed twice when the request is released, resulting
in memory corruption.

Add label sanitization to debounce_setup().

Cc: stable@vger.kernel.org
Fixes: b34490879baa ("gpio: cdev: sanitize the label before requesting the interrupt")
Signed-off-by: Kent Gibson <warthog618@gmail.com>
[Bartosz: rebased on top of the fix for empty GPIO labels]
Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-cdev.c | 47 +++++++++++++++++++++----------------
 1 file changed, 27 insertions(+), 20 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 1426cc1c4a28..6fe978535047 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -728,6 +728,25 @@ static u32 line_event_id(int level)
 		       GPIO_V2_LINE_EVENT_FALLING_EDGE;
 }
 
+static inline char *make_irq_label(const char *orig)
+{
+	char *new;
+
+	if (!orig)
+		return NULL;
+
+	new = kstrdup_and_replace(orig, '/', ':', GFP_KERNEL);
+	if (!new)
+		return ERR_PTR(-ENOMEM);
+
+	return new;
+}
+
+static inline void free_irq_label(const char *label)
+{
+	kfree(label);
+}
+
 #ifdef CONFIG_HTE
 
 static enum hte_return process_hw_ts_thread(void *p)
@@ -1015,6 +1034,7 @@ static int debounce_setup(struct line *line, unsigned int debounce_period_us)
 {
 	unsigned long irqflags;
 	int ret, level, irq;
+	char *label;
 
 	/* try hardware */
 	ret = gpiod_set_debounce(line->desc, debounce_period_us);
@@ -1037,11 +1057,17 @@ static int debounce_setup(struct line *line, unsigned int debounce_period_us)
 			if (irq < 0)
 				return -ENXIO;
 
+			label = make_irq_label(line->req->label);
+			if (IS_ERR(label))
+				return -ENOMEM;
+
 			irqflags = IRQF_TRIGGER_FALLING | IRQF_TRIGGER_RISING;
 			ret = request_irq(irq, debounce_irq_handler, irqflags,
 					  line->req->label, line);
-			if (ret)
+			if (ret) {
+				free_irq_label(label);
 				return ret;
+			}
 			line->irq = irq;
 		} else {
 			ret = hte_edge_setup(line, GPIO_V2_LINE_FLAG_EDGE_BOTH);
@@ -1083,25 +1109,6 @@ static u32 gpio_v2_line_config_debounce_period(struct gpio_v2_line_config *lc,
 	return 0;
 }
 
-static inline char *make_irq_label(const char *orig)
-{
-	char *new;
-
-	if (!orig)
-		return NULL;
-
-	new = kstrdup_and_replace(orig, '/', ':', GFP_KERNEL);
-	if (!new)
-		return ERR_PTR(-ENOMEM);
-
-	return new;
-}
-
-static inline void free_irq_label(const char *label)
-{
-	kfree(label);
-}
-
 static void edge_detector_stop(struct line *line)
 {
 	if (line->irq) {
-- 
2.40.1


