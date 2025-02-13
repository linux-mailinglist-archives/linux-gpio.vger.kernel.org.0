Return-Path: <linux-gpio+bounces-15973-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F98A35227
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 00:25:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9B6F3AB2D5
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 23:25:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E56022D7A3;
	Thu, 13 Feb 2025 23:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V9/vsZhb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C221E22D78B
	for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2025 23:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739489122; cv=none; b=D3msP8sJAmpfgfH0ym+xps9V3D1bd7jAlESadDUXAUQdrL/k8jyH++KTs99tpg68hT8oyA+ECH1EvAn0Lau7vVms3GBGuzxF1qsXRPSTqB/9rTVtAxOubcTOgdwxA9K7TfFe4Udcfos9cO3SB/+xxxXoeXcL23rMF/r5uF3cSME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739489122; c=relaxed/simple;
	bh=TODc8kLM/Xouk8pD6JlJR6Tsa6qT4/CImIfhu4Qav8A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ri+Fm0PcVB8cHNNTUrDJhVGb6tfJ8kBA5qtmv0NxZSjhu+iOhQgleW2zMT+cD+VDAA2vLwuymhrFUdMo/deyHo2E1lpGUkzwpRy55ax2UrXZaQWpg8uFj3yRohArqI3HYhZ6s49IY1x33mT8YciJEvsvl7uV6EAnW9Jms8N7tfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V9/vsZhb; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-308f4436cb1so26189091fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2025 15:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739489118; x=1740093918; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vyZKU2VItF3c2AsSc7Vt49la6al69dnIjTLywWBtcgo=;
        b=V9/vsZhbz8h45mi2qIljX85+Eah2cWs/PgHrIaBI+4Pa85IqPyj5lve1ie6qFdla2H
         a6dYgZcQVZxID1bE86MWHYp1WLaSXxB1/7znttpDJeOLuz+suJKBHyCCq/V5YEB3EuGc
         J3QXEceByMTZpcby1zTrf7NXUb8UTXoj/3jHXWD3t6ahCCL5X+UGzwlUuYOx/yGoINqm
         mzN7v3DzXgGtMdeBBGtAyH76O+jgFaBrJ8wJ3+TIVbZQPEYi4mr3aOtG94JIHpLgnCLf
         nnJJF76wOe58OK81cDsw2doFXyzL9M1B4paXOaVjEGrX9mRwJKdTnl0UOKYycX4sFh9q
         i7Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739489118; x=1740093918;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vyZKU2VItF3c2AsSc7Vt49la6al69dnIjTLywWBtcgo=;
        b=Rnb7ruoaj1e0G22ohhwBb9c811JcwJ7C3BoOHbWRXxX6kWanTj7edrzf2hGuPs30zC
         ols+he0B7UwgRyjBX4TiL682rEgTrN72UEF26ZjbU9toG4PBrLsiBPOm4RdPlZsd1wVD
         4C8iW30dM6Ts389UqKnDzGFqt3HAPv2vpJPiFQpycdKx8XnCD+RsfhNHkkP7V/b8/15u
         qYmSDzKk2QYv3hi5wzOY3BbsQiu0Q2yl4GLrcrjEqGvtu0Er2RBFm097RCy7jOMRSfo1
         shuWac6OF73kwqkfHBb6fReKjO1ErJan7pMxLSieG7je+c0Lf5QKFgBgx0n6iEnAJjEL
         M+Rg==
X-Forwarded-Encrypted: i=1; AJvYcCVSMKtl5s+oc1QXMvM6NOg3lRqSWj0HFh6++EIamKTg9lGWZ5JdJ+81ywJRBPfOBQs1JIghQxTNkSDO@vger.kernel.org
X-Gm-Message-State: AOJu0YzWLYyMsFsBnIk9CYLOPtoNIfqR23ZL3FCx5yQyEVRESacKUrWz
	TaKW2iwKSGYlkBYds7fzhcAteLnwSx3XhRkVeWxYlRsCAAM0qLJ1B4dM3UTfC2S2wahjGARW6Km
	HeWxMZEl983pndHMiJmG6apypur5z/i3PN6USoA==
X-Gm-Gg: ASbGncsW5xetKUljpbbLVYbB+w0dtmtZtFRjLk4TSHy9DkWKJroAqulsYOEtMgdOpK5
	Kxnz+pfM1Qb8tDuqrbQZ0xRZQeQetpXt1QDDLd5LNv73UDHjatrgF/nKtocI1JCzUZPf3ywcN
