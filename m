Return-Path: <linux-gpio+bounces-19479-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F650AA1C55
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 22:42:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 471DE98802B
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 20:41:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9C47267714;
	Tue, 29 Apr 2025 20:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NICgK7IJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54892522A0;
	Tue, 29 Apr 2025 20:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745959328; cv=none; b=kCBG9vQY/Yot0o1uJaX76uqWA0odWI5ce+OX3OWwY+Rf69opgH1UReyG4a5adQPE1lYt5kEHtCgs+P+SuyO0PZyZ35j3DLsbOrx1Yf/b9fWRzAHRqkNnkOW8d+V8fFxuAeN0VdaM5aYVUxbXN6AwL2BkVjPlv29MCPvkiiI+S84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745959328; c=relaxed/simple;
	bh=sqw8u468bvWPhnZZvrvFjZOeJJxU6TLriFYsQyHe/Wo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TcxCkGn5kkg214biIxNNnACgGOvyyjSGLRia98QiO2iCETLd2UE1qchpQkf1STykAlmBjxg6gu31mdAvrSK+GQ3olWSrJ43SXUyWTocU1/6YcffCXOeP4C4KYlhopNwbq82I4VvevG2F1mc1fZv2QzRLm5/lXLaau98M9xKXZtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NICgK7IJ; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ace94273f0dso655741766b.3;
        Tue, 29 Apr 2025 13:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745959325; x=1746564125; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D1z/mqKv1IeI8pEEU6fVR2jhLi7rY9Y0QGzSV/lMhx0=;
        b=NICgK7IJSUPINy8cCaeGm81RW5I3/b5wgMm40+0sFEu2gLjK4/7sgfpH1l6QxKKXsH
         om+l1eqNQi4iJj/ia8Z7HY+bkYZj7u9cWro0fn8Mp7QxVdt4VC/tP4Tnd5gf008avK7W
         eHVRD22XxTWp5ExNePLs9lp0BGWANvXi3crNe3zoV/7DdhO3BUGsFfRO4MsLM+5iWj8O
         42cnZGwObX578ogKpGgWVC0eWFBC3g2oirY4WkBX2rZ1r8rdOMGopqv7WzcYvAU0qGsa
         mbWzlz55dkp4KhYRL1i/NtHmxIbrp04uLsYIGij1ZWIo6yrZeeA0ADNuI9y4TnTbaoXM
         Kaew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745959325; x=1746564125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D1z/mqKv1IeI8pEEU6fVR2jhLi7rY9Y0QGzSV/lMhx0=;
        b=jvB3i1qvktSA5/lvKrHUwc4bdmydS0pk18OLEj7qIFVOu6bJv7eNphfHGybHsw41e3
         3+Ke9l8iPv9kv+cPTJ90ISX2xE+hI9jKRTSxYBy/MpZj9XHYWPUMkNu4pVitA5RI3VFV
         3p2KjH/I9tenNcSlfTxN0Bv2gpE8GpUWeW83yhhlNV6Y1rC6TvG3F4CXH7AZvVTaHhN9
         BqoNoAxMJe2hYwaRllzFTPxRUIRZ4TGkdFpUChQSZIenoKXhGdMvbAXAQXfLrkJwS2XR
         pmlsVnDCin8E5pF4jAFHevRVbp56TwkoX6w+KFKgrlJ0Ey6f/CeHn7enFp6zoi6+b1y9
         72hw==
X-Forwarded-Encrypted: i=1; AJvYcCUChlpUHggl7sKKaG6qv5vjg+G4InorRt9gwry2Wi6a9BI3JXTXu5PupkDiqSGtlqlcoz1PXWMo9ph/ChtXvCxV@vger.kernel.org, AJvYcCVPvNKhZAxyGoJJyqstMwEfw+KxWJjwx/P+gChbim4/TlHi5SuzntqsQfFYZRzLloRB/fhmaR/7DC+G@vger.kernel.org, AJvYcCVqWtwnrNufMTbtJtGNnI4SUmix6erWNIC16zc2xuwQxoS04p4HsizsPF0wEzhXKJidSQ0Mjx0wsLY0sAMA@vger.kernel.org
X-Gm-Message-State: AOJu0YzEFPd9Y8gJlnkhqyqyAfUVY7BHOhb9FXQEv1XBOYBtPMs++3UV
	R31QfEWokZZbIw+QsN6atN4XQ/r9e57PmbAE5H6XMbGi9Ypnj47yk4k+WW/mYSLKULuvipBIW/S
	WeUyZZCU1vSs3l1vKBMOZSwD/cY0=
X-Gm-Gg: ASbGncv18n3IKbh72QuUxolLbZv5n2aglGL7S7/Uu9lwNg6V/mvyUb7v3fr65YmQxkS
	sLmV51c0VjkVXhUPIhpYW5KSCJr/H2JxuGuqytXYbMBWTLgQU2yI3VGt9TRV/lpiLTphEJ3ecUm
	L9C+s6EGC8tWGrbEK2wzy/3A==
