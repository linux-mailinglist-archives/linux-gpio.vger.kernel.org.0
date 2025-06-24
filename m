Return-Path: <linux-gpio+bounces-22055-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C7420AE6621
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 15:22:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 250EC188D6EE
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 13:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EA242BEC2D;
	Tue, 24 Jun 2025 13:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="MrkJ6j8u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D7E23A58B
	for <linux-gpio@vger.kernel.org>; Tue, 24 Jun 2025 13:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750771165; cv=none; b=XxRUmJ7U5py7j6htHMhpxqsVfVi90U8J99NKzxrT+P7zJ576qrci3Eez7pmHcq86xYYHZqHlND35a0I8C8m+dmx/N+AHkHYndFZTRW8NUwKrXW03H1z4/pind8NFMKkWOACBRmvhnWGAiallX07V0Y+hMM+Daers3UUcfyXLDtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750771165; c=relaxed/simple;
	bh=RBJgsZUC1nqNrB3wsNH3awWX5gMKJEfJFb9c9F8tuQg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sC0/tYW2VIAokkj5khY1wsdok8hVq4COZjr4O5kGiWP/ShJkZvF/E2UPiUEc3qeTh3iPpGY1jHxw8cJV0dBHv/xVYJt1f8d4J2PdQdfrjtgVCFA1KDlS5yz4WpCQJSAv9qLdRa8PWC/kQwa5wp4strADQH/RLlDnigHtAMpdO6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=MrkJ6j8u; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-450ce3a2dd5so50124665e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 24 Jun 2025 06:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750771162; x=1751375962; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gsa/afuzkL/muRZEKJaSmP1G9IRaDNhW+p7U3bAdGsU=;
        b=MrkJ6j8u+jLoenziiKTqh2kyZ0dwmtdT0pcDZ2Wj1bngH4KGOc2vefKK+3GWHyBmla
         WB1lFtF/F+OMWeg/ZAPAfHwGeICcjZTMjj+oFk2o6HN6iGGnyrx0Ga85F8N6Ul/G4fgp
         feUTV3aoKxw+93Hel/9jOjm1uHfQodNz7pZ0vRBVfPeiQgVfuAe6D959XzpOp4bHiA+R
         f+aFlnWyyKHcvzM2UBR4pvWmuHKsgOV+5UTQISDSefkBJpjTf0uzvfWgBwsajFK+V0mK
         M2/eUDB3XOIhjffGEAVfS0/j8Lt8+3FKBiEFxDYQSEc8CQT4Zwu/Wy4BjiKxL+4wIJEZ
         sAYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771162; x=1751375962;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gsa/afuzkL/muRZEKJaSmP1G9IRaDNhW+p7U3bAdGsU=;
        b=EflpB+K5nCU9eUctizhdNJJDtMNwHj9orfLn3MLlrMbIrTbDgQQoPFEHPXWChWBn3m
         06hBs6VQ/cQxZK85/qhUJPt6hNHsqi/iqWhJhl28yh1K2gn3fsC+gJgNcUVoWbIClwww
         H7U2azzM82VNmwlk5fJ/IHIYCDrslg5hafVA/uBNChH9fpFS5O02KeS99+Kk2on5qCZl
         luG1CSLqiXyNONgD0ssIxcnhwyTlQ4wpTFZnbSFSzkgpOg1zru+bMMoagC359AOPyMdg
         Lqm8zisXQeDkmZK8RmufJfeo8vuSHkQ1iSp40Z1B4U1128xX6YMgDX3D2dQGREVw4FU3
         mIAw==
X-Gm-Message-State: AOJu0Yxgh9+WWZ0Fh/3j/+93/4ADqKQvO/z80Cpap901/Czk4vsexYE2
	k/ooQUXWm1xnQGYTakO/ydC7VsJLGjSqsBmyos/AymPc2Uas4HX3JMrelRPZIRukq90=
X-Gm-Gg: ASbGncu0AH7o4rE2nPWwtm7+EeplJutP++7HSTevhrLXCFM+DFdktoPoM77pQ7/YpVv
	Vk3l/XhhDn3sl4rhXhhHwpCDCKkNF1wCZsmJ5WxCPyexOMrRbrMIyqjaxLefQgh2Mam3ENE8FEG
	S6Wev9D1wIfMJZjglOyKtL8kU7os9CxGn//617W7vO5QSkSkl2TyhsJ8i+Nw2RlykcXxyy6PKJX
	iC05IQoIi/hgbJxnpLDofKPS0UwEfZBbGpR/4Kmgb+hp5FGE40RONz3AZtwh84JVXLpHsPnFbaj
	TOvEPiD2h74v60tzoCwMNHnb++klcOilQvsEETxt1zdSb9g162vMgLUMxMUj74oSig==
