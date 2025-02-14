Return-Path: <linux-gpio+bounces-16022-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E86A35E72
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 14:11:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91B733B068B
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 13:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACF0B263F4D;
	Fri, 14 Feb 2025 13:08:59 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149F623A992;
	Fri, 14 Feb 2025 13:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739538539; cv=none; b=oziEBgBV1cGyxHZRky4cfj31Yxce7mP6+TK7mMlmGfkarw8t+HppZtKcgVirw2hTXhgi1vDzZC/p9AzTUi7u1f/mPSf5sWzPE/2CY2QBFo/nIEXWRKJ78lpqCRS/vbBRxopCIy2bAcj9LeO+qRf9gbKFFbX40Ac2ra/uKCLmuQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739538539; c=relaxed/simple;
	bh=DdXgOfaajmPxNUJs0g3YB5p0a0TafhxkMlOBYUWYlL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kTxumxmXc91KjsmkNWJjko28ERRMT/UjFweWCCRudnzCJ7Wx8H0eJ49GR3WWlceOJQZFB8A3EdO04qIgIxWnNnryAwkiZXafGG0rwYoK5LSnDHPBudp72tHFzWtrcSRqxqMzJh3ybVEWCYx/55gMWqtKrhhZkPrC4c65dRY5Um0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [180.172.76.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id E83C23433F1;
	Fri, 14 Feb 2025 13:08:56 +0000 (UTC)
Date: Fri, 14 Feb 2025 13:08:49 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Olof Johansson <olof@lixom.net>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
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
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 1/4] dt-bindings: gpio: spacemit: add support for K1
 SoC
Message-ID: <20250214130849-GYA21864@gentoo>
References: <Z5FPJLzAEVXGWJnE@chonkvm.lixom.net>
 <20250123113042-GYA38135@gentoo>
 <Z5LOdh-4UxRtteOy@chonkvm.lixom.net>
 <20250127181726.GA538260-robh@kernel.org>
 <20250128031712-GYB47737@gentoo>
 <CACRpkdYbSOHD9UH5=+qjztxS3Cq_rxaoOT9tFtD8ZWm9zQGnPw@mail.gmail.com>
 <CACRpkdZa887vx4Lmxk1U_8w5n7AxMnyzGexeYzhsxNGT-DTYcQ@mail.gmail.com>
 <20250206133156-GYA5687@gentoo>
 <CACRpkdZYYZ5tUR4gJXuCrix0k56rPPB2TUGP3KpwqMgjs_Vd5w@mail.gmail.com>
 <20250214115410-GYA21743@gentoo>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250214115410-GYA21743@gentoo>

Hi Linus:

