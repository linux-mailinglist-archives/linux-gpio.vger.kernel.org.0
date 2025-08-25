Return-Path: <linux-gpio+bounces-24934-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B07B34034
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 14:58:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8457A206BC2
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 12:58:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8406B265CB3;
	Mon, 25 Aug 2025 12:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nfRP95SR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5BB1E6DC5
	for <linux-gpio@vger.kernel.org>; Mon, 25 Aug 2025 12:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756126719; cv=none; b=LrIdp7RhKp+TvynGKlSl801VdpzReRPoSGBksbw5etF8FYylOGM92ek5FvZmPYsXBG9laqcfCBG9WI+0HN4BQqTip8wp/bEgXH5b+dQeEaYDGo+3b1fYYxmNy8NtGjCX/rImYQP4N58m3XusEXUpLIgTgqdzNin49Z9Iry/PA+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756126719; c=relaxed/simple;
	bh=IM9iJO7UIYdkAwSAqbmV9tDKxFnqhLDvSUZ9NJuIE90=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=kpEWBwfrdgcvX1DUvUrtOJRZOggl9fMs3GenmrSdQg516Pi2rtipYxbGEmEmYrlun2eGbmtI9GJzdQRVBqQiImS3SfibiF/eFaNqitjt6r84VFepFpJxt6LXsPKKzPNM3Y9XZ7VZdurs8UzCxK5YgEsvYJzQbsNW9QWMuZEPFhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nfRP95SR; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-336630769a6so14433481fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 25 Aug 2025 05:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756126716; x=1756731516; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=h2y2NsC9oaR3662j4IuBMxoGBjdUhWRZWEFVHsbKjJU=;
        b=nfRP95SRLvhAd5TPDrjslwETAD9ZKQQqLmBdd6UpXO8ooLOv5Q1u+JI2CgzQrTw8eq
         UDgu0PTmIeGdU56Tzaj8MCDJSSu4D/7FHSAZae5vAb66A+HIPMlfffoLxn8Y9jFoTep+
         sE95cTCS4LoUQVTbswymS8APynZ5hhz65kCqMSbnmaPXOKZjdO17v/ehS2KJSBWZfSdY
         VQmOWOHKr5GQ71dnUCxf3+qMg2LKGPqs37ToHX7hk+zMA0yhwOcsH6iBYbakEclvrcS5
         MAn/zI/K2mR62bv8l8z/Mr5ThawFe09JC2icLZPYKyw6nc4cIx/1/2Sfm6/kHEfAunYZ
         ZO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756126716; x=1756731516;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h2y2NsC9oaR3662j4IuBMxoGBjdUhWRZWEFVHsbKjJU=;
        b=tA6N7j+1ffElPo+afrxE/zSplf/bgFO2CfKtA1dgJXKBNKrWT3AtiI+ie1U5ECLq2d
         6wsd1KyG1goQKkpXEZZFHiJ7O9GQ5E/yai4gguTHOodQAqNlIYviAm7X4wheB/3P6aiR
         M9tG/xcEgDF+isMebqLwxCnDVScvWfrIe8zXxpJ9LNM6q2xAL6SWWW0IiXqrLGOAU8ED
         Mt9cyuD8t2rqj9rVXHpnoYzbpbVQuYVy2qCtHATdsGlK3JTME0OUfX1oMx5c8DIvAOLx
         PyADkbxLV7MbrSHlQy9V0uC8iP6E6GjD7EL+bJY4CEdCUqFpEVzW3YnsTOa9Vex14wUx
         PGdg==
X-Forwarded-Encrypted: i=1; AJvYcCVTALjs6kRMxfrQNgQ3pN8TNXWlG52Rjp4y7VxoLTZ0xTd3tzsCbF/esWBojMFPJMOBFzMTthySCog3@vger.kernel.org
X-Gm-Message-State: AOJu0YymWnrE+Xnpt+EBFxsgrlAaXcuDAxbVgjUJT7JKxlnCRUyZgYJu
	0kH+PWLjiZH59uT0aW5GZQk2NCCVWnMivxRqIPkS7YQtdxreoD0ptT3hkIX/ZJBdh3jDBhxE4F8
	mGBN+tKkhNPDA9uJxgEp5KVNJWB2bxwc8g//0Wc3TIG7fuoOGrliirIdfxg==
X-Gm-Gg: ASbGnctcOHMsIRT9J7/4Y6B3AvrUVu88HPp4i0t3sM8fFL0YG9XpVd32N1iqLapCXU1
	T9CPQg2fDVESn/AXTrBiiIQIGuPHuLiGaRYf4vSkixqWFjKPUiNNOJ4ZtcnpX6vwZe+/cruO7JB
	wPY2ZNWnplcXlFLZUjFR+ZiqsyAa01y85XrPYTaJyAa1Ok5gnS3EKNCkIEb0iC1WoRYxURnM+3y
	B90FjI=
X-Google-Smtp-Source: AGHT+IEM8Ta/aMlYhdX2kyS2KdDJN8sJsB7fP7RconVSabr+2MrjSO9P2xauUdSFKN0AK/LYT3T5QmMf3jjBlZqu/Rs=
X-Received: by 2002:a05:651c:31c5:b0:334:390:d92e with SMTP id
 38308e7fff4ca-33650e3ae24mr35592811fa.7.1756126715536; Mon, 25 Aug 2025
 05:58:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 25 Aug 2025 14:58:24 +0200
X-Gm-Features: Ac12FXwpYrX8dlNs7pqV067CILDapuc-jiI-uPN-PFTU4ngTPdYVQHt2d9IqhBE
Message-ID: <CACRpkdbMXvpwgniKeyJ47-t0X+ekkJ1r8RpDFJRsd+g9id+ruQ@mail.gmail.com>
Subject: [GIT PULL] pin control fixes for v6.17
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

here are some quick pin control fixes.

Nothing special, just driver fixes.

Please pull them in!

Yours,
Linus Walleij

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v6.17-2

for you to fetch changes up to 563fcd6475931c5c8c652a4dd548256314cc87ed:

  pinctrl: airoha: Fix return value in pinconf callbacks (2025-08-22
15:08:58 +0200)

----------------------------------------------------------------
Pin control fixes for the v6.17 series:

- Module macro parameter fix for the meson driver so that
  it actually modprobes.

- ACPI quirk for the ASUS ProArt PX13

- Build dependency for the STMFX driver.

- Proper return value for the pinconf callbacks in the
  Airhoa driver.

----------------------------------------------------------------
Alexey Gladkov (1):
      pinctrl: meson: Fix typo in device table macro

Lorenzo Bianconi (1):
      pinctrl: airoha: Fix return value in pinconf callbacks

Mario Limonciello (AMD) (1):
      gpiolib: acpi: Add quirk for ASUS ProArt PX13

Randy Dunlap (1):
      pinctrl: STMFX: add missing HAS_IOMEM dependency

 drivers/gpio/gpiolib-acpi-quirks.c         | 14 ++++++++++++++
 drivers/pinctrl/Kconfig                    |  1 +
 drivers/pinctrl/mediatek/pinctrl-airoha.c  |  8 ++++----
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c |  2 +-
 4 files changed, 20 insertions(+), 5 deletions(-)

