Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CA3034A5A9
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Mar 2021 11:33:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229904AbhCZKcv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Mar 2021 06:32:51 -0400
Received: from wilbur.contactoffice.com ([212.3.242.68]:47110 "EHLO
        wilbur.contactoffice.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229893AbhCZKce (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Mar 2021 06:32:34 -0400
Received: from ichabod.co-bxl (ichabod.co-bxl [10.2.0.36])
        by wilbur.contactoffice.com (Postfix) with ESMTP id 604547D5;
        Fri, 26 Mar 2021 11:32:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1616754751;
        s=20210208-e7xh; d=mailfence.com; i=sandberg@mailfence.com;
        h=Date:From:Reply-To:To:Cc:Message-ID:In-Reply-To:References:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding;
        l=2652; bh=D6oQOoAa2KTgDaR6HzGhTwRHmU1KR/wjumbcZVoylGc=;
        b=ceJkfRYLkIRWpl04D+yXU+n/WJoOF/UtyAOlycKrw8XhGtcQFFZPf4KClR0vSUyd
        y1y/D50+7CBLxTnQCekYGZevPpRamqx4a6cOYoZFk9lkqZGv5e2kPswE56JShLyyflf
        26+l10MbzU3Fl8NJMOU3G0zroyR4F29gjjaC90BJL7hhone+YG410BEt4GODITGr+3Q
        RsdU3O/+3J+t6S36kXz89lVlK8Ab5rDiRV321wq0I0JYmVY1oau5Pwk0PGPNpw87M6k
        TvEDBKT6w+o9XXQhcNo0TapBu3vzWOAW4gIeUVKQ7Bm0IwkUtl0lgDWDrMVVeuYjCX3
        iQgKoPpo+Q==
Date:   Fri, 26 Mar 2021 11:32:27 +0100 (CET)
From:   Mauri Sandberg <sandberg@mailfence.com>
Reply-To: Mauri Sandberg <sandberg@mailfence.com>
To:     Drew Fustini <drew@beagleboard.org>
Cc:     linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, andy.shevchenko@gmail.com,
        geert+renesas@glider.be
Message-ID: <235418388.107167.1616754747569@ichabod.co-bxl>
In-Reply-To: <20210326065944.GA834818@x1>
References: <20210325122832.119147-1-sandberg@mailfence.com> <20210325122832.119147-3-sandberg@mailfence.com> <20210326065944.GA834818@x1>
Subject: Re: [RFC gpio/for-next 2/2] gpio: gpio-mux-input: add generic gpio
 input multiplexer
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
X-Mailer: ContactOffice Mail
X-ContactOffice-Account: com:250217426
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


> ----------------------------------------
> From: Drew Fustini <drew@beagleboard.org>
> Sent: Fri Mar 26 07:59:44 CET 2021
> To: Mauri Sandberg <sandberg@mailfence.com>
> > diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> > index 35e3b6026665..00f7576ce23f 100644
> > --- a/drivers/gpio/Makefile
> > +++ b/drivers/gpio/Makefile
> > @@ -105,6 +105,7 @@ obj-$(CONFIG_GPIO_MPC8XXX)		+= gpio-mpc8xxx.o
> >  obj-$(CONFIG_GPIO_MSC313)		+= gpio-msc313.o
> >  obj-$(CONFIG_GPIO_MSIC)			+= gpio-msic.o
> >  obj-$(CONFIG_GPIO_MT7621)		+= gpio-mt7621.o
> > +obj-$(CONFIG_GPIO_MUX_INPUT)		+= gpio-mux-input.o
> >  obj-$(CONFIG_GPIO_MVEBU)		+= gpio-mvebu.o
> >  obj-$(CONFIG_GPIO_MXC)			+= gpio-mxc.o
> >  obj-$(CONFIG_GPIO_MXS)			+= gpio-mxs.o
> 
> This does not apply to mainline. I've added it manually to my
> drivers/gpio/Makefile but something to fix in v2.

I was developing against gpio tree's [1] 'for-next' branch but should I go against mainline?

> > diff --git a/drivers/gpio/gpio-mux-input.c b/drivers/gpio/gpio-mux-input.c
> > +static int gpio_mux_input_get_value(struct gpio_chip *gc, unsigned int offset)
> > +{
> > +	struct gpio_mux_input *mux;
> > +	int ret;
> > +
> > +	mux = gpio_to_mux(gc);
> > +	ret = mux_control_select(mux->mux_control, offset);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = gpiod_get_value(mux->mux_pin);
> 
> I'm not too familiar with how mux_control works but does there need to
> be locking here?
> 
> Or is not possible for mux_pin to change to another offset before if
> gpiod_get_value() if gpio_mux_input_get_value() runs concurrently?

According to mux documentation [2] successfully selecting a state locks the mux
until it is deselected. So I reckon no extra locking is needed.

> > +
> > +static void gpio_mux_input_set_value(struct gpio_chip *gc,
> > +				  unsigned int offset, int val)
> > +{
> > +	/* not supported */
> 
> I'm not sure but maybe it is better not to define gc->set in the probe?

I will give it a go.
 
> I believe you need to add:
> 
>   MODULE_AUTHOR("...");
>   MODULE_DESCRIPTION("...");
>   MODULE_LICENSE("GPL");
> 
> My build failed with:
> 
>   ERROR: modpost: missing MODULE_LICENSE() in drivers/gpio/gpio-mux-input.o

I will add them, thanks.

 How do you do your build? Mine does not complain pretty much about anything. Also a bot gave me a warning and
I would like to run those tests manually before submitting anything for review.

Cheers,
Mauri

[1] https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/mux/core.c#n322
