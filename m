Return-Path: <linux-gpio+bounces-15082-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 18897A20DDC
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jan 2025 17:03:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79C2D1663BE
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jan 2025 16:03:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90688192B96;
	Tue, 28 Jan 2025 16:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NSEVDD81"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64126AA7
	for <linux-gpio@vger.kernel.org>; Tue, 28 Jan 2025 16:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738080218; cv=none; b=kSCVUl4ZfceYQ/GZBDbCSGEjGsbdczSboAUgpG+TEzAVTmPDZ7XILSNc4Z1c/2hKwEL+PksgkGYzGrzpKNOSfmXBWNQ4YoNVvoXPB/h5kVa9Wi+o6E2uZhnphKXq///dpZOaujkdqnWD8ThH7RsSr9BHMZ6Dh7VMmVF7O912NDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738080218; c=relaxed/simple;
	bh=+t8hjKCoqo6TQnZ8M8jStHab2qUU8bkeSurEQ6U78Ck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mt5JOkoU2sKChZ+7/Xru6cle/9b+ytYXefAQY0h/cFXAA+iUZitTfXJPU0Jrq+4I2DUIFCj3Sp4AL+Qrxi9rkkZNkh5bXAgMukJ5XGR/a+rnUGpHOEAIgsbBd3BH51O3c/sKjLySvZ7awS17CFnjStWBS4v+YX6LLCfj8+u/VME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NSEVDD81; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-540218726d5so6236320e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jan 2025 08:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738080215; x=1738685015; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+t8hjKCoqo6TQnZ8M8jStHab2qUU8bkeSurEQ6U78Ck=;
        b=NSEVDD81SvMGz7RNNgGsKAWEDhBydSGV7OC1LIv98a3v2x0DN8Lem3Zzwl03hoArVm
         S2tbeq/rtB+St9a2aKQkKFrTKDSYXh+wzaV8rzdDphwirHXp5t3eLA1VAn2Oo4pUiabw
         UCUPFetBZ02Hg0rlO4z1BKS21InzoLLzjwcZ6sQ9QvHDcuHXeJma206+hw8IBspf08GQ
         3JeOPHrk75o7j033KRGteS6bwixDO8nYWzSY9ODTEDxsNh3hs7xVL0JoukBh0yt/u7F6
         79Ak7DkA8eZ0nvlUyCt0LrqLmmC3ADfxUYXfNOY7nYJrhfa6DeknsNAZbXk6HE3Hqnii
         baDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738080215; x=1738685015;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+t8hjKCoqo6TQnZ8M8jStHab2qUU8bkeSurEQ6U78Ck=;
        b=XVjZotj+o/476OujRbImsWdFQjmF5v/0HiXITKOlQeYVeGp4zv48rbZjRj0TpfOjK5
         ypkaxRhdwJwu86SwVQzEco5LLnVr2iKqgCFNwIe+rMrFY+VBpEWAFz5Mw1ENb4lMZJj1
         rQ/QQ3UDlUEo7GVda25ecbVs50WS2Cu8V9/5CsbZrg9dlGNW7t3rbhOKJweMfNJfyP0A
         /6uuNH/yGea6h4BPyw7K1/e9OM7ESUze4g1v7WiRCFlTZZ80n/gMDtdTmyr9z0yJQ1xn
         srvq8sLMoCz6iFUqHP5L/X8yxY68v1F4qrXzQ6Rv3o3c3jZ1su+cYZC9rgM0cGQgRyC2
         blcw==
X-Forwarded-Encrypted: i=1; AJvYcCWPJ9bg970U4Ag0QmDhRCOP+kxTP5KaAbKdvoSVoxS9q1INpzOhWM1gZC1jqbQ3LAj3O7hw5JPE7z4B@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8KxhVq0yinizWnXMWSrGfIKZolnRp5oj2bYj4YUQXjQeZPk3O
	8wMPTWhL2sWf8KyT8K5e1Nszg1VUQ8lfHVMo9i8KY69njaujSb1FuirOUIxHT5qF5jaBl3Avs8r
	t7UjbPrlloMS4VCFL/sZmcOCTazoABEep/EYx7Q==
X-Gm-Gg: ASbGncupSwQTIukaZdBBZuHi6NTALnefVbNBn4EJwiumT58Ca2AEJsBiWzw75yxI131
	qP6Y7RaLbhHMjz7AJ/7txN9B12hNGoIX3jDp4wJQHOx2cPrSpeZR+f4WfHIyW2GwYyAq1P8o=
X-Google-Smtp-Source: AGHT+IHzEustcu/b8mVV+IGZGzcJdRDgXEhBHXrVJD8zlFDPDv79N0T8FHjBdECXZ69pHyAUFPzDWK0nx6iJEXfxEmY=
X-Received: by 2002:a05:6512:124e:b0:540:2549:b5ad with SMTP id
 2adb3069b0e04-5439c246d35mr15256733e87.22.1738080214692; Tue, 28 Jan 2025
 08:03:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250121-03-k1-gpio-v4-0-4641c95c0194@gentoo.org>
 <20250121-03-k1-gpio-v4-1-4641c95c0194@gentoo.org> <Z5FPJLzAEVXGWJnE@chonkvm.lixom.net>
 <20250123113042-GYA38135@gentoo> <Z5LOdh-4UxRtteOy@chonkvm.lixom.net>
 <20250127181726.GA538260-robh@kernel.org> <20250128031712-GYB47737@gentoo>
In-Reply-To: <20250128031712-GYB47737@gentoo>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 28 Jan 2025 17:03:23 +0100
X-Gm-Features: AWEUYZn1ZQkjXChIgaJ6psXXGwkFFB-eH9nO-EAMkzADocFTLmeDtVOyD7Nrf64
Message-ID: <CACRpkdYbSOHD9UH5=+qjztxS3Cq_rxaoOT9tFtD8ZWm9zQGnPw@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: gpio: spacemit: add support for K1 SoC
To: Yixun Lan <dlan@gentoo.org>
Cc: Rob Herring <robh@kernel.org>, Olof Johansson <olof@lixom.net>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Yangyu Chen <cyy@cyyself.name>, 
	Jisheng Zhang <jszhang@kernel.org>, Jesse Taube <mr.bossman075@gmail.com>, 
	Inochi Amaoto <inochiama@outlook.com>, Icenowy Zheng <uwu@icenowy.me>, 
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 28, 2025 at 4:17=E2=80=AFAM Yixun Lan <dlan@gentoo.org> wrote:

> [Rob]
> > If Linux can't handle 1 node for N gpio_chip's, then that's a Linux
> > problem. Maybe it can, IDK.
>
> I haven't seen somthing like this to register 1 node for multi gpio_chips=
..
> To gpio/pinctrl maintainer (Linus Walleij), do you have suggestion on thi=
s?

For Linux we can call bgpio_init() three times and
devm_gpiochip_add_data() three times on the result and if we use the
approach with three cells (where the second is instance 0,1,2 and the
last one the offset 0..31) then it will work all just the same I guess?

foo-gpios <&gpio 2 7 GPIO_ACTIVE_LOW>;

for offset 7 on block 2 for example.

We need a custom xlate function I suppose.

It just has not been done that way before, everybody just did
2-cell GPIOs.

Yours,
Linus Walleij

