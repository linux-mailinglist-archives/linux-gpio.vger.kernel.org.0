Return-Path: <linux-gpio+bounces-15737-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2269DA30C0E
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 13:51:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BBE4A1648F3
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 12:51:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A05B204873;
	Tue, 11 Feb 2025 12:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="t4c69+VW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29728320F
	for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 12:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739278310; cv=none; b=WQwe7ZsEQdp+U7F3bFf6yl1XbqWfuDXBB3AHHEGo0uoCPcwVJfzUJLGa+XZ9ENDBCTfrx+qOnh5vgV4UWcS8C/LtGptrIn5AVMhgih4405xMUUMbOa1lCYckPbhHiJt8NeeCdBSIFStk+FAMe2FMKPhsxOWD+BNnaX2MjvuUDmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739278310; c=relaxed/simple;
	bh=edsr47UZMLQ2/Oz1MWiudK8ZJ21PpWVogkexhabxjdg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CjaeQroxpuxgQB6y+wOGwB6tyHEq78VCRbi/2aYezWS5Oi6vc7IgczMIb5IUHMnucXgjDEzXEpKHzItI7T6cdx62fnY762tydWMt0vGGmGcclDjgZM6n8TbqqHK8dy44hqeNDXl4NqcU/wyRU6XWpLF8wJ/CoEd97l+trwfYCj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=t4c69+VW; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54509f46614so2586217e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 04:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739278307; x=1739883107; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BKQWcyZMt73G6/nGYP5CVdrHXeNZcLGr3j3iFfKbH4g=;
        b=t4c69+VWxJwB9fLOIZRFIh3nKzBYKrxjnnzEH9tqTB2xZbK87jixV3V3QOURFTRtBi
         foDK4vPCYdvd1juGClLTorVnXQV9+h6JT3IH5YdkuS9YJL5rLLY94Q/wVrmRcUyDkrCS
         AAfQmJjrrQKp6Y2Nor9eZVIQIOcr06JqPHARnITEY2VC2/7t8BYpOYb6P0NcQp1hzSkW
         rhKzVsWvFO2Evm6NsvmNc3QeFFsgeDV4yhyPr4o4sRGDmgq+JWSwhbyfyddRAPesnsFx
         wY83Q4e9wbcPCzvtRYsn53qq0K9qm/mT7/RxW2YaiAyKWrFqKyMd7DC/CMdtAqS5KJRb
         cqQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739278307; x=1739883107;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BKQWcyZMt73G6/nGYP5CVdrHXeNZcLGr3j3iFfKbH4g=;
        b=S8ro/7QiX9rzfH8lYgDoYHwEOLLTEHkMcmC57bDrAX12iLoecmh++rO81ATeqRNsIR
         57BLMBG+stNo/0jMCevFpISmzB83WJxbkfkkb0cyszWB1k9i3YOEXQKNDpCiLWcOPIS6
         ZhgDCJCVoGnCLTlzu4W25THKObNYTzg5KMmfdLYo61Wqn4SkIp6kXt6z71NflvxoZ3PJ
         mXYzTyskxwGOWIgJ9cLTVsK+jp/rqnlvX0ADJSLt2cNmoRMzZ+BqcKyb5OtXd/prlxaj
         QueHTALYkQmPr58mYKbwmeKnqwZDA4xEA017uB1GoZbKKYtpEq46T0CYG0gsgsWm1pN1
         Sasw==
X-Forwarded-Encrypted: i=1; AJvYcCWjc57ZBVJcWTKwr1+/ZB9X6bbTgsPyxXTD6WNoH+0ImNvLuQp5WPlotnKO9Bcg8/xdNMtM83CBrpa2@vger.kernel.org
X-Gm-Message-State: AOJu0YwV/G5Ivjlb0XBoVeElf7Pj0t4fQb5KwJWQynLJIjM+lsPbz7HY
	N/DK4xBN2xVoa/ZPwBQ211IKyP5RSOL4+egxB2lyIWPa9d+AOt+Y2BcXlhmbJqjwx8VxXI1fAIo
	AryqVTe1zmuvSIB8JWijaxYDRT0UldqPS/6raDw==
X-Gm-Gg: ASbGncvb22yUcr1CEwsK7Qs0NgpLRAci7Jo6tWcmlSn5Bri82D3DnHGeql2XsO1KcJB
	e7vMKKcqP16bZJZ1RbXKcMphK20qvC0BS5aRMXhQU3lV7BjMqSq0CBLgI2xxNPR665ymlz2H6/U
	f2Mx7APoAG7Y6dfGAqkQQqENwOI00=
X-Google-Smtp-Source: AGHT+IFf2e8QWqMl5TU8uZkCjPoo3aTbLouOJ+E3G3cbACEU0kyZIHz6vnmCoUb1OL1gRoa8jZshhpd8bPs5gJNstGE=
X-Received: by 2002:a05:6512:ad5:b0:544:1093:ee3a with SMTP id
 2adb3069b0e04-54414abb29amr6501749e87.24.1739278307145; Tue, 11 Feb 2025
 04:51:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206-improve-docs-v3-0-2065191fff6f@linaro.org>
 <20250206-improve-docs-v3-13-2065191fff6f@linaro.org> <PH1P110MB16032914796D8FE520943F359FF2A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
