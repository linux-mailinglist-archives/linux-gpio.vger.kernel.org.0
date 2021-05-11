Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7362037B0D1
	for <lists+linux-gpio@lfdr.de>; Tue, 11 May 2021 23:31:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229973AbhEKVcK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 May 2021 17:32:10 -0400
Received: from elvis.franken.de ([193.175.24.41]:50509 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229784AbhEKVcK (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 11 May 2021 17:32:10 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lgZy2-0004Ah-00; Tue, 11 May 2021 23:31:02 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 5E38BC0E6B; Tue, 11 May 2021 23:13:59 +0200 (CEST)
Date:   Tue, 11 May 2021 23:13:59 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/2] dt-bindings: gpio: Add devicetree binding for IDT
 79RC32434 GPIO controller
Message-ID: <20210511211359.GA19043@alpha.franken.de>
References: <20210426095426.118356-1-tsbogend@alpha.franken.de>
 <20210426095426.118356-2-tsbogend@alpha.franken.de>
 <CACRpkda7n3VL-EpwdXDxt47azFo8Wkp67-urUy7--3D6TJs7iA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkda7n3VL-EpwdXDxt47azFo8Wkp67-urUy7--3D6TJs7iA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, May 01, 2021 at 02:13:35PM +0200, Linus Walleij wrote:
> On Mon, Apr 26, 2021 at 11:54 AM Thomas Bogendoerfer
> <tsbogend@alpha.franken.de> wrote:
> 
> > Add YAML devicetree binding for IDT 79RC32434 GPIO controller
> >
> > Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > ---
> > Changes in v4:
> >  - renamed to idt,32434-gpio this time for real
> 
> Overall looks good to me.
> 
> > +required:
> (...)
> > +  - ngpios
> 
> Is there a *technical* reason why this is required?
> 
> Can't the driver just default to 32 gpios when not specified?

sure, I make it optional.

> > +  - interrupt-controller
> > +  - "#interrupt-cells"
> > +  - interrupts
> 
> Why can't interrupt support be made optional?
> 
> It is fine if the driver errors out if not provided, but
> for the bindings this feels optional.

I'll make them optional.

> Or does the thing break unless you handle the IRQs?

no, they could be used just as GPIOs.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
