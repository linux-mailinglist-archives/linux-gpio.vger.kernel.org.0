Return-Path: <linux-gpio+bounces-9281-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C857E962C29
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 17:24:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F9D31F2505A
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 15:24:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02C6C18801C;
	Wed, 28 Aug 2024 15:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="VHvABM9u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47AFF187FF1
	for <linux-gpio@vger.kernel.org>; Wed, 28 Aug 2024 15:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724858678; cv=none; b=nsXtr9Vl0N5WGwXvNFkqMeqtnfz4KLiO1I/p7OtaddNtyCo++I5xJKiJv+DFEUjRa09JCxv4EiEP4KjMMEF6vdALRcbuVFpi7dJ2IcoczdFsTvsMHUdgxJdgsndja4GCpHQb1JQ7FiDg0YDJdber2ctV5gaQHeuMHgw54NlrgI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724858678; c=relaxed/simple;
	bh=sECdKZWmQ58VFDoOPO3d4pP0VUHs2KL2y5lS6y1lA/o=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LJnPPF7XxY5xTOd9zfevQeoI0OklMJNBkG0sifF9WLm9b/kBeN/387BUG6dZiMm7HBK8JQB+Z6S/y/C3QXnfC/bMqRwMgqnTDG9THvoTd/d++yno9sB/A8DKpf9YMy2Ik8M9Szldp9q7HxrHLwmWnTA28Zvhjk8pl64OiCu2LFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=VHvABM9u; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a8696e9bd24so749799866b.0
        for <linux-gpio@vger.kernel.org>; Wed, 28 Aug 2024 08:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724858674; x=1725463474; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RccO/6aYSzsD64ZgEXVUnoiwa51kK0FzwBqBJe1629o=;
        b=VHvABM9uijgUErGZAwZhTsTmwEtdX6jkNUnwy2adhhQZuTadwx+reBpwXWUV8odp/Y
         r8IVfFrVJwLJFGESrsupCHQG88Q12NwPfYmnz2LRjkdNm7STY/rlCKcmSBqtrq7lDwOl
         MQeOpDgc2dNZgimM8zvAyEgEAmIyQCFgFdyHZjmSrieuxzue94fPNhFb8UOFo2ETyVxL
         q5ckBLyZUPkbblY5tQ4wJC300X1edhbA15Wyb6udkNUj79VjdmrzxwVh3zZRB6Egssia
         27lveneBzSwjO9joQ11yfNkxSWvDu/vR5sAEtKJq26WAaLBRW5Yq9r+J0Tih7t43x+8E
         EmNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724858674; x=1725463474;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RccO/6aYSzsD64ZgEXVUnoiwa51kK0FzwBqBJe1629o=;
        b=jex/rUaF2sO1/uPqOwLDEcOAZWCfyxGI+46oek96TQOFVr/5WzKHIZSiPfCDekBC7i
         pqxTBPCsUtgCRe6YuKnnzIOQUgAcf9pe5y3ewoO2myW42AzWUQIWEKeQI7/00+DpLWrr
         MsRnl8jblK6OWT23MTrpYv1KNmcjpIOA8+mSQaT77xbNEuWtK4bmhpHWhfigWjjD2qMv
         /Y2lgGqeH5/IfxE5Tu734mSxfLhfIwlDAOsZCVfFzUYTVFC2EAzyC/NVf1OTlvHDaKnn
         daPqEW+8NHeRGL5Mam/paNAnmuE/iFjRYQhzCM0JYLuz7UICmDeic0X6imIwl74l+i9W
         8bnA==
X-Forwarded-Encrypted: i=1; AJvYcCV2k0jxZSUgPtjJuDL6Ohd0kZ95HJZw3Y69HoaXn3u+nfIVt9NGJJ98bflVxorFuiA1Js4Z0rXHpJOx@vger.kernel.org
X-Gm-Message-State: AOJu0YwtyuMg2kisIj+JEg9JF2NbUZvPRAUMJQF83BeA8g/WDIpH7y7b
	4e1FnUIcEkj/HBoGYQNTxBkJMjUGxPtaCxE1NazjqsZPf86KYjz3ctVvBakapiE=
X-Google-Smtp-Source: AGHT+IEGTIMf9HDmr3RD/PvAk+4C11JysnBRyFuK/mQqbOsClKq28ul4IglJqfFC2hAOgC6a2khVvQ==
X-Received: by 2002:a17:906:6a29:b0:a7a:a7b8:adae with SMTP id a640c23a62f3a-a870a94fe14mr219949166b.4.1724858673188;
        Wed, 28 Aug 2024 08:24:33 -0700 (PDT)
