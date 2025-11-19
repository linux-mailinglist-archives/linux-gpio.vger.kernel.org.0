Return-Path: <linux-gpio+bounces-28764-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 296C0C6F2C4
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 15:13:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 282FA349C0C
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 14:05:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C681329C67;
	Wed, 19 Nov 2025 14:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F9wcXE6H"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2846F23C8AE
	for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 14:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763561152; cv=none; b=QRnYc8pOUwBr6L+6840JZ5UjpWigxOJPzLdp0TzbRPPEWxnsqOnRY2DII4s2wdIPupbJN4T6CKI9eMEmjYfWJtqnVrDf7AZ1HUONWazKypg8AH5YMj0E8gAxorjjcVhqeYmpI4IiLBmCUDn3p/WotN9wYO6NuENR6TFcuHg87/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763561152; c=relaxed/simple;
	bh=6pSPX7H04kSMS8rAxUHjKxKVRcHpXKh4E29bdqrASu4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rDxCucCEJotHwg5R3cWiUsVUtVtdjrLCoo0LQlZHPDV2rfxMmqCoClF85n1uy0pcM2q56KGiL/VYvcasfauK6BGxEkcW5Z3JjYB/ddkyTnjj4wWDehGbtI0roo7oLe3gfW1nu1kTHRotzcegb3n/UkcdRgXKbAdj/U8aNnQQVaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F9wcXE6H; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b7380f66a8bso612295366b.2
        for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 06:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763561149; x=1764165949; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6pSPX7H04kSMS8rAxUHjKxKVRcHpXKh4E29bdqrASu4=;
        b=F9wcXE6H0X2hDutrbNe4FhN0CJ52jYhJs4Tcl8L78Krd+COFiiC2533GvhkH9PCn2F
         gB3Pvcei5yU8GrjL7OkiZ3I0xeA/R00nYS+7qQIfjZeuSwD4ZeVVcIBQT67JszFaE38z
         ia0GNn5BHWziYtf0C2Bw9TSFrmX7Gc6bbI5n2/jhv/ixc3Zo0HEaMY+xro2wB8M8Wjud
         35TX5GQYPFDj84IeCDMOUDZA0T1ANp1KcVWTCrwV4wOf9UGTdfrh/ZwG297CAFfdq8I5
         9zLKIjWdk0Btt9y7BIHEd1rjp3s4HqB7hCaE/U+uYJ+KJxUxJfjKxcK51TYe9pwQrxN0
         q3+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763561149; x=1764165949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6pSPX7H04kSMS8rAxUHjKxKVRcHpXKh4E29bdqrASu4=;
        b=XtiZiJeUcyytX/EK4ypq+cX78YOKmyI4dWC+MOA58Aj3qlJz0dZV/HvILHkCSamRet
         wu680S4uZ/0Mx6F8VS4LSfQOd7+W7ohzqmKtdTNXJ/2rwSzZHzTqMk5KJoOUl5Jgaqo6
         AOq0WYBCmmQkPc2TXeE24JFju727v+Y1my3vSocn2fu2Xdy4jok+6PS9w3QNW0LJdgos
         y5imrtF+WX3ATvVMWK1EnGt0xSFSWQ5a8rKYF33F3+MX73mUC6Xyj36lbWdhxnUILHU8
         iX8MqxCADNdZRaFc/MaJ7p9rRqzCPJKoxKa0xcmjPNIrpAbS4atiLe2R5OxDURCv0nQ9
         9V3w==
X-Forwarded-Encrypted: i=1; AJvYcCVaC/7aQf7KxODeabW0VSNJ+6nB6NoEQC1qsnyt7Wp8yvf+LUUDVMp+nE98KbDcBORGKI+KolD01Qpm@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz7qrg9vgGuifL1dkDeTSiLdMTxq6gZoU7qBpn514rOVPwUkDi
	FxhYZQv62EUbwe7SEMhZO+IEFYdr/HmV3ZmRT1TdamOojIdR5OUMAls8Vr8VLorWECD2qrWEcdf
	An00grtghd/nC19M3KZqPJBsob4dcmFM=
X-Gm-Gg: ASbGncurU732mPfIOfxoWHj58uPkx4Fzt41SQ63Cn6rr1cfB6haedDGbuCilYsyz3k6
	CYvM2jgwZHaHZPnLfKBBEVvWgYh209zvfsj/5RZgCG0LIIKEz02n0MUgDxW84ervJIOZzrAm8cu
	UtLhbdfCrTsuNIIcfHzusE2xi6If/rjl4al42D8r7qJSpeZhDUY8/Sfunz6zVnOiNecDPfadqJf
	eKfUJO8oJ9CoqTf2eGrJs/VgReZ2NHboTaNMT+ydVq7gyodlAz6iWq/Lv2yITQZX5expAEkRa6S
	QKdk+a9znyYZQMhjRtzckFjebh7t5JP5kNJBhnk1aMyQHU6J8WKFgKq7oxR5mgkTLWHSuPQdc4y
	gif2kNg==
