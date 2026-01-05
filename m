Return-Path: <linux-gpio+bounces-30159-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A31CF48CC
	for <lists+linux-gpio@lfdr.de>; Mon, 05 Jan 2026 16:59:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF19B3048EDF
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jan 2026 15:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 835E33346BC;
	Mon,  5 Jan 2026 15:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t88tAqoH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3510328DF07
	for <linux-gpio@vger.kernel.org>; Mon,  5 Jan 2026 15:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767628450; cv=none; b=Zy1rh29dgHhDiSYyBdQVlRukBCYufLp9Ke2oxBF4ku8r7qFfvZeJlrmwTbdFG2C9aH3OOuicnhEcbaCQFGA1f3C/yI5ZbKpTynSbno/ojVi58AFSgSYXxdq0zTQajsfwH7g66MSaGkdJ74UKT4UypDELa5X2vIB8etAnT32AqRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767628450; c=relaxed/simple;
	bh=UECiAuAY37aaRjLtKuMQ1oabwDkelKC3Jmp1YbxkuD0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ps7JQR9o84g+LM6wGx2xCkzcKXSheLaeoZr1slaMbCm8qTjwBt86bY2aj5WbANEEH1msUB3JrWX2BRb32sKblzkI/hSVXk6uje9DoGE7FSxkiF19D8LWQcqtc7QULUihku5CUf0oRxDtRplBV2mXALj2b4BzaZwB/Z7GraTQ1KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t88tAqoH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1D8FC116D0
	for <linux-gpio@vger.kernel.org>; Mon,  5 Jan 2026 15:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767628449;
	bh=UECiAuAY37aaRjLtKuMQ1oabwDkelKC3Jmp1YbxkuD0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=t88tAqoHtAfMgBQ4ItDGvf/4tkPj8/Mp9HvIFD6BQ5ipD6ZEf5eUAdlcRfCEmpUnV
	 K5ZMlcXzcqrwK0S0W+7Us0l/LCKV/dO5X5I/qeGvJSg/ecPNljVZlBddrtoNEjzmie
	 2NK5Z6Y7EqIsAkRjNgw7u0QZ/Tdt2Uokz3DuNWSiJh0WTlXwEvlVAx3dc1MK54gqDw
	 hrm8krUIEbQQ0Ci1jx+RJ6sFB0MsDBIGbRDHzhtCNMnRtepx+7B73gWiUw3JgbMHjC
	 vJfuBmesTkbxsXlj4RW2IK78LJgoQz8juA7IFHj3CmDphoivu72OSVEtKrX9nzAexG
	 mgakCb8KeslPQ==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-596ba05aaecso11653e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 05 Jan 2026 07:54:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXHP+jSaEmfSGQR9dMRMZnufHayKg2XYMxh9rA68E8KGTIMw/BxjQRFkSG/UQbE1XngKhVy3mV4NyI3@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk4BycMu9dvkktv0T0OIdxpAWwUvCeDYwJLbUF9dXCoYUCGU5l
	cWfxzgZvw7jIYTIfMBHJIGqGxWy4y7zYe70NnbWCf+xJ3yqt1lXZK6KS95vD9q7o2bgRFSGlSgL
	FzGcWbQRXBlCFNs7nJNsG4/F3ESc79p5OGqHMXS5RbQ==
X-Google-Smtp-Source: AGHT+IHDvzAHVQJM6EgeGq3LwpEV2Ha29m9nX7J8jMRxlomdXMc08I8xSPuXTJ7W+ZdAzkA4APaVmkyaR2Oh4MqfLtk=
X-Received: by 2002:a05:6512:b94:b0:599:fe3:785 with SMTP id
 2adb3069b0e04-59b652ee5f2mr53154e87.52.1767628448316; Mon, 05 Jan 2026
 07:54:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222-gpio-shared-reset-gpio-proxy-v1-0-8d4bba7d8c14@oss.qualcomm.com>
 <CGME20260105115023eucas1p1af1f8e80041f94843beb664966894fb9@eucas1p1.samsung.com>
 <20251222-gpio-shared-reset-gpio-proxy-v1-3-8d4bba7d8c14@oss.qualcomm.com> <00107523-7737-4b92-a785-14ce4e93b8cb@samsung.com>
In-Reply-To: <00107523-7737-4b92-a785-14ce4e93b8cb@samsung.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 5 Jan 2026 16:53:54 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfU5Bde9Cp2qLaK+8TNfAiFq-UMHcaoCXc2+iLgwNPBKA@mail.gmail.com>
X-Gm-Features: AQt7F2omcIH4lmEdg3f1GFl733w4svrMtG355QzFxq3RuebVtcDfF-d-RvQ-8p0
Message-ID: <CAMRc=MfU5Bde9Cp2qLaK+8TNfAiFq-UMHcaoCXc2+iLgwNPBKA@mail.gmail.com>
Subject: Re: [PATCH 3/3] gpio: shared: allow sharing a reset-gpios pin between
 reset-gpio and gpiolib
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 5, 2026 at 12:50=E2=80=AFPM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> On 22.12.2025 11:01, Bartosz Golaszewski wrote:
> > We currently support sharing GPIOs between multiple devices whose drive=
rs
> > use either the GPIOLIB API *OR* the reset control API but not both at
> > the same time.
> >
> > There's an unlikely corner-case where a reset-gpios pin can be shared b=
y
> > one driver using the GPIOLIB API and a second using the reset API. This
> > will currently not work as the reset-gpio consumers are not described i=
n
> > firmware at the time of scanning so the shared GPIO just chooses one of
> > the proxies created for the consumers when the reset-gpio driver perfor=
ms
> > the lookup. This can of course conflict in the case described above.
> >
> > In order to fix it: if we deal with the "reset-gpios" pin that's shared
> > acconding to the firmware node setup, create a proxy for each described
> > consumer as well as another one for the potential reset-gpio device. To
> > that end: rework the matching to take this into account.
> >
> > Fixes: 7b78b26757e0 ("gpio: shared: handle the reset-gpios corner case"=
)
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
>
> This patch landed in linux-next as commit 49416483a953 ("gpio: shared:
> allow sharing a reset-gpios pin between reset-gpio and gpiolib"). In my
> tests I found that it breaks booting and triggers warnings on some of my
> test boards. Reverting it on top of next-20260105 fixes those issues.
> Let me know if I can help debugging this issue.
>
>
> Here are relevant logs from my 3 test systems:
>

Hi!

I've just sent out fixes for problems #2 and #3 with you in Cc. For #1
- are you sure this is really the commit that causes it? It doesn't
seem to have anything to do with shared GPIOs.

Bartosz

