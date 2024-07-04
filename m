Return-Path: <linux-gpio+bounces-8045-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA34B927962
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jul 2024 16:58:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD2E11C21E85
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jul 2024 14:58:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 675601B150C;
	Thu,  4 Jul 2024 14:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Lw5zH5EV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837F21B1204
	for <linux-gpio@vger.kernel.org>; Thu,  4 Jul 2024 14:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720105077; cv=none; b=c97mbExHoSD6qncM/vd8PZJwvarMYe9BIE9kBSx3iMkoLDTMui6yN6Asex/I0Neng6h0iu1LPuRdwuOTm8YbYaPgJEvJI+w77iPESns7Zm9awkYFoQMrnVBXg1jFSAdjYEbUITrJttnlsa/gK8bXL8iR7E07hmDBBtCrxbxCHT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720105077; c=relaxed/simple;
	bh=B3AWkzC0Ypxhrk3UZDoy4WWlbej4chdtPRUFfDF/Mk8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a76DvgAYCeoMirLzMELKqPqrUQJOhaS1i5RN7G7lkJ4MEo2Jo5xre0Awn8HJxXxRLelXAvBa5yt05coD2TQtB08jvTu8A6GdXJxbc/1tyOXHx2c9GI06wsPMtqZX/8AmbY0KagYhJUWNXZCfQk6/G/wMMDeZcj64h3i4YIG6c30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Lw5zH5EV; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52ea2f58448so324634e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jul 2024 07:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1720105074; x=1720709874; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZUxx4zQV/ZSY/orPvl5iuNlE0KW55bdXIW7D3Gz7ang=;
        b=Lw5zH5EV5i9abDri3CrNVCiBi/UTS221PtC+ogylUVcoXmLGBEH0w9GB57BtWaFahb
         pzOxwoDdyoi3O/BEpJWILxcVT+zHsWk2wSj1qjp2+SlwjP4kwedNLJ7439Zsy0+gSFYl
         pwMlh3hCKDCuMLBiMKk+y/SUBevwKuJB23i0iUxpimZdweVFgZ5k0SPQUXo1D6gdEYpg
         MDppu0P7uZPj74A4pR+ZaIR4yfgTcV5vzLKaNOKDigAoebkB6PXUAHPPkiRiB8/EXxlN
         KXoke8ON9kSrqW1tgVb2zChBe7XyOl6gEsmLBaB8jBLF6k6ZkkDxPb33O5yRY4UTKhq6
         vb6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720105074; x=1720709874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZUxx4zQV/ZSY/orPvl5iuNlE0KW55bdXIW7D3Gz7ang=;
        b=RF1n8uIng1BMI90zcbDaWLRX/xfcWKQF7eTlsfHlbY4AsASqZnlAFFywE1LC7uR/3L
         FuDPbboSepsxh5SLOjBtpvyXk2sDVyPvScW4/kh6sHVgK9oX4GILyk1E2qwnkfF80IcK
         91SMtXHLoKuCZM8t+eGuRH8FnSIQkU1wIdUHa4v73MMYtWD6v+b22dBgdphBinME5D/k
         2K/qfcV8AJ+nmqwFkpNC1sSGMLk7e53JQ25hf7b9JwVufeROczlGxKYPVH4SCBA3Tkgw
         DSd9YGois9tbEzOBnpjetM5uUxP6C/BEWZS8hPHzzN8wZZ3OvvXx+sWQrc2KBCpHD7uU
         53mg==
X-Forwarded-Encrypted: i=1; AJvYcCV8G9urPjgiATapcmV1JS9cRmagpz2+OMdhZOFfwx/Shr2Qa3psz4AmVMn/4PtqiTkX0JO/wn2GL5xgIYuqK5u06VzJcwP3F+u8FQ==
X-Gm-Message-State: AOJu0Yx49WuY0408vl3RwDSFKs6d+jb/EwHrmqlrwmG8CIChM3Rrtgkf
	6ykg7miUUrYcevBOGeqPXLcR1X+WxDULco2EqEUo9wYyNemcgXqH5YUL1b400mwRLRv+N/uIm3W
	nNdCqc3v9tJAjE1q9XovOEg7T58j6Bz5dMFsUdQ==
X-Google-Smtp-Source: AGHT+IHSDCZ/x5nLKZj3hSjLcsnihfR2JPfmYALthUQqlyKQWFQXBtoH+O5kv4vOUv9BV6RF74Tuktf9czI0PQyAarE=
X-Received: by 2002:ac2:55ad:0:b0:52c:daa7:a84b with SMTP id
 2adb3069b0e04-52ea043014bmr1357347e87.0.1720105073632; Thu, 04 Jul 2024
 07:57:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240704142451.28400-1-brgl@bgdev.pl> <20240704145051.GA95228@rigel>
In-Reply-To: <20240704145051.GA95228@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 4 Jul 2024 16:57:40 +0200
Message-ID: <CAMRc=MfB==pSWJHM19dNjXxGV5v+pUsG=v82dxi6Bd1f4U3sqw@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] README: list the development packages required
 to build the library
To: Kent Gibson <warthog618@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 4, 2024 at 4:50=E2=80=AFPM Kent Gibson <warthog618@gmail.com> w=
rote:
>
> On Thu, Jul 04, 2024 at 04:24:51PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > The error messages emitted by configure when either libtool, pkg-config
> > or autoconf-archive packages are missing on the host are not very clear
> > and seem to cause confusion among users building the project from
> > sources. List the required packages in the README.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  README | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/README b/README
> > index a6f24d1..a20e801 100644
> > --- a/README
> > +++ b/README
> > @@ -34,6 +34,11 @@ BUILDING
> >  This is a pretty standard autotools project. The core C library does n=
ot have
> >  any external dependencies other than the standard C library with GNU e=
xtensions.
> >
> > +The build system requires autotools, autoconf-archive, libtool and pkg=
-config
> > +to be installed on the host system for the basic build. Development fi=
les for
> > +additional libraries may be required depending on selected options. Th=
e
> > +configure script will typically prompt the user for them clearly when =
missing.
> > +
>
> typically?  Shouldn't that always be the case?
>

I used the word "typically" because I am simply not sure if *all*
potentially missing dependencies will get reported correctly. We
identified the ones listed above as causing confusing error message.
Maybe there are more, just unreported (yet)?

> "prompt" makes it seem interactive.
> I would reword as "The configure script will report any missing additiona=
l
> required dependencies."
>

Sure, can use this instead.

Bart

> Cheers,
> Kent.

