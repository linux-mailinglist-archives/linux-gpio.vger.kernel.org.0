Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6C4D7B0DB
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jul 2019 19:50:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726713AbfG3RuR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jul 2019 13:50:17 -0400
Received: from mga12.intel.com ([192.55.52.136]:44536 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725935AbfG3RuR (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 30 Jul 2019 13:50:17 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Jul 2019 10:50:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,327,1559545200"; 
   d="scan'208";a="162674040"
Received: from rfried-mobl.ger.corp.intel.com (HELO [10.255.195.53]) ([10.255.195.53])
  by orsmga007.jf.intel.com with ESMTP; 30 Jul 2019 10:50:14 -0700
Subject: Re: gpiolib and pinmux interaction
From:   "Fried, Ramon" <ramon.fried@linux.intel.com>
To:     Stefan Wahren <stefan.wahren@i2se.com>,
        Linus Walleij <linus.walleij@linaro.org>, brgl@bgdev.pl
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
References: <d031ce76-252a-9388-17fa-8a52f81f22f1@linux.intel.com>
 <CACRpkdZUA33i+OVMH2KeKaBF368oGi9nW_GLawr+x9t=Gc67Ug@mail.gmail.com>
 <bab378aa-8fb2-849c-9b73-3ed55ef9643e@linux.intel.com>
 <2a08855b-9df2-e536-60c3-07770a9162b1@i2se.com>
 <2218697f-8cb2-e20c-b8c9-c0386257aebf@linux.intel.com>
 <1ccdacac-c39b-cc99-3426-7682dc2baada@linux.intel.com>
Message-ID: <2790b597-25c9-82a5-9455-dbc7abbb5178@linux.intel.com>
Date:   Tue, 30 Jul 2019 20:50:13 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1ccdacac-c39b-cc99-3426-7682dc2baada@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 7/30/2019 19:54, Fried, Ramon wrote:
>
> On 3/18/2019 13:41, Ramon Fried wrote:
>> On 3/18/19 11:21 AM, Stefan Wahren wrote:
>>> Hi Ramon,
>>>
>>> Am 17.03.19 um 10:09 schrieb Ramon Fried:
>>>> Hi Linus, Stefan,
>>>>
>>>> Great patch, If you need help testing it on other HW tell me.
>>> yes, please. I didn't get what kind of hardware you are using.
>> Hi.
>>
>> custom mips based SOC with sta2x11 gpio driver & proprietary pin 
>> muxing ip allowing every pin to be muxed as gpio.
>>
>>> Regards
>>> Stefan
>
> Hey Linus, Stefan,
>
> I'm not sure where are we standing with the patch.
> I didn't find it merged, so I just took it and tested it. (It took my 
> a while, hehe)
> It's working, but not as I would expect, instead of marking the gpio 
> as used,
> it adds [kernel] flag. Which is OK, but I think it's clearer to also 
> make the "used" column. (see below)
>
> What do you think ?
>
> Thanks,
>
> Ramon.
>
> See below:
>
> # gpioinfo
> gpiochip1 - 23 lines:
>         line   0:      unnamed       unused   input  active-high
>         line   1:      unnamed       unused   input  active-high
>         line   2:      unnamed       unused   input  active-high
>         line   3:      unnamed       unused   input  active-high
>         line   4:      unnamed       unused   input  active-high
>         line   5:      unnamed       unused   input  active-high
>         line   6:      unnamed       unused   input  active-high
>         line   7:      unnamed       unused   input  active-high
>         line   8:      unnamed       unused   input  active-high [kernel]
>         line   9:      unnamed       unused   input  active-high [kernel]
>         line  10:      unnamed       unused   input  active-high [kernel]
>         line  11:      unnamed       unused   input  active-high [kernel]
>         line  12:      unnamed       unused   input  active-high
>         line  13:      unnamed       unused   input  active-high
>
Adding Bartosz.
Turns out I was running and old version of libgpiod, in current version 
it's printed "[used] instead of [kernel].
The patch from Stefan is perfectly fine from my standpoint, but the 
output of gpioinfo can be improved,

I'll post a patch to LIBGPIOD.

Thanks.
Ramon


