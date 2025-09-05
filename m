Return-Path: <linux-gpio+bounces-25673-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61920B45887
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 15:14:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 323201C27691
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 13:14:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8E9A34DCE1;
	Fri,  5 Sep 2025 13:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="EfWaZPkp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F8E350821
	for <linux-gpio@vger.kernel.org>; Fri,  5 Sep 2025 13:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757078031; cv=none; b=gDowzweSEkQ0E2IedOshjDuXHGAbzk6hoH+1svEtNIlsdlcjpvFHrGcAB8JV5WOiIbf67UJMvI5+JjmpEu4dI3odPLRnHdRiVpKP8GsAvo65iZ8afmJYRDFBXl0ATp7/c1bya8QEFLR2GwfHwQNKsq6UZj9o88neEe9hN0PB0yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757078031; c=relaxed/simple;
	bh=pc2WPgJcGLhrpFaKlsLQahXKA9chhCVy7k7/gF1Cbmk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A4SLh8hxjZZeAZcEoUiBo0WZ+UF3px2QdkZZY0t0Bi94UhCfojQ6SVE2CkDf4r6Nr5Ah1MbCZko2OTINiAKTfQfGySDqZJJfrsE8RSZ6jzDPD+Px0xNXieHgKLQRHxf90TY3eA8jiugR6FukpkFbuv/PjqWyMiBhiYy2pEAnZJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=EfWaZPkp; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45cb6180b60so13794775e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 05 Sep 2025 06:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757078027; x=1757682827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xNWX8w7J5IcI97nXdwv0jKcOCYSaYB+ZFn87ka9R6Bg=;
        b=EfWaZPkpSH4KTQKoh8fclPWGVfQ6EgSnmc9J+smP62pADd4qdYbLZOhZ4AyoeABjyY
         U6stjICBkpDvN2XmrihPO5CSox9NALv/QhILpo7soII6xHQCMDXXjc0mfAsGVGCPQkpK
         WmLN8r2fpkRtKdgmN8N8LQ31E78eB7MucVdnNQw5Cjdatz0TXz2yy69MWUPK4/XnW3Kc
         h/aCxFEHlsznlrz2FfJ6iMj2bK4frl53jIHKoiJ0KvURpoTquiuvo5D3LXKAs1iJ0yFg
         IMPjBiOVfyPyfMdcdr9FlBDu6Hfowqf5ADA9o3+tJx1p1SflB0aH6j1IaXz4xfqUb2Ov
         8YkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757078027; x=1757682827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xNWX8w7J5IcI97nXdwv0jKcOCYSaYB+ZFn87ka9R6Bg=;
        b=PB/U02G8P79KAobhvm+G8enDQIt23HRNOWIcx0yN2ZLzhSYYby0X3CSz2A4/JjQFPX
         3j9E5SAQ+wsxo420AuVNpD2HXT1QA+B9MgFRY6qUmvxmFCu7AAwbyWCef2CPtzMhb/BV
         Mn+hIl5ClGBecrjowrF2iZX4LZKUxkeb+r8GCqMSdzE3w6wXC4v4FCY74q1swXrEbBlR
         oDIGJp+HMolXxjsexqmlRNVwuDV1/tAcd46shwAape8Wa6KBXnBLpYYlymvl5S5JRSYm
         ubjDNLl/YG2mJvBZ8QX8IU5eXV/rElntXKdtxG4dr+x3PIJJEVcA3x3nruAZNOq34Cg5
         NM3A==
X-Forwarded-Encrypted: i=1; AJvYcCVFDlSVd6O2jUVyuK8xxeJ5isj4D04nlgJFewZZYo1gz93TOQcqFsUQx6tdN4pMkl7nBgGpyHrK+7yJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/At/RtUZy2VBfnDKJyb3cxpH6y8y28R2Ud39UB0gGiRYUShkF
	wcNZdmLj18V2x86BVI75GQmRimdxViURzwK8YJWMzVVlpi36NmPlU2DSU3Sbv7Nbft5O3Hnwghy
	lXbrv
X-Gm-Gg: ASbGncuVMQlbJ3e9q3JC79YSt++34Ytx5CEI3+MTkon3eRrGv0W6PTm6tNFEWpufypu
	Yu34VQ9aKTHSh1LHXJ5nXb1In2pCX6acBZN6BUh37SNAFCBOwA2m8S2dVwAiTgvScEUM2Ap22R3
	sepbIm7ca5yXdlUumd2Dry8yKfTfthJNupQKciSl1FmoH7Lnk607UuHiGJINYc0Eq0fY7SbXnnb
	vYG3BvOjTOjPdjTswGaKihrqthGmAhiThsydyNhVj2FVM2qYJspUVkHrmjeIBIbMEzYfkv3nRpX
	xw+fkDS5L0b/XpyyXOaP9xY3dEpnbc+4cEbGxR0ZaggUbFDGUGP5XYkXXBjZf3Mslmp2UxC3TW5
	c8P+X5fVbx26gWx5uJL6cVnI=
X-Google-Smtp-Source: AGHT+IFFbThKQaUMn97luKJ5NYCELBoHvf5CkKM0PAFFCnugiFcAZ60cVT3FxKj4IggIaIVjsWVqcw==
X-Received: by 2002:a05:6000:18a8:b0:3d9:7021:fff0 with SMTP id ffacd0b85a97d-3d970220156mr11098273f8f.37.1757078027295;
        Fri, 05 Sep 2025 06:13:47 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:35ed:b892:eb7c:cc5f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b98e77231sm155189905e9.12.2025.09.05.06.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 06:13:46 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio fixes for v6.17-rc5
Date: Fri,  5 Sep 2025 15:13:45 +0200
Message-ID: <20250905131345.105630-1-brgl@bgdev.pl>
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

Please pull the following set of GPIO fixes for the next RC.

Thanks,
Bartosz

The following changes since commit b320789d6883cc00ac78ce83bccbfe7ed58afcf0:

  Linux 6.17-rc4 (2025-08-31 15:33:07 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.17-rc5

for you to fetch changes up to ed42d80f3bae89592fbb2ffaf8b6b2e720d53f6a:

  tools: gpio: remove the include directory on make clean (2025-09-04 16:29:28 +0200)

----------------------------------------------------------------
gpio fixes for v6.17-rc5

- fix GPIO submenu regression in Kconfig
- fix make clean under tools/gpio/

----------------------------------------------------------------
Bartosz Golaszewski (1):
      gpio: fix GPIO submenu in Kconfig

zhang jiao (1):
      tools: gpio: remove the include directory on make clean

 drivers/gpio/Kconfig | 6 +++---
 tools/gpio/Makefile  | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

