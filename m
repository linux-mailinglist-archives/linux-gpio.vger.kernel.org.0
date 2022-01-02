Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 563A7482BAF
	for <lists+linux-gpio@lfdr.de>; Sun,  2 Jan 2022 16:22:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232822AbiABPWO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 2 Jan 2022 10:22:14 -0500
Received: from mout.web.de ([212.227.15.4]:42647 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232473AbiABPWO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 2 Jan 2022 10:22:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1641136932;
        bh=nXTWG9aHaytG/fLgyapPBtjKSej/VaCE6ky5BzJTVR0=;
        h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
        b=Eki8ZJDiPkbGzngP7ha8CEFK0eUzK44nOczToZFT9qRWVHCsEJSeMcWg/Ad630Cnf
         ji9eRX3IQpeoa9IK3ZwWhWjv/EE2BpAoAWO4vDZk8sdsA7cY9yux99G0XXtmwnj58Q
         dP5Lc3+yHcc5lcC7NY+RcCtev0j48rzdE3AuKhOY=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.10] ([88.215.87.113]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M59n6-1n593x1A7o-001bRW; Sun, 02
 Jan 2022 16:16:53 +0100
Message-ID: <0951facb-8b19-c0f3-4f25-a5ac4a798859@web.de>
Date:   Sun, 2 Jan 2022 16:16:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 1/2] pinctrl: bcm2835: Change init order for gpio hogs
Content-Language: en-US
From:   Jan Kiszka <jan.kiszka@web.de>
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
 <5a5bc9ac-6d8e-d6de-eec2-ea72970b88bf@web.de>
In-Reply-To: <5a5bc9ac-6d8e-d6de-eec2-ea72970b88bf@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:i8yjLY7FDWXhw3U8gwjwyquZoMIXWQprZ1hRtE8AH7K0q8hRvSQ
 PYKt49geq+7WVvDCrt0k2BD/AkRk2FslOLcXSQXocjPEbPcyVbgqAnd+3iTYg/2ozV0e4tx
 hIZFNIqyOxKkIwsWJjddoZYLBsZ0XQ8T9vxseFhX1y64notmyMETGrbdo8S2onvEalLiXdT
 6q836YIG/myuNez43C6CQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:03UPERU/xq8=:qkyyfjtbnovXuPzw2a3seN
 v9qiXV0qtipVGgS65VqFxCQ+eiOfx1wdHCnhBZM2FylN8EkqHo23ByDU2IYxfB7GEVNrUtMLU
 12XS6kfam5Lk77KS3Q/UVuoXouNFV9l+P+5lvaBJ94eiFWhGtmofhrHb+q5jdfCCA9LYSNo8a
 4tKi9aFQEdypZLcB4mmNf1ceorgE3kRHcDGxsnCzUV76PsyHWQkC/xNA2t29UxlR/SongrlCx
 Odg4rpOu4+/aJiiLSkNo00QipO9APwAdVrB+PP4JUzmsusGeUQ4qlCKkqBlEauMgwQzdflfJ5
 qpqHUVlLRStePs9IGJTXJo09ks/S2DOcV/74DTUDktWiM4BLsFA6WxCjRsVGGLbQSzgJL3YOE
 n63B0b5GaCLcfl8WVAXUH0qQhiGKq2/Kht1v0mojKxQWyBpfm5xnruakzWaMPcMUZEg6CXw66
 hSSd7PwnJDRFQA3OLpEpgVIyuq27zCgkexaJCBsgbBOWUYxLcJP1n3VJDW/kSdI9EnuCWrpD7
 oy2rBiiAkw0QwD1XOVRVd+28SNPA2OHRanrFxEoFGHsbjaGGH5QkMFTW/TcX4zp/zoqUOdu3I
 wUvWvIwJhhWDPB6g5shJdDZe2IEt8UPaX/5Kt/0bAjog/SNgtHo6zbxuER8K5Ip8ji50/u55R
 qsTn55mFrVWbrWAUZ5MWnW/k8mzmWP9Vh4jvP4TxBOOvRis6hUHOQ7kBlvONI1+CjK+R991kd
 0F+hbnC2TLysWGz6/4PbXsJPTLOuo78hlTnoCsR6QsLrO6n0MX4pzoAJ4xYECv9gRKJTF5g27
 FxEGAwtrSk1c5ETByJiP8z86e51f7lmWdovzW2ih0nouDzqv1AqW+Pv9zd/+PPk4UYJ8Lwuk5
 YNRFnIYw0lHGLUu7S+0MeJJmJ3l7GcjCrQccoA7tLjVyBG0X3NvAeOaBP/1tNpOQ4sIn4USTk
 aGO0mL6RE8BsEU+X0bXniJBV/baP8/DaQSkBKqTO6qx/9r6bXsRQRxgJVTP+m3gt+xY/kjLx1
 YeFUj192fN0L9XOjj4NyG1TqKy8OMRsOfE5q6Wh1DUdPdN0SXM0u7Wr9yKqUhMUyIIN7+ZRrO
 8k+rp25yRg8/wk=
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 02.01.22 16:12, Jan Kiszka wrote:
> On 02.01.22 13:33, Stefan Wahren wrote:
>> Hi Jan,
>>
>> Am 02.01.22 um 12:02 schrieb Jan Kiszka:
>>> On 02.01.22 07:54, Linus Walleij wrote:
>>>> On Wed, Dec 29, 2021 at 8:07 PM Stefan Wahren <stefan.wahren@i2se.com=
> wrote:
>>>>> Am 10.12.21 um 00:24 schrieb Linus Walleij:
>>>>>> On Mon, Dec 6, 2021 at 10:22 AM Phil Elwell <phil@raspberrypi.com> =
wrote:
>>>>>>
>>>>>>> ...and gpio-ranges
>>>>>>>
>>>>>>> pinctrl-bcm2835 is a combined pinctrl/gpio driver. Currently the g=
pio
>>>>>>> side is registered first, but this breaks gpio hogs (which are
>>>>>>> configured during gpiochip_add_data). Part of the hog initialisati=
on
>>>>>>> is a call to pinctrl_gpio_request, and since the pinctrl driver ha=
sn't
>>>>>>> yet been registered this results in an -EPROBE_DEFER from which it=
 can
