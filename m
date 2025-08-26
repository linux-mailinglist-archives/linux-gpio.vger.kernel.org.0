Return-Path: <linux-gpio+bounces-24994-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE83B371F1
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Aug 2025 20:08:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 837EC7ADB94
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Aug 2025 18:06:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 674B42F3603;
	Tue, 26 Aug 2025 18:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="aXjVXP6u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17262E7BD3
	for <linux-gpio@vger.kernel.org>; Tue, 26 Aug 2025 18:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756231677; cv=none; b=sgJhF5qZ7EdSE8r6yRq7RxguZ7O3sXqUTbpFn6hCQG+/Anu+KPc6KwZ55/DD04dL3pdUTr+rABlet1AjHbehOsvlTzukQBOiD3MFIME2PvbVwx0yp0DfFuAi9uEQp+1E7NrXsudLCGlYsjC5kpJl6dUtg9B0CK2PU6cAnSyTyII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756231677; c=relaxed/simple;
	bh=NmO9dLWIUn4itI8iOmbfTX2wpUcwBgnwHVDsg/q2PY8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ugy9qErHwWusIjcXZ6xuPVz4y149/VSTQRjcKbotgcU8K9P0OOp6fRg1FJyamuPlghcMfCD4PlJUyxilldDPCOsqgmAx04s7QpTicP86u4yXTocxkbWcwB71Ha9TlRPJ2iqugivOLHVL+ZbYvV5TRVt7cb5hRZyGXRFdphFilTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=aXjVXP6u; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-55f48cb7db9so2048235e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 26 Aug 2025 11:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756231672; x=1756836472; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w8Siy35s7cbHTYj8CU9S5aTaDcX6OPRi95cxxPf5r94=;
        b=aXjVXP6u5kGBp0UicIXPXvD/0brqZeJzGTx0EZvII49qwl8RCqMFJ8d6Y9IUT9w/W5
         c02bs4smSA22FSQ8qw1DF3e+n6OGd/ZqnyQmhQKiKpd6X+iF3U7SKzHEk5CVwcF59Ou2
         0p37KQpYVZwSSBNMKQSvgiuGgPpxx5rjfFeex8fM425uxXt9vfwfzDXHv0lIeZnEZSGI
         Xu/Aa4xOPYL4x11/rEvx7b0PhJhQFIUa3flMHtGO1DoV6Ypxr6XWvsPv1Kyjxo/BLhux
         jSycwf+ptrTYBD3Lu9p7ji89uCZBAUxlvLYdRofXE1eQbyui5wnpHWJevWStpvuTVDRV
         C9PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756231672; x=1756836472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w8Siy35s7cbHTYj8CU9S5aTaDcX6OPRi95cxxPf5r94=;
        b=DsP1Icn5Gep0pJph7XnQhXaNvflHb26WviKQ1IiyOWKmMH6v8lgdpXaUp/4gMhkeMQ
         zLhtIY44rQ+rmlFi0LR66U7wUW9P37+oH5WL1XD7JY47II3B6mo2RZEt9SqpeQuHQ5O6
         XWcXTRiuSE6MxN1Om3Mk1BoIWuFObl3GKJyu3iw2XMZQC7RS/KicGfDaum1j9zdIWAnd
         i30wDY1+awRdv3Ws5BZS8GWavew5V6m/SoAKKJjFYlda/LAitbNiSqf6qt9gobHgXHRW
         PqffKb1XA6eE7WT3B8hqksSbTwp3wI7RJ1U+oDqAXJpKLn0uIhN7MnxDR8FSg5ARBgm/
         FEJw==
X-Forwarded-Encrypted: i=1; AJvYcCVJGtQLSmqZFtzG6r1JJh/Cr6X/3M/mKOorV+7p1WQbUCa8DqMufoX4JrBcGU26jDIjGy5oeam0des1@vger.kernel.org
X-Gm-Message-State: AOJu0YyBIwwKGetzCg0mlvJhU3AbDPUk9uZYq9zvr4NscdIv+rYlOppn
	T6AKrmsH9RX+/B2o+OQjPiDULQLtzkzF7wPM8rFyeaY+GNc5E8PsmUkDq/fJR8VSxKb32c5dSnd
	w5/PJVA2pPYw34EpGk1dWtWng1ebCfef9tFSGx5MGHyxYbF51E7Fb
X-Gm-Gg: ASbGncsRIG7WNJaMWF/ty4WbjVWZ4462/oj6dN+FCdWpEHpVw2Bh4bgdZ3TSXuFyDWz
	MiQrZnvKJDtd3oOr32YhcSAauYBWqS0OKOlGI5yXpGOOdOejajTT9qB2F95N/pYSWzYLiwUWX2l
	o3U+kUGgoYD9zFN/RdRZNo6Gx5j6CdHMsngNZY12yr+9tantGnG55s69AtP+sSPcaNxeIfSv2OK
	RrRMn0IMKLI0cXUSp63xeQj4RG8lxGH/9XNEFYtPlb2N0k2hA==
