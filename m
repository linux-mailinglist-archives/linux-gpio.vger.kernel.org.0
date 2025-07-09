Return-Path: <linux-gpio+bounces-22976-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 03ECEAFE597
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 12:22:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6CF5C7B1424
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 10:20:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9694B289374;
	Wed,  9 Jul 2025 10:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iYa7rJiz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895B32877D7
	for <linux-gpio@vger.kernel.org>; Wed,  9 Jul 2025 10:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752056515; cv=none; b=SZb3q+d4oHDY7AglT+QvV84aeD4EUda/2BVkkYwb3QUCQt4O9Sh5Sxu8HsuKsSspeySnxpN5ChxN9gKQUiKKER0p09xTHqfIUSzXN7OIIvuZdSGVQVFXL7ZDaCVL4DMp8SoRQAG92CeKjBaWanhDLI0AWI8wmq0nkleBGtdINdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752056515; c=relaxed/simple;
	bh=wIqPLRw2HOvarV36h3OAvicgvKrGbpwiOzAHWe3Pt3Y=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=JUlnhs7dCeFNQ7rW6/3HdhWUHzwiUE8nI0R1Apj9AXzlz9SECamJdY/cg6qtJLNbGpcqu40y/gnxvm4+fGCeAkmWSZPfUpHUFuLq8Rp2fZBPxJOgzAlld0lVUAMdDcQS6WoYukyx35WKdTkokZphzUR7y4UV4Z60cGoienxs4Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iYa7rJiz; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-32f3ef6178bso11970011fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Jul 2025 03:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752056512; x=1752661312; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DnYi4NSxelKtKJI4OL4GTqIMsRDkT7cGv2pD1bYfX0g=;
        b=iYa7rJizl75g9yi+gDIFL4i+AI0P56Bb9DDi2A3XqHj7m6u+vDowoYbawO90Om0K0n
         EYPE1y+R2L5nQQ8swfAhx0NzFF/kq6rHHUpwbfo8eT39BTnv5v3fVXJS4d2wnw5xVwiB
         BxP2OM/C61Dh7VqLdugoa4L1CQM6fRu0j3tenJXjiB0wbBAs7zDQEs8KQ9/ZvRcK2AVF
         +xsLrNl10uKmkh2kKq5U06KykNIs7lK2BOobt3uR1TjC2jCgFuN2WMl+cL/zY+RA8UcK
         aAp+w2DoB+1F/pbXNByW9/G9gJWWp6bnDHUrx5JgrghjkxsBEXhfw82vUKp7ZxuyYmTI
         l40Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752056512; x=1752661312;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DnYi4NSxelKtKJI4OL4GTqIMsRDkT7cGv2pD1bYfX0g=;
        b=HYdu5FD2opq770pPjlyJRO7bzfrwwMBTmIxzXOkcQK2LhCrkVudBQtM5RC35LwQS5H
         H0Sp0ldgjzqALADgbp4GKPhDoDpyUzILzfcZjFPJw3FvfW/YDSmUVzj6HvKyTiaEdP2l
         AAzt2lb6LHFGm8IQerg3L/mTTPw2fUBC7OHi/qFeq2n6RgHyTx8kjPQ7xP0KN2B2IEA4
         9ssyK1Jaenobag/6BJMRVJprYfQUBmeBIDMAr+PzzwSJJcBHXxqUyGd+AXO2jDb15YUW
         9SbShHS/f8vWrMlmV/uDMYypS+ylkqr7zC79oZfEHfVJJbmm3zEduwbOmD6Za4wsD12/
         wwQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGF3D5l5Jhs0n7XPUH/CNXAml1EkDmTlovhWpMFrjOabfj0/nDHH/dV6MRR7lzzpyTDewuqJEkuUK8@vger.kernel.org
