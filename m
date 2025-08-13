Return-Path: <linux-gpio+bounces-24338-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2055AB24274
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Aug 2025 09:20:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E3BD7254ED
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Aug 2025 07:18:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDD1227280E;
	Wed, 13 Aug 2025 07:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="m1sMdivx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61D51D5CD4
	for <linux-gpio@vger.kernel.org>; Wed, 13 Aug 2025 07:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755069497; cv=none; b=ipQ4bZ1z4WMVTTdtMftEzrmgYKndABOL8hC8Z32ukuZ1eW/dnG9mkFm7oAwINH8i1PZDfI+McGEAya7ptr59C7L2LX8ULJRSNEyfVM8gTFwL6G4NYJLot7Wjxqk9hsX4nw1XsVkCiFj8JIyqboFamXT7GfrPTQ7gZbhzOqedyCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755069497; c=relaxed/simple;
	bh=IfqtVzF2RkuZDCS//c+muvxO35QAiBhNZ+8FUH4Ce1g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oCHxQo6M7QJfYlrSIoxCjdyZUNGz0qiyDJuPLRI9Nc2pMtAPGQ7WxGty+yhVmnumwFZGpFBwIzSL4i1+vg+2e2je3mSytEGynUKb/NGiCf9OpI4Mim1jlt1kkcnfHDqnNpxe7OLrdKOiI5fHXH6B6Phkbz5/c3jti/n3ITSUNYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=m1sMdivx; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-55cd6a56af5so2631320e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 13 Aug 2025 00:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755069493; x=1755674293; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lh2OiFGxwNhjt/iayE7wCjxktaVlwvyurAYlcZc17ew=;
        b=m1sMdivx7quKGDe4+wf/IDykFX/VqonzPfQA0TcCgIJjcYJ03NE7H/bGcu2x1z06yl
         dne8laVewO6YnVIGe1VsiOYia80Fx9m+Jzt3s40UGEt/gcx0CaoNE8jSD59HGpz1VVkV
         4QscoCWSFGlTU/0Q7VU8NKPOsAU99rZBRi4z5R5xSF1aH//yzVQ0HGlfeLrhR6JLRX+Y
         A4Btzlhs219ayfaA4FQ+pcm9Cm0kD6PKBFPyo9769Dzunkxx3tYsZJQH+33oxgy6bCr6
         fX6HpUmnYJZd9L/EbUvKaPpOgW0V+2LGJAGsiYGMpXnWD4Ld4F9O/kMyRzqLT2rUcVUE
         YIfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755069493; x=1755674293;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lh2OiFGxwNhjt/iayE7wCjxktaVlwvyurAYlcZc17ew=;
        b=mxkSdwmLzDdBuPKtXGPs0iGJrd6BZX7DUDvEYLH24rhyfCa0wXg8BazGzlR3/G14L6
         ei0xZJ4ZhsKXY0SurS0FtMtIeD8YIFUehpGBNcDBfhp3jKlSPys1hX6h7qhvTyYRDj8+
         MRUvc7Rf3YMcnTgn817kU6+guLwSJ15FTYcyEWx3kn2BwlHdxyl7L6NqHTvNaKz7am/D
         9YnH3gTc8HuVxtIUeQucRywTXbp74ocvWx/VevhV9WzS1d12bpGXx4Jr8iGYnzYK91H4
         4zZ94WCsw+BPT9RqHm15fAHhoazrJ7mgOV5oMl1UWoI/YxJ5+sJuj3J2ETcoGxAyMh15
         /HMA==
X-Forwarded-Encrypted: i=1; AJvYcCVotXA/OjA0rbr0rn4F5gEK80VWm3NlIHHfHz4N89LMBBqx2hMaxyjCClbAvuUAjXxaw9vQBq1ZVCzK@vger.kernel.org
X-Gm-Message-State: AOJu0YzIkis8SuuMuMTMVXzaYvKs70C2ekBggiRV+vlTOOBMeOAqeyat
	Dlslw2CF7yoFwFN5oCg8SfKntXUaPAcFWtCQH12R3XGLnpOKtEp1iS25i6DJUAmnlkLJUq1W1Yx
	sm5Dre7b9lJbeJKhofm2Iy0vuNV1RJTpeiH2Q8LFL8g==
