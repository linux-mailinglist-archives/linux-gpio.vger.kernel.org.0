Return-Path: <linux-gpio+bounces-6311-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6EF8C29CE
	for <lists+linux-gpio@lfdr.de>; Fri, 10 May 2024 20:26:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C21D1C216FF
	for <lists+linux-gpio@lfdr.de>; Fri, 10 May 2024 18:26:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3092374D9;
	Fri, 10 May 2024 18:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="UBrzni0G"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AAB817BA3
	for <linux-gpio@vger.kernel.org>; Fri, 10 May 2024 18:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715365607; cv=none; b=n1sS7ZQJaf/9/oHaVGFDBDAs0f6B4Lzbtm0tnv+fRjb0azAW8ZYuTmixTvvmojH95In4nAkwMwxOnBcS54LVn9lFsWeiTWwkOiHbMWsFPSpGVZGAsHV6DOtzQr+6S+xlFH3w8OACtUPOjRy4YHuVsePN/QoPTDn8FfI6OYeS9vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715365607; c=relaxed/simple;
	bh=MhTpSYlniw09ynrGEPyV5q2Agl9hNAli8lBhN6J7RRg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=k8LTvhYr6GPKFmqpH83F+oybGUvkKvUiIQGvh90RlhDUKP9Mvzp9K8j0TbzMQIhkQ/aLgt0hTaWpGBq21dm9i8x8VH+5xwABBVYq7/1BAysHHSKbHnCEqT5oeNWQyyKIwGacft8ZAqtDVep4zYD5RyTH9skI2QQXraKlnZkw600=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=UBrzni0G; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-34db6a299b2so1775261f8f.3
        for <linux-gpio@vger.kernel.org>; Fri, 10 May 2024 11:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1715365603; x=1715970403; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3QEkrlUEm+5W5lnp6HukD9LF+vny0h09LkKwSRX06UI=;
        b=UBrzni0G85wytcUfSXcnGCHf0H+AdUN+jfDwzItNR+6xb3qCMAvhPtrpGDQpmG0V+t
         JIVBThQkIUgl7gO7WXxHxZYLmYjJpxqFY+i65+ll20yIHcFm4YWXln15k0tHfglurPg7
         XyT3WUApoz7TZcoQ7X9W3TEC5NZngjCE5d3R4n3isgmP5j/XATbrRGYpSDqSPGDeCbuD
         fEpCzmu5HVZzW3kDy3SrgEiFrEghLeeaq+j7a3kjXbUe1LzxKC0gG+jcH8ZSGhUIix1D
         FMSqgCwfh/IT+z70rE9998iThzQCUA2EviI3wfy5FoBPQbYLMF11W7Xns4AR4u0hID0f
         /w+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715365603; x=1715970403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3QEkrlUEm+5W5lnp6HukD9LF+vny0h09LkKwSRX06UI=;
        b=fNhFHZ0O0sokEZLlUMIT9DEOgbcD8sosdHWVGMXzBFUYjV2eqdqFGuKNuOVlUz3o98
         btjG/oq0bAMd/WfYR1IsNxYww2kaQcFpVqVar+Ag1hsH1/WXPMiZs6detx4b7opqErgh
         y8CNhOeUL1aIj3IuJXXDiOY2tWPCVSOiNFdkQhAogidFb1tBx8AD+8e+2G3K5+cjhlXb
         eSS4cnzYqR+WPc9prXB1JEPdNeFIziA51GTg9R6gfoYUJE5K9gNWibvatmOC9lEozQgy
         k856c2th8orQ7fmldibw5PcyjE/5Cg5p6GnqeJd5JMUVnAv0kRamrIRVEzZKdwwFRRZd
         oLgA==
X-Forwarded-Encrypted: i=1; AJvYcCUJYEyDkbFgJrs7c9OSRg6I9CK3MjV49qCSmVPUCunIgApfGjn3PkcqoY+pDEVmMO9vxi1sFAXItNAH8Rxg53Huv8aueF80DAJvlg==
X-Gm-Message-State: AOJu0YzGkEavglxXMDCHp2qyZp0pTlfVvnMMDg9QmELM30LWG29+ygWo
	s9N7RDIz2GIJO0VvgmpViXvsaC8Wj3RbrN9BgqKAC/XAOmOzi9iBB5Dnhw8q0Do=
X-Google-Smtp-Source: AGHT+IFeLwkav5v4iPuh0Gz6pchGRbm+soi1ErYGVONkn6HlYK04px73Z1UuB08Vyrm3T8na5XY68A==
X-Received: by 2002:adf:f60d:0:b0:34e:aef7:4ff9 with SMTP id ffacd0b85a97d-3504aa62e64mr2798361f8f.61.1715365603515;
        Fri, 10 May 2024 11:26:43 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:f6ed:a982:f92e:840c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502b8a789asm5184745f8f.51.2024.05.10.11.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 11:26:43 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio: fixes for v6.9
Date: Fri, 10 May 2024 20:26:40 +0200
Message-Id: <20240510182640.44486-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Linus,

Here are some last-minute fixes for this release from the GPIO subsystem.

The first two address a regression in performance reported to me after the
conversion to using SRCU in GPIOLIB that was merged during the v6.9 merge
window. The second patch is not technically a fix but since after the
first one we no longer need to use a per-descriptor SRCU struct, I think
it's worth to simplify the code before it gets released on Sunday.

The next two commits fix two memory issues: one use-after-free bug and
one instance of possibly leaking kernel stack memory to user-space.

Please pull,
Bartosz

The following changes since commit e67572cd2204894179d89bd7b984072f19313b03:

  Linux 6.9-rc6 (2024-04-28 13:47:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.9

for you to fetch changes up to ee0166b637a5e376118e9659e5b4148080f1d27e:

  gpiolib: cdev: fix uninitialised kfifo (2024-05-10 16:38:27 +0200)

----------------------------------------------------------------
gpio fixes for v6.9

- fix a performance regression in GPIO requesting and releasing after
  the conversion to SRCU
- fix a use-after-free bug due to a race-condition
- fix leaking stack memory to user-space in a GPIO uABI corner case

----------------------------------------------------------------
Bartosz Golaszewski (2):
      gpiolib: fix the speed of descriptor label setting with SRCU
      gpiolib: use a single SRCU struct for all GPIO descriptors

Kent Gibson (1):
      gpiolib: cdev: fix uninitialised kfifo

Zhongqiu Han (1):
      gpiolib: cdev: Fix use after free in lineinfo_changed_notify

 drivers/gpio/gpiolib-cdev.c | 18 ++++++++++++--
 drivers/gpio/gpiolib.c      | 58 ++++++++++++++++++++++++++++-----------------
 drivers/gpio/gpiolib.h      | 17 ++++++++-----
 3 files changed, 63 insertions(+), 30 deletions(-)

