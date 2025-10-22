Return-Path: <linux-gpio+bounces-27437-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 98776BFBCF8
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 14:18:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B7DF188BB2D
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 12:18:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0E6E341660;
	Wed, 22 Oct 2025 12:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xAv5oXoK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6707340A5D
	for <linux-gpio@vger.kernel.org>; Wed, 22 Oct 2025 12:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761135489; cv=none; b=hUGEWsrfzVi8c8CMiyq9g6higFcHuE/ZzpOF1xvAoiMNJPMfkzHTnvqCwFaByi7PU4jkFWEjq8puyiYfgaA4JPuO53Cmyg66inmZ98yVzy8lfW/JO4dJSa6PC2CsP6phlSYSfIrYinsQualdoyaKwW8v2rik5XIjlX8xtY5h7y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761135489; c=relaxed/simple;
	bh=WBrGicdJ7vJmFD7ULLVAtRjwv/BXxswDEpGZGdImK50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aKoL4RyXTvohwcamFkuJ/RuuoXEpV2r30K1rwCFhfFOUNiGz7WK5Ws97HaPqseGqipk3x4UQFmS6sMpYWxpsM2whNGph896yzeqW8DrcPlzKlwlkWQ83axqFNLd8rgeympEcyeh+QJK18/HAiuM3p9m5YUTf8q/B4vSoHDMzYEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xAv5oXoK; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-592f29e273bso277312e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 22 Oct 2025 05:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761135486; x=1761740286; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WBrGicdJ7vJmFD7ULLVAtRjwv/BXxswDEpGZGdImK50=;
        b=xAv5oXoKfbVVGAdLjEvtVPWEgV3x5Pvth28fyWj8XT99aP3h1JGqI53/ETWjYdhM22
         AEUlAVuEK6kO90RcDw8uvYpsiTJ+1haXJu059RYWMFhCpGOO63zgJg0A59NfgjicHi79
         8aQfMB6RqnoVOMB5gkSc/rg/amESUiBVaFuM1pp29pi0VHBbFGCnftpmUtsJlEKeKBju
         iP33FyuJbRP1SJZ68JzrDBgW9YomyAkR2RkmvMv1dzSuYfTUTjZoUfB2uvambnnaJrsr
         1jPDBQJ/mSWTMUhITVVBuV457GRLUQQ3OqJa+KMZBiwjaziPAHyNXutnsc1O6IgXGSoE
         4yDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761135486; x=1761740286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WBrGicdJ7vJmFD7ULLVAtRjwv/BXxswDEpGZGdImK50=;
        b=qFWEsKwOAJcf9QLP20zEUePPaDeYDb/CJniP90/8LHQ7YQJg9XV27bfe6hjDVnOj4c
         3euyzuLau2i9tFohBvAKT7grFy37hMIMRy2sIo2IehIVuHqNr74myPOeqMMBfA27rvg7
         OCacJNMdgvYuRlIlhpWtFFoDVF7fCUJUOk64f0JdBge9pkgJcAu/YDX0j8ZLrmfjdqDs
         DDurYQHvXhmA0agaYohf5whV2TilONrFiDej7IGzOLiKQZF7778hzg49O9K8hpSIGYb/
         w0SDo7He+7zrVvxxkZrklqzJyS7GN54eD9Wxmn88BuXfz7HUu6+3PHd2Hu5rLwuSVRqg
         qrGQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5Ht49Xey21+xqK546UrLDWzHRF4El26eTzsYMe8Am5KWxbev3CjQUQ4cga1c9Mxn4cwbtK3bCxNhg@vger.kernel.org
X-Gm-Message-State: AOJu0Yyjn7VdRYltL7zU2ycuWPRRDZ+R6mk20B5fT1i00sIRbmggDm7B
	FFT73Godco6OppsjALfkMXC7JYsE923lwm3aE229I2chqO3Ckxg0Z9iqnz3135DH/3mboMD3yEc
	Tawg4PQbJhUi5p6J39hhhryjQ5rg9/Amyy4mNFW5CKw==
X-Gm-Gg: ASbGncu4GD0PffYwVz7wfC+/HX7G8O1hnjoB6rKI9Zn4/mjwEAHUfMhcVf/Bl6cv+wV
	48R3q7OGz4tdDFzbElIXH3rHyB2XxEm/Jnqab5bxhUxqBqYF4uhnKZ1gIixT5p2+cU51mU36Oe2
	/V038TVj1ZYj3xnopTwFyR1MImzUwKYyiUS0TjsIcENBx9Nxp22pyuWMvp/KGY0tiyO2Aih534A
	SHBSsNx4i4NThoKhI/jiPP42RWroMdczDb7c9vOaXo2hfo5NpCIPt4Nf+7uze3Q16aNbhkzTsCi
	oehaCTkiKpBbzEeb
