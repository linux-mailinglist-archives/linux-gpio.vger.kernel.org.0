Return-Path: <linux-gpio+bounces-24740-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B625B2F82B
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 14:36:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F9E31CC7AE9
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 12:35:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C11EB30BF76;
	Thu, 21 Aug 2025 12:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ECUKSgZ8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB89E19E97B
	for <linux-gpio@vger.kernel.org>; Thu, 21 Aug 2025 12:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755779725; cv=none; b=V6j8gq++UJ+68WQWFWITXrEeTEGCxw+Xc9vv4UzCL6MHyTJ4cS2xT2RaSdYez70I7RKsbmqDx6mZxIFB4NNlM2eVqfQW/LV6cjPrZcC4mzPoWG3WWAq/JsFDv3ywu26E0Ke+rZ/CPUu/wlMv4NbHBh2uPAfhsEFTGkphTFjqwWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755779725; c=relaxed/simple;
	bh=6SsyLR5JLHjbKtKd89+UE2OomTPPbF3m8LLiO2yv1Fw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bru29yOpTB9GjAVmAFSKx5CygA58kInINVNlDvwZ0/LtLdThqNvpJpVoX8cOSrai0GgXDCwzk7K2wRDeMMwDzdHlJ5uIOqlD+phbu783OY6ZaI/D+c9MzmUBjg7vsU0EYga4lJoxA1+cZAaND1mpLClFK1Ycthht/muJnT3+Isg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ECUKSgZ8; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-55ce509f80dso983975e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 21 Aug 2025 05:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755779722; x=1756384522; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GhK/5iEdOsHso7WQOtGlojYYvxbDlPHKTAFa/LVoWKk=;
        b=ECUKSgZ88yvUOQQSqH+KAq94mlBisWLvZo0kYCGyDd0SC2CIdfiMf76EY0kcPO/P5I
         BuxRrVAHVr6TvExHV+Vv5JlsXY8XytQZ+fmiDIc+L8g2G9L3iLI9UVIzwdjowxOd/lHY
         2I4nl9Y49+L3N0tcV3wQalryQqti1anNDxdmaxNNP/MYLSHX1FvBlaWsr+4DIpdc6gKs
         InwKiDuhwUGQndmCuG2tEvIQ31seIwiLoSV9RJcDYJtUsQj9/qqC3E8lJPV6+oLNmzMq
         AhB+hcYNahK8VuJuvdgtZG1KbbOwkuo5ZYVjhoEMsywnOk0eTClY1FLAcmh9zIyyOpBp
         TvkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755779722; x=1756384522;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GhK/5iEdOsHso7WQOtGlojYYvxbDlPHKTAFa/LVoWKk=;
        b=ull8zMWYVPCyFYwdzar31hEnsx7zAHmfzFHCgIOyn0fBZsBtneO9yOD2/Lm29USQRQ
         6AbQCeXVLXETuT2YW7dV5P+OH3u0y/mBA80D03u5VO2wrJjAxLmb50s+/NA6EUMXmT0G
         KuZfqMczAoRvAbZ97Duyx4inqld4EYwzY3EdW/TTIZPozipEaPjQJlMY+DYXBiT8PVS+
         86hBZPaCRJ71hzFMb281LoRjwbGI7QlhauHP973NAdHQHAyLPKxela9b6Ms7101EcsVr
         T7UmRaCXabe5CKWS77GzZduY6WgJY9rlpQ3bCNu3i0ZNtGQKZfD/3jhXh2lMETNMbYf6
         aE5A==
X-Forwarded-Encrypted: i=1; AJvYcCV1/WqUeGmDrh2DZg9MNc0VOjCAiqMy6LrcnIZaLkV2ipJlz8pfBLniVWl6Z38H7KVvcmSJz9B13PC1@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8Fq0n1fUjHsmX5IyxsptSoltXzBgvfH/WyueDw6on/8ZYTsO4
	/mXaPJD9c7FS2j3cOt9WL0Jq2Od7CGu2wj2g5cC6eyqD0CGKfAkVHFt5repsOv9PVJOTn6RDylt
	CFdRJdv+X10lOhhIAj2HAgDtPCPrAgXMCiCkDuLtvfw==
