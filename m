Return-Path: <linux-gpio+bounces-15887-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBE6A331FF
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 23:06:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D96D188AE00
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 22:06:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5F43204590;
	Wed, 12 Feb 2025 22:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ttgayTej"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0182036E6
	for <linux-gpio@vger.kernel.org>; Wed, 12 Feb 2025 22:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739397952; cv=none; b=NIrqiDo/jjHflw+uaXLR1khUW4T0MK8X5SYiw7f277i2YV+6c1NJ/eMIJnR/8HZ360UaACfAyppf9YvHQ2GJg2DPDchoCFyi/up2RyLd3P7ENiihqiaaoB1uibV6iu2YF3xBqXmwxJlYi2B78ieH5VJLq9/sI9CWgnotWNGZp6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739397952; c=relaxed/simple;
	bh=TIp6IiSw9J6XeW41z4PtWs3Pf5rf0JtnBBQ3ET3vPAw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cBqon/XTwz1IrVqr+tMp5MF1rjdGFi+dtkm6f6RUX5GUmy2k/6IShmgR6lnU8YzBb1znPfaA1sNU2WkdSt5KNanJHZOji2I/bsF3AUrzcrbty6uDZGXT3Gq3bNMRtaiU3MbsR6lhEXPV9Hy5O67NySSjjL8caZNcWqcCPC7gsp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ttgayTej; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30613802a59so2439531fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 12 Feb 2025 14:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739397948; x=1740002748; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AyeS31oOn+dyoHdEWwNg/btCvozuEbvtdJVbwfowCPI=;
        b=ttgayTejd1PyC4/daUQsPLiIUzmFcgNOFlR3oRFQDJq6S3kvSPz3zjPpvV1zEITOU5
         bFsCqHW7clcTqeKHUFyRJx9FvFxF8myeI2SvFacrVkD638WTHZY6vB8RKX+608j+lOVM
         VAXrESsDlx4yS2NX5UWPbYykJUChAV2r6O1nwQrBuMQLQo0Ol/4LInKdyrUKiCBgSOMG
         +JyMrlhX8jKO8TdafilAekwhxd/6HJ+8abV3KMAaedDS4UUgMLUsqJbT/JF97TSQbavN
         fSTDsQz1DjHoOMtdjg1fpk1UFYZur9atEfwjVnTXao/p5xOMahyVbOyALsir6RUmsJp5
         skIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739397948; x=1740002748;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AyeS31oOn+dyoHdEWwNg/btCvozuEbvtdJVbwfowCPI=;
        b=CWTlB0tcbL6dhQWQiQvA2cQWL998tn78oiXYpz7CdPLY/l4ZEkJlwuN6ujzxaoB9dr
         lzCZN07tSLZLSUdkeWvrHAuieH4FGVtkLGrRKZPKfpIvEhZYcC4fl32kOeYOnhaG+zVv
         hAsjqhfR6STU0xemY5YEoYJz2AloPpCE4/+7IALcV6eMhXEmRBh9gOvXkmuthDxLIWKY
         GayLQ3vYzMDNI060DJ2F4+oEVJSneN8zB0LMgIc7O3MAuzFGWLLk3roMlz9bqZ3ktz5D
         hURywBDmH9/iK9/4opnDS89/RBowBo8HbVDKLQFsDdCT3HoULZXmOE80jLaAMyYTmFvk
         T0yg==
X-Forwarded-Encrypted: i=1; AJvYcCWbZA2XRkEeGyCqWpiQ7huDiXmIIeOz6mX9XAMg23b7Bz/9Ood7d0ZKAhJnRoOxOvRmn0ScurcpI9cC@vger.kernel.org
X-Gm-Message-State: AOJu0YxCcReUAiDQlapllqwcbQyNxD6iF51WF+ob++zcrB6OQs9pPN8L
	aZnpGTitzfkcrhT24yqjOqf4iFnllNclJBgIL79uuYjzTW7YuPXk1OaTjaqJ/DV0VW7hWxeAbaN
	m2S+B5xD1MkY0IpcBesRpZJY5kOMLWctvBhWrEA==
X-Gm-Gg: ASbGncs9whmpUmvKxFqk8VGv4uZPj298KvnqmmHzxmhUKXZTBQ76RshiWm9dy2IEvW1
	NvDF92dgBS4uWTenpNzJnpObTaeB10STx9x9sneTNzfj5Qv1+KkGEGjHso/GB+GsibNWQSyv1
X-Google-Smtp-Source: AGHT+IFVaagqh0CMTsKcRkmd3v9fDc83O1leceTlQ3IBKxH8tfOt/VuYKAEwsc8W8nqObHABGLW4nQjjLkytNesf0P0=
X-Received: by 2002:a2e:a9a6:0:b0:301:12:1ef3 with SMTP id 38308e7fff4ca-3090363078fmr16793271fa.4.1739397948015;
 Wed, 12 Feb 2025 14:05:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250212-kernel-upstreaming-add_gpio_support-v1-0-080e724a21f3@blaize.com>
 <20250212-kernel-upstreaming-add_gpio_support-v1-3-080e724a21f3@blaize.com>
In-Reply-To: <20250212-kernel-upstreaming-add_gpio_support-v1-3-080e724a21f3@blaize.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 12 Feb 2025 23:05:36 +0100
X-Gm-Features: AWEUYZlDq7_9jonIwEr0yAB71k3AJVNBKOFS6VlejNFuOFWzLB734tg5VjHuCCs
Message-ID: <CACRpkdaWSgTO=S=L=m4bCXCU5b7aOG-DzN-TLEvPjb-QZGc72A@mail.gmail.com>
Subject: Re: [PATCH 3/5] gpio: vsiapb: Add VeriSilicon APB support
To: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, James Cowgill <james.cowgill@blaize.com>, 
	Matt Redfearn <matthew.redfearn@blaize.com>, Neil Jones <neil.jones@blaize.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nikolaos,

thanks for your patch!

This driver is really high quality, only nitpicks below.

With these addressed:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

On Wed, Feb 12, 2025 at 2:47=E2=80=AFPM Nikolaos Pasaloukos
<nikolaos.pasaloukos@blaize.com> wrote:

> VeriSilicon APB v0.2 is a custom GPIO design provided from VeriSilicon
> Microelectronics. It has 32 input/output ports which can be
> configured as edge or level triggered interrupts. It also provides
> a de-bounce feature.
>
> Signed-off-by: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
(...)
> +config GPIO_VSIAPB
> +       tristate "Verisilicon APB GPIO support"
> +       depends on OF_GPIO
> +       select GPIO_GENERIC
> +       select GPIOLIB_IRQCHIP
> +       select IRQ_DOMAIN_HIERARCHY

Are you really using the hierarchical domain?

Not in this driver, right? This is just regular chained IRQ.

> +       /* configure the gpio chip */
> +       gc =3D &chip->gc;
> +       gc->owner =3D THIS_MODULE;

I think the core sets up owner for you so you can drop this assignment?

Yours,
Linus Walleij