In-Reply-To: <PH1P110MB16032914796D8FE520943F359FF2A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Feb 2025 13:51:36 +0100
X-Gm-Features: AWEUYZnGW9mu9Rh4-w4q-ZZjIWgPIV2-uAQXSp4vc42ugdD6GTetpd2iQKli7Ww
Message-ID: <CAMRc=Mek=VnRBC-7CwfNb38JOe6EKw3a=37KJPhF96pySOK=zQ@mail.gmail.com>
Subject: Re: [External] - [PATCH libgpiod v3 13/16] doc: add documentation for
 GLib bindings
To: Vincent Fazio <vfazio@xes-inc.com>
Cc: Kent Gibson <warthog618@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Erik Schilling <erik.schilling@linaro.org>, Phil Howard <phil@gadgetoid.com>, 
	Viresh Kumar <viresh.kumar@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2025 at 4:10=E2=80=AFPM Vincent Fazio <vfazio@xes-inc.com> =
wrote:
>
>
>
> > -----Original Message-----
> > From: Bartosz Golaszewski <brgl@bgdev.pl>
> > Sent: Thursday, February 6, 2025 6:22 AM
> > To: Vincent Fazio <vfazio@xes-inc.com>; Kent Gibson
> > <warthog618@gmail.com>; Linus Walleij <linus.walleij@linaro.org>; Erik
> > Schilling <erik.schilling@linaro.org>; Phil Howard <phil@gadgetoid.com>=
;
> > Viresh Kumar <viresh.kumar@linaro.org>
> > Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>; linux-
> > gpio@vger.kernel.org
> > Subject: [External] - [PATCH libgpiod v3 13/16] doc: add documentation =
for
> > GLib bindings
> >
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > The GObject docs are generated with gi-docgen and there doesn't seem to=
 be
> > an easy way of converting them to sphinx. Let's put the GLib docs stati=
cally
> > into the sphinx output and reference them from the bindings chapter.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  .readthedocs.yaml |  9 ++++++++-
> >  docs/Makefile.am  |  1 +
> >  docs/bindings.rst |  1 +
> >  docs/conf.py      | 38 ++++++++++++++++++++++++++++++++++++++
> >  docs/glib_api.rst | 23 +++++++++++++++++++++++
> >  5 files changed, 71 insertions(+), 1 deletion(-)
> >
> > diff --git a/docs/conf.py b/docs/conf.py index 3d0209a..33fc89f 100644
> > --- a/docs/conf.py
> > +++ b/docs/conf.py
> > @@ -62,8 +62,46 @@ def autodoc_skip_init(app, what, name, obj,
> > would_skip, options):
> >      return would_skip
> >
> >
> > +# We need to know where to put docs generated by gi-docgen but
> > +app.outdir is # only set once the builder is initialized. Let's delay
> > +running gi-docgen # until we're notified.
> > +def make_glib_docs(app):
> > +    # For some reason on RTD we're in the docs/ directory while during=
 a local
> > +    # build, we're still in the top source directory.
> > +    prefix =3D "../" if os.getenv("READTHEDOCS") =3D=3D "True" else ""
>
> Building via `sphinx-build ./docs/ docs/sphinx-output` seems to work ok b=
ut building via `make docs` does not, maybe due to `make -C docs docs ` cha=
nging directory and requiring the prefix be present?
>
> Maybe we should always use the "../" prefix and expect callers from the t=
op directory to: `pushd docs; sphinx-build . ./sphinx-output; popd`
>
> (venv) root@9935cce25ae1:/work# make docs > /dev/null
> autoreconf: export WARNINGS=3D
> autoreconf: Entering directory '.'
> autoreconf: configure.ac: not using Gettext
> autoreconf: running: aclocal --force -I m4
> autoreconf: configure.ac: tracing
> autoreconf: running: libtoolize --copy --force
> autoreconf: configure.ac: not using Intltool
> autoreconf: configure.ac: not using Gtkdoc
> autoreconf: running: aclocal --force -I m4
> autoreconf: running: /usr/bin/autoconf --force
> autoreconf: running: /usr/bin/autoheader --force
> autoreconf: running: automake --add-missing --copy --force-missing
> configure.ac:54: installing 'autostuff/compile'
> configure.ac:40: installing 'autostuff/missing'
> bindings/cxx/Makefile.am: installing 'autostuff/depcomp'
> autoreconf: Leaving directory '.'
> /work/venv/lib/python3.12/site-packages/breathe/project.py:116: RemovedIn=
Sphinx90Warning: Sphinx 9 will drop support for representing paths as strin=
gs. Use "pathlib.Path" or "os.fspath" instead.
>   self._default_build_dir =3D os.path.dirname(app.doctreedir.rstrip(os.se=
p))
> usage: gi-docgen generate [-h] [-q] [--fatal-warnings]
>                           [--add-include-path INCLUDE_PATHS] [-C FILE]
>                           [--dry-run] [--templates-dir TEMPLATES_DIR]
>                           [--content-dir CONTENT_DIRS] [--theme-name THEM=
E_NAME]
>                           [--output-dir OUTPUT_DIR] [--no-namespace-dir]
>                           [--section SECTIONS]
>                           GIRFILE
> gi-docgen generate: error: argument GIRFILE: can't open 'bindings/glib/Gp=
iodglib-1.0.gir': [Errno 2] No such file or directory: 'bindings/glib/Gpiod=
glib-1.0.gir'
>
>

I worked around it in docs/Makefile.am.

Bart

