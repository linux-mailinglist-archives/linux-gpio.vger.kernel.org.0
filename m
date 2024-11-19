Return-Path: <linux-gpio+bounces-13114-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C13B9D29AD
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2024 16:33:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA0711F22D8A
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2024 15:33:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66B141CF297;
	Tue, 19 Nov 2024 15:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="seNbhEaM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278941CEABA
	for <linux-gpio@vger.kernel.org>; Tue, 19 Nov 2024 15:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732030386; cv=none; b=bkCuCpdLXiVk8PjK6Ie0rmsQUjQ6/pAmjNBwslf0A9YdI6T6INevIepsHOKcDiejZUrox+I+dw+O0QukDXJbGc71jAUKUNzI+4hK9VZyIuqlPm8qvhKDJnT49uyBcBEtXoY5bCZvtVtUjDgFzSbq8re7J+GmRmS6fBOqD1e50f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732030386; c=relaxed/simple;
	bh=OKZo8JnMHqEJWqlu5ithEMjV3JcSCWUxiyh+5ss9Hpw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FNAQ+FTuaTPesIxwA7Rq5klu8N1q1uvjPftoxIZZFVsAJxVsRooKdsH75Ue9ecRs++wuEiD4SnSSUtn/M08y2mVF3TYqrLXZAEGGnfNl7kV+RWZ8Su8vYToUlbPAF8TmCaLjvP5TIk7T/MhS9t8acTBRVjGXBLOs9mXfCT6G7i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=seNbhEaM; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2fb3da341c9so29988241fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 19 Nov 2024 07:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1732030382; x=1732635182; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B/C3HycFXcjJGqwy9xDcjeG39X2asdbD/D0iPgd+xg0=;
        b=seNbhEaMhlmRrUPSVdpvVzqH9yFST8GthbgEOrI4tQ/0xP6PFmSLHPDOZgnBPOdohd
         yjbpRAK2BuPAomd7fCqwTDbnJYdccHGp+Mr1Og+aqdX1qJGhzXRUQV/ElLfMTei8W1Oe
         uyPDgH9Wo0QMTCigxom+6Jscfj9oKuBz2nyhAvXU3PleYFGtw7Y8nbfmEMH+n3PeUs74
         q2ZAIp57aOP4S/7GWzdXQHg2/KybvQrOKSiepd9qpHDt02O9vX9kn/10ZrhLQ8MRJIa3
         cJgiFDbGjELyLNOM3Lo2MKmlGVlApfVRXJyAMH7++KzmGVyiiIiT3ofFv66TaXu9auQP
         JmKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732030382; x=1732635182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B/C3HycFXcjJGqwy9xDcjeG39X2asdbD/D0iPgd+xg0=;
        b=FSvxKo6CEPH3lGpi60o/ZVuBRPnWF+hY2cBdVN92eM2LN9TBhBqWgFUsRRvVn8iLXH
         HKWVROzmp43R3o1eGoEV+zzFHagav5gZg11k7RiPUM3G8iv/X6BcO29Nzh09vndtmgGD
         iH+vjGYtNsGqUk4cUx6NJW01fETFhPZRl+YArKiDdtt4h/NnUGh413oDOtjCynIwCx7l
         +v/I7R61toNWfwEPreqnGIIuTyejcQvx2fEmxY9NVV42POaJPtpAY59LojVaVfWhQx7Z
         /DN2c7pO1YDn1p5oPYO7EdSq2MFRSeBTUVq/mW0DFzsI6uKk1HH/ppYCyeGN0kbu/1gC
         0sgw==
X-Forwarded-Encrypted: i=1; AJvYcCV5dveWUbNmfxI9QOHJ4pPIiZ9XShM03v2t6WbimGDJa9SQXR1ylneZykfSkqsXiyHqYJv3MnQAOITO@vger.kernel.org
X-Gm-Message-State: AOJu0Ywrh8CjbVC0/9Z6ftzuMtTYXAnF1SrCVrFLFbr20V/pLCoSA1dV
	UTgVM01xCfqefikBbShsOJjI30BW11g8Fb9yio4Lsx4vNAezM3nQlxTRKYtibfydGzdH4LvslGF
	5EiRutDTb19HlRNV1/kHfCuFQaOc7BQgJIt5A3A==
X-Google-Smtp-Source: AGHT+IHrVb170ySRu/rDXFOy7vY8ayRYksi09lDHwXt8fF/ADdkakuOFZVHEK9BL+TCSowSkkTgfqsBjlL6ZTSArOLA=
X-Received: by 2002:a05:651c:1b14:b0:2fb:4ca9:8f4 with SMTP id
 38308e7fff4ca-2ff606900e5mr81418681fa.23.1732030382240; Tue, 19 Nov 2024
 07:33:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <PH1P110MB1603464BE30BA2CD637326CD9F20A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
 <CAMRc=McZ0XQzG0hmzmi59SXtOeRzmhOPgkfuzUWM4ZPLaTj4wQ@mail.gmail.com>
