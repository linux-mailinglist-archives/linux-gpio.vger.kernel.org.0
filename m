Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF4C731892D
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Feb 2021 12:15:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230452AbhBKLNO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Feb 2021 06:13:14 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:34735 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230177AbhBKLLH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Feb 2021 06:11:07 -0500
Received: from [192.168.1.155] ([95.114.27.115]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MD9jV-1l17QC0RBB-0099Pb; Thu, 11 Feb 2021 12:08:13 +0100
Subject: Re: RFC: oftree based setup of composite board devices
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>
References: <20210208222203.22335-1-info@metux.net>
 <CAHp75VdNTenoE0AOmGfndqQ7SrxbuK+SvfFYn3W2GmqhkCSByQ@mail.gmail.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <1b92deea-cf6d-7eca-197f-b12456279890@metux.net>
Date:   Thu, 11 Feb 2021 12:08:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VdNTenoE0AOmGfndqQ7SrxbuK+SvfFYn3W2GmqhkCSByQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:b9A9dq5V8fihDmjvZhBFHOoi4E8lefbHXnatkfNzvB5AT4g9od6
 t+O8YLrEAibQbKkHbIWQXLSB+cyswM9brfHoEbIa8gA9ix9PC8xOGXoGjbTLuHP9K6NkXuH
 JduC80jExRkTgF3GsUf6CfcFgBdgbXdvZTNw8Iefs0ij6me4xTKPjJRTgoPMwyKE8/RzJZT
 tOfttwIXMZOZm44b0lpMw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:1F6Ka2HvoSE=:2INNsaW/QpqgA4rGTJpZIB
 FlgH6N6nKrfTv/kbIpcUvc5piVs0tXds527kDpVoVMFU9xW5m2C26YInv5iW8H29JGkafAo80
 0Q2892XGIBMlJMxOIywuxKeheMJMIlCtm8qXbWbG1s1kZWET0q3uDO1DFBNmAylDV3pLHYh1b
 j3a7MPkKOBYLVDTdQKb7kLDVccdAcCiCEygYylNhstHff5vS/MyKOr9hY8T5qfc05cUJAA7So
 igglI7EVDC8s1wXjKAINZpOoQEnmN3M7TlVUFdFtArR/GR9IxmD/Dg+7qPzQqfxaWU1nXZRWE
 uybnlHnFPxCbnKVNRvI1tETN3SMfqGOpIZyGJa9xbVsyt5yfacD2r35sVGP87HHyIsjcDWDot
 +9LOMm1PeFwt60uQ2vO9MkPJTyl/WvBHkWrLgox1hSWDeMDkqWnj9ZdQZfhD3iLCA28ZYQij6
 qOiFrb0bCVOba7l1DSCOTr7TcznwaK/KJU1eAKdIno8lLnf8gRbx
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 10.02.21 11:30, Andy Shevchenko wrote:

Hi,

>> Use cases are boards with non-oftree firmware (ACPI, etc) where certain
>> platform devices can't be directly enumerated via firmware. Traditionally
>> we had to write board specific drivers that check for board identification
>> (DMI strings, etc), then initialize the actual devices and their links
>> (eg. gpio<->leds/buttons, ...). Often this can be expressed just by DT.
> 
> In ACPI we support DT compatible strings, and we support overlays for
> a long time. Would it work for you?

please tell me more, how ACPI and DT can already work together ?

You already know my apu board driver - that's my first example usecase.

There're few things I don't know how to solve w/ overlays:

* match rules shall be inside the DTS
* future match rules shall also check for bios versions etc
* adding new boards shall be possible by just adding another DTS to
   the tree (not a whole module)
* supporting several board variants (w/ small differences) by one DTS
* sometimes existing devices (eg. enumerated by acpi) need to be kicked
   out (buggy firmware, ...)
* can't rely on any special userland tweaks

>> The approach can be easily be extended to other kinds of composite devices,
>> eg. PCI cards or USB dongles.
> 
> What do you mean? PCI and USB are self-enumerated. What's wrong with them?

In general yes, but of course you need drivers for them. Sometimes those
devices are composites of other devices, wired up in some special way.
Traditionally, we'd need to write a special driver that just don't do
much more than instantiating other drivers.

Those things could be expressed via DTS, so we don't need to write
individual drivers anymore.

>> Yet some drawbacks of the current implementation:
>>
>>   * individual FDT's can't be modularized yet (IMHO, we don't have DMI-based
>>     modprobing anyways)
> 
> What?! https://lwn.net/Articles/233385/
> `git grep -n 'MODULE_DEVICE_TABLE(dmi'`

Shame on me, I really must have missed that all the time, thanks for the
hint.

But that has some drawbacks in my case:

* need to split the information into several places (instead of having
   all in one DTS)
* need to have one separate module board, or merge the dmi tables.

My goal is having everything that describes a board into one DTS 
(source) file.


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
