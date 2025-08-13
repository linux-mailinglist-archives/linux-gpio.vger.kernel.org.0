Return-Path: <linux-gpio+bounces-24337-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CB4B2425A
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Aug 2025 09:15:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E21018864AE
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Aug 2025 07:12:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5083C2C2AB2;
	Wed, 13 Aug 2025 07:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="fhTxYFRH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E8C272818
	for <linux-gpio@vger.kernel.org>; Wed, 13 Aug 2025 07:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755069147; cv=none; b=WuJxUioUXbWlid0vCyd+MMZ5Lxvupbf2fysfG3Fwq8x7VGqBKBOrRR335Chj3SM6habaQzyZPdG5lZzY0LZrL1q+3+yGvPGbRf6+8JnzCqr3mDebzhWDagXSEVHgF6H3oed1gZHL6UT+E1YhSlhV0f3kyKQdx2NHIaJ50ZhCBFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755069147; c=relaxed/simple;
	bh=dZfofiFn0AGksVMPhKnHMtL22lwFqbOXvOKwEQ5gv8g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QLMz2/jRgoFf2GXKpJgWOoyZrZCwO78/pQWUHr1SRIw7A4NlolASuAuxJetIdM817MyCYWakYi2ODDgMfHjc+jSCXb8LKymig7mFlDFMzKsxJqI8RKVwinNCHQ44jkuk65tjskk67TtmTAURCOKnYmLcujSLuVzFOSu25xD3SdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=fhTxYFRH; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-55b88369530so6684502e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 13 Aug 2025 00:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755069143; x=1755673943; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VWPiGwWfBEJW/FZCt5d/z5EjuXmbgn85aGTiP/Idr8Q=;
        b=fhTxYFRHoQlgmQ4MgaLEBdQNgY2qL/gC264ZVJ4W/tQFohECokAG7JLANqpSXwgvC+
         WuftAfDYMH1Oz8WKvHfWZ/Ofat6XS8Q+AjLL3BexHcAS1WE1zeA/VsXAdgd3eefIcuNK
         PFZJzRIS9JWq6IDlsCdHnhJxrFFch61q1fLKBRqf53s9Thqbk5NdV+xF3ncxDQWqeTJV
         r2G6trb07y9ecT1caU3oeEw7rWtie8hUrBkt4FZXWPR+O0570XBAupu//+p1mWVSK71G
         sTx0cUXXw7EQ2Twy3f14nbvoAz6yRU4LwzZYOI1tyjmVdfwOL32P/ZNpdyXlGgOBrkDY
         oRjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755069143; x=1755673943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VWPiGwWfBEJW/FZCt5d/z5EjuXmbgn85aGTiP/Idr8Q=;
        b=o0DJzl+EpjJtFvTi2TsZqtcF7lQXxaLv43hjYP+OuDuE8W3LLhOH3cDL4j+xUjBDSW
         Uw9IUz8aAbMgpGUY/ohcCWJI3YCBZpLlsn4m/7j7hGLY3Bq07zYiaMnDtF9hQCnUzPrw
         JGVd03lyGykEBu+zKX+ANsGlioOyqjbPegRFtH5pinAt71Y0+vELLniADqeU3kHGSLrA
         gbLefYiw9vDmWFMGlX7TtwicCMxXXOOe0J7+CV1I0KdqboX1X0/I6ErRD9Ejgszg7ThI
         GiUGTRTBiMUEakugcSGGtj7f3krCbHl37vDaCYlym8JxGNfXaMQDxC2+dIxhQdgMum3Z
         0q9g==
X-Forwarded-Encrypted: i=1; AJvYcCX0HOL6mmWeW99uliZnAD+9K28pzeV4g7oOHQm6icRtgVenUYzNTn51NOKs+XFLzIHkncv1QNv20XWm@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9tWNOYhaZLMt2pXdGKD8Nl2tYoluqsa21FiDu7bl9U4IR1b+6
	RImUEHEhkc/hflzxyVPk0CpV5/Egmg5eO5Q3QthGhJSkUdIQKDPXKDQ9+4oLk++ZObI5HDNcZJ0
	GhNIVbpufLqcYyNefULDVkExnm6n7kAwSIW8UwydhOQ==