X-Google-Smtp-Source: AGHT+IE14msetcDvHYj/CK4TchmcNPfTjYNeX1wqV1ziOxtznfOccILX1u8l/ZGo797xJvN0+L0UY0jzsPR+fFwsf1U=
X-Received: by 2002:a17:907:3f18:b0:ac1:db49:99a3 with SMTP id
 a640c23a62f3a-acedc73396bmr77444066b.40.1745959324967; Tue, 29 Apr 2025
 13:42:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429-aaeon-up-board-pinctrl-support-v4-0-b3fffc11417d@bootlin.com>
 <20250429-aaeon-up-board-pinctrl-support-v4-12-b3fffc11417d@bootlin.com>
In-Reply-To: <20250429-aaeon-up-board-pinctrl-support-v4-12-b3fffc11417d@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 29 Apr 2025 23:41:28 +0300
X-Gm-Features: ATxdqUH6LFL-Q-RdSyhm0fHJzj7z0eKXlWR7xvTBkFx2dpxSM6ZEfA2sxQxPlko
Message-ID: <CAHp75VfkJ8J=4zmRwjFjq49GRN-=6FCv=uU6+2NUxSW6ZZ+mnQ@mail.gmail.com>
Subject: Re: [PATCH v4 12/12] pinctrl: Add pin controller driver for AAEON UP boards
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 5:08=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:
>
> This enables the pin control support of the onboard FPGA on AAEON UP
> boards.
>
> This FPGA acts as a level shifter between the Intel SoC pins and the pin
> header, and also as a mux or switch.
>
> +---------+          +--------------+             +---+
>           |          |              |             |   |
>           | PWM0     |       \      |             | H |
>           |----------|------  \-----|-------------| E |
>           | I2C0_SDA |              |             | A |
> Intel SoC |----------|------\       |             | D |
>           | GPIO0    |       \------|-------------| E |
>           |----------|------        |             | R |
>           |          |     FPGA     |             |   |
> ----------+          +--------------+             +---+
>
> For most of the pins, the FPGA opens/closes a switch to enable/disable
> the access to the SoC pin from a pin header.
> Each switch, has a direction flag that is set depending the status of the
> SoC pin.
>
> For some other pins, the FPGA acts as a mux, and routes one pin (or the
> other one) to the header.
>
> The driver provides also a gpiochip. It requests SoC pins in GPIO mode,

also provides a GPIO chip

> and drives them in tandem with FPGA pins (switch/mux direction).
>
> This commit adds support only for UP Squared board

Missing period at the end.

...

> +config PINCTRL_UPBOARD
> +       tristate "AAeon UP board FPGA pin controller"
> +       depends on MFD_UPBOARD_FPGA
> +       select PINMUX
> +       select GENERIC_PINCTRL_GROUPS
> +       select GENERIC_PINMUX_FUNCTIONS
> +       select GPIOLIB
> +       select GPIO_AGGREGATOR
> +       help
> +         Pin controller for the FPGA GPIO lines on UP boards. Due to the
> +         hardware layout, the driver control the FPGA pins in tandem wit=
h

control --> controls

> +         their corresponding Intel SoC GPIOs.
> +
> +         Currently supported:
> +         - UP Squared
> +
> +         To compile this driver as a module, choose M here: the module
> +         will be called pinctrl-upboard.

...

> +#include <linux/device.h>

> +#include <linux/platform_device.h>

> +#include <linux/stddef.h>

types.h guarantees stddef.h, but having it explicit is not a bad idea,
so up to you. All the same for device.h included by platform_device.h.

> +#include <linux/types.h>

...

> +static const enum upboard_pin_mode upboard_up2_i2s0_modes[] =3D {
> +       UPBOARD_PIN_MODE_GPIO_OUT,
> +       UPBOARD_PIN_MODE_GPIO_OUT,
> +       UPBOARD_PIN_MODE_GPIO_IN,
> +       UPBOARD_PIN_MODE_GPIO_OUT

Keep trailing comma.

> +};

...

> +static void upboard_pinctrl_dbg_show(struct pinctrl_dev *pctldev, struct=
 seq_file *s,
> +                                    unsigned int offset)
> +{
> +       int ret;
> +
> +       ret =3D upboard_pinctrl_pin_get_mode(pctldev, offset);
> +       if (ret =3D=3D UPBOARD_PIN_MODE_FUNCTION)
> +               seq_puts(s, "mode function ");
> +       else if (ret =3D=3D UPBOARD_PIN_MODE_DISABLED)
> +               seq_puts(s, "HIGH-Z");

No space in this line?


> +       else
> +               seq_printf(s, "GPIO (%s) ", str_input_output(ret =3D=3D U=
PBOARD_PIN_MODE_GPIO_IN));
> +}

--
With Best Regards,
Andy Shevchenko

