Return-Path: <linux-gpio+bounces-18528-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F576A81EF0
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Apr 2025 09:59:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75E113B6E8A
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Apr 2025 07:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1A6225B66B;
	Wed,  9 Apr 2025 07:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Gyb4YbtI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB42F25A638
	for <linux-gpio@vger.kernel.org>; Wed,  9 Apr 2025 07:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744185464; cv=none; b=eblwAj2CsRvyVAPLBqwbYrVElq0RjwLhZT8gqd6yTVaogDfZXu+WI5FylBA5E9491P6WGOG5QrHwpsHTql6QAyh//YujlILqTUU63E3KARx373MBIjwTa8yWAbVNyM1yBc+Vb2iy80RaEJbMXtaOaTBc6CzP1jKuqyPWvHsP9uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744185464; c=relaxed/simple;
	bh=EUimRn0GQUHWJwQMLzq8kpEhkDARwbjxXagfaCn67bk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sUqPUHbd4uXSp1mFmxuCkz8tj2D3zjmYOT6WcRHoOr84J4SJOREKYtUjmpJaljVHvWHSHlSqeQBX6tOO1OboE+GtYZjDKkGtQj4AukiDuaiAK8VWbNfaT0mxHEquGyVwLd0i9hRD41r0otdH1mH+JRgSN0I/hUuUdkE6OpFWVtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Gyb4YbtI; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39c14016868so5707380f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Apr 2025 00:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744185461; x=1744790261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gXDxRCjCfZuXXrdnfOdDIFh1kl7XI8kOcfsAbWkZgo4=;
        b=Gyb4YbtIj9M5R10DfBKlBnQN5LueIJ53QzWC46M9IhwXVdlLdg+C/afLCd4Pp1pcJh
         t7ps6xp7eBK56NnHJgLpFePY6qXiK7MeGy/NouxFaeJuRfnS9Srz7iTestVLUItEHRCD
         l5yjPAoR/oCdU3pyKPUOYb4/0eR736IB+JS1epr79ZmdfHC59DRu5GEhMQeci0dyDYMC
         FSTKD12/Yh5XuPIiSIh9j5CkKkm+26H9Zh4FQCwjyWG8KzIvtKncxd/8EzZ6rPsyGTxI
         b5/NzklHP//05jdMQISEaEgf3ECOoyo/E88353UYf3Yy3LZ+Np//hdMbePN9hbCSydt4
         PTuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744185461; x=1744790261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gXDxRCjCfZuXXrdnfOdDIFh1kl7XI8kOcfsAbWkZgo4=;
        b=Nenzdam3Fj4EdTjrfCNAvaZVdjiy7iWrVxQIaUzxtM4VB+XQvPpclIAx1kgQ0VJxKI
         4PLBZReqe1b3knYm5RkhFqalaL2Lakx1KeJxJL/ZJwN+k8VlknGYNHHT10NAL0at94q0
         nbIQquIPgbXA6K+vgcBVJtnxrEz5O0JN1sUY3NhqHcTJ0qd0vBmQoDchtISeFZjILqLh
         +eL1tmhaTy15gazgxQoydBLfomwxJLE8L3CRgkx0PcT2CuLfH+xrCBh7dFc/KFMyPCpO
         UPTTYRSbfFqaEmTRr5aKTIAl4+jm9gkT0JfOfVhFuNjWfALoC4nQN/n6+Fl7tw8RdJks
         aixw==
X-Gm-Message-State: AOJu0YwPfjw+XcDIoJk3c0AD3mOcdO06fv8DNKVqkvEDqVCOhzDVlsxm
	ZhY7iJoC/TcmS3Uc7Gocb0D6hEPpaDPxyWJc6vr8m8UUZVYkzZ8ICS81x0YNgQA=
X-Gm-Gg: ASbGncs1vh98S9rC+gR9ISkFfV8ZqNRhkI338nT7yzsRaXNCK/TjVz/R5R6ZIgyMvQh
	1Jq5TASgzwOGs1KaiM/FJgUxpFHgyshUqkFBkwOF7/Ln64A42rBFq6W5Lz4ilKR/CRgmD7OMrI3
	6WyZkRKbnvzpqFjnAU6IsLrd1vz0ttziuBtsQysmX976HUKSieBQ2HdHttRfHcrBxvqT8p8VAVA
	SWdmwJKioZT2IFt4hLDAlfOqeqwbaktLBz4dTtAdKUx0ndN20AuNnvABsquU/zK12eedeCbzADn
	EGpZZZh5OVRwjNHmAMkQiV8wv57dDaxU4EkBr0qm
X-Google-Smtp-Source: AGHT+IHk+usthCOyo0rT6xLnc06ABawNMxokSw5jSpmTwWPZ24n6QoqFvQfjomHiByEDjNqdLAzbIw==
X-Received: by 2002:a05:6000:290a:b0:391:456b:6ab7 with SMTP id ffacd0b85a97d-39d87ab60camr1783660f8f.34.1744185460716;
        Wed, 09 Apr 2025 00:57:40 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:7880:1c3f:3ac3:7c62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d8938a30bsm837918f8f.43.2025.04.09.00.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 00:57:40 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] Immutable tag between the GPIO and regulator trees for v6.16-rc1
Date: Wed,  9 Apr 2025 09:57:31 +0200
Message-ID: <20250409075731.16802-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Hi Mark,

Please pull the following change from the GPIO tree that will allow you to
apply the second patch[1] in the series using gpiod_is_equal() in regulator
core.

Bartosz

[1] https://lore.kernel.org/all/20250407-gpiod-is-equal-v1-2-7d85f568ae6e@linaro.org/

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpiod-is-equal-for-v6.16-rc1

for you to fetch changes up to 265daffe788aa1cc5925d0afcde4fe6e99c66638:

  gpio: provide gpiod_is_equal() (2025-04-09 09:32:06 +0200)

----------------------------------------------------------------
Immutable tag for the regulator tree to pull from

gpio: provide gpiod_is_equal()

----------------------------------------------------------------
Bartosz Golaszewski (1):
      gpio: provide gpiod_is_equal()

 drivers/gpio/gpiolib.c        | 14 ++++++++++++++
 include/linux/gpio/consumer.h |  9 +++++++++
 2 files changed, 23 insertions(+)

