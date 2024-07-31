Return-Path: <linux-gpio+bounces-8485-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 90653942C4D
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2024 12:47:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C18E31C21301
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2024 10:47:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E352D1A8C18;
	Wed, 31 Jul 2024 10:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ttqwtlYA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A6F18A951
	for <linux-gpio@vger.kernel.org>; Wed, 31 Jul 2024 10:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722422825; cv=none; b=lMmm439a/TPZrn7Ai3RjSStjz1+JI9fLZg5WeIfYzGbBHkbUw4sabjMH9fAoVLSLHSanaqVAe6W7xhTAXvUJoJE3safU1ijX9Vy2jh/452GmCDrC+OqMU3WvmAvKvFONIG4QGDaFv9GHX0Q1TQi7+/Nej+LsNJdtqu5PSCnhZVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722422825; c=relaxed/simple;
	bh=Ki2uv8YYiTtiAT8ump+cHg3zsbOcoedVx0u50QzMXRY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=t1FZ3ghB5qaT04ycCzwV/vGMK6HQrywqMRnRlKk5zAODDlhMbC5v9dpxXDPOL2Iz0cWpW/znNzp0Seksaa1Kak5QLbolLDzNWSxPfEcXJmrib9M6KW4HEKZ1iCc15lm1Xxcsjuo9QDy5UFnvRGCOFnFc7IhxlQWb9igLareZgJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ttqwtlYA; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3683329f787so2963797f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 31 Jul 2024 03:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1722422822; x=1723027622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wOsBks1Ukj/kM2aiU4wDpwEQWU7zGWRB95dIXwbabeA=;
        b=ttqwtlYARTEIyhMv6fB4cofcCoOnmUOpL4zgJOdbF8DeldpslT26zWUme8ZTc8yJHe
         l2ZXZfFE70jyUM1X+HZFUGNUHpAGbiS7oaQlcSajcBS5YV3Odi7jz2OTNBGaMXMPAdvG
         U3NAURJb/ZJyqSOCQ929n01yCgQLgcnKVI10X+SZBwdZMRPW2me+gPQWw9C5S6e6Wyml
         /oWJ5qW96BQiiHDXG7b3jBtz+u6D5vCi47T4qJ0Ufj1DvlZQTvKsLgpvF7W5mtNrwSR/
         L2VwN81PJVBI/UXjKa1bEPVvg3VapQT7agfYtAmv80mXgNJSv5VMx/mYkrfCqFyGhOF5
         UweA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722422822; x=1723027622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wOsBks1Ukj/kM2aiU4wDpwEQWU7zGWRB95dIXwbabeA=;
        b=GTO7ddABQuNlLEYVid12M2thLpauHhLKcCDjow23f+jgBInQhXuRVNB8I/VPr3d3K4
         72tse8xYbaNpGr5nmoAfvG7J14CaHEghHe1zdKN597bpKoDmt3MUfqUcuEllzM4Avb4Z
         2GXHRF1U/wCWrFZ1FAzExdN3IJ5bY/jRGUi8EB6FMgtlr0cor2JZ6/XxyoAjIGgjKqKA
         G/a6sff5ndC2BrJwYMmt8U6QqPXjDMYFJRvqs6mZr2RNL20EuraO6766ziCLK8krMDJ/
         sSXIl5Upb7TvbWNux/z4MMpF+ohE4R/9nzAFk2khu3o4GLGDqWcDai6vGRaJcT+KBtMx
         q6jw==
X-Gm-Message-State: AOJu0YxW9l0yv+FGHtnhkmV6hSHozBqrApuHlrm4fW/pu+1hoDMInRee
	tlCZVR4oBvtqNhbMVqIGkAKmjNVouI4EbdxRVRhnwQf16k5OUMrCIdgKxboWdNU=
X-Google-Smtp-Source: AGHT+IGVNIlPo7QzLmaqPdIDbk9kD2jKhAUNneCDHdm53tFykRiBQxGY8tuEOnCGljwjPqDh8QS2MQ==
X-Received: by 2002:a05:6000:1884:b0:366:e991:b9ac with SMTP id ffacd0b85a97d-36b5cef8f6bmr10647782f8f.14.1722422821568;
        Wed, 31 Jul 2024 03:47:01 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:9c3f:3dd8:b524:cb31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b36857d4fsm16858877f8f.86.2024.07.31.03.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 03:47:01 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: =?UTF-8?q?Benjamin=20Cab=C3=A9?= <kartben@gmail.com>,
	Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH libgpiod 1/2] bindings: python: properly pass event clock settings
Date: Wed, 31 Jul 2024 12:46:57 +0200
Message-ID: <20240731104658.93117-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Benjamin Cabé <kartben@gmail.com>

Python binding was ignoring event_clock line setting.

Signed-off-by: Benjamin Cabé <kartben@gmail.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/python/gpiod/ext/line-settings.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/bindings/python/gpiod/ext/line-settings.c b/bindings/python/gpiod/ext/line-settings.c
index 2cacbef..650235e 100644
--- a/bindings/python/gpiod/ext/line-settings.c
+++ b/bindings/python/gpiod/ext/line-settings.c
@@ -79,6 +79,10 @@ line_settings_init(line_settings_object *self, PyObject *args, PyObject *kwargs)
 	if (ret)
 		return set_error();
 
+	ret = gpiod_line_settings_set_event_clock(self->settings, event_clock);
+	if (ret)
+		return set_error();
+
 	return 0;
 }
 
-- 
2.43.0


