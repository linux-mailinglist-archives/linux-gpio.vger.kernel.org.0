Return-Path: <linux-gpio+bounces-16246-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A34A3CB09
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2025 22:11:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD60A16AD7B
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2025 21:11:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE4CD253339;
	Wed, 19 Feb 2025 21:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ogSjU4d7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B2E1C1F21
	for <linux-gpio@vger.kernel.org>; Wed, 19 Feb 2025 21:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739999459; cv=none; b=N1MErmwyGNPjg722W9jePCf1hFljqa4fyZP1+gvLAM9MH5W/PxEM7so7qqGmN0OUjZQACBUwRYgTZA4+sj7ow/thc8YsLw6Td4VGm7DfU8b25RTdJm2Lzk6kP9x0i1NAmQuDe95IMwMA53jTCJOSaRzJngYl8JFzYUqoefshEGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739999459; c=relaxed/simple;
	bh=v5P9JdcmAkaoegDp6G807wPeaePuirzxwsGg/y2egdk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HYngM9AcAqmr/JeK6EsYzTinHtLW3XDGh47ywiwln57BAIt8kuJ9DrAKUu0sZWK1bgLQ0iqJGJ/f8wyJzUYhy01kG4e9HpON3oDCuF7Cm0URmfLgj0H6R6d8W/fhd9UUUzyqWv52jgcxthIh1E0OcNyQaXywDPUdvojwqPffsYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ogSjU4d7; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54605bfcc72so1567710e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 19 Feb 2025 13:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739999456; x=1740604256; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D+9nshjszkcCQWCB05PcXblSy4ZtTLxbSnQOVwr49OE=;
        b=ogSjU4d7DOMFbB/Qmm+9C7nT9tpJhnN9k/OQGy9TiQzNH2Ylihoz8vt8YoPb/c+ZTO
         gl5tRi2cST7AgB7E/nrDHjDQqb6CKz4oROzm9TeUXDncBIWyGPxcq9DdM1jfsLoclKzi
         qhBqs/ZQHlUiRtei56wdOEU3hK6o86XtsLCsjSfwxrZAk4JkOSKdm/a9mQOjyWBVljtP
         /RMYdC4Lwjuo3L1Opld0aUCNqfVRhKTCv6T45QdAMZDiKtUavw7Er1mvMmBwENMizEvq
         rvAGDLgotqRS9Og03ihLWZGRcEAWnbzJiMWUoueIb11fQU5Yg2yqjrqNAk1KlG0pIvt0
         bOLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739999456; x=1740604256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D+9nshjszkcCQWCB05PcXblSy4ZtTLxbSnQOVwr49OE=;
        b=NBzan56uvCAuGSTSI4kQbayxr2zvEZPhHVGgjRnDg+Unlx2gadTdgimukas95wxT1r
         FO9VEUIkG1ANCP2GZ95USR8dXCI7VK0zwVOPL5k5TzExYXFoYx2z1UWg/1DhGGequk1e
         DkHLExylgmov9qMdAMJrvTQkQP1b85raaRyQSJgd76/N7LiPw78vB81ghqn9S3qAxI0B
         xd6rLml9Rnnv1Ormbcb8uPrdj+Iov/Mc9QpFF95XdKQ92vaRpTlUQHT9XL1/+FS8qit2
         Sz2Yq04U7LhOqGE4INwq0+FweOEdlNaCdXjhHa6dXDaMtMVaSwXJRxxL9IiDyzrQmpF8
         lhaw==
X-Forwarded-Encrypted: i=1; AJvYcCVIHjsu50+OM4fX+IhqcgeuA9e2kRirzBARBW94BRHdgNo0QGVFIia+l8YDkykUfcglmscw+hD/haKb@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6w9jaYzDtYuaAGMouri9zpEviQUkxyiqPVIrzZVxWTQr7HPxw
	fGUFhHeoRYUwbzM/dd8Zq140Fu0S1+v3UV3cQrR8j+As7hlzbvZvRj7DRkGvTenF4GzkKXwF72v
	KfNBTWccrYw5ot84QtZHLXB1129/fyXxDplFL7g==
X-Gm-Gg: ASbGncv1PQs51o6k7aePh5g8K1bafBFMBvl3y8qfTaQhDZGlVNgN9xG9bVdkbkzSQjS
	/h4z0YIZxU5FldmCondlDbFhkBE+JMf+ksqsgKlF/jbXe6VfiDq4iWHzJlrjpnRR2pjvMQxMR
X-Google-Smtp-Source: AGHT+IFhOg9c7nz7Nl8AqPHQXn/ERl9cr5f9aNzv5wEI7EP9Xr+1zNonhiaiACnauyFsgWXV/OTiuBxpuRx/YDNPCe4=
X-Received: by 2002:a19:6411:0:b0:545:6a2:e59 with SMTP id 2adb3069b0e04-546e50004aemr198735e87.18.1739999455702;
 Wed, 19 Feb 2025 13:10:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250215-vf610-mmio-v2-0-4a91f8c8e8d5@linaro.org>
 <20250215-vf610-mmio-v2-2-4a91f8c8e8d5@linaro.org> <DU0PR04MB949653EE20B91B84D4B615A590FB2@DU0PR04MB9496.eurprd04.prod.outlook.com>
In-Reply-To: <DU0PR04MB949653EE20B91B84D4B615A590FB2@DU0PR04MB9496.eurprd04.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 19 Feb 2025 22:10:44 +0100
X-Gm-Features: AWEUYZnagEgkG_yMWnK2eJXBuoCS0AflXol8RNjMmUvrT6R5_r_FQz-HR7EiNfk
Message-ID: <CACRpkdZ=HcPMOWs1Ts=YWW7YcwKGntEGNvEAVWaN8qJZggr0dg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: vf610: Switch to gpio-mmio
To: Bough Chen <haibo.chen@nxp.com>
Cc: Johan Korsnes <johan.korsnes@remarkable.no>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bough,

thanks for testing all my patches!

On Mon, Feb 17, 2025 at 12:24=E2=80=AFPM Bough Chen <haibo.chen@nxp.com> wr=
ote:

> 1, need to use port->gpio_base instead port->base.

Oh, what a mistake. Fixed.

> 2, vf610 has register GPIO_PDIR, if find the direction is input, need to =
read this register to get the input value.
> But for mmio driver, it will read the gc->reg_set, which is GPIO_PSOR wit=
h flags
> BGPIOF_READ_OUTPUT_REG_SET,  this is not correct. Seems current bgpio_ini=
t()
> need to add another parameter to input this GPIO_PDIR, but this will has =
big impact.
>
> I try to adjust the bgpio_init like this:
> ret =3D bgpio_init(gc, dev, 4, port->gpio_base + GPIO_PDIR, port->gpio_ba=
se + GPIO_PSOR,
>  port->gpio_base + GPIO_PCOR, port->sdata->have_paddr ? port->base + GPIO=
_PDDR : NULL, NULL, flags);
>
> But still can't work fine, because when gpio is config in output mode, it=
 will read GPIO_PSOR
> as output value, but for vf610, read GPIO_PSOR/GPIO_PCOR already return 0

But what happens if we *only* specify PSOR as setting register to bgpio?

Usually when there are set/clear registers, the block also allows direct
read/modify/write on the output data register (I have seen this once
before...)

I sent a v3 like that. Does this work?

Else I think we should perhaps simply bite the bullet and add a new
argument to bgpio_init() for passing set/clear/data triplets. It can't
be avoided: if this sort of hardware does exist with set and clear
and a non-writeable data register, then gpio-mmio should support
it.

Yours,
Linus Walleij

