Return-Path: <linux-gpio+bounces-14689-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA96A0A821
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Jan 2025 10:58:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B49051616F3
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Jan 2025 09:58:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57CE919C56C;
	Sun, 12 Jan 2025 09:58:05 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B6D2556E;
	Sun, 12 Jan 2025 09:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736675885; cv=none; b=mV0z1BopwkcLdwhdEUallgAu7yfxSzgDxoEKUf7ND35WfUQkmV5FP4MIMgM/Wah2rwXFwbrwwAQKcyNv1Pw4sHx3yWKczwz+pA0Rt2yKGgFCNqdZj7zdw1w2ZKZA0jQWjgPeQ8nr0huwNhEiFko9ovRTR18LwMU43Kp+XcSel4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736675885; c=relaxed/simple;
	bh=7KvxSnuhFDti2Uwn58Kvz8CvZuCBtinYZAF2+ZUyI8g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C3enYSJ29hR1ko6shSzMca3Y/rDcjk+yjPlMVeBWeEUH/iyPuOdxnUNISJzxO7YvDbIYAZcVFTDxeGavanUD8vjV89neWsFWktRoZzKi/n2retsnuqcZckCP66CpiG8wu4yV4MegbjCQIzKXxzdnjvjfT7g0v4XMKnYODDMmmKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-85c5adbca8eso876310241.0;
        Sun, 12 Jan 2025 01:58:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736675881; x=1737280681;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hGQgXmcbcDqcC6F+f/Zsoz3bex/Dx3mFUEHUnu43fxU=;
        b=RD+1BHTv5JtchvswHHKpwDPQghrPkOi2qQrGaQBLpJ2He6jzrHZiCYLbLSuPZU8MB6
         EBqMxQp3UqkudMCQtCqF3FAswlBNHMYvGI4FtvoklIc3BrkRadGLE67EgTjEYWZrv+5T
         bES0tYp3CuWjvXHW7dMhmIcHVXuahIM1GZFOoFig+Acqlz6MwzwZQoWmyO+f3B3gQBsd
         dWNxZ5URmMcPc/CKB3gRmA3bmVHlubI1Ye6FcdOgaqOK1K9vLmVXGRXeK5G1wb+XbrXX
         gRyZYX5IWaYBJw1xsyDHKGN3wz4cQ0VUROynuQom9OdlBVy1k55lq8zFtzo3zWNdHTnJ
         sXGA==
X-Forwarded-Encrypted: i=1; AJvYcCVJZq88AdFZSyuPFk51y2NLRWX1NKD47HBgK1wjnKBCZtNS8tJDK4DztpP7/ac33Q+Z8aIxBBe6+Vpx@vger.kernel.org, AJvYcCWl0oKxuvEguQvbtX22j05KwFjBYm0ntUpRB3reEjwry4A3mgOFVokvzE/GP00rt60PM62m9ZbyMm+Kp33t@vger.kernel.org, AJvYcCXN4UvPRyd9pinxG24ogaeo+QV15Snzt4iA8tpDr3K5DPywEX6+cXh/mXM/foaKvLVDSXegwheDpQb9FA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5+dN+bKyizlb/oebvnpTBfSsHD2wg3uVR0D11/MpeCGwGp3KK
	HzLPcpQYJZoCl1Sey7cwyP/8a1Roey1iBo6pYLAanaZ42tu2DjQnzmfhXj7O
X-Gm-Gg: ASbGnctx4sApkkK4h0AmDGLGcf5MlaNhEPOhjLOkTCQR5ZJcAG2yxP2fBU4zdbCsbZ6
	crrb2EspBI3vHMuGqBztqrxiDmRDv0TWNNAL5Z5AkVDiXijl10wVQbn8qdu6Y71UhEA34Hj6luf
	QH7ykgMPpwVeWjTJ7YjdP/9eb4NkKJB/LdOvAGJztOu56m3H60OW1oXOuuaKQPgh985xK5pVuvs
	RLdJAcW9SJFWeJ6cy5YpFb7Kp4YNoYRB3jioIcOmufb/O/vfR7yQ3+cNS4dsT/9x10n4iK1+M8u
	F8HuNIAA7n2KsDyQn8Y=
X-Google-Smtp-Source: AGHT+IEiVZYWy+QRXeGnCp5hR2vn172ISOgEr9YGptE6aWuYnLCfvdapztLQ7ylhbgpn5YSPo7suFQ==
X-Received: by 2002:a05:6102:1606:b0:4af:af20:516a with SMTP id ada2fe7eead31-4b3d0ef6e26mr14043577137.1.1736675881074;
        Sun, 12 Jan 2025 01:58:01 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b6091da46csm3765220137.28.2025.01.12.01.58.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jan 2025 01:58:00 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-85c5d4f3d58so819259241.3;
        Sun, 12 Jan 2025 01:58:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU86oXsRni3jf+0gpzEW3GSylqMuHwSPeejZ4jYqtE7QComlYzIzmfII2HoRGE3qnH5ouuPwbCfsdSKXNiN@vger.kernel.org, AJvYcCW3/MgV2mrKt57nChwGvE3GCunOWMGVg6RHFCDkwbG/5EHbo+m6TrKoQsQTuITSyxZx9AwvHGWwnLXY4w==@vger.kernel.org, AJvYcCWyGamQ55l4iHwJevzFQEzzkCAYavW5Uwu+9Esn1jj+kc3AuJcXUujyP/CBurh0NdttFuKDtOxp8THy@vger.kernel.org
