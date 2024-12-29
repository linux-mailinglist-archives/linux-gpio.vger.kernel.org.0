Return-Path: <linux-gpio+bounces-14334-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D3B9FDD2A
	for <lists+linux-gpio@lfdr.de>; Sun, 29 Dec 2024 04:09:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5EBEA1618A0
	for <lists+linux-gpio@lfdr.de>; Sun, 29 Dec 2024 03:09:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30D23C148;
	Sun, 29 Dec 2024 03:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J4DIhv23"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6549F23BE;
	Sun, 29 Dec 2024 03:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735441754; cv=none; b=QzjHyfJG0STyJPf5E0cdKSYw/VsKWyzOhTZKQ/eSPwuHVvs05rWuCWnYXJF3+vatbXEpYzDo0nrIeDJm0gv1HWo+jr+2qiW9rZkXNZBOb7HtzMwUtaCMe0TRRRhYVqCB1u9buYAJU5hgw2w2lIY1iOrQg6mUr0U279QXjciIzl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735441754; c=relaxed/simple;
	bh=QOZIVCYKpscfwQ5Eot2ImIfMu/bmet/t73xNLmIjzIE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aGDA1zxvMOh5pVOUm/AOVBMnrObfcM0yaQfZa3QbyasXFrLor6okheV9wbQp6AKvbEVboVSesajvipz+hmXwTu4sVIVgYc7iu0+uex8ZHgiHEU/fb8jhZUuxD8P+OfNSE0NnxirOjLnIkxCwfZfE8w0l1hNUiawEYjyP6JO3zi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J4DIhv23; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e3c8ae3a3b2so8560114276.0;
        Sat, 28 Dec 2024 19:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735441751; x=1736046551; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x47A1c/cvTIIk72eA4PEAqtqgRoNXmnkQ9XhQ5W2KyQ=;
        b=J4DIhv23sO3ao7V+XsBmppsW1dFpK5Fb58hX8jCLRh8GL/V5WPq20hbpuFY20NB/9o
         uZGcV6rK3G+poB1uzw6I1+omIj+RJq7ozvJMhJWywsPD0M1m0BKylaqJkreFXV4X6epk
         hK1ybi1N+YHo7yF7b5MeW/EP1y2G2vPVOHgyDceHvzGIgAFKwiYMyEO5npr2ab5eCKEw
         jkdVGUro3bXOqyZT7YPgoYM4zvLnjHPLleq6cphzqx5PT7Ea9eTU4XJ1wsUZtaS6BjYS
         UJQVaWXNS3qj0LDOtoLwq7OsvKoScKVSxeQmDWHMAU5NIvAucnaZrUaPXJ+NY/NeG5nW
         eMFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735441751; x=1736046551;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x47A1c/cvTIIk72eA4PEAqtqgRoNXmnkQ9XhQ5W2KyQ=;
        b=bXyTT+TOb3ZF+37JqnEi3eaKqXHRWizL5Z4RexIaz7GSgC4SNC3bYZwm1Cmr0V17dv
         NbJP+TwPMZdMH2NsFxtHvlCateRwDNGNwmQIERbOJNFqlrRH1BpUwVUyDHCG/fJ2FT6g
         apVYOVS7YGBDLfuO5zrXLBJzD8dO5DwQQ2h5WSkEB4hV+1wwAy152hKR+EsE8Xujxx72
         GFdvvj5Q0Oz/IVR+4JkxB48YZMgVxgLwDpOcUT4TVJbcz27xsby2gBLU52MJOi7bi3CC
         btExtS/wYrhITvMTtpbv/EE/OQr7ttUawOfx6JZvQC78h1aXBiAFvj3jFF8AunqI9Lcn
         ppSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHCQvGTWfgchMamoW88VV2aiCPK+XR+QYUq56RKzKPkqwUXUbry5esCt5NUhr1AtkffmTHYWhUGl3C@vger.kernel.org, AJvYcCXPPbK3sxab30glR45r4RkOShWb5s0NAEQXC2m57lKwTEEOgIl8LWRzLMKwtIDOS40p166c+5qo5bPdiU7g@vger.kernel.org
X-Gm-Message-State: AOJu0YzHabsDef0wWxfiUzqfMX/XCpbchsoGxIsFMoWzHY2fy2+i0GfE
	aovsQ2DIegN1Mmb18eMqVNwN8GkFuqpCW32nt7SbGcY8QZ73GhxutrYJGuH51HI9mAo1SOWtM1k
	sYLwG4PLbYA9YYGt3m0vXRLJOeHrhBw==
