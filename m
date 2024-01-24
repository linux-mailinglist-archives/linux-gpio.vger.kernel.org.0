Return-Path: <linux-gpio+bounces-2503-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF7B83A94A
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jan 2024 13:13:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3FFE11C20AE3
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jan 2024 12:13:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1670E1AAA5;
	Wed, 24 Jan 2024 12:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="RaiV2Ipf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10AF64CD1
	for <linux-gpio@vger.kernel.org>; Wed, 24 Jan 2024 12:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706098318; cv=none; b=ji8cFmGlPAnsE8QolJ/xuLZfDHMfmX9osxaVArigpwphFaDY7WPFmNRVkehEufJdOCRW3bortSCyH+x4vo6zwmXaVX7mnfZK3EJkBDvvJgdZY19pXug93FElaDAKmEb0IRX3cbIxiVzmn8IdWOtDp/xRMelAE3uVTSdWvgrpO0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706098318; c=relaxed/simple;
	bh=ELnAR29LwJ+ZnQtG9awo+PbjbkfRwhLmcM7MTiWmssY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YVbO8ymQ+H1jdhamWpPBbb7F0M7c8OdZcuynIxBc6YZj9nLjfMr4RvCus/eTXe+7KolctsdbVNxAeMTNv3gbWnfxLd5FpejAsGR0fokXaXiFN2DPMZL429klgkaiKXy/DfNQImeferE/UpZv1NicCgDKO0gZ4LQHtXlEl1xHcDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=RaiV2Ipf; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-4bb6ee9fdb0so980830e0c.0
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jan 2024 04:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1706098315; x=1706703115; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=msKAmnP9gAIAa8UZM+EB9VsydD9hMDTsVmVGM14V3Nc=;
        b=RaiV2IpfTOMqB6rZgcfxkA1q1czeYuWQ8jPTihmS6rfwI4n7vJ0jwlvpW7/dLE9Ei7
         sS96aPy8UqBHZ3WkrYKDYRmzTK1pY4N+OTTBZ3OUXRWAq55QsXDyqQEVrAweTtVrE9Vj
         b+1NqIZEb0xX9ffp0tUPD0YiMt/M/eXOklF2PKQqS7PT6KTwPBkHAHOXRn6yrN6D9zBU
         Q8uSMM98x3OKiIwnSfiOlHg+soM+DzGJf8ktKA/DKOj3yG4a1SnhCtG/d1t00G+HuPjz
         sGf1t/7zUIV1L9zuzQO9seRdFfjmT1e75uxfsK8pi5nm+xLc1LAh1DiA593hd6BnRhIS
         TnPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706098315; x=1706703115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=msKAmnP9gAIAa8UZM+EB9VsydD9hMDTsVmVGM14V3Nc=;
        b=wZcLfhpBHt/VSGP6+XUGA2ngEV4FHRk9HrR1VHB3hhU9LjXBBxTAU8S+FSihWSSXNk
         wa3HYg/vRFJRXsEYLWJi+bJwfq2ynWjQZDiOBK4Do5aJw4W0yc2Jncpb5tsvifelc3Qw
         6OIX9lbEd6vAOVBlBwSRIfl7AvJ/NMp29RpdrLrybAdJJdPshHonqD8+b5fpkOzt30z+
         B+sD8jCIF7CsRuFvZugHqe5Kc1QyFKubaA0s86iIVTLBePYkIzHELttIMexJqQbAroIY
         P2GbdPczJHHvv79ZP5Vrho3bj7/Q9lAJNVwUS5fF5qhSgtHq+HKS8ozKiyfoWeARY3ua
         vfnQ==
X-Gm-Message-State: AOJu0Yy7isAma+XPE/60KP//u9xd6HcepSNi+gRePnINv5LdlH4g/XEX
	GuX0zrsefnewbuMKuGYfchHTBGx7EOrnBllcX6Rl/CVmjQTMKHwqduYFvkotOGXHnT92x7QVvfB
	I2mKeDiFD47dIB5h9hzXTTsP6HY9Gc6IY6Cz2O5/1eixT9/y9o2c=