X-Google-Smtp-Source: AGHT+IGmjAzrNY8Z0UTae5YliwRsM6MnTTixoI4bM9qkST97BNNxdmQbCoyn1pxrE+FZoDlCxTTPFfOz0rgkvbaPBag=
X-Received: by 2002:a05:6512:31c9:b0:545:6a2:4c4a with SMTP id
 2adb3069b0e04-5451dfc139amr1470866e87.1.1739489117809; Thu, 13 Feb 2025
 15:25:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250213-for_upstream-v2-0-ec4eff3b3cd5@analog.com> <20250213-for_upstream-v2-2-ec4eff3b3cd5@analog.com>
In-Reply-To: <20250213-for_upstream-v2-2-ec4eff3b3cd5@analog.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Feb 2025 00:25:06 +0100
X-Gm-Features: AWEUYZmhtXgqSIi7PU_BPNP_JIj58JJuOvAuh5G-9TQ2nJTUsjALSXHus6KTIHI
Message-ID: <CACRpkdZR8X17Bn-i2anqjxf0Gk60V175F7Xfwytkhy7_K+LsSA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: gpio-adg1414: New driver
To: Kim Seer Paller <kimseer.paller@analog.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kim,

thanks for your patch!

On Thu, Feb 13, 2025 at 2:17=E2=80=AFPM Kim Seer Paller
<kimseer.paller@analog.com> wrote:

> The ADG1414 is a 9.5 =CE=A9 RON =C2=B115 V/+12 V/=C2=B15 V iCMOS Serially=
-Controlled
> Octal SPST Switches
>
> Signed-off-by: Kim Seer Paller <kimseer.paller@analog.com>

OK so I looked at the data sheet and it looks like this:

A  o-------/ --------o B

It'a a switch.

Why is this switch a "gpio", other than that it is convenient
to use the GPIO abstraction to control it?

GPIO is usually devices that can drive a line high or low.
This is very far from that. This could switch some analog
line or whatever, right?

Now, the kernel does not have switch subsystem I think,
so this is something like a special case, so we might be
compelled to make an exception, if the users will all be in
say userspace and make use of this switch for factory lines
or similar.

Otherwise there is also drivers/mux, but maybe a 1:1
mux is an odd type of switch...

> +static int adg1414_spi_write(void *context, const void *data, size_t cou=
nt)
> +{
> +       struct adg1414_state *st =3D context;
> +
> +       struct spi_transfer xfer =3D {
> +               .tx_buf =3D &st->tx,
> +               .len =3D count,
> +       };
> +
> +       return spi_sync_transfer(st->spi, &xfer, 1);
> +}
> +
> +static int adg1414_spi_read(void *context, const void *reg, size_t reg_s=
ize,
> +                           void *val, size_t val_size)
> +{
> +       return 0;
> +}
> +
> +static int adg1414_get(struct gpio_chip *chip, unsigned int offset)
> +{
> +       struct adg1414_state *st =3D gpiochip_get_data(chip);
> +
> +       guard(mutex)(&st->lock);
> +
> +       return st->buf & BIT(offset);
> +}
> +
> +static void adg1414_set(struct gpio_chip *chip, unsigned int offset, int=
 value)
> +{
> +       struct adg1414_state *st =3D gpiochip_get_data(chip);
> +
> +       guard(mutex)(&st->lock);
> +
> +       if (value)
> +               st->buf |=3D BIT(offset);
> +       else
> +               st->buf &=3D ~BIT(offset);
> +
> +       st->tx =3D cpu_to_be32(st->buf << (32 - st->chip.ngpio));
> +
> +       adg1414_spi_write(st, 0, st->chip.ngpio / 8);
> +}
> +
> +static const struct regmap_bus adg1414_regmap_bus =3D {
> +       .write =3D adg1414_spi_write,
> +       .read =3D adg1414_spi_read,
> +       .reg_format_endian_default =3D REGMAP_ENDIAN_BIG,
> +       .val_format_endian_default =3D REGMAP_ENDIAN_BIG,
> +};
> +
> +static const struct regmap_config adg1414_regmap_config =3D {
> +       .reg_bits =3D 8,
> +       .val_bits =3D 8,
> +};

This is not how regmap works. Your get/set callbacks for GPIO
should call regmap_get() and regmap_update_bits() to get/set
the individual bits.

So the adg1414_spi_write() needs to be done from inside the
regmap abstraction.

Yours,
Linus Walleij