X-Gm-Gg: ASbGncvfwIB6V1TZ2KzaPXp2HA3PYGwNpCXCEkavMogwveo1ub/toDdT008iRe+Umkw
	6PoYAALmHXOwByrLisSVmSYVQE64l4HtoW29JZDyzGcc9OeXl+86FaVUrzFums1GoSTclMhnBkf
	X9aENUom/BTPpx9yOfxa7Um6zmoLaSr+IIkS9nznbQfTcGZJpWMMcY84gjnXFGIiEt9oqByMgmF
	XYuuIp1c6WkGAOaqLyzXIGa5t8AcCaaQaC04JA=
X-Google-Smtp-Source: AGHT+IEP/BH9YgeD5/2u+GhxraKte5rtGWRbS02tDM/o7rZ8tfv3Rv+mEUtXyqss9N0cm6O4umgwPhwPE9lYYcLH0mM=
X-Received: by 2002:a05:6512:138a:b0:549:8b24:989d with SMTP id
 2adb3069b0e04-55ce0091722mr614970e87.0.1755069142615; Wed, 13 Aug 2025
 00:12:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812-rust-1-0-0-release-v1-0-372d698f23e8@linaro.org>
 <20250812-rust-1-0-0-release-v1-9-372d698f23e8@linaro.org> <DC13RWRXSOVL.4J9R43495IEN@riscstar.com>
In-Reply-To: <DC13RWRXSOVL.4J9R43495IEN@riscstar.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 13 Aug 2025 09:12:11 +0200
X-Gm-Features: Ac12FXzEkxxWh1D45ksfjMXtcqhGtRxqe3yVzFj5A_J9Hzy-yvs8iFTxCaQIay8
Message-ID: <CAMRc=MfMxkJgccb1pez-30yqtGXRVPEDxRGVstik5yEwSofTTg@mail.gmail.com>
Subject: Re: [PATCH libgpiod 09/10] bindings: rust: update rust version
To: Erik Schilling <erik@riscstar.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 13, 2025 at 8:57=E2=80=AFAM Erik Schilling <erik@riscstar.com> =
wrote:
>
> On Tue Aug 12, 2025 at 2:10 PM CEST, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > With all previous fixes to rust bindings, we can now update the rust
> > version and required edition to 2024.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  bindings/rust/libgpiod-sys/Cargo.toml | 4 ++--
> >  bindings/rust/libgpiod/Cargo.toml     | 4 ++--
> >  2 files changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/bindings/rust/libgpiod-sys/Cargo.toml b/bindings/rust/libg=
piod-sys/Cargo.toml
> > index 7fb5c174ec8186b6ef8cd64e1e6f25a13bd0dcd3..ab86ff8ecf871bfc3f931f8=
ea08490c4eb40eee6 100644
> > --- a/bindings/rust/libgpiod-sys/Cargo.toml
> > +++ b/bindings/rust/libgpiod-sys/Cargo.toml
> > @@ -9,10 +9,10 @@ authors =3D ["Viresh Kumar <viresh.kumar@linaro.org>"=
]
> >  description =3D "libgpiod public header bindings"
> >  repository =3D "https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.=
git"
> >  categories =3D ["external-ffi-bindings", "os::linux-apis"]
> > -rust-version =3D "1.60"
> > +rust-version =3D "1.86"
> >  keywords =3D ["libgpiod", "gpio"]
> >  license =3D "Apache-2.0 OR BSD-3-Clause"
> > -edition =3D "2021"
> > +edition =3D "2024"
> >
> >  exclude =3D [
> >      "Makefile.am",
>
> Is there a particular reason to to pick this specific rust-version? This
> essentially sets the floor of the MSRV (Minimum Supported Rust Version)
> of this lib.
>
> That means that it won't build with any older Rust version, which may
> impact users of the lib that are still lagging slightly behind?
>

I'm probably talking nonsense right from the top of Mount Stupid[1]
here but is this bad in rust? With the ease of updating everything via
cargo, I figured requiring the most recent version makes sense? I'll
defer to you as you have way more knowledge on this subject, so tell
me if I should drop this.

> I would only bump this if our libs start to require it (or we use new
> features ourselves). So I think we should spell out which libs/features
> mandate this bump in the commit message and only update as high as we
> need to.
>

Nobody requires it AFAICT.

Bart

[1] https://commons.wikimedia.org/wiki/File:Dunning%E2%80%93Kruger_Effect_0=
1.svg

