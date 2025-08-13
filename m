Return-Path: <linux-gpio+bounces-24339-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 40282B24273
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Aug 2025 09:20:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C9D3C18944DB
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Aug 2025 07:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88B0A2D238D;
	Wed, 13 Aug 2025 07:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="r8arfGvg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB4826C3A2
	for <linux-gpio@vger.kernel.org>; Wed, 13 Aug 2025 07:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755069553; cv=none; b=sCMPg4swckT8P8CzdCULgSEyfplsw617Isu36PaCI6kZLVzQ+HIB1IHh5BX6D/6JdG39gFzHZShaKmWVPPVn/jSU//0x8NxGnvMQlfwVUu+pftX96BJ/TFg5R+2AZajU2s3TUPebYYgQH3q2Q0JFEXvVJrGkVxyB4OI86Yj5cVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755069553; c=relaxed/simple;
	bh=u5wMrHzAdiNg8Mdpo/Jl6fdGfHNjEsvxon3vtUsOdJs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s/4AVeYSPRRMuiIo12aNCjcHVoGIahQFM6IlQSvodUwC8JPFah7OHTuuB5KaUwjoFr8sejkqagZ3jb81UoleY5lj1W6fwrTdAcsXdORHQ3TYtt3v/0N8Uu7+GP0mcwkeIrxGue5olA1ja8KLhqANYWHYi7fR9MtKqvsg1VRgw6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=r8arfGvg; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-55b8736b1d6so6245060e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 13 Aug 2025 00:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755069549; x=1755674349; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PNFiup5lf28Z4Jd9eiehMsj79VUvMaa029aVcmeb7qY=;
        b=r8arfGvgoZ/hpGRFUf4ZGbQi5nHjrB/gqV1YSiaVoRLfT+Fr+iXGx8dff4+C37nTSO
         2hcW9bhefTdmRO9+MW5IZTQAidLPmGrP/ofZ5xaSJlTDuSE916G0RMJnLctr+Kz0AjB1
         tVSeCFXVgNGHC/95PhE8ig74M6bkki4QYP0Syze5nReoOf2TRvQ6DQ3MP50UT6Se2e8Z
         c2Z/nho5K+8LS4stW1xyg5I2knlIWin0Im87yy0GoJ9Tdgp4wvtgsfC9j7siD/UwOD8f
         Vl81SHKgUKJsFzm1qfTaqCKv4Rr8T/igX/p35AQjNF5xKi6UiTNVf8JAbvpIo47Zux42
         pBfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755069549; x=1755674349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PNFiup5lf28Z4Jd9eiehMsj79VUvMaa029aVcmeb7qY=;
        b=MZQVvD+KzWBXLWj8/eZv54Zm86SquUu00O5gF1Puvxn8SxNSkOAN+zjnw92bKx0A3y
         F2/ZimpJyXvqzUUg0HuFQHO6OkY+fD0nIeboF38eVk2Z27JTpZhPu3VkNwf8rAJ3MdRU
         XMLNAsOlXWy2oB1gooIoELG99mI6a8VqrY+eYa4q2fnKyzYlBWQuetLjWghpsC5d9Llt
         /DHg6nwL7f0r/jQMgs3HIcvmSGdeC9OFcRnVEuRfUStdXeiYlZBV4JSixojcjjJ1zmbZ
         hL9clfZ6h6CSASMj4k90d6moE3sm5yVcU5xoOp1ySZrkdtNM4bafuQFqVcuWogTtZDo9
         UwUg==
X-Forwarded-Encrypted: i=1; AJvYcCWIkdxkPwUbQq5GIJpF1oG8Y5GVAb/jtzNVaNXvfNlJfnhGF5NLeBoe690fhr6QTzhXu3ii9UoIUlXY@vger.kernel.org
X-Gm-Message-State: AOJu0YyZCRYFsuD4ViHQHgPxsMhCCTJU8w6YFa83EUiCgbGT4qbyl7A4
	zIwdTzWMQMa1CkuqwHPiErKkGFdW3NaqJ66IaKhfgNH9BowsaXWTx6oYLJzmaTc3/s0913Y8vZk
	x3t1A4fPC7Sb5wQNGy0CEspOeoHUQy3TgFL6kBbTNpw==
