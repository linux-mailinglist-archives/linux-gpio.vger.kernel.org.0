Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3110715DD0
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2019 09:04:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726437AbfEGHE1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 May 2019 03:04:27 -0400
Received: from relay1.mentorg.com ([192.94.38.131]:38757 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726253AbfEGHE0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 May 2019 03:04:26 -0400
Received: from nat-ies.mentorg.com ([192.94.31.2] helo=svr-ies-mbx-01.mgc.mentorg.com)
        by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
        id 1hNu9D-0007DO-OO from Harish_Kandiga@mentor.com ; Tue, 07 May 2019 00:04:19 -0700
Received: from [10.0.4.15] (137.202.0.90) by svr-ies-mbx-01.mgc.mentorg.com
 (139.181.222.1) with Microsoft SMTP Server (TLS) id 15.0.1320.4; Tue, 7 May
 2019 08:04:15 +0100
Subject: Re: [PATCH V1 1/2] gpio: make it possible to set active-state on GPIO
 lines
To:     Phil Reid <preid@electromag.com.au>,
        Linus Walleij <linus.walleij@linaro.org>
CC:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
References: <1557122501-5183-1-git-send-email-harish_kandiga@mentor.com>
 <1557122501-5183-2-git-send-email-harish_kandiga@mentor.com>
 <CACRpkdZ84hkg_8J+OAYpZD0CFzENkUMeaSZoMyTK+hBdTCKGqA@mail.gmail.com>
 <ca559ed5-69ac-b578-2b82-fc0a4d532d3d@mentor.com>
 <CACRpkdYJ930fnO5a1HtUzRL5x1qA9cbgvEJb7mnwC=JLQOKXqQ@mail.gmail.com>
 <aaf22e96-a963-0dfc-a377-05383a219d0a@mentor.com>
 <c1a3fd4e-5080-aef6-a731-49bdb020598f@electromag.com.au>
From:   Harish Jenny K N <harish_kandiga@mentor.com>
Message-ID: <ea2ef903-b61d-fb7d-f8a7-13528c0d241f@mentor.com>
Date:   Tue, 7 May 2019 12:34:04 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <c1a3fd4e-5080-aef6-a731-49bdb020598f@electromag.com.au>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-04.mgc.mentorg.com (139.181.222.4) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 06/05/19 3:27 PM, Phil Reid wrote:
> On 6/05/2019 17:15, Harish Jenny K N wrote:
>>
>> On 06/05/19 2:02 PM, Linus Walleij wrote:
>>> On Mon, May 6, 2019 at 9:57 AM Harish Jenny K N
>>> <harish_kandiga@mentor.com> wrote:
>>>
>>>> Can the userspace consumers define the polarity?
>>> Yes. From userspace after opening the GPIO character
>>> device:
>>>
>>> #include <linux/gpio.h>
>>>
>>> struct gpiohandle_request req;
>>>
>>> req.flags = GPIOHANDLE_REQUEST_ACTIVE_LOW | GPIOHANDLE_REQUEST_OUTPUT;
>>> req.lines = 1;
>>> req.lineoffsets[0] = 0;
>>>
>>> ret = ioctl(fd, GPIO_GET_LINEHANDLE_IOCTL, &req);
>>> (...)
>>>
>>> For more details on how to use the character device see tools/gpio/*
>>> in the kernel tree.
>>>
>>>> Intention was to define polarity for lines which are not having consumers from kernelspace.
>>> OK the above should work fine :)
>>>
>>>>> Even when using GPIOs from userspace (which I do not
>>>>> recommend) the character device suppors a polarity flag
>>>>> GPIOLINE_FLAG_ACTIVE_LOW so also userspace
>>>>> consumers define polarity.
>>>> yes. aware of the GPIOLINE_FLAG_ACTIVE_LOW flag to get the status.
>>> Sorry, I was being unclear,
>>> GPIOHANDLE_REQUEST_ACTIVE_LOW
>>> is what you want to use.
>>
>> Thanks. I will explore GPIOHANDLE_REQUEST_ACTIVE_LOW to see if we can use this.
>>
>> Again I wanted to highlight that the intention of the patch was to make it generic and avoid changes in userspace for different hardware samples. (i.e  Some pins in hardware be configured as active low, this can vary between hardware samples. User application uses gpio-line-name property to map pins and port, this helps the application to handle pin change from hardware sample to sample. As of now there is no configuration available for user space applications for polarity.)
>>
>
> This is pretty useful to be able to abstract polarity (and other properties from userspace).
>
> I was thinking of adding a virtual gpio provider for one pin that just uses the dt consumer bindings to hide
> polarities etc from userspace.


Thanks for the input.

Can the maintainers please confirm how does they want to have this implemented?

i.e How to define the polarity for generic GPIOs exported to user space in the device tree, to be able to make user space GPIO usage independent of hardware revisions?


Thanks,

Harish Jenny K N


