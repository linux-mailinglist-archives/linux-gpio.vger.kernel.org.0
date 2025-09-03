Return-Path: <linux-gpio+bounces-25531-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAC0B42670
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 18:16:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E0D218918F9
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 16:16:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB9462BF010;
	Wed,  3 Sep 2025 16:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="G419lWI3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F015F36B
	for <linux-gpio@vger.kernel.org>; Wed,  3 Sep 2025 16:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756916187; cv=none; b=hBSyKNNIjHCYnBqXwKm5z1fev6of5e6w46bsRyBCqbeQO/sdYI0jHz7kKRywBAr3RPG3Srnn3qeu40iGu8FhyZxRpzWaupfv/9TvrOit7tL0YDdJEEFvbg+323LLbcZadVNLZj1rvguo+sEo/85n0tqQsH8sXijNlk2ryxM2baU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756916187; c=relaxed/simple;
	bh=hLXU68EmiKde5eoDFzNCp09vveg2XPWuKlf9ZhrCMzI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d4OuxSWHBj6H+SirHa3S2Ejir70gBFDg0KodndHcLRXWxuW21DdYO72WRibcnx7JTvY9p4JqJdr2VqRHg98D5LTqn15wt8Js45eWUSwtRoN5OiLWC8pDPtg5g+4fmuRllYqHwqyCC+/f7P6wWXauPCnHgXrhcLT5PoWqWty+yTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=G419lWI3; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5607a240c75so3533206e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 03 Sep 2025 09:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756916184; x=1757520984; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JnuUgpoxqT/R2cHiZvXGYBC70wBbE5DG9KP+Z3Sy5do=;
        b=G419lWI3AZjnT0kK7L8vEpE/UTOz5T2VhGkKP52qFwcdPJpt50L7xzgLNX2vmt8bIc
         AuRcW8fNKLncIxSQJAZCHnEjX9UXM8/iKu3OmvahGfEy2jKrCwnVokWW/KCiMVksRbeP
         jTdtGnAOQVltnUku2tro+ilSyofPi+hX06uYsI+3DreayPWT/+ekXdEpSad7AP0iGy2M
         YzScFJtZVS0M4D3L/plJU4zU4k4OQKoO4+akZ9DNMtrlchiankGeFjbumExsEuSU6jMq
         XjqdsumvYELViRkMIg6Gjnm1DFtrGzOTZks4aWjybg20DeePsacHUAQfkVwjpGgLCWg8
         HghQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756916184; x=1757520984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JnuUgpoxqT/R2cHiZvXGYBC70wBbE5DG9KP+Z3Sy5do=;
        b=hpGLXJsX3Z8qEdTEaA85eWxm/EbCynndYVzl79LpqF3rBIOw7BA6xgt3WuneNXP0zw
         9YCLH8+TR7zUwWpuEDjZ4CPAOzUwhpXt3tI08ziKvxiBgB2bZvuuOGPYLHh37of90EQi
         qNC5Hv813q/wm5AtLv1Gxa/VXEdrYdtUkCxnU8UEPxwI8/QKIqceW3UOUT9AxO3bQCoy
         xIn3NtVkj8Gr3vBMzpInM2NsYLVa5yBN1ihPmUd0a5s3vjgETsX1nS0QrcsCBQqbjLo4
         Vbz7y9SNaUWJqmfQL5AI4pM2dASoJ5yw+SAeP3HBpQc7iUvy0QeD+nxakCdFWoA3cwiK
         1MCA==
X-Forwarded-Encrypted: i=1; AJvYcCVxExU37lH+nDSy6h7nKg861CMIO8vtPrVnNGRROVdY0MyE1ZpC23VlMpDnez8KlQJDLddIMLV+mgBx@vger.kernel.org
X-Gm-Message-State: AOJu0YzafY+ablM9PYKyUUOr66s4CxhYFXRegXcjHE7hpdRvAjTyA0Zx
	WEMOsNcZP9vq+XGiD+eJscAU8hulNDcvJftLlixOEj/BdyA3paEMlyNd7eJQZXgoPQwSxe2Aklh
	xyW2BXweO5lUXI7dIUcZNEcqiAotCuC3j1qmjouvK3A==
X-Gm-Gg: ASbGncshJawbuhk5Pd7SuYGHB5mXDip/JCtGWBp+yHohg0QS1vfrvpdVS+SLbjOsyRX
	paorWjQldYPlzZvI4Ap9agdaxqQv6XXDjt2WLxtDf9BA/RYjcl24akTGLTmlcY4KRVEkzW9IbHE
	0TqZZxxxMGIo43WCH8cd+wcTK7jbULmHjDHxgmOP8+8cjQmZDRc0GtyAT5V5VlZMYDj1wC8FTBg
	hkpHkfryLc6p0wyWnPZlQH5JURqNW2HDSa71OpKwvNg/JMBQQ==
X-Google-Smtp-Source: AGHT+IETvnuci7NX/iSfBNiVm70fb0ED1MLT3AMRYWYzaOQPVbLN1BKnBTrWBjGhb7WJoLmVGbMIstEEvAOjYxu1SWQ=
X-Received: by 2002:a05:6512:4608:b0:55f:639b:8057 with SMTP id
 2adb3069b0e04-55f708b33b2mr4219335e87.4.1756916183991; Wed, 03 Sep 2025
 09:16:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250825-gpio-mmio-gpio-conv-v1-0-356b4b1d5110@linaro.org>
 <20250825-gpio-mmio-gpio-conv-v1-9-356b4b1d5110@linaro.org> <aLhj6xsR-NepfRx0@black.igk.intel.com>
In-Reply-To: <aLhj6xsR-NepfRx0@black.igk.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 3 Sep 2025 18:16:12 +0200
X-Gm-Features: Ac12FXy4hHxwtV529JMcJlTzXuQUmxOxLYAQnOsq8scl9FcZoY_Q3ary9lE1izM
Message-ID: <CAMRc=MdDmPumdsrJ0ELPSgRB9UBzW8LcGBRSt5N71eZy21oDAA@mail.gmail.com>
Subject: Re: [PATCH RESEND 09/14] gpio: dwapb: use new generic GPIO chip API
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Yang Shen <shenyang39@huawei.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-unisoc@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 3, 2025 at 5:51=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Mon, Aug 25, 2025 at 11:48:50AM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Convert the driver to using the new generic GPIO chip interfaces from
> > linux/gpio/generic.h.
>
> ...
>
> > +static inline struct dwapb_gpio *to_dwapb_gpio(struct gpio_chip *gc)
> > +{
> > +     return container_of(to_gpio_generic_chip(gc),
> > +                         struct dwapb_gpio_port, chip)->gpio;
> > +}
>
> Since it's not a macro anymore it can be done better:
>
>         struct dwapb_gpio_port *port;
>
>         port =3D container_of(to_gpio_generic_chip(gc), struct dwapb_gpio=
_port, chip);
>         return port->gpio;
>

Sure. I already applied it so can you send a follow-up?

> Also, have you checked the bloat-o-meter before and after, wondering if w=
e gain
> something with this.
>

Not yet we don't but we will move the gpio-mmio-specific fields out of
struct gpio_chip so we'll gain several fields worth of memory per
non-generic chip system-wide.

Bart

