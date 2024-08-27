Return-Path: <linux-gpio+bounces-9223-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D34961201
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 17:25:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 83F6F1C2322D
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 15:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9871E1C93B6;
	Tue, 27 Aug 2024 15:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aa5dKryM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A96E19F485
	for <linux-gpio@vger.kernel.org>; Tue, 27 Aug 2024 15:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724772330; cv=none; b=VaBMsQh8eYHGFAyZFC6olMj6faQzAvAOLUGxM7/4PPgqBrTGaBagc6/AhA3qXvG14FsM7ssaa4jgK1O9jR+A83qU8B/SA6fBEw3deHLoquhSH3zcrgzXqrMoUpCBX/lAzoCylbN5j7T9gfw9hU8FH6opjROvP2SECHc0r4rd89c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724772330; c=relaxed/simple;
	bh=g8PzivK/LOA7LwMV2nTLLVuvJxR4cEPe+e5NQo45z6w=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Y7sMD8jBBsy/pDRkhL8uDz/7s3qSmla6VsRr7euAkU4vWQ6hB/hBEfGcwbAvVW1ZBbjo90vXcVJ0cwXzeNKXV2igKGtzouH0tDlXZmsBRTVvWwEM00sIWiAoF0//b0kAw6LK1GuW2w1bN2PCQjrQSBE8PN2pbi/oRGjw2x1Ughs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aa5dKryM; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5334fdabefbso4926885e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 27 Aug 2024 08:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724772326; x=1725377126; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nrb5Vc3qSwLA43ufwjhdVQVpmhMVD2NR4A5ewZ/IEPQ=;
        b=aa5dKryMYJsfYdjJniNlM03TLiezYqKR3qaouTy1CDUNjN/dwGjiRXkqKsAr4brOEP
         2yiGHWMBh9VXLGeXasSejxKBi3+dZlsOYqxsoiPNy1k9iDV39lc79BvVthH4UolLGHMB
         AdGLumz/vfKdXEku4fTFrK/B/DSb5gRyOORfsstUSTZAbAm0okuWi7f8SRPPxinMw0No
         PJvA9Yb25KEJDPPRNzmmh5j5TViewT3hHEwY2wjM9U1jtoVDSJKKHuMeap9pmxySnsfJ
         sPwOLYyn+fohYDqGniI+B2UbLuqKVCd1IGbM8+LtLzRJ9LbtoRaZaJRnyaKYo2Wr/V0c
         koYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724772326; x=1725377126;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nrb5Vc3qSwLA43ufwjhdVQVpmhMVD2NR4A5ewZ/IEPQ=;
        b=rMkISIeqiU7zDEjZvMrAFfchFZz2n35JNY3IxK+Uck0Ic3dd3rR4dXCA1NRcYdeslG
         AzGSk1NMTSVAsDd6uUEgN1zg//pPTxYTzhLPtwOIDLHpQPrJaASm1vopV4Tb0sFFUcN8
         HRqbWFEVQUGHobpshQQCPpYGdho8ioBzybVfhwclsv982kFDBGhnjFwP9UW/2XwA8NkN
         CpeBggRZyncgb8gOXfurxprvvwGKWTmWpLl6fOeSatAO2j5E/JRefU7hqS60Q7aBA6ft
         7PpN7OBXsmectHCTOms2AXN0uQeIm162jtkX6fujO3TsKNiTXGxHXNH/bDS3oVdCpGen
         nlKg==
X-Gm-Message-State: AOJu0YzPxoUmFOzq6qAOONjOpRX4jTQo700vFZKBLUUCTRsJsKtAsFaA
	gHmXYrtrVn5nOp5HyzJPbka1rHG/SSKZfIrTNgFJA3L0bdFe4OAfSlDzS8reXv/yM6+znXtF0fQ
	pdOWKnRGGGZ8oafSVISOubF+XEZfq03ZZQnnX0w==
X-Google-Smtp-Source: AGHT+IH1xiFBwEH0y6vYTLzLWKM2ZFp4UQ78DvCJUlStFVOLhnp4iZFm3fkMY7odrrlxKwE6UBfkjJxYmnJ0rIj3h90=
X-Received: by 2002:a05:6512:3b06:b0:52b:faa1:7c74 with SMTP id
 2adb3069b0e04-5344dd6b5b6mr1295153e87.5.1724772325851; Tue, 27 Aug 2024
 08:25:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 27 Aug 2024 17:25:15 +0200
Message-ID: <CACRpkdbWs10eU-jSiN9H6UNkTNA7K8PS3gAfUxe+T6dktJsSyA@mail.gmail.com>
Subject: [GIT PULL] pin control fixes for v6.11
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

here are some pin control fixes that have been stacking
up in my tree. All driver fixes!

Details in the signed tag as usual.

Please pull it in!

Yours,
Linus Walleij


The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b=
:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v6.11-2

for you to fetch changes up to 128f71fe014fc91efa1407ce549f94a9a9f1072c:

  pinctrl: rockchip: correct RK3328 iomux width flag for GPIO2-B pins
(2024-08-24 16:39:51 +0200)

----------------------------------------------------------------
Pin control fixes for the v6.11 series:

- Fix the hwirq map and pin offsets in the Qualcomm X1E80100 driver.

- Fix the pin range handling in the AT91 driver so it works again.

- Fix a NULL-dereference risk in pinctrl single.

- Fix a serious biasing bug in the Mediatek driver.

- Fix the level trigged IRQ in the StarFive JH7110.

- Fix the iomux width in the Rockchip GPIO2-B pin handling.

----------------------------------------------------------------
Hal Feng (1):
      pinctrl: starfive: jh7110: Correct the level trigger
configuration of iev register

Huang-Huang Bao (1):
      pinctrl: rockchip: correct RK3328 iomux width flag for GPIO2-B pins

Konrad Dybcio (2):
      pinctrl: qcom: x1e80100: Update PDC hwirq map
      pinctrl: qcom: x1e80100: Fix special pin offsets

Ma Ke (1):
      pinctrl: single: fix potential NULL dereference in pcs_get_function()

N=C3=ADcolas F. R. A. Prado (1):
      pinctrl: mediatek: common-v2: Fix broken bias-disable for
PULL_PU_PD_RSEL_TYPE

Thomas Blocher (1):
      pinctrl: at91: make it work with current gpiolib

 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c   | 55 ++++++++++++------=
----
 drivers/pinctrl/pinctrl-at91.c                     |  5 +-
 drivers/pinctrl/pinctrl-rockchip.c                 |  2 +-
 drivers/pinctrl/pinctrl-single.c                   |  2 +
 drivers/pinctrl/qcom/pinctrl-x1e80100.c            | 35 +++++++-------
 drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c |  4 +-
 6 files changed, 57 insertions(+), 46 deletions(-)

