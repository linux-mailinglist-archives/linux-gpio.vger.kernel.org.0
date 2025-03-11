Return-Path: <linux-gpio+bounces-17417-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B30A5BE70
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 12:04:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0C7217A4E53
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 11:03:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F19D4250C1C;
	Tue, 11 Mar 2025 11:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonic.nl header.i=@protonic.nl header.b="o4ZTKhG3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp28.bhosted.nl (smtp28.bhosted.nl [94.124.121.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F7E235C15
	for <linux-gpio@vger.kernel.org>; Tue, 11 Mar 2025 11:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.124.121.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741691038; cv=none; b=EZWwlFn8gFM7eBrzyQY7M5e/6oeRKVORE5Umlxo2IPvlT86dcg8g4sBQAXURS+6tUfY6tiumc496NLomq+3JfjH0KMw63jtMhf3edBt+lhAOuUU2vsXdUI8PZ64K6jXuqNfxcFnj8kBDaDcgR2v+ANlnNgDckoNX5KW6VVUL/rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741691038; c=relaxed/simple;
	bh=c6gsWuE9KbTB/AbCzr5g1BWhPggo9fdPNPaTriurqeY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P80pZpfET95KXsq2JBjlRrBUEGGzggPkXYnRJ2jnOH75n1ek6M9DSArUBO8O2r8FVbyB9AFnT9wauMnA4I1zop9GkDmlkvIUtPatfBd25w66ge+Cr1TFaFCT4EwI52J+5doXQxkKMUvUeZ2eGE2dTnTpszz6ykLYqpc9td7KyZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=protonic.nl; spf=pass smtp.mailfrom=protonic.nl; dkim=pass (2048-bit key) header.d=protonic.nl header.i=@protonic.nl header.b=o4ZTKhG3; arc=none smtp.client-ip=94.124.121.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=protonic.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonic.nl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=protonic.nl; s=202111;
	h=content-transfer-encoding:content-type:mime-version:references:in-reply-to:
	 message-id:subject:cc:to:from:date:from;
	bh=ZZMF97YcPvm5C1er0iirc7cTdLB5XykMCEDCq40QqHU=;
	b=o4ZTKhG3T4SWH3ep4AOVowkxR/jOzYE9if7g5cLPT7GnO0qTy1ytEpzr4vMC/uVxtH2nS2zGyKb0R
	 ovF2R9y+aaerrmvRLOVg/0py8SLCsTUzTgX0Ysty4RJc7Z8m094rko4kNilteyeILCuiV4tfsKHYMC
	 LyjM3O+2QDrP2uvqkRWedrdtz5Qg4pm59+aeULQHZHbyyEH06wO6QcnSHHBug03o3j68NeeuoMlKg4
	 O7ZC5jam1NkSXiyIEYLvf0Zbl6wW91BrgDfVMRFRHNVeYixzA4hnu5OWCnkEyMC5Z09GLtRwlsUMs7
	 uUocogmya6Oepvj5LRiHRLaPqFIUTkg==
X-MSG-ID: 8165c850-fe68-11ef-b5cf-0050568164d1
Date: Tue, 11 Mar 2025 12:03:46 +0100
From: David Jander <david@protonic.nl>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Kent Gibson
 <warthog618@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: regression: gpiolib: switch the line state notifier to atomic
 unexpected impact on performance
Message-ID: <20250311120346.21ba086d@erd003.prtnl>
In-Reply-To: <CAMRc=MeWp=m1Bi_t_FCrxFOtiv3s8fSjiBjDk4pOB+_RuN=KGg@mail.gmail.com>
References: <20250311110034.53959031@erd003.prtnl>
	<CAMRc=MeWp=m1Bi_t_FCrxFOtiv3s8fSjiBjDk4pOB+_RuN=KGg@mail.gmail.com>
Organization: Protonic Holland
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable


Dear Bartosz,

On Tue, 11 Mar 2025 11:21:10 +0100
Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> On Tue, Mar 11, 2025 at 11:01=E2=80=AFAM David Jander <david@protonic.nl>=
 wrote:
> >
> >
> > Dear Bartosz,
> >
> > I noticed this because after updating the kernel from 6.11 to 6.14 a
> > user-space application that uses GPIOs heavily started getting extremel=
y slow,
> > to the point that I will need to heavily modify this application in ord=
er to
> > be usable again.
> > I traced the problem down to the following patch that went into 6.13:
> >
> > fcc8b637c542 gpiolib: switch the line state notifier to atomic
> >
> > What happens here, is that gpio_chrdev_release() now calls
> > atomic_notifier_chain_unregister(), which uses RCU, and as such must ca=
ll
> > synchronize_rcu(). synchronize_rcu() waits for the RCU grace time to ex=
pire
> > before returning and according to the documentation can cause a delay o=
f up to
> > several milliseconds. In fact it seems to take between 8-10ms on my sys=
tem (an
> > STM32MP153C single-core Cortex-A7).
> >
> > This has the effect that the time it takes to call close() on a /dev/gp=
iochipX
> > takes now ~10ms each time. If I git-revert this commit, close() will ta=
ke less
> > than 1ms.
> > =20
>=20
> Thanks for the detailed report!

Thanks to you for making this patch in such a way that it is easy to revert
without breaking stuff! That was a read time-saver while diagnosing.

> > 10ms doesn't sound like much, but it is more ~10x the time it tool befo=
re,
> > and unfortunately libgpiod code calls this function very often in some =
places,
> > especially in find_line() if your board has many gpiochips (mine has 16
> > chardevs). =20
>=20
> Yeah, I imagine it can affect the speed of execution of gpiofind,
> gpiodetect and any other program that iterates over all character
> devices.

Indeed, it does. My application is written in python and uses the python gp=
iod
module. Even in such an environment the impact is killing.

> > The effect can easily be reproduced with the gpiofind tool:
> >
> > Running on kernel 6.12:
> >
> > $ time gpiofind LPOUT0
> > gpiochip7 9
> > real    0m 0.02s
> > user    0m 0.00s
> > sys     0m 0.01s
> >
> > Running on kernel 6.13:
> >
> > $ time gpiofind LPOUT0
> > gpiochip7 9
> > real    0m 0.19s
> > user    0m 0.00s
> > sys     0m 0.01s
> >
> > That is almost a 10x increase in execution time of the whole program!!
> >
> > On kernel 6.13, after git revert -n fcc8b637c542 time is back to what i=
t was
> > on 6.12.
> >
> > Unfortunately I can't come up with an easy solution to this problem, th=
at's
> > why I don't have a patch to propose. Sorry for that.
> >
> > I still think it is a bit alarming this change has such a huge impact. =
IMHO it
> > really shouldn't. What can be done about this? Is it maybe possible to =
defer
> > unregistering and freeing to a kthread and return from the release func=
tion
> > earlier?
> > =20
>=20
> This was my first idea too. Alternatively we can switch to using a raw
> notifier and provide a spinlock ourselves.

That would probably be a good alternative, although gpiod_line_state_notify=
()
wouldn't benefit from the zero-lock RCU implementation and incur a spin_lock
penalty. Arguably, this is probably a lot more performance-critical than
closing the chardev, so maybe the atomic notifier isn't a bad idea... we ju=
st
need to deal with the writing side so that user-space doesn't have to wait =
for
the RCU grace period?

Certainly, I suppose switching to the raw notifier is the easier fix.

OTOH, I know from my own experience that the penalty of a spin-lock does
matter sometimes and not having it in the performance critical path is
probably nice to have.

Best regards,

--=20
David Jander


