Return-Path: <linux-gpio+bounces-3432-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E76E185941B
	for <lists+linux-gpio@lfdr.de>; Sun, 18 Feb 2024 03:33:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F863282CDF
	for <lists+linux-gpio@lfdr.de>; Sun, 18 Feb 2024 02:33:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22BBE1C27;
	Sun, 18 Feb 2024 02:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kLyxej/y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BD61849;
	Sun, 18 Feb 2024 02:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708223624; cv=none; b=qpF9gNf1bM0nunl4TLEgFEQtdSqYcLebSm3zmvNfFnKnxFVr0gSGUCC6UrTevWEu1qGmigq5yic5DenZbgePhVZIHlT5vCq3Z6eihk86N2J1O8n0Au6TpSV8Ipn0urlXWDx00lyu2jvPMlKi2/jnnVI0ts2ECJ5rabsmy/gbMa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708223624; c=relaxed/simple;
	bh=XyZt7X4Azclue/691rEii2bsP0MZxIqrrREt+rCvhyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uSXzbgDulKF/2FSeuH58vbvVBn/UsQE+RSJOIpW5uxdWQgq8GhRf2WOvGwXa5ylMXVsICn/H1FZSnqon1yTs7nVzNnbRTB9JeT1FJ0rnYvtt24BMtr2NY2fz7EI6JVi8znM1T8lRkm9AgD4/ZowpsN4TgK/ga3Fd3cR+7y9lgoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kLyxej/y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EB16C433C7;
	Sun, 18 Feb 2024 02:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708223624;
	bh=XyZt7X4Azclue/691rEii2bsP0MZxIqrrREt+rCvhyg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kLyxej/y4wV2IytlJrlD88nco2TD0JXO0F0bkdJQBvkgTYhvp6OPUOW8+LqeTJGdq
	 zprYChy6EZBdO6/ZoPMNDO8ijUGqsgSoB8IfjjGV/OQ75DYBwg97BIYleEQdYohf4v
	 DxqtpoOsDqPTMD7f+4ehWRYu7nYPW5UDxxXhF0veC0LWdFbsrkK8uk98zjfAD3P7Fi
	 0jTcf+fTcw+smjuRVHfNLW7BiS+Hpin29hKXqAM0RoR3nCgjaQz68xrM7dFOK2MTO4
	 4sbQaGkGKfMQSRD8B+SlP05P+LZ1QKgJTE7E7Hgo+sFPw/2pIQg0q5StCO6eOS93fq
	 S0Lcaqrc3tJ0w==
Date: Sun, 18 Feb 2024 10:20:46 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: commit f34fd6ee1be8 breaks current dwapb gpio DT users
Message-ID: <ZdFpfrZjN7UvUFrr@xhacker>
References: <ZdC_g3U4l0CJIWzh@xhacker>
 <CAJM55Z-t9e8L2_iFfdbCDpOzi7UxQao6-L6VU_W9OGBciJ46bA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAJM55Z-t9e8L2_iFfdbCDpOzi7UxQao6-L6VU_W9OGBciJ46bA@mail.gmail.com>

On Sat, Feb 17, 2024 at 09:44:27AM -0800, Emil Renner Berthing wrote:
> Jisheng Zhang wrote:
> > Hi Emil, Linus,
> >
> > commit f34fd6ee1be8 ("gpio: dwapb: Use generic request, free and
> > set_config") breaks all current dwapb gpio DT users, for example, getting
> > cd-gpios will always fail as -EPROBE_DEFER. Before the commit,
> > dwapb_gpio_set_config() returns -ENOTSUPP for !PIN_CONFIG_INPUT_DEBOUNCE
> > then gpio_set_config_with_argument_optional() will happily ignore
> > -ENOTSUPP. After the commit, dwapb_gpio_set_config() will return
> > -EPROBE_DEFER unless the gpio-ranges are set in DT.
> >
> > The key problem here is: almost all dwapb gpio DT users don't set
> > the gpio-ranges DT property, so I guess current dwapb gpio DT users
> > have this problem and the commit also breaks old DT compatbility.
> > So could we getback to previous behavior?
> 
> Hi Jisheng
> 
> It seems like the gpiochip_generic_request() and gpiochip_generic_free()
> functions have guards to handle when gpio-ranges are not set that
> gpiochip_generic_config() lacks. Could you try the patch below?
> 
> Otherwise I'm also fine with just reverting the patch if this is not the right
> solution.
> 
> /Emil
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 8b3a0f45b574..e434e8cc1229 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -2042,6 +2042,11 @@ EXPORT_SYMBOL_GPL(gpiochip_generic_free);
>  int gpiochip_generic_config(struct gpio_chip *gc, unsigned int offset,
>                             unsigned long config)
>  {
> +#ifdef CONFIG_PINCTRL
> +       if (list_empty(&gc->gpiodev->pin_ranges))
> +               return -ENOTSUPP;
> +#endif
> +
>         return pinctrl_gpio_set_config(gc, offset, config);
>  }
>  EXPORT_SYMBOL_GPL(gpiochip_generic_config);

Hi Emil,

The above patch can fix the gpio issue. So,
Reported-by: Jisheng Zhang <jszhang@kernel.org>
Tested-by: Jisheng Zhang <jszhang@kernel.org>

Thanks

