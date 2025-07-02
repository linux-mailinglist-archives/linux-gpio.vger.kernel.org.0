Return-Path: <linux-gpio+bounces-22614-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E0755AF587A
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 15:21:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 222974E063D
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 13:19:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9250C279DB2;
	Wed,  2 Jul 2025 13:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="kI4pN1N+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372AB2797A4
	for <linux-gpio@vger.kernel.org>; Wed,  2 Jul 2025 13:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751462347; cv=none; b=ZfL3aXBI3lKrf0lf2ezKdNPnX4hlyxW/dsaRu9SCT9Vnf3hIpo05skM96ujunE2fWsY4vvgfJjWnV+BuYB43D9VVG+hhliGqCn/sIFAyEGKanRQR1/KXMO+uMhiAEkAer/f2FAYxcXSTUd5nnxrT9ISky/LEE1Nt2VHDbH30Gxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751462347; c=relaxed/simple;
	bh=L8owLmtFzaaJZIxGw+Pv1FUP1IEjAz3P9wKS03iNN3k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U9C9A3Tl0per41n3b8VgEPFmFkMTqZo3V0DeknTypQPSECi2A8yZnDDV39Ng9zef4DLioyZEiQuh+PraNaYTZpNGyq4U+4cSI8C5SIURTafJYXSyNA19ee5le8I/qEfzxRLq7iyh+afPAugIP2UNs8Gdmcq5lqhnQWTeJEd3W7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=kI4pN1N+; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-553cf020383so7578178e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 02 Jul 2025 06:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751462343; x=1752067143; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bvqohbDI2GAmHMqzaTXORDEqROTHuWUKuOqQymQYwFg=;
        b=kI4pN1N+nNaJjH+4xfqOUYgmxt901xFhCC1tS/wCT+VUdFHod18HMxIRZCZ8Xx/T2o
         0Sahn3ZT6OObMcRnjh9qlfsH1eCOqSgozCyyLTN3MKZkGBPjmmaRJkC/Big49ySrGtJA
         65XeYUeuw2TGU6c4c4Gngg71Vi4u2T/EOs3dn8B4bTcC8CK4+cjIuS4wSr1eJYCt9RxF
         nbFzVQTVAT+tgKgvsm5z387DfOZbSzQ+AsLiFkKLLRA1VWyKC6IHZoftvwNV31OazpMR
         Ut18Uhzc5ZbcV9VUSSmZuyASZwEyhDmW0RONvkDyePRy9YndYknkPgOzLJoAmRNX1LjX
         I1tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751462343; x=1752067143;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bvqohbDI2GAmHMqzaTXORDEqROTHuWUKuOqQymQYwFg=;
        b=RApwnU2jwFHMaoyQC05rI/vTd2j0uYWk++DD9NTar7YEwjoWbh971CPTUrgtRBt6nd
         McuEs0DjGlyGmQuWNZle4mXKyScMG/ET4VTRtGnypoT1rIYfogWotdZVmoc6qlSHLozt
         08aDKTBLGfem5rMd3tfYm+uNDWcyLpi2fhIWqAlfogqdJHhd8VtbRobS3hJu/g8Ea34B
         z8p1dTOW2p5CnQEtEHq34KGP12cPl9rGmKpnXIwNjXVPKK6fDDjmRXH7XUHuCFfIb21a
         EEy+ulnUre6VuvQ1kgfyX1SQxpGyi+vqERI4jMhIogjtnOrmeK/tgP8jcjNGaPJmkQVN
         OWCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVO4VNQDqThtRLi7hwCYUjeT53xk77p67byzilB7yvpZbPdQ250mp4zegN3X1WQv4AxTaHg5Qt7HOol@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6hnC2NRseLp9UrFOiYLK9efRmOSh8pv9ckhuRaTxFVlQn/s80
	u7bHKO9VZ+zuix7hZlB9LJvWJ/QrGAz1HoxohGee2erUOozlrtoH27/h6JTbInvEo7zagciQaKe
	S6I9scV0XKY/YuxM1a5a7EbxSST8jNFjfHNJP+aX3jA==
X-Gm-Gg: ASbGncs7q7G/nrj5BBtolVd4MweBSAUSmJxtxVsS8M5RRdAKy4vYGbm/F2NP/LEPFF9
	LXSkm5/4J2+sH+IuYLiEPBoBY8X774emDaBmFeNl17/WPTUFf/NlzkkAiBfP23A3yGK+aOk17e0
	JtKnS8yrJ4Qc+BvBz7tZn3eU+ZfSaaELFvmAobmNUEzJtuj5odxakMO3TriqF6Q16txqFWTs1D
