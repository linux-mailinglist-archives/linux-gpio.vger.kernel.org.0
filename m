Return-Path: <linux-gpio+bounces-14462-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE691A00A61
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 15:19:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BBE85162F40
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 14:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F20061FA8DC;
	Fri,  3 Jan 2025 14:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="Y0bE/gw7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20C91FA826
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jan 2025 14:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735913927; cv=none; b=RPUGG8cjBXQa991KSbytKzTy2FD9IViIe4UeftCr3KL8jDWEx+LpJD6QSehBTQz8Nl8+JjmpGb6fBCgE1FR8RL2hQqLL2/W6s8N+8/mgJdhC3h3qBnceT8xUbtNT8GRP+bQQKg7FqUGiSv8V3PfvKs8qA5gYKjR/4oeNDt6YlSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735913927; c=relaxed/simple;
	bh=xj5FmQy3EE0y/q2Xy2BJboeLtnYBdNtJ3Xh0zZTuVpo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VrURqDM/6l8241xoifSchJS+Hb5GIDJfwy36z8nu2vLOy02GUWntQPHma9uBOf2wp452PA0gIySqR+wM70yarfrlamAR0uMedjKBFgs12oNnBi/Px51dvSrE6AsziRNFqfg5FmPPRQdGdSrB7uG1KrCoi1lqiiNVMMq5izUUWj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=Y0bE/gw7; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E46433FAD1
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jan 2025 14:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1735913923;
	bh=aIXIXU9c8w5b5nDvjabg7EfpeGBd9Yb+6lOtjZAAkgg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=Y0bE/gw76xTOS/o+IiooB+oVqYOQ4IX84YaRPvit/B/coxXoS5aF7PzUnkPtKpEGt
	 x8DY6UHmDvwoS58x2QV/67EuSF6EMwe/5T4gmunZ3A7LE2wxM1cBgvHtfg9mlRcBam
	 uePuociPtiIOc7nnEVHaTe68Hzt2Kr13BxTLgcYH/6iEQ7KL2ez81g86QS3Ms//Ysb
	 wQ5GRsbc8yZceHRysGWf2yOMhgEqgGJxSymEB9kEpkxrAx8DSHNPuRqPWBvYGYC4ST
	 IgcFoSWA1ZB+OstCgHa1H8mueGBMdeE/n+rImu4DSV4MwvETzN07dmH8GsQfZ8qapq
	 rE4xvMXzAH/VQ==
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ef6ef9ba3fso17456984a91.2
        for <linux-gpio@vger.kernel.org>; Fri, 03 Jan 2025 06:18:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735913922; x=1736518722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aIXIXU9c8w5b5nDvjabg7EfpeGBd9Yb+6lOtjZAAkgg=;
        b=kCccUhJXR80ZijuvlHmoOXFpbQOqUjVpJXh9gju+yUmA7WfohFAxMgJKBsLMQ9C/be
         6sEJXDLy0D6AwQPTPPWc7TomGR7JvePsPkcV11CeSaY4hVdDtK1YXKOsy3Ytzvdx1qJZ
         jGGuCHBuhgXP0a8dDE0TzroGoiiMzL1sEqvK48EVF9cr4i0TO5kURXuTShNRzsN3CakJ
         O5w5a68IbCS2QTXdUFn3hYUW//6bEOLFDxQPdlE/TKH8FK2bssK56ywDFLJhMygYKHfT
         DxGr1kjZUXv/4uOCqwy4lP+qEbfcQd/db/Xyb261Yuq8f+eE5fEuBEE/S+DFP1GCl4u3
         u9vw==
X-Gm-Message-State: AOJu0YzInWiMdic+nYuKlvqJSvDhjSi7ON5rGznfZPxjckyLFd9joWvB
	qlvybdUpebxvABgddINSPWEdL0w/xCkHnxHtGHyuPSUiRdt/KzsiAt+gx0tSKuVE9h0Meh/gkWI
	ZzWOV3iUK5Id9iI6Dkr5gYf0sJ1o8U6bIgGzjoDV8MY7kp5b9KlQuLKnGo4AKu8Elf2rnYeAWGG
	Ufuyobgug=
