Return-Path: <linux-gpio+bounces-5730-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 120868AE1BD
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Apr 2024 12:05:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 72504B240AA
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Apr 2024 10:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 023A76311D;
	Tue, 23 Apr 2024 10:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="fGuwvlce"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB015FDA9
	for <linux-gpio@vger.kernel.org>; Tue, 23 Apr 2024 10:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713866702; cv=none; b=Oitz8oy5hTJ8xPBxGtGSSq9TAOGnL7aCeUAJTMYFIfFNgVawF/G3xmJviXKNXIDPtNDcD4J80h9gp1UlwImbUy8teBOf6IYuQyslwjEjkIK8fAKLB7z6yxtKRDcXNFaqIDsSRRiFO4cmZpoSbzdZjhfuag9LBa26po28cacFPCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713866702; c=relaxed/simple;
	bh=SbzOs6EdnJ/risp164W8Zj4fmySgIpuafm3nhJD6amY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=X+orbmKxxJcYBJk6KTh9mJVP/C5Jlwfa6OsIYHZVRtkBPk4b8WAuA4zYu4ydYxt0ldqCw6lqZXZFrL9OQzGy2FJt1NCX6SLTrTwy1Q/FxUFeSyt6aLJeRD+cF37O5BEMFM/0paI0NcZpPVCiZgCn+McOroCjdeMid1TLAoW5nac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=fGuwvlce; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-41ac4cd7a1cso2338065e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 23 Apr 2024 03:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1713866696; x=1714471496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vTSrT+hCubd8ysxRKnjowB2bfq/YsB0FodhJnN02xvQ=;
        b=fGuwvlceeJW8uAwKDhm2i8oX1vnVEM+XlBw4ujuvnAlXQiafwGSJ+bfybV/l2i9Uc6
         tidhZ9D8ryGivXtEokO0Kvvz+1uCoavvEmCel9L9EsN0RZghoy+OTN9U7aPlaQr8RCVq
         a2Bl5yKDm32XVKvZb7jk63SeCXIaX0vbj2ZUVZ4BnzjVPMYKoR2nHhFYA9b9RjsiQZFZ
         yvAyuvHjQGtfEQrCOH5G+/s9a/yVkD15zGsvch7o9TtW7sXg+t7VbMOSYgraQM7Rrf/L
         TUr5XtOPdnuI399SFABpRbPNwqQLVZeZ2TSxOVMd4EVTCmHKQcSH9xzatAOeOTNUFMRX
         jWYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713866696; x=1714471496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vTSrT+hCubd8ysxRKnjowB2bfq/YsB0FodhJnN02xvQ=;
        b=EfJn/c9qVD/wEceChtHAmtJKvkyBCYcS7/SqXUCL4D06YKEqg5VU8nGAiGaWIH6pwp
         EmuFWEBfwK6YH/3vphnNNXWQDO2oCl8sqBfUUHkSl7+5heoDCcqfsNPhstD/pZxPQjDA
         YHedHSW+xAMQXi85KBJvd8As5s3PiEvG/a+iyERDqv5rcDY45bb+IeB4/DZJ62w0hcRY
         6BDcF0VbUHOBO/qGmBd/dw/Ls+HWZFcntzBV1yVG8DWi/+OjLasAkLqrFt7kcp71fNeS
         gbM1gpLEswpuIr6LEaMnp/EzK+MkDjwZ1VH75Z6J2wkPJWKTV2g2pYISRvM+PT4wcij+
         w7Ag==
X-Gm-Message-State: AOJu0YyeYI6vjK0n5RYTV1hvrIvjo+3wXRvBvpumaVweBibO/gmTSgFw
	Ygg1CZC1reNSM38MSmoW4DiaYQTYpywjm4zpqd2bbecEm6fBdOQtZp1Ok1dl6GQ=
X-Google-Smtp-Source: AGHT+IGAjxM782EM0X30HvzST7eAS+/DZyhZ/5nfRmuTobAeBhOU+4WRsJ0Sc7unPEcfj9kke9ikoQ==
X-Received: by 2002:a05:600c:3582:b0:418:e304:4a13 with SMTP id p2-20020a05600c358200b00418e3044a13mr6997122wmq.19.1713866696342;
        Tue, 23 Apr 2024 03:04:56 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:a046:fbef:467d:18f7])
        by smtp.gmail.com with ESMTPSA id ay13-20020a05600c1e0d00b0041a7581f8b6sm5223200wmb.23.2024.04.23.03.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 03:04:56 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	=?UTF-8?q?Gunnar=20Th=C3=B6rnqvist?= <gunnar@igl.se>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH v3 0/4] tools: timeout handling improvements
Date: Tue, 23 Apr 2024 12:04:48 +0200
Message-Id: <20240423100452.32958-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Here's an assortment of improvements to parsing and handling of timeouts
in gpio-tools.

I still decided to unify the period parsing between gpioset and gpioget even
if it doesn't make much sense for gpioget to support periods longer than
fractions of a second. Let users decide.

v2 -> v3:
- only initialize the timespec containing the timeout value once before
  entering the for loop

v1 -> v2:
- extend the series with renaming the timeout variable, using ppoll() instead
  of poll() and supporting minutes as time unit
- drop already applied patch

Bartosz Golaszewski (4):
  tools: rename timeout to idle_timeout in gpiomon and gpionotify
  tools: use ppoll() where higher timeout resolution makes sense
  tools: allow longer time periods
  tools: add minutes as a new supported time unit

 configure.ac         |  2 ++
 tools/gpioget.c      |  4 ++--
 tools/gpiomon.c      | 28 +++++++++++++++++++++-------
 tools/gpionotify.c   | 16 ++++++++++++----
 tools/gpioset.c      | 16 ++++++++--------
 tools/tools-common.c | 32 ++++++++++++++++++++++----------
 tools/tools-common.h |  5 +++--
 7 files changed, 70 insertions(+), 33 deletions(-)

-- 
2.40.1


