Return-Path: <linux-gpio+bounces-3601-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3D985EB5A
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Feb 2024 22:51:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 68590B226A2
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Feb 2024 21:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01EAC1272A9;
	Wed, 21 Feb 2024 21:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w6LolOgQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7172574F
	for <linux-gpio@vger.kernel.org>; Wed, 21 Feb 2024 21:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708552287; cv=none; b=LZEvyJHh57Qkncakg5Pkcb0+uVuEXkQ6CI65nTV9lrqVs0oulEK4RNGLbYAghqk2DX9JkeWe/qc1wJ2yUGkD9DfJzlzBbIdhOSqEBZhv9135LoLW0tMxCrmlElogymOLCOye1R4dThJLyOpVwa0Eh2hbFwHjCKIP2sLsHt+iVFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708552287; c=relaxed/simple;
	bh=+z7mNzNxlJ/8k9LaMUX5Z/36a7oWxQduTdbpVjbTwXo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GzZ5BuDh8ut0K6FARsu0zxEljdyO8GkgPzzUbEDWIFPUSRmfoPd9qobTGf0HXXdsGIiGhKAeDcjrZEGR5adya6pu6NGzX2QAzQIO4cVPuUGLnl+MjtZ5DN3ONmULwSHgZh3FEIX4KvEHcsvetlp8pY/tPljb8by2laN/jaLD8hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w6LolOgQ; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6079d44b02bso52050797b3.3
        for <linux-gpio@vger.kernel.org>; Wed, 21 Feb 2024 13:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708552285; x=1709157085; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0yHRJigbA+0gNb0mcx+skQZzaB/lwBVYR+HxKRzHC0s=;
        b=w6LolOgQ/OTyCZq5SvGRCqqt4cEgLJ0zQIDlhq0GhKzGgjcD8IblnuiAycFzV0jGi9
         7fDDGph7izOYZC1W95md+OGRY/712kvo4pMWu2zeHofBa7FgFzsaab9+aZQdtsE5ycz6
         XH8n+XApKIN5l+mN/hfyFAiskdnUxRS6iM2qSDrCVG3blmQCmjU+f0odT+aG4mrp/dtT
         XA7T0spIvS4BwCsTXtwnhkrUAzYSnfmikE68pm5CVDmeHrYE0nycljSP33Gg9ensPys2
         VPW+xkwab/IfcR97yTN1whkdUqPjECuQgWSTcHkENtZI4tNZieeIRJ54/puqjxDIe5J2
         4Rpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708552285; x=1709157085;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0yHRJigbA+0gNb0mcx+skQZzaB/lwBVYR+HxKRzHC0s=;
        b=Q4Uh44K/69ZU7SFIV0pPIjO4aOx2dTz/KGwYItnyE/pTbwKi/FWg6f1MKW8+J5JjQb
         rRw8NcAewD3m1xxMfOv+52B9dNdbfOPKLO7g1oWdf/Ue3RA6CUnfjsfowjGSI2CbKIjQ
         89IZp/Gg6l0ME4Q/lK+xmzKjzWr9bQlFNn/3XC5U4xR5OhbIhUu+mKRkWotKKmj+AL02
         b5e3WWhT9xud7nUOQwRuzP0yNeq/4pGIAn/roAtuMQLbYtvQCs3iVLe0dbjlqrlnmQXR
         d6HHi/ny7Vwqndw+yGGysjUaB7gLhlTEo251EujbA5sA+flJnwECcm1JO/wC7knlANwf
         QEzQ==
X-Gm-Message-State: AOJu0YyWjBlBH+Iuma0T/B3MRyf2FCBdmMXEAn8wHbkOGCGY8wyeThNr
	jDbD7tgqs3eclEY9R/zg2owx37BmoK7dxv/ZOAlwEdnPm2n32x4+DQR6SKb4Zbni0l0MA5t7T5t
	BUT5QrZxvG5hSDB4VDeJL6UNE+V4TQjti6AB47Q==
X-Google-Smtp-Source: AGHT+IGS7/XhSREfIQd1AJ1hlUeiLQ0xU3Bcsk5t7ld4ZD3DAXeiBx+CuQ7aZnepHSydUKXYwYjmxyaU+MJBRil5yZg=
X-Received: by 2002:a05:690c:82e:b0:5ff:b07c:adb4 with SMTP id
 by14-20020a05690c082e00b005ffb07cadb4mr15829487ywb.45.1708552285238; Wed, 21
 Feb 2024 13:51:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240215083328.11464-1-brgl@bgdev.pl>
In-Reply-To: <20240215083328.11464-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 Feb 2024 22:51:14 +0100
Message-ID: <CACRpkdYhWk1dHeDHOf+6LM8gZ5Oh--6mpeeA7wskDFYZ-2cmJw@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: provide for_each_gpio()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bartosz,

On Thu, Feb 15, 2024 at 9:33=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> We only provide iterators for requested GPIOs to provider drivers. In
> order to allow them to display debug information about all GPIOs, let's
> provide a variant for iterating over all GPIOs.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
(...)

> +/**
> + * for_each_gpio - Iterates over all GPIOs for given chip.

Does this really intuitively fit with other functions named for_each_XXX()?

> + * @_chip: Chip to iterate over.
> + * @_i: Loop counter.
> + * @_label: Place to store the address of the label if the GPIO is reque=
sted.
> + *          Set to NULL for unused GPIOs.
> + */
> +#define for_each_gpio(_chip, _i, _label) \
> +       for (CLASS(_gpiochip_for_each_data, _data)(&_label, &_i); \
> +            *_data.i < _chip->ngpio; \
> +            (*_data.i)++, kfree(*(_data.label)), *_data.label =3D NULL) =
\
> +               if (IS_ERR(*_data.label =3D \
> +                       gpiochip_dup_line_label(_chip, *_data.i))) {} \
> +               else

I would call it for_each_line_label() or something. I try to avoid using
"gpio" in function names as well because of ambiguity, I could also go
with for_each_hwgpio_label() I suppose.

With some more reasonable name:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

