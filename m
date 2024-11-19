Return-Path: <linux-gpio+bounces-13111-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BCF9D2979
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2024 16:20:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 022702817F6
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2024 15:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C0BB1CC179;
	Tue, 19 Nov 2024 15:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="tOfKmX88"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAD9199B9
	for <linux-gpio@vger.kernel.org>; Tue, 19 Nov 2024 15:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732029625; cv=none; b=Igsyp9dYqZlHfhcQ11r7Rm0eSQ0fKdp8l1Cmw0nxli1szgXOBMOCiVFpkB09uVzb+nvd7JJ5HQ0F6OE9BDfQVSwQBMRdZE72hyG9zA5dSeoknGTJkyJJpx6zUwm8O3os4P7lAxiiX4WHTxWOuhlyHv/Dt3PBP8ttRznmQRLqPsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732029625; c=relaxed/simple;
	bh=/ycs3xQFeQ0AI6cPme3NDJZZIGCm41IWI0cumdRUzBA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z60iZq+MjdPZH2vcIXykb1wl+JGo5AnDcoOk5OL95V1dxeOz0IPyH6sVKLT+8bRDIaL9Yu1LodRk/S+pkIXNsuPnEmqgQrwCC8OsDvWW5bFr81l6Ae5J2Ji/hpu6eN99bRXqp8/IEDEbw2HLZx/i1f2fh+r47N1xErhamyQRfoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=tOfKmX88; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fb4fa17044so31857621fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 19 Nov 2024 07:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1732029622; x=1732634422; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8tge/AcKO38Nhu5xJcgM56NiMrL8iik14cFKtvbbDHM=;
        b=tOfKmX88EsvSjhBiMnkGBu+xc8/zV4EwSh5jVtMgTid3XDGgceAccSQ91kJ/mFkYVC
         /lyCcwPYzOE51+/WmwuWvsFMVPH1icSsCRU/vsj6xcnky6IXBk0zLHNLEm5MAaAcB/ZR
         /AntxaSuRQBZALSSrswMktADONdU7t91t6THUwWu8Z3Skrygc0V/WLZOXy8AZnJUVt2E
         k1BshdGekMhf6ASuta2n2TfSS8WfWL0cW/IjuZaAxat5IFZ/bdqfYS7rieVozTlpIw5m
         PfL6KIXjfI3QR2OTEjqGjdABKM+aogOmPemnsJQ3cQf810h7nOeebsBQ22ss9hA0CBd2
         HwFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732029622; x=1732634422;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8tge/AcKO38Nhu5xJcgM56NiMrL8iik14cFKtvbbDHM=;
        b=FwVZ/bci9fp4ar5WB1ZL6EbKGrTs3exzEyxdUU4/GI5XOnBitDd8B+akfcMqSdSfWE
         8Gv3tBCjECHQ1iYSln7DJY6oQpsFdGOJWd4tnlhMnxyEl5QSWTUyr2foW9D6O6IUIhzS
         ekG0bVzjDFbQUNLM7vlkvjng+DSVvrfEdVvt/Zk8lMyiS/3Q8p9lKXx3vuhwxFC5eGG+
         dmqsJmUc2ZvCaOy06RIj472VBj+yZFZsCzjf/Rf0/uqe3d2THDa3eCgp5MPXopwsQCyP
         4TaXnurA626s9LHxBnkzTgkp5Ikbau8vfnTOBgHJbDbaO1hVTypp6fRUc6BI6IAqTGlE
         eExw==
X-Forwarded-Encrypted: i=1; AJvYcCXELov8WhkGVzBHSMvOtIVYbqVc1v89qhLEikiNU/SFqNJxM3xfOpo6hcGPPYDJIFzfWeKbDlAlH2DD@vger.kernel.org
X-Gm-Message-State: AOJu0YzVKvV177W8E5z9meF6vxq4+gP38UxAUc9GtV1bkuBVXY5pOA9x
	P+P1ibK2Z1mmPdsUCYp03MRaZtz+n8YdjM5QIh8Prb/9FCxHrFvZR4nHT+zbz5Jr0uatB/HBm3H
	tgZa2fqzXN1D6ba7TVVszYPBToJyfVaktmhklBw==
