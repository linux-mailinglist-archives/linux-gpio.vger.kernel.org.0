Return-Path: <linux-gpio+bounces-14627-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34830A08AE9
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jan 2025 10:06:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 206247A3B77
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jan 2025 09:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAC3920967A;
	Fri, 10 Jan 2025 09:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="eviwY+T6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7DE5209F38
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jan 2025 09:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736499997; cv=none; b=IGjWWDmd87PDVOOnYnyKOlDMhdeT8YqpyADsaLZ0zvntk/kcp38hzE2Qy74qkuCVGQIQvMtF/cTWErB5ARA6COlKbLIRQGYQ1HxGaf4W6wgg0vM42kZiq2/z+2JvME9Qdf+vjTV0pkf/CVPol+m7ywwz3KP7YeV6WopsrtwpikQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736499997; c=relaxed/simple;
	bh=/ImOXCCEtK39z198mRSWZep91J/Y2VbtmdODLCJoYQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=boGhSnx39PvznCJxZuD684FxZUwvPIZ5KHxLkJ+6y0rsq8NvAnacqTvt3kM+l0TEk6HEfXKT+5LMfjNAaoIYbeg+pIMWnR75bdWnaOG5vji9Wa61ZynfDxhrahgxkfCC4fdzyzVYrX4xKJjHd/DhGWc/JObuih9HhyyYsF6+BDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=eviwY+T6; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4361c705434so13443605e9.3
        for <linux-gpio@vger.kernel.org>; Fri, 10 Jan 2025 01:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1736499994; x=1737104794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7jux1Wd/rIziWbXK/Mv7rT/dtwtoHiBumbetOsnn5sA=;
        b=eviwY+T6uneqUi9sj2QJajOCnVNdmIApZr3aZV5BYOufDf8Akmxw2PiPisSCjHrPNM
         zbtJj0mEkoRUDoJqhu8xSKFWvlKG26eao8Xz4oYM0x1om9CAicMpZMO/rdfVHtfsWhRl
         M+J1VH8bt90tL4qjG7NixepW8x+pzqrwxGRbhRwGDkWifSbX2z6v92xJ6WYGHaGAXzLj
         IsPCcDPxsm13YmfCU5MlbRr383efO6NmZe6x/ADDFiVO0HNQ11/AzvenOBbNKGQNK5MD
         VwOvVbIXI4F22axfeHS0NXW7O7FnSms/yFWHs2kyc8RTQQkf1HPGYA3AonNvqnrQWWbl
         TA7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736499994; x=1737104794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7jux1Wd/rIziWbXK/Mv7rT/dtwtoHiBumbetOsnn5sA=;
        b=JFy2l2+9GE9Of4Gr1ceaibfzqCl0SmU7pZprgwarChZrbfU5pI5AKfToCQ1Xn4Fs7j
         iXtR00ATM1lMGRkbyVyPouuE2LVQHZ1uLLmmXvfzRLeyboZE2eh1Z9ZrJYUn4FxZ1dIU
         wG+lxE72E7zzEUTaMvZ92MVP+t9emD4iEG23gtjZVSTpP9d1TisLhAYOsLeyfGDpRzRl
         ME5C4FpCHgJ4wjvXWQK4a3F7DVec4+SQE3GOqvdaUJrHirqN5BuSzFBNZEZzHq1naLxq
         nuy8dj8kTzP/vFyS2aOrRnC75+iwDFBZHCH6H5ci3tu6dUFsZOMjw3hf6UWtMmI6PoLk
         B5KQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/1vbhgQF0GJZeCE2mgb2OjQ4nzG6IsYXvDq5DnqVG7Bg172WgbzRUUToLL4A1fDGAs7USSY3XhN1P@vger.kernel.org
X-Gm-Message-State: AOJu0YyYs/gHOuTfVJtovmelo6C81Hng6OQP3n+3n5wn7djqvmeFGHOO
	JGBP8LkqO1hqdrpMP92g+SyHxN1gU5vHUS67hJqaPL5FslGWc+zUQQFT0FQ+9L4=
X-Gm-Gg: ASbGncuU1H48oUG1WX7uRqwE5ukCOHWbG3nrv/T6PW5rtXqMJaOKz/c5ntIDy/EK5Pi
	PLwUZDtv1cKKzznxbfxTISBtWIOFzAvspsLFlPLKi/FL2yKq/3vH1qevRJQCP5gCs73OWoBveHV
	3Y11rj/8Df3JvEF1nc5jqeKyJIWoKWEp2gtqtwqJ6IZklUSaFbl/RnyDY7KOwTJHAO8sM4tJtKI
	EsGmc3vWzss5WrpsZiTsK3Sgin5UPrP8S/I09gScUwaDgf8AAF1HrI=
X-Google-Smtp-Source: AGHT+IH5h5RdyhhuvkyadmYjJscnjyTUVEwBhEwkt4vrZfjhX1r5ymOtoYyW+W22ReKF3GCgbnKCMQ==
X-Received: by 2002:a05:600c:8706:b0:434:f0df:9f6 with SMTP id 5b1f17b1804b1-436e2677356mr83916945e9.3.1736499994124;
        Fri, 10 Jan 2025 01:06:34 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:5581:e96f:97e:b3a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2e89fc3sm81140825e9.30.2025.01.10.01.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 01:06:33 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio fixes for v6.13-rc7
Date: Fri, 10 Jan 2025 10:06:31 +0100
Message-ID: <20250110090631.12335-1-brgl@bgdev.pl>
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

Please pull the following set of GPIO driver fixes for the next rc7.
There's one small fix for real HW - gpio-loongson and the rest concern
two virtual testing drivers in which some issues were recently found
and addressed. Details are in the signed tag.

Bartosz

The following changes since commit fc033cf25e612e840e545f8d5ad2edd6ba613ed5:

  Linux 6.13-rc5 (2024-12-29 13:15:45 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.13-rc7

for you to fetch changes up to e59f4c97172de0c302894cfd5616161c1f0c4d85:

  gpio: loongson: Fix Loongson-2K2000 ACPI GPIO register offset (2025-01-08 09:54:20 +0100)

----------------------------------------------------------------
gpio fixes for v6.13-rc7

- fix resource leaks in error path in gpio-virtuser (and one consistent
  memory leak triggered on every device removal))
- fix the use-case of having multiple con_ids in a lookup table in
  gpio-virtuser which has never worked (despite being advertised)
- don't allow rmdir() on configfs directories when they are in use in
  gpio-sim and gpio-virtuser
- fix register offsets in gpio-loongson-64

----------------------------------------------------------------
Binbin Zhou (1):
      gpio: loongson: Fix Loongson-2K2000 ACPI GPIO register offset

Koichiro Den (4):
      gpio: virtuser: fix missing lookup table cleanups
      gpio: virtuser: fix handling of multiple conn_ids in lookup table
      gpio: virtuser: lock up configfs that an instantiated device depends on
      gpio: sim: lock up configfs that an instantiated device depends on

 drivers/gpio/gpio-loongson-64bit.c |  6 +--
 drivers/gpio/gpio-sim.c            | 48 +++++++++++++++++---
 drivers/gpio/gpio-virtuser.c       | 93 ++++++++++++++++++++++++++++----------
 3 files changed, 114 insertions(+), 33 deletions(-)

