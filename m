Return-Path: <linux-gpio+bounces-10853-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1415F9905D9
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 16:21:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEA421F228A7
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 14:21:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46284215F6D;
	Fri,  4 Oct 2024 14:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="r0IIr95F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E72210188
	for <linux-gpio@vger.kernel.org>; Fri,  4 Oct 2024 14:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728051666; cv=none; b=mdxuvgN75jOIe1wysF4BjMXnav7kBSQVJ9DaLY39Nlz7tpcB5dbSmfHIkiGgm2ONJ+xfQiXAjzuBnSBfaWDgvQfk7KSCL1EblehvRCztLD3QylALLiZ3EoabZnimniw0LtA9HkcjqVlhWsxX+V78oWTiXvhO1SDPkQZ0Ro7DxIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728051666; c=relaxed/simple;
	bh=dJcgLRow2aaQQBfKxTUsuhyTu7/BG3s5t9lTT/eMid8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PDqPAOdcrxCQ20yrLqvrnjBhhtswZuruP5z79slMyEBmZ4Bmz3c10aHro6NnAe4RmlIqggaI3pqshHx/AR6pHcJhmsWh7yEJ9+EZHXL0sAdWR3Rk/sOeldAqTNJYQ1V5CxTuJs+KUjVFNL1Zi1CLdw9Mgmwpz4q9T1xQ0CpNktY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=r0IIr95F; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42cbface8d6so27639005e9.3
        for <linux-gpio@vger.kernel.org>; Fri, 04 Oct 2024 07:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728051663; x=1728656463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vKSqvrpEqeBm32KxHqmFUKeU0x5YA9JFbesDhu6KpkQ=;
        b=r0IIr95FQt0fQcuC5vL94FxKBU3HUE0PwniQx/3zMT+Wpa3VUpv+jMaiNK6rVW5vwr
         aDCG1jrOqvNlqQlhroyFxzAE8IcgfzxwCquTWX8Kw/FvNo4ZzjeFhmyEWH2QKd1c1ugT
         cpaRy2/LdPzzuEqOr4i4fTkltaJFebBBzXmOwlVrPpS7XhNhjA4+OmzyRbPNLbb+2I3U
         pHy+4OCHur0rE2BWWgwcKrRsUm/i+f+EEjF0qcYhZsL/0V8ln3NPRg7g9kZ3dKrjO1T7
         HKQdeg37ZCyGH4MW1n8xaNqW/fq65j1F+N4b5pwB6/cfXT5ePuwsUj94Z4SwmVx+Lqv0
         2jKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728051663; x=1728656463;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vKSqvrpEqeBm32KxHqmFUKeU0x5YA9JFbesDhu6KpkQ=;
        b=qw+g8A+CWbq2VJxG5oOYXmOgXe9mcthp6TE0NE8R8LKd9emEqkitqKLnaCxs7nbXhu
         X81wOJVGUaiiE3pGDvwrmTul5P8ttyYbYpMP053WvVPl9dmlpurFP8GBU4UXprkG4c6v
         QhpcExVGiWKQ6FeA6+x432G8x8H8Ggc4jT6FoAHld8v8IaTrGPCGUq1Bys4zMVEb0ET9
         Fhvr2tYi6g5ZaDFmrK31Bajtf2Z8qfPW4hB47sk9U5j93BI59rOgIuoJRM2Te+Jh2g5T
         3/WO+Ymbkmnu5R8tZ12ueZVLs2LjLo1cVHuW5yKVaAorem4Y+wSDRR8mXyu7ZsCJh2ph
         ONSg==
X-Forwarded-Encrypted: i=1; AJvYcCXLQ+G2QEQ+8q0LGKPfEymUKlHQPfOAPmMVN7sOyCtPmnabjqcx8QBYwEqJlUT78qR6eV2q7X0R9BwV@vger.kernel.org
X-Gm-Message-State: AOJu0YxDmt0yT5Pl1ytxrbMG8xvmGuV9rtkgAUMu2Ttoo2c3AyLzk6Jt
	o5xbR2uvsNAr3xqIB0cASXtBDwigcT3Ny1af6vXPZh3w6G+kUIkxdC2oxn/DIPM=
X-Google-Smtp-Source: AGHT+IHWgiHQFvysKVnpOzNkinC2CjZNNoOI4K/L06cIjvNqoUz6Mwnu+SLA25Rjpn5vC58pBeVYrQ==
X-Received: by 2002:a05:600c:3ba9:b0:42c:ba83:3f00 with SMTP id 5b1f17b1804b1-42f85a6e0c0mr30150145e9.1.1728051662841;
        Fri, 04 Oct 2024 07:21:02 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:80ea:d045:eb77:2d3b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f86b24003sm16771995e9.21.2024.10.04.07.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 07:21:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio fixes for v6.12-rc2
Date: Fri,  4 Oct 2024 16:21:00 +0200
Message-ID: <20241004142100.53097-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Linus,

Please pull the following set of fixes for the next RC. Details are in
the signed tag.

Bartosz

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.12-rc2

for you to fetch changes up to 7b99b5ab885993bff010ebcd93be5e511c56e28a:

  gpiolib: Fix potential NULL pointer dereference in gpiod_get_label() (2024-10-03 20:51:47 +0200)

----------------------------------------------------------------
gpio fixes for v6.12-rc2

- fix a potential NULL-pointer dereference in gpiolib core
- fix a probe() regression from the v6.12 merge window and an older bug
  leading to missed interrupts in gpio-davinci

----------------------------------------------------------------
Emanuele Ghidoli (1):
      gpio: davinci: fix lazy disable

Lad Prabhakar (1):
      gpiolib: Fix potential NULL pointer dereference in gpiod_get_label()

Vignesh Raghavendra (1):
      gpio: davinci: Fix condition for irqchip registration

 drivers/gpio/gpio-davinci.c | 10 +++++-----
 drivers/gpio/gpiolib.c      |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

