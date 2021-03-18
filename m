Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2A37340E6E
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Mar 2021 20:41:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232908AbhCRTlR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Mar 2021 15:41:17 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:33357 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232950AbhCRTlK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Mar 2021 15:41:10 -0400
Received: from [192.168.1.155] ([77.4.36.33]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MN4ux-1l6GbY07HB-00J1fB; Thu, 18 Mar 2021 20:40:45 +0100
Subject: Re: [PATCH v9 2/4] pinctrl: pinmux: Add pinmux-select debugfs file
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Drew Fustini <drew@beagleboard.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Joe Perches <joe@perches.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
References: <20210302053059.1049035-1-drew@beagleboard.org>
 <20210302053059.1049035-3-drew@beagleboard.org>
 <349b09f8-fe99-d0d4-dd11-c288bf66cb4d@metux.net> <YEyFyQ0TF5u/WS9X@piout.net>
 <CAMuHMdWzEQAOgy7_e_6RcQjP6z0n9LQA6R2LBs1nXMZeAYywvQ@mail.gmail.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <002c9f84-4cc7-714f-0824-bb00eb05a227@metux.net>
Date:   Thu, 18 Mar 2021 20:40:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWzEQAOgy7_e_6RcQjP6z0n9LQA6R2LBs1nXMZeAYywvQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:+ZwcNmiOj1Kef7PLgtFCMGtXLjuaivHTbkjPVod3OVsl9HAgQF2
 olkcKXPEgCba6rJIhiEx+41jtYbjT9bjy5nAfe0qHtZr7B4VC0nCX0Kntbmne8OPF+bga1z
 OcdUJJASQe7ZlVJvRZUo1UfKWWw/l4NLSi9luFCuywt8fRNhLqziucmgmX1AzyKoLtS8Wph
 kOj+1wD8+P0kxvQcKYlBQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:u/eDxUvTGUM=:G2SiQp80rV4IJzSpZhfs6s
 2B3WsiCLwXGjYBhRV/47vUoe2ATGsQoVLZGrQMEi2NRARCHd5FH2eEVD2C9hnUTn8zcssVYR7
 Yplls7mPMuj6pfWbrDEU9DdAiOwZ1tUPuTfUF53rCYRB2Hk5NXdwaRnCcN/ZuM2/ruKHSodgm
 4TNGRqU3O12lAPNZVb3DO803eDGjiNFcVa5Rd63kbc9cNw6r4uDd3CZfHM9i3JiZAEb74gZJi
 sxRrsCC8/eMvcZ5Yj9PCnG0Sk1Fs0vt1q+LRx2P3wh02yVVTIxsPC7S4SIBs+dbvmVLIHzNLt
 YW4aLRYTrCck+wG7XlHPLvpmA3mDq8Fo6Ox+nb8IkYS1C+bcovVnFSj3jolT7URNIneDWuqlB
 EKkqX7BteTPVMhVp7BiDpeqYkXYsO1LksR2ZIP/dgPXGt7vfpsH7ymngKqeg/
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 13.03.21 19:47, Geert Uytterhoeven wrote:

>>> I've already been playing with similar idea, but for external muxes.
>>> For example, some boards have multiple SIM slots that can be switched
>>> via some gpio pin.
>>>
>>> Not sure whether traditional pinmux would be a good match for that.
>>
>> If you want to be able to use both, then I guess gpio-mux is what you
>> are looking for. Obviously, it will also require support in the bus
>> core. On what bus are those SIMs? (I guess the answer will be UART and
>> then unfortunately UARTs are not represented as busses).
> 
> We do have support for devices connected to UARTs.
> See patternProperties in Documentation/devicetree/bindings/serial/serial.yaml.
> Or do you mean something different?

in my case, the SIM cards are connected directly to the baseband
(there're extra lines on the m2 slots for that). CPU doesn't ever see
any of this traffic, just can select which SIM card is routed to the
m2 slot via gpio.


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
