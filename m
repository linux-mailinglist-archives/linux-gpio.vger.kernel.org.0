Return-Path: <linux-gpio+bounces-9166-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CB995ED8D
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 11:42:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99D951C2194B
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 09:42:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE15129A2;
	Mon, 26 Aug 2024 09:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EZK1ziPF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB13B143C70
	for <linux-gpio@vger.kernel.org>; Mon, 26 Aug 2024 09:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724665361; cv=none; b=nqRZahIz811265sMC3ZNk0aIw8UMaVoYKA2CTUjpFjOgpJtxFODr17VjwgNlUmH3HF3He1NvSmTaFSdEFGqYxUbUDa6iYrlmIEoKKPTYuOrPUhaMg1/oiBkZYqaYJIwCv3xdnsGk5WrTRIWcz+7Zk30jrAcV3czLlFJNeaFxkjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724665361; c=relaxed/simple;
	bh=UEc80ObWhu2axDgM7w2gCK2Z7ddiegXdkbdTjfVTIJw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CRg0Va1wQ6c5T3lyjtrTbdp56oNJkTuihldiwP9akPoJikUrRIoSiLXjGUxJDI6aoTwPwEOay2YCn4KLpVZFTaUmYR7YEkk4c9EU5kwUx2AEemPoRFiu+T639wPCRxZJpw7OWRQoDPn1OjHtgdFgF/vaQ0YCc0gYKv9nVFQpqZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EZK1ziPF; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-533de5a88f8so3501397e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 26 Aug 2024 02:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724665358; x=1725270158; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AVYhHA3HG2UY8+Vcymfdj0fB1iRyPGdD56Dm85jLt/c=;
        b=EZK1ziPFRtaGDsaPyvjgK41PZ3bBKNE4iz6OAzD4zKEHX0N+iFZNElBcL0QM/S4ah0
         9VhXQVbo6iUmAyGwd1uCUdYuCsptQCARD7em26gxqJlBdwnlMsMMgvzrAMbC8cdFL4W5
         w+4ijj37AmdGsQu2+wNjwDAIvcJ+odTmQAZEwSRAaeqO/FndceivjWYahNa4BGqMK5yj
         j1CjZLhHLdKwgjMUv6HiOwbjpfdHv0yfe1bmf2bGwwiQuA43YJJxmxtEc/4UGHlCtsOp
         p2U2/DlTxCtUU4qPPrn8n2xef+NDIjQZCIGeyIERW8//sUCXwhehRZoRQd+oOqt0ZUAI
         6Kkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724665358; x=1725270158;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AVYhHA3HG2UY8+Vcymfdj0fB1iRyPGdD56Dm85jLt/c=;
        b=FRhfFL5mRyZ2M2uMt3gkT7B6smzvNQLmJPbLLV+7i1X+yk+VKwojaR0yVvXsrM1dRw
         7qiKRfXdUc3bYh7rRUqW9g007WfxU4cEla3QUPGlzKQ0VFGfTPx9OGHukpvJwoD81ed6
         WPlp5VtqWD0RRisYNwcRYnlszTndTe8GDyn7fdbvSFAFPxP87jpJA03LxlmhgOWdGCZh
         wm1YI0RjQc1ZHQPGzmW/HhvmwrjTIQ4BYNmd/ZO2QjP3ZaLr3w+7UqWxC2XSofzMWVG1
         HAuCyfL9PFhTtGoWiHMZ6vZHEDtZ1rLxJYH3BCNQIBvT8ItCu8KxVyRCd68IS2iBl6Sc
         daZw==
X-Forwarded-Encrypted: i=1; AJvYcCXEqaM6K0MrDzjdBrua7+fMY9nlNGgCRb3tNvuszA5zwpuoejnZK5Lycr5bDaZ9SdR5VFg0oHN1OKIj@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg+MyxwUeMsa/jWGVsHzmjDjbH8VgkfDtOs837n71MAGFw3/T0
	Mou2KM7E2rVf8JwtHo9daBVcOXz1gRd7dZZtkMnpN3npBi3ZuC0j07enAwGyHjF49bJX06aa/Ok
	PRQ2EKGVJE0CT9sKUOSjQy4y7tS1YSTO39UI08g==
