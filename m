Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E4D539B03E
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jun 2021 04:14:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229758AbhFDCQU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Jun 2021 22:16:20 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:17395 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230039AbhFDCQS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Jun 2021 22:16:18 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 15420tHr031948;
        Fri, 4 Jun 2021 10:00:55 +0800 (GMT-8)
        (envelope-from steven_lee@aspeedtech.com)
Received: from aspeedtech.com (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 4 Jun
 2021 10:14:26 +0800
Date:   Fri, 4 Jun 2021 10:14:23 +0800
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
Subject: Re: [PATCH v3 3/5] gpio: gpio-aspeed-sgpio: Add AST2600 sgpio support
Message-ID: <20210604021422.GA25112@aspeedtech.com>
References: <20210603101822.9645-1-steven_lee@aspeedtech.com>
 <20210603101822.9645-4-steven_lee@aspeedtech.com>
 <CAHp75Vef0HDXAHzSNL-LtA0Sra6Zpivt513_+aFR_um0JeFkog@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <CAHp75Vef0HDXAHzSNL-LtA0Sra6Zpivt513_+aFR_um0JeFkog@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 15420tHr031948
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The 06/03/2021 19:05, Andy Shevchenko wrote:
> On Thu, Jun 3, 2021 at 1:19 PM Steven Lee <steven_lee@aspeedtech.com> wrote:
> >
> > AST2600 SoC has 2 SGPIO master interfaces one with 128 pins another one
> > with 80 pins.
> > In the current driver, the maximum number of gpio pins of SoC is hardcoded
> > as 80 and the gpio pin count mask for GPIO Configuration register is
> > hardcode as GENMASK(9,6). In addition, some functions uses the hardcoded
> 
> use
> 
> > value to calculate the gpio offset.
> > The patch adds ast2600 compatibles and platform data that includes the
> > max number of gpio pins supported by ast2600 and gpio pin count mask for
> > GPIO Configuration register.
> > The patch also modifies some functions to pass aspeed_sgpio struct for
> > calculating gpio offset wihtout using the hardcoded value.
> 
> without
> 
> ...
> 
> > +#include <linux/of_device.h>
> 
> Why?
> 
> ...
> 

I will remove it as of_device_get_match_data() will be replaced
to device_get_match_data()

> > +#define GPIO_OFFSET(x)        ((x) & 0x1f)
> 
> GENMASK()
> 
> ...
> 

Do you mean the macro should be modified as follows?
#define GPIO_OFFSET(x)        ((x) & GENMASK(4, 0))

> > +       pdata = of_device_get_match_data(&pdev->dev);
> 
> device_get_match_data()
> 
> I guess you may replace all those of_*() to the corresponding
> device_*() or fwnode_*() calls.
> 

Thanks for the reviews, I will add a new patch for replacing all
of_*() to device_*().

> -- 
> With Best Regards,
> Andy Shevchenko
