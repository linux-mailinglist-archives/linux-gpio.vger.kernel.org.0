Return-Path: <linux-gpio+bounces-25624-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AC610B446C6
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 21:57:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E7415A3B88
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 19:57:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7254A277814;
	Thu,  4 Sep 2025 19:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Iv+32+pl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896101BD035
	for <linux-gpio@vger.kernel.org>; Thu,  4 Sep 2025 19:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757015860; cv=none; b=Not0wzpPnj/ALNAOQVr2eEIhVyIMvV9d886VjN1BGuClnYZZIlnfJIpWnWa9s6caghvcQ29tq2bFjRppFVbLBVNWX3Xomr+nlB7qzyv3H+2NuoDhJrGem2c88Tc7OH3+KFshPVl8M+PnwRmytt1T7vrFfvnKoN0l/x9q/CI8eqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757015860; c=relaxed/simple;
	bh=AkQDfljW56aeK9hFyEplI/9Ee67wMd+uq6QJcRF62eo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AA1Sqk5+uW482JP66HUXAbgYkDCAiyj6dxV65H07zW9t7YYUupg8pGWj0Sbv0n9MQVkm7QNoQbddCl0JobvcfXIYHGUjI+dHnFht2wcGudTroyrx1o/e2oB/3zVA8HsNh7g7hIPL709yrlIpyfjgS83o7TJ3XY8iyR/n6y4tvX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Iv+32+pl; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-55f68d7a98aso1498168e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 04 Sep 2025 12:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757015857; x=1757620657; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6kwPz46AfjWSljE81nGPsJRjk/PBKufX3IFU3DIxO20=;
        b=Iv+32+pl+RF/5u9CXQ2H/5eyAmAkycT/gu4sr+1dppOQN7ClaN1+UkvsAo99TDI91J
         JZTVbf1mcgBfbJyKlqFd/ymeo2YWyWes8minSpK/VUiXqtkViDeOzo2lbrRAE5bQek52
         q7j1d2+8Ch3M7w8baGcVVxySNOnd3S8w3zQ1FKgO/1yjTjh5HXjnSgWETLcT72Gu/vjb
         ffs9gc7cT4wIel3sXqOYcTnic/NCW8dGMWJ7sHdrnzLj4QQ/LSUXF7Rmr0UlikLNkxeq
         gW2jIybvjzI3HKgnIZedva/HORa3f5dytWHHplPHe20DUd1v5W8Uzb2HzpDXsUZFSytk
         aCsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757015857; x=1757620657;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6kwPz46AfjWSljE81nGPsJRjk/PBKufX3IFU3DIxO20=;
        b=WixM7XYej8/3jqUW1yV+ecdCD48WYgDd/YW/H4yz1C96Aum6BREIb4bM2hThqJzPdX
         y2JiLXGtPkHXiuSFglaPgjPFoDiXcSBzBd/O7dpyr2d5PP+cN5dqQs9R1wGf2Kod/rP2
         ALioqAejOIX9AOhIqqoe/nWrCmGlBz8oIcBnW6BQVvt3+noTldTjqXM6j7K3qff0gZZa
         06UjBUVjrfDhthoXZs5AdUMtD8OZ7X5rvPOBUf32Ogi5MIWxm+hWkMyVQKTSQbJmUULi
         ZYZZiBW6zvCvdZ5q1Wq+2dVACTww9uVAi6mwcB9IP4NiXXq1EVELBz/gr6Qzugc8Cs1B
         Uu6A==
X-Forwarded-Encrypted: i=1; AJvYcCWDgg3/141MqIxpD2UGNC3p3SDmjFQ3/YUB/py8Sm24TNE97KhNzKh3RCuMZJNYsvPx74svZ1LfQQXr@vger.kernel.org
X-Gm-Message-State: AOJu0YxxrRfkxG5Xj9+b6kl+vY5okbpw5d/T1/Dm3eieUBX/yXM3CcS0
	0j0r/Cb7niPonC9H2Oh74L3Zr9jZficlfjm6U/BHOZM68eENH9kQUMVZUqnUdePB63Qn3wIW9qv
	EmiAqcf8jH6VAPtacKfvZBbzStX1jUyhOX/8/jdZhdA==
