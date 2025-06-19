Return-Path: <linux-gpio+bounces-21839-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A70ADFE94
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 09:21:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DDA193A180D
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 07:21:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F18A158DAC;
	Thu, 19 Jun 2025 07:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="nsJI4aCh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9BF24418E
	for <linux-gpio@vger.kernel.org>; Thu, 19 Jun 2025 07:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750317708; cv=none; b=ZsTsY6K6QPKNRxoPFr7bJIM791ZS9zc9nE6VkkWUwmC1PwD5QxLmOdSGTWYqnMxNz+KKWwRGkELHsahaMBEuoemuXmujEwlS11d5kSaocCxWijzdy9y25Y9hbnIxu8Y5duO4u2Xjr8pMqgIdeOp3LP6406Y2fp2wJznsWnAxdZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750317708; c=relaxed/simple;
	bh=JzJWHis4wkaAT5LGBZYcjeOsPjRm/vt6Rf3X3gEadcs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L/QglrMjfkY7Jppssx9aidA0peSOcUk4FkDySwyPUy9dkgaR7hTm/wV59P1HQ8y5hbdhSKbSOAMYVgl7qi7fDyXBUryiUzcMOTDzMzl20JqDnZctRQTCrVKH3vg814kLrfzw3bJw5wur/NEFDXJFfAlKRu24cpaIWPEmxkgnkaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=nsJI4aCh; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-553b60de463so456282e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 19 Jun 2025 00:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750317705; x=1750922505; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i2REX8f1H3qE3TCrycXPdBwYvBe5kQ22cbStBAf1MQA=;
        b=nsJI4aChNE4VXcwvzIE/aT5hcJ83Lg9kyktw4LSt4+hft1N3+8C/SL5VFi6K0g5rAy
         QS7En0sgBoiShCA4udYlkLfBzFNokpUEA7zZIet8Z3JLgwN1rADwJyu/ZzRSgKLZaCU3
         Prw2mDl8cJriy8vKWaXuv1tR1jrDeTg8n3xIj/uxupbWIrIRrOB0aZgmbJo92jlkCjfF
         FbVRqdt5ctij+RmpjOXVM0JFSi4PfuxYa+/QSAQ7aj1PmEFkcKTG/0YPrvR/DMTERZ3i
         BNKQxMbUK93wc/cCbu3SBokXyOsB/lVbR3EEKtV6s5y89ka4qgrYYh805ylSlXnuvAs/
         wURQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750317705; x=1750922505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i2REX8f1H3qE3TCrycXPdBwYvBe5kQ22cbStBAf1MQA=;
        b=PZKhTkni9K/AcRVASjKO4DGTwlzI401ZOJOs5hediV4mEeH6sJ+OGJSd6nxFIIMisc
         ybQMt9pixZqU+rNfhmf68UP63PwI4+JN9YcyAPvjkbDan9jml3q96OScY/UQ4LkMjDfA
         NotwkOtWghNZFCN8memJ2Qn7YH6V554IQC6q5OuXn39K6skoyoLqmxON10jNNwHt4ZkV
         Ex+yB1ytarWt2WMAyEyvakCMowTSgC8pX9jLw/zA6Amzyxu4Qxvr+kHE+2EOrhsmS3eC
         PSw55Ii+VrHKtSM2mX2xferCSWzSIe6udO05QjIfWXZCOSixwsQmZ2FNmzN0/eXzTRlt
         N9tw==
X-Forwarded-Encrypted: i=1; AJvYcCV7kGTVka8Bn7usjhRjZ7CRrC3GPolSYg511m+NOC896nbk9WxSCvjjw36TloKrQHYT990wnphqNgd6@vger.kernel.org
X-Gm-Message-State: AOJu0YwTejBg8JS70Xk4DrWwWtLfEoced5Teb2DI96+FO8bp7GHZH4TT
	+G5sB2WmzEW2fc6svMD+TDcG3ly0mmCvMVAFD1jSzl01aweUBbTMmeIjWgDL9uxhDX1LAF+SrGp
	yVgGTyeHEGnftbMyAlSIO5tEVwqppNdKdnb1ZDHYieQ==
