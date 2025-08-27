Return-Path: <linux-gpio+bounces-25029-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C398B3842F
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Aug 2025 15:58:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49D455E40F0
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Aug 2025 13:58:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBCDD356900;
	Wed, 27 Aug 2025 13:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="lujgDGU7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1731D7E41
	for <linux-gpio@vger.kernel.org>; Wed, 27 Aug 2025 13:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756303087; cv=none; b=I4B00vByzjmUrUekmQRZ50ulY98tV2gqkaSMsQ6rpVjth+yTZlLr3IMuEPoulesTol9qb799Q5gooYOAwGut7T/S/rL3LZbnb+YE+llB5LRYZO3QurtzuNj6JVU4V6TnY35yMDHLkQOEhxnpfyX3NOgwYJuuWUS0qQY+G9h4SSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756303087; c=relaxed/simple;
	bh=BuhD9i73b33RJI/Q5QgA4rRdLoOq8zORuCEU/DoQ854=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FQObYgEu0VzqTEX9onVXBEm2UJrP/jNzLZaTtE7IZNYiajBOf/cpdhDvsZLaY+jbEPWyLO3ZZU7TbuYb/msxaAGgHeuNCdRazVEKSEM44VvvJE22Z3raLIb3Qk/6STDXJMTClcPavYhHqoPPq5F7WpPwIA+r4myW1eDTlCkhm6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=lujgDGU7; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-55f3ec52a42so4533980e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 27 Aug 2025 06:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756303083; x=1756907883; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/mYj0HfYjUoxmY2B16YlwXnJdorEa2PJpiX+01qfMVw=;
        b=lujgDGU7dRxgCFst6ObIQWzUIM/hMiMAAhuqRjgMfdwy7nuBK103E47PT24ayJiCf0
         shs2ojEDvw/NLgMFq8AOEHJGHSmwq7JzQsVqpFmzm/2GWcdNRTg3pT+k/qAqjYztbhrU
         DWNK1WIQVWy+hxSDXc9FTRt2BncnYi4oCtHDdPKNUiIt7Xuqq9R3EixJYMQIM6M/J7ec
         l/FrZJ9Z3Qe0k1o2jg6rJw6apkPPtaKH/kC2eUpjceKO0NH/3nIWJmrAn/RiLLfE4snR
         cngrmxIH7apwx/HE1cMjD9QwwOUsZyuiLY1ujOFaXKstE7k0T8xOnFMf7tWHYuU/uQ9V
         sRpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756303083; x=1756907883;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/mYj0HfYjUoxmY2B16YlwXnJdorEa2PJpiX+01qfMVw=;
        b=tEuQK401hjCHFj1JhezIXxFt2DXuWN+jH7aHA3ENdTIivnLcbcG4Wh+QM/OiJ1uHtD
         NnaM5Fw3ET1Nj4dcS42PuMvYSSOEM6fRhOfc9bIWPWQjw6bpgvnkSrT9XY0Ce6sEJB8g
         4KFNkmFPcfF1kEScNLZusrIkxwYIYQvHFi64vEMssSyIojSi5pkM7u2ZYXKKXlyE4Wlr
         d+PQoI8ZT6l9VZAWbG5H+4/gPOqj5GPqAA0UjcwiMBHcymRZ9wc5Es+B3PIHF+6a8bcr
         0/eMJkHvT71gzKn175Z4zABVfLGdhQaIsQzGZjFR+wf7eN3W63CQSVIxRGw5U0HLTqO3
         e48g==
X-Forwarded-Encrypted: i=1; AJvYcCXoabjoit0pBnR8tYU5RCRrB3tGdcE8dvEOXQyExXRJmLDcG+iWJqk6lgkm2aLjEv5SPdGJKMuMgpar@vger.kernel.org
X-Gm-Message-State: AOJu0YwFTFnRiqys9eJRnDai//jITFEvq1FTFAqsYr1EWPRMnu8j9T9c
	Q+jRmwB8K5fngG+7mQVTierPgTHn8jLLZ3Z2u1xyXxwwLWyXmHpXURkdLuy33QwUkAZqpMn2OA3
	EkG9rzmQHRvhRaX5q9ScC3kPUugS1JUv1dXZg02UibA==
