Return-Path: <linux-gpio+bounces-4838-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 31716891717
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Mar 2024 11:55:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D1CC51F23268
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Mar 2024 10:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 829C169DFF;
	Fri, 29 Mar 2024 10:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Lm3ZpTnp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FEC17F0
	for <linux-gpio@vger.kernel.org>; Fri, 29 Mar 2024 10:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711709701; cv=none; b=C55yUHBvAmvoXufx50C7EYnIMlkdD+p1XiYWIDf75ZxgT2rSNDSTe6qHcGx1k5iCvylJ7RXF8wG2xtYG7oAayJQASItPguI9rh3vlb4xdcXon0BXijzudjmohVQuV5ZM4Z4xeo/S421vWNC1CTNAmqHBrF848eWrnuKPC6WrbVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711709701; c=relaxed/simple;
	bh=Q9r/QYKYkFSUWIUl5fJpCahxMhoS1QM1LBiP4WtEX3s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mluXNAW3iDN7vU6kA1eCVpRab2KKgKFUNgcTy6IzsPbRcHCoTVps3lnAY1b6B5d7S6c8jF2YZrK1Q+5a7M2HH1m5MHKEEhGp/q5f8KtB0KIIvb+toxhTXm1f8Y93zt70R3N8e+wOKbELw57/kTyuxZXA8mK70WTViAgQttuyqYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Lm3ZpTnp; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4149746f80aso12682785e9.1
        for <linux-gpio@vger.kernel.org>; Fri, 29 Mar 2024 03:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1711709698; x=1712314498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sruWy2oh2z7iKrIvNGKgSUcYbi/EOvDXHK5Fj/W9mBM=;
        b=Lm3ZpTnpvkjis8cpsso/EYsLV6VsXfCJt7Nf6a2fOTRlCCImwqolctcj0tCvivFbjR
         ySjF7QeCuy45N810z3lqUaGI3QC2QtsIkq2qjsTIqU8ZzsqDBM3eKRPqatxhON5poH68
         BnqxiHIZeuvDnvM9p2wPnkhM6zoDeuHoNFSqvNuhT+5Ne4aiXUtKEZaS6xYy4+xqJ2j4
         v9+EG4mze6aPMKBlk3+Q+z1w7VDwa43ENAjT1XIrwP6tEoQryMLGTKoquAY685ygvv+d
         KlYIoEk2ni9eMAuhnJeBPXzuI9rT7iVnz1pxZTFyLm9rjJ6Ehj2zbcvOhaEYhxZTgQNC
         W9wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711709698; x=1712314498;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sruWy2oh2z7iKrIvNGKgSUcYbi/EOvDXHK5Fj/W9mBM=;
        b=jGboaruHai6US295FaK1LBggl1u17/phILkwtBqsfI9Yu9OrPkPnzKAnHHdGv5l8k6
         ExWrO1B6jBLzNN3wp8cGa3aLWJEmUkBs06aN/CQVBN1TliI1ZAM7LUDJi6DZZaOXRQjj
         gKTFKIenK0ZKtwOqbaTtdze41E2orEaP9IqaLh37u3lTyBDPcUQ8LbhhmiMnebH5fAMY
         /hZXuSgxSjkoNkrPyMo5PFDYlaaMiMiJoysQQPtKAkMtpoNvR2xOxssGjKI2nHE9i37t
         qp2l8Y0w6pqyLTIwKNNkKdSjbKpivPExrw9AlWWSVpzpU1Avqd4M+KpP3VwPFBiVa7to
         K8vw==
X-Forwarded-Encrypted: i=1; AJvYcCVaEBW00SXT/LTtZcuNV4SyiKRLmdXaqbuN+DIvDDx8zSqChIfBbzzkM1fdTl7tBr/CTvqYdPOKMUgNoJiBcWLbMskpKZvazoXXVA==
X-Gm-Message-State: AOJu0Yy/At2SmcK1Tqx4Kg/KlemErEPHQeSPC/M6ZDfOfU5h9hMwXdY0
	VH/hHl/UnRAasV7IqvEA3CjUdthGZW8cW+jY3pZPngCX8x2Eb4yw/sh6ZRlCgl4=
X-Google-Smtp-Source: AGHT+IGLPp2TDl85HRVQNaBPkb884O82uNf3pnr1I/GAtkbyLx0cWGBCgh1bCcYGz2BBiO0N36batA==
X-Received: by 2002:a05:600c:3b92:b0:414:87f7:a77 with SMTP id n18-20020a05600c3b9200b0041487f70a77mr1811257wms.8.1711709697990;
        Fri, 29 Mar 2024 03:54:57 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:12a3:1a21:d8f:fef1])
        by smtp.gmail.com with ESMTPSA id l14-20020a05600c1d0e00b0041477f95cf6sm5054656wms.13.2024.03.29.03.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 03:54:57 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio: fixes for v6.9-rc2
Date: Fri, 29 Mar 2024 11:54:52 +0100
Message-Id: <20240329105452.17036-1-brgl@bgdev.pl>
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

Please pull the following set of fixes for the next RC.

Thanks,
Bartosz

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.9-rc2

for you to fetch changes up to 5c887b65bbd1a3fc28e2e20399acede0baa83edb:

  gpiolib: Fix debug messaging in gpiod_find_and_request() (2024-03-26 12:50:50 +0100)

----------------------------------------------------------------
gpio fixes for v6.9-rc2

- fix a procfs failure when requesting an interrupt with a label containing
  the '/' character
- add missing stubs for GPIO lookup functions for !GPIOLIB
- fix debug messages that would print "(null)" for NULL strings

----------------------------------------------------------------
Andy Shevchenko (1):
      gpiolib: Fix debug messaging in gpiod_find_and_request()

Bartosz Golaszewski (1):
      gpio: cdev: sanitize the label before requesting the interrupt

Mark Brown (1):
      gpiolib: Add stubs for GPIO lookup functions

 drivers/gpio/gpiolib-cdev.c | 38 ++++++++++++++++++++++++++++++++------
 drivers/gpio/gpiolib.c      | 32 ++++++++++++++++++--------------
 include/linux/gpio/driver.h | 17 +++++++++++++++--
 3 files changed, 65 insertions(+), 22 deletions(-)

