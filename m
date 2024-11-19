Return-Path: <linux-gpio+bounces-13113-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D11C99D2A1B
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2024 16:49:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BB498B27546
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2024 15:31:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 904411CEE8B;
	Tue, 19 Nov 2024 15:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="22kfsSY8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666D11CF297
	for <linux-gpio@vger.kernel.org>; Tue, 19 Nov 2024 15:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732030303; cv=none; b=ETMOdODZv96KuJkWrDkzi6Zw7fmmnufwbcR7hkc+J1NA8RvQpKqcW5cDYaPs/g0OQDzXcuDEeFugIjLK9bH0/GhamaSP2RIO5cp5faC5kQw3/WHSQkLtTACx3XXWP19cblg3btrqpcj9p8mVLao0wMCEIMLGo9oLP/NmLtTXAw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732030303; c=relaxed/simple;
	bh=oAgXXESDsFCwwmfyMLaibwsFDc7pc7PDdQIj0en5WEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=abQtr2eHHO2cR7Hy5XnzDWa8VaW8E6iddg3bMhfLZxt2ukM2qXOtK6CjoBDYHqiwutxhH3fYb49JPc6vY3/V/f3duMbn2RaVwP+B6aQ+vJ/07fXJFBiZInmVBrpnRn/KoHBwxsSq944I+DdFnV8BUnTYd2LWO9DiTdpb9aK7jvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=22kfsSY8; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53da209492cso5378081e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 19 Nov 2024 07:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1732030299; x=1732635099; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LagAj1y4lDY5Rron6vSSiMiLB8uO0l7iNkWvOFYYQVI=;
        b=22kfsSY8TwdkYIbJ3/C5Ngfl9yrnNfEmYHPmtbnh8U8S5J9nlIWUkMRl2XlRVSUgzE
         Y2PIEIhSjZXQY4d+Q/mgGODaKcSTniEO79v2HTUweQePMkFVP9u/+wmpOBtjBlrFOTZY
         1+XXC++byTd9buN9qkKyr7ll6dhl3ZizXOkSZl2pCo5cILCFBv5WYHMlTo5EB39YCVeG
         7j6CEJHtHsE+akPY2xYjekHREX08hVa4Fd17T3AWUQpi+6jw101Yj6VV7C67gLf7d14A
         FAX7f+aLyA4B65XqCxeUzi2SJcQD9d1f5qQN/TVHb8meppKkNSQrz8z1my+sy0QYZe4k
         6eKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732030299; x=1732635099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LagAj1y4lDY5Rron6vSSiMiLB8uO0l7iNkWvOFYYQVI=;
        b=C9iSVxADRPjAtk3Fd7C03vSicredKKV5WpJ3fkhYaGnlQwXygBa8BrNRt4R70eiu8g
         LscOeWgCzGoTgYchpnr+v25kqsTocBsByQATlpPTaxudRdhEvF1m4yqKaAvTzJk1pvm8
         P4/ELRwmdjomDXw2rjb6uSa6LnSyG1I+VDT42hn2SohDEx5JB8FjJf/iJlAcZp/b5nKX
         ASP6lKfBtCWluQYV9tT+sHeXVF8yN5h0VB4wbOM0QTUoE1vywDi+/pQxzSVk9fxVemDG
         msOqPTZ2K6/8t/q5uwCZpE7zofg5x9ZaNC1y6FWAjddgNjVDPmD8BRc2I5CQCwPZ/SgF
         lT2A==
X-Forwarded-Encrypted: i=1; AJvYcCU9tf9vUZJ0ybn8s8wxJwXx3XvUkmEOtNkodNGPd7qnTyGaImCy7/5xLE6brzXmSxMP1MJAaBcR9s1k@vger.kernel.org
X-Gm-Message-State: AOJu0YyGy00Q6k4VE4fSWiFG5C+woDR004AKp+zXJ69I7LZS8sb3QBrP
	/sk/pUJ4dUb6yv1UHHklTrNByMttV6k8VUtpsthqoIjlZEmepdijOwWtKVpyvKGHSD/OH7x7CZE
	1tGmsyPM+mIyPLL8E7RdBpWB5Lthg4xnjN+VyYQ==