X-Gm-Gg: ASbGncvp/PhQpQpByOG5R25/wF6SA8djLAPF64drLlgLVH0wA+WKk6rpDNzIcw7oxCn
	T+1wLR1vfEpM5rpJP0puGgry0gYqeoffVoKx5parSfMzrI6Gk04PtEI1fwwpVaeaAFR7MkswgQf
	exP4QP3TaT6LNOxegGjJJ0f87cqMeAyqSAjbZL6Y6wM3YsKDZyAFwIAlWaejKAjBFzMOwbs1wzf
	8b3uxVYwYGOZQyE+einCyxV+nknYTRCY4EZ/V0=
X-Google-Smtp-Source: AGHT+IFTmYZlRxZiJUklK0yh9deFBPPU9UUW5J4N7L6UwTScdGR83xvitQKGLP/6UUD9S5xzNU1zAojs1wzOyyoiE5s=
X-Received: by 2002:a05:6512:2446:b0:55f:57b8:7730 with SMTP id
 2adb3069b0e04-55f57b87a31mr457392e87.4.1756303082580; Wed, 27 Aug 2025
 06:58:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250815-rust-1-0-0-release-v2-0-b1794cb4b9be@linaro.org>
 <DC5DIAHI710X.1S8GSFCJJKWHS@riscstar.com> <CAMRc=Md1z4-bOccz1hQHZpGZQw0+cQ6zK8aOPUkbot+vCiKb9Q@mail.gmail.com>
 <DCD03E16WQCF.3GNFYSET3B9QU@riscstar.com>
In-Reply-To: <DCD03E16WQCF.3GNFYSET3B9QU@riscstar.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 27 Aug 2025 15:57:51 +0200
X-Gm-Features: Ac12FXyqiPG2rQLiIC1q3RvXwX9LKMimCl3eaO4taJOQapavNSyogrfdlF0p55g
Message-ID: <CAMRc=Mf8ii0AxPnDLJWRKyrbjcMZeBe7YAThowkSR9EpVc8+WQ@mail.gmail.com>
Subject: Re: [PATCH libgpiod v2 0/9] bindings: rust: prepare v1.0.0 release
To: Erik Schilling <erik@riscstar.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 27, 2025 at 8:36=E2=80=AFAM Erik Schilling <erik@riscstar.com> =
wrote:
>
> On Tue Aug 26, 2025 at 8:07 PM CEST, Bartosz Golaszewski wrote:
> > On Mon, Aug 18, 2025 at 9:26=E2=80=AFAM Erik Schilling <erik@riscstar.c=
om> wrote:
> >>
> >> On Fri Aug 15, 2025 at 10:57 AM CEST, Bartosz Golaszewski wrote:
> >> > The libgpiod rust bindings interface has stayed quite stable over th=
e
> >> > last months so it's time for it to stop being a v0.x release and bec=
ome
> >> > officially carved in stone. Bump dependencies to the most recent ver=
sions
> >> > available, fix some issues and then bump versions of the crates ahea=
d of
> >> > the official release.
> >> >
> >> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >> > ---
> >> > Changes in v2:
> >> > - drop the patch bumping the minimum required rust version
> >> > - loosen the requirements on the dependency versions: specify only t=
he
> >> >   major number for stable crates and the major.minor for unstable on=
es
> >> > - Link to v1: https://lore.kernel.org/r/20250812-rust-1-0-0-release-=
v1-0-372d698f23e8@linaro.org
> >> >
> >> > ---
> >> > Bartosz Golaszewski (9):
> >> >       bindings: rust: make Buffer::read_edge_events() lifetimes more=
 explicit
