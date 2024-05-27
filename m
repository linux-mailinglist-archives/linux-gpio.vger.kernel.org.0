Return-Path: <linux-gpio+bounces-6651-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B26D18D000D
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 14:32:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E43E91C22198
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 12:32:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 389FA15E5C1;
	Mon, 27 May 2024 12:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zm2sB3HX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD1413BC31
	for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 12:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716813125; cv=none; b=m3WbjUJWcFGwVwwx6lqASnsRtURgpMw2bcI7n/dQVeiOHX+w3OHRuE817OdNtU42NLVSb5mYNhbi5+UUl1yCYupwF4u/YP0oUn3cMBzld+tQD8310TZCtDxc6K6x1RbiczX5+jYH4B6eQp/fKeHNl2mxifXHe+NsTd/sy9LmpQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716813125; c=relaxed/simple;
	bh=goUxZvIFN/u5EojLxx/8XlvUz1D2u0hDwKrpvKzzkOs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sSerbxXxSke+4qvZ7VyN48pxVEik+EFjTIz8Tp6k3IxMV7YkJaoDpV1EheiEu9JT7SfCwdhOavhpuhOuoEo87qEeaX7HEAD8n2Cx0RP/xedkl7xTifLraGinQAcs50ztT4CadXxlzTbdIEwAXpmmy0HN/clsPYpnvU+vLO9axd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zm2sB3HX; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-df7607785e9so3443539276.2
        for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 05:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716813122; x=1717417922; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJDUGLRRsJ0ivWLRLg9qi0jczqwj4hSiWcWfn/3vXsg=;
        b=Zm2sB3HXlYpP98E0ld4n3B7LgvUwguSUtQ21GGd0yRALluXUIL0yIbqkxSchqAXOsR
         LxqVz+WMBtM/I3jRVcNOORgmptvrWd0y87ZMdcyg2ueMdwzJJXD5vNxcdY9t4A4Gu1rP
         wcSSkwYMEv2acmmMNFM1DyMa8zwvPxsvJAa8LLHtoXfSK+/wnDI2A+jiNU0uGaI+1NgF
         H8y5g9ZaOCl/+0uvJZmsXeJl1U3EccnD0dSe7OPt3A7wHcjDalVYLUaDegI/tZbuCBec
         H9jTJKyya2JVB0dcLuqBDtuUpas2Pi7uFoVNEUeoFKIqpGPi5Pp/TYYpsJOV2YAsMOHG
         M0+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716813122; x=1717417922;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZJDUGLRRsJ0ivWLRLg9qi0jczqwj4hSiWcWfn/3vXsg=;
        b=G4qYobitMy+IOQor26ugYg5mckS0sHVVjbn7T5d0SwLnUuYrFoBRs6hgp618UfGVif
         x8H5XgN8mm8u5+pZoCR12wIqvBVYBRX2l0iZyfvHYNyiDrb+d4bY49a5y4qF2BCzqAFU
         39mbeLhuluFOUN0nQphvXO/+WIt1WNqVCHJTRjkYmUXVsirWqfKbw0q3C3ARYsD3qrGf
         bATr6luwT4Vf/Ch5Z+muvRTxAN0iA+eQAzVYd9ick0E4HZDv28apsD0dfk2IOxbzDg+A
         Jo0nFEsDDpbhlfEgrGm1EN1niZpkfBR06ptbkA0xhxvKPrVZ/vsi7Ofpv6KR0nFpi3bf
         Iccg==
X-Forwarded-Encrypted: i=1; AJvYcCWzy6ipxOw09zJXJB3bgNj6bfr8jWfRcEA/KJ9VQnYMgeLhbkeN7YgHfQqdqERcp5oBKAB7sBcp9tIPWS0oPOYVttzVexZwpbc4DQ==
X-Gm-Message-State: AOJu0YzdWwCpNdZ23xmoUCOgaRlfZlxVtbGFyj9a2X330PXSZGWpM0bj
	5blbQwj/QelQOl+UIm7pYHtKpNLzsZ1mUfFvOTNaHy0yfyN5UgDltWZhkdplkVLlIaSoxF5pkD8
	ed4lWO0NTiQwGLcW8+7AZJ/FN5m29iqgNRuFdG45GRyf7O18bbs9osc0G
X-Google-Smtp-Source: AGHT+IFbWEK6qKocYhw6f8EvHhlrGAgfVZ6YKjWo+tvRZyGR5zLrpIUyxn/pC4oFmBGHvnvExLlnPLbfXeXIcI3u80E=
X-Received: by 2002:a25:abeb:0:b0:df7:69a2:f823 with SMTP id
 3f1490d57ef6-df77215546amr9090048276.7.1716813122592; Mon, 27 May 2024
 05:32:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240503111436.113089-1-yuklin.soo@starfivetech.com> <20240503111436.113089-7-yuklin.soo@starfivetech.com>
In-Reply-To: <20240503111436.113089-7-yuklin.soo@starfivetech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 May 2024 14:31:51 +0200
Message-ID: <CACRpkdajd1WkzscPiZL8JKvf10VHy5ppYjy-zAOaNTh0cFXtbQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 6/7] gpiolib: enable GPIO interrupt to wake up a
 system from sleep
To: Alex Soo <yuklin.soo@starfivetech.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Hal Feng <hal.feng@starfivetech.com>, 
	Ley Foon Tan <leyfoon.tan@starfivetech.com>, 
	Jianlong Huang <jianlong.huang@starfivetech.com>, Emil Renner Berthing <kernel@esmil.dk>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Drew Fustini <drew@beagleboard.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 3, 2024 at 1:15=E2=80=AFPM Alex Soo <yuklin.soo@starfivetech.co=
m> wrote:

> Add function gpiochip_wakeup_irq_setup() to configure and enable a
> GPIO pin with interrupt wakeup capability according to user-defined
> wakeup-gpios property in the device tree. Interrupt generated by
> toggling the logic level (rising/falling edge) on the specified
> GPIO pin can wake up a system from sleep mode.
>
> Signed-off-by: Alex Soo <yuklin.soo@starfivetech.com>

This is a very helpful patch I think.

I'm looking forward to the next iteration.

> @@ -1045,8 +1047,15 @@ int gpiochip_add_data_with_key(struct gpio_chip *g=
c, void *data,
>                 if (ret)
>                         goto err_remove_irqchip;
>         }
> +
> +       ret =3D gpiochip_wakeup_irq_setup(gc);
> +       if (ret)
> +               goto err_remove_device;

Do we have any in-tree drivers that do this by themselves already?

In that case we should convert them to use this function in the same
patch to avoid regressions.

> +static irqreturn_t gpio_wake_irq_handler(int irq, void *data)
> +{
> +       struct irq_data *irq_data =3D data;

I'm minimalist so I usually just call the parameter "d" instead of "data"
and irq_data I would call *id but it's your pick.

> +
> +       if (!irq_data || irq !=3D irq_data->irq)
> +               return IRQ_NONE;
> +
> +       return IRQ_HANDLED;

Please add some debug print:

struct gpio_chip *gc =3D irq_data->chip_data;

chip_dbg(gc, "GPIO wakeup on IRQ %d\n", irq);

The rest looks good to me (after fixing Andy's comments!)

I would perhaps put some
debug print that "GPIO wakeup enabled at offset %d" in the
end as well, so people can easily follow this in the debug prints.

Yours,
Linus Walleij