X-Received: by 2002:a05:6102:2928:b0:4b2:bcea:dce2 with SMTP id
 ada2fe7eead31-4b3d0f1475cmr15316078137.10.1736675880496; Sun, 12 Jan 2025
 01:58:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250110130025.55004-1-brgl@bgdev.pl> <de6b70f2-8fd6-4e2a-a6c1-466698be8a6b@prolan.hu>
 <CAMRc=MckJfEBK_ZUZ31hh7SMdbr4a-vZLtTGDCFttGK65wbXdA@mail.gmail.com>
 <CAMuHMdWhEZ0No8mXdymE8O8+rMCkD2SXAifZwReb1BbfYASOeQ@mail.gmail.com>
 <CAMRc=Me+syDKW6sycGZ86rBJysaccsm3QUYd1+5cnfzRCo6P7A@mail.gmail.com> <9bb482aa-a392-45c2-a21f-d08e5ce3a6e0@kernel.org>
In-Reply-To: <9bb482aa-a392-45c2-a21f-d08e5ce3a6e0@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 12 Jan 2025 10:57:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVrQms38kXjr4df3kJfcoNFm3oEm2Zr0XNuucZwg_VbxA@mail.gmail.com>
X-Gm-Features: AbW1kvZgNoRTqnFF6xxRZKbWKyO1yeLjtXB3D2BYpXY_T3LDYUQjIy-YEw4ooQc
Message-ID: <CAMuHMdVrQms38kXjr4df3kJfcoNFm3oEm2Zr0XNuucZwg_VbxA@mail.gmail.com>
Subject: Re: [PATCH 0/2] gpio: 74x164: use a compatible fallback and don't
 extend the driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, =?UTF-8?B?SiAuIE5ldXNjaMOkZmVy?= <j.ne@posteo.net>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Sat, Jan 11, 2025 at 12:00=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
> On 10/01/2025 15:14, Bartosz Golaszewski wrote:
> >> At24 EEPROMs differ from '595 shift registers in that they provide an
> >> API with multiple commands, and some commands or parameter bits may
> >> differ among different implementations (but usually these differences
> >> are called quirks).
> >>
> >> All '595 (I'm deliberately writing it like that) shift registers
> >> should be 100% compatible, modulo some electrical specifications
> >> (voltage levels, maximum speed, power consumption, ...).
> >>
> >> Interestingly, the driver is called gpio-74x164.c, while no '164
> >> compatible value is present. Most important difference is that the
> >> '164 lacks the output latch, which is used as chip-select with SPI[1].
> >>
> >>>> I'm especially against introducing a new, vendor-specific (On Semi, =
in
> >>>> this case) name; if we really want to introduce a new compatible, at
> >>>> least make it as generic as possible, i.e. `generic,74x595`, or even
> >>>> `generic,spi-shift-register-output`.
> >>>
> >>> If anything, that would have to be the fallback that the driver knows=
.
> >>> The first string in the compatible property has to have an actual
> >>> vendor (I think, I'll let DT maintainers correct me).
> >>
> >> For the inverse operation (parallel in, serial out), there's just
> >> "pisosr-gpio".
> >
> > Ok, I admit I don't know the correct next step. I'll wait for
> > Krzysztof, Rob or Conor to chime in (on the subject of representing
> > reality - the actual manufacturer - in DTS) and then possibly just
> > remove patches 1-2 from my tree.
>
> Well, folks, I don't know the exact device, so maybe there is no point
> in a new compatible if there is a claim all devices have same interface
> and documenting all of them would result in 1000 redundant
> compatibles... but OTOH, that's what we still do with jedec,spi and
> at24, so if we can add specific compatibles for these, we can do same
> also here.

Except that we don't for jedec,spi, unfortunately[1].

At24 and jedec,spi use a complex programming API, with lots of room
for deviation and extension. '595 is a pure hardware part[2]: it is
just a shift register (driven by SPI clock and MOSI) with a latch
(driven by deasserting SPI chip select), without room for deviation.
Anything that behaves differently is not a jelly-bean '595 part.

[1] "[PATCH] dt-bindings: mtd: jedec,spi-nor: Document support for
more MT25QU parts'
    https://lore.kernel.org/all/363186079b4269891073f620e3e2353cf7d2559a.16=
69988238.git.geert+renesas@glider.be

[2] Ignoring the rumor that all Microchip I/O expanders are actually
    pre-programmed PIC microcontrollers ;-)

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