X-Google-Smtp-Source: AGHT+IGo+t57UliEc2HwQ13eyq0sY0QeAbqdOoDWjWbCox3B3fh2R/GjloOBxDDYSfcQ+CEbIeiSIdHamp/sunKThtQ=
X-Received: by 2002:a05:6512:15a1:b0:553:addb:ef51 with SMTP id
 2adb3069b0e04-5562824ee0amr1135537e87.18.1751462342357; Wed, 02 Jul 2025
 06:19:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630-gpio-sysfs-chip-export-v3-0-b997be9b7137@linaro.org>
 <aGPrFnDxG4W7S9Ym@smile.fi.intel.com> <20250702035439.GA20273@rigel>
 <CAMRc=MftawBB4rtj4EKS_OwMCU9h53sA8QxcFq_ZY0MRg2OLag@mail.gmail.com> <aGUeRczCNJLg-KON@smile.fi.intel.com>
In-Reply-To: <aGUeRczCNJLg-KON@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 2 Jul 2025 15:18:50 +0200
X-Gm-Features: Ac12FXyIstglX0Pn7fB6SNZb0RFuwEcN1DnpF2Rd1MaiGH2nMKkaE1WvFTqfGBk
Message-ID: <CAMRc=MexjmozQ+vkLz1L4_Vfb+aqqwNSxKtNVA7zb-=r5eCMQw@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] gpio: sysfs: add a per-chip export/unexport
 attribute pair
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Kent Gibson <warthog618@gmail.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>, 
	=?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, Marek Vasut <marex@denx.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 1:55=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Wed, Jul 02, 2025 at 11:45:02AM +0200, Bartosz Golaszewski wrote:
> > On Wed, Jul 2, 2025 at 5:54=E2=80=AFAM Kent Gibson <warthog618@gmail.co=
m> wrote:
> > > On Tue, Jul 01, 2025 at 05:05:10PM +0300, Andy Shevchenko wrote:
> > > > It seems I never expressed my overall opinion about this. I think t=
he poking
> > > > sysfs and making it working with a new schema won't solve the issue=
s that
> > > > character device was developed to target. If so, doing this just br=
ings yet
> > > > another broken interface. I would be happy to be mistaken!
> > > >
> > > > If I am mistaken, I would like to see a summary here that explains =
that clearly
> > > > that the new sysfs approach does not inherit design flaws of the or=
iginal
> > > > implementation.
> >
> > You cut out the link to the discussion that preceded this series where
> > a good summary is in the very first email. Anyway: the gist is: people
> > need to do some basic GPIO fiddling early on from initramfs that may
> > not have any tools other than basic shell utils from busybox. This
> > series is not about improving or extending the sysfs interface - it's
> > about removing its reliance on global GPIO numbers. And that's about
> > it. We don't add any new features really, just move the GPIO line
> > groups into their respective chip directories and make exporting use
> > the hardware offsets, not global numbers.
>
> I see it differently. This adds the second variant of how sysfs can be ha=
ndled
> and it needs to be rotten in the same way as the original sysfs. I really=
 don't
> see a point to prolonging the life of the broken interface in such a way.=
 If somebody
> wants to check the GPIO without accessing character device interface, the=
y probably
> are simply lazy to think of how to do that on early stages properly. The =
desire
> sounds like a workaround against proper thinking.
>

Whatever your opinion on this is - if user-space wants to keep the
interface, then we need to support it. We can only propose
alternatives and hope the users will switch. Please read the
discussion, it explains why people want to keep using the simple sysfs
ABI and why those specific users will most likely never switch to the
character device. At this point a bigger concern to me is the global
GPIO numberspace, not the existence of the sysfs class as such.

We have three alternatives:

1. Do nothing. Keep the sysfs as is and hope we'll drop it eventually
but this will most likely never happen.
2. Add an entirely new "simple" interface next to the existing sysfs
AND character device. It seems to be what you're proposing but this is
the worst of two worlds. I don't want to be in charge of maintaining
three separate interfaces. Four if you count cdev v1.
3. Modify the existing sysfs in a backward compatible way but make it
possible to export lines by their HW offset within their parent chip,
not by global numbers. This is what this series does and what people
having interest in using sysfs confirmed would work for them.
Eventually we could drop the bits that use the global numberspace
which seems more palatable for user-space than entirely removing the
sysfs GPIO class.

> > > Indeed.  I've already expressed my reservations about supporting the =
whole
> > > of the existing sysfs capabilties, but I've otherwise tried to remain=
 out
> > > of the discussion.
> > >
> > > To reiterate my position:
> > > While I am all for maintaining sysfs in some form to cater for those
> > > rare cases where cdev is too heavyweight, IMHO it is a mistake to
> > > support the existing sysfs capabilities in toto.  Take the opportunit=
y to
> > > remove the parts of the sysfs interface that don't work well.
> >
> > Doesn't the last patch do it? We cannot remove it without giving
> > user-space some time to switch.
>
> Famous Last Words. How many years the sysfs is being rotten?! This just m=
akes
> it a Frankenstein.
>

I'm doing it BECAUSE sysfs hasn't gone anywhere despite several years
of efforts. I cannot force user-space to stop using it, I can only
propose alternatives and it seems that cdev has not been enough.

Bart

