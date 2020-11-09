Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 960882ABEAB
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Nov 2020 15:27:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730272AbgKIO1x (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Nov 2020 09:27:53 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:57847 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730035AbgKIO1w (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Nov 2020 09:27:52 -0500
X-Originating-IP: 86.194.74.19
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 30E3420016;
        Mon,  9 Nov 2020 14:27:49 +0000 (UTC)
Date:   Mon, 9 Nov 2020 15:27:48 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Lars Povlsen <lars.povlsen@microchip.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 2/3] pinctrl: pinctrl-microchip-sgpio: Add pinctrl
 driver for Microsemi Serial GPIO
Message-ID: <20201109142748.GI1257108@piout.net>
References: <20201029134027.232951-1-lars.povlsen@microchip.com>
 <20201029134027.232951-3-lars.povlsen@microchip.com>
 <CAHp75VedcNP5x72PN4tqZ_0HhbCyd666T=AWn+TFr7Fp8EEs7Q@mail.gmail.com>
 <874klyg2dg.fsf@microchip.com>
 <CAHp75VeN4jKjOA=WO0mgkSAbWZUMUfkrX3yV83y0iYnh1rp84Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VeN4jKjOA=WO0mgkSAbWZUMUfkrX3yV83y0iYnh1rp84Q@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 09/11/2020 16:00:16+0200, Andy Shevchenko wrote:
> On Mon, Nov 9, 2020 at 2:07 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:
> > > On Thu, Oct 29, 2020 at 3:40 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:
> 
> ...
> 
> > >> +#define __shf(x)               (__builtin_ffs(x) - 1)
> > >> +#define __BF_PREP(bf, x)       (bf & ((x) << __shf(bf)))
> > >> +#define __BF_GET(bf, x)                (((x & bf) >> __shf(bf)))
> > >
> > > Isn't it home grown reimplementation of bitfield.h?
> >
> > This was answered in the aforementioned mail.
> 
> Perhaps it makes sense to add functions like field_get(), field_prep()
> to that header?

IIRC it has been explicitly excluded from bitfield.h to ensure
developers will think about the introduced overhead.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
