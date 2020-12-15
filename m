Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 363072DB0E3
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Dec 2020 17:08:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730723AbgLOQDf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Dec 2020 11:03:35 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:41631 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730564AbgLOQDd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Dec 2020 11:03:33 -0500
Received: from [192.168.1.155] ([95.118.67.37]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MVNJ3-1kiIDQ2Tvr-00SNys; Tue, 15 Dec 2020 17:00:15 +0100
Subject: Re: [RFC PATCH] RFC: drivers: gpio: helper for generic pin IRQ
 handling
To:     Grygorii Strashko <grygorii.strashko@ti.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
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
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Jun Nie <jun.nie@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux OMAP Mailing List <linux-omap@vger.kernel.org>
References: <20201208141429.8836-1-info@metux.net>
 <CAHp75VfMKmJ074R2-04be0Ag6OuKcY=_xhhbRKsL2D0H8hZZLg@mail.gmail.com>
 <CAHp75VfOjb4Rfo9yPmwEYUDbaPXNjfGs6goM27ZnLdAMtiU+jA@mail.gmail.com>
 <0c16ab33-f87f-b32d-53d0-a44a5fecd6dc@ti.com>
 <710efa0f-063e-8a9e-1c3f-49337506b044@metux.net>
 <ff1dcd9a-eb83-2cb5-30d3-b25976a227ab@ti.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <333a4bab-682c-6f5d-f24e-3f9ebe77f536@metux.net>
Date:   Tue, 15 Dec 2020 17:00:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <ff1dcd9a-eb83-2cb5-30d3-b25976a227ab@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:KaHnossIs7UrduZo3pjYr+NreicbYF1LWGdn05LD3iLKIC8rpr9
 +SdNCw4pc1hbvsh6MzkKKovEoq5d6zPPHmSC4kMUfQE/Ope6s9pDhsoAZJTSlDZZ2UTIOzQ
 JWmtqwyUGa2Wn0vi/8g40YdLuzqCnknada7G071RteFF9cBizKocLk/0udQ2CZl1BqoDcp3
 ZMh+9d2pJSDDrSTFDmS7A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZyuPSvaqdx4=:Nliv3YBphcN+6f7I458/jJ
 2UXxp2WstEI39g22OXPrmkiT1tkd2DUgyCuzJXS/ljoFsSNYHPxrUCa0Ykv05itbb0o6vrPNq
 w8xju8TQzH5YnnPPpIXaHkZU+yOd0QWdSVemXhAodYLFBqv6xiaeR4Ri3U8ZBiHYQzstAbm5U
 m/d/JewQJiJZGg7onSjmZWRPUsS2bMDtqiOfIw8R+RF37E7smKg3JCt0mPvPNZcc1ne8F9xLs
 272mc135uLUHcr63EVa1+7J5/P2YQ/ErzZj+STUtYBzRgTUbfdlr5+WFw3kYwsSB35xidPCnw
 xzhLJ//lxJC5I6r1qA0DZ44RgpPZNXl0OKhtNhAH5LGJ5BvGHWmXZRFI+NUnwqMtW4g9u5MR9
 X74WJL9U8TPj/yt/Rmd48SVeNLmAWQxCcsscZlzEyQ7huf+/7POner1UJ4q6H
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 10.12.20 16:40, Grygorii Strashko wrote:

>> a) consolidating repeated patterns (eg. calling the actual irq handling)
>>     into gpiolib, (and later possibly use more fields already existing in
>>     struct gpio_chip for irq handling)
> 
> Even if there is some pattern It doesn't mean consolidation is always
> reasonable.
> one of the things to think about is compiler optimization and will/will
> not this change
> add additional

I dont think the compiler could optimize-out much of the replaced code.
Yes, there's an additional call - but does it really matter so much ?

If we drop the dev_warn() call, the gpiochip_handle_irq() function can
be made inline, so quite no extra costs.


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
