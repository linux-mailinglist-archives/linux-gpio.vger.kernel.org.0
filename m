Return-Path: <linux-gpio+bounces-20412-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DEFABEFC8
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 11:30:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 372B43AC5FA
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 09:29:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CC352405ED;
	Wed, 21 May 2025 09:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="2vQc7A5e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6A124167C
	for <linux-gpio@vger.kernel.org>; Wed, 21 May 2025 09:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747819796; cv=none; b=TZIuoeOkZxyiv9ms94rzkSH6nKG7aLMtsrG4x3AmBZdzmL5qZ6mFpiQ5FK3Wfhgf0oTdyuu5ztjOFlxHEWleqqta8+4qZA8ZYKy7hZJWE92QIybSbRHHIdSEV+bz4k0bnptfw0uLECgWfNt1M2uMs0mesp8toCQCVV1hEehUQtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747819796; c=relaxed/simple;
	bh=jbOLg8N41WrxfzKSIIuNynSIkqGV8gIJeyQrAz9Rqe0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YraKaV8fmQG1AFB2VIoF24U6WncCxXjbx9PRPHGa9u60aGIKqTNJJojSE5IPFoUtB8EHLyrXntuQIsIk7ZPNaajejc/o2gs1ezS/ezPQ7Wgeh1QA6FrBuux0g5HIz1w0xrRZN467QMEWa/cRkzg5N5e+jKvOVSDElF/zLZsrzuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=2vQc7A5e; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54e7967cf67so7589421e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 21 May 2025 02:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747819793; x=1748424593; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4XK2K1G2xZ/aPKWX8n3JpZlMaNnN9CYtsawszIfppn8=;
        b=2vQc7A5eBXCAUuH0SKNdULrS1bNtOLbF6rUXFkaBCavwtR7wDmehTnRTAiLnApH9mz
         LA/8C4yP8D5RPXFqdA+9nkm82ugLVomsPoa4e1iD7aT+319QX8teAPSW3rx7z7Bwma+N
         dMRpJoRbFzyVtk3hM4AMygBP21hpFrAHQS0uIOQYMhdmYhtTTpOiq80h6KtaHnKiDenP
         eF8K5ixOMW//EjGCdVZvyBQDG/0MAFbO/IhN2joz1jVxLpbcdbDQBdP5LjKPsahsHtrK
         hPQ6y6lcKfF2f+9OT8Wh5nlfjbQ6s1HD3Nv5Vk4g0tyAWgPkYUrGX/AJgP5U5oLFK2l9
         Snxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747819793; x=1748424593;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4XK2K1G2xZ/aPKWX8n3JpZlMaNnN9CYtsawszIfppn8=;
        b=ZV5TpJmIepp0Ok+LT/bzIZmO+wYkwo/UgQ1RcVoC3VKaoYzq5nXpfMlaMNAtO6V9x7
         U8s/25exMTXB4297i4OSJi8LwvuWuE4Mr/nHdZRc6HdusXkzgEeS7Ivp3mfnPj8bVTsf
         tKRbtikzhQWRz8AcRN2Znrwm/oWDmFVXNbKsQq2RWJ5dCz5/Rt5cntiFl2KY1Tb6HMQk
         czfb4Jn8MjM753wIdaluCSxGRXZgVmmH5j0cCATwGIEniZOtuC+h6QGE+ijtkcWcK60a
         qMzQ+Thc9P2Iag0vR7xZSD/KAbpvHJDmZqQpZs2y5noDe40OwjdKUGfvEaurKvM+Tbj2
         B1Vg==
X-Gm-Message-State: AOJu0Yz78HpLihXFCJaAzVgqJxUWeWsfBI0aU1jJCEbUG7Az//IVH1Qy
	iv2F8VBTDdCDvC7kbRDwoPStQCQRo8UvK39WAo6z31n2KcK8KpYXmU2C7kCBGsniBElS95RwKXX
	/QvSN0iO5AivtH84uJn5t+HgCWDVylYKTuw0hcmiXjA==
X-Gm-Gg: ASbGncuNrGKnBIQrPgwkYMDdo9XGhl+dhrOwV364OALqIPydMooXTpXioFsf2ONoPyE
	Ju1pXBAMwbkYoLst4GLNb5bVRbQsymB81XAo3wWHkcZpvNOIjlI6jnAXrGmhVqsYvsVL4wHp/lE
	5g5wvV79hQIb0J2M/yOzW7DGS8jzV4yOGcqyyvSU+F6NGzaZHsIW/FxrBDr2a6nzsm
