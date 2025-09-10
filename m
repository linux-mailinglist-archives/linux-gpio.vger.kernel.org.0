Return-Path: <linux-gpio+bounces-25872-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E84F5B50F3B
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 09:26:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C3D024E04E6
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 07:26:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B8BA2652B4;
	Wed, 10 Sep 2025 07:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="rftVax9c"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C468330ACFD
	for <linux-gpio@vger.kernel.org>; Wed, 10 Sep 2025 07:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757489154; cv=none; b=r5MSO3i0lKn8+W6ObxYzPHfFITbLUNYyRwsYoP3ccGpXFo1VK3oISOBQmGcUZIAz6qwpg5oUSOJFRV3PMdh7RnjQhjJpS+Vhc4wRKr6Dzh53uBXeqwTbtiNT6VjkXAnWN5wXYsX2ehEjzcIHG1qb5qnNRG21AS/Q+igCm/iOje8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757489154; c=relaxed/simple;
	bh=mbaKzHcgj41PgNucTuXNTRRDYpWfb/AcMMrNDA/c0O8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=frnYZheSjxfsCLajRfTG6j5FrdoF8ZK/upK9h5MANz4AW6NJ3/wINeuDsYkV7+dCeCrwa/TShrqQjIZoN1xb9RcdG/8WPtRnpHD3Z7Lt1mb1Z34gWG4tc/LNJ0yXhyHMAqNq390nxqQKbW9gYXkWiiAr5Q0dawmMptDTu4L1zsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=rftVax9c; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45dcfecdc0fso55794955e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 10 Sep 2025 00:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757489151; x=1758093951; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QAOVD/NXoo6Qinrlhcnn2ltKwFLoKauBP77YUEELpDE=;
        b=rftVax9cfDzq6pA2J0VoR63ZDgF+SC0MGPaxbWEd+nK4XJ20wbeYwbsv6d5SNE3P+9
         Oc2X1sQCqrNmhh/h0HUn59wXnkGVOvrWyj4Hpr+sdI61pFSAuOR5qEo6FV48rnHtAp9A
         EsLXa1gGWFjmwmwReJaweFcXs8sG2t+KQhUhCrKbhBL98w/YTIykSdALgDijssLh2Zpw
         M1YwygrZXbJ3fF1I253VxaCfhcLX18+HNuimjwgvS5/yQhlc27zmwCyOUUN3wyL3y4rM
         Cud8eHXUZjCHxvjwhou5DNGUntMTltlJM+mKwT1Ji6d2PzxyYcjFnEoBPo4Yikk63djF
         5MUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757489151; x=1758093951;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QAOVD/NXoo6Qinrlhcnn2ltKwFLoKauBP77YUEELpDE=;
        b=xBEW/4i5zbHype2Qcue+MZOW0y18oSc6Y/GGMbNHEIzK+teelbKQmGTDDBfIAL4dxq
         BA8CYkJG10zH2qAKTBZJPhb7Zdz7DSygwsTNTvN5JnnJIIv3z2H1w8NNucvaNW/j9oG2
         hQDLtuJy4LRcn5N2SuJIVkzjXxf3D61UWZqoZMTdxnx5B5+3/96XcMnWP7GPo/6dvyvV
         aKli9saDkwc2vRxzkjWPIQdo+Ren3dwsB0bo5Mr+6mn8G1iIAISMnbxuoFp3ULrckeuB
         EZkWMGd+CXo+vkAWWgO7MEOPLxDYXTxmwf1+8huYgJWFSG+YCt5EqipX2kKg+z3WgwOq
         8KUw==
