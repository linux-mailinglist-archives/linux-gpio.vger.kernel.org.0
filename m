Return-Path: <linux-gpio+bounces-20053-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD480AB557E
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 15:03:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE5C41B4654C
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 13:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DC1628DF3B;
	Tue, 13 May 2025 13:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LmdMWaiY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA71D14A8B
	for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 13:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747141395; cv=none; b=f2T8Dfb70B0jJ4hKAg/XqBU7bpNtaI2Be8WNVWzvUwb3+ymPl4229jr9VfgFArzdi6vkkzHhLaLjQ/Udy6swTUm9ORbP7OC4bXp2thy8qwM/lXdRwBcgkAWfXGue05JZO/KsE0UJaNNMOgXhGb4I5qnTLRICYF19MDOAf/HlQcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747141395; c=relaxed/simple;
	bh=x8ieU4EKi2B4fi65n0AYV5vqCBD7U2SnDPQDI/RK5MA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gxj0H4VPr82Pd+rFgWzWZBc9yZdnwN9dmcy5OxKajdvjDsHqWKL6v+nmfeOcj09z6EbH94ENmjWntZi7B3TR27ZldS8reZYs8ZUZx3X4bwEnAPkixrUR6SxDcNXbEj9R+so/Trqy3e/vyawz9Rr+pMDvaP9i5w2zRDsMNL6sntU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LmdMWaiY; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-310447fe59aso51587831fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 06:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747141391; x=1747746191; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bckFuN4azCmbNe0b2Ogt/F42jsbbCCh007jmdEYNzmc=;
        b=LmdMWaiY3rwMXY65xWrlSDrBZm5+MGKWVYjRItOT0iySYAjIoFEfFtvNH4HibHVQ//
         Bf6oHPC0ut9DSRzLtOwFIbO+OzGEgRfk5lJ0siI4SBah5tzM8VkXj3qjrbplEN2nF/Ig
         JadL7xMuwjzGvvxvxQEIgku4Na98fQgev1cYh0XvgeKXGwQdDDSA+zfiPXq/s66G1QhR
         npOA1HcJcpPOXu4PnyqSD3fhfn9EYg6mLY2p0VqvBBVZAwdFpfBhLLCxqtMKv736vK+h
         CpN336LJDgfy28yB9itUMJmzcODbp1TzZDst3saL9ulFEz2ZB196gikdTxVQ9wwtY+8A
         7ZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747141391; x=1747746191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bckFuN4azCmbNe0b2Ogt/F42jsbbCCh007jmdEYNzmc=;
        b=Tz/pHwFZ/2WE4Fgev4cwtkSAX87CwrOPhRs5dAV81KbnLPBA0I43uJ5Px2FBqtTZSY
         actJ3yh3SJbR03tzujeOaSDjzS8RbwyLnVKZsw0I2i0qH6bLLTlMZjnT+xDR3qLK8rM5
         SXP3osJMyS2mCSjwKDBUjQRp4irf1y/3ZSfUogTvdGwlRmuiShQk8bGNDBL2ZiSlvSvf
         Dopy7LiIrqhETcyHhAcBR2M0cLcxxQjLIs6jf64gHBXD0XP/ObHhcIpJYHbeT+zLBV/C
         lzIE85wuKuhEp8MfiXIsWYNEe0K0vxPOcSkiZ0683gief/I78WGxL6yOflloA4CSUeFb
         UpQg==
X-Forwarded-Encrypted: i=1; AJvYcCUr+EbQYFh6cy+NCA3HVwGHPRIOxJdGqw6ThNt23cLxWft/F5rCDe1roqwdCc6M6v/8lLzR0nh2vBtV@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgy2VecOkmnGWNPIj5++vchBCFV5fvSCg4YxFYSsu5frRYi6kf
	L+aC7Dx5RQWBLiJRIRrbPOprxMfufBpdNqaHe8iIwRqZP7oKpZ0UPFST7Xt7mXFCpm4AFPkN/Ba
	lzHHNb4yBBYZhcOSs/F1J26ByTOTJalR8RVzUyQ==
X-Gm-Gg: ASbGnctKGfBjKfPCSqH4aZ9YxMtcO20CT1b7mINBewJYXYNKCVN0w4xYybcWh8XqrZC
	c12LC9QGxK5GTwhapJMzuIiTqFhmlqiBY0l7MVXUUB2vYQS28qiAqelocC5CvrurIhWPIj0Iegm
	cQhgDDrR6hsyRf3jDKf1ZY7ENCW0Xz5xbD
X-Google-Smtp-Source: AGHT+IG41x6HOlIO0IJUYhQJ2UY3oU18tjuuOsvxrjmQ22T794qYcI75spC45YpUWkdDO5fUQhcFroeonzakK7RK33I=
X-Received: by 2002:a2e:a549:0:b0:30b:fe62:2329 with SMTP id
 38308e7fff4ca-326c455e0bamr65757501fa.11.1747141390612; Tue, 13 May 2025
 06:03:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506-aaeon-up-board-pinctrl-support-v5-0-3906529757d2@bootlin.com>
In-Reply-To: <20250506-aaeon-up-board-pinctrl-support-v5-0-3906529757d2@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 15:02:58 +0200
X-Gm-Features: AX0GCFuUcIfML44aAdhDDQyW4WElAah3qOFUrVK8KAK7hsanUNq0ZohV10DNP3g
Message-ID: <CACRpkda8XSuO8-pY8K4gRsK7Ny6=PqcgKdrK+8A-3ghCfRTBLQ@mail.gmail.com>
Subject: Re: [PATCH v5 00/12] Add pinctrl support for the AAEON UP board FPGA
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

thanks for working on this!

Also thanks to Andy for excellent guidance on the series.

On Tue, May 6, 2025 at 5:21=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:

> This is the fifth version of this series, addressing the few remaining
> issues identified by Andy.
>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

Looks good to me!

> Thomas Richard (12):
>       gpiolib: add support to register sparse pin range
>       pinctrl: remove extern specifier for functions in machine.h
>       pinctrl: core: add devm_pinctrl_register_mappings()
>       gpio: aggregator: move GPIO forwarder allocation in a dedicated fun=
ction
>       gpio: aggregator: refactor the code to add GPIO desc in the forward=
er
>       gpio: aggregator: refactor the forwarder registration part
>       gpio: aggregator: update gpiochip_fwd_setup_delay_line() parameters
>       gpio: aggregator: export symbols of the GPIO forwarder library
>       gpio: aggregator: handle runtime registration of gpio_desc in gpioc=
hip_fwd
>       gpio: aggregator: add possibility to attach data to the forwarder
>       lib/string_choices: Add str_input_output() helper
>       pinctrl: Add pin controller driver for AAEON UP boards
>

Most heavy commits are in the GPIO subsystem, once the nitpicks
are addressed in v6, Bartosz do you want
to create an immutable branch for this and merge into your for-next
and see how it works, if all is good I can perhaps pull the same
branch into pinctrl as well.

If this is stressful I can do the same operation in pinctrl instead so
you can just pull it to GPIO from my tree.

Yours,
Linus Walleij