> >> >       bindings: rust: add missing unsafe block ahead of rust version=
 bump
> >> >       bindings: rust: update bindgen dependency
> >> >       bindings: rust: update errno dependency
> >> >       bindings: rust: update cc dependency
> >> >       bindings: rust: update system-deps dependency
> >> >       bindings: rust: update thiserror dependency
> >> >       bindings: rust: update intmap dependency
> >> >       bindings: rust: update crate versions to v1.0.0
> >> >
> >> >  bindings/rust/gpiosim-sys/Cargo.toml       |  8 ++++----
> >> >  bindings/rust/gpiosim-sys/build.rs         |  2 +-
> >> >  bindings/rust/libgpiod-sys/Cargo.toml      |  6 +++---
> >> >  bindings/rust/libgpiod-sys/build.rs        |  6 +++---
> >> >  bindings/rust/libgpiod/Cargo.toml          | 10 +++++-----
> >> >  bindings/rust/libgpiod/src/event_buffer.rs |  2 +-
> >> >  bindings/rust/libgpiod/src/lib.rs          |  4 ++--
> >> >  bindings/rust/libgpiod/src/line_config.rs  |  2 +-
> >> >  bindings/rust/libgpiod/src/line_info.rs    |  2 +-
> >> >  bindings/rust/libgpiod/src/line_request.rs |  4 ++--
> >> >  10 files changed, 23 insertions(+), 23 deletions(-)
> >> > ---
> >> > base-commit: cd32f27dd550753488bff4918aef4e230ce01512
> >> > change-id: 20250811-rust-1-0-0-release-65342607040e
> >> >
> >> > Best regards,
> >> > --
> >> > Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>
> >> Trying to build with the 1.60 that we claim as lower floor gives me:
> >>
> >>     > cargo +1.60 build
> >>     [...]
> >>     error: package `bindgen v0.72.0` cannot be built because it requir=
es rustc 1.70.0 or newer, while the currently active rustc version is 1.60.=
0
> >>
> >> With 1.70 I get:
> >>
> >>     ~/projects/libgpiod/bindings/rust (master)> cargo +1.70 build
> >>     [...]
> >>     error: package `system-deps v7.0.5` cannot be built because it req=
uires rustc 1.78.0 or newer, while the currently active rustc version is 1.=
70.0
> >>
> >>
> >> 1.78 builds fine (when having cfg-expr pinned to a pre-2024-edition
> >> version).
> >>
> >> So we will need to bump the MSRV to at least 1.78. The critical path
> >> seems to be cfg-expr -> system-deps where cfg-expr seems to be extreme=
ly
> >> aggressive with updating it's MSRV...
> >>
> >> 1.78 with a release in May 2024 looks reasonable to me.
> >>
> >> Otherwise this looks good to me!
> >>
> >> - Erik
> >>
> >
> > Am I getting this right, should I bump min rust version to 1.78 but
> > leave the edition at 2021?
>
> Yes. The 2024 edition came with 1.85. So neither our libs nor we
> ourselves require that yet. But we _do_ require 1.78 with these changes
> now.
>
> > And what does "pinned to a pre 2024-edition" even mean?
>
> The latest cfg-expr version sets edition =3D "2024". It looks like that
> fails the Cargo.toml parse and the rust-version in the .toml does not
> work to restrict the automatic update. To fix that I had to set the
> version in the Cargo.lock file manually:
>
>     cargo +1.78 update -p cfg-expr --precise 0.18.0
>
> This was the last version before the bump to 2024 edition and 1.85 MSRV.
>
> We - as a library - do not have a .lock file. So cargo will try to use
> the latest and greatest. But a consumer of libgpiod will have such a
> .lock file and is still able to build libgpiod with these changes under
> 1.78.
>

Will the user-experience be: build fails -> user needs to manually
downgrade cfg-expr in Cargo.lock -> build now succeeds? That doesn't
sound very convenient and I'm afraid people will just bounce right
off. Am I missing something?

Bart

