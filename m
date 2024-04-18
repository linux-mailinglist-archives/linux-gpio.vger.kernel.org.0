Return-Path: <linux-gpio+bounces-5667-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F808AA0DD
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Apr 2024 19:13:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40D771F2203B
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Apr 2024 17:13:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AA2C172BD4;
	Thu, 18 Apr 2024 17:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Fb5EQ6Iz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1499C15E20F
	for <linux-gpio@vger.kernel.org>; Thu, 18 Apr 2024 17:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713460416; cv=none; b=du6DjzmlTYmihHWFQaz0H2uP6kEKq0pd2/wFenG/anjItUkckowHfec9Eb6uLmKb3UPAHmCnJdsTDVizmIjS6okkDjFWDhivCiEbEXFU1UfxzLJ1vmCX+BX5/A8b1pd+hx/nTl9x5NHMUtyQaX8H6Yi7c7gjASFeNQEtdJe5GO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713460416; c=relaxed/simple;
	bh=33bp98M8vYpK0Mw4ItmO5JzHKSDRByKo5z3fyvO13u0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=boaKRIkeYa5glogb3jMNx5KuFhzTCrDPC/Gs2Gen6h4SSFjaja9/nDD1/5VsVeISShBNEO220HxEuvm6LEYCPvsWLfWK99W6OS4sZDGOXx24L6dUJ8yOnaoc2PfqB4lA5OzGhygKo+4csoDEjEC4e16bBhImrNyDhtqkTV+EnuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Fb5EQ6Iz; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6edb76d83d0so1006710b3a.0
        for <linux-gpio@vger.kernel.org>; Thu, 18 Apr 2024 10:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1713460412; x=1714065212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A9Nrs6OMVDjvu+Fg3bPZe+Mh7T8v2MnPaN+nf5ROhho=;
        b=Fb5EQ6IzXjFVlbjNgxruQEAjMqMxnmnT1A94TiKo0NjzFdYyjfIvvpLzGE8KBPqCkJ
         B9JF+GZhRVD1YrM+V/GSp1+nQw9voXGskKj8C41IThciPF31HrvgFJ/7A48v6XVk9pAM
         pV7zIFcXrBlILXOn7Rru8xJK486djO1FjNXmfbQb9gdBt4+q6m1NO2eo2KXtlLwLFB5I
         vuLP5w8wfC3mDrf5Xj85tal1qwyrhl5i0e3Cf6qWWmdtApb6cTSZOZtQMMwNseN7Gs7j
         La3k0LNWjoRv1ChHYutly5itMD4sg/pz3kIPium8+g5fAKhE4h1oxxpqerwGqFiQ+Irv
         clrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713460412; x=1714065212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A9Nrs6OMVDjvu+Fg3bPZe+Mh7T8v2MnPaN+nf5ROhho=;
        b=F8cvkmLDywdDthJZXbbIL2DoOOmk+2Qb+IHmzmz+8Fel9zrZvgXxtLOOv9SkhPzGww
         RsK/3wlBhwozIIeOZc7FhcRWbkyZXd2qSbrVvV7Edd305bPbj23YasgyBbmcxqdSWdrM
         iinu32w94BzDWQGcO2v+aLuEkGqLmKTI9P85juPM3KY6Q/CetV2RXRKUfSoAx5OKOLS2
         IFW9KYY9qy5SxG91AbInlSqbnDXPuto9b2RGXhOOt4yVdm6wCxlT2QBvpV8N3oLuzVxf
         R+LKqfqU98M/sNSncSIa86nfEx3YU6cNlMW/6q2hpTh6gMokogBEtSMSlaVowpWjyHJL
         3asQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1Ni9m7cW+Zhsrs1QDPb6CzHeNMLu2TsBiu9WdrzZS09pNg5MVyIFHyC7ycAYiNhq4fzqBlOT5B4zEagqnJDDsGtQ805HKfZEq0Q==
X-Gm-Message-State: AOJu0YxujNOmy88ev9prGnS1R27EbjC9Ar/ud6ZoKd2tRUkJWjmz0wwT
	pUHUMxztdJdbyERtgY4EUEc26p08YfYm2TXK0iVXo+qHGKSw3tr+gUq4aK0Gfiw=
X-Google-Smtp-Source: AGHT+IE3tG2/trGJpFefH2yxN5NkujHeRNR5NE563/ig+Y12P+8UXQ55A73e4tXVMSj4aoosn7e2Og==
X-Received: by 2002:a05:6a00:2351:b0:6ed:d68d:948b with SMTP id j17-20020a056a00235100b006edd68d948bmr4688338pfj.2.1713460412286;
        Thu, 18 Apr 2024 10:13:32 -0700 (PDT)
Received: from brgl-uxlite.. ([24.75.208.145])
        by smtp.gmail.com with ESMTPSA id f4-20020a056a0022c400b006ed066ebed4sm1775858pfj.93.2024.04.18.10.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 10:13:31 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio: fixes for v6.9-rc5
Date: Thu, 18 Apr 2024 19:13:29 +0200
Message-Id: <20240418171329.6542-1-brgl@bgdev.pl>
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

Please pull the following set of minor fixes for the next RC. Details are
in the signed tag as usual.

Thanks,
Bartosz

The following changes since commit fec50db7033ea478773b159e0e2efb135270e3b7:

  Linux 6.9-rc3 (2024-04-07 13:22:46 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.9-rc5

for you to fetch changes up to 69ffed4b62523bbc85511f150500329d28aba356:

  gpiolib: swnode: Remove wrong header inclusion (2024-04-17 22:48:14 +0200)

----------------------------------------------------------------
gpio fixes for v6.9-rc5

- use -ENOTSUPP consistently in Intel GPIO drivers
- don't include dt-bindings headers in gpio-swnode code
- add missing of device table to gpio-lpc32xx and fix autoloading

----------------------------------------------------------------
Andy Shevchenko (3):
      gpio: wcove: Use -ENOTSUPP consistently
      gpio: crystalcove: Use -ENOTSUPP consistently
      gpiolib: swnode: Remove wrong header inclusion

Bartosz Golaszewski (1):
      Merge tag 'intel-gpio-v6.9-1' of git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel into gpio/for-current

Krzysztof Kozlowski (1):
      gpio: lpc32xx: fix module autoloading

 drivers/gpio/gpio-crystalcove.c | 2 +-
 drivers/gpio/gpio-lpc32xx.c     | 1 +
 drivers/gpio/gpio-wcove.c       | 2 +-
 include/linux/gpio/property.h   | 1 -
 4 files changed, 3 insertions(+), 3 deletions(-)

