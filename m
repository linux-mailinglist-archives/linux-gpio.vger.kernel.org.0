Return-Path: <linux-gpio+bounces-6728-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 027878D1A58
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 13:54:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9FFA1F230A2
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 11:54:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8514C16C870;
	Tue, 28 May 2024 11:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n+trmbeZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DF616C84C
	for <linux-gpio@vger.kernel.org>; Tue, 28 May 2024 11:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716897282; cv=none; b=RLxSXqm0U61JJFZzBICvfjwCflRB5P3GwknIMx/2+s2+ZJ2GtJ/lv2OeswzuU0Ir3/2WzKMOec2/mV4CpBTUjiCGvGxXG7EK8RxK8cmhtx6Fd0aocP8l9uxb5of3MwDURKYSsq1ySQ94kzLWXyko5vxmQKKvECMWSUNGf+WDe3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716897282; c=relaxed/simple;
	bh=rOVJH4nneZooWwYT28snd/nHe+v09VIVntLIbqJ6SHM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tit504ygML7X2z1WF2egTXf0gDwpFl41xY3ZkasAV1ey5/pIES7LgMgSx99c94ATzDnG81nQrYtmQ3vCj0rygUXXWgi9xqSkERoTygordx3+uJrtZN5L76zpm9cCFtjLf38GtrXRZBGraknyfjGVttDXVIbRE3rynTsGWNSdjGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n+trmbeZ; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-df7812c4526so757178276.1
        for <linux-gpio@vger.kernel.org>; Tue, 28 May 2024 04:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716897280; x=1717502080; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t2ZiDWbd+rmrEps4dsEoh3/axBJ9SRQHNITtFJg7aIA=;
        b=n+trmbeZdJ1fWWgxL56w5DaT459zEN55sma0Amvtrhbzgz2Y0/8O2QAEPhBHwDogol
         kTAR1LIrbGIndI6PicSQXUG86k2U8vB/6tFx7k8KfRyTUibKvB/+RD3EyHo11xsaBG/w
         4B5kj3sau+ZOM7Mfvz30LepjHHVrMUbpwGmFEHDHwwY0Ma/CNBuxd7yEUOo/NdrhDkP2
         xvU/kuIduXk3kzwSOU6BWZbruyVVgHNa6M9tkIGdNoYZ/iTwrxk6DDjI/cyyrafQVall
         NpqA0xybjCnDSjbHh5OkTvoRG4PdinSRRU4TzEFirlsdexs2Q2qEmsaFkB0IALAz6Ae3
         he7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716897280; x=1717502080;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t2ZiDWbd+rmrEps4dsEoh3/axBJ9SRQHNITtFJg7aIA=;
        b=tj7LGd/3Z64FnxAAI6ZWWnT9enLglkNM9JuI46//zgnImDLyXuQZD2YYiSRvxRECEF
         j3Zis7F1+jE/9jQ8OY/KC07KYJHC68yRvfpdk34dutu7OyBgmxXc5GL0SMaNOnkueawS
         VCTptdbXtkexe1y7Unu/Yane9dRMwIsnY2a6mU36rUZJBTNaqLQ2+J+b/zPhZbWP7UKG
         gACV1iPzf/W9zvFVpKVXJOdwJ9RPAObR3Ly2v4oPG7zl3hobSAaFvAX60Nk2Jdv57C0o
         KHIU46lmUSML4LsCGyXmqtN+rBQx0/Ht1KfEvQYAWn0dvyfAzikXIGZ/hrReVYhns4uE
         XeAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvIesieD+r8l69F4psU+nxDqjQLx+tFh8FHa958u44zIbqA0Vcak4+gw1IzqX79sXN7JrvwOZbdE64uzo0dzaR2E75Tfyuxuhkhg==
X-Gm-Message-State: AOJu0Ywpv89Zo6s2jx9+rU/34869V7fiGRv7QPvAc7phBU1m9uLTJIKi
	4BkkflHubnCH3iLw8j8Z4QHCsvoK3En6twazZ+yTjmVX+l62Ohg73EhSjmQmBAUWfjqViqhKjZo
	6LCa1tZ7zIZnWzP1jVzMvQvK4b/kBmOjB4vGC7Q==
X-Google-Smtp-Source: AGHT+IEEmlDgJX8py9oRVhTs9SrjHN2VKQehB1aTAo8maPSVXq5jzMhl0pQ6oyZ4KdZq6BzPizDGQdL5TnBpH0uaUA4=
X-Received: by 2002:a25:d0d2:0:b0:de5:5067:6b4a with SMTP id
 3f1490d57ef6-df772180300mr13087888276.2.1716897279862; Tue, 28 May 2024
 04:54:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240520195942.11582-1-laurent.pinchart@ideasonboard.com> <20240520195942.11582-5-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20240520195942.11582-5-laurent.pinchart@ideasonboard.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 28 May 2024 13:54:29 +0200
Message-ID: <CACRpkdbAq1Cqr4X8fjEjOTxw7ky9b6V0ye1NYKfDy5E1BmAX6g@mail.gmail.com>
Subject: Re: [PATCH 4/5] gpio: adp5585: Add Analog Devices ADP5585 support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org, 
	Alexandru Ardelean <alexandru.ardelean@analog.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Haibo Chen <haibo.chen@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent/Haibo,

thanks for your patch!

On Mon, May 20, 2024 at 9:59=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:

> From: Haibo Chen <haibo.chen@nxp.com>
>
> The ADP5585 is a 10/11 input/output port expander with a built in keypad
> matrix decoder, programmable logic, reset generator, and PWM generator.
> This driver supports the GPIO function using the platform device
> registered by the core MFD driver.
>
> The driver is derived from an initial implementation from NXP, available
> in commit 451f61b46b76 ("MLK-25917-2 gpio: adp5585-gpio: add
> adp5585-gpio support") in their BSP kernel tree. It has been extensively
> rewritten.
>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

(...)

> +static int adp5585_gpio_direction_input(struct gpio_chip *chip, unsigned=
 int off)
> +{
> +       struct adp5585_gpio_dev *adp5585_gpio =3D gpiochip_get_data(chip)=
;
> +       unsigned int bank =3D ADP5585_BANK(off);
> +       unsigned int bit =3D ADP5585_BIT(off);
> +
> +       guard(mutex)(&adp5585_gpio->lock);
> +
> +       return regmap_update_bits(adp5585_gpio->regmap,
> +                                 ADP5585_GPIO_DIRECTION_A + bank,
> +                                 bit, 0);

First, I love the guarded mutex!

But doesn't regmap already contain a mutex? Or is this one of those
cases where regmap has been instantiated without a lock?

> +       gc =3D &adp5585_gpio->gpio_chip;
> +       gc->parent =3D dev;
> +       gc->direction_input  =3D adp5585_gpio_direction_input;
> +       gc->direction_output =3D adp5585_gpio_direction_output;

And chance to implemen ->get_direction()?

Other than this I think the driver is ready for merge, so with the
comments fixed or addressed:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

