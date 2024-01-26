Return-Path: <linux-gpio+bounces-2607-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1992583DA3D
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jan 2024 13:34:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD7351F27045
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jan 2024 12:34:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1334014288;
	Fri, 26 Jan 2024 12:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="eiFrHeEP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C412D1B803
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jan 2024 12:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706272452; cv=none; b=YsVGJ2wxM2aUTAYwPHcY3Xt1B2/HUNG7yzYa6meWQ510cAAnsdN9SabncyeAO0NOLN3XpqKh5qmo1ic2hmsWBA3FS8BlN+XVMaaOxztkiumrFzZphqbM7vSN4RqkSzn+V0FVs99nUCuE76xx4SILRrfA211mkNbSH8BB09tRENQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706272452; c=relaxed/simple;
	bh=3IjwAENZiSvBgm1+TCTIKPp17huEQPjULECpXRVLdSc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=K4DDMgmj0uL/NG+oEnrFj6pnXUKSZf21fzStaf4pTxOSWmPor2frM25QJIQc4l6VipEr3pMG4j4W7R42llqjG16x7MUbGz0eCcQP5WrSrOdUXz/bIzJcdMooY+aW3kFWqxrcsFXPrLRsjEMmH9K+9Hr+3Whxmx+gXDDNEbU9048=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=eiFrHeEP; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-337cf4eabc9so383659f8f.3
        for <linux-gpio@vger.kernel.org>; Fri, 26 Jan 2024 04:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1706272449; x=1706877249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0soW0v5yVfsW4Bsvs0S98TR5cuZkvArabmQNCI3ohqs=;
        b=eiFrHeEPeB4U5+ny/rkEvtJM4LBFbqLfOC5LuaxQfuNi5v2QKZGv0Xy4SWM/r9BnYw
         gv94sH9edUypjJ+f9jW4+jas4cIq+Qx/Z18z+eh+HctXP139WjkJ0uLeFIabetQ9yMU6
         HEDWHEE3afiV9+oqZGjXTHPOyGqcopnHewgSlTldjdvsBbJzlm1QJXp+xsm/lJRUwLbA
         v+a/IfkOmSbI/zr816qFmu6dDn/9n6XKapBcbyIV8j2TQ+w0vv40FqgFQM7PTMsQKQmG
         qlsMwHx8E1r4rL8HqB2DPB989vLx+ckRxJ2P3pTTg7LMVOjn62Ut6j0b843yCoORwVZ2
         nihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706272449; x=1706877249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0soW0v5yVfsW4Bsvs0S98TR5cuZkvArabmQNCI3ohqs=;
        b=QLY1qwGoI9N/Sql+qOFUyLCzEGULPuFVNPmquzW+FpKpd8aPjKSw97N+Om1DOcsdLs
         fwvSc9murdYmW9yPKqp1cZrGCI7mfR6aBFHCxBxa9EGGLDNs/cJqIEiy71kXsL/3GHPC
         eqPm9ugs+Gvl8LiuTGapDwMkBRIwY+aujJwIfC5HKIBppb+kotNOUSqZjP3/AycUzhGP
         c0/zeFlZw0FWeIIkZUycP/ZuniUehJxVIgHyIIRZx5943utiDiyj8vx+eMwuxIQpId/R
         GqHJBIwyh9e5GA+fAbvcSgjYs/80ypBAcoQv/IOtW2GfKxWfNwYF2698612L7DumFGCU
         SgZA==
X-Gm-Message-State: AOJu0YwDQAO33oBeZdr4N1PmFQ3Rubwaczw7XY4AHp9DKM1NLWaT0dHe
	jSgsOvtDUbiXEdfFkBeZOiSTFcxsio5rnfq8gAIyo4lOCiRwhwaTV3h7qXCJCxJeKm0naRUsUla
	u
X-Google-Smtp-Source: AGHT+IGSi+euc5CvULgroSe+CYz/TOquvGv3zNUeHmiSkBBOJFVWHUdT7kDMryUMGp6vjyPeh2/Qxw==
X-Received: by 2002:a05:600c:3d18:b0:40e:e66e:956c with SMTP id bh24-20020a05600c3d1800b0040ee66e956cmr243328wmb.159.1706272448465;
        Fri, 26 Jan 2024 04:34:08 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:5168:e401:d707:9e79])
        by smtp.gmail.com with ESMTPSA id t18-20020adfe112000000b0033ade19da41sm426985wrz.76.2024.01.26.04.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 04:34:08 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio: fixes for v6.8-rc2
Date: Fri, 26 Jan 2024 13:34:05 +0100
Message-Id: <20240126123405.35367-1-brgl@bgdev.pl>
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

Please pull the following GPIO driver fixes for the next RC.

Thanks,
Bartosz

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.8-rc2

for you to fetch changes up to 84aef4ed59705585d629e81d633a83b7d416f5fb:

  gpio: eic-sprd: Clear interrupt after set the interrupt type (2024-01-22 11:38:08 +0100)

----------------------------------------------------------------
gpio fixes for v6.8-rc2

- add a quirk to GPIO ACPI handling to ignore touchpad wakeups
  on GPD G1619-04
- clear interrupt status bits (that may have been set before enabling
  the interrupts) after setting the interrupt type in gpio-eic-sprd

----------------------------------------------------------------
Mario Limonciello (1):
      gpiolib: acpi: Ignore touchpad wakeup on GPD G1619-04

Wenhua Lin (1):
      gpio: eic-sprd: Clear interrupt after set the interrupt type

 drivers/gpio/gpio-eic-sprd.c | 32 ++++++++++++++++++++++++++++----
 drivers/gpio/gpiolib-acpi.c  | 14 ++++++++++++++
 2 files changed, 42 insertions(+), 4 deletions(-)

