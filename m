Return-Path: <linux-gpio+bounces-21032-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A316ACEB37
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Jun 2025 09:51:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF5321781E3
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Jun 2025 07:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A75391FE44A;
	Thu,  5 Jun 2025 07:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="n9qy2dMV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77671F4176
	for <linux-gpio@vger.kernel.org>; Thu,  5 Jun 2025 07:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749109894; cv=none; b=UaOk/b0l6XOak4Jw5DithQ82JbyOKT5bwmi+XBNen581FDQ7SBb/J988xh+tURC1ZMIlZ5O3UJCsP43FLoiqKtDESMdwGrQOqLCLBTSHpCovi2COXuZaeaZdtrCF93OcIMfTsi15+59CVoS0tUfba3n6YfQ9x4Evh9mBIyqZGho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749109894; c=relaxed/simple;
	bh=8xXRuUZOac10A6psZXMkIS18jTSQewSBW/NwFX66imE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RrUYMNH9Yz5PmFsHLTbDjWi8WTwsS6n690iKKjkBSGrCNqjyuZG3UksGoAT2c68OaO3PBrZCPtClZ84PAN0QdkWTzD++SD40njlMnLfOdu+SpNxvZ3XHIXZEve/3xawWNpjjosZ88MUWfIGb9XTO5Cd9U6jxCL4m3wcKg0tvT/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=n9qy2dMV; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-551efd86048so674252e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 05 Jun 2025 00:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749109890; x=1749714690; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+6nNlsQ78BA6fH/09x5iC5VR0awgPthY5ImpLMgJ+cI=;
        b=n9qy2dMVjYNtEnqkjnbgglmg4rr/ikiyRKFkcBQjV0QJtsBzbd/aAankd9jPPhUk0o
         wXuC0DRVUhB4NklJHKmxkC7T1R/2mE3BaEWm9np8ejSekxToQjC9HNRBNYOAcr6YbBRd
         Ob7snUnniCBdh8CXLvWtbdbEDW3e+7tIWSBEqDf93giIvfQWnUTk0VCSKoeJfKxqnF1s
         QayEjuBtshbQUKjxYrShIqpiUc5RdM5bXvMCaNqsJpDph3zjH4RRNJLoNxCvKtyoei//
         3CsUEuNUotvbsYct7/qg+69CQUTirMy3RpUlSBQQ59WIsUxyqX9D7n+AKGqhWiYACMaP
         oejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749109890; x=1749714690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+6nNlsQ78BA6fH/09x5iC5VR0awgPthY5ImpLMgJ+cI=;
        b=jZfLnckf6cLgH2RSTedKjPlBUnTbCnjInewAe4Q2uOT1LAXIb4iPxhNYm3ENKxr0dD
         Mx6bmp/YvdUkmQJCGyfNrXCVaj0eF092qIOUaZ+IvWNSTWSQLOEwIlegq8kPJTkdq68e
         2Au8vcu1bpKmfm5TMoP2LYEwQ7l4lISb9WX1OYrVq6IVweyMa1PFJemT0xbxuFsJMxeu
         3l7NZVKgc2AVBbPWXI/xN5QaVo4ozPdV8uhe2en4Llb0YXKTlYbawqvN0NOd1D6xO/2M
         QiKJMKbmMnb10QuOL8dw6KSocQUSatfRP9DMlHyrZi+kLURxuMYnsUfdPklhU2NdeFK2
         2nHg==
X-Forwarded-Encrypted: i=1; AJvYcCUv0DIZ9IhUS8N7nLR0mWJzTS2jG1RbfuUSc/t3kbsCzH2vBqc3Xa8tyDpOkBAUjDrWjub2g6Rf8qJ2@vger.kernel.org
X-Gm-Message-State: AOJu0YxfILFlavQzV6e5mpyrnopvAe7zcLv0vealAiFuahAQ9n4y1WK8
	1vLFY5vlhojgdoNEIQru+UWEdc+88uVWUUgvdPKRBzwvJfHZBWTxgzIqgyWSEON2ZVWWrQEqq9e
	sdy0a/wvRMqAfuS3hTg0KFa75oVe3ng9lF9E48lvl7g==
X-Gm-Gg: ASbGncu8RV/i8SnzkGS8WEIWf+RG2/uhjyD2YCThGJQb2Wnh+Tm/iOt0tF32AVAUt+x
	tZMfA5LDUxeinqLcLPVrlzmh3xxVKUZsHqq1TaMNzqwtuX7kmMhBlkmpfMeqyOEkkYLdBWF4Lo6
	3LKVG1I9JH8jQasM+5XgCk3Yod4/vWChQ+PaQTbkfrwBtuBP4Wwj179y/O6VwHaLs=
X-Google-Smtp-Source: AGHT+IFwB1gh69TJy4e676RjCWlfXVbd8NiCmbdBOG0IA0o0jTEoKcIHe9BKEflTKN3zSdkL1u5o1MU9NL1nZ1yfg+I=
X-Received: by 2002:a05:6512:a94:b0:553:35f5:7aac with SMTP id
 2adb3069b0e04-55356deeae9mr1764660e87.48.1749109889522; Thu, 05 Jun 2025
 00:51:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604-rust-docs-v1-0-8ff23924a917@linaro.org>
 <20250604-rust-docs-v1-3-8ff23924a917@linaro.org> <DAEET50ME6NU.294ZRFRVH2DX7@riscstar.com>
