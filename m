Return-Path: <linux-gpio+bounces-15481-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC12A2B16D
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 19:41:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3775A7A413B
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 18:40:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 235D71A071C;
	Thu,  6 Feb 2025 18:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a94DQrux"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5142219F111
	for <linux-gpio@vger.kernel.org>; Thu,  6 Feb 2025 18:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738867251; cv=none; b=H9ssSoDNul7Ur6kSAgLrdlaF1Zn3hpD3rQpN1fzw9qT4auYCDIe5ohOBVCZYGarR83fbOSq1rOO3ErBsoFbevv7xY/5iIE0EMEo3/f8p3dWdbEEAYLHao2CXyqKww8Ix2qyoUZKNk4730E1ITghQN97HjIOem0TnI9tXZJEnVSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738867251; c=relaxed/simple;
	bh=Lf6xAoUU7NXYgLYtGsalOIOw/EEkhs0Vm3ezNCm6rGY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=huODoQiL+Vxn+ZXznVa/r8myXVlzZw8QH/iDZdF0lC16jAWZFMFxX1moLA7YYoy95kW50wmVVOoHtaZAp85pdPm1egnaluTWfXV+RYZnYtgPZuAyPCYc6RS3OZSYSbHOra2aKEzELL1EALAPhcNmcbEeMUQmpSnWWtOk3pUseO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a94DQrux; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30761be8fcfso12423881fa.0
        for <linux-gpio@vger.kernel.org>; Thu, 06 Feb 2025 10:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738867247; x=1739472047; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B/1KLNT4FmOlGoDXvAF/z9DFY3XvpbckXqXugGtWIbQ=;
        b=a94DQruxT7agE1iI+jz5k711GH1Zt4b/y2JJsktdmNJl7WbFdm6QLTYYEUMK+sVzCR
         CAokLQaiB+G5a84ZlH570s4hQxAbrdvHpeavR1ywQrJPl1pRV3Q2D4nxNa/8OXOnHf/6
         KdY3MjspdQmYzx7gY0aN+sO4auX78zYm71TbWyqbCqUna5mHb3I10GUP9AQpX2EQ6TEL
         p64pBZrWC0nyAc6+sqUw/nPDDQOZRHZ7s6rZlYEidrKXr746QH1364cJmGtl+TXBeGFq
         9ugkeEn08pbgCHOYxCYyLDUL1MHqzJjq3c17Z7iQR2beh26uOGMYROWj7UZsmC7Jl6n9
         60Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738867247; x=1739472047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B/1KLNT4FmOlGoDXvAF/z9DFY3XvpbckXqXugGtWIbQ=;
        b=oFjJKFEhAbkoTQL0Y9h4vF1pRVN7ZzLoPXpx9gSPnfl+uQTXTIL+p3rMDRcLWfNQI7
         dE6HP/eeh9w/pkUlY5x98kafq2bNVWf+Pls7gOCiJZ18vpdSZgf9GNWtXQdpfzsWwTfa
         VzNOYUlk4+esKrMDYlIzDwDchm/vmBgU/mX5HSfMsn+DL3/kUkrcAhhLHl07cWDWTcz7
         Ud6GZCaozisGluBlfiM+Zkb3RATOrR9o7lXVbvuMz37j2dRVdewMYJw1AqOA2SAoA29g
         /AxmtXcmVPidDXgMdDeP7Oa+akBc/JddntcWSqICrdcmaN7YSvtXVPA8JPDeYUT2nzGt
         eFTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWN3G3xdJXFTde0VES2llqvq9GYJhvmkxlw8GiXlQDsPox23t7KDXno/Is8GzZlPDx3LxtkJUNNZY6x@vger.kernel.org
X-Gm-Message-State: AOJu0YztueJR3jljPrKLtgh7cReac/5tqwWO+d+g6i68uAWmpNekCWoz
	H1m3S/XrIBEIeGyvtv6hQItdyyWY3EPbW7VkJLgpu0lxpXOOPcJXNBl8Dls62sYSqekgtDRbYHe
	b9EIZ89EYEw+diefQvbSRwB9mslAthomVQLtZqA==
X-Gm-Gg: ASbGncsvbJml7wX1Qaf2L+0uj5Y56zDxoI8VWpHcerUu9pYtVDrKZXlNHDoknRNMx5O
	RfpJRoou2gWkir+mGIEwmZGnvlNiiGCopBvzx5zO8PMUXgLm3dO510mZfyS9Ij/21TyOIPIQ=
X-Google-Smtp-Source: AGHT+IHspHnGQVYfpoYQGi9ctVZueJrpds613XgEY1o23R9cbS1fqYkeI3XWSr+wkrN1AUux/D6h/Xqji3ktxx+ndmY=
X-Received: by 2002:a2e:bd8b:0:b0:300:38ff:f8de with SMTP id
 38308e7fff4ca-307e57fd2f3mr198711fa.16.1738867247273; Thu, 06 Feb 2025
 10:40:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250131163408.2019144-1-laurentiu.palcu@oss.nxp.com> <20250131163408.2019144-11-laurentiu.palcu@oss.nxp.com>
In-Reply-To: <20250131163408.2019144-11-laurentiu.palcu@oss.nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 6 Feb 2025 19:40:36 +0100
X-Gm-Features: AWEUYZmtqR_uDonJm17O7Egr0R6Qg4Q94CdBZrZSOSqXSwlcXN7zzDhUzAF6Dck
Message-ID: <CACRpkdYo9690n57FYAM1heSU+zGTKuze8B3d+Q4Py=HJr34-Eg@mail.gmail.com>
Subject: Re: [RFC 10/12] staging: media: max96712: add gpiochip functionality
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurentiu,

thanks for your patch!

On Fri, Jan 31, 2025 at 5:35=E2=80=AFPM Laurentiu Palcu
<laurentiu.palcu@oss.nxp.com> wrote:

> The deserializer has GPIOs that can be used for various purposes. Add
> support for gpiochip.
>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

Since you are using CONFIG_GPIOLIB unconditionally you need
to add

select GPIOLIB

in the Kconfig for this driver, or the autobuilder will soon start to
spam you with compilation errors.

> +static int max96712_gpiochip_probe(struct max96712_priv *priv)
> +{
> +       struct device *dev =3D &priv->client->dev;
> +       struct gpio_chip *gc =3D &priv->gpio_chip;
> +       int i, ret =3D 0;
> +
> +       gc->label =3D dev_name(dev);
> +       gc->parent =3D dev;

I don't think you need to assign parent. (Default)

> +       gc->owner =3D THIS_MODULE;

Or this. (Default)

> +       gc->ngpio =3D MAX96712_NUM_GPIO;
> +       gc->base =3D -1;
> +       gc->can_sleep =3D true;
> +       gc->get_direction =3D max96712_gpio_get_direction;
> +       gc->direction_input =3D max96712_gpio_direction_in;
> +       gc->direction_output =3D max96712_gpio_direction_out;
> +       gc->request =3D gpiochip_generic_request;
> +       gc->set =3D max96712_gpiochip_set;
> +       gc->get =3D max96712_gpiochip_get;
> +       gc->of_gpio_n_cells =3D 2;

Isn't that the default? Do you need to assign this?

Other than that this looks good, so with the small fix above:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