X-Google-Smtp-Source: AGHT+IGJqZTVZxjuxTTecemZA09fRlXeVzxa0oorvqX/zFrnIbMmtcIhx8SE3fTmIsfUT1miwD8VAyJrNYAx4RtejCY=
X-Received: by 2002:a05:651c:421b:b0:30b:bfca:bbf2 with SMTP id
 38308e7fff4ca-328076e8a38mr53467831fa.7.1747819792826; Wed, 21 May 2025
 02:29:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aCzbya_FW7hg1Wkr@black.fi.intel.com> <CAMRc=McMOH_S8Kf1TPV3Z0QYPz+cfS9hxZh++fNvMc_U+TssLQ@mail.gmail.com>
 <aC2W84mKGzgbRsL9@smile.fi.intel.com> <aC2Y-4wSILoS-Rol@smile.fi.intel.com>
 <CAMRc=McwUF-668OYqctaahRQFPOTpXqnCZKE3R5zKsoWWEyU+w@mail.gmail.com> <aC2b2L5h4-0U5qjT@smile.fi.intel.com>
In-Reply-To: <aC2b2L5h4-0U5qjT@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 21 May 2025 11:29:41 +0200
X-Gm-Features: AX0GCFvr_RdTY4_q-dIuNMpyXt5GssLA8PTAxOak8QA3F4Y0Nxu7aRJMBd23JF0
Message-ID: <CAMRc=MfE=m+_jYKwAU0jcyopUZYFnY6kOdZJmAY29dJEHO+gPQ@mail.gmail.com>
Subject: Re: [GIT PULL] intel-gpio for 6.16-1
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linux GPIO <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 11:24=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, May 21, 2025 at 11:18:11AM +0200, Bartosz Golaszewski wrote:
> > On Wed, May 21, 2025 at 11:12=E2=80=AFAM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Wed, May 21, 2025 at 12:03:47PM +0300, Andy Shevchenko wrote:
> > > > On Wed, May 21, 2025 at 10:44:16AM +0200, Bartosz Golaszewski wrote=
:
> > > > > On Tue, May 20, 2025 at 9:45=E2=80=AFPM Andy Shevchenko
> > > > > <andriy.shevchenko@linux.intel.com> wrote:
>
> ...
>
> > > > > > Bartosz Golaszewski (2):
> > > > > >       gpio: graniterapids: use new line value setter callbacks
> > > > > >       gpio: ich: use new line value setter callbacks
> > > > >
> > > > > These have been in my gpio/for-next branch for a long time and th=
e
> > > > > ones in your PR have different commit hashes. Please remove them.=
 I
> > > > > don't see any notification about you having picked those up neith=
er in
> > > > > my inbox.
> > > >
> > > > Really? I though I commented a few weeks ago that I prefer to take =
them
> > > > when Stephen complained on dups. After that there were no dups noti=
ced.
> > > > Since you haven't answered to that email, I (rightfully) assumed yo=
u are
> > > > okay with the proposed course of actions.
> > >
> > > FWIW, check your mailbox:
> > > https://lore.kernel.org/linux-gpio/Z_OUr5xvoXh-sFne@smile.fi.intel.co=
m/
> > > https://lore.kernel.org/linux-gpio/Z_OS4nx2E12yjL7_@smile.fi.intel.co=
m/
> > > https://lore.kernel.org/linux-gpio/Z__xUsSeYNQAvnNp@smile.fi.intel.co=
m/
> > > https://lore.kernel.org/linux-next/aAEkrx0P5LFj1r6a@smile.fi.intel.co=
m/
> > >
> > > Note the last one, you didn't respond. So?
> >
> > I really don't have them. Neither of the three. Probably gmail spam
> > filter borked? Anyway, would you mind removing them from your PR?
>
> Okay for this. But let's talk *again* about maintainership of
> the Intel GPIO drivers.  Last time we discussed that you have
> agreed that I'm in charge of that. If you think otherwise,
> let me know.
>

Ok, sorry for the misunderstanding but if I were to drop them, then
I'd have to rebase tens of patches that came later, it just makes more
sense for you to do it.

Maybe we need to think about putting intel GPIO drivers under their
own directory in v6.16, that would make it very clear which ones are
your territory?

Bart