X-Forwarded-Encrypted: i=1; AJvYcCX01iNcFOEXeq590X5FosbROLMfjCTmbEgaAq6FExtj5yU3H5P1oh2Q52CPRIqpjstP0aWSXMFiUU7c@vger.kernel.org
X-Gm-Message-State: AOJu0YxSfSJvGIijEpHV9lUGgUtYYs1El4uJRBDkdvm8smqPBhU7uxHr
	SIQG+HXJNdz/9Ii3x1ky8iPcVCzsSNcAy+SJaAbWDFCvU8NTQSvT+VcuOvrqCxk/2+4=
X-Gm-Gg: ASbGncthwiyq2GUs2yiImHGDzhgXzGuxCLQCU276muom8CmI8RrxP5jM/72SBkYa/xg
	QdCleu8Qaz+/A9SeeOlJbjHoM8M1aMolDFQIWowXb/x/4YgGZIEo1toSrp1O+wmnLA3g2l8Fhtb
	h4nRdbRNAikiG5kYAJT5Nobhsmz80ipAFTRJ9e1dJXNaric7+s7f8EmgRUbpTErDH91rZq3TupJ
	1eELLDsNnVAyN/QTvJMsVlEDEdBhQaOOGXewkwLp88VkX8PUTqYierGPSn3+5ehyZa6isFgwVpP
	AbJcV3OSva22zJiGnGiStf1O2pDbVqQNCxER/ESTo8jUyrtVU2WvnNzGCREEzrV4QoqcCB7NmcG
	OmBz0G+uZCBaeGmUIwu05OHpylqUG
X-Google-Smtp-Source: AGHT+IHGcMRUmLBYK4SgC+8FxVXfL1XsZk92Y0HumCVsdD0bP05sNhcUQfhnESNzNcG8GqNwFSRO+g==
X-Received: by 2002:a05:600c:1393:b0:45b:7b00:c129 with SMTP id 5b1f17b1804b1-45dddf021a4mr111254435e9.35.1757489150984;
        Wed, 10 Sep 2025 00:25:50 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df8236428sm16729825e9.24.2025.09.10.00.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 00:25:50 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/3] gpio/pinctrl/mfd: use more common syntax for compound
 literals
Date: Wed, 10 Sep 2025 09:25:44 +0200
Message-Id: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPgnwWgC/x3NTQrCMBBA4auUWTuQ/kiJVxEX03Ssg8mkTKoUS
 u9ucPlt3jugsAkXuDUHGH+lSNaK9tJAeJEujDJXQ+e6q/POY6I3Y8hpzR+dMcrGRrGgZksUkRY
 SxbZ3Yx/COEx+gFpajZ+y/y/3x3n+AJ5+BqB1AAAA
X-Change-ID: 20250909-make-compound-literals-normal-again-13073cc74b94
To: Lee Jones <lee@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 James Cowgill <james.cowgill@blaize.com>, 
 Matt Redfearn <matt.redfearn@blaize.com>, 
 Neil Jones <neil.jones@blaize.com>, 
 Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>, 
 Hoan Tran <hoan@os.amperecomputing.com>, Yang Shen <shenyang39@huawei.com>, 
 Imre Kaloz <kaloz@openwrt.org>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, imx@lists.linux.dev, 
 linux-unisoc@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2536;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=mbaKzHcgj41PgNucTuXNTRRDYpWfb/AcMMrNDA/c0O8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBowSf8fAuHxdMgXnxNQ6BJ55Q2hyWr1ftxMskiL
 dcle+ZX0s+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMEn/AAKCRARpy6gFHHX
 cr6ND/99HqQnU9BaJ0rG9nmyHWz9UVNShxsHcidnTQYDpvGwd2PHnJcJdwpjGZC1msq3r+GB/ga
 /zA5bR2ZsRzfO/XKfM2IjjN6BaSGRl3qj9qX5cxH5gT86+KMQWrzjOYsJhcIldkm+B/vxqqMHom
 MFHfiq0n0NhdzWqe4O3C1X7fVIpRgGSXVSYfka6cg3On8jzmA6PyhkaYa706xoCHPHckqJaKRk1
 P+NLmTJxoupn2H21plGDEESji9GS0g3dXUS7H/uHSv5ILsR67EA6A21k4utyvCfQNrL/27uhiSm
 hxO4JygFgiZBOLGyX7WXgmTyFKtFZ9mnl5Y10vpz7itfuPUJWQk0GJ594d7f3ZIDJqZueax0J1e
 Z9CFk6U3ZT1jZ/oMIJAydNph0r1xH5OHAbczLcvLOoR5GkxxP5NePvsyr7k0t2+6Xw2Nukz4n05
 aQ1qzE7sNjWX4cxaqeRfInnYZHQy89Qf+mTyJKVrx3MAz+sXZHhtN5Q74xMDTydQMOhKX/iaZic
 YfBgTRRt9OWEIaiGrlyxYGj1whz5lTrSdziP3ZNQQRyBqFA1bYzMOGHlTHK2/1DSVLM6EOMheNZ
 QVH65EM200UB4DiHwbgDAcSSaAhQ2UUoYc/mi5fX28HetdMG3CdC40i4ZKPvnCNmCf7Ld3NAZoi
 Tx4rK9U0Rc28ZCA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