X-Google-Smtp-Source: AGHT+IFrfHGLfcI7gdNA0xmWQEN7JwAoGu9XAMz/IDyl7QsZzJ5Kn6CC1X+lebP3+T0CypOUCdgyHNcvzCtZyaaIx8M=
X-Received: by 2002:a05:6512:2284:b0:55b:8273:5190 with SMTP id
 2adb3069b0e04-55f0ccc4276mr4518216e87.18.1756231671868; Tue, 26 Aug 2025
 11:07:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250815-rust-1-0-0-release-v2-0-b1794cb4b9be@linaro.org> <DC5DIAHI710X.1S8GSFCJJKWHS@riscstar.com>
In-Reply-To: <DC5DIAHI710X.1S8GSFCJJKWHS@riscstar.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 26 Aug 2025 20:07:40 +0200
X-Gm-Features: Ac12FXzza8_tEDUD9B3sUe7q2_q9XINOLwYHVjEXD3RGsi51Xs-pj0XR2bWZKoU
Message-ID: <CAMRc=Md1z4-bOccz1hQHZpGZQw0+cQ6zK8aOPUkbot+vCiKb9Q@mail.gmail.com>
Subject: Re: [PATCH libgpiod v2 0/9] bindings: rust: prepare v1.0.0 release
To: Erik Schilling <erik@riscstar.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 18, 2025 at 9:26=E2=80=AFAM Erik Schilling <erik@riscstar.com> =
wrote:
>
> On Fri Aug 15, 2025 at 10:57 AM CEST, Bartosz Golaszewski wrote:
> > The libgpiod rust bindings interface has stayed quite stable over the
> > last months so it's time for it to stop being a v0.x release and become
> > officially carved in stone. Bump dependencies to the most recent versio=
ns
> > available, fix some issues and then bump versions of the crates ahead o=
f
> > the official release.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> > Changes in v2:
> > - drop the patch bumping the minimum required rust version
> > - loosen the requirements on the dependency versions: specify only the
> >   major number for stable crates and the major.minor for unstable ones
> > - Link to v1: https://lore.kernel.org/r/20250812-rust-1-0-0-release-v1-=
0-372d698f23e8@linaro.org
> >
> > ---
> > Bartosz Golaszewski (9):
> >       bindings: rust: make Buffer::read_edge_events() lifetimes more ex=
plicit
> >       bindings: rust: add missing unsafe block ahead of rust version bu=
mp
> >       bindings: rust: update bindgen dependency
> >       bindings: rust: update errno dependency
> >       bindings: rust: update cc dependency
> >       bindings: rust: update system-deps dependency
> >       bindings: rust: update thiserror dependency
> >       bindings: rust: update intmap dependency
> >       bindings: rust: update crate versions to v1.0.0
> >
> >  bindings/rust/gpiosim-sys/Cargo.toml       |  8 ++++----
> >  bindings/rust/gpiosim-sys/build.rs         |  2 +-
> >  bindings/rust/libgpiod-sys/Cargo.toml      |  6 +++---
> >  bindings/rust/libgpiod-sys/build.rs        |  6 +++---
> >  bindings/rust/libgpiod/Cargo.toml          | 10 +++++-----
> >  bindings/rust/libgpiod/src/event_buffer.rs |  2 +-
> >  bindings/rust/libgpiod/src/lib.rs          |  4 ++--
> >  bindings/rust/libgpiod/src/line_config.rs  |  2 +-
> >  bindings/rust/libgpiod/src/line_info.rs    |  2 +-
> >  bindings/rust/libgpiod/src/line_request.rs |  4 ++--
> >  10 files changed, 23 insertions(+), 23 deletions(-)
> > ---
> > base-commit: cd32f27dd550753488bff4918aef4e230ce01512
> > change-id: 20250811-rust-1-0-0-release-65342607040e
> >
> > Best regards,
> > --
> > Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Trying to build with the 1.60 that we claim as lower floor gives me:
>
>     > cargo +1.60 build
>     [...]
>     error: package `bindgen v0.72.0` cannot be built because it requires =
rustc 1.70.0 or newer, while the currently active rustc version is 1.60.0
>
> With 1.70 I get:
>
>     ~/projects/libgpiod/bindings/rust (master)> cargo +1.70 build
>     [...]
>     error: package `system-deps v7.0.5` cannot be built because it requir=
es rustc 1.78.0 or newer, while the currently active rustc version is 1.70.=
0
>
>
> 1.78 builds fine (when having cfg-expr pinned to a pre-2024-edition
> version).
>
> So we will need to bump the MSRV to at least 1.78. The critical path
> seems to be cfg-expr -> system-deps where cfg-expr seems to be extremely
> aggressive with updating it's MSRV...
>
> 1.78 with a release in May 2024 looks reasonable to me.
>
> Otherwise this looks good to me!
>
> - Erik
>

Am I getting this right, should I bump min rust version to 1.78 but
leave the edition at 2021? And what does "pinned to a pre
2024-edition" even mean?

Bart

