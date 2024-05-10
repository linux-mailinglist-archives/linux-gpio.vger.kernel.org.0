Return-Path: <linux-gpio+bounces-6286-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 783EA8C1E82
	for <lists+linux-gpio@lfdr.de>; Fri, 10 May 2024 08:56:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 09DCDB218E3
	for <lists+linux-gpio@lfdr.de>; Fri, 10 May 2024 06:56:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21B7815EFAF;
	Fri, 10 May 2024 06:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kHxAbzVF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8C313BAE5;
	Fri, 10 May 2024 06:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715324032; cv=none; b=P+GH9DmoQq22VXxHKfV3edmk/WqmJABHKUJ55RneN/XaIOrDzlrEGbQzVD0Uwdh3GmsUODDjZ+1kG3XHqJpPujydWYFBx/DLBETt2mSFnNuYRBdI2Ng/8sgeSQHb94tGdzQP/qGdxdhBWuuEK7/MJMmQgxaBACxQh+d7HhmG8QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715324032; c=relaxed/simple;
	bh=EsEjqVfurQEi6EaE+OnivMb6kc+dfAW6aZlvySrlEJ0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XAceuzReLNhQi0BzzpItyzIhy3pxpKyEFfb3QEdME3k4Gq9b7juftk0128WP3AxB2aqWdcz4pmAZU0BjFv1ov6q92I8PsKR35ObqIkjHTPrg2pQ/NlLEZgRMf/4Aj7UCkqs6YHAG8Hx2KjMmaTLANWWdV3CG4ElGKUMwVfkihn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kHxAbzVF; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-61c4ebd0c99so1108010a12.0;
        Thu, 09 May 2024 23:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715324030; x=1715928830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6bttAWzIw7yUE9dMi4CPYP8/KpV+KHriPCsuJRLVxh0=;
        b=kHxAbzVFW7HjfUOul8oeA4hvE80FUd5a3EHfmVDHvgDuGkLLk7akMJw4RK/ZFbxotA
         h/CS50EhhnImqkGWgOiutA42dz7dO+Pjp8+gBSJjnxDymUE3NWwL+QIKii4oz9h7a2ML
         2CXeNXY4hl+GSwB2fhmPQTaPnGgnm//maYbyCOWTD3DdQhbrW7wtX18ALk9cdLp9XymH
         bEJXvrX4jEAR9mRmxcbefGyK8sj58CE8JcGKNQQsVqNy5U48I5EMoL8TurWDiUvPuS9l
         eJOy9JXJWyDaOSdohUun9oI47o3YmFt2LvTMdzG01WWdR6TJJMu9wyEyPbOS6Xyo7oQ0
         fLpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715324030; x=1715928830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6bttAWzIw7yUE9dMi4CPYP8/KpV+KHriPCsuJRLVxh0=;
        b=DMTxzg6PfdEuqIE4bNDLQhXTrqUdgeQAHwc3Uo6ccuh2awCXExw8tvZNy8HZuVB3lb
         pQNeUynwWNuqlTE7yH3n3FFu2xJKNFpfosGsgOnT47esgLHJXyZGNAExa5dlvpYr5uW3
         eSgp/rP9CreNRcO/3wafUgHbZI/gdfVPAMrLFvdMQYoJ2AYIcTh8ITqhOq7dx+AVCaUp
         KOZTEo8WQ36s4zUESThH4K477tKTcXJaEokAiCEyR1ZOQ/YFV/qYoA8/2p/WG/GCSno3
         X619X8HDwdPjCRGFDigB73iXWXoZLRjfTUzeITGYelZ0bwVVR1kESvVSk4QAvq0x2/DM
         6BTg==
X-Forwarded-Encrypted: i=1; AJvYcCWMFK1P2pq3Ne1xp9KDMYddKmCX3IMxOXOTXVuh+3v6edch0PaLTwHGpDjZlGhrgj4fLS9xtWj5GUyPfLs7tLNSIJmZYCzAoAHgtg==
X-Gm-Message-State: AOJu0YxI74Fj83LfpB8R0rEGGofxghBLkzLkTcrumr9aHbNMpQyXUY20
	DR36w2lPVPdD9rHAovHx5NiPSLwGpVq6uEctbAUiJWJ7BhRBk+fnC195aA==
X-Google-Smtp-Source: AGHT+IF8GQJf63MP69uLJd6CLJ5Gt+AVs0HTNZe2BkiOqmatoXe0KyWQ4LHwPTq6nDPvP0Ldo3sGlQ==
X-Received: by 2002:a05:6a21:168e:b0:1a9:4964:726 with SMTP id adf61e73a8af0-1afde0bc494mr2426478637.21.1715324030616;
        Thu, 09 May 2024 23:53:50 -0700 (PDT)
Received: from rigel.home.arpa (60-241-107-82.static.tpgi.com.au. [60.241.107.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf2f4bdsm24951675ad.152.2024.05.09.23.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 23:53:49 -0700 (PDT)
From: Kent Gibson <warthog618@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	brgl@bgdev.pl,
	linus.walleij@linaro.org
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [PATCH] gpiolib: cdev: fix uninitialised kfifo
Date: Fri, 10 May 2024 14:53:42 +0800
Message-Id: <20240510065342.36191-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If a line is requested with debounce, and that results in debouncing
in software, and the line is subsequently reconfigured to enable edge
detection then the allocation of the kfifo to contain edge events is
overlooked.  This results in events being written to and read from an
unitialised kfifo.  Read events are returned to userspace.

Initialise the kfifo in the case where the software debounce is
already active.

Fixes: 65cff7046406 ("gpiolib: cdev: support setting debounce")
Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib-cdev.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index d09c7d728365..57c92395219e 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -1193,6 +1193,8 @@ static int edge_detector_update(struct line *line,
 				struct gpio_v2_line_config *lc,
 				unsigned int line_idx, u64 edflags)
 {
+	u64 eflags;
+	int ret;
 	u64 active_edflags = READ_ONCE(line->edflags);
 	unsigned int debounce_period_us =
 			gpio_v2_line_config_debounce_period(lc, line_idx);
@@ -1204,6 +1206,18 @@ static int edge_detector_update(struct line *line,
 	/* sw debounced and still will be...*/
 	if (debounce_period_us && READ_ONCE(line->sw_debounced)) {
 		line_set_debounce_period(line, debounce_period_us);
+		/*
+		 * ensure event fifo is initialised if edge detection
+		 * is now enabled.
+		 */
+		eflags = edflags & GPIO_V2_LINE_EDGE_FLAGS;
+		if (eflags && !kfifo_initialized(&line->req->events)) {
+			ret = kfifo_alloc(&line->req->events,
+					  line->req->event_buffer_size,
+					  GFP_KERNEL);
+			if (ret)
+				return ret;
+		}
 		return 0;
 	}
 
-- 
2.39.2


