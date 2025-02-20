Return-Path: <linux-gpio+bounces-16303-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C3756A3DB38
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 14:22:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A557F1794F2
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 13:22:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A4731F8691;
	Thu, 20 Feb 2025 13:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="h5N36oqk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329281F7910
	for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2025 13:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740057763; cv=none; b=ibond323GyQqa5l9ggOY3sWfEDlDclwVpsSN5/95Di8ATrxsUWHj6pxN6JCp2A/qavw7+Xgd2rJk2H4X8OCNYU1ASaTrPrhcJDq16s0/K1bVP06CvuZlGB/lBJ05OKLCS6k8j1Jet16RsXXHVW+jgv48t2ENgu2tX0E9RcIgoPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740057763; c=relaxed/simple;
	bh=JzQiNVvV4zMev0T902/x3OTikJwmI6nULChGTq+hLSM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I32AACnhtUaiGvZUDa/Txox/WFv5ZsPw0g0I1h7Llws5IUTKHyJh392sfgCQJZr/PSia4EogULZDWnHxgjUS5RwsRYtt5s5LMRs7K8r8JXKFr4Lsua6sr5QourjY9OMWrU/O7WVtJ0FZMh/UkqkXjexV1XFGWUeZgpbjafzr+c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=h5N36oqk; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5461a485aa2so876274e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2025 05:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740057760; x=1740662560; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=81NHAekLbrbLB+xKun/x9cs+4C5eRavXG+rDgduC8Kk=;
        b=h5N36oqksKb+70VZtsDepr3D8Bd3lECJg10X6qA63xamR8HWVbhmRNzQGek9JDUlvE
         H6SH9OewCuLIlVTCaObjnkTTRxxaRd2GHDkSPgiIbgyG0rLKO5QiIsRDvYVxz2Ktoquh
         mTZ8f5VrBCe7VzMQDVasr0aqg9MxIv4k6b+4QxwPeCqx8Ausn2GEdrnbLLFLg+1xL0zw
         WXQF1nbBsBh4bFyi6un70s6geXuvCysClgNXUtpee8gzkHV7lJW9h+hMSfxz5kvsx5Ol
         JQHKuXur1DNCLfHL5Go4UA4Kz0/UbxtJHU5LBOaa1iQ8sUgtj9gSGR6s4IVcoDWGAZuu
         YlRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740057760; x=1740662560;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=81NHAekLbrbLB+xKun/x9cs+4C5eRavXG+rDgduC8Kk=;
        b=w4WHCQ7mPDti0Pr3nFYSMWKjAuEfaWDbaM6ARilWh9B9DseP+EmMRkhWx5gY6iHs5u
         OBOd5kM0aQgwDexZpDzEyRbRswmyrPOwYFGO66qkP/RlzpKN/eJ/tbTysqAa3YFBNYnd
         jIqy/b0pCvLsys2kxi51Z1FBgKe2D9yZxrZgC3HfrTHHpNs8Ir+/i/Ct1x7W8aiPdU2z
         G3evkscQEGWnlAtN/mJCs2sErXJs6QUJMulEc/j5ZaX/0XRn80zl5dYYKpEpYo50KdlE
         prAh0ECgitLN2glTYNSNG9Ky9hiP0qaARrqyiMd/oPoK6OaQEV7PHcKfa5oAD0+6Iqg9
         zMNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsg7S7yQfDtVtE6m2+E/OuTDn74J965ZadBab48O6RG4d8U+747f8qMJLKLhj/uBqP0bfp6/SHcsYw@vger.kernel.org
X-Gm-Message-State: AOJu0YzIpQUr0sHWR2B9RpL9I9/HWGEkZTQHFrtgBsE2kP6IhtjECZFC
	j4fBgJkx/fpR8XVe2twPI9xGNrjWEidSpJUZ6mbGmULEPw7mW74BZMqUX6omOhiLK8r7nI/gIlb
	rcerNTGxPboxJUlmh8sTLs520xCz7F/+lJu+QcjzYDOI5FaU7NA0=
X-Gm-Gg: ASbGncuajQL9ZSoKV6ySuXcDezXOD6l/NtgXFHp7b3Uh0Xadscxm6t5I3bjsANYKGoi
	+OJPGdQAMgOj2c9zy0wMj0cL7HFpzAfSj97oevXbnIOGvtIj6SclmppXaiOiHDCkR16n9CGVchT
	ob/5WiwnGpvnvymsKUf8sS3VPPqAk=
X-Google-Smtp-Source: AGHT+IHKNRo+xD6raRrQyVm06fJdUaq7DfnTTvIjAICA+x4pmb58EVNK92fTJ5xj8CY6e6DOHrDuRmgSFAEVTcy0alw=
X-Received: by 2002:a05:6512:e93:b0:545:5de:f46d with SMTP id
 2adb3069b0e04-5462ef1c46bmr3439159e87.39.1740057760074; Thu, 20 Feb 2025
 05:22:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250213195621.3133406-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdao27pu+9qFH2LBYNwYkBbWq1B-hE9nZGfTTCnQxhTiAQ@mail.gmail.com> <Z7crrgl2iFn34gck@smile.fi.intel.com>
In-Reply-To: <Z7crrgl2iFn34gck@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 20 Feb 2025 14:22:29 +0100
X-Gm-Features: AWEUYZmSG9-uENecbLAqUVmmI5xz_5_7MNUpKQdGtyxzhzePhefDmuzle6BOdhQ
Message-ID: <CAMRc=MfSn6xB4eNkFG7E2gQPiF+AmnaidO5=FbvPtvW0N4iDjQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/5] gpio: regmap: Make use of 'ngpios' property
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Michael Walle <mwalle@kernel.org>, 
	athieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2025 at 2:18=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Feb 14, 2025 at 11:50:53AM +0100, Linus Walleij wrote:
> > On Thu, Feb 13, 2025 at 8:56=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> >
> > > It appears that regmap GPIO doesn't take into account 'ngpios' proper=
ty
> > > and requires hard coded values or duplication of the parsing the same
> > > outside of GPIO library. This miniseries addresses that.
> > >
> > > For the record, I have checked all bgpio_init() users and haven't see=
n
> > > the suspicious code that this series might break, e.g., an equivalent=
 of
> > > something like this:
> > >
> > > static int foo_probe(struct device *dev)
> > > {
> > >         struct gpio_chip *gc =3D devm_kzalloc(...);
> > >         struct fwnode_handle *fwnode =3D ...; // NOT dev_fwnode(dev)!
> > >
> > >         ...
> > >         gc->parent =3D dev;
> > >         gc->fwnode =3D fwnode;
> > >
> > >         ret =3D bgpio_init(gc, dev, ...);
> > >         ...
> > > }
> > >
> > > Reported-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com=
>
> >
> > Thanks for fixing this Andy!
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Thank you for the review!
>
> Bart, do you think it can be applied?
>

Andy,

I really rarely lose track of patches. It's been just under a week
since this was posted. Please don't ping me to pick things up unless
I'm not reacting for at least two weeks. I typically leave patches on
the list for some time to give bots some time to react.

Bartosz

