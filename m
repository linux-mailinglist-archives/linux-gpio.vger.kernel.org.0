Return-Path: <linux-gpio+bounces-16437-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 375D2A40F01
	for <lists+linux-gpio@lfdr.de>; Sun, 23 Feb 2025 13:35:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 949433B8DA6
	for <lists+linux-gpio@lfdr.de>; Sun, 23 Feb 2025 12:35:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBF7520551A;
	Sun, 23 Feb 2025 12:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hSUWxEww"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79591E480;
	Sun, 23 Feb 2025 12:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740314136; cv=none; b=N3I+SUHzWVwVEtW1JWQWseAKWbqph/RKnDp1Qz82bAgd3QEgIchbM6imNXI9XIaTePRoMl4E/yTUsBFMqMO0OMzSYoEXSfjYw1WRN42dvxuaPgq8ykGzsxwzyXJneOUfn0yd6W7uJi/EHV3bNQyGLUSvYpC1uc8dgz+wQC2rlD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740314136; c=relaxed/simple;
	bh=+b9ofa6YsjjD0JjRWiGhXtR7RuKkJpyR717mcFrJAjI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oUgbAFn42Z0yHjLz9C+zqetYjUgls/eHij+HeSyb4yFOLJx90qpiiXvs2KmEo0mQR/yp/t1ZzYZYpk+Tp+iFwx9pcFx6vDrtvt0b7yl0powipTCwR9Yka7UAT4XNjFb+Bi7UePx4jAcCET7svWgRxxNnwfsXihsgp+GG8Tpb4zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hSUWxEww; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-abbd96bef64so578698866b.3;
        Sun, 23 Feb 2025 04:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740314133; x=1740918933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TLE5QRlgSqhogEgkoGJ4zyn6Ko/y3vd8C0Jq9omSNas=;
        b=hSUWxEwwd0M0kRQ1NFKJvBjkRXW/pGfqCHzHPUZC1Oo2ZH/sinfIDGHpfUwO4esMlF
         MWFZLTyNQ/AldFBAVbmxwTlG0Nde9+dZ4v/kVI52HW6r0tmr/Qo5QQKheSYyoZtDYNA2
         wtIfk2pRM+k64WGjnWfBg5MuNfgYgfVEn/b0ibJZeTl2DixV/LLRz9oKBd1WnJuJ9gIp
         e5/D91o8jWk86VRSlrqaeE7xvzhzxc2OiopS1UQk9HnuagArRNrohRCwVkDGZLeou+KN
         XP66Iu2Y86akjyKou//vhN0YJ8cds8TGTdE6Esrc+XcZQ7tT7ELoJ2B6no5sdfyFukpO
         VPBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740314133; x=1740918933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TLE5QRlgSqhogEgkoGJ4zyn6Ko/y3vd8C0Jq9omSNas=;
        b=j41YvURJpQCqTS+7BZ2KeARibXQ7/paCf72pinA+yuwZrDgcqb6NOhUv3QXltggDqm
         d5IHPjxQDWH/IwwvLFwD/4pClngSrt2Tw7vncF2FmS5pREaHkIsOPUDR/u/alOZykuSl
         eAgYIqRUK5DRwXiUOFaLCetACnT0iuWScD1TTeOnILXuncNCldRUWQtE2uRy3aDOSg/n
         lGMl13Bc1HYJguyNY+fJfK/oFESiNnIEPJeAoCuHS2ZizURDNOXYz8OsmEc++XHEEVIB
         jEw44/44DKqYK9wzg0/w0xgQcaKKbHDc/JrhbCVV22s2FBRrwqAR4neYENE9H12fC0ET
         TlLw==