As discussed[1] with Andy: it's probably better to use a more common
syntax for compound literals so fix the commits that converted GPIO
chips to using the new generic GPIO chip API and make them explicitly
spell out the type they're initializing.

Each commit in this series can go directly into its respective tree:
MFD, pinctrl and GPIO.

[1] https://lore.kernel.org/all/20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org/

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (3):
      mfd: vexpress-sysreg: use more common syntax for compound literals
      pinctrl: use more common syntax for compound literals
      gpio: use more common syntax for compound literals

 drivers/gpio/gpio-amdpt.c                 | 2 +-
 drivers/gpio/gpio-blzp1600.c              | 2 +-
 drivers/gpio/gpio-dwapb.c                 | 2 +-
 drivers/gpio/gpio-ep93xx.c                | 2 +-
 drivers/gpio/gpio-ftgpio010.c             | 2 +-
 drivers/gpio/gpio-ge.c                    | 2 +-
 drivers/gpio/gpio-grgpio.c                | 2 +-
 drivers/gpio/gpio-hisi.c                  | 2 +-
 drivers/gpio/gpio-idt3243x.c              | 2 +-
 drivers/gpio/gpio-ixp4xx.c                | 2 +-
 drivers/gpio/gpio-loongson-64bit.c        | 2 +-
 drivers/gpio/gpio-mlxbf.c                 | 2 +-
 drivers/gpio/gpio-mlxbf2.c                | 2 +-
 drivers/gpio/gpio-mlxbf3.c                | 2 +-
 drivers/gpio/gpio-mpc8xxx.c               | 2 +-
 drivers/gpio/gpio-mxs.c                   | 2 +-
 drivers/gpio/gpio-rda.c                   | 2 +-
 drivers/gpio/gpio-realtek-otto.c          | 2 +-
 drivers/gpio/gpio-tb10x.c                 | 2 +-
 drivers/gpio/gpio-ts4800.c                | 2 +-
 drivers/gpio/gpio-vf610.c                 | 2 +-
 drivers/gpio/gpio-visconti.c              | 2 +-
 drivers/gpio/gpio-xgene-sb.c              | 2 +-
 drivers/gpio/gpio-xgs-iproc.c             | 2 +-
 drivers/mfd/vexpress-sysreg.c             | 2 +-
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 2 +-
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 2 +-
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c | 2 +-
 drivers/pinctrl/pinctrl-equilibrium.c     | 2 +-
 drivers/pinctrl/stm32/pinctrl-stm32-hdp.c | 2 +-
 30 files changed, 30 insertions(+), 30 deletions(-)
---
base-commit: 65dd046ef55861190ecde44c6d9fcde54b9fb77d
change-id: 20250909-make-compound-literals-normal-again-13073cc74b94

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


