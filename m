Return-Path: <linux-gpio+bounces-12461-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1D79B9228
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 14:35:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 253A9B241B0
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 13:35:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E73919F436;
	Fri,  1 Nov 2024 13:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="nwGDVflN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207B016F85E
	for <linux-gpio@vger.kernel.org>; Fri,  1 Nov 2024 13:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730468129; cv=none; b=A9DXYpfS1O26zdWomX7ssHzZWed3bWiV28uDd5Ymr3YLROyltmjb0ZycTzXen4AHocU63MEth5E59GlxJiw82+n7NCV4mkcNQeWucxsbT0CsXeyJC00RIf6akoJG4//0EF4kVHv4lN+n/mhhf7uHNmvsOkVB4scR1fVG+85pbYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730468129; c=relaxed/simple;
	bh=6k8+xRM55fJHifK6NF55W1/71AyKhTV1YDlbi9Usk9s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pplA1PeG+cGpV3LEC1y791SBH+ebkP/lvTfmVH7QVS5uXxLs/HXhvLPjTLP2wkJcm0GD8s4OcGdnDnX2eykYZeYUh3R+IDm1PoATjzfbR/Sr/+BU9yEzrPAAjymzkqaeojAoQwhMXqziP5S4WCZu1WURTIvh/7KV3E8+hOOB+bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=nwGDVflN; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43168d9c6c9so15889125e9.3
        for <linux-gpio@vger.kernel.org>; Fri, 01 Nov 2024 06:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1730468125; x=1731072925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fVO5reqC0K+yECVRSAKPEHwg+XbCEkMDoIBAK/8v4Mc=;
        b=nwGDVflNwEsynpDTtfnvxet/Xp7bqI7IJ0lBUhD2uSy+GWhBa6mG6NnSjtqmSj3LYv
         KNqhyWBrOSy+aJQrMrF8FNunpL5k3g5lOfaPG8QzvXMQD51gSggoP1yTiAjgnt5CCaBI
         VB5iA075URGXw97rWFrK4UO7G4r7NpLSfoJ/eOOtkIpViXIJXMYXFgE8zKEHTu5Cc4hd
         FDhEJpgqEEqbPJmW+aBxM/YQDIQ4LBQKfsJBIqPHbYjHhJ2w4wimQzB57h8/ggUOvIYE
         xbbKoqAA9LSU4qk7PDk1VoSM47dAmbD7Pbn2F3tTbqSGSZAoVPbB28E9SYgHFsAC2pX8
         0A9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730468125; x=1731072925;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fVO5reqC0K+yECVRSAKPEHwg+XbCEkMDoIBAK/8v4Mc=;
        b=s07YJ74UQdEN+8alXRbh3wt+QEVcrmmMFdWnRDtC9KYo28JhI4Nv+GMcu0TfK7RglN
         2IxLTR7RPR0Y5rnNoSNqdKhy4u/aQhLMPfHfOkiKNCeGXCqOUv9bkR7Sd+b4zuy1JWGZ
         Fk/FW3D1kVhlIV4+KJVAL9Ba6oirhuzklyPzGL1dq3fVzdfmOmfWq0DtKvlcyjDZZSJJ
         laPymkBSMpIL8k1/gIUmwyGg1aAubkcXPoTY/6Md6TCpeu1eNVCL3PlUTiomvL+IWbSZ
         hWx9+xTz4cPEy36jf4BaMbvfgz/ZF4fl6nilxpPmcAukb0Gd2XFzk2bKY7e2x07PMTgw
         rzdA==
X-Forwarded-Encrypted: i=1; AJvYcCV1FLpp7WC2Cl2p6Vp3bFsaK42tA4JBzU5HBxcdoom6ucaglvsD1HoUyL0qlZWwamL+zOqgYO4g6UPL@vger.kernel.org
X-Gm-Message-State: AOJu0YzWHH56BUDvnILiMx8GPPy+XDUK2//++99C/wcaf7BUARpAQoZG
	gs3cA1ljf89Ir8Y2+aNgeBb+nTRx77fq7EeyRVEqWGbvTRbNdc7KL7l4qRmzpfU=
X-Google-Smtp-Source: AGHT+IG0nV06+T/VNJjG8BU7hDedhU7t6mOOTuhHuleXCw5IQBFwaEmQMFbYCqiNUrA5nIy5LG6sVg==
X-Received: by 2002:a05:600c:45cd:b0:431:5eeb:2214 with SMTP id 5b1f17b1804b1-4319ad363eamr183206075e9.33.1730468125116;
        Fri, 01 Nov 2024 06:35:25 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:c0f8:efae:9e3c:9a1e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431b437d362sm133860165e9.0.2024.11.01.06.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 06:35:24 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio fixes for v6.12-rc6
Date: Fri,  1 Nov 2024 14:35:17 +0100
Message-ID: <20241101133517.12627-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Linus,

Please pull the following set of fixes for the next RC. Details are in
the signed tag.

Thanks,
Bartosz

The following changes since commit 81983758430957d9a5cb3333fe324fd70cf63e7e:

  Linux 6.12-rc5 (2024-10-27 12:52:02 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.12-rc6

for you to fetch changes up to 604888f8c3d01fddd9366161efc65cb3182831f1:

  gpiolib: fix debugfs dangling chip separator (2024-10-31 19:14:17 +0100)

----------------------------------------------------------------
gpio fixes for v6.12-rc6

- fix an issue with using an uninitialized variable in GPIO swnode code
- add a missing return value check for devm_mutex_init()
- fix an old issue with debugfs output

----------------------------------------------------------------
Andy Shevchenko (1):
      gpio: sloppy-logic-analyzer: Check for error code from devm_mutex_init() call

Johan Hovold (2):
      gpiolib: fix debugfs newline separators
      gpiolib: fix debugfs dangling chip separator

Suraj Sonawane (1):
      gpio: fix uninit-value in swnode_find_gpio

 drivers/gpio/gpio-sloppy-logic-analyzer.c | 4 +++-
 drivers/gpio/gpiolib-swnode.c             | 2 +-
 drivers/gpio/gpiolib.c                    | 4 +++-
 3 files changed, 7 insertions(+), 3 deletions(-)