X-Gm-Gg: ASbGncvaWh/d7wIHFVqb5wCxz3p/SvXTodWoo5T+eietDsCpbdPKayw+G8P8b0QVBoy
	W0sFk+56GBxdjAGj0i5SfqtLP9KAT42zklJTL8TnHfdRlQs6C0YIGPryomC7gj3Yhb30CmzOa66
	RVpZFPz1/clYAMv1d5MRYGxwyzmpzuT2vgwOh8SVvdDmdK1MWhZOl8biNsYKsp2+C7ivwvUowVq
	UXe5Ak=
X-Google-Smtp-Source: AGHT+IGFT1SOHRHnznv0j24jQt6OItG+VkUUqGfuDCNg03+god9R2F302j/+MpxBGP6QnhkRVuIKkbhRbFIemE8O8FM=
X-Received: by 2002:a2e:3314:0:b0:32c:b83d:64ab with SMTP id
 38308e7fff4ca-33549f4a0e2mr4716741fa.24.1755779721325; Thu, 21 Aug 2025
 05:35:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250821004232.8134-1-andre.przywara@arm.com> <20250821004232.8134-7-andre.przywara@arm.com>
In-Reply-To: <20250821004232.8134-7-andre.przywara@arm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 21 Aug 2025 14:35:10 +0200
X-Gm-Features: Ac12FXyGD4nO__iucr4UwJuUtNZrpHlCHuWUThm0Y3PsAmwji1zokHx8_NHiyLM
Message-ID: <CACRpkdb-cudZE6mZH7vEOLU=aJFaNLX2dHz8Q_=2cfh1-JBRgQ@mail.gmail.com>
Subject: Re: [RFC PATCH 6/9] pinctrl: sunxi: add support for set/clear regs
To: Andre Przywara <andre.przywara@arm.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andre,

thanks for your patch!

On Thu, Aug 21, 2025 at 2:45=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:

> -       raw_spin_unlock_irqrestore(&pctl->lock, flags);
> +       if (pctl->flags & SUNXI_PINCTRL_HAS_SET_CLEAR_REGS) {
> +               if (value)
> +                       writel(mask, pctl->membase + reg + DATA_SET_OFFSE=
T);
> +               else
> +                       writel(mask, pctl->membase + reg + DATA_CLR_OFFSE=
T);
> +       } else {
> +               raw_spin_lock_irqsave(&pctl->lock, flags);
> +               val =3D readl(pctl->membase + reg);
> +               if (value)
> +                       val |=3D mask;
> +               else
> +                       val &=3D ~mask;
> +               writel(val, pctl->membase + reg);
> +               raw_spin_unlock_irqrestore(&pctl->lock, flags);
> +       }

This is now starting to re-implement the generic MMIO GPIO chip,
which I'm not so happy about, this is simply the difference between
passing just a single data register to the generic config or
passing a set and clear register.

        ret =3D bgpio_init(&g->gc, dev, 4,
                         g->base + GPIO_DATA_IN,
                         g->base + GPIO_DATA_SET,
                         g->base + GPIO_DATA_CLR,
                         g->base + GPIO_DIR,
                         NULL,
                         0);

...

I also notice:
pctl->chip->of_gpio_n_cells =3D 3;

Is Allwinner one of those drivers that could actually start using
select GPIO_GENERIC nowadays?

Please look at
commit bd3ce71078bde4ecbfc60d49c96d1c55de0635cc
"gpiolib: of: Handle threecell GPIO chips"

And the example user:
drivers/gpio/gpio-spacemit-k1.c
esp how it uses spacemit_of_node_instance_match().

If it's possible to switch over to GPIO_GENERIC this hopeless
maintainer would love if that could be done first so the picture
gets more clear.

Yours,
Linus Walleij



Yours,
Linus Walleij