X-Google-Smtp-Source: AGHT+IH4JiXLr5wD+OaPhvtQhFjJCXEpTjFIUKXFAat7C8oAaB7DHjuBdIOUexyz+VJ9jQVWIlwvaY3HyKCUDY3FkX0=
X-Received: by 2002:a2e:a9a8:0:b0:2fb:6110:c5cb with SMTP id
 38308e7fff4ca-2ff6070e6c1mr81565601fa.34.1732029622196; Tue, 19 Nov 2024
 07:20:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <PH1P110MB1603464BE30BA2CD637326CD9F20A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
In-Reply-To: <PH1P110MB1603464BE30BA2CD637326CD9F20A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 19 Nov 2024 16:20:11 +0100
Message-ID: <CAMRc=McZ0XQzG0hmzmi59SXtOeRzmhOPgkfuzUWM4ZPLaTj4wQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] bindings: python: tests: replace LooseVersion
 with packaging.version.Version
To: Vincent Fazio <vfazio@xes-inc.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2024 at 4:18=E2=80=AFPM Vincent Fazio <vfazio@xes-inc.com> =
wrote:
>
>
>
> > -----Original Message-----
> > From: Bartosz Golaszewski <brgl@bgdev.pl>
> > Sent: Tuesday, November 19, 2024 8:43 AM
> > To: Linus Walleij <linus.walleij@linaro.org>; Kent Gibson
> > <warthog618@gmail.com>; Vincent Fazio <vfazio@xes-inc.com>
> > Cc: linux-gpio@vger.kernel.org; Bartosz Golaszewski
> > <bartosz.golaszewski@linaro.org>
> > Subject: [External] - [libgpiod][PATCH] bindings: python: tests: replac=
e
> > LooseVersion with packaging.version.Version
> >
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Distutils are deprecated. Use the Version class from packaging.version =
instead
> > of LooseVersion from distutils.version.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  bindings/python/tests/__init__.py | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/bindings/python/tests/__init__.py
> > b/bindings/python/tests/__init__.py
> > index a0f22ae..d6275bb 100644
> > --- a/bindings/python/tests/__init__.py
> > +++ b/bindings/python/tests/__init__.py
> > @@ -2,10 +2,11 @@
> >  # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
> >
> >  import os
> > -from distutils.version import LooseVersion
> >
> > -required_kernel_version =3D LooseVersion("5.19.0") -current_version =
=3D
> > LooseVersion(os.uname().release.split("-")[0])
> > +from packaging.version import Version
> > +
> > +required_kernel_version =3D Version("5.19.0") current_version =3D
> > +Version(os.uname().release.split("-")[0])
> >
>
> I think these changes are "accurate", however, the challenge is `packagin=
g`
> Is not part of the stdlib like distutils was so it's very possible someon=
e runs into:
>
> vfazio4 /mnt/development/libgpiod/bindings/python # make python-tests-run
> PYTHONPATH=3D/mnt/development/libgpiod/bindings/python \
> LD_LIBRARY_PATH=3D/mnt/development/libgpiod/lib/.libs/:\
> /mnt/development/libgpiod/tests/gpiosim/.libs/ \
> /mnt/development/libgpiod/bindings/python/venv/bin/python3 -B -m tests
> Traceback (most recent call last):
>   File "/home/vfazio/.pyenv/versions/3.9.8/lib/python3.9/runpy.py", line =
188, in _run_module_as_main
>     mod_name, mod_spec, code =3D _get_module_details(mod_name, _Error)
>   File "/home/vfazio/.pyenv/versions/3.9.8/lib/python3.9/runpy.py", line =
147, in _get_module_details
>     return _get_module_details(pkg_main_name, error)
>   File "/home/vfazio/.pyenv/versions/3.9.8/lib/python3.9/runpy.py", line =
111, in _get_module_details
>     __import__(pkg_name)
>   File "/mnt/development/libgpiod/bindings/python/tests/__init__.py", lin=
e 6, in <module>
>     from packaging.version import Version
> ModuleNotFoundError: No module named 'packaging'
> make: *** [Makefile:691: python-tests-run] Error 1
>
> It may be necessary to document that anyone doing development on the bind=
ings prepares a virtual environment with a minimal set of required dependen=
cies and that it's activated when the build is configured... or the tests n=
eed to setup an environment with proper dependencies necessary for them to =
run.
>
>

We do have it as a requirement in pyproject.toml though, shouldn't
that be enough?

Bart

