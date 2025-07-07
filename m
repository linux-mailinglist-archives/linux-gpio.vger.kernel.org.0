Return-Path: <linux-gpio+bounces-22841-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BE407AFAD66
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 09:42:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F6513BBF4C
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 07:42:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48BB4285CBD;
	Mon,  7 Jul 2025 07:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="aiNFnkaw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA3228981A
	for <linux-gpio@vger.kernel.org>; Mon,  7 Jul 2025 07:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751874127; cv=none; b=e4jlw4X7CqXoiOulBp7s3mbrZ3vnrhDNftrU86MEcivUvMAWlhiyS7MMG+prn+DdfHtofRteGULUAQcglrENZ27PShHlkbO+bUzipXZ2Bdk8GYdPBsep3f488304xfit4bRn0BGdS6olTtkp6MiVhSHPDTDkDQpuWhjfi+tUW3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751874127; c=relaxed/simple;
	bh=2oKgQpwQgsPL+7EXCiATOc+S0pR2sm/0S4sqSSqcejc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WTNkgpSgdvTxDWtP1vnXyp4lb7kgxdpdfGZa0yu9jZrUygWq0AueQqkL5cA+j1k/2gIeV1QmiO4sfcNX7FHRNtEW6fwpIc/z87Nf3zueLQ0YkFETIhHP5tVYAPVcRM582WfTsh31M8FeyDahXHjhGr1mYgJnrihinD+exUTGDbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=aiNFnkaw; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-453398e90e9so17592175e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 07 Jul 2025 00:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751874124; x=1752478924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bDb2QDDbYI7e1da4zOCjqVkWLKFqFwWgy3CDKFih7gw=;
        b=aiNFnkaw0vNoS/Da3dzKI9kHaHzL9yx2Jwg9BguUOThYgoDU+tXR5H36aPt6TozXPd
         iaLtNjb3ArE0V/+cmOQHxTJOzqaaUdgmErsAT8BKmM5e+HKyf3X/ieWmG7n6HBbcyT3g
         yF7Cqf2Bo7bvS1NUs1JTWGwh1HoC32grNomSS473pgRrVBH5ANKHmoTfvU5T+ys91Kik
         1FwTqftf5bHf/6o0xeNR/J/fTjrUd9y9TQdGseGJhDn+1vE/d7AOZmwVtioA85q5qzRC
         jX6YSeeebndDo+nDMbcmQDFyd3UPvPsZM1jztt3c0/xdv+AqhywEuW9XELBeuKijMzua
         VVWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751874124; x=1752478924;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bDb2QDDbYI7e1da4zOCjqVkWLKFqFwWgy3CDKFih7gw=;
        b=PHXuXqSTfTC/NTGMqecufX/aWATQA5O5zAdzbvlMMrhPm9vNdvj83yiG+UEWKFFV5W
         PY3tGQEgeDRMGCJx2zyuhEMYv0WM1t0nZm6RjIo7/TSpgo87lB/Xaew8RjYG6DFCr23s
         Rtq6KkS2EFhkhjcju90I1yuMilovr8qj9mWlq85apOciOfnX7tKpO/EtWEGeeUf2WeYg
         sM7nAxGIH0GFK/ufLLgKsuJZmaCEMQaVzp9DWVVsw79bUX0gDU+n7v36quCzxa6F3s+S
         v4ovKMN6kVNtp82zj9BscGhvPQJW3aVNerr8Wp7pRF8j4sepTeJdl1V0qhWdwDIxy8Ln
         t7bA==
X-Gm-Message-State: AOJu0YxQbS+aCMju6lcu3ZXCsY/xuA9rJGAZQ7F37Ay8AAKoAX+4CviU
	nC4/m270W3Z2BKwTwGzMpEM+xbom6mBmkmrpnscGNSjyAzue4vFdo6CAZjidf4d0QZs=
X-Gm-Gg: ASbGncsWdcOZMqTUN9fFyl5qQAUBATGuQDMJANhdqYCCLrovb3c6Sx3CAJNJClzztY2
	uLTX1WzHxp/FYgmKYO9RMho9hwDKpj5J/zaugNsNhne9to4QOvlwigpLJUXe8vWKsqUhf6Tzf39
	odvdhDU9O0Tnorm9TNzfaUhWRDEDwVddZY3WyuX94xbxWb0y0Cws1aBL5vzlPetjJ9fh5nz/V+T
	KIGpVh2EUyZ8UIWSr+Ks0UzbNvj1W1dNWGp21D/L/L0g3gCVRACBKmRVQvSqZZT2Xk/vjuSafIr
	4a/XqIjufHeWmdRlRRB2kZWOJEWHuXSudyeW8V8Hj3aJTliZnjMz8djrviAGgA4=
X-Google-Smtp-Source: AGHT+IEWekPleecTkqzHnxj/5d4ocJg6iJ2GS+S28dD/Gu1BHihs4HNC2F49+o22Hs0t3Y/zfvGdYQ==
X-Received: by 2002:a05:600c:4755:b0:453:6ca:16a6 with SMTP id 5b1f17b1804b1-454b3116236mr125103245e9.10.1751874123696;
        Mon, 07 Jul 2025 00:42:03 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:3cf3:a61f:85ed:69db])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b10b8c89sm107026185e9.38.2025.07.07.00.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:42:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Lee Jones <lee@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-samsung-soc@vger.kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] Immutable branch between GPIO, MFD and ARM-SoC for v6.17-rc1
Date: Mon,  7 Jul 2025 09:41:49 +0200
Message-ID: <20250707074149.11000-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Hi!

Please pull the following cross-tree changes for the next merge window.

Thanks,
Bartosz

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-mmio-remove-bgpio-pdata-for-v6.17-rc1

for you to fetch changes up to 9bad4bec5daddbb296481af759f9d56c849ba96f:

  gpio: mmio: remove struct bgpio_pdata (2025-07-07 09:31:08 +0200)

----------------------------------------------------------------
Immutable branch between GPIO, MFD and ARM-SoC for v6.17-rc1

Remove struct bgpio_pdata after converting its users to generic device
properties.

----------------------------------------------------------------
Bartosz Golaszewski (6):
      gpio: mmio: drop the big-endian platform device variant
      gpio: mmio: get chip label and GPIO base from device properties
      mfd: vexpress-sysreg: set-up software nodes for gpio-mmio
      ARM: omap1: ams-delta: use generic device properties for gpio-mmio
      ARM: s3c: crag6410: use generic device properties for gpio-mmio
      gpio: mmio: remove struct bgpio_pdata

 arch/arm/mach-omap1/board-ams-delta.c | 42 ++++++++++++------------
 arch/arm/mach-s3c/mach-crag6410.c     | 17 ++++++----
 drivers/gpio/gpio-mmio.c              | 61 +++++++++++------------------------
 drivers/mfd/vexpress-sysreg.c         | 46 +++++++++++++++-----------
 include/linux/gpio/driver.h           |  6 ----
 5 files changed, 77 insertions(+), 95 deletions(-)

