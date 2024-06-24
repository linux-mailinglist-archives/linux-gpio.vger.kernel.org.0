Return-Path: <linux-gpio+bounces-7648-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8E3914DDF
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2024 15:05:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86BD51F24202
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2024 13:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7196B13D520;
	Mon, 24 Jun 2024 13:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C+Ml0eDa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E8C13D613
	for <linux-gpio@vger.kernel.org>; Mon, 24 Jun 2024 13:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719234315; cv=none; b=Y2gIhBlzwaAb7zaxAH50EdXOGJlh24gfJcLxqNCUHh7XDoOHAe85XCB9CpUUr7GJHyvazHxdvWStPVpotLNQNpiyrK2haPXk7+fJtr3bpL9tglf9B5IRqNY5ezvQSZa6xQ/uR8VzrFF/TZHItivGYgb7VoKhmqJAf+kb1p3ptqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719234315; c=relaxed/simple;
	bh=is7TCxCshLLufRyQogRDzT33Qf+QekprGx1wND1gJvw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=iAH1gt0anmVLWtzdWqc44QJlCwOdI6sDRgSSB26qp+XAnsLu3I0LoIwxrz6R6YM+tMkhnqyYPYUbkcLCGH1XTso9S/RYIuqqch1XppFsjdgs2PsojbwvSv3DoLsz5L/a4h5rzPcRNcOMH4l4Cti37+LDcCDOWEM+KU/iL0xxilU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C+Ml0eDa; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ec1620a956so51544071fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 24 Jun 2024 06:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719234312; x=1719839112; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ibe9dWNRlLxFg/ehewdQrXBLVeDGrTx5jXWvFDy8968=;
        b=C+Ml0eDaMBnsP8BZgabNoCLgamqfNLt5ESsyxaYA0rtgeb7nh/bG3mp0eS0LDyHPwH
         /WNuEcrUFb0VV2ejWwLgUZqhxCwXM1J7zwcFuQVTpTbI1KTIabfUHnCIQr+/W+3YV3wh
         jwwG3Zowcjc2CxXGHF3Q84AoBDUdnKPfpDUbHKKrmPGvDW/7thw6OUOvv5yup0otYiGx
         34fCDmLRKaKo3pTXPc1iLK/8ihjIwD3iOMMQzCMw4k04Vt8OayRtBzjeoHffIK+TrOiv
         zpCyCq6o8KHx87ik93l6gjmBgJQ4w3Bi8A3uVtgF5XK8db3U2K1Fc2+yrV6j6t9PRJjH
         Unmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719234312; x=1719839112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ibe9dWNRlLxFg/ehewdQrXBLVeDGrTx5jXWvFDy8968=;
        b=NlaqBklEAjELkrAeA0dc+HpD2scCM0fnG7jI0jh37pT8oP5WBvVhWBkpcafN4POhY/
         9WcSsNCP5Osq9rm/jLqC8jf7ySWax/rLRja/yDLC4R8m85CgwlKfAmFybOIFV/Mrgre1
         xgXpbVv2mOVFuARrhV+1f6xtaTN8BpMujUg5bjGHj8ey0Svf37FTFylddZUwLEqPAxxH
         eA/CPDot12C7b1b9cyhx15j35UKA0Sf7cVLaXDbjv4gJLMFKlXbDoPu1hz6SX6h+sL4/
         /t3Fyuv54E+whYP/9OX+3vZ8vmEDkuYhaJXZrtRkSCvnIbbxK9PamdWYM5qUivoWCAaL
         I7+w==
X-Forwarded-Encrypted: i=1; AJvYcCXMtIT6pIY+Dxt3efbAoccOlTIB7uqgHOgPJGL6maX1B0Q6zdIkWGcaLV6xCgxt7OHh+qVjgKXiw9LXG3G1I2HodvS7ZXRHaCNhZA==
X-Gm-Message-State: AOJu0YyBVbRp2rzHjF3UvD6BYCIsf0SIteLYnFXTtW1EBPbMYjyXQ137
	1edPGx4q6qt7mZY28QJi+uCr7RZs8Ul+mwT6LuvkbDTBBzufPd+3BZraDk/eied3k0H5GXTbN3L
	HuUAPxTMURyOQ9uYNsJlY3kujhS9ZAavNLz240A==
