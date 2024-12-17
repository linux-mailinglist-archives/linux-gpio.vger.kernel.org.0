Return-Path: <linux-gpio+bounces-13965-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DC39F4D6B
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 15:17:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF66F188143F
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 14:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DF4B1F37BF;
	Tue, 17 Dec 2024 14:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cOM/Dfvi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EB23398A
	for <linux-gpio@vger.kernel.org>; Tue, 17 Dec 2024 14:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734445019; cv=none; b=pXPhH1o7GiHDZvDQYySMiqClFVnUiiytgnfvzZYZjEakLGKc9U63xHVLFHRfbS5CGyvwieZz8uo//wTrLKOtwV3z60JzSp9EHVq5WEptqK3xM+bF9WY5jfKflqCEaqCsL+ycr0+Wp5gIyi2fsL+/RYMxAwzwawo3kcq9Y/qvNbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734445019; c=relaxed/simple;
	bh=DKFn+KMaR7PJhJqYN4X77+hqVcmcyiQ1xJMn1ypE98w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jxgp/MwhrpqOFdpdVTjeW+DdLaQSBqXHbcZs8yyRrQ5+3cVkc8yDQRD+aREtyZXPjJ5s5SGy6D1o512ebtPqFn0yc/HWi1NcpUlmSXspvRiHPjlYCNS27dD8K9Fp3Y1rtlfKqbsExHm+E4Kx8P8XhM+g8D9N+T7TLP4MKVAdLnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cOM/Dfvi; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53e3c47434eso5385662e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 17 Dec 2024 06:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734445016; x=1735049816; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BHBW95JYtL3IcucyufgHbiphLr1xxHn5mz+ChmlQYYE=;
        b=cOM/Dfvi7h9DrbXdNQe7F9f8rPgyXKnLoGgaQcwyM79Y+lX+mCfebXPZkis9ovMCqO
         +Z3cVmQUMfC+7c/0MBta7RG/Lp3aZQ+IBsJgtEQtcsJB2ElHARgJFNORelUrZAFu7K6p
         v+ihW1qrFct/OceTgcQEXMcpzoNRu5nN9YWc2xYcac2eanQom9mls5QGN/2cJHvmIR+L
         6u2BlLK+P6XkEn622HDEsq5IEMSZKdaOmA+FYHS+Jrk+QgY395VZXydhsaA8rS/gYC5p
         h7/oQF8XUo1GnuXGRSI5Dpy+Wv3tPm9V72uX+3BX/O9IhmFm1rb3gQ/jm+fYpBLf4YIh
         Fklg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734445016; x=1735049816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BHBW95JYtL3IcucyufgHbiphLr1xxHn5mz+ChmlQYYE=;
        b=dJVQA0tsX/22bVCap/H3tdubXvhGJgJ0dUMq3NPpSG1RhQkrWrefqEVSavvqAZA0mw
         Cg36LprIneqrTGnjeOpSDkN6G3afO2sEU9Io6Hiqae0wDXE53Zm06cTYZSxKJAg80INC
         KCiB+0iSAz7WymX9TWPAG8VIht6S4FkDC2cHLA6KyZX/L0NU8BDUwgGtNT9jEtmN6oN1
         7NTJyPv6XWNuVBbn4N/QP1KUE+FoSlNq/yrw/dndRywUxbJ7bkdZv6ETkbX3uLkuZpke
         vmSTzEsEeyOU0DSz8AGaOporDfPpCfmWDsCW6eALO7CtNn8YbLz6Y2GUm8xjRJkryYXA
         dtEA==
X-Forwarded-Encrypted: i=1; AJvYcCVBwpq2fj8ZNTuSC8Ix7fAb3MFlNcq1R6D90dWfPG+rW2aFg1m9BTEv0OuT6kfRCCeIrR3tgNNY9+M2@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0WJDmgghxZItR7GfAZ4wHZtp3UQQqHObzDELNo5STZurxBj4J
	zHJjuREd+Bk1S891jDspc/7ciZWfSkDtEZfUgyC6qm/bGVT4cIiqZbFbGmSovnQ5Ev8aRSLM2Ce
	IRczv9R4e+R9NGQO4h3YB7VaKAueomoAbzp1ABf1rBtzkjCERs4Q=
X-Gm-Gg: ASbGncurd1vGOg0rVYHpwuHJFoiXcPuw0eWKgS3566KiYzIdCHZDMxta5x9vIcvtGM2
	GXYUOCPH8imgc7/rXGV/q63nfj7e7kKpPe33LAA==
X-Google-Smtp-Source: AGHT+IEr2X+ppjMhigr6R7i2WS3874m73kjn5zW/V1OeIgO1pi35FfBhBIBsWh/0nFyRU/oj96rCpFa6GFkEFX8gsOc=
X-Received: by 2002:a05:6512:401a:b0:540:269d:3017 with SMTP id
 2adb3069b0e04-54090557e80mr4587671e87.18.1734445015775; Tue, 17 Dec 2024
 06:16:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1733739697.git.matthias.schiffer@ew.tq-group.com> <a7b98f12da735f735b33200f6324360fc380e6d0.1733739697.git.matthias.schiffer@ew.tq-group.com>
In-Reply-To: <a7b98f12da735f735b33200f6324360fc380e6d0.1733739697.git.matthias.schiffer@ew.tq-group.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 17 Dec 2024 15:16:44 +0100
Message-ID: <CACRpkdbRdT1=30DNyn_=7rfqsnppfbdBr5QXCfWyM0f+FzLjgw@mail.gmail.com>
Subject: Re: [PATCH 3/4] gpio: tqmx86: introduce tqmx86_gpio_clrsetbits() helper
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux@ew.tq-group.com, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 9, 2024 at 11:36=E2=80=AFAM Matthias Schiffer
<matthias.schiffer@ew.tq-group.com> wrote:

> +static void tqmx86_gpio_clrsetbits(struct tqmx86_gpio_data *gpio,
> +                                   u8 clr, u8 set, unsigned int reg)
> +       __must_hold(&gpio->spinlock)
> +{
> +       u8 val =3D tqmx86_gpio_read(gpio, reg);
> +
> +       val &=3D ~clr;
> +       val |=3D set;
> +
> +       tqmx86_gpio_write(gpio, val, reg);
> +}

Maybe a question that has been asked before but why are we rolling
a set of tqmx86_* wrappers that start to look like regmap-mmio
instead of just using regmap-mmio?

tqmx86_gpio_[read|write|get|set] and now clrsetbits can all
be handled by corresponding regmap_* calls (in this case
regmap_update_bits().

Sure, this driver is using a raq spinlock but regmap-mmio supports
raw spinlocks too.

Yours,
Linus Walleij