X-Google-Smtp-Source: AGHT+IHdFjD1upF60QNrKQiPHb0EuLyjig0EXitYcomcOh2LTKy2vCTOo5wwpoP3zGRv3ACq4Fw6m6AiGSWjUoYZbaI=
X-Received: by 2002:a05:6512:1115:b0:591:c2f8:9a5a with SMTP id
 2adb3069b0e04-591d8595e35mr6051681e87.35.1761135485542; Wed, 22 Oct 2025
 05:18:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251006-reset-gpios-swnodes-v1-7-6d3325b9af42@linaro.org>
 <95bbec130437846d4b902ce4161ccf0f33c26c59.camel@pengutronix.de>
 <CAMRc=Md_-mO=HqfncD-vJS6XzPJ+aTcBjSjtkxLH_h1=pNjCcg@mail.gmail.com>
 <075a4511a6ae4b047599757d41b559c6b7cf9d0f.camel@pengutronix.de>
 <CAMRc=Md4DUSuwv07EuBVDJbY1Uzezq+TONxyCvLtOHD=iFXrcQ@mail.gmail.com>
 <050d74d7619bdfdf5ca81d8914a2a8836a0d4e2e.camel@pengutronix.de>
 <CAMRc=MfPqRLFHPW988oMry7vVoTgtQHrxxND4=nr_40dOa5owg@mail.gmail.com>
 <aPeexuA1nu-7Asws@smile.fi.intel.com> <aPegyVyONkPWRgi9@smile.fi.intel.com>
 <CAMRc=McPpFEmg7dpfiYWJaPR4yMynOaU5Hp37E7rTzWSCNxBuA@mail.gmail.com>
 <aPerDcMFdbWecGEv@smile.fi.intel.com> <804b4b8cf23444fe5dc9400ac1de3a738a77e09e.camel@pengutronix.de>
In-Reply-To: <804b4b8cf23444fe5dc9400ac1de3a738a77e09e.camel@pengutronix.de>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 22 Oct 2025 14:17:53 +0200
X-Gm-Features: AS18NWCQ7ANfnKQl00uAA5vEojJxMGPQi1isAnxjQuec18eN_PhBUMwxJKrcpO8
Message-ID: <CAMRc=Md-KuNp1o6GLA0WTbknbN-qtt8YJqy5fJs0P0EyE7KY3Q@mail.gmail.com>
Subject: Re: [PATCH 7/9] reset: make the provider of reset-gpios the parent of
 the reset device
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 10:39=E2=80=AFAM Philipp Zabel <p.zabel@pengutronix=
.de> wrote:
>
> On Di, 2025-10-21 at 18:47 +0300, Andy Shevchenko wrote:
> > On Tue, Oct 21, 2025 at 05:23:33PM +0200, Bartosz Golaszewski wrote:
> > > On Tue, Oct 21, 2025 at 5:03=E2=80=AFPM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Tue, Oct 21, 2025 at 05:55:02PM +0300, Andy Shevchenko wrote:
> > > > > On Tue, Oct 21, 2025 at 11:39:41AM +0200, Bartosz Golaszewski wro=
te:
> > > > > > On Tue, Oct 21, 2025 at 11:31=E2=80=AFAM Philipp Zabel <p.zabel=
@pengutronix.de> wrote:
> > > > > > > On Di, 2025-10-21 at 11:27 +0200, Bartosz Golaszewski wrote:
> >
> > [...]
> >
> > > > > > > No need to convert all existing drivers right away, but I'd l=
ike to see
> > > > > > > a user that benefits from the conversion.
> > > > > > >
> > > > > >
> > > > > > The first obvious user will be the reset-gpio driver which will=
 see
> > > > > > its core code simplified as we won't need to cast between OF an=
d
> > > > > > fwnodes.
> > > > >
> > > > > +1 to Bart's work. reset-gpio in current form is useless in all m=
y cases
> > > > > (it's OF-centric in 2025! We should not do that in a new code).
> > > > >
> > > > > More over, conversion to reset-gpio from open coded GPIO APIs is =
a clear
> > > > > regression and I want to NAK all those changes (if any already do=
ne) for
> > > > > the discrete components that may be used outside of certainly OF-=
only niche of
> > > > > the platforms.
> > > >
> > > > To be clear, the conversion that's done while reset-gpio is kept OF=
-centric.
> > > > I'm in favour of using it, but we need to make it agnostic.
> > >
> > > As of now, the whole reset framework is completely OF-centric, I don'=
t
> > > know what good blocking any such conversions would bring? I intend to
> > > convert the reset core but not individual drivers.
> >
> > Blocking making new regressions?
> >
> > Otherwise as long as reset framework and reset-gpio are agnostic, I'm p=
retty
> > much fine with the idea and conversion.
>
> I think we might be talking about different "conversions" and different
> "blocking" here?
>
> 1) Conversion of the reset core from of_node to fwnode.
> 2) Conversion of reset controller drivers from of_node to fwnode.
> 3) Conversion of consumer drivers from gpiod to reset_control API.
>
> My understanding is:
>
> Bartosz would like to convert the reset core to fwnode (1) but not
> convert all the individual reset controller drivers (2). He doesn't
> like blocking (1) - this statement was partially in reaction to me
> bringing up a previous attempt that didn't go through.
>
> Andy would like to block consumer driver conversions from gpiod to
> reset_control API (3) while the reset-gpio driver only works on OF
> platforms.
>
> Please correct me if and where I misunderstood.
>

I think Andy is afraid that people will convert drivers that are used
in the fwnode world to reset-gpio which only works with OF. I don't
think that anyone's trying to do it though.

> I think fwnode conversion of the reset controller framework core is a
> good idea, I'd just like to see a use case accompanying the conversion.
> It seems like enabling the reset-gpio driver to be used on non-OF
> platforms could be that. Andy, do you have an actual case in mind?
>

I'd say converting the reset core to fwnode has merits on its own. We
should typically use the highest available abstraction layer (which is
fwnode in this case) unless we absolutely have no choice (for
instance: using some very OF-specific APIs).

That being said: the reset-gpio driver will be able to work with any
firmware node once we do the conversion which is a good first
use-case.

Bartosz