In-Reply-To: <DAEET50ME6NU.294ZRFRVH2DX7@riscstar.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 5 Jun 2025 09:51:17 +0200
X-Gm-Features: AX0GCFu4DzRDXrV2-ndRHhH3KercrogtE-PfTemCXczrgs79QeMVd_xOtXdgBPM
Message-ID: <CAMRc=MePYwHKwUAGFovzXEAQg3YdyZrcOAGH2cyzAkAPjoZzpw@mail.gmail.com>
Subject: Re: [PATCH libgpiod 3/3] doc: integrate rust docs into the sphinx build
To: Erik Schilling <erik@riscstar.com>
Cc: Vincent Fazio <vfazio@xes-inc.com>, Kent Gibson <warthog618@gmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Erik Schilling <erik.schilling@linaro.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 5, 2025 at 9:09=E2=80=AFAM Erik Schilling <erik@riscstar.com> w=
rote:
>
> On Wed Jun 4, 2025 at 11:53 AM CEST, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Follow the pattern we established with GLib bindings: generate a separa=
te
> > set of docs for the rust bindings, make them part of the generated doc
> > bundle and point to the rust index.html from the dedicated sphinx page.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  .readthedocs.yaml |  3 +++
> >  docs/conf.py      | 38 +++++++++++++++++++++++++++++++-------
> >  docs/rust_api.rst | 22 ++++++++++++++--------
> >  3 files changed, 48 insertions(+), 15 deletions(-)
> >
> > diff --git a/.readthedocs.yaml b/.readthedocs.yaml
> > index 5f4f5ac4954de70e060f1a7b2eafe3a731620c16..d81900c9ad9a60d8530b58e=
38add3a3a353da718 100644
> > --- a/.readthedocs.yaml
> > +++ b/.readthedocs.yaml
> > @@ -14,6 +14,7 @@ build:
> >    os: ubuntu-24.04
> >    tools:
> >      python: "3.12"
> > +    rust: "1.86"
> >    apt_packages:
> >        - autoconf
> >        - autoconf-archive
> > @@ -24,6 +25,8 @@ build:
> >        - gir1.2-glib-2.0-dev
> >        - gobject-introspection
> >        - graphviz
> > +      # Needed for stdbool.h in rust build
> > +      - libclang-dev
>
> Mostly it is needed for bindgen, right?
>

Yes, I'll change the comment here.

> >        - libglib2.0-dev-bin
> >        - libgudev-1.0-dev
> >        - libtool
> > diff --git a/docs/conf.py b/docs/conf.py
> > index 04d1cea2a2175166555993c3e936e7cf1ebd0fe6..8c7bed234c98990f01adaec=
6ca3d6db2c3171c65 100644
> > --- a/docs/conf.py
> > +++ b/docs/conf.py
> > @@ -54,15 +54,16 @@ except ImportError:
> >
> >  html_theme =3D "sphinx_rtd_theme" if sphinx_rtd_theme else "default"
> >
> > +# We need to know where to put docs generated by gi-docgen and cargo b=
ut
> > +# app.outdir is only set once the builder is initialized. Let's delay =
running
> > +# gi-docgen until we're notified.
> > +#
> > +# For some reason on RTD we're in the docs/ directory while during a l=
ocal
> > +# build, we're still in the top source directory.
> > +prefix =3D "../" if os.getenv("READTHEDOCS") =3D=3D "True" else "./"
> > +
> >
> > -# We need to know where to put docs generated by gi-docgen but app.out=
dir is
> > -# only set once the builder is initialized. Let's delay running gi-doc=
gen
> > -# until we're notified.
> >  def make_glib_docs(app):
> > -    # For some reason on RTD we're in the docs/ directory while during=
 a local
> > -    # build, we're still in the top source directory.
> > -    prefix =3D "../" if os.getenv("READTHEDOCS") =3D=3D "True" else ".=
/"
> > -
> >      subprocess.run(
> >          [
> >              "gi-docgen",
> > @@ -77,8 +78,31 @@ def make_glib_docs(app):
> >      )
> >
> >
> > +def make_rust_docs(app):
> > +    subprocess.run(
> > +        [
> > +            "cargo",
> > +            "doc",
> > +            "--manifest-path",
> > +            f"{prefix}/bindings/rust/libgpiod/Cargo.toml",
> > +            "--target-dir",
> > +            f"{app.outdir}/rust/",
> > +        ],
>
> This would narrow it down to only the libraries that actually matter:
>
> diff --git a/docs/conf.py b/docs/conf.py
> index 8c7bed2..e5baeb2 100644
> --- a/docs/conf.py
> +++ b/docs/conf.py
> @@ -82,8 +82,11 @@ def make_rust_docs(app):
>      subprocess.run(
>          [
>              "cargo",
>              "doc",
> +            "--no-deps",
> +            "--package=3Dlibgpiod",
> +            "--package=3Dlibgpiod-sys",
>              "--manifest-path",
>              f"{prefix}/bindings/rust/libgpiod/Cargo.toml",
>              "--target-dir",
>              f"{app.outdir}/rust/",
>
> As the other stuff is just build dependencies, we probably do not need
> to include it in the output? But not having a strong opinion here.
>

Thanks, it looks much cleaner with this. In fact: I only want to
include libgpiod and not the -sys create as the former is the only
official user-facing API.

I also dropped some environment variables which turned out to not be
needed at build-time - LD_LIBRARY_PATH and
SYSTEM_DEPS_LIBGPIOD_SEARCH_NATIVE.

I'll send a v2 shortly.

Bartosz

