Return-Path: <linux-gpio+bounces-16427-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3391FA408A1
	for <lists+linux-gpio@lfdr.de>; Sat, 22 Feb 2025 14:23:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89DDA3B2A33
	for <lists+linux-gpio@lfdr.de>; Sat, 22 Feb 2025 13:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAF6F20AF6D;
	Sat, 22 Feb 2025 13:23:09 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FE520967F;
	Sat, 22 Feb 2025 13:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740230589; cv=none; b=m3irBCW/oM/6LX3R2z+np7aX07H9Zg0waa9LWjtuTSLi+996MD1wkzoU9phNmI2FlYj1Zp/AOyG9nE96E1qwG2UsqBTBFl8lxrXpXGbGF3KiRm8V9ZkttMtn+t+uYsWsugNSZC1kNO6UtvjWHCuiCOdj0li+NIZpA68kyWsmMO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740230589; c=relaxed/simple;
	bh=cHo6vTlfrzwUzW/DT/egpBCH21mBMOMH3CKUk8ZULrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u8HUgX6s+BtIeUHuGeDwqcI7PRP8OlqgLCd8sEmILs5zIZg6grQP2pTcrbs+pZ9PmCT+JhXkZESvbCyKaMtaHiVoB0PALdnfA9t1KPQ6Ha0sRyMwN2nnD+1o0JoF8Y+IU1Q8ZLl38WVt0SjKVqoxUb/tT9ZjHcxSWeDVrDvPPJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [180.172.118.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 21D1C3431F0;
	Sat, 22 Feb 2025 13:23:06 +0000 (UTC)
Date: Sat, 22 Feb 2025 13:23:01 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Yangyu Chen <cyy@cyyself.name>,
	Jisheng Zhang <jszhang@kernel.org>,
	Jesse Taube <mr.bossman075@gmail.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v5 1/5] gpio: of: support to add custom add pin range
 function
Message-ID: <20250222132301-GYA37325@gentoo>
References: <20250217-03-k1-gpio-v5-0-2863ec3e7b67@gentoo.org>
 <20250217-03-k1-gpio-v5-1-2863ec3e7b67@gentoo.org>
 <CAMRc=MdGBTXRSAgY2vjOrqVVRzOyYh7N8yZsjK+W4cYFCQAwhQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdGBTXRSAgY2vjOrqVVRzOyYh7N8yZsjK+W4cYFCQAwhQ@mail.gmail.com>

Hi Bartosz Golaszewski:

On 11:22 Thu 20 Feb     , Bartosz Golaszewski wrote:
> On Mon, Feb 17, 2025 at 1:58 PM Yixun Lan <dlan@gentoo.org> wrote:
> >
> > Export custom function to add gpio pin range from pinctrl
> > subsystem. This would make it possible to add pins to multi
> > gpio chips.
> >
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
> >  drivers/gpio/gpiolib-of.c   | 5 ++++-
> >  include/linux/gpio/driver.h | 7 +++++++
> >  2 files changed, 11 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> > index 2e537ee979f3e2b6e8d5f86f3e121a66f2a8e083..64c8a153b823d65faebed9c4cd87952359b42765 100644
> > --- a/drivers/gpio/gpiolib-of.c
> > +++ b/drivers/gpio/gpiolib-of.c
> > @@ -1170,7 +1170,10 @@ int of_gpiochip_add(struct gpio_chip *chip)
> >         if (chip->of_gpio_n_cells > MAX_PHANDLE_ARGS)
> >                 return -EINVAL;
> >
> > -       ret = of_gpiochip_add_pin_range(chip);
> > +       if (!chip->of_add_pin_range)
> > +               chip->of_add_pin_range = of_gpiochip_add_pin_range;
> > +
> > +       ret = chip->of_add_pin_range(chip);
> >         if (ret)
> >                 return ret;
> >
> > diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
> > index 2dd7cb9cc270a68ddedbcdd5d44e0d0f88dfa785..a7b966c78a2f62075fb7804f6e96028564dda161 100644
> > --- a/include/linux/gpio/driver.h
> > +++ b/include/linux/gpio/driver.h
> > @@ -528,6 +528,13 @@ struct gpio_chip {
> >          */
> >         int (*of_xlate)(struct gpio_chip *gc,
> >                         const struct of_phandle_args *gpiospec, u32 *flags);
> > +
> > +       /**
> > +        * @of_add_pin_range:
> > +        *
> > +        * Callback to add pin ranges from pinctrl
> > +        */
> 
> Please, make the API contract more specific: describe the return value
> and check it in the call place if it can return errors.
> 
> Also: is this even OF-specific if it doesn't take any OF argument? Why
> not just add_pin_range()?
> 
now, this patch is obsolete, please ignore
it will be replaced by the one sent by LinusW
https://lore.kernel.org/all/20250218-gpio-ranges-fourcell-v1-0-b1f3db6c8036@linaro.org/

> Bart
> 
> 
> > +       int (*of_add_pin_range)(struct gpio_chip *chip);
> >  #endif /* CONFIG_OF_GPIO */
> >  };
> >
> >
> > --
> > 2.48.1
> >
> 

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

