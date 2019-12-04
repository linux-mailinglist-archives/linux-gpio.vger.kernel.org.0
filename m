Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 261EE112B86
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2019 13:33:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727682AbfLDMc7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Dec 2019 07:32:59 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:38765 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726604AbfLDMc7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Dec 2019 07:32:59 -0500
Received: from [192.168.1.155] ([77.9.37.28]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1M8QBa-1igtgG0OFE-004VLl; Wed, 04 Dec 2019 13:32:56 +0100
Subject: Re: [PATCH 0/8] gpiolib: add an ioctl() for monitoring line status
 changes
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20191127133510.10614-1-brgl@bgdev.pl>
 <CACRpkdZ6e0GaE9KBJ1-E+cS_KnPY-EKLNxJFqjArr28hYMQqOg@mail.gmail.com>
 <CAMRc=McH6m3Lsvz8g1JSD_c-QNdb-Kh0+8BH5EKcEW2vM2VYJA@mail.gmail.com>
 <CACRpkdaW8YxjEBN0jX5AYmzGyftGv=b-KOCsjMMxoqqESBDsyA@mail.gmail.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <d0f29707-cbb6-fbee-3d54-f336a11442ad@metux.net>
Date:   Wed, 4 Dec 2019 13:32:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdaW8YxjEBN0jX5AYmzGyftGv=b-KOCsjMMxoqqESBDsyA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:P8p5gsbkmlK/nhLLbj0OHfS7vEIZ0B4Q+tmfhuq8IxroMZsY0LD
 t+plKHAAFYyxPRPgNydEkfvfRQWNFdouboKN0KldW2NpMlYe413aRSCer8b1vceSQelt2B+
 jGdgmoBPHsntoZkDLRqTpQdu+FR+QvLidio40ITdTiVzOCud2fC2yfDTeoemcF2gUCLjNrk
 KBe8l4e6xU6f+4JfN/3cQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:1OPu09XnPTQ=:W0M7J3XICdpFopuXx7+PWK
 94WS0KcLpc0tP68teJNRmXdbsxwZCOjEnE7PZRkN+ft0cN9dIsr2gPoddwjDYCnFUSjsXz8I9
 w2pnlhOPDq6I+CqoaaJ5UncKrra2bcX5ZW+C68Nfn9fmHcXppr+gY7kE2UC+Itc267Z9e+p6I
 1M8xmycWJzE20MYBBEa5w1Bnxgm1Hea7B8UAEN6/1XYCsz++U2azMM813Rbwq5eu4Lc9P8P0w
 RYZYvqSSX/rsHBZmMajELzr108Cs+Re8/uqsxmnE2dOa/WaohnpyMMwa6fuGNext6Ty7GNDxQ
 moB+0D5osuGDppo4Tg9vp+j90EGGh9bVj3kvX5mO4tWo3AAirmND+Y5MS735F1uQnkUTwhZte
 eb9nGiEFhTWH31+L87V8tXzQFPuO+h0HPU+F7/eGtS5+i4q/HW3UPa+pAv+AKrlALPx04JwU5
 IaydQh0eGlKxlhyfxC397kaCIjqk6tqPGYq2pxUZ22CmOJN46z3GqCjBKUHPmeURPtdoHmh4j
 vVza9cUCp8j91ioNRfVrbgqnWrN/PHO/2QKF1YnOPfdHQUk8DvSzVp53Z14pj8b/pK2gBZfKs
 hBO9irNo0g4VsCW30UylXrto938wupc0IE0qKBACs9uvmwNZ3s0QENdcFNbPUsvV0hwHSe9+D
 cCabNWueL8O88P6laIJXCslYOe0tOABs0ScA3RgUtrwb09HenH8a+g9QpbjBmeTZgx8N1VR57
 FAYDNwE4NqyZv8XEbW0w4XY8tvVS9hoM59OsmlsglLwZqymJn5a2UB3zyAmLJgQ92gkg90zde
 b7IFpC+kSiKIS4qrXR12nFJ58TbiW5FgbeGa2cbE5aI4svQsrvtTG+i8hmFFcnVRnudKGoEFJ
 JMlU+TzcIY0d4DcUp/fQ==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 29.11.19 13:57, Linus Walleij wrote:

Hi,

> My own pet peeve is the industrial automation and control use
> case: here we have the design space where people today use
> either PLC:s or RaspberryPi's or Beagle boards, or even some
> custom computers.
> 
> For me personally that is a design space we should cover and
> if this helps the RaspberryPi to do that better I'm all for it.

Yeah, I also have clients in that field. The main problem here,
IMHO is their way of thinking: no device abstraction at all, but all
pretty much hardwired for specific installations (also the reason,
why they'll fail miserable on the new IOT field :p). These folks are
still used to the ancient pure PLC way, where there isn't even anything
like an operating system.

IMHO, it's an educational problem: people need to understand that
there're device abstractions for good reasons, and they should respect
and use them. Basically, they have to understand the concept of
modularization and abstractions. IEC 1131-3 obviously isn't made for
that.

For example, take simple heating installation. Pumps won't be controlled
by raw inverter configuration anymore, but rpm or m²/sec. Temp or flow
sensors don't give raw numbers, but degress Kelvin or m^/sec, etc.
In that case, the corresponding subsystem would be IIO - no need to ever
care about gpios, pwms, etc, directly.

Following this modular approach, everything suddenly gets much easier,
eg. replacing a pump by a different model just requires a minor
reconfiguration instead of rewriting huge parts of the plc code.

I've managed to teach this to an Siemens field technician in one evening
with a few beers, so it can't be that hard to understand.

> An especially interesting case is multiple GPIO expanders
> plugged in on pluggable busses such as PCI or USB. I think
> that kind of discoverability and dynamically expandable GPIO
> blocks is something people in the industry are quite keen to
> get.

Smells like a case for oftree overlays ...

> What we need to do is to make it dirt simple to use GPIOs for
> custom hacks and construction of factories and doorstops
> and what not, while at the same time strongly discouraging
> it to be used to manage hardware such as laptops, tablets
> or phones from userspace. That's maybe hard, and we might
> be victims of our own success ...

I contradict. We should encourage industrial/construction folks to
do decently structured, professional engineering - IOW: use
modularization and highlevel drivers, instead of tinkering with
raw gpios directly like a school kid.


--mtx

-- 
Dringender Hinweis: aufgrund existenzieller Bedrohung durch "Emotet"
sollten Sie *niemals* MS-Office-Dokumente via E-Mail annehmen/öffenen,
selbst wenn diese von vermeintlich vertrauenswürdigen Absendern zu
stammen scheinen. Andernfalls droht Totalschaden.
---
Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schlüssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
