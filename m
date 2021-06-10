Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C8DF3A2749
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jun 2021 10:40:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229941AbhFJImM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Jun 2021 04:42:12 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:15191 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229910AbhFJImM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Jun 2021 04:42:12 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 15A8Pde1068923;
        Thu, 10 Jun 2021 16:25:39 +0800 (GMT-8)
        (envelope-from steven_lee@aspeedtech.com)
Received: from aspeedtech.com (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 10 Jun
 2021 16:39:33 +0800
Date:   Thu, 10 Jun 2021 16:39:32 +0800
From:   Steven Lee <steven_lee@aspeedtech.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
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
        Hongwei Zhang <Hongweiz@ami.com>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [PATCH v5 00/10] ASPEED sgpio driver enhancement.
Message-ID: <20210610083932.GA30360@aspeedtech.com>
References: <20210608102547.4880-1-steven_lee@aspeedtech.com>
 <CACRpkdZOStr+K9U9QTkAcsk4NxuSqBRVv_-9_VkGJbT69iSxmQ@mail.gmail.com>
 <20210610022416.GA27188@aspeedtech.com>
 <CACRpkda60eB6i2+2MQFyhqYn4Q0WRGPPs91cu9K-g1maov61+w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <CACRpkda60eB6i2+2MQFyhqYn4Q0WRGPPs91cu9K-g1maov61+w@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 15A8Pde1068923
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The 06/10/2021 15:50, Linus Walleij wrote:
> On Thu, Jun 10, 2021 at 4:24 AM Steven Lee <steven_lee@aspeedtech.com> wrote:
> 
> > Per the comment in the following mail
> > https://lkml.org/lkml/2021/6/9/317
> >
> > I was wondering if I should prepare v6 for the currnet solution or
> > I should drop this patch series then prepare another patch for the
> > new solution(piar GPIO input/output) which breaks userspace but is
> > better than the current solution.
> 
> I would say just go ahead with the new solution. AFAIK Aspeed
> has pretty tight control over what kind of userspace run on these
> systems.
> 
> BTW please influence Aspeed to use the GPIO character device
> and ligpiod
> https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/
> if you are doing any kind of userspace GPIO control (which I
> suspect that you do).
> 

We currently use gpioset and gpioget that provided by libgpiod to test
aspeed gpio and sgpio drivers.

For the current solution on AST2600,
the valid range of input pins  is 0 ~ 127,
the valid range of output pins is 128 ~ 255.
So we access input pins by the following command

```
gpioget $chipId 0 1 2 3 4 ... 127
```

and access output pins by the following command

```
gpioset $chipId 128=1 129=0 130=1 131=1 ... 255=1

```


The new solution will change the gpio id order as follows
Input:
```
gpioget $chipId 0 2 4 6 8 ... 254

```

Output:

```
gpioset $chipId 1=1 3=0 5=1 7=1 ... 255=1

```

Thanks,
Steven

> Yours,
> Linus Walleij