In-Reply-To: <CAMRc=McZ0XQzG0hmzmi59SXtOeRzmhOPgkfuzUWM4ZPLaTj4wQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 19 Nov 2024 16:32:51 +0100
Message-ID: <CAMRc=MeJfB+3ksjZkh3RRQ4nZ4X+sVwREtA8pDGZcSsgat5tTA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] bindings: python: tests: replace LooseVersion
 with packaging.version.Version
To: Vincent Fazio <vfazio@xes-inc.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2024 at 4:20=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> On Tue, Nov 19, 2024 at 4:18=E2=80=AFPM Vincent Fazio <vfazio@xes-inc.com=
> wrote:
> >
> >
> >
> > > -----Original Message-----
> > > From: Bartosz Golaszewski <brgl@bgdev.pl>
> > > Sent: Tuesday, November 19, 2024 8:43 AM
> > > To: Linus Walleij <linus.walleij@linaro.org>; Kent Gibson
> > > <warthog618@gmail.com>; Vincent Fazio <vfazio@xes-inc.com>
> > > Cc: linux-gpio@vger.kernel.org; Bartosz Golaszewski
> > > <bartosz.golaszewski@linaro.org>
> > > Subject: [External] - [libgpiod][PATCH] bindings: python: tests: repl=
ace
> > > LooseVersion with packaging.version.Version
> > >
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > Distutils are deprecated. Use the Version class from packaging.versio=
n instead
> > > of LooseVersion from distutils.version.
> > >
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > ---
> > >  bindings/python/tests/__init__.py | 7 ++++---
> > >  1 file changed, 4 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/bindings/python/tests/__init__.py
> > > b/bindings/python/tests/__init__.py
> > > index a0f22ae..d6275bb 100644
> > > --- a/bindings/python/tests/__init__.py
> > > +++ b/bindings/python/tests/__init__.py
> > > @@ -2,10 +2,11 @@
> > >  # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
> > >
> > >  import os
> > > -from distutils.version import LooseVersion
> > >
> > > -required_kernel_version =3D LooseVersion("5.19.0") -current_version =
=3D
> > > LooseVersion(os.uname().release.split("-")[0])
> > > +from packaging.version import Version
> > > +
> > > +required_kernel_version =3D Version("5.19.0") current_version =3D
> > > +Version(os.uname().release.split("-")[0])
> > >
> >
> > I think these changes are "accurate", however, the challenge is `packag=
ing`
> > Is not part of the stdlib like distutils was so it's very possible some=
one runs into:
> >
> > vfazio4 /mnt/development/libgpiod/bindings/python # make python-tests-r=
un
> > PYTHONPATH=3D/mnt/development/libgpiod/bindings/python \
> > LD_LIBRARY_PATH=3D/mnt/development/libgpiod/lib/.libs/:\
> > /mnt/development/libgpiod/tests/gpiosim/.libs/ \
> > /mnt/development/libgpiod/bindings/python/venv/bin/python3 -B -m tests
> > Traceback (most recent call last):
> >   File "/home/vfazio/.pyenv/versions/3.9.8/lib/python3.9/runpy.py", lin=
e 188, in _run_module_as_main
> >     mod_name, mod_spec, code =3D _get_module_details(mod_name, _Error)
> >   File "/home/vfazio/.pyenv/versions/3.9.8/lib/python3.9/runpy.py", lin=
e 147, in _get_module_details
> >     return _get_module_details(pkg_main_name, error)
> >   File "/home/vfazio/.pyenv/versions/3.9.8/lib/python3.9/runpy.py", lin=
e 111, in _get_module_details
> >     __import__(pkg_name)
> >   File "/mnt/development/libgpiod/bindings/python/tests/__init__.py", l=
ine 6, in <module>
> >     from packaging.version import Version
> > ModuleNotFoundError: No module named 'packaging'
> > make: *** [Makefile:691: python-tests-run] Error 1
> >
> > It may be necessary to document that anyone doing development on the bi=
ndings prepares a virtual environment with a minimal set of required depend=
encies and that it's activated when the build is configured... or the tests=
 need to setup an environment with proper dependencies necessary for them t=
o run.
> >
> >
>
> We do have it as a requirement in pyproject.toml though, shouldn't
> that be enough?
>
> Bart

Alternatively I'm just tempted to rename the procname package to
helpers or something similar and just implement the version checking
in C using KERNEL_VERSION.

This way we wouldn't depend on anything in python.

Bart