X-Google-Smtp-Source: AGHT+IGbXX62MuanBZyg06Ty61pAiJ5rSJpXKlv7RL2Y0oriTxD4MpUJGGGU/eDChNuXorpVr6HsC+YSRF/MPvrl6Mk=
X-Received: by 2002:a2e:80d5:0:b0:2ec:4fe0:38bc with SMTP id
 38308e7fff4ca-2ec5b388418mr24793131fa.35.1719234311609; Mon, 24 Jun 2024
 06:05:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 24 Jun 2024 15:05:00 +0200
Message-ID: <CACRpkdaa2OM1=Buz9pY2+HRAZHQnDoRqZDX2VWNoG_Fj=UbsUQ@mail.gmail.com>
Subject: [GIT PULL] pin control fixes for v6.10
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

here are some accumulated fixes for the v6.10 kernel cycle.
A bit late because midsummer.

A bit of brief details in the signed tag as usual.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v6.10-2

for you to fetch changes up to 4ea4d4808e342ddf89ba24b93ffa2057005aaced:

  pinctrl: rockchip: fix pinmux reset in rockchip_pmx_set (2024-06-17
10:36:56 +0200)

----------------------------------------------------------------
Pin control fixes for the v6.10 series:

- Use flag saving spinlocks in the Renesas rzg2l driver.
  This fixes up PREEMPT_RT problems.

- Remove broken Qualcomm PM8008 that clearly was never
  working. A new version will arrive in the next merge window.

- Add a quirk for LP8764 regmap that was missed and made the TI
  J7200 board unusable.

- Fix persistance on the BCM2835 GPIO outputs kernel parameter
  so this remains consisten across a booted kernel.

- Fix a potential deadlock in create_pinctrl()

- Fix some erroneous bitfields and pinmux reset in the Rockchip
  RK3328 driver.

----------------------------------------------------------------
Claudiu Beznea (1):
      pinctrl: renesas: rzg2l: Use spin_{lock,unlock}_irq{save,restore}

Hagar Hemdan (1):
      pinctrl: fix deadlock in create_pinctrl() when handling -EPROBE_DEFER

Huang-Huang Bao (4):
      pinctrl: rockchip: fix pinmux bits for RK3328 GPIO2-B pins
      pinctrl: rockchip: fix pinmux bits for RK3328 GPIO3-B pins
      pinctrl: rockchip: use dedicated pinctrl type for RK3328
      pinctrl: rockchip: fix pinmux reset in rockchip_pmx_set

Johan Hovold (2):
      pinctrl: qcom: spmi-gpio: drop broken pm8008 support
      dt-bindings: pinctrl: qcom,pmic-gpio: drop pm8008

Linus Walleij (1):
      Merge tag 'renesas-pinctrl-fixes-for-v6.10-tag1' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers
into fixes

Stefan Wahren (1):
      pinctrl: bcm2835: Fix permissions of persist_gpio_outputs

Thomas Richard (1):
      pinctrl: tps6594: add missing support for LP8764 PMIC

 .../bindings/pinctrl/qcom,pmic-gpio.yaml           |  3 -
 drivers/pinctrl/bcm/pinctrl-bcm2835.c              |  2 +-
 drivers/pinctrl/core.c                             |  2 +-
 drivers/pinctrl/pinctrl-rockchip.c                 | 68 +++++++++++++++++++---
 drivers/pinctrl/pinctrl-rockchip.h                 |  1 +
 drivers/pinctrl/pinctrl-tps6594.c                  |  1 +
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c           |  1 -
 drivers/pinctrl/renesas/pinctrl-rzg2l.c            |  4 +-
 8 files changed, 65 insertions(+), 17 deletions(-)

