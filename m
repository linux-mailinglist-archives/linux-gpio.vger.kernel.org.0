Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FDAA482BAA
	for <lists+linux-gpio@lfdr.de>; Sun,  2 Jan 2022 16:18:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229845AbiABPST (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 2 Jan 2022 10:18:19 -0500
Received: from mout.web.de ([212.227.15.3]:35483 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229647AbiABPSS (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 2 Jan 2022 10:18:18 -0500
X-Greylist: delayed 311 seconds by postgrey-1.27 at vger.kernel.org; Sun, 02 Jan 2022 10:18:17 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1641136693;
        bh=dfXOUTzddIUyJRHgu8yxQPVA4fjvowR/CU6xSLggqAk=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=IBbl+ppmNvTIPgjiU9hg4PJDwUiw10ceMFQFoCoB+7NuuKhzHfyvNOjUSVkvtup8M
         rSUGwWRshkOqEGQ7Un/0Z+rG0LA4dynn6Fy1QoyHJr9AUXkVr1//nEmkHKV/j1rjIC
         PQSyoDepIfbiKYhOoDZMelkZwy8L9hnwNb7N9kLM=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.10] ([88.215.87.113]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M9Zdw-1n0lHP1SFA-005zIB; Sun, 02
 Jan 2022 16:12:55 +0100
Message-ID: <5a5bc9ac-6d8e-d6de-eec2-ea72970b88bf@web.de>
Date:   Sun, 2 Jan 2022 16:12:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 1/2] pinctrl: bcm2835: Change init order for gpio hogs
Content-Language: en-US
To:     Stefan Wahren <stefan.wahren@i2se.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Phil Elwell <phil@raspberrypi.com>, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-rpi-kernel@lists.infradead.org,
        Thierry Reding <treding@nvidia.com>
References: <20211206092237.4105895-1-phil@raspberrypi.com>
 <20211206092237.4105895-2-phil@raspberrypi.com>
 <CACRpkdZ95bCJVDo4tCXsMnsXax4+ZydoLS7AsM-yzMjXbONk=w@mail.gmail.com>
 <95851343-2887-1e04-9598-e8c8ae74a99a@i2se.com>
 <CACRpkdbnqq+hwXt1oUWZfyxFjdd4aSAz0MzhzYVWuqqVAe4Eig@mail.gmail.com>
 <ec8090b6-6c91-e9ae-fd02-955c8c10ee3e@web.de>
 <ec60b52b-7a59-266d-9608-11c0da9053a6@i2se.com>
From:   Jan Kiszka <jan.kiszka@web.de>
In-Reply-To: <ec60b52b-7a59-266d-9608-11c0da9053a6@i2se.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:3TvfO0bXx6HHKOjcNk1VHeNBbTvaWj+WyanI2CmqCaWJOWsY/An
 uyDDWEYk8DIaJN1O/TA2vSXP5YpBP00Ouhqu88Xa132hbM7MVrxT0N5Cd88pe3H1Uuk2GYn
 HfX1pMUJ478iQGJmNUzV+4eYA4k53sNEEermXKpRyXJMcwDls3ruUTW7dCwqtJ2nKJwRII9
 zKacG7tiFeGLo63nz+FIQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:zE0g6qF7vbE=:/H6tx/bqY631Tj+WtxVLFc
 z3onj2A3LKVtXfUf6Gi83SrC30Lj/aWKztGC1TphlO6x6uupb11mwGHAFxjU2V/jPgQmcu4Ot
 ILOBv4USIFR4/N0AlmEdWpHzVPRBjt5bOuwerffdDyzJwP2DN9D7j2eo5BubQZHk25IZa8L5K
 6uUWiUHVwg8fGFQtkvEBSTNMx1Jdged+JX779FOhmndQx1N7eIvNEFcSUm3NMTEIyj1SDZtzO
 diZ/FdPWhdV+GWPyks5UERB14/v17gMnT/P4ImvgtMnhSv8QUzET9s0g/Qdy7O6Y8hVsoECz/
 9U7P7tU6tIpuC57rXrnHwb7teT35mtKmSumtRcWneAR4iofqrb79tTAcIYcofnf9gly1RIp7T
 ZPQ9giSgGg/F9ej7+wGa84wxBjsF0LOr6CvHRjWN+gL7T27QboE3qb3PHTtV3PnOQSrvZsoW+
 mHKgGTYDQC/IZhBQMFcQLB3asJctDYd/+7NCIDbcokz6MpEc6HH+KLKAA3Cvc8oIbhKUpuQqx
 2HYls67kCtuCeYynNImK+AuSpOqhDoh+SuO0gNqMgXdB9DN09G5ytsSTmzYo28uynsEZKhol2
 tUIbSwOfrERfWhUxiIHmrCNOX7RZVBgKY4eY9j2GWCGUHZg7RGNmEbmT5cyjWrVdVQJ3+2Yyy
 u3iaW5YOJlRHyB7Eh8G4m/tWPA0J2wgeFKN4KYqLuqL3mjEunCqoOyKjlc6jZ+RPSYpZJY/L6
 4MzrGtUKCHO12yubO+P90m3RxIkeGQgg16oKf83ifq4HI6eYtHnayhP3sf61kGBiwRUfrff3T
 ESzPDPIDV4tjuVbiEs0RLYjtzTukDT+tivbcQgZjBB0j4yOFHaKuZuVBxJ2jVL7/9RParMpXA
 f0BJmOg9qP+q7pNvNf+WafJRSEb7L2PkJJM64xcghlp0iqO+7B5bSRPl042qe57LBPRsnJvL5
 fF/jvc5GdOGx2Nv9Ro7V593rlLsK40QMEBwCzovugLRcInluQ5okJxL2Qa7xgkomD/sHp83Z+
 R2V8Z9Qq0udnmrMTsZHIchMe4HTATDxrGP+PpVp1CQaJ7lq9FuSm4j2MnsJHoYKQRyW9zGAiV
 Qw18Bz0YH3TxzM=
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 02.01.22 13:33, Stefan Wahren wrote:
> Hi Jan,
>
> Am 02.01.22 um 12:02 schrieb Jan Kiszka:
>> On 02.01.22 07:54, Linus Walleij wrote:
>>> On Wed, Dec 29, 2021 at 8:07 PM Stefan Wahren <stefan.wahren@i2se.com>=
 wrote:
>>>> Am 10.12.21 um 00:24 schrieb Linus Walleij:
>>>>> On Mon, Dec 6, 2021 at 10:22 AM Phil Elwell <phil@raspberrypi.com> w=
rote:
>>>>>
>>>>>> ...and gpio-ranges
>>>>>>
>>>>>> pinctrl-bcm2835 is a combined pinctrl/gpio driver. Currently the gp=
io
>>>>>> side is registered first, but this breaks gpio hogs (which are
>>>>>> configured during gpiochip_add_data). Part of the hog initialisatio=
n
>>>>>> is a call to pinctrl_gpio_request, and since the pinctrl driver has=
n't
>>>>>> yet been registered this results in an -EPROBE_DEFER from which it =
can
>>>>>> never recover.
>>>>>>
>>>>>> Change the initialisation sequence to register the pinctrl driver
>>>>>> first.
>>>>>>
>>>>>> This also solves a similar problem with the gpio-ranges property, w=
hich
>>>>>> is required in order for released pins to be returned to inputs.
>>>>>>
>>>>>> Fixes: 73345a18d464b ("pinctrl: bcm2835: Pass irqchip when adding g=
piochip")
>>>>>> Signed-off-by: Phil Elwell <phil@raspberrypi.com>
>>>>> This patch (1/2) applied for fixes.
>>>> Unfortunately this change breaks all GPIO LEDs at least on the Raspbe=
rry
>>>> Pi 3 Plus (Linux 5.16-rc7, multi_v7_defconfig). The ACT LED for insta=
nce
>>>> stays in the last state instead of the configured heartbeat behavior.
>>>> Also there are no GPIO LEDs in /sys/class/leds/ directory.
>>>>
>>>> After reverting this change everything is back to normal.
>>> Oh what a mess. OK I reverted the fix.
>>>
>> I happened to debug this regression as well: The issue of the patch
>> seems to be that it initializes gpio_range.base with -1, because
>> gpio_chip.base is not yet set at this point. Maybe that can be achieved
>> differently, to please all cases.
>
> thanks for the hint.
>
> I tried to reproduce the original issue with the gpio hog by adding one
> to the RPi Zero W. Here are my test results of this series based on
> Linux 5.16:
>
> 1. - Patch 1 & 2 not applied: boot hangs caused by gpio hog
> 2. - Patch 1 applied, Patch 2 not applied: boot hangs caused by gpio hog
> 3. - Patch 1 not applied, Patch 2 applied: boot hangs caused by gpio hog
> 4. - Patch 1 & 2 applied: boot ok, LEDs okay, hog okay
>
> So both patches must be applied at the same time. In general this is
> done via immutable branch. But this requires caution while backporting.
>

Indeed - upstream and stable are missing patch 2, and that fixes the
issue as well. Too bad that this series was split during merge.

Jan
