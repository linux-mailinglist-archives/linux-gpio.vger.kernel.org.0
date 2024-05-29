Return-Path: <linux-gpio+bounces-6848-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC308D3772
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 15:21:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1F205B25610
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 13:21:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E9EF107A9;
	Wed, 29 May 2024 13:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NRxTGocS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B1F17BAB;
	Wed, 29 May 2024 13:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716988854; cv=none; b=nWyVox0vgybc9uZXLvZKCUnk/dTBRRzbFEW1aYq+boIaqX3InP3S5+BjSbXv5M+P6jhRu7CcypCmd+BiEsPbkNZ21SUqQw/Djt/A+zXicALxxPbAiVtEbFFIoLjOBu9Ppnsp/GO1K0Ouk5wmgf9X18rLd/aF+m7sruiFMXKB+1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716988854; c=relaxed/simple;
	bh=aCFo+HiXciqO0WUakvM7h85kLLVZO69EHYlXJLQrl4s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lNJdKcQTrL8yRhS58xRBP4IX4bjlALukLCLKw/ukJ21vnWWFFjXxOLHLfu3J+pD6wqDbswm6cxOaoDuNLML7w7kNzVpEBZu5qbTHnP0h+o5E9Lmg4a46figU+7EoO+XLGOnttbP6srlSaxJeK6ZWShzMz0xT6tK9kUb0q3Z21KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NRxTGocS; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7022cabdc0aso14755b3a.1;
        Wed, 29 May 2024 06:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716988852; x=1717593652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ZOr6a7LSObd/CX+qTtuisaH25RwcFQcUhPSvOG66+M=;
        b=NRxTGocS9Gt0ClqGMzHHrEfSXoVW7xaVy4UjYVvLhODmLpseWwpvVby1IVuJN542fu
         mQ1Y9WnxD7InX9uJpwBRwGLVOJzpGY6XOptZlfVT0rHteeKRuDfrfi1RqrXvx/kNw1FT
         xf+W+zC/QVAM0huPxznguxmFgSJEtF1zNZCPlkRrMrDuAX7kHX9/0SVlrDwBHzNIYcv2
         b2b7wUeDXgzt/LU6B4jdy/tNEYvRBV6KsuMXxRbgkUWa/xUulRNePEKLBRxM/5jAqpi9
         OArJ9d2O0Sw2YR/YRhCRomskQGUy0wmko2o/oGWHuGk8YNySoNPEHiW14SrTPWkmW7NG
         wwpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716988852; x=1717593652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ZOr6a7LSObd/CX+qTtuisaH25RwcFQcUhPSvOG66+M=;
        b=lwI/5FJaOekcrZqXk3kPya1MkQsmMBb1NMd2YARYr1sISwz3/7Cn8Xi0rxbfXlJ669
         fARHaHcILelRvMzcgXeXIZlxMwnsLg1lIVb1c9mvirkRwy2E5hO0KRZQS8E5sYE9B9w2
         IAGgX+kEyRDw1Tqj/DiJqIerdX4Oe7+/V7yNK6+ZXUQofboRkm9b3Pum9yhgjFXKgWiq
         KdT1dAUd/ZhBxUJG9SGEvON4blyhg8PgabZ8PNE2iaCTtnrNbfQV3iPBUpvdMkcyHvxr
         CnVlSA1eq+iMjDy7DoR2JQcWnq0QeqgdN5nUx7s/ctqGm7ahPd3aFOHiAQ7e4XzBP2Pe
         WfKw==
X-Forwarded-Encrypted: i=1; AJvYcCXwtQt0u2XLzAjS4JEEmWlf+u1qUCm2JmDzzpNb9VsDpb8/2JDZqZSYuSMs6OdWxlfLkOTwmw8fVQgMD9Z3Bw5n5Aj4EnjEx742Zg==
X-Gm-Message-State: AOJu0YwzxLNXBtWmijzCAH05xeN/eWb3ZlOXsx38cGKTCgNcTih+MEqU
	85HDmgg2Oal6AbzDxm+P+m81L+jIHhwiazWIhY0w5AkYUeNJ0QO9MGpkOA==
X-Google-Smtp-Source: AGHT+IFRcMRbDuD563FezoOQcQ257iLk4YBYxkwICvWox1goWIt7PQIHXeosx9gFT3I9YiV7UN0EWg==
X-Received: by 2002:a05:6a21:78a2:b0:1af:9161:4048 with SMTP id adf61e73a8af0-1b259a091f3mr3491829637.1.1716988851757;
        Wed, 29 May 2024 06:20:51 -0700 (PDT)
Received: from rigel.home.arpa (194-223-191-29.tpgi.com.au. [194.223.191.29])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-682227f1838sm9121844a12.46.2024.05.29.06.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 06:20:51 -0700 (PDT)
From: Kent Gibson <warthog618@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	brgl@bgdev.pl,
	linus.walleij@linaro.org
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v2 2/3] gpiolib: cdev: Refactor allocation of linereq events kfifo
Date: Wed, 29 May 2024 21:19:52 +0800
Message-Id: <20240529131953.195777-3-warthog618@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240529131953.195777-1-warthog618@gmail.com>
References: <20240529131953.195777-1-warthog618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The allocation of the linereq events kfifo is performed in two separate
places.  Add a helper function to remove the duplication.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib-cdev.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index d4e47960cc98..c7218c9f2c5e 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -1128,6 +1128,14 @@ static void edge_detector_stop(struct line *line)
 	/* do not change line->level - see comment in debounced_value() */
 }

+static int edge_detector_fifo_init(struct linereq *req)
+{
+	if (kfifo_initialized(&req->events))
+		return 0;
+
+	return kfifo_alloc(&req->events, req->event_buffer_size, GFP_KERNEL);
+}
+
 static int edge_detector_setup(struct line *line,
 			       struct gpio_v2_line_config *lc,
 			       unsigned int line_idx, u64 edflags)
@@ -1139,9 +1147,8 @@ static int edge_detector_setup(struct line *line,
 	char *label;

 	eflags = edflags & GPIO_V2_LINE_EDGE_FLAGS;
-	if (eflags && !kfifo_initialized(&line->req->events)) {
-		ret = kfifo_alloc(&line->req->events,
-				  line->req->event_buffer_size, GFP_KERNEL);
+	if (eflags) {
+		ret = edge_detector_fifo_init(line->req);
 		if (ret)
 			return ret;
 	}
@@ -1193,8 +1200,6 @@ static int edge_detector_update(struct line *line,
 				struct gpio_v2_line_config *lc,
 				unsigned int line_idx, u64 edflags)
 {
-	u64 eflags;
-	int ret;
 	u64 active_edflags = READ_ONCE(line->edflags);
 	unsigned int debounce_period_us =
 			gpio_v2_line_config_debounce_period(lc, line_idx);
@@ -1210,14 +1215,9 @@ static int edge_detector_update(struct line *line,
 		 * ensure event fifo is initialised if edge detection
 		 * is now enabled.
 		 */
-		eflags = edflags & GPIO_V2_LINE_EDGE_FLAGS;
-		if (eflags && !kfifo_initialized(&line->req->events)) {
-			ret = kfifo_alloc(&line->req->events,
-					  line->req->event_buffer_size,
-					  GFP_KERNEL);
-			if (ret)
-				return ret;
-		}
+		if (edflags & GPIO_V2_LINE_EDGE_FLAGS)
+			return edge_detector_fifo_init(line->req);
+
 		return 0;
 	}

--
2.39.2


