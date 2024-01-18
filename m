Return-Path: <linux-gpio+bounces-2334-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F12D831999
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jan 2024 13:53:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 892061C22A32
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jan 2024 12:53:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A776C241E2;
	Thu, 18 Jan 2024 12:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="tjOehITw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B157250E4
	for <linux-gpio@vger.kernel.org>; Thu, 18 Jan 2024 12:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705582406; cv=none; b=HijbZS8oE8t7/W6ZgQxih8AzdZAA7RUymFARmawy02S1nzqw6DNvHQaYCIrUfFU7DZHfTIVfhy6U9icIFnmmoOEhMe+GmuYHDG4SmzKsKvVOYq1pr705acVJyaxHjcrPsE7dka4T5iqvywbM7PZB7bOt4TH2ibh4l2onNdO9SbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705582406; c=relaxed/simple;
	bh=sXJi9gg0uJsuoxrQNc/wYI76+8EiIEebZjWq19GEBsQ=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:From:
	 To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding; b=U+owY2Nbe5t0iWHrDB7q+r9wCeNuvj1Iy6rwcek4Bs23UA4KprXQkbvWz+ae8V8+7vqceR/59DcaJnfdivMIo7ie3D3Bc7H5+9eMvt6UNqbeTGAmUbeujGwoqnjNni0x+I+hO1IrEqcapjtGOqkwf+q4W8MQtCeYpwZJNTEyuCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=tjOehITw; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3368abe1093so9540819f8f.2
        for <linux-gpio@vger.kernel.org>; Thu, 18 Jan 2024 04:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1705582402; x=1706187202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5q/z9NBhcvbN4NnTkJ2O74o645DmNo6KC9OmwgIIYJA=;
        b=tjOehITwkkUMbEOqLY8R8j1lBCVQTXiALlgsQvey7YRL5E5mTxVxnlomTw92nPBsgx
         tCcwojmIZrKxJttSQQ0ZRExak8bbq/aRKKenFTCXX7Vh3OGQSFBqMi6cFXxovyw7fpHo
         vU0vgPGisKhZlvmoNHkfXLnj3iwn2Al7ChzJCY3FwMnQzJoshWIIWxa2ESkG5gh11AYT
         BKKPhRmt7DCeQ8DFS+hIOTbjluDL4cE/yBsrXhlgQ0uQgc6S8vLQPXj+yZfO0Se7mLPq
         HkTgLMVU/C8iuggxJtJzS4HIp08rT03beYpEUhmozJosQW7IqFwWgXyCcgYUgPndjRPx
         P5aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705582402; x=1706187202;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5q/z9NBhcvbN4NnTkJ2O74o645DmNo6KC9OmwgIIYJA=;
        b=g1GHt6hMPaxzezzqwei898iX7U2VfDl2LtGCAv/KAltQm6lxWkde0gQR5e2jzH+gjr
         TDExnf6G9VuNHkriVP5xiQhFf4ChFolrM0eaLRJstv50+PmhHHd9HteY2qNctN+ppMJC
         ljwR/3a35XeURhusWHTaxtOElRRwytZjPqSB9vLpAGSRCaLYCauPeuMK39h31eUeq9MF
         zCxF98kH+dxdqL/LPuFKJ32HlWt3TG+eIMYok0hnlhDYlpLksaQ4JEcOzzcxbSM0Hz14
         qQ47OxgLuwmLAjhgWiqHaXWwxfW50YYTpFpzWQn4JqX6z85ibOzsnvF0yahe9aj03Hc3
         lkzA==
X-Gm-Message-State: AOJu0YyAP0VWFr9KdNmyNISZ3NYTKOX6Qi2zheH/dka/MOixHVIzDNUZ
	Ifn7MVq2tCHQ4FetBH9zmRijthHa5SYJyzifRLu/5l70Icz/04RQ2Id9EPh2Muk6nFzCvSudMMg
	3
X-Google-Smtp-Source: AGHT+IGwnmGE3nnxR8C1/nowvXURA7r/ihHCdKHEl7EfNtB+UeuxK2+bbwjSImCZkeofct8bBcdovw==
X-Received: by 2002:adf:e541:0:b0:336:8242:3803 with SMTP id z1-20020adfe541000000b0033682423803mr449563wrm.11.1705582401684;
        Thu, 18 Jan 2024 04:53:21 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:33f:7f63:7b64:4bc1])
        by smtp.gmail.com with ESMTPSA id i4-20020a5d5224000000b003374555d88esm4004379wra.56.2024.01.18.04.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 04:53:21 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio: fixes for v6.8-rc1
Date: Thu, 18 Jan 2024 13:53:15 +0100
Message-Id: <20240118125315.16778-1-brgl@bgdev.pl>
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

Please pull the following set of fixes for the upcoming RC. Apart from
some regular driver fixes there's a relatively big revert of the locking
changes that were introduced to GPIOLIB in this merge window. This is
needed because it turned out that some legacy GPIO interfaces - that need
to translate a number from the global GPIO numberspace to the address of
the relevant descriptor, thus running a GPIO device lookup and taking the
GPIO device list lock - are still used in old code from atomic context
resulting in "scheduling while atomic" errors.

I'll try to make the read-only part of the list access entirely lockless
using SRCU but this will take some time so let's go back to the old global
spinlock for now.

Please pull,
Bartosz Golaszewski

The following changes since commit 576db73424305036a6aa9e40daf7109742fbb1df:

  Merge tag 'gpio-updates-for-v6.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux (2024-01-12 13:35:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.8-rc1

for you to fetch changes up to efb8235bfdbe661c460f803150b50840a73b5f03:

  gpiolib: revert the attempt to protect the GPIO device list with an rwsem (2024-01-17 09:52:37 +0100)

----------------------------------------------------------------
gpio fixes for v6.8-rc1

- revert the changes aiming to use a read-write semaphore to protect the
  list of GPIO devices due to calls to legacy API taking that lock from
  atomic context in old code
- fix inverted logic in DEFINE_FREE() for GPIO device references
- check the return value of bgpio_init() in gpio-mlxbf3
- fix node address in the DT bindings example for gpio-xilinx
- fix signedness bug in gpio-rtd
- fix kernel-doc warnings in gpio-en7523

----------------------------------------------------------------
Bartosz Golaszewski (1):
      gpiolib: revert the attempt to protect the GPIO device list with an rwsem

Dan Carpenter (1):
      gpio: rtd: Fix signedness bug in probe

Lukas Wunner (1):
      gpiolib: Fix scope-based gpio_device refcounting

Michal Simek (1):
      dt-bindings: gpio: xilinx: Fix node address in gpio

Randy Dunlap (1):
      gpio: EN7523: fix kernel-doc warnings

Su Hui (1):
      gpio: mlxbf3: add an error code check in mlxbf3_gpio_probe

 .../devicetree/bindings/gpio/xlnx,gpio-xilinx.yaml |   2 +-
 drivers/gpio/gpio-en7523.c                         |   6 +-
 drivers/gpio/gpio-mlxbf3.c                         |   2 +
 drivers/gpio/gpio-rtd.c                            |  15 ++-
 drivers/gpio/gpiolib-sysfs.c                       |  45 +++----
 drivers/gpio/gpiolib-sysfs.h                       |   6 -
 drivers/gpio/gpiolib.c                             | 135 +++++++++++----------
 drivers/gpio/gpiolib.h                             |   2 -
 include/linux/gpio/driver.h                        |   2 +-
 9 files changed, 114 insertions(+), 101 deletions(-)

