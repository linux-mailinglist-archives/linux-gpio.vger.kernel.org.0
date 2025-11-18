Return-Path: <linux-gpio+bounces-28690-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAF7C6AE24
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 18:17:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1DB7E34DD9C
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 17:09:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC2983A79BC;
	Tue, 18 Nov 2025 17:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="shd8/l8V"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E2436CDE5
	for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 17:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763485713; cv=none; b=WOwM7Q3DmEHXl19TzehSe6X3hXL2+W/v/RRBwHAi0T41r1X8rKZETEPLCNOYm2BFJHRCjB4P+smJk3QzhlXGLxDtttAm/kx4blr9vs0ekJzbsrK6AdBgFx2XpLQAh4SCpqMP2wGpFaENauaOVPvi06P17VLIZlQLReT1EwHQyd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763485713; c=relaxed/simple;
	bh=HBc2ZQWC58qhuD5iMMHBK7ArPREst99xFbl2gu7AscI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VZAaBS3Sxj80eP5t46VVEleLUYLnARy4h9Hzp0mgSsYjHcTDxzy/mm1uH0uTpSm1tb+eKMJfkNZfRB/I+DqqiOdNOe5Zz21vQNVvtsvm3YL74R5Enk83BitCNog1nRPrFAYI5gCoKzwUKsszoNSumJv94Myva8xUBqFgQgFhNUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=shd8/l8V; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5959b2f3fc9so717619e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 09:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763485710; x=1764090510; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qn1r2bDRs7F30rrGFgAz8n979tAaaL3TJHR+GT3ukr4=;
        b=shd8/l8V960cjaq0KVhEEHnd87oB3kJuNf7bkVm4D222bqJyyrMTkW69lUfMPerrWl
         RBsZZpDjfJjIFWtB4rKMXWXQw6eag3cCwfDDx7Kr76Kst0Y1VY8h74xbpbFDMI+11Lik
         OkP0mxtdya3rq88wRNE99fRt9IocLiaXDNI2soDJo2GDLdoCBFHRWa2BMsOYM4Qtfnl0
         PN35mjqFYza5lo3kz0lxfrYCgnoN0excfz6j2GKRIJqGGa7orQzvTxA/0D6ILo7utMqq
         VsJ4/X5nTJ1vF3mDpOHFqEWXpnJ1vericwwjbKWPrrYXPTSqXz8d5Hyffh8r61k/jUcS
         Tuhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763485710; x=1764090510;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qn1r2bDRs7F30rrGFgAz8n979tAaaL3TJHR+GT3ukr4=;
        b=Hi5iO8dcACmWniaOgiz05BqiHnjrYW03bVw9vE93/yA9ZovGJtWFfgomTHWhIShCyQ
         FgTrRWU1p8+EVD6qONs1TcqdTmcWThleyY9wzphPs/bJWLBekiJ7FsgKww2xtwew+jpE
         Z5y7ESPxRhWQXgGHJwFNOQ9e6ZpJGS3aLIbXfQXujzYgpLT/o6BkRtOuPc/4Hfnt3/Q3
         byfNnri0XNcCp1/Mr4zJUzQO+YX78DyP9ZP8x+Iy10LcYhJzHFYHHikj03jF2MypC4h7
         yyoTnRmpdTfKYTFqPsmQYgLKAGtO0kXIv/oq+fGAEwlTX3PJgoRHFQNA6dop5ZudBKYh
         v5Xg==
X-Forwarded-Encrypted: i=1; AJvYcCUgk7HnDWSqAsw7NrUXeH9MVDaoi805qhkIJavPQ82KzKiq+ieXi/inJA8/gfZmVBNWi17xgopT/hEI@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6KIFgs37zUOu1DuSBJV0io0nraErdsuj9jyf3ktgHOTVamy7v
	zmS3SIw3dvhTswXPZXDCFfcsAHZ9hcdzhffxGXw405ts/+Y6QZnNYHImtOdzNFhjjAqN9HGJTVq
	3aFIClVVjfIhM/F4YnLeTDSVjziT+Rcs0fhHE8CNAhw==
X-Gm-Gg: ASbGncvBgcLTlZxbSn3YWB4iPrI4ficINklW+ItGEkse83UEKBm4f+VlfimYq6mG+ag
	ovn+fUhRQ/HW5+7y6QgCIPwzLNaMKsNjt9rYPU6Dl+GTaqFa46k+smveG3cXZ4qtd+tnzSevpPi
	JhESi/9rqF523XW5XWQPREIiZQPeYjvQjYn+z0T3gyKlMaMqqvny4dmwBSVfxsZ+kr98cDyb67w
	ane4pZrkrBMhUDMzpqBEJClD6Gn4mJGDbQSkm9v5Wsmf/qNUSrQ57ru1dZPWXPSFe1/g+PrIC/8
	XYu5wsVP8tB9FAHqkt+VSyMApN0=
X-Google-Smtp-Source: AGHT+IFkFgtlBMvohcxEGvLkd9kWi10fnWrlIj72QjC1LsDYCb6PW6zcb+rWybL7Pe0RzcX+H9tha49b1dupHnlsToE=
X-Received: by 2002:a05:6512:15a1:b0:595:831d:22eb with SMTP id
 2adb3069b0e04-595841a2d07mr4504495e87.1.1763485709694; Tue, 18 Nov 2025
 09:08:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251106-reset-gpios-swnodes-v6-0-69aa852de9e4@linaro.org>
 <20251106-reset-gpios-swnodes-v6-8-69aa852de9e4@linaro.org> <0d251a35a438ebf3e14c6762df7ece079ee1d164.camel@pengutronix.de>
In-Reply-To: <0d251a35a438ebf3e14c6762df7ece079ee1d164.camel@pengutronix.de>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 18 Nov 2025 18:08:17 +0100
X-Gm-Features: AWmQ_bkWC8PDAvB2nRPeS90FOnL0hSCLaqXOscLCBEIl8xvK50DYALnQK70i4b4
Message-ID: <CAMRc=MfAw-HyofSL52PY0H57rBJZAo215gryxWyS8x-d+wcjRg@mail.gmail.com>
Subject: Re: [PATCH v6 8/8] reset: gpio: use software nodes to setup the GPIO lookup
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 5:44=E2=80=AFPM Philipp Zabel <p.zabel@pengutronix.=
de> wrote:
>
> On Do, 2025-11-06 at 15:32 +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > GPIO machine lookup is a nice mechanism for associating GPIOs with
> > consumers if we don't know what kind of device the GPIO provider is or
> > when it will become available. However in the case of the reset-gpio, w=
e
> > are already holding a reference to the device and so can reference its
> > firmware node. Let's setup a software node that references the relevant
> > GPIO and attach it to the auxiliary device we're creating.
> >
> > Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
>
> I'll apply this with the following patch squashed in:
>
> diff --git a/drivers/reset/core.c b/drivers/reset/core.c
> index 3edf04ae8a95..8a7b112a9a77 100644
> --- a/drivers/reset/core.c
> +++ b/drivers/reset/core.c
> @@ -945,7 +945,7 @@ static int __reset_add_reset_gpio_device(const struct=
 of_phandle_args *args)
>         of_node_get(rgpio_dev->of_args.np);
>
>         rgpio_dev->swnode =3D fwnode_create_software_node(properties, NUL=
L);
> -       ret =3D PTR_ERR(rgpio_dev->swnode);
> +       ret =3D PTR_ERR_OR_ZERO(rgpio_dev->swnode);
>         if (ret)
>                 goto err_put_of_node;

Huh? Why?

Bartosz