X-Google-Smtp-Source: AGHT+IG8awJqy+8Ui6cefioX+4jm3vcNE88fJTiAMy61wvD7oGhSHtnMD+PT7NnOtEIiRkUEf89EKMIWq7eejZMxgBc=
X-Received: by 2002:a17:907:7e9c:b0:b73:a0b9:181a with SMTP id
 a640c23a62f3a-b73a0b927b2mr1144919066b.54.1763561149008; Wed, 19 Nov 2025
 06:05:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251118003229.26636-1-jszhang@kernel.org> <20251118003229.26636-2-jszhang@kernel.org>
 <CAHp75VeB1L5ZwQx=uKqaCMsij1ghFH+Kw3jsLa4qFxnWV1vTyw@mail.gmail.com>
 <aR27HcbvUgvCEK2Z@xhacker> <aR2_GVi6E5gLeS47@xhacker>
In-Reply-To: <aR2_GVi6E5gLeS47@xhacker>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 19 Nov 2025 16:05:12 +0200
X-Gm-Features: AWmQ_bmmJ9JQn42u_VLQ6DVd6n4Jc0ZCk1wPnB_lbNfGkoqWEByKgBUa10U4KmY
Message-ID: <CAHp75Vd8ODnr+GE0kxvZ+anR31Fyou9g-zT6HC7BSARhoKD4vg@mail.gmail.com>
Subject: Re: [PATCH v2 01/15] gpio: dwapb: Use modern PM macros
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Doug Berger <opendmb@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	bcm-kernel-feedback-list@broadcom.com, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Andy Shevchenko <andy@kernel.org>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, 
	Michal Simek <michal.simek@amd.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 3:17=E2=80=AFPM Jisheng Zhang <jszhang@kernel.org> =
wrote:
> On Wed, Nov 19, 2025 at 08:42:05PM +0800, Jisheng Zhang wrote:
> > On Tue, Nov 18, 2025 at 12:15:35PM +0200, Andy Shevchenko wrote:
> > > On Tue, Nov 18, 2025 at 2:50=E2=80=AFAM Jisheng Zhang <jszhang@kernel=
.org> wrote:
> > > >
> > > > Use the modern PM macros for the suspend and resume functions to be
> > > > automatically dropped by the compiler when CONFIG_PM or
> > > > CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.
> > > >
> > > > This has the advantage of always compiling these functions in,
> > > > independently of any Kconfig option. Thanks to that, bugs and other
> > > > regressions are subsequently easier to catch.
> > > >
> > > > The dwapb_context structure is always embedded into struct
> > > > dwapb_gpio_port to simplify code. Sure this brings a tiny 36 bytes
> > > > data overhead for !CONFIG_PM_SLEP. After greping the arm/arm64/risc=
v
> > >
> > > SLEEP
> > > grepping
> > >
> > > > dts dir, the max port number is 6, the berlin2q soc families, so th=
is
> > > > means current we have wasted 216 bytes memory which is trivial
> > >
> > > currently
> > >
> > > > compared to the system memory.
> > >
> > > I still think the embedding is not related to this change and should
> > > be justified in a separate patch. W/o that part the rest looks fine.
> >
> > I got your mind now: it looks like you prefer a seperate patch for the
> > embedding. Let me explain why I have the embedding within this patch:
> > the pm_ptr() or pm_sleep_ptr() just optimizes out the PM functions, but=
 the
> > PM funtions are still compiled, so w/o the embedding, it's impossible
> > to clean up the code with the modern PM macros.

It's possible, but it will require some other refactoring most likely.

...

> For dwapb, I can still acchieve the clean up w/ only embedding the
> pointer. But I'm not sure whether embedding the struture deserve a sepera=
te
> patch.

> BTW: as Michael mentioned during v1 review, the driver allocates the
> struct with kzalloc and stores a pointer to it, so considering the
> pointer itself and the kmalloc overhead/alignment etc, current gpio-dwapb
> have an overhead in the same order of magnitude when PM=3Dy

This is a good point. Was it mentioned in the commit message?

...

Okay, I am not going to tag this patch, I leave it for Bart to decide,
but I don't like the idea of blowing the run-time memory footprint
just because we may need it in CONFIG_PM=3Dy case.

--=20
With Best Regards,
Andy Shevchenko