X-Gm-Gg: ASbGnctuP2H+kqpN42XH8J55fo7wVjB1rDUS70pVo/IlQfylW0CpyVqI79cVoAmBX9c
	CVgwNBb7X5JS1EPXRkn9xucZnz5ZlB8vpMTxiV1DhWOoytjqtNhGEDzwGP08uVruLsK+1XER3v6
	y8puv7T7t6Ght8++zf/oe5OLlHy5WGh/8FJunBZAbA09b0n61Mgxo7WOIWnHKjVE1HJtVILZFNK
	Tk=
X-Google-Smtp-Source: AGHT+IEh54Pu16jXn4P+irLbn846Wet4MTiIBtxZ5XCuFceE2ajC9TqO8oRVjTcWCkeViL2vbItUiC+8YwBhD/ZWW4o=
X-Received: by 2002:a05:6512:15a4:b0:553:50c6:b86c with SMTP id
 2adb3069b0e04-553b6f6b5ebmr5729673e87.57.1750317704976; Thu, 19 Jun 2025
 00:21:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613-hdp-upstream-v5-0-6fd6f0dc527c@foss.st.com>
 <CAMRc=MeTmwgbHv9R_=GFmjkAV4Nvc-SeSCOz1k6pnGUrF+R9Mg@mail.gmail.com>
 <CACRpkdax9ojguF1SAfiN9iZi=x3VFpCea6KnhzL3JBD9EXZepw@mail.gmail.com>
 <CAMRc=Me8KZPU_KbbifL-j74GMPSuDgmmacw9g1UEfy=zeGyZcw@mail.gmail.com> <CACRpkdYUr+82AKndieXm24Eg1-HY4LyfKZ9J_kTFKT1Nyyju1A@mail.gmail.com>
In-Reply-To: <CACRpkdYUr+82AKndieXm24Eg1-HY4LyfKZ9J_kTFKT1Nyyju1A@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 19 Jun 2025 09:21:34 +0200
X-Gm-Features: AX0GCFvQx5dYUJVAAbuivosq23yF4paNEi7sLTcojRfNtcaypuIpqfvXVp5M46I
Message-ID: <CAMRc=Meq9+hnmvjXnq-YUJRPOOBvAV+pjHQ25k1wgFqV30Vo=A@mail.gmail.com>
Subject: Re: [PATCH v5 0/9] Introduce HDP support for STM32MP platforms
To: Linus Walleij <linus.walleij@linaro.org>
Cc: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 3:45=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Wed, Jun 18, 2025 at 2:32=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
>
> > I have a rework of gpio-mmio in progress that removes the bgpio
> > specific fields from struct gpio_chip. This includes moving the flags
> > into a separate gpio/generic.h header. I really need to either apply
> > it myself or get an immutable tag from you with this change.
>
> OK try this, if you pull in this to your tree and work with refactorings
> on top, everything should work out fine in the end:
>
> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd13544=
94:
>
>   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
> tags/ib-gpio-mmio-no-input-tag
>
> for you to fetch changes up to 4fb8c5d36a1cfd97cd715eb4256708bc09724f3d:
>
>   gpio: mmio: add BGPIOF_NO_INPUT flag for GPO gpiochip (2025-06-18
> 15:40:29 +0200)
>
> ----------------------------------------------------------------
> Simple change for no-input MMIO GPIO
>
> ----------------------------------------------------------------
> Cl=C3=A9ment Le Goffic (1):
>       gpio: mmio: add BGPIOF_NO_INPUT flag for GPO gpiochip
>
>  drivers/gpio/gpio-mmio.c    | 11 ++++++++++-
>  include/linux/gpio/driver.h |  1 +
>  2 files changed, 11 insertions(+), 1 deletion(-)
>
>
> Yours,
> Linus Walleij

Hi Linus,

Sorry I didn't notice this one. But I see you already responded that
you pulled my PR from today. Should I ignore it?

Bartosz

