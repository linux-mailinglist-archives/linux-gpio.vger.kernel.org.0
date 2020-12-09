Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A4892D3FD6
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Dec 2020 11:26:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729777AbgLIK0L (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 05:26:11 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:40611 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729231AbgLIK0L (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2020 05:26:11 -0500
Received: from [192.168.1.155] ([77.2.91.93]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MLyzP-1kVgl53LKj-00I0YQ; Wed, 09 Dec 2020 11:23:18 +0100
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
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <710efa0f-063e-8a9e-1c3f-49337506b044@metux.net>
Date:   Wed, 9 Dec 2020 11:23:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <0c16ab33-f87f-b32d-53d0-a44a5fecd6dc@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:EfePztOrymHKfYxNnLFVD8MbCqHmMYcSjnD/zRYzwOVK50PaTDO
 V16L1ULFXQ8mFROXQORa51saqagaRj87zvo+tqf9TrXBvhhqerIr9nW39zr18JXrhWrrq9F
 /g4k+ySn0i/LI9LrCSEb14O0Yp1PDmhhhQeUjyekHFqYY4CrmtWz6c0IuepbOjPEU/7wnGU
 3g/e8ENQ+K2rHKNG1DWRg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:BNgWdIM3ZTw=:BDjkTcychAye7DhF3ue5DL
 l5rChA9jUpaOxlxRC2BB4JwAQ25N88VnNyrLsh+VGdOyEfCU7M2weQuQCPg6LLDVG93Z7OrHb
 JZ2XRMSIRbFXyD8IG1rXnfQrd/fhrYKL8ChQLOofoPXz9ZHD2upIJN3b2k8W2hqtFmzHC0Foy
 Scv6TPvDXeUQzhH4kAYZh0mQb26QHXX39eUbopKRPptcqETtWd96FGoxaVMOAm7uXoX9qj9RP
 /XIgNfpv7mOaRachs05+cg5wXTBXnBAhNHlOME5EC1E99V04hWO9aSwlCNYhP0Akf+8pFppwx
 1YCljurh8GWwIao/VXO5KiniQtBqqpizxzNd5lZQGmcprKoLQgZ/jBI2ai55wSMsx4lz3aPea
 GgGTjupmD9KNiKq7DCBQNYi8BIA3lBzq6XYxmZbhA4aPVpSLejLksZdiBOfEO/ABI4EDA7CeX
 313QpFPGDZ9byhZo9dycobO/QMLuU2hWJbdTi445uQaejdyafS8I
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 08.12.20 17:18, Grygorii Strashko wrote:

>>>> Having all GPIO drivers doing their IRQ management entirely through the
>>>> GPIO subsystem (eg. never calling generic_handle_irq() and using the
>>>> builtin
>>>> IRQ handling) would also allow a more direct (eg. callback-based)
>>>> pin change
>>>> notification for GPIO consumers, that doesn't involve registering
>>>> them as
>>>> generic IRQ handlers.
> 
> Above part makes me worry - why?

Why so ?

Little clarification, in case i've been a bit confusion - there're two
separate topics:

a) consolidating repeated patterns (eg. calling the actual irq handling)
   into gpiolib, (and later possibly use more fields already existing in
   struct gpio_chip for irq handling)

b) a direct consumer callback for change, where the consumer doesn't
   have to care about IRQs at all (some drivers could even do polling,
   when hw doesn't have IRQs). This is for consumers that don't use
   GPIOs as interrupt source, but more more like a very raw serial port,
   eg. bitbanging of other interfaces (maybe an gpio bus type ? ;-))

The above paragraph just outlines that b) might be much easier to
implement, once the suggested refactoring is done and no driver would
call irq handlers directly anymore. But this hasn't much to do with
the proposal itself, just an idea for future use.

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