X-Gm-Gg: ASbGncswOAmuEEQU1sWBnat1iE+csIO57R88sB551sGe+G0RGbYG5Qy4XmYBh5mL7j6
	JAHRgfELcJgoF5GnZOXpzdV950Jjl/wWswpI0w0Y4xlu1AxCr9cYdttYOhCNsRLGtXEsaccQCrl
	8N9RyhzhdIxUu4/w2BkJxQDQy6iFcHympz56q8L67ugTOIS1OZ0BxuPPRlSp/hbcdzGE09ol/7G
	yXw7H+kBMUt2ATeAnOx1fbpa2NZG+98iOanRTsdvK4DvOXPXfYnTcba9A==
X-Received: by 2002:a05:6a21:158d:b0:1e0:d89e:f5bc with SMTP id adf61e73a8af0-1e5e046155fmr80534295637.11.1735913922148;
        Fri, 03 Jan 2025 06:18:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEN7lGI6hgY4m24rOhupEAR1EGnbf4GcSyjURqmpRkx74cLuFLXXVpAWTSFzzaDgKf5SmnY6Q==
X-Received: by 2002:a05:6a21:158d:b0:1e0:d89e:f5bc with SMTP id adf61e73a8af0-1e5e046155fmr80534265637.11.1735913921890;
        Fri, 03 Jan 2025 06:18:41 -0800 (PST)
Received: from z790sl.. ([240f:74:7be:1:cb9e:69af:fb16:54f4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8fd7b0sm15502908b3a.139.2025.01.03.06.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 06:18:41 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/4] gpio: virtuser: fix handling of multiple conn_ids in lookup table
Date: Fri,  3 Jan 2025 23:18:27 +0900
Message-ID: <20250103141829.430662-3-koichiro.den@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250103141829.430662-1-koichiro.den@canonical.com>
References: <20250103141829.430662-1-koichiro.den@canonical.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Creating a virtuser device via configfs with multiple conn_ids fails due
to incorrect indexing of lookup entries. Correct the indexing logic to
ensure proper functionality when multiple gpio_virtuser_lookup are
created.

Fixes: 91581c4b3f29 ("gpio: virtuser: new virtual testing driver for the GPIO API")
Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
---
 drivers/gpio/gpio-virtuser.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-virtuser.c b/drivers/gpio/gpio-virtuser.c
index e89b1239b635..d6244f0d3bc7 100644
--- a/drivers/gpio/gpio-virtuser.c
+++ b/drivers/gpio/gpio-virtuser.c
@@ -1410,7 +1410,7 @@ gpio_virtuser_make_lookup_table(struct gpio_virtuser_device *dev)
 	size_t num_entries = gpio_virtuser_get_lookup_count(dev);
 	struct gpio_virtuser_lookup_entry *entry;
 	struct gpio_virtuser_lookup *lookup;
-	unsigned int i = 0;
+	unsigned int i = 0, idx;
 
 	lockdep_assert_held(&dev->lock);
 
@@ -1424,12 +1424,12 @@ gpio_virtuser_make_lookup_table(struct gpio_virtuser_device *dev)
 		return -ENOMEM;
 
 	list_for_each_entry(lookup, &dev->lookup_list, siblings) {
+		idx = 0;
 		list_for_each_entry(entry, &lookup->entry_list, siblings) {
-			table->table[i] =
+			table->table[i++] =
 				GPIO_LOOKUP_IDX(entry->key,
 						entry->offset < 0 ? U16_MAX : entry->offset,
-						lookup->con_id, i, entry->flags);
-			i++;
+						lookup->con_id, idx++, entry->flags);
 		}
 	}
 
-- 
2.43.0


