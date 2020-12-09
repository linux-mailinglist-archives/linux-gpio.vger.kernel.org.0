Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C90B2D3DFC
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Dec 2020 09:55:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726672AbgLIIyP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 03:54:15 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:53181 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725942AbgLIIyP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2020 03:54:15 -0500
Received: from [192.168.1.155] ([77.2.91.93]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MyK9S-1jux8A4AO4-00ykZ1; Wed, 09 Dec 2020 09:51:23 +0100
Subject: Re: [RFC PATCH] RFC: drivers: gpio: helper for generic pin IRQ
 handling
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        William Breathitt Gray <vilhelm.gray@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        joyce.ooi@intel.com, Andrew Jeffery <andrew@aj.id.au>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>, orsonzhai@gmail.com,
        baolin.wang7@gmail.com, zhang.lyra@gmail.com,
        Andy Shevchenko <andy@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Jun Nie <jun.nie@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux OMAP Mailing List <linux-omap@vger.kernel.org>
References: <20201208141429.8836-1-info@metux.net>
 <CAHp75VfMKmJ074R2-04be0Ag6OuKcY=_xhhbRKsL2D0H8hZZLg@mail.gmail.com>
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
Message-ID: <39d03958-786e-a6c8-a1e9-9b8a751e4c9e@metux.net>
Date:   Wed, 9 Dec 2020 09:51:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VfMKmJ074R2-04be0Ag6OuKcY=_xhhbRKsL2D0H8hZZLg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:EuKdMo+/U1o5sFyWn2fUeeb59IOsjJ1lKvxlbr6jwLrI3rpvFd4
 nhAYSKUtpDAcHNztBd1k9lK6qbyB1EcO8lUbEIU5JHIuIhzzSdv4XgexxRWXPF00dGCmnbf
 nYQOr067XFqPOQiO8XUmYaHJ4wg6GfRagiQcILR4wwkTZgwJdowyWBZ0VPnXmbiUND2mKf9
 wYeFaMGInmTUtMMfCkfUg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:MzrASONKidU=:2JvqAQMMojOiNOBmF4oVsI
 UjxeFmft5OCgVFjNWuGw9iiMHyWs0gBwNW+1RbqjeGsXuBgPo796Xq4ZZv5+2sfyV+hd12CrE
 EefDT434K7Io5QJGQvg/XvTcEbRA2uQyjC6ENbKlkH57TzhOeQNSqUyEdA46wGS8/1M51hLBZ
 WuV+KrkvIwX06gKHr0UqFsDpHDmFu1o7JC7/YetwlnSjuuEqZwL6Dz+NXFjjiqHVNrAkCQBEv
 zZNwDPdei+yEotyWDlKwnw7Kk3bXhdm4LxWZ+ws8xyqLuvxtsBdFYc6ou+l6WGEZTjIuG/kB8
 QcWRe9NZ74Wl+5CCPfvN6q8dNHVHUmYrh02AfpGJGi8VtWsi08DpWoiqrdD8dD2+smmPlkMNj
 Ip2kWmByQUeGlqnvgP1TuNeyldHDhZ2vtOJj7gfbiuKl5CdhmVjKWS5ZaSE7B
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 08.12.20 15:19, Andy Shevchenko wrote:

Hi,

> Have you able to test them all?

Not yet. It's still an *RFC*, I just like to discuss whether the whole
idea makes sense at all.

In case we come to the consensus that we should do it, I'm going to
split up the patch and rework everything more carefully (for now,
it's just a draft for illustrating the general idea)

I'd also like to hear your opinion on whether we can consolidate these
things even more, eg. using struct gpio_chip's irq data (enabled by
CONFIG_GPIOLIB_IRQCHIP) instead of own fields.

An interesting question here is how to do that w/o gpiolib assuming
they've been managed by it - for example gpiochip_remove (which
cleans up the IRQ stuff) is called by gpiochip_remove(), so we have to
make sure that the driver clears the corresponding fields before
gpiochip_remove() is called. So far so good. BUT: gpiochip_remove()
is also called in error paths, when registration fails in the middle,
and there the driver cannot act properly.

Maybe introduce a flag for telling gpiolib that it should leave these
fields alone and let the driver do everything ?

> As the PCA953x case showed us this is not so simple, 

Can you tell me more about it ?
(BTW haven't touched it in my patch)

> besides the name
> which sucks — we don't *raise* and IRQ we *handle* it.

right, the naming was bad, forgot to correct that before sending.


--mtx

-- 
---
Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schlüssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