X-Gm-Gg: ASbGncuVf9JYVYhYXD17zdsPjnrpm53RbfPll4uERtw3pPY3yy+RLZtBf3nV9h2P7XO
	ouztoOFZKkAeaVBq2yfYlVVsAQhL0XI6FVF/SgjXISWuY0MWsY0xtYhmhuXWh37H8x1aJMFxi7K
	2BJdj85tiOpQZFOtUNl1HE7kTag5aGzVI3i2iK5SesQ3i5d1Zgs636PLSvUr0ADAeTVdwD4rCZy
	EGZ/DbYK5dvsYRDiz+CEVD5Nl9essnaTkzvZl0=
X-Google-Smtp-Source: AGHT+IEoJ4vecjg6glPSryRe4wL87LTBmrVnt1FqPqxwZ8RNHB2MaLT26a8pZl3YwpMle+sGxv3kXKKMDU7Igd9JB44=
X-Received: by 2002:ac2:4e08:0:b0:55b:830c:b62b with SMTP id
 2adb3069b0e04-55ce01488cbmr737999e87.7.1755069549003; Wed, 13 Aug 2025
 00:19:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812-rust-1-0-0-release-v1-0-372d698f23e8@linaro.org>
 <20250812-rust-1-0-0-release-v1-8-372d698f23e8@linaro.org> <DC13RGU9W9ZT.CZ5AF2NIEABS@riscstar.com>
In-Reply-To: <DC13RGU9W9ZT.CZ5AF2NIEABS@riscstar.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 13 Aug 2025 09:18:58 +0200
X-Gm-Features: Ac12FXwAQGZTybBQhz-03fMGpIDstWArBrF8Mny0cWIdo8PU_gzXo2blAiSU8cA
Message-ID: <CAMRc=Me2GchOakK3Hb9g4MBESqZ_tnO87ycnZ8QUc-rbJib=6w@mail.gmail.com>
Subject: Re: [PATCH libgpiod 08/10] bindings: rust: update intmap dependency
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
> > Bump the intmap dependency for libgpiod to the most recent version. The
> > IntMap type now takes two explicit type arguments for the key and value
> > so adjust the code accordingly.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  bindings/rust/libgpiod/Cargo.toml          | 2 +-
> >  bindings/rust/libgpiod/src/lib.rs          | 4 ++--
> >  bindings/rust/libgpiod/src/line_config.rs  | 2 +-
> >  bindings/rust/libgpiod/src/line_request.rs | 4 ++--
> >  4 files changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/bindings/rust/libgpiod/Cargo.toml b/bindings/rust/libgpiod=
/Cargo.toml
> > index 8b719b7647910269ca2c91fee685da7fcc67feb7..d7fbe7b3669750880b81583=
2a2e5d7c975ed4d7e 100644
> > --- a/bindings/rust/libgpiod/Cargo.toml
> > +++ b/bindings/rust/libgpiod/Cargo.toml
> > @@ -24,7 +24,7 @@ vnext =3D ["v2_1"]
> >
> >  [dependencies]
> >  errno =3D "0.3.13"
> > -intmap =3D "2.0.0"
> > +intmap =3D "3.1.2"
> >  libc =3D "0.2.39"
> >  libgpiod-sys =3D { version =3D "0.1", path =3D "../libgpiod-sys" }
> >  thiserror =3D "2.0"
>
> This lib we also expose types through our public contract. But the
> explcit 3.1.2 floor does not seem to bring any transient bumps of
> rust-version or other libs. So it seems reasonably low-risk.
>

So just: intmap =3D "3" make sense?

Bartosz

