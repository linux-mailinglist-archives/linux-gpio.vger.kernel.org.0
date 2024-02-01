Return-Path: <linux-gpio+bounces-2885-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2DC845FF3
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Feb 2024 19:31:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 86A54B2C917
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Feb 2024 18:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C7893A1DA;
	Thu,  1 Feb 2024 18:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="PSGkM7eJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E48364A8
	for <linux-gpio@vger.kernel.org>; Thu,  1 Feb 2024 18:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706812267; cv=none; b=Dy2kL+yASGeNfQK0fwmMh9os7cqNPeE02DNW3YQ2y6PkGzRgoqUhDaO4+nBmtUwv5mJ4LCwEhmkXXKi0o0Eq3psKDKl8M/e2GcgFspYvVMBsaB7crDU0s5uIUHARkIPasGb9FpDwsVPGxzFvAylig3AFKxqeXp1Vrhn/l3946Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706812267; c=relaxed/simple;
	bh=M9m4ID5uK86Bg2umY+nRmElli+JjBaB+shk9tP4OjoQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LkV0J8A/OV+eQxYIzO0Y/GNRKEU3F+s64hsPBujKNE1SiP8Jc+Lj7viuLLjI/rcTDNQj348Vl1S3sTH4349iJMTfHeh4RBbh3U5fn2CyJqzCGis7VTCQSbm4DB7RJLxl/vFIpeClidl9ktTK/9IQUL0PgG6GfQfsiwtOvyYr7w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=PSGkM7eJ; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-4bfffed970bso382893e0c.3
        for <linux-gpio@vger.kernel.org>; Thu, 01 Feb 2024 10:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1706812263; x=1707417063; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MNA9VCrClQHxt83fjnVHt+/70RHnK0HHLfleLnv2+ig=;
        b=PSGkM7eJj8k5InLy4Se3zIFRLiRo6R7qyglX1u6Iz+FtAme4Bi6eM4JeML/6NK3iAa
         6a+V9Hf9I/kTfg3wL0AxdzXRnslJOk/qgZTCvfMgveGtos1OpYQ54YkZJwSZEtFW6GS2
         kNFJ6EEuSsbggzA3qeifhnpNLh3EomIB5069AoRQcgnh2Nlu4IAWtbBR1g+iyFmwAw/L
         07V/07UaZQB7qoPRtqYMb/Y06PxsvAGlA4GYQkDpRcKvdCm4y2SuDvCVCj8OjRQTHjvf
         /WoH24RoE7hhjhEtE2fQE1C3BRRjzugp9lA+T4MGNNptQizZa7TaO9m2d40HAOFanDBg
         luhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706812263; x=1707417063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MNA9VCrClQHxt83fjnVHt+/70RHnK0HHLfleLnv2+ig=;
        b=xDA/B6PIEWVC9LX2eoMJfIhFthEryEqdZkcR/6C/RC7d0z/HFwDzla0reUZc7i4Tu7
         ZDWp9/OCZZoGNrW5z5QulgGhQcOJMne3mrEUUSEbqWWgtysik2clelAYHlqJzxl9XRax
         GgEcCxUXHY9KQNsBRtsYd4mO2eRfS/IDJNVGRl8hju9Lo1kjju4WDua8m/tqFFcGPduT
         88gLYLvRY9blMplXkVLZcclX0E2piIgnB1YLCZ970gmM+iAEwrt9hyhFsIolqCr1XWdW
         ezXb3nKBq+ftVJOmHZ4aYm8Ka9OVlfg5uSli/qwmb58QzsCIhuLXAQu0XhOtGwAzu3hp
         gxyQ==
X-Gm-Message-State: AOJu0YxhoYS8eeJ3bS46TkpF30CCz06jQRK2Btk3f12NkzA3XhNOYW1b
	aGou035y1eNUfw3UtiLeaOr2v+icea4rHp0y7sX8gUQmKGhrd8pxUqH0fBhwR1KKxuUUGq90xeL
	4IJB+WOt8AjTlAW7Ml16JnoAz+Q7b8Wn61KkClw==
