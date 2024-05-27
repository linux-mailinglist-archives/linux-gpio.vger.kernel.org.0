Return-Path: <linux-gpio+bounces-6644-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 348DB8CFF6D
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 13:55:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BF64FB24D8D
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 11:55:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8B0415DBB5;
	Mon, 27 May 2024 11:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nQYD9Ca2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA5813AA31;
	Mon, 27 May 2024 11:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716810924; cv=none; b=JXemSbVODmGbdlI+f7oIvkn5forzGrZtuqMAIdyc9brNMavsDq0DxBguAmk/KM4Qk7XlqKda5ZtKOnogBFQOXIquRnE9jfIxpyt42wOxYWfex+XbPbCeseWMp6cPGQOFMNYita81g88GAid6dhp/4HxoMz3Uw3pv9oO0UiwozM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716810924; c=relaxed/simple;
	bh=GvLaDcjKLfnwaJVSlLjzndx0IQJS/o8D81GqI6tIXLQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EGEWGSMO4SsagR8z1Z9nrDBRxT+6WCW4WvlJT1os7pHdc0b6X5faj2z3Bg+nH/omtCv2JsSJ/xyPettpckyZATaxamHFFuR4fpWj4ytajygyBrQNfOe2unWTuU+c8Tfk1q4gfZW3su0JInvm47l0u0kqebjipjH0SfAuUQK21Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nQYD9Ca2; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6f8e9878514so2419550b3a.1;
        Mon, 27 May 2024 04:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716810922; x=1717415722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ZOr6a7LSObd/CX+qTtuisaH25RwcFQcUhPSvOG66+M=;
        b=nQYD9Ca2vc7/H0yYKpFTYvaUDEgOmbHpYJc3XWdXZSBuiBaUesYdMf8tbZ3poWDl4z
         6HSRNjSkRMNDumT8FgJyBDKKcFP/k4V2DBJrltJom3FcnLmrtiOyCura5RfxeckwIFDV
         t623gjHRiBuWgv8PWPN3kMtDLLeDZ2TmGDpphaiHwhNbJg/w+1NrI6pzgR3Y+DAz0Qa2
         69cpH2G+oMUabhyE/m8XqoXBwtgkdpO2xL9GdBjrLqy6Dxm7MrFeDE+z7KrOc6nzlTF4
         KTW0LK6+ptPaoUi58w+CukPKM/o2c3nH0j31rs6GR/brXdl+xspiUcOFL4T+vE7qlo5E
         teJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716810922; x=1717415722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ZOr6a7LSObd/CX+qTtuisaH25RwcFQcUhPSvOG66+M=;
        b=eQGX6nQ6OxMg6Fe/egCHUmBJX2e5W/MKR7F3a6QFo+ApUFYC9KU/ZSMRLs/uu1G5o0
         ADAD+PhCP9ZE4OQk/FyN0iZgjZBzKTn0O15fEQG2zIjr9BmAd0QUtFnI73SNTp0Q2cNm
         oheuQYjjO8JFJQJkIVJEu0ySF2lh4d/ElEcqpNrGzghKGlSEJM/4i1onbmG/qBdAEwn0
         ZMEbGNcBV5ZSrjH5KDSOk6fccGSgGv3sBdcHTeN/ZCpY4Z3nvGeECgn0aZlLfmqtan5Y
         pRgr0voF42bjD8xivK3CvFhRHeI2IYafHoeaALc/qF805TjtfhbHUdNX5/AVBe7UpDuz
         qQWg==
X-Forwarded-Encrypted: i=1; AJvYcCWX4MldRGe1GU4vo1Bk9ZmX0xaqI0t3HUDdkW7z4NywLgx7nBB568wPPx11AIdh9QjNTVyfTeiSGJUJPoKcu5deo4AQV8+VybjJrA==
X-Gm-Message-State: AOJu0YyjLPeLV637v1AYo0P5osLZkONdB7+JJPdeLAN6ygumeGhMAlSZ
	xWa88f69mlm/GJ2fEiiTG7OqEgn6ftxk3hTUe1Vp1LQfAZYajArBZxMc1A==
X-Google-Smtp-Source: AGHT+IFCtb1fKdoC2nUkvjQkZOqrmQiriOB2vGJ3xHV3iK2oaGdJ5vBFsrCsG+8vTyfIg8LYlXdFCw==
X-Received: by 2002:a05:6a00:1d8d:b0:6e5:43b5:953b with SMTP id d2e1a72fcca58-6f8f34bcd74mr9225270b3a.14.1716810922533;
        Mon, 27 May 2024 04:55:22 -0700 (PDT)
Received: from rigel.home.arpa (60-241-107-82.static.tpgi.com.au. [60.241.107.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f8fcbea8a9sm4749256b3a.139.2024.05.27.04.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 04:55:22 -0700 (PDT)
From: Kent Gibson <warthog618@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	brgl@bgdev.pl,
	linus.walleij@linaro.org
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 2/3] gpiolib: cdev: Refactor allocation of linereq events kfifo
Date: Mon, 27 May 2024 19:54:18 +0800
Message-Id: <20240527115419.92606-3-warthog618@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240527115419.92606-1-warthog618@gmail.com>
References: <20240527115419.92606-1-warthog618@gmail.com>
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


