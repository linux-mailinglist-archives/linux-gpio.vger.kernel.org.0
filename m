Return-Path: <linux-gpio+bounces-30363-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACC5D0AC01
	for <lists+linux-gpio@lfdr.de>; Fri, 09 Jan 2026 15:54:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B9255304B3C4
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 14:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA6943112D0;
	Fri,  9 Jan 2026 14:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mbGMHRlL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA9C23D7E0
	for <linux-gpio@vger.kernel.org>; Fri,  9 Jan 2026 14:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767970269; cv=none; b=W+DJmXwvdUKD6O4orsDXflJZSqumfDAl//3V3RG8SKmhZ/lL77m/8RVXJPtEX0KjS5pH1HdnIA2qexw2fWaewwaIHyXgn9E0nhNk8lMPTmNknXIpnmCTeZ5qu4v793r2lNofCWHPdRE8c1St+iUIzQxLhJk5HmLz88TSNp6tWoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767970269; c=relaxed/simple;
	bh=ffSIdQ2PNsRvxyqqOyb02+48iytTLOKjoT6hEyjMSVs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qPskgAED2tj0puBATIu5faNdJX7GLgxKIKe88G+uiWu7QY2xOiZDasooyaTErfw9kilHAsJfoxgXm5hwTYhP+vLBChwraexBdElCrz36YjfQjJ87KqJh0EJRVVBFct4F/Z64w0hqF4no5WzLX1r40mN5MM/cZ5+6uYadh95Lx/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mbGMHRlL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CF91C2BCB1
	for <linux-gpio@vger.kernel.org>; Fri,  9 Jan 2026 14:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767970269;
	bh=ffSIdQ2PNsRvxyqqOyb02+48iytTLOKjoT6hEyjMSVs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mbGMHRlLhqYS2ya4PyuJMIiYA0doc95NeLBSKbWu72RoIOpYxxZelGFa1RhLnEDMb
	 DcOYX4T7pxbpP1KEJKt8yUk/ELRsg9xKd8WzbwxwKqkNt0Y9X+k9HQnhZ+Gcl5s0Y6
	 uq4V5NEO6nSo0b7r7soNLkfc2P+N5Dnw7iwytQA9BUOYy3TFjxRXyZqnuOIy4tlfae
	 cA3rsav9akK4sFTS5cv526uys25TkXRsk4E0JUHTnWhU/nbOmQQT+YKxmBdNWdikQS
	 FjKKYgy24mrSYdfVfl8DTK/MC2V77OUiBnnO/w7JGwBogtzAVqHaSYXvCG22Ne4UNB
	 peJVTULZiLheA==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59b710d46ceso3110789e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jan 2026 06:51:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUnXJnDnW6WX7O/QMNucvPfIx7Nc1K0sb/NUDpNC9I4riOrsvFkFEQ/y8YQzRKZJhXyc5Nxb4pq5Bp3@vger.kernel.org
X-Gm-Message-State: AOJu0YwuW/Ur2/q61IQLJPnAyaQRuOuHmuwSHobzvHjRtSj0rNXmQIWw
	qJukgYKekfheexbEUo56aWuW9gCeMvvVCUwfkS4zHLD/cM76+uTRO6woI851tSRy0pDJfHSC1bD
	1uSK+/C/hw3nNHAC/+x5vG4M5Ki46dQaKDBpdcxWPeA==
X-Google-Smtp-Source: AGHT+IFWLhfvuow8qIMZYK/7g5CiMgRDievFLnj4NheWNLi/FbbvnO/XWEOCiomEy5A3LhBVoz3hWrlHQBZegWrkP4Q=
X-Received: by 2002:a05:6512:39c5:b0:59b:7df0:112d with SMTP id
 2adb3069b0e04-59b7df012d7mr1084680e87.44.1767970267847; Fri, 09 Jan 2026
 06:51:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <DFJAFK3DTBOZ.3G2P3A5IH34GF@kernel.org> <CAMRc=MeQ_zr047PxFFGhfZ43TuHoKG-9VLLefxVyScpO5ZxjzQ@mail.gmail.com>
 <DFK4Y3EOXTFL.1M25VAPJAS2BU@kernel.org>
In-Reply-To: <DFK4Y3EOXTFL.1M25VAPJAS2BU@kernel.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 9 Jan 2026 15:50:53 +0100
X-Gmail-Original-Message-ID: <CAMRc=MeG9fPaq8M8ACq7_9+ysmYX+aRRzZVgApv5YMGtjx72Mw@mail.gmail.com>
X-Gm-Features: AQt7F2p7IS6vaLQ0dmPwJ8037-3GQtwV1AnCbiyFDt_1RcT0ou-6dHscMRpm2ns
Message-ID: <CAMRc=MeG9fPaq8M8ACq7_9+ysmYX+aRRzZVgApv5YMGtjx72Mw@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] gpio: improve support for shared GPIOs
To: Michael Walle <mwalle@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 9, 2026 at 3:41=E2=80=AFPM Michael Walle <mwalle@kernel.org> wr=
ote:
>
> > I am aware of the issue where
> > false-positive shared GPIOs are detected, I posted a fix for that too.
> > Without logs, I can't really tell if that's the case for you though.
> > :(
>
> What I mean is, GPIO_SHARED is automatically selected by ARCH_QCOM (and
> probably others in the future). But GPIO_SHARED_PROXY is
> selectable by the user and it can be deselected. But you cannot
> specifically deactivate GPIO_SHARED. So there is no way to go back
> to the former hacky shared gpio handling; which might be intended :)
>
> If so, shouldn't be GPIO_SHARED_PROXY be either y or m if GPIO_SHARED=3Dy=
 ?
> I.e. don't allow it to be deselected.
>

Fair point. I'll send a patch.

> >>
> >> This broke my board (using the arm64 defconfig, works without
> >> GPIO_SHARED of course). I'm seeing two issues here with my board
> >> (arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67*):
> >>
> >>  (1) It's GPIO controller (gpio-davinci) doesn't support
> >>      .get_direction so I'm getting ENOTSUPP during probing of the
> >>      (some?) shared GPIOs.
> >>
> >
> > Unless this board really shares GPIOs, it may be due to the
> > false-positives that will be fixed by this patch[1]. If you enable
>
> Yeah this board shares an enable GPIO for two regulators
> (regulator-5 and regulator-6,
> arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts).
>
> > CONFIG_DEBUG_GPIO and post the kernel log, I'll be able to tell for
> > sure.
>
> See end of this mail. I've applied the mentioned patch.
>

Yes, I see there are indeed shared pins.

> > Though thanks for bringing this to my attention as I now see there is
> > indeed an issue when the proxied chip doesn't support .get_direction()
> > as well as a duplicated check in GPIO core. I'll fix it too.
> >
> >>  (2) GPIO_SHARED_PROXY is default m in the defconfig, but I need the
> >>      pins for the root filesystem medium, i.e. the SD card regulators.
> >>
> >
> > I'll take care of this is you confirm, the issue persists even with pat=
ch[1].
>
> Not sure this is still valid. Because I've just learned that
> apparently, the arm64 Image shall be made smaller and thus "need
> a driver for rootfs" isn't a valid reason for =3Dy anymore.
>

Is a switch to disable shared GPIO management entirely via Kconfig
(depending on CONFIG_EXPERT) good enough for you?

Bart