X-Google-Smtp-Source: AGHT+IEhufAimrhHUzQr0xQtqQC2Hgx0D1VrIPHbO4Qbkas268U0OlP1XXIhz9Fe5pfneFNyUPhByA==
X-Received: by 2002:a05:600c:3513:b0:450:cde3:f266 with SMTP id 5b1f17b1804b1-453659cb94bmr143802515e9.22.1750771161882;
        Tue, 24 Jun 2025 06:19:21 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:34d2:109c:3293:19e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646fd74asm141302195e9.22.2025.06.24.06.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:19:21 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH RFT 0/6] gpio: mmio: remove struct bgpio_pdata
Date: Tue, 24 Jun 2025 15:19:11 +0200
Message-Id: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM+lWmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMyNj3fSCzHzd3FwgUZCSWJKom2hhbJhkaZZqkZJipATUVVCUmpZZATY
 xWinILUQptrYWAD6NQxlmAAAA
X-Change-ID: 20250623-gpio-mmio-pdata-a831b96e8dd2
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-samsung-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1805;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=RBJgsZUC1nqNrB3wsNH3awWX5gMKJEfJFb9c9F8tuQg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWqXTX/fNaYZzZKf3DgFDCitzH9bRN6VhuKlO+
 tLHKsv3sa+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFql0wAKCRARpy6gFHHX
 ckkBEAC3x6MUKlDkZ40OSpS/a57sn/SpQw1u6hapoGkV4PIgEA2b0WNC/5vJVsMsJOE7bEo4415
 d830z2CMbbRl7AA+Q69vBRvmtexOFGW8Zf+5YD9qe2VxlQ+ZhDIdQjF8vG3BBPVfgAAFQLcDvGc
 7eqG8XUAQISuMRzX8jx3aCfaSXu89LnAFmfsLWVO2PFZ1lOMNLyC+FBvxMjBtKf9NjbGjX6g9Lt
 WSs3ihAWqXpsQrMA5j+Sk9pDAAskgyVdnMVP0R1vWn97KCF/aKeXuX3PTKxLgAwkfTtDblPkuAY
 V59ViJhzoB7/+ecRrLUeW7bXb8iJVSVLxRyqakya85TgiL8a0iAFueJ3mbFURtB3V0dk5bcyhZj
 j+t7vqzDcp/lOveEU7abAQm6LW4o3s6jbSEGJqmt4zZLlSuoUdnbTQkwh6O22LbvSsPjt9vfwTu
 ZhWPf8Ul7BSRtjDSrv0G+1pJGMwxzot5HDI0jJKeg0oEd5Mjky6Q8DV6KxWsBQgVKFwB7PE0uE3
 HMkjg9Zqh1+h6aMeFgiEFlkIL5Fa2g+z5SxKXPOiXBP8ZisOEORPZWaBKGx8H1kOTcrlKz6Yi+s
 HRSE9OFs+vg4bWEVBmI4/Yxm4hb4THlDk0eY14SpBmXtl8Qdm279L0/AapoAzTPYOAddTSPgtmG
 kylguGrG3el0upw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

I'm working on removing the fields relevant only to gpio-mmio from
struct gpio_chip. One of the bits that need addressing before we can do
this is the removal of struct bgpio_pdata from the kernel. Fortunately
there are only 3 users left treewide.

This series adds support for parsing of generic device properties to
gpio-mmio, converts all users to setting up software nodes containing
relevant values in their property sets and removes struct bgpio_pdata.

As for merging: it would be best for MFD/OMAP/s3c maintainers to ack the
changes and let me route them through the GPIO tree. I can provide an
immutable tag if needed.

Obviously I was only able to build-test the changes so any actual
verification is appreciated.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (6):
      gpio: mmio: drop the big-endian platform device variant
      gpio: mmio: get chip label and GPIO base from device properties
      mfd: vexpress-sysreg: set-up software nodes for gpio-mmio
      ARM: omap1: ams-delta: use generic device properties for gpio-mmio
      ARM: s3c: crag6410: use generic device properties for gpio-mmio
      gpio: mmio: remove struct bgpio_pdata

 arch/arm/mach-omap1/board-ams-delta.c | 42 ++++++++++++--------------
 arch/arm/mach-s3c/mach-crag6410.c     | 17 ++++++-----
 drivers/gpio/gpio-mmio.c              | 57 +++++++++--------------------------
 drivers/mfd/vexpress-sysreg.c         | 46 +++++++++++++++++-----------
 include/linux/gpio/driver.h           |  6 ----
 5 files changed, 73 insertions(+), 95 deletions(-)
---
base-commit: f817b6dd2b62d921a6cdc0a3ac599cd1851f343c
change-id: 20250623-gpio-mmio-pdata-a831b96e8dd2

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