X-Google-Smtp-Source: AGHT+IEZurDomGUN9TzBBEQy0f6msC7eVkoarZ0Gxubdj25kuDM4GjIo1OslyelWMolc1+kr0fbutApf4nCkkJgvWBI=
X-Received: by 2002:a1f:c602:0:b0:4b7:8196:c72b with SMTP id
 w2-20020a1fc602000000b004b78196c72bmr3690587vkf.21.1706098315665; Wed, 24 Jan
 2024 04:11:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240124103929.66545-1-brgl@bgdev.pl> <20240124105424.GA66219@rigel>
 <CAMRc=MfGJ2UxOdchd=qmM340x2d-QT0egpG4HkR1fCiz8sfyoA@mail.gmail.com> <20240124112907.GA67212@rigel>
In-Reply-To: <20240124112907.GA67212@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 24 Jan 2024 13:11:44 +0100
Message-ID: <CAMRc=Md4boOKhOrvrTy1bBDicdTzMH9OGLi4XugfrM6BK3ucAw@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] core: ignore positive values returned by the
 GPIO_V2_GET_LINE ioctl()
To: Kent Gibson <warthog618@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Phil Howard <phil@gadgetoid.com>, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	=?UTF-8?Q?Jos=C3=A9_Guilherme_de_Castro_Rodrigues?= <joseguilhermebh@hotmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 24, 2024 at 12:29=E2=80=AFPM Kent Gibson <warthog618@gmail.com>=
 wrote:
>
> On Wed, Jan 24, 2024 at 11:58:16AM +0100, Bartosz Golaszewski wrote:
> > On Wed, Jan 24, 2024 at 11:54=E2=80=AFAM Kent Gibson <warthog618@gmail.=
com> wrote:
> > >
> > > On Wed, Jan 24, 2024 at 11:39:29AM +0100, Bartosz Golaszewski wrote:
> > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > >
> > > > If the kernel GPIO driver (erroneously) returns a positive value fr=
om one
> > > > of its callbacks, it may end up being propagated to user space as
> > > > a positive value returned by the call to ioctl(). Let's treat all
> > > > non-zero values as errors as GPIO uAPI ioctl()s are not expected to=
 ever
> > > > return positive values. This should be addressed in the kernel but =
will
> > > > remain a problem on older or unpatched versions so we need to sanit=
ize it
> > > > in user-space too.
> > > >
> > > > Reported-by: Jos=C3=A9 Guilherme de Castro Rodrigues <joseguilherme=
bh@hotmail.com>
> > > > Fixes: b7ba732e6a93 ("treewide: libgpiod v2 implementation")
> > > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > > ---
> > > >  lib/chip.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/lib/chip.c b/lib/chip.c
> > > > index 7c05e53..7bf40c6 100644
> > > > --- a/lib/chip.c
> > > > +++ b/lib/chip.c
> > > > @@ -239,7 +239,7 @@ gpiod_chip_request_lines(struct gpiod_chip *chi=
p,
> > > >               return NULL;
> > > >
> > > >       ret =3D ioctl(chip->fd, GPIO_V2_GET_LINE_IOCTL, &uapi_req);
> > > > -     if (ret < 0)
> > > > +     if (ret)
> > > >               return NULL;
> > > >
> > >
> > > What is errno going to be here?
> > > Is errno set if the ioctl returns positive?
> > >
> >
> > No it isn't, thanks for catching it.
> >
> > This patch is incomplete - we need a wrapper around ioctl() for all
> > uAPI calls that will check for positive numbers and set errno to
> > ERANGE (is that the right one? any other ideas?) then return -1.
> >
>
> The two things I'm looking for in an error code would be that we don't
> use it already, and it isn't too confusing.
>
> ERANGE is typically for numeric overlow, so a bit confusing.
>
> EBADE?

Yeah, I think this one will do. I was thinking about EREMOTEIO but
"Invalid exchange" sounds the most fitting.

Bart

>
> Though EHWPOISON does seem fitting given the root cause ;-).
>
> Cheers,
> Kent.
>
>