X-Forwarded-Encrypted: i=1; AJvYcCWuDDjS/WEWpV7/i60XcgojHM/aqvgczKKmIAVuWq36OCmkAbzn0ZFaHzs5SIFuI2IyLigHMuSO+88V9Jb4@vger.kernel.org, AJvYcCX52Ytmno6ij1e1uAR+ESPylOqGX7DgwicdI3N0V9PC6Amw/WMae1963TbWyTGLSbW7TBj40o1VjVLC@vger.kernel.org
X-Gm-Message-State: AOJu0YyEzaZWuA5el1m7cMRO7HBNOW1VSBbtDcyKHyvwwaNpZ/BTaFb8
	AGQrjI0+aOh3ofpcKDSkJ8I34FU//sBly7WKdWhqqvPIuGj6fNQxhhBo7LMT
X-Gm-Gg: ASbGncsx2QKa+J+xEKvgkAJCcPka8CZF/TelvO/pNSE671e+coj998l7WRiMIK/AA3y
	oZdJLrhb9rkyY/xv8FUWTlFDtzm9OsxecYxHB5XDEyVDDTG7sGkqud5ZI4hxQWDUoPoKnC6WNdr
	bjXTdyqXMhlB9ZDnre8lWevqKpmhaxs+Pd4T9nVgIkqu5CEkxk7+NXa6Nevhh15UaTokTxkc5Nx
	tRmCk9u3kthAH3lFmwWqmu2aBYSBY7t3r5zturCGPJjeqLUGqz7GDseOz7XJWnJWRZbAPxPDdYG
	WMOEbcK4hDracZwasKmVEi3HTmCKOx3bXPWst5Q=
X-Google-Smtp-Source: AGHT+IFUfiW1GQDllxCKAXgvBAa6DM3kms//5wkJayxFfKOqMm0f7VR/HR8dda+cBQ6ZDNh4uZKJLg==
X-Received: by 2002:a17:906:3087:b0:ab7:da56:af9f with SMTP id a640c23a62f3a-abc09d33a64mr885264066b.49.1740314132874;
        Sun, 23 Feb 2025 04:35:32 -0800 (PST)
Received: from localhost.localdomain ([165.51.10.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba53280ee4sm2020878666b.78.2025.02.23.04.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 04:35:31 -0800 (PST)
From: Salah Triki <salah.triki@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Salah Triki <salah.triki@gmail.com>
Subject: [PATCH] gpio: gpio-stmpe: Use str_hi_lo() helper in stmpe_dbg_show_one()
Date: Sun, 23 Feb 2025 13:19:31 +0100
Message-Id: <20250223121931.579031-1-salah.triki@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove hard-coded strings by using str_hi_lo() helper function.

Signed-off-by: Salah Triki <salah.triki@gmail.com>
---
 drivers/gpio/gpio-stmpe.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index 222279a9d82b..bd4122a6f670 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -15,7 +15,7 @@
 #include <linux/platform_device.h>
 #include <linux/seq_file.h>
 #include <linux/slab.h>
-
+#include <linux/string_choices.h>
 /*
  * These registers are modified under the irq bus lock and cached to avoid
  * unnecessary writes in bus_sync_unlock.
@@ -283,7 +283,7 @@ static void stmpe_dbg_show_one(struct seq_file *s,
 	if (dir) {
 		seq_printf(s, " gpio-%-3d (%-20.20s) out %s",
 			   gpio, label ?: "(none)",
-			   val ? "hi" : "lo");
+			   str_hi_lo(val));
 	} else {
 		u8 edge_det_reg;
 		u8 rise_reg;
@@ -352,7 +352,7 @@ static void stmpe_dbg_show_one(struct seq_file *s,
 
 		seq_printf(s, " gpio-%-3d (%-20.20s) in  %s %13s %13s %25s %25s",
 			   gpio, label ?: "(none)",
-			   val ? "hi" : "lo",
+			   str_hi_lo(val),
 			   edge_det_values[edge_det],
 			   irqen ? "IRQ-enabled" : "IRQ-disabled",
 			   rise_values[rise],
-- 
2.34.1


