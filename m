Return-Path: <linux-gpio+bounces-19475-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6205AA1C17
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 22:25:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC3531BA7B93
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 20:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E91622641F9;
	Tue, 29 Apr 2025 20:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SHeVE5pZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19062259C9D;
	Tue, 29 Apr 2025 20:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745958274; cv=none; b=TSjhLqOskAIu+kqu9206Y0m5FpC4yEMhOoLhVXDuy7jLSbg98KGDKuXvZDcGZyvHeDLGsPfj3U7hPvMET5A3yd1yrNGQ4RFnQ+j8bV9U4F6WDKtGTrdNayqS5HfEo12qjYgnZdIBT9JGNBSJ/hfW35ActRX87iKhs1OQ+p/u0LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745958274; c=relaxed/simple;
	bh=Sy++56/htz/lCFh726YRJErj1jbe/6zhip5jyJNmA0c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MCtb0bV2r3745BkU6jMcPB6nfLAE/B4qjJjxWr3ZTO/mfc8QlJDr16EDnTzhI/5rIDLwJvNIGG0nQ7aRSFH1/aKF2UsWL20V12iz7cOf0hbnpL0ruCtlsWM6w56b34kJq4X8d3+uXQoxTFK7yFs1QS0zkUSuxvBqXHMVMlHXSCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SHeVE5pZ; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac2bdea5a38so953661966b.0;
        Tue, 29 Apr 2025 13:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745958271; x=1746563071; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D58KDEeeLFwkq7sOUEqzPBNZWBGghyoE7EpH9ga9vn0=;
        b=SHeVE5pZn545dn5N0m+aDDrWc+M2zXHoQRUB/ggiS8+YaTJ7jzaDj+ln0CH9XIXWpz
         P6xJ69L6n2Mtm1cJR2GepZFtPmXV12ToLt0qtwk5xB2sxjy1ViHf0nIynZDj3ZoZCQfR
         GhOcW1wWY5YbH++U2VOIrT0H32zD/aNiP2TMceH5ounVcYO9B5c7SWyiCSSqwXVfPWTD
         Lco7jGmGen8GV1sG7iOzOGkI8QanvrkGBYy5H2WjC2/xNFOYrQDdAbYwx8NRhUC3oub0
         oBGO4Zh7UrCDxCUltwz8m4gCoX0J0yBayPdVWw7hpq6KXQIFm9w0Fk9KFROnLBVK+sJp
         apQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745958271; x=1746563071;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D58KDEeeLFwkq7sOUEqzPBNZWBGghyoE7EpH9ga9vn0=;
        b=HsCn3mMphsxwyMMuEtCC1a/smufgAyA8FSLvysZXsRr4eRDjjVBm2DJw18dv0cLcLM
         5cf0Bku3apWQ4LR/AHYX4jsexoPodNDZZYzl/hfKpWse97338ZBg8b/it2HutMecasxT
         m0RMk3rOeX2gKXwsgFr6NcKi7Y8Aedqm/iekNAwb/95W9WqNHND17WIimbPE2+qCpKgt
         U64z6tHSKIBW33gICcsOhl5iHVefqXy41LUI8CqynSXh1WSSmPxexYSRZ5ku2PCbU3Vq
         Zdx0BoQUO7GWsqawJFD3MQv+qNMJlyPUsS4dfYVA6WTSAdiuVbwacpw6bHX/LQWE9XuE
         RoSw==
X-Forwarded-Encrypted: i=1; AJvYcCUJifMDGNoEZ8oAv10LJpa9NHqSMI82fJ7zZ1gdBTBs7PH6HTk8uADma36SsT2Xvn0wMmDRkVTHVQo+zE4G9dUA@vger.kernel.org, AJvYcCUev2wTmCsi+SSAqQxbfIC654JiKKnw8M0nxEyBEU+pf7e94/lNQPRmQrpoZ7SKcTt1SjbuR3qNQ/HXfpgv@vger.kernel.org, AJvYcCUgCw4iHYFP3DFHVEBgztGaKNdDmxv4t+grgktCRgVJxXoq2FfbcV8IRoUTDiwUn3Ht+opAHSmIYcvD@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq+tKuHblyWvszoFjdkSyjrJjBhdhH2ppQP+qBolx2C8++uBWV
	ApMhmHJA8qWLhsnivQWlOc/CmEQBWY1w0s71SPZEO2Ws9sfx6zLKl3QtbhfUObDp3gNHRkWYZ9G
	zpAO5mBjvprFy+4NVw9OhF88g5Y4=
X-Gm-Gg: ASbGncu+C5cwQs6i3WXpwGTkXKKD1d3OO2JlKpU2tNQ/Y1B4tDDIgZ8fo5YSK16Vbk5
	KtUL0NZWLK0cdFXGk+GI71GVNnXVbwIy3hRBWEbJRUDNqMKehlbdqbKLqN9+QgO3CY1mHEQXY6+
	xdWI5mrpxxKts871fxdCN2Vu0EFYmkDDEB
X-Google-Smtp-Source: AGHT+IHBtv4uogaGVAMM2SvzDSyjPxbeQHFYr+EkNqAxs8XwhmNRc7T1jbj8mIckK4lVLCIwUGDnJNBgqMLcbM+C6Gk=
X-Received: by 2002:a17:907:2d12:b0:aca:e2d6:508c with SMTP id
 a640c23a62f3a-acedc764c61mr73166166b.56.1745958271235; Tue, 29 Apr 2025
 13:24:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429-aaeon-up-board-pinctrl-support-v4-0-b3fffc11417d@bootlin.com>
 <20250429-aaeon-up-board-pinctrl-support-v4-9-b3fffc11417d@bootlin.com>
In-Reply-To: <20250429-aaeon-up-board-pinctrl-support-v4-9-b3fffc11417d@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 29 Apr 2025 23:23:55 +0300
X-Gm-Features: ATxdqUF3qdUj08hG6Po9xtoIg-BOJVobn2cE8_fU_bUd8MwIcsff-2XPlxW1o8k
Message-ID: <CAHp75Vdgezkc3-4a0jSG7qkvL31xdde8jSwTtWqct3dUVBm8=w@mail.gmail.com>
Subject: Re: [PATCH v4 09/12] gpio: aggregator: handle runtime registration of
 gpio_desc in gpiochip_fwd
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
> Add request() callback to check if the GPIO descriptor was well registere=
d
> in the gpiochip_fwd before to use it. This is done to handle the case

to use --> using

> where GPIO descriptor is added at runtime in the forwarder.
>
> If at least one GPIO descriptor was not added before the forwarder
> registration, we assume the forwarder can sleep as if a GPIO is added at
> runtime it may sleep.

...

> +       /*
> +        * get_direction() is called during gpiochip registration, return=
 input
> +        * direction if there is no descriptor for the line

Missing period at the end.

> +        */

...

> -       if (fwd->descs[offset])
> +       if (test_and_set_bit(offset, fwd->valid_mask))
>                 return -EEXIST;

Here you should add the entire conditional and not in the one of the
previous patches.

...

> +       /*
> +        * Some gpio_desc were not registered. They will be registered at=
 runtime
> +        * but we have to suppose they can sleep.
> +        */

> +       if (bitmap_full(fwd->valid_mask, chip->ngpio))

I think I don't get this check. The bitmap_full() returns true if and
only if _all_ bits up to the nbits are set. In accordance with the
comment it seems you wanted something different (an opposite?).

> +               chip->can_sleep =3D true;

--=20
With Best Regards,
Andy Shevchenko