X-Google-Smtp-Source: AGHT+IFX/A0vG133RRHKUdDSPIzAWK0GQiQkzHLWROK0yfgARsUnyhiFezu/cpSF6Ntsbqe6pt2++kf4nwFjEjyrkpA=
X-Received: by 2002:ac5:c84e:0:b0:4bd:7e5e:380 with SMTP id
 g14-20020ac5c84e000000b004bd7e5e0380mr4847380vkm.15.1706812262111; Thu, 01
 Feb 2024 10:31:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240130124828.14678-1-brgl@bgdev.pl> <20240130124828.14678-11-brgl@bgdev.pl>
 <CACRpkdZyaqwbxvsLtXPHSX=6jyFPYSxA9n+qWakdhGKmo+L9fw@mail.gmail.com> <CACRpkdZ9M=SapefrMX24=H5xGG91FNMN5TS63n3GdpegS_JAZQ@mail.gmail.com>
In-Reply-To: <CACRpkdZ9M=SapefrMX24=H5xGG91FNMN5TS63n3GdpegS_JAZQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 1 Feb 2024 19:30:51 +0100
Message-ID: <CAMRc=MeF0QLUEcTLsV4eWonYpok7FCG1oGXLRetTBoja88uPxg@mail.gmail.com>
Subject: Re: [PATCH 10/22] gpio: reinforce desc->flags handling
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Kent Gibson <warthog618@gmail.com>, Alex Elder <elder@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, "Paul E . McKenney" <paulmck@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Wolfram Sang <wsa@the-dreams.de>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 31, 2024 at 9:35=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Wed, Jan 31, 2024 at 9:01=E2=80=AFPM Linus Walleij <linus.walleij@lina=
ro.org> wrote:
> > On Tue, Jan 30, 2024 at 1:48=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev=
.pl> wrote:
> >
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > We now removed the gpio_lock spinlock and modified the places
> > > previously protected by it to handle desc->flags access in a consiste=
nt
> > > way. Let's improve other places that were previously unprotected by
> > > reading the flags field of gpio_desc once and using the stored value =
for
> > > logic consistency. If we need to modify the field, let's also write i=
t
> > > back once with a consistent value resulting from the function's logic=
.
> > >
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > (...)
> >
> > I have a trouble with this one:
> >
> > gpiochip_find_base_unlocked()
> > > +       unsigned long flags;
> > (...)
> > > +       flags =3D READ_ONCE(desc->flags);
> > (...)
> > > +       if (test_bit(FLAG_OPEN_DRAIN, &flags) &&
> > > +           test_bit(FLAG_IS_OUT, &flags))
> > >                 return 0;
> > (...)
> > > +       assign_bit(FLAG_IS_OUT, &flags, !ret);
> > > +       WRITE_ONCE(desc->flags, flags);
> >
> > I unerstand the atomicity of each operation here, but ... if what you w=
ant
> > to protect is modifications from other CPUs, how do we know that anothe=
r
> > CPU isn't coming in and reading and modifying and assigning
> > another flag inbetween these operations while the value is only
> > stored in the CPU-local flags variable?
> >
> > Same with gpiod_direction_output().
> >
> > To me it seems like maybe you need to actually protect the desc->flags
> > with the SRCU struct in these cases? (and not only use it for the
> > label protection then).
> >
> > An alternative is maybe to rewrite the code with test_and_set().
> >
> > But as you say it is currently unprotected, I just wonder if this reall=
y
> > adds any protection.
>
> After re-reading the cover letter I'm fine with this, but I still wonder
> if it buys us anything.
>

This was a tough one...

I don't really see any way around it. SRCU is for pointers but even
then - we wouldn't get with SRCU anything more than what we're getting
with atomic reads and writes. As neither sleeping nor atomic locks
will work in the case of the GPIO subsystem, I figured that we should
strive for the maximum of coherence we can achieve - and for that I
figured that we should read the flags once, do our thing and then
write back a consistent result. If someone else comes around at the
same time and writes something else - well, he better be an
*exclusive*  user of that GPIO and know what they're doing. :)

Anyway, I think this series is already a big step forward and should
at least protect us from crashing. We can continue the work on
achieving full state consistency later.

Bart

> Maybe some words looped back from the
> commit message that we are not really protecting the callbacks
> because access is [predominantly] exclusive?
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Yours,
> Linus Walleij

