Return-Path: <linux-gpio+bounces-27358-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AA544BF58DD
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 11:40:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E181E4FF7B0
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 09:40:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D505D2EAD16;
	Tue, 21 Oct 2025 09:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Hy+aycos"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3442F2EA726
	for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 09:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761039597; cv=none; b=VSlSD0/NmVIHvcoOhI3B2L/IlkfYtV366dQ8Nmil+66QQfeaJ0wq+YIoL9uowHzLKaK2ZZuklfMuMNW6E5l0P3ITJDeljT7LrxcvqkhCFNSumUGvAn8pm8RRyidmcQk5IyxvZvaEB+6nFwEYBuGiWkbsTtMIyAFlRSNdJJS4NV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761039597; c=relaxed/simple;
	bh=SbwSE0eaGZLqdl1Y98QCAxRyFY0MQhw0U73vrBGwDCE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lOn7Cy0X+4yziPQA2cRgkabc2L+NZeDCj7AVHnU0MU+5ivTu/FmMWdW3Fo/hfgnU9sZyDGMJTThRCUFdnc88H2Xx2ZxC2IVixqezBf7U0pgQ4Xoo4hq1Rh8Z5lGjLvH3IOoRh6jDoZeV5uO+0+NpfERZVfNXRsozjhwu+zc0UQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Hy+aycos; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-57a292a3a4bso6275159e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 02:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761039593; x=1761644393; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SbwSE0eaGZLqdl1Y98QCAxRyFY0MQhw0U73vrBGwDCE=;
        b=Hy+aycos+dzzLA+6O1T8vyh1quN8ragPBL0epIdibqoZZznzbb8eq88XWcGH0/jWvJ
         jMXjtuB983rhtMNE5OfI/eCY++yUyFIIiKpMgSirT6aBR/PnxMvPUglgDIwjpUsWuL8f
         U0vpS3X+bpy0GEJmaYk0NoPdkKiKf2ybCDqIALKt3C9Ufi+LBrikdOoc9jlAQzXw6+90
         CBwFvP8vP1UBgSavH5xhlaoMvuJ3NzbSUOLUdID98qJ8+2zgqxFKal7N+Hd6RKcKcZGj
         qnmygZxmHIYAFMmXpSoCJeA53P5ykhheOxwPIpPFeaCUZLJCMIhIdQdoruWLhnIwZaOU
         wskA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761039593; x=1761644393;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SbwSE0eaGZLqdl1Y98QCAxRyFY0MQhw0U73vrBGwDCE=;
        b=UVmZj+xgUgMAU+83C4ilWIMJGNbE7AFaDxRBeGl33ua7x2ezdzwvUiZov2y6YwNmCZ
         MY7yfcaKIkxivR5AUc5WKFuwP6j6KaJI9IvM7Cp0QAjvXY61xPBVIWwtGDLKDvrQgYX2
         F/eikAWA0JT6r3ZaQ8zFXqrs+cg1R5cSK3724s1hTCiuqGZLfg6+fxm7Ropi0skUe6an
         YpC0cQcLr6posxa0R7+Rl0IjUUMwyFOdUVN7RL4U3f4bVs5pjjZ5JViCI05Xr/2xV3+h
         meB/gt5yyVUL2ye8IpsfVjO3Ex3mr51I/LooxonLbnh6IOpZGOn7dX24qOLe27Plfwl1
         jKqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUe4Mw0akdg5IC+QSgNSSuUgioXPxRJHOlVq8eGWcnb5YyU9OhpEZjb1BsMYEA7h3165FMbLkU6u51q@vger.kernel.org
X-Gm-Message-State: AOJu0YwgWhesdUiVEimzQlE3n8gLaQtlZK7fMWv6+e9C4M+zCylaGsZv
	f764RcSxgoub+CcL9V3nApNoshETBmv8A6o9R4Mv+W+ihY5dTaBVgUI4wwQ3xhn+trc9hUPCAU8
	DjZFWjfFMknencxVyKgbAMpnrgea5YnvcCKPdHAiVPg==
