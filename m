Return-Path: <linux-gpio+bounces-15424-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0796AA2A3FE
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 10:18:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D88401885025
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 09:18:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FC67225A4E;
	Thu,  6 Feb 2025 09:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UdBWdVRS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9D7225A3E
	for <linux-gpio@vger.kernel.org>; Thu,  6 Feb 2025 09:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738833520; cv=none; b=hvwVU4ifbE3TD6dDSJU5xAOjZ/rKEWj7Dc8bybOzwc6IgR3BNkikijV5+9P6gdJsLtDXUTnO1exM5p8tZdHq66NW0wqrNzGFGWgQlnMi4qgMCjp6DJndk7+bmmWNHj6O0N6O8VTpwJIVY8i8OujQT/Y5OkB2W3gPIGhFzmY7qu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738833520; c=relaxed/simple;
	bh=HS761DbCjOKI8zOzLwqrjohmsBGy+dI8TpEkjZmlUBg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OkTloPII8rgXWRwmJjndlquMYlDomae4mnxVMjsL1CIiK2TctgPWXLbnu5TIIt9TYnDeXSi+Xqf8QbPuxNYOPoF2aaz+QmZdOVE2VjhdJZNJL94L6Z+TGo91lett/LvY+jXU8WztFoa9Zqsp4AYwVYQx3Br0NXOsIxOOyvhfJKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UdBWdVRS; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5426fcb3c69so613723e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 06 Feb 2025 01:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738833516; x=1739438316; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HS761DbCjOKI8zOzLwqrjohmsBGy+dI8TpEkjZmlUBg=;
        b=UdBWdVRSht+lv1JZd5FU8bpWqGOORX6o/BmfsNZuopymAyhpw2ZXEUnDadImwVwv5n
         B7qZQcZDJIsHBIKyM2eaODDH8ZCD7xjRs/2QpdnO9416rWZjRZ8rFnvTThTIAOp0R2RD
         C3xzpC7mMZ5IV9EE3lFoiBnyLTaMovvjZnhmktWfBT/XFJanJKtk+nGdk+fRRI0BzjhA
         aBQzOB1GEhHVGrU58CAAqVjmxpd9tfi12tt/JSisb6jOTxKlmpyGLizI2jZfBrmJ93M8
         H9DhYoQZefdaGGZZbqG4abV1agHrgnU43yZtjwPXmMqmrDT3ZR6SrUJtVT8mCKUjimZ6
         aOyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738833516; x=1739438316;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HS761DbCjOKI8zOzLwqrjohmsBGy+dI8TpEkjZmlUBg=;
        b=APrWf8/TaFF4J5rwuVpe1k7HxlD9dyB9T/RZvsTlqr7LBwHC1peu/TtFh2gQJEjeVD
         BQNaN+/HtpUiZeG9FgvOvANJ/P24SApO5QJ/1d5DE5eaSI5RZsHIWpqAFgdWJ5H0TY7o
         MYsqLl73FTWoOejCsZZhuGdbL98XGGz9jarBdN9LCouo43NUAsgxWH6Rc66NobgdlWSf
         0iaM7Dp/LXfv2zjPthYuS+7zEfCCT9pAh85jbzDyYAJZAKUadyMDko1Ul9i8xNn1nu3P
         w8DmCKKF2hX2oPw37nFSvQ+yHv76EzwUz8kOkD64HgXI2QSR7XrgRS2QfQKP15oMcqOl
         TpUw==
X-Forwarded-Encrypted: i=1; AJvYcCXTasU7JAZ8RQ8Gd1gUwvOKIYorQ8h1T7PLAsGtGNmO2Io/bOuVYpODOa/ICcCcvzK4BzRiznxhZnJC@vger.kernel.org
X-Gm-Message-State: AOJu0YzA1lESSsgXTdd+yXGO60Ez5WH78TceBXvPMwPk8PPodD8ZYilY
	jPvJCp46jtEsYbQmxK4MDsiBvYWheP/5qgvPZ9irJQ5+3v2dKqUsepcMt4zaz7D61TO/uqym+Tm
	/Wd1TbAdbP5w4JPUVUmfC5MuCM/vr64AJHtmlbWEVTgZbMU+b
X-Gm-Gg: ASbGncvr7/s+NGqUPHCNVLfD0T191T6Wq0k19GGewO8jwi3NoVC2kWXfZh869Rs5+rg
	O9zKic3DSzYCvdamOh8jrLP4dKMA95/HOJWDaK+EepMFFTIcdETPK56J2LVeEO3724IhhtNE=
X-Google-Smtp-Source: AGHT+IEv8dg+a0kP8xIC60NBrACIVsxMj8GMoXfszN3ovDIZ2UwypMSGbO57fvFIDLEN+5kpMkaUESCBViyIWEI972w=
X-Received: by 2002:a05:6512:31c1:b0:540:1fd9:b634 with SMTP id
 2adb3069b0e04-54405a4245dmr2401575e87.34.1738833516532; Thu, 06 Feb 2025
 01:18:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250121-03-k1-gpio-v4-0-4641c95c0194@gentoo.org>
 <20250121-03-k1-gpio-v4-1-4641c95c0194@gentoo.org> <Z5FPJLzAEVXGWJnE@chonkvm.lixom.net>
 <20250123113042-GYA38135@gentoo> <Z5LOdh-4UxRtteOy@chonkvm.lixom.net>
 <20250127181726.GA538260-robh@kernel.org> <20250128031712-GYB47737@gentoo> <CACRpkdYbSOHD9UH5=+qjztxS3Cq_rxaoOT9tFtD8ZWm9zQGnPw@mail.gmail.com>
In-Reply-To: <CACRpkdYbSOHD9UH5=+qjztxS3Cq_rxaoOT9tFtD8ZWm9zQGnPw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 6 Feb 2025 10:18:25 +0100
X-Gm-Features: AWEUYZmhuWaqVp2p5Akrm0LPyHUBdTfoHVJqdr20LL5qcm6uyZRtLyGHjoX2YmM
Message-ID: <CACRpkdZa887vx4Lmxk1U_8w5n7AxMnyzGexeYzhsxNGT-DTYcQ@mail.gmail.com>
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

Hi Yixun,

On Tue, Jan 28, 2025 at 5:03=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
> On Tue, Jan 28, 2025 at 4:17=E2=80=AFAM Yixun Lan <dlan@gentoo.org> wrote=
:
>
> > [Rob]
> > > If Linux can't handle 1 node for N gpio_chip's, then that's a Linux
> > > problem. Maybe it can, IDK.
> >
> > I haven't seen somthing like this to register 1 node for multi gpio_chi=
ps..
> > To gpio/pinctrl maintainer (Linus Walleij), do you have suggestion on t=
his?
>
> For Linux we can call bgpio_init() three times and
> devm_gpiochip_add_data() three times on the result and if we use the
> approach with three cells (where the second is instance 0,1,2 and the
> last one the offset 0..31) then it will work all just the same I guess?
>
> foo-gpios <&gpio 2 7 GPIO_ACTIVE_LOW>;
>
> for offset 7 on block 2 for example.
>
> We need a custom xlate function I suppose.
>
> It just has not been done that way before, everybody just did
> 2-cell GPIOs.

does this approach work for you? I think it's the most diplomatic.

I'm sorry about the hopeless back-and-forth with the bindings, also
for contributing to the messy debate. I do want developers to feel
encouraged to contribute and not get stuck in too long debates.

Yours,
Linus Walleij