X-Gm-Gg: ASbGncs61cN9BR0LEQFP7vHr9OnAmfKVkWNnFcVuR2814ilVV7WXeSNsq+wSMW9JN/o
	qSrExyy8qLgsg8o6XF0bGW1P1+iMHXIhoQOjCEVxm6jB/ckHmaR6vNTe2hn0HvPtlQiElLkT0vS
	YN81HWPjUPuP4C0xw1Sk58OkbcGX90R3IdWu548nYgOgn8vmQZfr/wi+Z99RrSFh5gvydhgbXOA
	Qh4qG96uqyrKPjXJx2L8WKyvCnb3e7jNONRwFY=
X-Google-Smtp-Source: AGHT+IFFyPCI9FT2Sr+JPbAfLi9JJmnQtdVP/cjSxjcgMKs2lp1qpkPkKjAnQuF4JmUjbntKQar6dVX4GpYqeBhMsQM=
X-Received: by 2002:a05:6512:ace:b0:553:2d93:d31 with SMTP id
 2adb3069b0e04-55ce013e522mr668587e87.22.1755069491968; Wed, 13 Aug 2025
 00:18:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812-rust-1-0-0-release-v1-0-372d698f23e8@linaro.org>
 <20250812-rust-1-0-0-release-v1-4-372d698f23e8@linaro.org> <DC13QYZSZI3M.11FB0H4NH0O9X@riscstar.com>
In-Reply-To: <DC13QYZSZI3M.11FB0H4NH0O9X@riscstar.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 13 Aug 2025 09:18:01 +0200
X-Gm-Features: Ac12FXzYkGCyYIryRqJipTjtW10N7WYQwZ90jAXxibTrO3gmQGNKWz0-JCsY1JU
Message-ID: <CAMRc=Md7ACESEbp60HtzS-4STev_4Uk8N9EOadXgHdDwivBHHQ@mail.gmail.com>
Subject: Re: [PATCH libgpiod 04/10] bindings: rust: update errno dependency
To: Erik Schilling <erik@riscstar.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 13, 2025 at 8:56=E2=80=AFAM Erik Schilling <erik@riscstar.com> =
wrote:
>
> On Tue Aug 12, 2025 at 2:10 PM CEST, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Bump the errno dependency for gpiosim-sys and libgpiod crates to the
> > most recent version. No code changes required.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  bindings/rust/gpiosim-sys/Cargo.toml | 2 +-
> >  bindings/rust/libgpiod/Cargo.toml    | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/bindings/rust/gpiosim-sys/Cargo.toml b/bindings/rust/gpios=
im-sys/Cargo.toml
> > index 7099abe41226236b9cba70a36643b921021952ee..52ed43410ef5154a57a15e3=
62344347a2b2cee57 100644
> > --- a/bindings/rust/gpiosim-sys/Cargo.toml
> > +++ b/bindings/rust/gpiosim-sys/Cargo.toml
> > @@ -15,7 +15,7 @@ license =3D "Apache-2.0 OR BSD-3-Clause"
> >  edition =3D "2021"
> >
> >  [dependencies]
> > -errno =3D "0.2.8"
> > +errno =3D "0.3.13"
> >  libgpiod =3D { path =3D "../libgpiod" }
> >
> >  [build-dependencies]
>
> Hm. Given that we expose types of `errno` as part of our `Error` struct,

Oh, we do? Is this correct? My habit from writing C libraries is to
hide all symbols coming in from external dependencies.

> one could reason that 0.3.13 is setting a bit arbitrary version floor
> and 0.3 (^0.3.0) would allow uses a little bit more flexibility...
>

Yeah, that's another thing that I wanted to clarify: shouldn't we in
general use just the major version for stable crates (example: version
=3D "1" for a full version 1.2.3) and minor version for unstable crates
(example: version =3D "0.3" for a full version 0.3.2) and let cargo pick
up the most recent bugfix release? That assumes that stable crates
don't break interfaces across minor version and unstable ones don't do
this across bugfix releases.

> But that really only becomes a problem if someone pins this dependency
> to a specific version, which seems unlikely. So I guess this is fine.
>

I'm not getting this one, could you give an example?

Bartosz

