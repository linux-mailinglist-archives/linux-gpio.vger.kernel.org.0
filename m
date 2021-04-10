Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66CC335AD81
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Apr 2021 15:18:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234373AbhDJNS3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 10 Apr 2021 09:18:29 -0400
Received: from mail-out.m-online.net ([212.18.0.10]:52290 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234262AbhDJNS3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 10 Apr 2021 09:18:29 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4FHbCm3ymZz1s2K6;
        Sat, 10 Apr 2021 15:18:12 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4FHbCm2vWBz1qqwx;
        Sat, 10 Apr 2021 15:18:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id vHMAnVr03gwN; Sat, 10 Apr 2021 15:18:10 +0200 (CEST)
X-Auth-Info: RGcXB+iopJ+4TeVqcxAEHEGJxp5Cx/Cne2UyxCPzL3A=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Sat, 10 Apr 2021 15:18:10 +0200 (CEST)
Subject: Re: [PATCH v1 1/1] gpiolib: Read "gpio-line-names" from a firmware
 node
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Roman Guskov <rguskov@dh-electronics.com>
References: <20210305120240.42830-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=Mfye=O4mMiK01Q6Ok+ztSfMwMcrfaZSs+LhRxi=AM+C2w@mail.gmail.com>
 <YE8z+ohM9abBs9SD@smile.fi.intel.com> <YE9YGGB+k7CsCNDI@smile.fi.intel.com>
 <CAMRc=McLsamBwe8hSob11ustk2GUzOfYh7CcqNtxsM+6vgPENw@mail.gmail.com>
 <YE9whHhaa2XavKfj@smile.fi.intel.com>
 <CAMpxmJVUVhpcNOVQCB3p8tNpac5e5c7vRQS=-avA6Cuaag9eRw@mail.gmail.com>
 <CAHp75VfsGn=dTo+f2MtssqWpuj_Sm+LHtTaM=7oW9g8riz4xTg@mail.gmail.com>
 <5bf6771d-5783-0a40-5a72-7ddbb9c694aa@denx.de>
 <CAMRc=Mf+syGC92=UBXjX96wrx5oVUyo8NhOj-zGu9CAPsPTbMQ@mail.gmail.com>
From:   Marek Vasut <marex@denx.de>
Message-ID: <f9a9699b-138c-b927-3f4d-e6b759c74db0@denx.de>
Date:   Sat, 10 Apr 2021 15:18:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CAMRc=Mf+syGC92=UBXjX96wrx5oVUyo8NhOj-zGu9CAPsPTbMQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 4/10/21 11:06 AM, Bartosz Golaszewski wrote:
> On Sat, Apr 10, 2021 at 2:46 AM Marek Vasut <marex@denx.de> wrote:
>>
>> On 3/15/21 6:04 PM, Andy Shevchenko wrote:
>>> On Mon, Mar 15, 2021 at 6:49 PM Bartosz Golaszewski
>>> <bgolaszewski@baylibre.com> wrote:
>>>>
>>>> On Mon, Mar 15, 2021 at 3:34 PM Andy Shevchenko
>>>> <andriy.shevchenko@linux.intel.com> wrote:
>>>>>
>>>>> On Mon, Mar 15, 2021 at 03:04:37PM +0100, Bartosz Golaszewski wrote:
>>>>>> On Mon, Mar 15, 2021 at 1:50 PM Andy Shevchenko
>>>>>> <andriy.shevchenko@linux.intel.com> wrote:
>>>>>>>
>>>>>>> On Mon, Mar 15, 2021 at 12:16:26PM +0200, Andy Shevchenko wrote:
>>>>>>>> On Mon, Mar 15, 2021 at 10:01:47AM +0100, Bartosz Golaszewski wrote:
>>>>>>>>> On Fri, Mar 5, 2021 at 1:03 PM Andy Shevchenko
>>>>>>>>> <andriy.shevchenko@linux.intel.com> wrote:
>>>>>>>>
>>>>>>>>> Unfortunately while this may fix the particular use-case on STM32, it
>>>>>>>>> breaks all other users as the 'gpio-line-names' property doesn't live
>>>>>>>>> on dev_fwnode(&gdev->dev) but on dev_fwnode(chip->parent).
>>>>>>>>>
>>>>>>>>> How about we first look for this property on the latter and only if
>>>>>>>>> it's not present descend down to the former fwnode?
>>>>>>>>
>>>>>>>> Oops, I have tested on x86 and it worked the same way.
>>>>>>>>
>>>>>>>> Lemme check this, but I think the issue rather in ordering when we apply fwnode
>>>>>>>> to the newly created device and when we actually retrieve gpio-line-names
>>>>>>>> property.
>>>>>>>
>>>>>>> Hmm... I can't see how it's possible can be. Can you provide a platform name
>>>>>>> and pointers to the DTS that has been broken by the change?
>>>>>>>
>>>>>>
>>>>>> I noticed it with gpio-mockup (libgpiod tests failed on v5.12-rc3) and
>>>>>> the WiP gpio-sim - but it's the same on most DT platforms. The node
>>>>>> that contains the `gpio-line-names` is the one associated with the
>>>>>> platform device passed to the GPIO driver. The gpiolib then creates
>>>>>> another struct device that becomes the child of that node but it
>>>>>> doesn't copy the parent's properties to it (nor should it).
>>>>>>
>>>>>> Every driver that reads device properties does it from the parent
>>>>>> device, not the one in gdev - whether it uses of_, fwnode_ or generic
>>>>>> device_ properties.
>>>>>
>>>>> What you are telling contradicts with the idea of copying parent's fwnode
>>>>> (or OF node) in the current code.
>>>>>
>>>>
>>>> Ha! While the OF node of the parent device is indeed assigned to the
>>>> gdev's dev, the same isn't done in the core code for fwnodes and
>>>> simulated chips don't have an associated OF node, so this is the
>>>> culprit I suppose.
>>>
>>> Close, but not fully correct.
>>> First of all it depends on the OF / ACPI / platform enumeration.
>>> Second, we are talking about secondary fwnode in the case where it happens.
>>>
>>> I'm in the middle of debugging this, I'll come up with something soon I believe.
>>
>> Was there ever any follow up on this ?
>>
>> I would like to point out that on STM32MP1 in Linux 5.10.y, the
>> gpio-line-names are still broken, and a revert of "gpiolib: generalize
>> devprop_gpiochip_set_names() for device properties" is still necessary.
> 
> Yes, Andy has fixed that in commit b41ba2ec54a7 ("gpiolib: Read
> "gpio-line-names" from a firmware node") but for some reason this has
> never made its way into stable. I'll resend it.

Yes, that's the missing one, thanks. With that picked, the mp1 is fine.
