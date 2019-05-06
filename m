Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 441D414813
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2019 12:03:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725883AbfEFKDu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 May 2019 06:03:50 -0400
Received: from anchovy2.45ru.net.au ([203.30.46.146]:46864 "EHLO
        anchovy2.45ru.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725861AbfEFKDu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 May 2019 06:03:50 -0400
X-Greylist: delayed 399 seconds by postgrey-1.27 at vger.kernel.org; Mon, 06 May 2019 06:03:49 EDT
Received: (qmail 16854 invoked by uid 5089); 6 May 2019 09:57:08 -0000
Received: by simscan 1.2.0 ppid: 16802, pid: 16803, t: 0.0545s
         scanners: regex: 1.2.0 attach: 1.2.0 clamav: 0.88.3/m:40/d:1950
Received: from unknown (HELO ?192.168.0.128?) (preid@electromag.com.au@203.59.235.95)
  by anchovy3.45ru.net.au with ESMTPA; 6 May 2019 09:57:08 -0000
Subject: Re: [PATCH V1 1/2] gpio: make it possible to set active-state on GPIO
 lines
To:     Harish Jenny K N <harish_kandiga@mentor.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
References: <1557122501-5183-1-git-send-email-harish_kandiga@mentor.com>
 <1557122501-5183-2-git-send-email-harish_kandiga@mentor.com>
 <CACRpkdZ84hkg_8J+OAYpZD0CFzENkUMeaSZoMyTK+hBdTCKGqA@mail.gmail.com>
 <ca559ed5-69ac-b578-2b82-fc0a4d532d3d@mentor.com>
 <CACRpkdYJ930fnO5a1HtUzRL5x1qA9cbgvEJb7mnwC=JLQOKXqQ@mail.gmail.com>
 <aaf22e96-a963-0dfc-a377-05383a219d0a@mentor.com>
From:   Phil Reid <preid@electromag.com.au>
Message-ID: <c1a3fd4e-5080-aef6-a731-49bdb020598f@electromag.com.au>
Date:   Mon, 6 May 2019 17:57:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <aaf22e96-a963-0dfc-a377-05383a219d0a@mentor.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 6/05/2019 17:15, Harish Jenny K N wrote:
> 
> On 06/05/19 2:02 PM, Linus Walleij wrote:
>> On Mon, May 6, 2019 at 9:57 AM Harish Jenny K N
>> <harish_kandiga@mentor.com> wrote:
>>
>>> Can the userspace consumers define the polarity?
>> Yes. From userspace after opening the GPIO character
>> device:
>>
>> #include <linux/gpio.h>
>>
>> struct gpiohandle_request req;
>>
>> req.flags = GPIOHANDLE_REQUEST_ACTIVE_LOW | GPIOHANDLE_REQUEST_OUTPUT;
>> req.lines = 1;
>> req.lineoffsets[0] = 0;
>>
>> ret = ioctl(fd, GPIO_GET_LINEHANDLE_IOCTL, &req);
>> (...)
>>
>> For more details on how to use the character device see tools/gpio/*
>> in the kernel tree.
>>
>>> Intention was to define polarity for lines which are not having consumers from kernelspace.
>> OK the above should work fine :)
>>
>>>> Even when using GPIOs from userspace (which I do not
>>>> recommend) the character device suppors a polarity flag
>>>> GPIOLINE_FLAG_ACTIVE_LOW so also userspace
>>>> consumers define polarity.
>>> yes. aware of the GPIOLINE_FLAG_ACTIVE_LOW flag to get the status.
>> Sorry, I was being unclear,
>> GPIOHANDLE_REQUEST_ACTIVE_LOW
>> is what you want to use.
> 
> Thanks. I will explore GPIOHANDLE_REQUEST_ACTIVE_LOW to see if we can use this.
> 
> Again I wanted to highlight that the intention of the patch was to make it generic and avoid changes in userspace for different hardware samples. (i.e  Some pins in hardware be configured as active low, this can vary between hardware samples. User application uses gpio-line-name property to map pins and port, this helps the application to handle pin change from hardware sample to sample. As of now there is no configuration available for user space applications for polarity.)
> 

This is pretty useful to be able to abstract polarity (and other properties from userspace).

I was thinking of adding a virtual gpio provider for one pin that just uses the dt consumer bindings to hide
polarities etc from userspace.

Or use the gpio led driver (or similar)

-- 
Regards
Phil Reid


