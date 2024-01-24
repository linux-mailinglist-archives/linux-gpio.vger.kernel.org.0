Return-Path: <linux-gpio+bounces-2497-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3325C83A6F8
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jan 2024 11:39:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 664721C21B63
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jan 2024 10:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41863FBFD;
	Wed, 24 Jan 2024 10:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="OkCLexIz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0611946F
	for <linux-gpio@vger.kernel.org>; Wed, 24 Jan 2024 10:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706092776; cv=none; b=jo9wNU1xjV/RGV+eJpDtyqrJyUS5kbK8p7P5YVqUQiHYBobFtNS8zR5NgF8u/DyNZcGCswPfIHOawYuYi+t2TIyKwezH5yoOPpiO7fw98U/8A22uWyFOEn2ShDADB390w3lDzmuzMr/xFSRKpRaR6Eh0GwOivNuU2c5D2tQzsxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706092776; c=relaxed/simple;
	bh=734NMMquywIKI4BZ+lmSPRYZ25SD+kXbHf5rFmBTH8M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=qNNfn8NNmLWEU6qmCuMTI4NhvzTGhSpKIXlOMvMDcUZJ/Mdxx8j2Is503zfP7BYTajAxsK7lGwlJhMC4Xa2WLVK56Ae32uzit47LA76v8fg/fBYCkNVIIShggH5emvu8wn1mNltj4n27GSPNNdHKqWeJgz/8lo4l1/e2v0y/ZDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=OkCLexIz; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40eac352733so34331005e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jan 2024 02:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1706092772; x=1706697572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+cvLraffpvdBBPkKRdEK9rD8rp5r6BkQHWumf8zgppk=;
        b=OkCLexIzHal/BzwKQxszWzUvXutFkQVrIJtLKB1tSxQMc3JDcjWZJ6WNHjKCt83bkZ
         msY7Yt5SPNZ1S8ijPhU/IWp4WWVLUTANVLLuHxN5xUnjk8uIHuOfNjoPfzxI5WJWwIXR
         JogOGwp1mB/EhC+jgq98hp84yapDkR3kqbO1pEWIV8iD6h7fTwxR4051eEP+NYg+B1AO
         dBF02kOVSuAG+/1I0cYNQuvutediiR3wGH/6qeNyQ88oetqhud+na+bkXt7ebsE0JVeC
         Ch4X0GoaH5QReLDoWxB4oRuhnJc3SNoTZcUij955nKJYANPRzQuSLCtKwRZalJPJZPrR
         gHqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706092772; x=1706697572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+cvLraffpvdBBPkKRdEK9rD8rp5r6BkQHWumf8zgppk=;
        b=tcee2pB50SO7pvUNdonN74OcSCqMiMFCvXJXyR61CXk94IdmFwrO55WuE+NL9oGzDX
         zyyBGbL8FGF4r9flPGrQeW2uaBZW4CkxkERv2jHVvvSbxi/nzEywzg3jNRcz8cRoVH9f
         hxxwU+vUbwG6hzEoaM0E8N44iCpVgnisWj6fsB4JQlxpHaKgH92bz+Znq7nfO3zY3zg7
         PrIyHEeZR9yOVnrz8cACWJJRwTG8EE2yJVzHDtq1kxDOYEze5SAWPc0fcfTqNqYUis35
         x0SUys+CDLHGRpwAhlZa0fQdlxqfxFYO0PVvdxjyxLe+XbJ3tV/1oRv4Cz/uevuSsMtb
         cQDA==
X-Gm-Message-State: AOJu0YwA6UHHrbUeNazpeb3ywu/wGTqQmA0TrqBXIPEE8OomgtXE6+3L
	aA7JxN+IOHkedelQej79NH1EYoMSZSpWUSBLMF+WcmtBhxul7Xq9Cp92FdsoT7w=
X-Google-Smtp-Source: AGHT+IEmjeMQj3GXvoG2Xyg9K7zz58LyzTHWGQi49EtGvzzW7DSeheD3HgPlFPlbZpDuEKZFy1K+yA==
X-Received: by 2002:a05:600c:3d94:b0:40e:4ec1:ad2c with SMTP id bi20-20020a05600c3d9400b0040e4ec1ad2cmr929998wmb.52.1706092772036;
        Wed, 24 Jan 2024 02:39:32 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:e737:cf8b:25f7:e0ad])
        by smtp.gmail.com with ESMTPSA id b16-20020a05600c4e1000b0040ec66021a7sm1446141wmq.1.2024.01.24.02.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 02:39:31 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Phil Howard <phil@gadgetoid.com>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	=?UTF-8?q?Jos=C3=A9=20Guilherme=20de=20Castro=20Rodrigues?= <joseguilhermebh@hotmail.com>
Subject: [libgpiod][PATCH] core: ignore positive values returned by the GPIO_V2_GET_LINE ioctl()
Date: Wed, 24 Jan 2024 11:39:29 +0100
Message-Id: <20240124103929.66545-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

If the kernel GPIO driver (erroneously) returns a positive value from one
of its callbacks, it may end up being propagated to user space as
a positive value returned by the call to ioctl(). Let's treat all
non-zero values as errors as GPIO uAPI ioctl()s are not expected to ever
return positive values. This should be addressed in the kernel but will
remain a problem on older or unpatched versions so we need to sanitize it
in user-space too.

Reported-by: José Guilherme de Castro Rodrigues <joseguilhermebh@hotmail.com>
Fixes: b7ba732e6a93 ("treewide: libgpiod v2 implementation")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 lib/chip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/chip.c b/lib/chip.c
index 7c05e53..7bf40c6 100644
--- a/lib/chip.c
+++ b/lib/chip.c
@@ -239,7 +239,7 @@ gpiod_chip_request_lines(struct gpiod_chip *chip,
 		return NULL;
 
 	ret = ioctl(chip->fd, GPIO_V2_GET_LINE_IOCTL, &uapi_req);
-	if (ret < 0)
+	if (ret)
 		return NULL;
 
 	request = gpiod_line_request_from_uapi(&uapi_req, info.name);
-- 
2.40.1


