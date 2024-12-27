Return-Path: <linux-gpio+bounces-14319-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C14D9FD619
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 17:52:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A95F163312
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 16:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F08661F76D4;
	Fri, 27 Dec 2024 16:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ByVWqJmB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259831F76C2
	for <linux-gpio@vger.kernel.org>; Fri, 27 Dec 2024 16:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735318324; cv=none; b=bnex6S+ByVc3wPgdT+UhCVLag855G2iSl2WxM7FVC15yqqAVp3oCdfZcm8lwbnegIXvEI8tcxC/Tuh38xlrSNCx35Cgox4y0s1nmSDafnGS3/jJLNALLXmyG574IH1NjHWz8jI0/y0DLi6C9B7UKsfc7vMsUM1NbNBtMT1OxMrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735318324; c=relaxed/simple;
	bh=kzPiXafBJmY8qlCYEUykmZiGRWQ/0RcpfA+8VOhH8qw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MPvbHV07s223HWK+BwHQCHG7xV89gvqe6NZb+TaUbmN6NDLu4PchioS5AD3T9Lj+JeXJEzvcsbo3kdswa9WgGefUh1ow13k+ZLH/rNEKPJpDWj7HAb2p2AjRuQJaNsQbe9nVqLDYdMwXESJTaKe0aMJnwTEZhS16hb300pJ+e9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ByVWqJmB; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5401bd6cdb4so7835909e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 27 Dec 2024 08:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735318320; x=1735923120; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V0J0K6aqgihRpMPdT25Lkd5jtBPGc5dJpjjgeL5v0qM=;
        b=ByVWqJmByWOUn0K7d5wEcBvSfnNplfIQodKp8yTT24V5Sy9lOfzOy4D0WrvDT94FX2
         iTTHqzWthlDZRdG6tkS+L+1cwSSTbLg7JMpkkdon9oKkoXYNUoytokHS8o7J4atzZeES
         bMiC9h/n8p6Xm5edhiRo2TdxQHTe+iGN0G2pNSCDGHgt9qcD00BTuGCWou4OmNthBGob
         65rObgM+04Utl88htSXoSZ3JS7yHy6qEi1OqAFdMtnv3Lx0SzMNM53+05Qd4EaOzqoTG
         mYZwTRWIwUwD4L0VLutqJRXq4ZNHITGuSgW1i3EyGKODH7U3qCu9NOYUzwJaeIniqQJG
         NKtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735318320; x=1735923120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V0J0K6aqgihRpMPdT25Lkd5jtBPGc5dJpjjgeL5v0qM=;
        b=FvT+YkzB6tko+go53FGA7xgvnP0cq/VCAbrWIu967qThR2DnsJ8iw2+eH6SEJ87HlH
         g1Su72aVat1CehUk+o7u2IFGHyTGompWaf4Z2yxXrWAPb2ww1huOxwrfN2M5G3tuXrX7
         KVj6joDHC3yCMle9SchBJznNsBJ7Sa95ZXc8w8+ohW7VtCss2Xm2tjljccOR77/d36SX
         fxQc0MirSdk+/NBv6QmBt/r2wnrdNIKs60ZHf7vhDpiNSkd0kfT2vmzlWr9EwmUQb0MJ
         7vzNflscq3Q4xB3R7sRcgmmPn3x666RGwAFKkLqrj9oockRf/6N3SmUiHtg1vZ8JbZdz
         ldzw==
X-Gm-Message-State: AOJu0YxiWrPmPh3u+jO93sK9iGhUasHcwqnvk3/fCdNo0QS26L+8oXu7
	eMbnLF5cHrcpcOkk9cyBIMbob4VpqySUTv8+iaqSdyYpoc91j0EX8j3ViK9HHyKQEspzKmLaZwq
	3Q/L16PwIUlk7rBz92+u62SK/wjvrLHBJmZjFPQ==
X-Gm-Gg: ASbGnct3pM2PzNtCpvUxUSxsQWyHe9DFR1Xli98lClvgeeO04BqfINo0uk3DUfk3O4N
	1QrPoItAi8NR/7QcAMdcLHrK7oClbUNow+f2X
X-Google-Smtp-Source: AGHT+IFbhJkhTwGcQGwmzdZ9ZEVtnJuJfzbxvgbJET6mG/L4rwM6fQpP2k3nWah4RzNxd7nMyu9lr8s1kcIcg2qDzEQ=
X-Received: by 2002:a05:6512:308d:b0:53e:335b:4348 with SMTP id
 2adb3069b0e04-54229582541mr7372384e87.40.1735318320264; Fri, 27 Dec 2024
 08:52:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241225035851.420952-1-gch981213@gmail.com> <20241225035851.420952-3-gch981213@gmail.com>
In-Reply-To: <20241225035851.420952-3-gch981213@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 27 Dec 2024 17:51:49 +0100
Message-ID: <CACRpkdb4bMFqV+hfAHuUvLezyCA8PTE+SQOpYzh_y1JXzDHLvw@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: add support for GPIO controller on Siflower SoCs
To: Chuanhong Guo <gch981213@gmail.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Qingfang Deng <qingfang.deng@siflower.com.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chuanhong,

thanks for your patch!

I think it is better to split the driver instances into 4, one for each
physical block, as explained in the binding patch.

On Wed, Dec 25, 2024 at 4:59=E2=80=AFAM Chuanhong Guo <gch981213@gmail.com>=
 wrote:

> From: Qingfang Deng <qingfang.deng@siflower.com.cn>
>
> Add a driver for the GPIO controller on Siflower SoCs.
> This controller is found on all current Siflower MIPS and RISC-V
> chips including SF19A2890, SF21A6826 and SF21H8898.
>
> Signed-off-by: Qingfang Deng <qingfang.deng@siflower.com.cn>
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>



> +config GPIO_SIFLOWER
> +       tristate "SiFlower GPIO support"
> +       depends on OF_GPIO
> +       depends on MIPS || RISCV || COMPILE_TEST
> +       select GPIOLIB_IRQCHIP

select GPIO_GENERIC

As you have only a set of 32-bit registers to handle for each
instance, then some IRQs on top, you can untilize the MMIO
library.

> +#define GPIO_IR(n)     (0x40 * (n) + 0x00)
> +#define GPIO_OR(n)     (0x40 * (n) + 0x04)
> +#define GPIO_OEN(n)    (0x40 * (n) + 0x08)
> +#define GPIO_IMR(n)    (0x40 * (n) + 0x0c)
> +#define GPIO_GPIMR(n)  (0x40 * (n) + 0x10)
> +#define GPIO_PIR(n)    (0x40 * (n) + 0x14)
> +#define GPIO_ITR(n)    (0x40 * (n) + 0x18)
> +#define GPIO_IFR(n)    (0x40 * (n) + 0x1c)
> +#define GPIO_ICR(n)    (0x40 * (n) + 0x20)
> +#define GPIO_GPxIR(n)  (0x4 * (n) + 0x4000)

Just define GPIO_IR 0, GPIO_OR 4, etc.

Look up the GPIO_GPIR register separately from the
device tree and use it without offset.

Always register 16 GPIO lines unless ngpios is set.

Look at example drivers such as
drivers/gpio/gpio-pl061.c
drivers/gpio/gpio-ftgpio010.c
on how to use the MMIO helper library to implement
a simple driver for one instance reusing the common code.

You will also get implementations for get/set_multiple()
for free with this approach, as the library implements
them!

Yours,
Linus Walleij

