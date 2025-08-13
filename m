Return-Path: <linux-gpio+bounces-24349-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4D7B24441
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Aug 2025 10:26:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D0983AE018
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Aug 2025 08:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5D642DE1F0;
	Wed, 13 Aug 2025 08:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="u1GLJcNv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627C22690D9
	for <linux-gpio@vger.kernel.org>; Wed, 13 Aug 2025 08:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755073486; cv=none; b=krEn7PUg+w0P9pibmLHpSSdhZ+M+wV+y5EelJ2Ln+ysM65dVyrB36sb/1Am7N9GXgAiPqTza2QR5PrVutsSj1oHHGKcjGe7q8whq0Cwo5xzX2jLCosuNZsFO6NdMv37OZgYNRxef3gLtlhnEuAo+za84IM/V0BNwywulIhLPcns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755073486; c=relaxed/simple;
	bh=fPPPFXW/tYM9kF26i0eF7RFPV/cnFdjMKPFO7+n9OWQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=mkzowajzjSyTg4XlLoFO0A6/ObBGSlm2lB3XOQ3OO7Dcgabwal4q5ilrXxEdcTkov1jpkfz6r2aWPfHIezUAyrD0/oPNPXQmRC8xlb63GbdlDIuOk3AWgury6d6g+3IRHNoH/lrKRZHSGQd+JQ1OOmyh2ImiBgKfWt2Dakd80hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=u1GLJcNv; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3b78a034f17so4779095f8f.2
        for <linux-gpio@vger.kernel.org>; Wed, 13 Aug 2025 01:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755073483; x=1755678283; darn=vger.kernel.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xzEoFWh5ce1XIa6LviVzlTzjgP2qkFZB74ddxoIb5gQ=;
        b=u1GLJcNvvjZ3TkuEGPTWERY1CcqRLABUccHXvA+mFMccCduzdWGOGVCD4htPGtoYZ7
         j5q9jZdEF1MDOU+q0qjzrJjpj6uyhJoa2qOfr0+Ab9nFGRAJ7lvHNQnYWxRiF0eah65M
         BcQ9s2pO2oVh+h0/6pi2zBOJKyF8imoZTMYuMKAx3xxt2Lv9hxOAMpDqWlw41PPkRNC8
         YjKeQPAdRz4cUOdvum0iBQJMk6OlV/8Cud3rvVWJcpcvpFtuQdTYfchI+XHc+3iuXAeX
         7N1gb3xiK0f3w9Lvdt6mumUsNLBKPwMwYj1WYdl9sfB+bhqANFMqxJ1uRPemgv6WZPpz
         DkbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755073483; x=1755678283;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xzEoFWh5ce1XIa6LviVzlTzjgP2qkFZB74ddxoIb5gQ=;
        b=WJvI+9YEOUZ6EC2H9PDqS9NmxsjFBeSeEylb9qLeYwtK8+QtWFfiq0fugdd9F9tsTH
         z+agJgfxA0/nN5qT66MWuf3AY9iCz3bmu6hg1a5sjpuCEqQ3yBJg/SoPQ/b9K5/Sjg23
         egXxY7RV+3hmBx+elxKEFsOFb/kGwURoQ9nBdAZfzfdw/stRfXiZd98vW+A078+j6kEa
         RE1QzKTE202kTHodiVQFqUxI6z0LpjaYqxkkuQMkkKotdn7KSPxLKBNpaHcFFHQoTB1r
         sjXuEfbX0DOgAAETMTN+vXhobDSWykx3sSwlzN1gw0dYUoubO5MrfNGFimuJiEHXYuhr
         hH4w==
X-Forwarded-Encrypted: i=1; AJvYcCXdnvJuJU6+IjVQ1PehK5sMcuAYSKCW6rGtEka+0d6sNF6dp3y5n+v1WgstZl4v3P6nXqajxkqEms5L@vger.kernel.org
X-Gm-Message-State: AOJu0YyiDC4diHS/BjK8aYLeC3Fa/XXGjECQWqOSH9ox80L/UYLP5X2x
	OeuoNtcCFLbNfmGD02UxDaIgz3ut26OQBJ9Qbl6mVBtx1TjNUcyi4KmVKd1j4qv3dNi8F0ZFf75
	CUWc3
X-Gm-Gg: ASbGncuZ8xDobACmAfx/Gt6r7ci5C8hwW+dCNO0r/Ek+tZX1gIROUz/8nkfGVgWjLkz
	tHj1jYu9J8AEsji8qh0ai5GkvIR7C8ps69qeTpOrlQGrLuys0I69BQ8MMk/tT7Mu6RaWGjEj2Bm
	hlP5l8WhG4txdmh8+n+lyJtH4Oy78sr4sN5yofHtuyCsBuuj48RurbgOFeCDwbpkZ3gfzUL0ZrB
	+EFRMAuYsJ6Lk78QlcK4UvyEo0E4b3z6RkhQJgIZta7mIS5lke5PEIrFNLa5q+axxdbZSALu+8P
	TrZiUjUEgGJibyR/WO6p1yR3hYuq+JdZje5aP/rRZ1vRDs50ceHeup+alzV83sTT0odq7Qs5CQ=
	=
