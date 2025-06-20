Return-Path: <linux-gpio+bounces-21939-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5B2AE1C7D
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jun 2025 15:46:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24DFF1666CC
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jun 2025 13:46:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D37828B4FD;
	Fri, 20 Jun 2025 13:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Yf9CBPs2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B63223183F
	for <linux-gpio@vger.kernel.org>; Fri, 20 Jun 2025 13:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750427168; cv=none; b=U6M6hZu20+w7Ny8nXgRUVdSUnXL2wz1SGUokxa2Qh7PnduA1QNbwKukwo+nPWzYN2fPm6sx3bNm4MtGPyLX97EelqIt+QR4JmmzVsWlniatjr4tZnc2FRF3FIuh6Qz0Tq72X+sfhTPk/rmIwBhCwiX6rTYaiiDCcx0JgRCndso0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750427168; c=relaxed/simple;
	bh=IJPxx/8CSit5u8YWIiRwcIVEMyk6eioXTZfQ0C6DKrc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PBUOPNb6LxCHVPTzr8f1dkkDjXdl4FYEntV6MrW+8oTJOElxkQOizLXd4/AilhR9s19p2tsyI01ZZHLac2Wi+qdEBysJxTbNXTYURzlUSKGES0VWL+cwzrvL9nqDBmYVRCIhn8VNSAhunEmLXcYi9pvekvU6LBOR9PeeU+8L0WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Yf9CBPs2; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-453647147c6so9048695e9.2
        for <linux-gpio@vger.kernel.org>; Fri, 20 Jun 2025 06:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750427165; x=1751031965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xnbbZF0mgVLEqOkcFAOg1RxmEXcv9IgRKhCyVN6STvE=;
        b=Yf9CBPs2+ODUhv4qVlya7qnegjzL8Q+TPsYye3uiyevXUtGlXDvRsQnoDBizZ6smBE
         bXQv5Hvq+JycUpCD5EfUwal/JHVQKJ4GkEl7Ex8P6Fi9IttyGedQn3nCsnAld6zD5uxQ
         kQH1XjjoFS1tbSW6G5S2tTbQv+dBYrJ13MqZ9GfX0cKtq42KUJ7pv4KtRQWRSXWtzyRh
         dGJHp2mkKZubgbRpqUfI7myBFNiTDzLB64PSp+bjSVdZkrwWWWiY8j5rkDUcCzo77nLg
         Xai9KSSTD3RcIYN3SSolh7WEmMCyXSurBc/cvlfJb6gJtiypO/sEJvByhfDZXwaDwQpY
         KDzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750427165; x=1751031965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xnbbZF0mgVLEqOkcFAOg1RxmEXcv9IgRKhCyVN6STvE=;
        b=dhFPrW4EGFb6CwF7wD6w4X+cdJeklN4m8zCPoP/FQgp20ClazjYwWk1ayMftyJxXwF
         cUyg35c95uOkCQWV2BqA5rZ7Dkl59J5YJikUS3cwDRcP4jrMHyUKRmuKlUjleBZpwLCq
         UK7paSIZvF8XUWv7KCesrNEGkBGDOMf1kI0wrN00nteaYS8LP34tW+8VUelKCjWHR6Wv
         O6ztU3pFUdExvZsnanZB9GZIMndq2M7aUgC8QKWUl7YhjztWCXBRlGxTM5vcPrNX0i+H
         Hw2PliF6/6sQhb23FSBOOCNsZ6TPcwcAgx3GIDo/g1r/Q/pd5+ASw++0bmJ8jXUdW3fF
         oBUA==
X-Forwarded-Encrypted: i=1; AJvYcCUcdhzNWLQ6DodYf9BLWeORFh+08RbcTwm96Riu6i2Y0429D8uw/hwT9l5vxPs1/r7m7RpI6Fv1MDpr@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv/ov4WIPGbalvUo/B4eAK3oz82SzseM7j05e/ncksE1iBy9B6
	8TCU5K0CqvFgYtBOXBY+bXnLqeM/aFC2S5PeapE1N90Ja18AVNEo+/nyaUxhA8cFG18=
X-Gm-Gg: ASbGncsRg3Ywou8euzfs7pl+s+461Xc1KVlAHhKE1+AKUzJ7DP4VSQCEercro5Bn5GC
	CdfCy55AiffE/Q5+kbdl6JwtrI4/5HDFd5Zd5l5UBhuNP8GsuPey4rusME+0Mef5YCyzYrumr62
	VHQPZDAwBwTT00L3FVr9IQvi0CUc9d2mak+KtR1cJvoXpxXAk4dpamgjBbIbmWCBEkQTT4ZOhpX
	iminlmuPd8eoQ8wJfcDD69vJyDfO1OsD+KeQdoLTZb58LK9jyfkB0k464wQHNL/yE9mZ43e5+wN
	ACl15l653u5PR7aN/TsbXYLrfmkVq71VZwF8GgAe322XaeFURXwA75mGaMBFUOt/W9D0wG1/Kw=
	=
X-Google-Smtp-Source: AGHT+IHE23+lfQrmmrvOY4gXFo8XmhpszpPqyuXRd+QCzWbJDAGWy+pg7cxPcbBy7LIK3eHWbQ1xQQ==
X-Received: by 2002:a05:600c:1e0d:b0:442:e9eb:cba2 with SMTP id 5b1f17b1804b1-45364791b6cmr33843335e9.0.1750427165627;
        Fri, 20 Jun 2025 06:46:05 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:69fe:2655:53a6:f735])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45364705748sm25637935e9.28.2025.06.20.06.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 06:46:05 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio fixes for v6.16-rc3
Date: Fri, 20 Jun 2025 15:46:02 +0200
Message-ID: <20250620134602.111269-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Linus,

Please pull the following set of GPIO driver fixes for the upcoming RC.

Thanks,
Bartosz

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.16-rc3

for you to fetch changes up to 10af0273a35ab4513ca1546644b8c853044da134:

  gpio: mlxbf3: only get IRQ for device instance 0 (2025-06-18 12:19:39 +0200)

----------------------------------------------------------------
gpio fixes for v6.16-rc3

- correct the ACPI GPIO access mode in gpio-loongson-64bit
- only obtain the interrupt for a single instance of the chip controlled
  by gpio-mlxbf3
- fix an invalid value return from probe() in gpio-pca953x
- add missing MODULE_DEVICE_TABLE() to gpio-spacemit
- update the HiSilicon GPIO driver maintainer entry

----------------------------------------------------------------
Binbin Zhou (1):
      gpio: loongson-64bit: Correct Loongson-7A2000 ACPI GPIO access mode

David Thompson (1):
      gpio: mlxbf3: only get IRQ for device instance 0

Sascha Hauer (1):
      gpio: pca953x: fix wrong error probe return value

Vivian Wang (1):
      gpio: spacemit: Add missing MODULE_DEVICE_TABLE

Yang Shen (1):
      MAINTAINERS: Update HiSilicon GPIO driver maintainer

 MAINTAINERS                        |  2 +-
 drivers/gpio/gpio-loongson-64bit.c |  2 +-
 drivers/gpio/gpio-mlxbf3.c         | 52 +++++++++++++++++++++++++-------------
 drivers/gpio/gpio-pca953x.c        |  2 +-
 drivers/gpio/gpio-spacemit-k1.c    |  1 +
 5 files changed, 38 insertions(+), 21 deletions(-)

