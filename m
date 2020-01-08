Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DBE9134553
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jan 2020 15:47:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728601AbgAHOrt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jan 2020 09:47:49 -0500
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:53947 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726697AbgAHOrt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jan 2020 09:47:49 -0500
X-Greylist: delayed 365 seconds by postgrey-1.27 at vger.kernel.org; Wed, 08 Jan 2020 09:47:49 EST
X-Halon-ID: faaf162b-3224-11ea-b6d8-005056917f90
Authorized-sender: andreas@gaisler.com
Received: from andreas.got.gaisler.com (h-98-128-223-123.na.cust.bahnhof.se [98.128.223.123])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id faaf162b-3224-11ea-b6d8-005056917f90;
        Wed, 08 Jan 2020 15:41:39 +0100 (CET)
Subject: Re: [PATCH 2/2] gpio: gpio-grgpio: fix possible
 sleep-in-atomic-context bugs in grgpio_irq_map/unmap()
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jia-Ju Bai <baijiaju1990@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20191218132605.10594-1-baijiaju1990@gmail.com>
 <CACRpkdY4JsvOsjQvB=hb=QPV=bLXkC3ekmPUXFiPMnj1NK-Jtg@mail.gmail.com>
From:   Andreas Larsson <andreas@gaisler.com>
Message-ID: <74268192-4d4f-8019-804e-49b34ec52787@gaisler.com>
Date:   Wed, 8 Jan 2020 15:41:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CACRpkdY4JsvOsjQvB=hb=QPV=bLXkC3ekmPUXFiPMnj1NK-Jtg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2020-01-07 10:37, Linus Walleij wrote:
> However there is a deeper problem, this code was added by Andreas
> Larsson in 2013 and at the time this was a hacky way to deal with
> an interrupt that is actually hierarchical.
> 
> Since 2013 we have gained:
> - Hierarchical interrupt controllers
> - Hierarchical interrupt chip helpers in gpiolib
> 
> So this code really needs to be modernized using a hierarchical
> irqchip.
> 
> See for example commit:
> aa7d618ac65f ("gpio: ixp4xx: Convert to hierarchical GPIOLIB_IRQCHIP")
> for an example.
> 
> Who is using grgpio these days and could work on fixing this up?

I will put on my list to look into this. GRGPIO is used in all our 
chips, and in most designs made by our customers.

The main hurdle with the interrupt handling in the current driver was to 
both allow several lines to generate the same system interrupt and at 
the same time make sure to not register any system interrupts for any 
lines until the user actually requests it (as in the general case all 
interrupts would be registered leading to clashes with interrupts that 
cannot necessarily be shared). Hopefully, the hierarchical interrupt 
controller and chip helper functionalities can cater for these requirements.

Best regards,
Andreas Larsson