X-Gm-Gg: ASbGncvZrV4qUxaMauqfy68jYoMX5EoyTpdxAXqLk8vrfw74jdLoQh/AvEFfm13ITpL
	JQqgPGTCK1m+v3AcEIhsgwnejIBkfZbgdwmKaKgpkunBL+tIfY8uDwwiJDvFH3kbfaf11hGp5Nh
	D1PJ7Q1UALyOXVVm3nI/tdnYYvbLfyyf9sDYkmrsdu87TZ1PJczZ4e/dEKJYicRQNO01LucoqS0
	5i9nUApARwAk80CfSqGpmp8jzFggeTyt7rnNMxEC0o04LuUfjkhpdc+VHAFZF05h7pb8PtzuXOv
	GfURMx9z/ntpl9wqY7aOvj+9J5U=
X-Google-Smtp-Source: AGHT+IFcaFEo/qZQspCXEfaZ9asrhR7AsXRlzRs90EgrMOz4+xmyfUEQn+pkgPSIrP9iTrJOQF2z9EmxBKSKd4EW2d0=
X-Received: by 2002:a05:6512:e8d:b0:57a:311:3234 with SMTP id
 2adb3069b0e04-591d856f103mr5546707e87.55.1761039593310; Tue, 21 Oct 2025
 02:39:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251006-reset-gpios-swnodes-v1-0-6d3325b9af42@linaro.org>
 <20251006-reset-gpios-swnodes-v1-7-6d3325b9af42@linaro.org>
 <95bbec130437846d4b902ce4161ccf0f33c26c59.camel@pengutronix.de>
 <CAMRc=Md_-mO=HqfncD-vJS6XzPJ+aTcBjSjtkxLH_h1=pNjCcg@mail.gmail.com>
 <075a4511a6ae4b047599757d41b559c6b7cf9d0f.camel@pengutronix.de>
 <CAMRc=Md4DUSuwv07EuBVDJbY1Uzezq+TONxyCvLtOHD=iFXrcQ@mail.gmail.com> <050d74d7619bdfdf5ca81d8914a2a8836a0d4e2e.camel@pengutronix.de>
In-Reply-To: <050d74d7619bdfdf5ca81d8914a2a8836a0d4e2e.camel@pengutronix.de>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 21 Oct 2025 11:39:41 +0200
X-Gm-Features: AS18NWDLZhvxp2462wbLcsyKarFFiAj7m0dCchf3HriAjmdsiNckscvHC1N6jtM
Message-ID: <CAMRc=MfPqRLFHPW988oMry7vVoTgtQHrxxND4=nr_40dOa5owg@mail.gmail.com>
Subject: Re: [PATCH 7/9] reset: make the provider of reset-gpios the parent of
 the reset device
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 21, 2025 at 11:31=E2=80=AFAM Philipp Zabel <p.zabel@pengutronix=
.de> wrote:
>
> On Di, 2025-10-21 at 11:27 +0200, Bartosz Golaszewski wrote:
> > On Tue, Oct 21, 2025 at 11:17=E2=80=AFAM Philipp Zabel <p.zabel@pengutr=
onix.de> wrote:
> > >
> > > On Mo, 2025-10-20 at 17:25 +0200, Bartosz Golaszewski wrote:
> > > > On Mon, Oct 6, 2025 at 5:19=E2=80=AFPM Philipp Zabel <p.zabel@pengu=
tronix.de> wrote:
> > > > > [...] could you take this
> > > > > opportunity to prepend a patch that splits the part under guard()=
 into
> > > > > a separate function?
> > > >
> > > > If I'm being honest, I'd just make everything else use __free() as
> > > > well. Except for IDA, it's possible.
> > > >
> > > > That being said: I have another thing in the works, namely converti=
ng
> > > > the OF code to fwnode in reset core. I may address this there as I'=
ll
> > > > be moving stuff around. Does this make sense?
> > >
> > > Yes. There was already a previous attempt at fwnode support [1], but =
we
> > > abandoned that when there was no use case anymore.
> > >
> > > [1] https://lore.kernel.org/r/20220323095022.453708-3-clement.leger@b=
ootlin.com
> > >
> >
> > Ah, what was the exact reason for abandoning this? It's not clear from
> > the email thread.
> >
> > To be clear: I think that we can convert the core reset code to fwnode
> > without necessarily converting all the drivers right away.
>
> The use case vanished in patch review.
>
> No need to convert all existing drivers right away, but I'd like to see
> a user that benefits from the conversion.
>

The first obvious user will be the reset-gpio driver which will see
its core code simplified as we won't need to cast between OF and
fwnodes.

Bartosz