X-Gm-Gg: ASbGncu0QoJCxh+BryygWxEpfCVdLsou0bx62Nc14KoaGvpVkilq7m/AVs44mV5ouFu
	UiXeGiZaWEz8D329/JSwiCrubtk5V9xIVbkhRZ9dlU4CaLoTYoJ2nJfq/VlKeU8hSkwbSrOIf5p
	K7uxmXNtHVCFp8Nc6qhl4MCvC6EJ1DBj0xcCtlmGD6HX61mkF8mDO5jIFm3X2TlIbdU89jn5h+9
	SO1qiE=
X-Google-Smtp-Source: AGHT+IGSNGuoZa0tGd2MuceeY+rWx4+fE98zKz5kXJNG5SS9yafrJ2IfBrrLXPyBqms3qzMRhIcBxsxK/c607/IOLes=
X-Received: by 2002:a2e:a4d8:0:b0:32c:abf4:d76a with SMTP id
 38308e7fff4ca-336caf58af5mr43186631fa.38.1757015856723; Thu, 04 Sep 2025
 12:57:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250903-ltc4283-support-v2-0-6bce091510bf@analog.com> <20250903-ltc4283-support-v2-3-6bce091510bf@analog.com>
In-Reply-To: <20250903-ltc4283-support-v2-3-6bce091510bf@analog.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 4 Sep 2025 21:57:25 +0200
X-Gm-Features: Ac12FXySP_jPTakETmSTujg6AZkgjLE-3L81eBmgyMtwcrvqz9e4_hK7r8cr0mE
Message-ID: <CACRpkdbgcCjZbZ2HtrNO7vK1HXzrwxkrNFCzqGguq=ckKg3cFQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] gpio: gpio-ltc4283: Add support for the LTC4283
 Swap Controller
To: nuno.sa@analog.com
Cc: linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nuno,

thanks for your patch!

On Wed, Sep 3, 2025 at 12:04=E2=80=AFPM Nuno S=C3=A1 via B4 Relay
<devnull+nuno.sa.analog.com@kernel.org> wrote:

> From: Nuno S=C3=A1 <nuno.sa@analog.com>
>
> The LTC4283 device has up to 8 pins that can be configured as GPIOs.
>
> Note that PGIO pins are not set as GPIOs by default so if they are
> configured to be used as GPIOs we need to make sure to initialize them
> to a sane default. They are set as inputs by default.
>
> Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>

(...)

> +config GPIO_LTC4283
> +       tristate "Analog Devices LTC4283 GPIO support"
> +       depends on SENSORS_LTC4283

Could that be
depends on REGMAP && (SENSOR_LTC4283 || COMPILE_TEST)
?

Or does something blow up if you do that? (I guess it also needs
AUXBUS but more on that below)

should it also be

default SENSOR_LTC4283

Sof if that is compiled in (=3Dy) or module (=3Dm) then this becomes
the same by default?

> +       help
> +         If you say yes here you want the GPIO function available in Ana=
log
> +         Devices LTC4283 Negative Voltage Hot Swap Controller.
> +
> +         This driver can also be built as a module. If so, the module wi=
ll
> +         be called gpio-ltc4283.
> +
>  config GPIO_MB86S7X

This is placed among the memory-mapped drivers, but:

> +#include <linux/auxiliary_bus.h>
(...)
> +static struct auxiliary_driver ltc4283_gpio_driver =3D {
> +       .probe =3D ltc4283_gpio_probe,
> +       .id_table =3D ltc4283_aux_id_table,
> +};
> +module_auxiliary_driver(ltc4283_gpio_driver);

Create a new submenu for auxiliary bus drivers and add it
there. We already have a submenu for MFD so why not?

menu "AUXBUS GPIO expanders"
  depends on AUXILIARY_BUS
...

Have you looked into using GPIO_REGMAP?
I guess some specials are used here so maybe it is
not possible.

Yours,
Linus Walleij

