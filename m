Return-Path: <linux-gpio+bounces-21776-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FC7ADEE41
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 15:46:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C55861BC17F3
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 13:46:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEF4E2EA174;
	Wed, 18 Jun 2025 13:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t74qUHsw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9A617C211
	for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 13:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750254354; cv=none; b=UU6t6w8ZHLGpEW3xzO4t/rL47r4bDwsMu4zkXqU9qHeQ+532ekrPhdbu1FiPFGkeSPIINqWKvAFHPmmszMqPJyLMRP7bMXnY4nSw/0W93xPnU8NvwLz7l0cw1/E6ZM2yMnpEsJAHYw8VZiOdEpmVz/V5vyW31m+2Viq/yls+tC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750254354; c=relaxed/simple;
	bh=19E5xzem+HM4mzJ9G9HwPWEjZc+eWYv4kOOjLaWu+OQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E/wkbdFsATH7zccvIYtJnJXCMYVXrq8UbxVXxr8Ousf2NBS6at019u95WJUPr2sGk62yEpsps1xH5+UNoMpy1qFSTm/rD4+9gW35JbdLmaRG7ZK4l2vuT4s7DPdUsPFdAGAmZk4xro1EvCStgYRE6cbYJM5FTkEElSMmtoaXP9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t74qUHsw; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54e98f73850so6544345e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 06:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750254351; x=1750859151; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2/gJrRRXdsw8VIK/TYIkdg/GMO90OUx2DtzMMD7n2LE=;
        b=t74qUHswVgk4QQi/Chb/sCj05d5tCoRzQfMtrKHm0JOvhU71i/fceWJ7UatIzV1TjQ
         LZoW5Ec6a1jr7Bg2S0bqQlbwEDvPEd75IbqIgS/DJSVEptdC9BjTjaeXuMdsVUT363Lq
         EWVeNWKgKcZtE6Rmk866hrf2PHDTPzx7eyj1T5dKq3Nsq1mfAdyZW2xCzySyIUspen4W
         2ddQICNPyEueT8rDWqSbBuv0ecfz82Q4X8gq3coM8PJ9lKpSVdO5+3EZGe1ac1t7Jxtt
         H2tRJrCMjFFEoonVK/TgTQ/9fnoa1ZQpyP1agDRkL5d4qq2WZCLLVWxacZKA15sgV0s5
         MU/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750254351; x=1750859151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2/gJrRRXdsw8VIK/TYIkdg/GMO90OUx2DtzMMD7n2LE=;
        b=GzTZdJKItFF223Ic+e+h52XO4LScpt1q2LYHuLBLXBH/fVpcGyHsyZq7z8GLAYFVyZ
         bJpthg9vo58nE4D6/+g2tpzXqmAeJ0NBN1GDbCfjyxKXYfcW01RbWfzioXVIdF1JbRTW
         2ZpjvPcBPhgL6nWpM0Oyu2Pfxiw13uevq0/SAOJ6xlmOxjOzxTduTHLnIyUuVCHRIOzy
         VHB60jV9ZpitRmEy9HWXc9kF2NxKgqFdJjWNu1e4cSUezmy9F/r4u4DywvWrko5RsyMT
         I81tokW6i3SAW6ZCTqRj941BV8nx26wmzR993sC4zMk5m0nlrq5uK8vm6FnmrfaxFRPl
         NAfw==
X-Forwarded-Encrypted: i=1; AJvYcCW8rT22tuIt3+EhVgIDHWM7gnMPL9XuI/K/mIxaTuR/e5jvRDwgZXbK7GOqlXvVnN/IHBZRQCNAW8/l@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ2gsMTQa+5Foj1Rl6INwT7CaMMxDivyMYKyY65TqMi9L0cqxT
	fGg92cMuyEtPZFaRCsPoYZKX7lYzxv9hSaJmQQF7eA7+oMfCEdJJzW3w+oWXT2YVjjCDUiZuJJS
	RTjv4FYYhUS0INW8WcknWWixcJeK27A95i9sWVR6iGg==
X-Gm-Gg: ASbGnctTnk1w1EkKNf0uEOhur+jyeDkPCjnzd+lanLeQ0py3Z1swz+sfM9X3P20osnC
	2CWnZX5InPwuXTHBXnkGezX9RtEM/rKxWAqiWAPb9P6sZG4cQJ6U+yRqOzp+9tTrEBLe92kmjkW
	Vk0M/hS6XzG0kzfl4TUqbFtWwoMerkt5a7wFLy87D2SpY=
X-Google-Smtp-Source: AGHT+IHUziRG/lS1am2zFPjRrmYzIzsrLZlEENKDKAFZ3rfCXoeUyGuA1Pal15qAwexM+uRj2zqwrZ6IAzL5/+4dp/E=
X-Received: by 2002:a05:6512:3c9c:b0:553:2f61:58eb with SMTP id
 2adb3069b0e04-553b6f3f11fmr3977179e87.49.1750254350731; Wed, 18 Jun 2025
 06:45:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613-hdp-upstream-v5-0-6fd6f0dc527c@foss.st.com>
 <CAMRc=MeTmwgbHv9R_=GFmjkAV4Nvc-SeSCOz1k6pnGUrF+R9Mg@mail.gmail.com>
 <CACRpkdax9ojguF1SAfiN9iZi=x3VFpCea6KnhzL3JBD9EXZepw@mail.gmail.com> <CAMRc=Me8KZPU_KbbifL-j74GMPSuDgmmacw9g1UEfy=zeGyZcw@mail.gmail.com>
In-Reply-To: <CAMRc=Me8KZPU_KbbifL-j74GMPSuDgmmacw9g1UEfy=zeGyZcw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 15:45:39 +0200
X-Gm-Features: AX0GCFswiuSIv0ost8RQF2yKzjiS_gJyepvrD4dGuyTD_K-1OJ1mJ0Mc6pZHztk
Message-ID: <CACRpkdYUr+82AKndieXm24Eg1-HY4LyfKZ9J_kTFKT1Nyyju1A@mail.gmail.com>
Subject: Re: [PATCH v5 0/9] Introduce HDP support for STM32MP platforms
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 2:32=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> I have a rework of gpio-mmio in progress that removes the bgpio
> specific fields from struct gpio_chip. This includes moving the flags
> into a separate gpio/generic.h header. I really need to either apply
> it myself or get an immutable tag from you with this change.

OK try this, if you pull in this to your tree and work with refactorings
on top, everything should work out fine in the end:

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494=
:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/ib-gpio-mmio-no-input-tag

for you to fetch changes up to 4fb8c5d36a1cfd97cd715eb4256708bc09724f3d:

  gpio: mmio: add BGPIOF_NO_INPUT flag for GPO gpiochip (2025-06-18
15:40:29 +0200)

----------------------------------------------------------------
Simple change for no-input MMIO GPIO

----------------------------------------------------------------
Cl=C3=A9ment Le Goffic (1):
      gpio: mmio: add BGPIOF_NO_INPUT flag for GPO gpiochip

 drivers/gpio/gpio-mmio.c    | 11 ++++++++++-
 include/linux/gpio/driver.h |  1 +
 2 files changed, 11 insertions(+), 1 deletion(-)


Yours,
Linus Walleij

