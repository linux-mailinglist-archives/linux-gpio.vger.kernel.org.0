Return-Path: <linux-gpio+bounces-19552-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1D6AA70FE
	for <lists+linux-gpio@lfdr.de>; Fri,  2 May 2025 13:57:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD8453BD3CB
	for <lists+linux-gpio@lfdr.de>; Fri,  2 May 2025 11:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58BA4246761;
	Fri,  2 May 2025 11:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pJpgYU1j"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACB524677F
	for <linux-gpio@vger.kernel.org>; Fri,  2 May 2025 11:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746186986; cv=none; b=nAXeUOvqthrJHlfyhfZVcfMLGcOhldtO/TYDNzE3b2XdjwOqqkVBkbD2JJRJnql8q5DkmioumDKGygiL+hROfnCJi3LJK8lSIxPMwFOhHR5f+sCb2eOBIUHPVmd2XQsopDEUvF5Iy4aXP4dAALGfqLkXVgm8Bxx3j00YGpx34QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746186986; c=relaxed/simple;
	bh=c+gKYUvL+mRmw0LVpyp2dts7T0YVjJ1xgr2xwpHqjV8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=WUnZFIJLYjNnAVwyYg7EgfovWwb1XS4bRVbn9WBfnAg82rjuEW2KGXnRTQgaZHDraXogvVwMx9hzYhm2UZS31hcbAQ1qlkaoSS2w+LtrxhNmvA5aFBy3diIPVXGYVjInDC5WC1arkaJe/2EoVxmM1qqz673qy12sFD24yoSMZO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pJpgYU1j; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3105ef2a071so19297291fa.1
        for <linux-gpio@vger.kernel.org>; Fri, 02 May 2025 04:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746186982; x=1746791782; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rUNwIJ6BVyXnCNfhB8YdWYkkIgckWrMjQ8cfZd889F4=;
        b=pJpgYU1ji4jGfIxLLtgJESHZTiUhNJ7ZklNVnZg6HcCtRxbwWGmFOhORaqK377mJVh
         UY0FfG85ofIeI0S9Z6Ka+4N3lb/RR355qxMs4v4iLj8M68kvqGXhE57ucVeQTHM9yzKs
         BibeDf7FnbQdCS4zhQ5wpnnIZLIrDpAuCmp4Zjv4uNCvhLmfRHB8Gg0fWcE8tcQvMiE2
         Qk8p64t4tb2nAgBmAEdgdrJRwVlQ6LFEBU0ybhjVGZjvnLzGRT86oXj8WzEyw3MGkyOW
         EP/wHTa18vLupIM1egkY8dD0lAzU2hUnBC3Iaxfv6uUKM6lJqyaTJMfIl3/kPRJaLwYD
         jdKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746186982; x=1746791782;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rUNwIJ6BVyXnCNfhB8YdWYkkIgckWrMjQ8cfZd889F4=;
        b=fUFDBTn3WJY0UIPk4C2Kk+ca0au1o4EIKxtZsT61naEVlRD157dZ1rjJDlnkeS/cV8
         ownyIlPIa4yjHJY+X9DM8jCRAORDjcGj08MhK8KGSlUdk+oCQXFMgX/RzsTq66QL9eYP
         sflQD5bPcVeJF9lAMWr1vJbOaPlH3xx+SKW8c/4TvZK7rv9spSOAgbqeq+pm3M48kaLU
         YOYA1k3mCqon57t4Tk1/v4NviCr2IouJydtQp/7DnjwA+oX5q6Tw+Ie9qg2LPzVwqA8w
         OPQqXkE6hiDBnHixxuv2aqM3aBvGl0a4F3lQi8aMT4JT7LyDBJouYWzDvKiu2b90LDWJ
         8tVA==
