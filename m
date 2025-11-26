Return-Path: <linux-gpio+bounces-29112-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DBEEAC8B8C0
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Nov 2025 20:17:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 29AE94E6301
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Nov 2025 19:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F66033F394;
	Wed, 26 Nov 2025 19:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0TtFTXTO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EE72750FE
	for <linux-gpio@vger.kernel.org>; Wed, 26 Nov 2025 19:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764184658; cv=none; b=aC4xYqJXIM2tWcTKjw5mt7tw1fqCUXpf9ElfG0z9PS9koH7Afb6C3btnAnt8Hjzst1+32K7uG0dNxlBJbXSOSG4ufCh0vhBr7kg9pYYN0NsfPP7g3J70fMvU3JQjfeIFM/5L7BzLlz8rJbWvA/mMS5VEC66e84aYY3cwgmmrQIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764184658; c=relaxed/simple;
	bh=u2QfPs67GO1VdO1nGyX0Q/BmbUMANlSuFMzJhQVcaYo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P9lbmDg919G/t6RHk3+YT5X1rfGle/yvMCIFYdN6vKLMQB9hduFYknzNFhof6ruWwB4abVCGgd91LaJHD13XAJHXV1FEVMnr7c3OpWs7P+Kyx0wXVETV4SW89fcPhg4iacWH+BPlRfwCuOAqlsht4wuPjM7kYh/UdIxxsVZAkM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0TtFTXTO; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4779ce2a624so439035e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 26 Nov 2025 11:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764184654; x=1764789454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pnotuFbQzl0x3b6BXnYv/ni9zrwiTQi2pnlhN2jpmVI=;
        b=0TtFTXTOk2Ibm3qO9Q8oe69cTofSajigMabgXNUpvvmxV5Ds0mIDvuukOhiglipcyO
         1GeGx2CN97ln2OvIuyfw/rDmsHaF9yuYsJQ9DQMbhDNXQfGM53A0e19vEhYyjsVZypLK
         B0mkA22PzJkTCWz4usE9K+IyRid+AAIEqZigOeoUlkGluho+IjorYx55Cb6z8YZc7JE5
         Fo+erjY+JAGtOn2TVlWC2Mn3KRSN33fjPWgAAMb7jIaDTVkGI0CNpuUCHk43Qt/KriIX
         E42l2hj57JpCxg7MooMkkKyX21efPWzG7I1PILUhTXSUkFf+02vZrDu++ZisrnBNAQrU
         WltQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764184654; x=1764789454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pnotuFbQzl0x3b6BXnYv/ni9zrwiTQi2pnlhN2jpmVI=;
        b=pJrK4adLL3grPQpdZj2OfQwp6w4xKo8oUw4K89pDlwq0Tm98//NohHQ4paKUnL6E78
         3PWzLR2Dp43kuF4evf7jrMYP8yYRpMf8CAf8E//QxT0JMsEKx0X8NDBAIrwjjbKrw5X6
         u3RTmVNsqQ/+IsmHVY23VXfTZ+X3zc2fQ0a+/eBjOzMGYnzmEhioBWTLvrmLuWzxUsmO
         odI1+HyJIyY3UcIGFgfTKfpkk8ou9jFYbFyZYpfiDihrUvbOhLnuQcjoi6rslfqE5beZ
         Scel4pTAVbz/hSOfE3RLtKVjlin5CKAIXblf/bDCRBXLgYh4tdKkWeaHdK5dzXNo8rO8
         /A9A==
X-Gm-Message-State: AOJu0YzF2/9ATMUZQzcOu8TmvkvUsuRBuEqQYteopX5imnEj5MpnrK5f
	mTzzZTK1ZBrIFhP33eYdLt1Yi29Zn5azxkTZfP8Cj0n4489Xtj2OG/fnhlLWHHOqHZ0=
X-Gm-Gg: ASbGnctejg9IBdDaX9V8YoJPkamygXSlKlykLXNvPRSahHfzy/aq8R5DpeBYYPdrvgY
	St5oyjn7IMMDLxEw/tq+EV1/TStZ9InLfsIgF0L5cCyyiOjAWYQ3DjCamBfhS17L1Goi61gdzKc
	R1CnlDBP9Yacdii5dxAL61xDrDh7TkyEtAEVcGQ79o4ule17qhL+cYW1G4P1CSi22m+4Xj67TQp
	+tNSR0ZZPUMjb6zRfuXLxLSy81oEHSt9JDqcKRRVIuMLwKD8o2YdfgdAZ3rNKjO3/5mOHQfbxgb
	HAYHHSWZjCU7hTTQdi8jjs1OJxppe3SfjKB9bGExGFMEXpIZAArqDYtuNqqvah8zsBW18VIXZ95
	h+e2nQsL3wLIgH73sN9cqN4BYwYMWDaq+x1lL7MyipqZ6Uq096JCBQiH9zN6wnNLWBljPEJQM8P
	UsLoX8Vo74RQHQVK/P
X-Google-Smtp-Source: AGHT+IGKc5ONRFhXCV3N23/0bLOYz8NCUmUXmYJ2DnrY5gzKZFBYX9qvCvrlhVKSXh3cZUKRrWaWiA==
X-Received: by 2002:a05:600c:4f87:b0:477:76c2:49c9 with SMTP id 5b1f17b1804b1-47904acae93mr69073375e9.2.1764184653027;
        Wed, 26 Nov 2025 11:17:33 -0800 (PST)
Received: from brgl-uxlite ([2a01:cb1d:dc:7e00:544e:b6f5:116d:4a8c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790adc8bbbsm62500215e9.3.2025.11.26.11.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 11:17:32 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] gpio: shared-proxy: set suppress_bind_attrs
Date: Wed, 26 Nov 2025 20:17:30 +0100
Message-ID: <20251126191730.66277-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

User-space must not fiddle with shared-proxy auxiliary devices. Disable
bind/unbind attributes in sysfs.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-shared-proxy.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-shared-proxy.c b/drivers/gpio/gpio-shared-proxy.c
index 3ef2c40ed1522..29d7d2e4dfc02 100644
--- a/drivers/gpio/gpio-shared-proxy.c
+++ b/drivers/gpio/gpio-shared-proxy.c
@@ -322,6 +322,7 @@ MODULE_DEVICE_TABLE(auxiliary, gpio_shared_proxy_id_table);
 static struct auxiliary_driver gpio_shared_proxy_driver = {
 	.driver = {
 		.name = "gpio-shared-proxy",
+		.suppress_bind_attrs = true,
 	},
 	.probe = gpio_shared_proxy_probe,
 	.id_table = gpio_shared_proxy_id_table,
-- 
2.51.0