X-Gm-Message-State: AOJu0YwYeRfVhQTFDz8jXPZgto1eX96deGPwpxFJao2QvXpwc09g+M27
	98IVA/3Z0TJPAO+VtpK2DsuyvkeahqYfQF6eYYsZRezSHaPxXwi01XmpA2OL8cCFLlfIScMeMrm
	a3EnTqiYN3+JJwbpb8IVLBulXLG4xMtG6HiveqqQUBg==
X-Gm-Gg: ASbGncu9QSjJDSpRxz4BvVEn4X+trTCa28SLxfNX+fWIvPgV5Br6rLIL0fRlIswar5X
	t/3TpuUwE/tA7klwQ10jkqzvW9hbufaEe+NrVQKoWatZ5Kn20buGRPcqwDHj8kfQnneMpX6SNb0
	NGoNF96X2ubsx1Gso9jvbVFDls9MAQyphtkrRGpwLbaOo=
X-Google-Smtp-Source: AGHT+IHSPJfxh6GXrGcKI1DP68kz97ujql/EuTBRM/jvIvYqGbvtieEObAlF+0aiWntKSzdWqidNEKxOo0NgV4jV7SA=
X-Received: by 2002:a2e:a370:0:b0:32b:78ce:be8e with SMTP id
 38308e7fff4ca-32f48585e59mr3497221fa.32.1752056511343; Wed, 09 Jul 2025
 03:21:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 9 Jul 2025 12:21:40 +0200
X-Gm-Features: Ac12FXyoZXoQflju9o9tYtb_0UNR6yMkEYYNVK3VI5ezRpYr41t18RFM2aqmrUY
Message-ID: <CACRpkdZB=mYnmZU14Gn9buB7jE2b-7Fu+dgf3pcAcVj0FgvHiQ@mail.gmail.com>
Subject: [GIT PULL] pin control fixes for v6.16
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

here are some pin control fixes for the v6.16 series.

Nothing special, just driver fixes, the AMD one is especially
nice to have and will probably spill over to stable as well.

Please pull it in, details in the signed tag!

Yours,
Linus Walleij


The following changes since commit e04c78d86a9699d136910cfc0bdcf01087e3267e:

  Linux 6.16-rc2 (2025-06-15 13:49:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v6.16-3

for you to fetch changes up to 5285b5ed04ab6ad40f7b654eefbccd6ae8cbf415:

  pinctrl: aw9523: fix can_sleep flag for GPIO chip (2025-07-04 10:31:50 +0200)

----------------------------------------------------------------
Pin control fixes for the v6.16 series:

- Mark som pins as invalid for IRQ use in the Qualcomm
  driver.

- Fix up the use of device properties on the MA35DX
  Nuvoton, apparently something went sidewise.

- Clear the GPIO debounce settings when going down
  for suspend in the AMD driver. Very good for some
  AMD laptops that now wake up from suspend again!

- Add the compulsory .can_sleep bool flag in the
  AW9523 driver, should have been there from the
  beginning, now there are users finding the bug.

- Drop some bouncing email address from MAINTAINERS.

----------------------------------------------------------------
Bartosz Golaszewski (2):
      pinctrl: qcom: msm: mark certain pins as invalid for interrupts
      MAINTAINERS: drop bouncing Lakshmi Sowjanya D

Mario Limonciello (1):
      pinctrl: amd: Clear GPIO debounce for suspend

Milan Krstic (1):
      pinctrl: aw9523: fix can_sleep flag for GPIO chip

Miquel Raynal (1):
      pinctrl: nuvoton: Fix boot on ma35dx platforms

 MAINTAINERS                            |  3 +--
 drivers/pinctrl/nuvoton/pinctrl-ma35.c | 10 ++++++++--
 drivers/pinctrl/pinctrl-amd.c          | 11 +++++++++++
 drivers/pinctrl/pinctrl-aw9523.c       |  2 +-
 drivers/pinctrl/qcom/pinctrl-msm.c     | 20 ++++++++++++++++++++
 5 files changed, 41 insertions(+), 5 deletions(-)