X-Google-Smtp-Source: AGHT+IHRJzZrgYSKB/9UFezMr6keX/GZJ1QMvjnbq96C0RtwbLVJCKjKYOKkAC5zKV0q7rjH+FhroxvFrKuc+09JC3k=
X-Received: by 2002:a05:6512:3da5:b0:53c:74a7:43e1 with SMTP id
 2adb3069b0e04-53dab29e97fmr7414707e87.13.1732030299400; Tue, 19 Nov 2024
 07:31:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <PH1P110MB16034EAD37BA0FC4A0EAC0E79F20A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
In-Reply-To: <PH1P110MB16034EAD37BA0FC4A0EAC0E79F20A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 19 Nov 2024 16:31:28 +0100
Message-ID: <CAMRc=Mf=ji5s8Dvd+4OjzKhgLDWdo4--F8H-t=YM6c0ppMyqtA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] bindings: python: drop distutils from build_tests.py
To: Vincent Fazio <vfazio@xes-inc.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	Phil Howard <phil@gadgetoid.com>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2024 at 4:29=E2=80=AFPM Vincent Fazio <vfazio@xes-inc.com> =
wrote:
>
>
>
> > -----Original Message-----
> > From: Bartosz Golaszewski <brgl@bgdev.pl>
> > Sent: Tuesday, November 19, 2024 9:00 AM
> > To: Linus Walleij <linus.walleij@linaro.org>; Kent Gibson
> > <warthog618@gmail.com>; Vincent Fazio <vfazio@xes-inc.com>; Phil Howard
> > <phil@gadgetoid.com>
> > Cc: linux-gpio@vger.kernel.org; Bartosz Golaszewski
> > <bartosz.golaszewski@linaro.org>
> > Subject: [External] - [libgpiod][PATCH] bindings: python: drop distutil=
s from
> > build_tests.py
> >
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > The configure() function in setuptools.logging has been available since
> > v61.0.0 release so for over 2,5 years. We can generally expect users of
> > python bindings to be using relatively recent versions of required
> > dependencies. At the same time distutils has long been deprecated.
> >
> > Let's keep the try: guard for setuptools.logging.configure but instead =
of
> > importing distutils if the former is unavailable, just do nothing and d=
rop the
> > deprecated import altogether.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  bindings/python/build_tests.py | 10 ++++------
> >  1 file changed, 4 insertions(+), 6 deletions(-)
> >
> > diff --git a/bindings/python/build_tests.py b/bindings/python/build_tes=
ts.py
> > index 1760257..bfdc4c0 100644
> > --- a/bindings/python/build_tests.py
> > +++ b/bindings/python/build_tests.py
> > @@ -2,8 +2,8 @@
> >  # SPDX-FileCopyrightText: 2023 Phil Howard <phil@gadgetoid.com>
> >
> >  """
> > -Bring up just enough of setuptools/distutils in order to build the gpi=
od -test
> > module C extensions.
> > +Bring up just enough of setuptools in order to build the gpiod test
> > +module C extensions.
> >
> >  Set "build_temp" and "build_lib" so that our source directory is not  =
polluted
> > with artefacts in build/ @@ -81,10 +81,8 @@ try:
> >      from setuptools.logging import configure
> >
> >      configure()
> > -except ImportError:
> > -    from distutils.log import DEBUG, set_verbosity
> > -
> > -    set_verbosity(DEBUG)
> > +except:
> > +    pass
>
> Similar to the other patch, this requires setuptools >=3D60.2.0 which may=
 not be the default on some distributions. For example, Ubuntu 22.04 which =
is still under active support ships with setuptools 59.x. and the version o=
f setuptools included in a version of python built by, say, pyenv to do reg=
ression testing on earlier python versions may also not meet this requireme=
nt, so developers will need to prep a virtualenv with an updated setuptools=
 most likely.
>
>

Unlike the other patch, this will still work even if we remove that
bit altogether. It's not a hard requirement.

Bart