X-Gm-Message-State: AOJu0Yy+5cpTL8BNGr+tgIEK/mOOJ1rPp3kSTnWx/5RD8ylfLvnuOGg/
	PwRDncQtQiTGaZ2Zf4MDJhytNa16683KW2o+b4/FiU+6dYfGHivJ/CxB0ofT5VqTihKHjCCqhpB
	uBTyVyeDdPG2/Xlwac+H56emOX4aX6ZzHZTb8CKzZ1/z0/UBrNEs=
X-Gm-Gg: ASbGncujBevB1/Vuv73k7yRW0ZSU974/j13O72M0aUtD4glUx+MW8gfpScU0QMHz4tC
	gE2gsxzBTanTzDEskVdhTYkzDDNVVWfUZGPK4eLywouULT5gTxER0TGoJHixtjWdBYkaS4wIGjk
	4BCo1COapbUs9e7zZNZtXslA==
X-Google-Smtp-Source: AGHT+IFVQ8JKPYO1rnLcM2Y70dcTgwStoWvcnB2aoZEyQzs4B/b3M5+Y/SlSIKfzxsXCMLRLq9S0sgzPIPFIrl/mQKs=
X-Received: by 2002:a2e:a812:0:b0:310:85ba:115f with SMTP id
 38308e7fff4ca-320c5be28efmr7733421fa.33.1746186981975; Fri, 02 May 2025
 04:56:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 2 May 2025 13:56:10 +0200
X-Gm-Features: ATxdqUEieMo6zqI_jOq2JYpn2sJsyAQVwKrVkhKfiEUEH0GD9sH8kJFEH6gZSHg
Message-ID: <CACRpkdbhYTFpA_jfMPFZ4t4bcVdO0+9iCsjtBnLpy9ok0U_wvQ@mail.gmail.com>
Subject: [GIT PULL] pin control fixes for v6.15
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

here are som Valborg-patches for pincontrol. All are driver
fixes, nothing exciting at all other than that they fix bugs which
is nice.

Details are in the signed tag, please pull it in!

Yours,
Linus Walleij

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v6.15-2

for you to fetch changes up to 12b8a672d2aa053064151659f49e7310674d42d3:

  pinctrl: qcom: Fix PINGROUP definition for sm8750 (2025-04-29 10:27:25 +0200)

----------------------------------------------------------------
Pin control fixes for the v6.15 series:

- Fix potential NULL dereference in the i.MX driver.

- Fix the pull up/down resistor values in the Meson driver.

- Fix the mapping of the PHY LED pins in the Airhoa driver.

- Fix EINT interrupts on older controllers and a debounce value
  issue in the Mediatek driver.

- Fix an erronoeus PINGROUP define in the Qualcomm driver.

----------------------------------------------------------------
Chen-Yu Tsai (1):
      pinctrl: mediatek: common-v1: Fix EINT breakage on older controllers

Christian Marangi (1):
      pinctrl: airoha: fix wrong PHY LED mapping and PHY2 LED defines

Dan Carpenter (1):
      pinctrl: mediatek: common-v1: Fix error checking in mtk_eint_init()

Hao Chang (1):
      pinctrl: mediatek: Fix new design debounce issue

Hui Wang (1):
      pinctrl: imx: Return NULL if no group is matched and found

Martin Blumenstingl (1):
      pinctrl: meson: define the pull up/down resistor value as 60 kOhm

Maulik Shah (1):
      pinctrl: qcom: Fix PINGROUP definition for sm8750

 drivers/pinctrl/freescale/pinctrl-imx.c       |   6 +-
 drivers/pinctrl/mediatek/mtk-eint.c           |   2 +-
 drivers/pinctrl/mediatek/pinctrl-airoha.c     | 159 ++++++++++++--------------
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c |  12 +-
 drivers/pinctrl/meson/pinctrl-meson.c         |   2 +-
 drivers/pinctrl/qcom/pinctrl-sm8750.c         |   4 +-
 6 files changed, 87 insertions(+), 98 deletions(-)

