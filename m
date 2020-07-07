Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9603D21699B
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2020 11:57:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726951AbgGGJ5B (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jul 2020 05:57:01 -0400
Received: from smtpcmd14161.aruba.it ([62.149.156.161]:55315 "EHLO
        smtpcmd14161.aruba.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725941AbgGGJ5B (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jul 2020 05:57:01 -0400
Received: from [192.168.1.129] ([93.146.66.165])
        by smtpcmd14.ad.aruba.it with bizsmtp
        id 09wx2300z3Zw7e5019wyCE; Tue, 07 Jul 2020 11:56:59 +0200
Subject: Re: [RFC] GPIO User I/O
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
References: <01afcac0-bd34-3fd0-b991-a8b40d4b4561@enneenne.com>
 <CACRpkdbX9T9EuN-nxkMPC=sN74PEdoLuWurNLdGCzZJwwFrdpQ@mail.gmail.com>
 <1c4f1a83-835a-9317-3647-b55f6f39c0ba@enneenne.com>
 <CACRpkdZPjJSryJc+RtYjRN=X7xKMcao5pYek1fUM2+sE9xgdFQ@mail.gmail.com>
 <CAMuHMdUtguuu4FWU4nRS=pBUyEwKM1JZ8DYPdCQHXBYN0i_Frg@mail.gmail.com>
 <87efe96c-3679-14d5-4d79-569b6c047b00@enneenne.com>
 <CAMuHMdUght0hkJT1N8ub5xR5GB+U18MAhAg+zDmAAuxoRSRaYg@mail.gmail.com>
From:   Rodolfo Giometti <giometti@enneenne.com>
Message-ID: <d30e64c9-ad7f-7cd5-51a4-3f37d6f1e3d8@enneenne.com>
Date:   Tue, 7 Jul 2020 11:56:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUght0hkJT1N8ub5xR5GB+U18MAhAg+zDmAAuxoRSRaYg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aruba.it; s=a1;
        t=1594115819; bh=iMxzmbAXPORie8pkdG5YzxTMnrq/UBvG98R/J9x/Zgo=;
        h=Subject:To:From:Date:MIME-Version:Content-Type;
        b=PXysaG3XMcA3HoMihAJhEede4iaDg8Oa1xrq/8tpYb9MhHbvO47WVbkI5coxEiX+8
         KyYKeMkVLIARfKCn9bAP/PfKJe1UjiIHT88BmUdN3Zrkh4lxIVLZrCm0LL+0qH99+f
         PuKfdBMt1700JYiBPabJZvJGyVtQzIT6+dOQ8ueWxxRwxaCB2NnmnRmCxJCDSx/d8F
         bgAWCrXoyOZJkX5Twi6UD+IRRZXsmpl+rRl77Tyl6J9aqyFJEoIgGvL2LzgxDVN/Qh
         2+ZWMDGTHOncdUWuzMsQUFLGzr//oMlfKO8vazmQCn0MQyM5/DwYGldcLOdTN3MptR
         fArYo77cL1HPg==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 07/07/2020 09:41, Geert Uytterhoeven wrote:
> Hi Rodolfo,
> 
> CC devicetree
> 
> On Tue, Jul 7, 2020 at 9:17 AM Rodolfo Giometti <giometti@enneenne.com> wrote:
>> On 06/07/2020 23:00, Geert Uytterhoeven wrote:
>>> On Mon, Jul 6, 2020 at 10:38 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>>>> On Mon, Jul 6, 2020 at 5:33 PM Rodolfo Giometti <giometti@enneenne.com> wrote:
>>>>>> With Geert's GPIO aggregator userspace and device tree can conjure
>>>>>> special per-usecase gpio chips as pointed out by Drew: this is
>>>>>> very useful when you want some kernel-managed yet
>>>>>> usecase-specific GPIO lines in a special "container" chip.
>>>>>> To me this is the best of two worlds. (Kernelspace and userspace.)
>>>>>
>>>>> Maybe this is the "best of two worlds" as you say but the problem is that board
>>>>> manufactures need a way to well-define how a GPIO line must be used for within
>>>>> the device-tree and without the need of patches! In this point of view neither
>>>>> the "driver_override" way nor adding a compatible value to
>>>>> gpio_aggregator_dt_ids[] can help (this last solution requires a patch for each
>>>>> board!). That's why at the moment they prefer not specify these GPIO lines at
>>>>> all or (improperly) use the gpio-leds and gpio-uinput interfaces to keep it
>>>>> simple...
>>>>
>>>> I think the idea is to add a very generic DT compatible to the
>>>> gpio_aggregator_dt_ids[]. That way, any DT can use the aggregator
>>>> to create a new chip with named lines etc.
>>>>
>>>> But Geert can speak of that.
>>>
>>> The idea is to describe the real device in DT, and add it's compatible value
>>> to gpio_aggregator_dt_ids[], or enable support for it dynamically using
>>> driver_override.
>>> The former indeed requires modifying the driver.
>>
>> I see.
>>
>>> Note that if you ever want to write a pure kernelspace driver, you do need
>>> a proper compatible value anyway.
>>
>> OK, but for our purposes we need just one compatible value.
>>
>>> I do agree that it's annoying to have "gpio-leds", but not "gpio-motors"
>>> or "gpio-relays".  However, you can always propose bindings for the
>>> latter, and, when they have been accepted, add those compatible
>>> values to upstream gpio_aggregator_dt_ids[].
>>
>> Having gpio-uio with proper names within it as motor0, motor1, relay0, etc. as
>> in my solution would be suffice. However, after these discussions, are there any
>> chances my patch (with needed modifications and documentation) may be accepted? :)
>>
>> Thanks for your time and answers.
> 
> Let's ask the DT people...

I think I need an OK from GPIO SUBSYSTEM's maintainers first...

Ciao,

Rodolfo

-- 
GNU/Linux Solutions                  e-mail: giometti@enneenne.com
Linux Device Driver                          giometti@linux.it
Embedded Systems                     phone:  +39 349 2432127
UNIX programming                     skype:  rodolfo.giometti