X-Google-Smtp-Source: AGHT+IEeN1jLL5+9F6v3iPgfACgLx4XJsWmm0CLK5HZvO2NKk4k4Y7C1EXVMoFhmOKH5gpXod9TqHw==
X-Received: by 2002:a05:6000:290d:b0:3b7:81a6:45c1 with SMTP id ffacd0b85a97d-3b917e76ec8mr1436798f8f.6.1755073482588;
        Wed, 13 Aug 2025 01:24:42 -0700 (PDT)
Received: from localhost ([2001:9e8:d5b4:9700::f39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a16dfdd6esm19718615e9.27.2025.08.13.01.24.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 01:24:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 13 Aug 2025 10:24:41 +0200
Message-Id: <DC15MIT9LAT0.4JYFP0I7YGIK@riscstar.com>
Cc: "Viresh Kumar" <viresh.kumar@linaro.org>, "Linus Walleij"
 <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>, "Bartosz
 Golaszewski" <bartosz.golaszewski@linaro.org>
To: "Bartosz Golaszewski" <brgl@bgdev.pl>
From: "Erik Schilling" <erik@riscstar.com>
Subject: Re: [PATCH libgpiod 09/10] bindings: rust: update rust version
X-Mailer: aerc 0.20.1
References: <20250812-rust-1-0-0-release-v1-0-372d698f23e8@linaro.org>
 <20250812-rust-1-0-0-release-v1-9-372d698f23e8@linaro.org>
 <DC13RWRXSOVL.4J9R43495IEN@riscstar.com>
 <CAMRc=MfMxkJgccb1pez-30yqtGXRVPEDxRGVstik5yEwSofTTg@mail.gmail.com>
In-Reply-To: <CAMRc=MfMxkJgccb1pez-30yqtGXRVPEDxRGVstik5yEwSofTTg@mail.gmail.com>

On Wed Aug 13, 2025 at 9:12 AM CEST, Bartosz Golaszewski wrote:
> On Wed, Aug 13, 2025 at 8:57=E2=80=AFAM Erik Schilling <erik@riscstar.com=
> wrote:
>>
>> On Tue Aug 12, 2025 at 2:10 PM CEST, Bartosz Golaszewski wrote:
>> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>> >
>> > With all previous fixes to rust bindings, we can now update the rust
>> > version and required edition to 2024.
>> >
>> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>> > ---
>> >  bindings/rust/libgpiod-sys/Cargo.toml | 4 ++--
>> >  bindings/rust/libgpiod/Cargo.toml     | 4 ++--
>> >  2 files changed, 4 insertions(+), 4 deletions(-)
>> >
>> > diff --git a/bindings/rust/libgpiod-sys/Cargo.toml b/bindings/rust/lib=
gpiod-sys/Cargo.toml
>> > index 7fb5c174ec8186b6ef8cd64e1e6f25a13bd0dcd3..ab86ff8ecf871bfc3f931f=
8ea08490c4eb40eee6 100644
>> > --- a/bindings/rust/libgpiod-sys/Cargo.toml
>> > +++ b/bindings/rust/libgpiod-sys/Cargo.toml
>> > @@ -9,10 +9,10 @@ authors =3D ["Viresh Kumar <viresh.kumar@linaro.org>=
"]
>> >  description =3D "libgpiod public header bindings"
>> >  repository =3D "https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod=
.git"
>> >  categories =3D ["external-ffi-bindings", "os::linux-apis"]
>> > -rust-version =3D "1.60"
>> > +rust-version =3D "1.86"
>> >  keywords =3D ["libgpiod", "gpio"]
>> >  license =3D "Apache-2.0 OR BSD-3-Clause"
>> > -edition =3D "2021"
>> > +edition =3D "2024"
>> >
>> >  exclude =3D [
>> >      "Makefile.am",
>>
>> Is there a particular reason to to pick this specific rust-version? This
>> essentially sets the floor of the MSRV (Minimum Supported Rust Version)
>> of this lib.
>>
>> That means that it won't build with any older Rust version, which may
>> impact users of the lib that are still lagging slightly behind?
>>
>
> I'm probably talking nonsense right from the top of Mount Stupid[1]
> here but is this bad in rust? With the ease of updating everything via
> cargo, I figured requiring the most recent version makes sense? I'll
> defer to you as you have way more knowledge on this subject, so tell
> me if I should drop this.

It certainly is a lot less of a problem with Rust. But projects may
still be lagging behind a few versions if they have some dependency
problems. Rust through rustup is also not the only option of consuming
Rust. One could also work with a Rust toolchain from Yocto and be stuck
with an older Yocto version.

>> I would only bump this if our libs start to require it (or we use new
>> features ourselves). So I think we should spell out which libs/features
>> mandate this bump in the commit message and only update as high as we
>> need to.
>>
>
> Nobody requires it AFAICT.

If we still build and `cargo test` fine with 1.60, then I would keep
that version :). Once our dependencies start demanding newer versions
we can update (to the lowest version that the union of our dependencies
still supports).

Or phrased differently: No need to make our work harder by sticking to
old dependencies. But no need to prematurely raise the version floor
too.

- Erik