Received: from localhost (host-80-182-198-72.retail.telecomitalia.it. [80.182.198.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e594a599sm255662266b.201.2024.08.28.08.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 08:24:32 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Wed, 28 Aug 2024 17:24:39 +0200
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arch@vger.kernel.org,
	Lee Jones <lee@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Stefan Wahren <wahrenst@gmx.net>
Subject: Re: [PATCH 07/11] pinctrl: rp1: Implement RaspberryPi RP1 gpio
 support
Message-ID: <Zs9BN_w4Ueq-VkJr@apocalypse>
Mail-Followup-To: Linus Walleij <linus.walleij@linaro.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arch@vger.kernel.org,
	Lee Jones <lee@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Stefan Wahren <wahrenst@gmx.net>
References: <cover.1724159867.git.andrea.porta@suse.com>
 <eb39a5f3cefff2a1240a18a255dac090af16f223.1724159867.git.andrea.porta@suse.com>
 <CACRpkdbdXNeL6B43uV-2evCfr6iv8fUsSVtAND+2U0H5mSL2rw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdbdXNeL6B43uV-2evCfr6iv8fUsSVtAND+2U0H5mSL2rw@mail.gmail.com>

Hi Linus,

On 10:59 Mon 26 Aug     , Linus Walleij wrote:
> Hi Andrea,
> 
> thanks for your patch!

Thanks for your review!

> 
> On Tue, Aug 20, 2024 at 4:36 PM Andrea della Porta
> <andrea.porta@suse.com> wrote:
> 
> > The RP1 is an MFD supporting a gpio controller and /pinmux/pinctrl.
> > Add minimum support for the gpio only portion. The driver is in
> > pinctrl folder since upcoming patches will add the pinmux/pinctrl
> > support where the gpio part can be seen as an addition.
> >
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> (...)
> 
> > +#include <linux/bitmap.h>
> > +#include <linux/bitops.h>
> (...)
> 
> > +static void rp1_pad_update(struct rp1_pin_info *pin, u32 clr, u32 set)
> > +{
> > +       u32 padctrl = readl(pin->pad);
> > +
> > +       padctrl &= ~clr;
> > +       padctrl |= set;
> > +
> > +       writel(padctrl, pin->pad);
> > +}
> 
> Looks a bit like a reimplementation of regmap-mmio? If you want to do
> this why not use regmap-mmio?

Agreed. I can leverage regmail_field to get rid of the reimplemented code
for the pin->pad register region. Do you think it could be worth using
regmap-mmio also on pin->gpio, pin->inte, pin->ints and pin->rio even
though they are not doing any special field manipulation as the pin->pad
case? 

> 
> > +static void rp1_set_dir(struct rp1_pin_info *pin, bool is_input)
> > +{
> > +       int offset = is_input ? RP1_CLR_OFFSET : RP1_SET_OFFSET;
> > +
> > +       writel(1 << pin->offset, pin->rio + RP1_RIO_OE + offset);
> 
> If you include bitops.h what about:
> 
> writel(BIT(pin->offset), pin->rio + RP1_RIO_OE + offset);

Ack.

> 
> > +static int rp1_get_value(struct rp1_pin_info *pin)
> > +{
> > +       return !!(readl(pin->rio + RP1_RIO_IN) & (1 << pin->offset));
> > +}
> 
> Also here

Ack.

> 
> > +
> > +static void rp1_set_value(struct rp1_pin_info *pin, int value)
> > +{
> > +       /* Assume the pin is already an output */
> > +       writel(1 << pin->offset,
> > +              pin->rio + RP1_RIO_OUT + (value ? RP1_SET_OFFSET : RP1_CLR_OFFSET));
> > +}
> 
> And here

Ack.

> 
> > +static int rp1_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
> > +                              unsigned long config)
> > +{
> > +       struct rp1_pin_info *pin = rp1_get_pin(chip, offset);
> > +       unsigned long configs[] = { config };
> > +
> > +       return rp1_pinconf_set(pin, offset, configs,
> > +                              ARRAY_SIZE(configs));
> > +}
> 
> Nice that you implement this!

Thanks :)

> 
> > +static void rp1_gpio_irq_config(struct rp1_pin_info *pin, bool enable)
> > +{
> > +       writel(1 << pin->offset,
> > +              pin->inte + (enable ? RP1_SET_OFFSET : RP1_CLR_OFFSET));
> 
> BIT()

Ack.

Many thanks,
Andrea

> 
> Yours,
> Linus Walleij

