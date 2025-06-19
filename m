Return-Path: <linux-gpio+bounces-21835-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0480CADFE6E
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 09:13:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3DE7C3B3905
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 07:12:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1780124889F;
	Thu, 19 Jun 2025 07:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="kpF410Y6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525B12472BC
	for <linux-gpio@vger.kernel.org>; Thu, 19 Jun 2025 07:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750317185; cv=none; b=OVpfrPpW9vHYjkozIzWw6bd7QzLQMG9ugJjw8lm9XdPnaUs1BQ1n9MVJPNEf96VsNf8eMGvhODAZKXGew1JcykbE8D82k58Or4sp/wL9LnCdcWEO26z8QdIMnXsP/yJHbN2wFQJJKBLpX4KQwbTuuGZqFPk44D5xwXPRDaGR7uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750317185; c=relaxed/simple;
	bh=nlFMdfK+nAftRjb91G5aVapnfa1/VqfEyzUXphwCcic=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aXhjv+EAcb/Gzo3ksVNSRENkvCiS/taIc8ke/FTMyD2bsFEEInt+NrldDH+5RSaV2NLURJ0O8WrP98nuej5AM/Q8GLi9ftCC2p8AgZs+eMDC2Acjklrd/0k+EgwdNOfvPRYGSHpmbXiZTFdwJDJqDWfd27+aJjvfxi2FJhdQEZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=kpF410Y6; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45348bff79fso5316235e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 19 Jun 2025 00:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750317182; x=1750921982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d8jRDMjx4FrTstdzD8iHyfkG4NyYMwKwX4NjQaVN9Go=;
        b=kpF410Y6SAPgpf6IIaU1r+wRJZ3f2exzu2g+9730VJa2fwLZ7iNHoNU8T2m6pipVQ4
         8OB4BJ2hjguZ+UahQCwHQ5fROxvNUfZRLLXUeSCptNtC2lLJdPRpJ23mmTlzY7lpz3Gv
         hNzsABozPdFiRNhk4wrc2IziyBSwmpRSv6bc1PaF8HIbdviln9jKdNyZtG2lYaAUJ2rY
         dNYfNf9O4pFY7a+MTkVGA7Pcnoo/FrM7Si+VMrKUMeuRmQR8PfALeCSEeC+QIWcMlM7S
         ABItVaJsZcIYRtPxL151eQX08ZgxvWoaiNI6ZFgA65IrrAvBCf9MXN0hQSbYZ9yl2ZTA
         3sIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750317182; x=1750921982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d8jRDMjx4FrTstdzD8iHyfkG4NyYMwKwX4NjQaVN9Go=;
        b=f8kRCZTrjXGq7wjn6oZIXIFZ3qK7+fqpEexZJWA5+68idQEDZqbsTrWlIwxf6UCBqv
         +0MdkCjx0Xa5nlvtezU5kmHwLLJLS072KsBejmbr1oVfuOX+1TT/3KPo7UV4i7aHw8MP
         /V6vLygUrjAg5IFN5uQCBOEpyu3514jzHkYA8sI8iLqIziDRMXoD4qByEjb7hFNPuHe1
         KkxTr3HBNYAVKN/at9jwJ2Po62wO3pIU1gXIH9qMSIsyfuPdzryST0a8rh9v4b4/yldr
         SUG+wruVayWY6QpkyQIYMGp04SIVDe6g5Vx4Mueon7BQb/2Lircjlz0yR2EyhzkxeSqn
         JH7A==
X-Gm-Message-State: AOJu0Yx73u41IZOStyZCpN0k8uio4LsT8KtB9ju9Ev2cur79dn+atMFG
	hkNk9ilrVuYkf02XKLW0KZGtZp2YbVG1WQIlVtLbtEGeFnQmC6GWDfgPrl6WiMBiQ18=
X-Gm-Gg: ASbGnctnrSxwMu+6lVrXh4EqodoS1It0m7rwR6Vge61N3LzqraHASRK3bnwfbdy4De2
	scro3DBxNjZIB7JyutTG8Hxrh8Z5KCY+r0NlooHAXokGAMfhmdZej5I/df9IBczE2cEv+GWP/ZN
	DkRifknYgOZEYajRbLm/JKjf9jplsmlUgDWb+/l4HUwEQ1HzUxjz+2E99clp0z2HspO+tkXNYph
	ZqeDYAGXTgbvgM6VET9xfugfQ+zCfRLKjcASdSbIZxZIQKG8j6eDBOcuUVvK1ze+hYeIyvJXBYn
	GaT7glB/poOL1bfFdoUHOpZCe/S6AZSA8AVqeLHr053XOUPhQ3Yi6yQBKWbDVE2xegMGr/KDgg=
	=
X-Google-Smtp-Source: AGHT+IFiKomkXEz/sIm6IPhNjF7haVxft0grQcuRErC/FPW7FYLp3WHPzD0JSwyoPsuargzgsT+IqA==
X-Received: by 2002:a05:600c:1f86:b0:453:1e14:6387 with SMTP id 5b1f17b1804b1-4533f02bb07mr154885295e9.32.1750317181768;
        Thu, 19 Jun 2025 00:13:01 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:c485:fe15:c9ab:c72f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e98b48asm19592795e9.16.2025.06.19.00.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 00:13:01 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] Immutable tag between the GPIO and pinctrl trees for v6.17-rc1
Date: Thu, 19 Jun 2025 09:12:50 +0200
Message-ID: <20250619071254.8520-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Linus,

Please pull the following gpio-mmio change into the pinctrl tree. This
allows you to apply the rest of the changes from Clement.

Thanks,
Bartosz

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-mmio-bgpiof-no-input-flag-for-v6.17

for you to fetch changes up to deefc7083414de81aad102b60f0390f600d7eb79:

  gpio: mmio: add BGPIOF_NO_INPUT flag for GPO gpiochip (2025-06-19 09:05:33 +0200)

----------------------------------------------------------------
Immutable tag for the pinctrl tree to pull from

Add the BGPIOF_NO_INPUT to the gpio-mmio API.

----------------------------------------------------------------
Clément Le Goffic (1):
      gpio: mmio: add BGPIOF_NO_INPUT flag for GPO gpiochip

 drivers/gpio/gpio-mmio.c    | 11 ++++++++++-
 include/linux/gpio/driver.h |  1 +
 2 files changed, 11 insertions(+), 1 deletion(-)