>>>>>>> never recover.
>>>>>>>
>>>>>>> Change the initialisation sequence to register the pinctrl driver
>>>>>>> first.
>>>>>>>
>>>>>>> This also solves a similar problem with the gpio-ranges property, =
which
>>>>>>> is required in order for released pins to be returned to inputs.
>>>>>>>
>>>>>>> Fixes: 73345a18d464b ("pinctrl: bcm2835: Pass irqchip when adding =
gpiochip")
>>>>>>> Signed-off-by: Phil Elwell <phil@raspberrypi.com>
>>>>>> This patch (1/2) applied for fixes.
>>>>> Unfortunately this change breaks all GPIO LEDs at least on the Raspb=
erry
>>>>> Pi 3 Plus (Linux 5.16-rc7, multi_v7_defconfig). The ACT LED for inst=
ance
>>>>> stays in the last state instead of the configured heartbeat behavior=
.
>>>>> Also there are no GPIO LEDs in /sys/class/leds/ directory.
>>>>>
>>>>> After reverting this change everything is back to normal.
>>>> Oh what a mess. OK I reverted the fix.
>>>>
>>> I happened to debug this regression as well: The issue of the patch
>>> seems to be that it initializes gpio_range.base with -1, because
>>> gpio_chip.base is not yet set at this point. Maybe that can be achieve=
d
>>> differently, to please all cases.
>>
>> thanks for the hint.
>>
>> I tried to reproduce the original issue with the gpio hog by adding one
>> to the RPi Zero W. Here are my test results of this series based on
>> Linux 5.16:
>>
>> 1. - Patch 1 & 2 not applied: boot hangs caused by gpio hog
>> 2. - Patch 1 applied, Patch 2 not applied: boot hangs caused by gpio ho=
g
>> 3. - Patch 1 not applied, Patch 2 applied: boot hangs caused by gpio ho=
g
>> 4. - Patch 1 & 2 applied: boot ok, LEDs okay, hog okay
>>
>> So both patches must be applied at the same time. In general this is
>> done via immutable branch. But this requires caution while backporting.
>>
>
> Indeed - upstream and stable are missing patch 2, and that fixes the
> issue as well. Too bad that this series was split during merge.
>

But, in fact, this series was misordered then, suggesting that patch 1
was independent of patch 2, but it actually depended on patch 2 to avoid
even temporary regressions.

Jan