On 11:54 Fri 14 Feb     , Yixun Lan wrote:
> Hi Linus:
> 
> On 14:07 Thu 13 Feb     , Linus Walleij wrote:
> > On Thu, Feb 6, 2025 at 2:32 PM Yixun Lan <dlan@gentoo.org> wrote:
> > 
> > > > > foo-gpios <&gpio 2 7 GPIO_ACTIVE_LOW>;
> > >
> > > if we model the dts as above, then "&gpio" will register itself as one sole "struct gpio_chip",
> > >  which mean one gpio chip combine three banks..
> > 
> > Not really: the fact that there is just one gpio node in the device
> > tree does not
> > mean that it needs to correspond to one single gpio_chip instance inside the
> > Linux kernel.
> > 
> > It's just what the current existing bindings and the code in the GPIO subsystem
> > assumes. It does not have to assume that: we can change it.
> > 
> > I'm sorry if this is not entirely intuitive :(
> > 
> > One node can very well spawn three gpio_chip instances, but it requires
> > some core changes. But I think it's the most elegant.
> > 
> > > if taking "one gpio chip support multi banks" direction, then it will be reverted back as patch V1,
> > > then, even the three gpio-cells model is unnecessary needed, as we can map gpio number
> > >  to the <bank, offset> array in the underlying gpio driver
> > >
> > > the v4 patch is very similar to drivers/gpio/gpio-dwapb.c
> > >
> > > If had to choose the direction between v1 and v4, I personally would favor the latter,
> > >  as from hw perspective, each gpio bank is quite indepedent - has its own io/irq registers,
> > >  merely has interleaved io memory space, one shared IRQ line.. also the patch v4 leverage
> > >  lots underlying generic gpio APIs, result in much simplified/clean code base..
> > 
> > So what I would suggest is a combination of the two.
> > 
> > One gpio node in the device tree, like the DT maintainers want it.
> > 
> > Three struct gpio_chip instances inside the driver, all three spawn from
> > that single gpio device, and from that single platform_device.
> > 
> > What we are suggesting is a three-cell phandle in the device tree:
> > 
> > foo-gpios = <&gpio 0 7 GPIO_ACTIVE_HIGH>;
> > bar-gpios = <&gpio 2 31 GPIO_ACTIVE_HIGH>;
> > 
> > Notice the new first cell which is 0 or 2.
> > 
> > The first one is what was previously called gpio 7.
> > The second one is what was 2*32+31 = gpio 95.
> > 
> > So internally in the driver it is easy to use the first cell (0 or 2) to map to
> > the right struct gpio_chip if you have it in your driver something like this:
> > 
> > struct spacemit_gpio {
> >     struct gpio_chip gcs[3];
> > ...
> > };
> > 
> > struct spacemit_gpio *sg;
> > struct gpio_chip *gc;
> > int ret;
> > 
> > for (i = 0; i++; i < 3) {
> >      ret = devm_gpiochip_add_data(dev, &sg->gcs[i], sg);
> >      if (ret)
> >         return ret;
> >      gc = sg->gcs[i];
> >      .... do stuff with this instance ....
> > }
> > 
> > Callbacks etc should work as before.
> > 
> > Then these phandles needs to be properly translated, which is done with the
> > struct gpio_chip .of_xlate() callback. (If you look inside gpiolib-of.c
> > you will see that chip->of_xlate() is called to map the phandle cells
> > to a certain GPIO line).
> > 
> > In most cases, drivers do not assign the chip->of_xlate callback
> > (one exception is gpio-pxa.c) and then it is default-assigned to
> > of_gpio_simple_xlate() which you can find in gpiolib-of.c as well.
> > 
> > You need to copy this callback to your driver and augment it
> > properly.
> > 
> > The xlate callback is used to locate the struct gpio_chip and
> > struct gpio_device as well, by just calling the xlate callback, so if
> > you code up the right xlate callback, everything should just
> > work by itself.
> > 
> > this is a guess on what it would look like (just dry coding,
> > but hopefully the idea works!):
> > 
> > static int spacemit_gpio_xlate(struct gpio_chip *gc,
> >                                 const struct of_phandle_args *gpiospec,
> >                                 u32 *flags)
> > {
> >         struct spacemit_gpio *sg = gpiochip_get_data(gc);
> >         int i;
> > 
> >         if (gc->of_gpio_n_cells != 3)
> >                 return -EINVAL;
> > 
> >         if (gpiospec->args_count < gc->of_gpio_n_cells)
> >                 return -EINVAL;
> > 
> >         /* We support maximum 3 gpio_chip instances */
> >         i = gpiospec->args[0];
> >         if (i >= 3)
> >                 return -EINVAL;
> > 
> >         /* OK is this the right gpio_chip out of the three ? */
> >         if (gc != sg->gcs[i])
> >                 return -EINVAL;
> > 
> >         /* Are we in range for this GPIO chip */
> >         if (gpiospec->args[1] >= gc->ngpio)
> >                 return -EINVAL;
> > 
> >         if (flags)
> >                 *flags = gpiospec->args[2];
> > 
> >         /* Return the hw index */
> >         return gpiospec->args[1];
> > }
> > 
> thanks for this very detail prototype! it works mostly, with one problem:
> 
> how to map gpio correctly to the pin from pinctrl subsystem?
> 
> for example, I specify gpio-ranges in dts, then 
>                 gpio0: gpio@d4019000 {
>                         compatible = "spacemit,k1-gpio";
>                         reg = <0x0 0xd4019000 0x0 0x100>;
> 			...
>                         gpio-ranges = <&pinctrl 0 0 96>;
>                 };
> 
> 		foo-gpios = <&gpio0 2 28 GPIO_ACTIVE_LOW>;
> 
> It should get GPIO_92 ( 92 = 2 * 32 + 28), but turns out GPIO_28
> 
> Probably there is something I missed...
to make the gpio part work, we need additional custom gpio-ranges parser,
which should similar to of_gpiochip_add_pin_range() in gpiolib-of.c
(at least gpio core need to adjust to call custom this function)

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

