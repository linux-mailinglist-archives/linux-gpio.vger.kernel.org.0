Return-Path: <linux-gpio+bounces-25999-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7C7B543D8
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 09:27:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64BE6684145
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 07:27:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B07322C0277;
	Fri, 12 Sep 2025 07:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="BoX7T3mu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DB12C0262
	for <linux-gpio@vger.kernel.org>; Fri, 12 Sep 2025 07:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757662025; cv=none; b=a74Fe1QZie/EJYAPnsFxhhdmPCQFQVDOljSQ6pBYdIYxXdhondGmEqLMJsnFK9vizseESDuUpRl3RI8S/GQdT/tjWFEW5HB5h5XJ5Su5vTBBGgIphy9ni/X4AUkscbT3iYrGHAMLdvEXra+EDhRUPBMXBNnkU/3yZ0p/LceH0W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757662025; c=relaxed/simple;
	bh=xdcRbwNQYyPOvei/iOTBM/TyZ63L1Uwke68lF4T6tVM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eyV7vsO01OR5dlFeOldmhTyWi2mShmEoPi3b6KhSmoR9DjTz+ZVEcbilzQqQIFxzCaXMtKwCqDr4ZKUmoPyCw5u0EqhFz960qWL0dLeJ+NlHSWEv8r6zy/RtFk2fM/UnHLsgOBasbqSebZiN0cEG72jpcLJu7k5b0rIDVOTVPsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=BoX7T3mu; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45b9c35bc0aso13179305e9.2
        for <linux-gpio@vger.kernel.org>; Fri, 12 Sep 2025 00:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757662021; x=1758266821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j3tI11OAkSN7RqNGcTXf8rRvtsdFAfZUpl45jMI60AM=;
        b=BoX7T3muxiexNp0SKN0shYggkpN4K0Bx8AJ+P5P4iMwVsJ4UXJKe04CN2fBzLrqdRw
         IzsRayg3+KTaN0IJd94lCsA+xO9EgdjUiu9yMatMUhQIBqMvKxSyukFF9vnLGDht4j0t
         Ctlr51XQdfoY8XXmK5+vfehuajHmOzXYRZMrm0ofZsaln7Uc3L6/IMliEe6TnW+Q8l6e
         YscVvejNTgjJyyfVBRq11jhOE8d/gE+yBi/Dj54QQpBNUa1g1vxn1nrtUyZBWWzZeTE5
         lpEJbASip1Xk2zxd/ZOXoNFGp/GV1pSb1Vs5s86iUUP/boUWDO6bg2w6B6Nv4U8nyEkN
         p2wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757662021; x=1758266821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j3tI11OAkSN7RqNGcTXf8rRvtsdFAfZUpl45jMI60AM=;
        b=or5F9Oxrsq7sXohgBPL0T2mbhJbK/iFyLV4oVStyINmwrjrY+h4IZQuna6x/568J70
         lBVcZzehnEd+T/vUyIisPLQVzEWstdNOkgUJAdQFhcK/merw3gDiDWpOalQWCkDMlr22
         O8Qwl+58u9m0zUAthAxK09/TBAllNXeUGf5DXvtO4dAQui3IADceLbREL3cP7FdL3jpP
         ngCi1rxTuvQF8xAxTFnI5aRN0dxILo3Gg8sGfWUY9MtznfXS5dJF89nH2tXhJb3tWDnv
         85/ONhl0SqGDQ8fq96iBeQo7fBO+FMn6e+JhagIBPDkvK+/nl/Gg8Sav9aDNkgEBKP1N
         Gz7w==
X-Forwarded-Encrypted: i=1; AJvYcCUroQAe+JPiMG+8Kxcmh2pbkl14Aro7MsOTE2uudXhdAeLdZWK62cSIPZb9PWgc4UHLiURlnq8FHnSy@vger.kernel.org
X-Gm-Message-State: AOJu0YyuesXQgL6+zreP64OJI2cRQvX6U8yh/VdMkFhnkwZ1gJfW4m01
	44HmQrpQjTa0x6L/+FbYC6xjhqX94sRDqcxiYBeXbV1sfx6ge4JqLEJTeqtZqFH8vd0=
X-Gm-Gg: ASbGncukdJ7rxU+qoWre8iySt6e64/pEpSA2JvtPHAbDN2ebTHRSFAy1pYEAbLirfdX
	svb9xLk2boRipi6MtkZmZspuHURnVWIyP8TG5jO0QfCJ2v0ZD5bUT2+8NHLPjm1ADpeftg9pKS3
	KkNz+0pMBxe9OdGo/tDHqRhmAOsHc2KHFm10oqn9ePy0HtkIqt8ZwLFBs00ZWVEkFHe/HFuM+JY
	H+z3yj3sc4WbQUgrY1iWMchR5eFicLDwMpXX71ssxnvNwijwSvPaieK5S3kTLWZ7y0+GkpRwKNK
	X6MGcm0U3BAekENhvC8cNKNxEjiTHtm/IEdV7jz5aWy+IfR5xnvu8pIZJVctmE97LXVXyjBuW4X
	A6RHkgqB+Sm1x6mBw+CSKcX8=
X-Google-Smtp-Source: AGHT+IGXpoEAuIYw6/UluyUVnBbgfJgpGf6NHBYCv+YqFkoz5Fkn4jAGq9fRMx7AKxy66hsY9dDhlg==
X-Received: by 2002:a7b:c04b:0:b0:45b:81b4:1917 with SMTP id 5b1f17b1804b1-45f211d5d6fmr14759865e9.10.1757662020614;
        Fri, 12 Sep 2025 00:27:00 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b6ab:4211:ebab:762])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e774a3fb5bsm730202f8f.58.2025.09.12.00.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 00:27:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Lee Jones <lee@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	=?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <legoffic.clement@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	James Cowgill <james.cowgill@blaize.com>,
	Matt Redfearn <matt.redfearn@blaize.com>,
	Neil Jones <neil.jones@blaize.com>,
	Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Yang Shen <shenyang39@huawei.com>,
	Imre Kaloz <kaloz@openwrt.org>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	imx@lists.linux.dev,
	linux-unisoc@lists.infradead.org
Subject: Re: (subset) [PATCH 0/3] gpio/pinctrl/mfd: use more common syntax for compound literals
Date: Fri, 12 Sep 2025 09:26:54 +0200
Message-ID: <175766186357.9646.17039178132060352918.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
References: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 10 Sep 2025 09:25:44 +0200, Bartosz Golaszewski wrote:
> As discussed[1] with Andy: it's probably better to use a more common
> syntax for compound literals so fix the commits that converted GPIO
> chips to using the new generic GPIO chip API and make them explicitly
> spell out the type they're initializing.
> 
> Each commit in this series can go directly into its respective tree:
> MFD, pinctrl and GPIO.
> 
> [...]

Applied, thanks!

[3/3] gpio: use more common syntax for compound literals
      https://git.kernel.org/brgl/linux/c/7eee64e8be51f9ff0393b5bd0752a6e8f9252bf9

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