X-Google-Smtp-Source: AGHT+IESo1EpDdRnIB/kucNnisTBAnG+tBvFztK55h8yZxs6sHljZkuSVUDgsUgWnaQt2tk4uTQijGTGLbkHtHh8j5w=
X-Received: by 2002:a05:6512:159e:b0:52f:d128:bd13 with SMTP id
 2adb3069b0e04-534387bcf46mr5643646e87.39.1724665357384; Mon, 26 Aug 2024
 02:42:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240826084214.2368673-1-andrei.stefanescu@oss.nxp.com> <20240826084214.2368673-3-andrei.stefanescu@oss.nxp.com>
In-Reply-To: <20240826084214.2368673-3-andrei.stefanescu@oss.nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 26 Aug 2024 11:42:26 +0200
Message-ID: <CACRpkdaZbHsi1zeHr+HyUgfdCDHm1DaA1=peH8BjVSirga_sVg@mail.gmail.com>
Subject: Re: [PATCH 2/3] drivers: gpio: siul2-s32g2: add NXP S32G2/S32G3 SoCs support
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	NXP S32 Linux Team <s32@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrei,

thanks for your patch!

On Mon, Aug 26, 2024 at 10:43=E2=80=AFAM Andrei Stefanescu
<andrei.stefanescu@oss.nxp.com> wrote:

> Add the GPIO driver for S32G2/S32G3 SoCs. This driver uses the SIUL2
> (System Integration Unit Lite2) hardware module. There are two
> SIUL2 hardware modules present, SIUL2_0(controlling GPIOs 0-101) and
> SIUL2_1 for the rest.
>
> The GPIOs are not fully contiguous, there are some gaps:
> - GPIO102 up to GPIO111(inclusive) are invalid
> - GPIO123 up to GPIO143(inclusive) are invalid
>
> Some GPIOs are input only(i.e. GPI182) though this restriction
> is not yet enforced in code.
>
> This patch adds basic GPIO functionality(no interrupts, no
> suspend/resume functions).
>
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>

As Krzysztof points out: the driver is based on something really old and
needs an overhaul. Luckily GPIO drivers are not that big so it should be
pretty straight-forward.

> +config GPIO_SIUL2_S32G2
> +        tristate "GPIO driver for S32G2/S32G3"
> +        depends on OF_GPIO

select REGMAP?

You are using it.

> +#include <linux/err.h>
> +#include <linux/init.h>
> +#include <linux/io.h>
> +#include <linux/gpio.h>

Drop this include.

> +#include <linux/platform_device.h>
> +#include <linux/module.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/pinctrl/consumer.h>
> +#include <linux/bitmap.h>

Really?

> +       raw_spin_lock_irqsave(&dev->lock, flags);
> +
> +       if (dir =3D=3D GPIO_LINE_DIRECTION_IN)
> +               bitmap_clear(dev->pin_dir_bitmap, gpio, 1);
> +       else
> +               bitmap_set(dev->pin_dir_bitmap, gpio, 1);

This is just an unsigned long, just use the nonatomic
__clear_bit() and __set_bit()
from <linux/bitops.h>.

> +       gc->set =3D siul2_gpio_set;
> +       gc->get =3D siul2_gpio_get;
> +       gc->set_config =3D siul2_set_config;
> +       gc->request =3D siul2_gpio_request;
> +       gc->free =3D siul2_gpio_free;
> +       gc->direction_output =3D siul2_gpio_dir_out;
> +       gc->direction_input =3D siul2_gpio_dir_in;
> +       gc->get_direction =3D siul2_gpio_get_dir;

Since it is backed by proper pin control I would expect
a generic .set_config() implementation, but no hurry with that
I suppose.

Yours,
Linus Walleij

