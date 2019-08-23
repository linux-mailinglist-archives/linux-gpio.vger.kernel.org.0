Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B442A9B692
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2019 21:00:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390920AbfHWTAm convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Fri, 23 Aug 2019 15:00:42 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:49867 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731649AbfHWTAm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Aug 2019 15:00:42 -0400
Received: from [192.168.1.162] ([37.4.249.106]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1M6EOc-1i7pRP1tPs-006gWW; Fri, 23 Aug 2019 21:00:31 +0200
Subject: Re: [PATCH] pinctrl: bcm2835: Pass irqchip when adding gpiochip
From:   Stefan Wahren <stefan.wahren@i2se.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Eric Anholt <eric@anholt.net>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thierry Reding <treding@nvidia.com>
References: <20190812062729.1892-1-linus.walleij@linaro.org>
 <CACRpkdbBaiVQ+BUNZEYNv6dGZjAbS=eA54dLTQ99Ngvbk7YQ9Q@mail.gmail.com>
 <a82230ae-4f3a-2600-0bea-85c432c56d05@i2se.com>
Openpgp: preference=signencrypt
Autocrypt: addr=stefan.wahren@i2se.com; keydata=
 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 AQ==
Message-ID: <b93be430-a20c-6709-dda4-b16d76858300@i2se.com>
Date:   Fri, 23 Aug 2019 21:00:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a82230ae-4f3a-2600-0bea-85c432c56d05@i2se.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Content-Language: en-US
X-Provags-ID: V03:K1:WWhgRjLxNAmfGssk/nkpLEKbR3NDlQsvThfqtgtYO+zJ2WMruiz
 7Ricp11aPF10DREpNkMHOqfJdFS/kv7iAdF8y5J024v3os+duwWjHd7IPRim/QsHHzhYpts
 Fo8zOWyACRXdAN/e52bKIr45qfGEVAs8NYh7eRJYWbmhJtNf6EcjRQqs/7Rc47vBZ5uegcF
 sStSthPGL3nUeHoN+rkaA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:gpNHR49e+po=:7fXdhND02sMrPfu246TWtV
 8vqjY4UAVYN/8ffJo/aKX5gQ5ibgfxdFfi5cXC7AOiUVcx2TWA+rMLt8qZxt1Cf9MlqjKmxsg
 qC5puQj5vWyi41tVeLf+6547a9P+o9zCRR4uCgMZiX+63vlgt7a6ZqBPkQOLMiCwyyPnX88Gw
 TyDBaX3l9D4uKF6n16s5quNU/4QN9MZxN0w3sNPZGspG3MLS3zqBqQBckqjoJ9BOFkn4sN17U
 Q8ZEWRhIjRQHaR4YKvNf898dCgJbtjLLU3RUCV1pzaTEkeD0e7IAbq2aZB3s1LeruCvcfWYrG
 oX2P9IPfmVejzPnqHVRXtBvpCgsaS1FAVWKuXgj7i/IZb+EbOcufhs758+BNQsntyXn5TC24x
 VQoqZ+xXEVFgTnGF+/NZ/VeNa3bxY2LTEPObI3CTwoZvLd4YtL/fyCORVUqLsAkXAIAsd6nZ6
 O+25JJ09bDze8eHhmAuo2MihsYiQIiupml890d05SqoGYpVsFqr9A14LNB67/Pok2AyOABHZC
 /S2hb+KzeHHTwKf1QlmwEupHCliPLgheIgnCJ56FdHwzsy97HjkzqPaJKQTjMPDhoNF//rH6p
 sEtxyoOlwe6b0mV8EZy9Rq8wi4awgiX54TvIOeHb/t9VzuO9taLTsGL6NImR4W4YxX4OAXR3G
 S5+IPL8RRMBbYZVuZqOCelndPuVUtxAeZT+O2jRvwJR35YDvbI5+mDn4rATXpq7P+U4q8eZkw
 BvDqB5C5fV5sHsK9oNXM9fVa75XdLT4nvzTj+0rRGBchxf0mySNeXdo+6Rc=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

Am 23.08.19 um 10:07 schrieb Stefan Wahren:
> Hi Linus,
>
> [removed Simon from CC to stop annoy him]
>
> On 23.08.19 09:46, Linus Walleij wrote:
>> On Mon, Aug 12, 2019 at 8:29 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>>
>>> We need to convert all old gpio irqchips to pass the irqchip
>>> setup along when adding the gpio_chip. For more info see
>>> drivers/gpio/TODO.
>>>
>>> For chained irqchips this is a pretty straight-forward
>>> conversion. The BCM2835 has multiple parents so let's
>>> exploit the new facility in the GPIO_IRQCHIP to actually
>>> deal with multiple parents.
>>>
>>> Cc: Simon Arlott <simon@arlott.org>
please remove Simon's email address before applying
>>> Cc: Eric Anholt <eric@anholt.net>
>>> Cc: Stefan Wahren <stefan.wahren@i2se.com>
and use my new address in the future.
>>> Cc: Thierry Reding <treding@nvidia.com>
>>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>> This patch is a bit scary because I haven't tried converting multiple
>> parents before. Any chance one of you RPi people could give it
>> a test run, so you don't have to experience testing it in linux-next?
> it's on my TODO list, but i didn't had the time to test it yet.
>
> Can you give me some test ideas?

I configured a GPIO as input with pull-up, setup the interrupt via sysfs
and wired the GPIO to GND.
After that i checked that /proc/interrupts for the pin has increased.
Everything worked as expected.

Is it sufficient?

Tested-by: Stefan Wahren <stefan.wahren@i2se.com>

>
>> Yours,
>> Linus Walleij