X-Gm-Gg: ASbGncvCiAkiuWAaS815u27UDKDpmvG/PzB5LzMKN4vcYJhAb2sOzhg5OC13XSWnD8y
	adD/3yO8jDUWYnG+Fl7XczZj6DujkhPrU7tuS7w==
X-Google-Smtp-Source: AGHT+IFxxiwwelMYC00gUnGmtGLqRYx2SOYBr/5BfWBcRczxHmTWNlUyrt315ZRlljGE/VHXuYAWiJAKX6E2vtazaxA=
X-Received: by 2002:a05:690c:c92:b0:6f2:9533:8fba with SMTP id
 00721157ae682-6f3f80d6121mr239445377b3.1.1735441751296; Sat, 28 Dec 2024
 19:09:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241225035851.420952-1-gch981213@gmail.com> <20241225035851.420952-3-gch981213@gmail.com>
 <CACRpkdb4bMFqV+hfAHuUvLezyCA8PTE+SQOpYzh_y1JXzDHLvw@mail.gmail.com>
In-Reply-To: <CACRpkdb4bMFqV+hfAHuUvLezyCA8PTE+SQOpYzh_y1JXzDHLvw@mail.gmail.com>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Sun, 29 Dec 2024 11:09:00 +0800
Message-ID: <CAJsYDVKoLwnpfWWdwAph88XSk7VwOr=c_DPwhLw+yeJANK8TOw@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: add support for GPIO controller on Siflower SoCs
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Qingfang Deng <qingfang.deng@siflower.com.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus!

On Sat, Dec 28, 2024 at 12:52=E2=80=AFAM Linus Walleij <linus.walleij@linar=
o.org> wrote:
>
> Hi Chuanhong,
>
> thanks for your patch!
>
> I think it is better to split the driver instances into 4, one for each
> physical block, as explained in the binding patch.
>
> On Wed, Dec 25, 2024 at 4:59=E2=80=AFAM Chuanhong Guo <gch981213@gmail.co=
m> wrote:
>
> > From: Qingfang Deng <qingfang.deng@siflower.com.cn>
> >
> > Add a driver for the GPIO controller on Siflower SoCs.
> > This controller is found on all current Siflower MIPS and RISC-V
> > chips including SF19A2890, SF21A6826 and SF21H8898.
> >
> > Signed-off-by: Qingfang Deng <qingfang.deng@siflower.com.cn>
> > Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
>
>
>
> > +config GPIO_SIFLOWER
> > +       tristate "SiFlower GPIO support"
> > +       depends on OF_GPIO
> > +       depends on MIPS || RISCV || COMPILE_TEST
> > +       select GPIOLIB_IRQCHIP
>
> select GPIO_GENERIC
>
> As you have only a set of 32-bit registers to handle for each
> instance, then some IRQs on top, you can untilize the MMIO
> library.
>
> > +#define GPIO_IR(n)     (0x40 * (n) + 0x00)
> > +#define GPIO_OR(n)     (0x40 * (n) + 0x04)
> > +#define GPIO_OEN(n)    (0x40 * (n) + 0x08)
> > +#define GPIO_IMR(n)    (0x40 * (n) + 0x0c)
> > +#define GPIO_GPIMR(n)  (0x40 * (n) + 0x10)
> > +#define GPIO_PIR(n)    (0x40 * (n) + 0x14)
> > +#define GPIO_ITR(n)    (0x40 * (n) + 0x18)
> > +#define GPIO_IFR(n)    (0x40 * (n) + 0x1c)
> > +#define GPIO_ICR(n)    (0x40 * (n) + 0x20)

This set of registers is for a single pin, not a multiple-pin block.

> > +#define GPIO_GPxIR(n)  (0x4 * (n) + 0x4000)
>
> Just define GPIO_IR 0, GPIO_OR 4, etc.
>
> Look up the GPIO_GPIR register separately from the
> device tree and use it without offset.
>
> Always register 16 GPIO lines unless ngpios is set.
>
> Look at example drivers such as
> drivers/gpio/gpio-pl061.c
> drivers/gpio/gpio-ftgpio010.c
> on how to use the MMIO helper library to implement
> a simple driver for one instance reusing the common code.

In my case the MMIO library doesn't seem really helpful since that's
for the more common case where multiple GPIO pins share one set of
registers.

--=20
Regards,
Chuanhong Guo

