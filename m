Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 148DC39B04C
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jun 2021 04:18:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229772AbhFDCUF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Jun 2021 22:20:05 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:23258 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229697AbhFDCUF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Jun 2021 22:20:05 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 15424eXE032117;
        Fri, 4 Jun 2021 10:04:40 +0800 (GMT-8)
        (envelope-from steven_lee@aspeedtech.com)
Received: from aspeedtech.com (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 4 Jun
 2021 10:18:10 +0800
Date:   Fri, 4 Jun 2021 10:18:08 +0800
From:   Steven Lee <steven_lee@aspeedtech.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>,
        "Hongweiz@ami.com" <Hongweiz@ami.com>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [PATCH v3 4/5] gpio: gpio-aspeed-sgpio: Add set_config function
Message-ID: <20210604021807.GB25112@aspeedtech.com>
References: <20210603101822.9645-1-steven_lee@aspeedtech.com>
 <20210603101822.9645-5-steven_lee@aspeedtech.com>
 <CAHp75VcPdUeK49w9qg9RuJY7ASMyFMEEi=cX1gnp=wM_QHDZ+w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <CAHp75VcPdUeK49w9qg9RuJY7ASMyFMEEi=cX1gnp=wM_QHDZ+w@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 15424eXE032117
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The 06/03/2021 19:07, Andy Shevchenko wrote:
> On Thu, Jun 3, 2021 at 1:20 PM Steven Lee <steven_lee@aspeedtech.com> wrote:
> >
> > AST SoC supports *retain pin state* function when wdt reset.
> > The patch adds set_config function for handling sgpio reset tolerance
> > register.
> 
> ...
> 
> > +static int aspeed_sgpio_set_config(struct gpio_chip *chip, unsigned int offset,
> > +                                  unsigned long config)
> > +{
> > +       unsigned long param = pinconf_to_config_param(config);
> > +       u32 arg = pinconf_to_config_argument(config);
> > +
> > +       if (param == PIN_CONFIG_PERSIST_STATE)
> > +               return aspeed_sgpio_reset_tolerance(chip, offset, arg);
> 
> > +       else
> 
> Redundant.
> 
> > +               return -EOPNOTSUPP;
> 
> IIRC we are using ENOTSUPP internally in the kernel. YEs, checkpatch
> warning may be ignored.
> 
> > +}
> 

I will modify the code as you suggested above, thanks.

> -- 
> With Best Regards,
> Andy Shevchenko
