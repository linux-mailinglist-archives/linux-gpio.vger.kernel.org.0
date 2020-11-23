Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E147F2C08AF
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Nov 2020 14:16:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388066AbgKWM5g (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Nov 2020 07:57:36 -0500
Received: from lizzard.sbs.de ([194.138.37.39]:34564 "EHLO lizzard.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388053AbgKWM51 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 23 Nov 2020 07:57:27 -0500
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
        by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 0ANCv91C001016
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 23 Nov 2020 13:57:09 +0100
Received: from [167.87.38.29] ([167.87.38.29])
        by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0ANCv78F003158;
        Mon, 23 Nov 2020 13:57:07 +0100
Subject: Re: [PATCH v5 0/7] gpio: exar: refactor the driver
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        David Laight <David.Laight@aculab.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20201116104242.19907-1-brgl@bgdev.pl>
 <CAMRc=Mdkr+65Nu7ddjtMHTbedpNf22w1bE97vipKSdXBYm8=fw@mail.gmail.com>
 <86bf5fda-eeb5-5cb2-901f-a887af7584f6@siemens.com>
 <CAMRc=MeayB1-hUiNUgKoG5v+CFt-Kxx88s+b-12iZDBfMjvttw@mail.gmail.com>
From:   Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <fe36f3f9-fc33-c39a-1b6e-962fe2567bb8@siemens.com>
Date:   Mon, 23 Nov 2020 13:57:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAMRc=MeayB1-hUiNUgKoG5v+CFt-Kxx88s+b-12iZDBfMjvttw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 23.11.20 13:12, Bartosz Golaszewski wrote:
> Thanks!On Mon, Nov 23, 2020 at 1:03 PM Jan Kiszka
> <jan.kiszka@siemens.com> wrote:
>>
>> On 23.11.20 12:38, Bartosz Golaszewski wrote:
>>> On Mon, Nov 16, 2020 at 11:42 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>>>>
>>>> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>>>>
>>>> I just wanted to convert the driver to using simpler IDA API but ended up
>>>> quickly converting it to using regmap. Unfortunately I don't have the HW
>>>> to test it so marking the patches that introduce functional change as RFT
>>>> and Cc'ing the original author.
>>>>
>>>
>>> Hi Jan!
>>>
>>> Could you give this last version a final spin before I merge it?
>>>
>>
>> [   14.250117] exar_serial 0000:02:00.0: enabling device (0000 -> 0002)
>> [   14.336622] 0000:02:00.0: ttyS2 at MMIO 0x90000000 (irq = 44, base_baud = 7812500) is a XR17V35X
>> [   14.391588] 0000:02:00.0: ttyS3 at MMIO 0x90000400 (irq = 44, base_baud = 7812500) is a XR17V35X
>> [   19.250510] gpio_exar: probe of gpio_exar.1.auto failed with error -22
>>
>> That's "new"...
>>
> 
> And if you change reg_bits from 11 to 16?
> 

16 works. Didn't we have that already?

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux
