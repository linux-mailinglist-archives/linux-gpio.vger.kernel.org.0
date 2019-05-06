Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3C6B145A4
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2019 09:57:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725855AbfEFH5h (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 May 2019 03:57:37 -0400
Received: from relay1.mentorg.com ([192.94.38.131]:39541 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbfEFH5h (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 May 2019 03:57:37 -0400
Received: from nat-ies.mentorg.com ([192.94.31.2] helo=svr-ies-mbx-01.mgc.mentorg.com)
        by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
        id 1hNYVC-0005y2-8J from Harish_Kandiga@mentor.com ; Mon, 06 May 2019 00:57:34 -0700
Received: from [10.0.4.15] (137.202.0.90) by svr-ies-mbx-01.mgc.mentorg.com
 (139.181.222.1) with Microsoft SMTP Server (TLS) id 15.0.1320.4; Mon, 6 May
 2019 08:57:29 +0100
Subject: Re: [PATCH V1 1/2] gpio: make it possible to set active-state on GPIO
 lines
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
References: <1557122501-5183-1-git-send-email-harish_kandiga@mentor.com>
 <1557122501-5183-2-git-send-email-harish_kandiga@mentor.com>
 <CACRpkdZ84hkg_8J+OAYpZD0CFzENkUMeaSZoMyTK+hBdTCKGqA@mail.gmail.com>
From:   Harish Jenny K N <harish_kandiga@mentor.com>
Message-ID: <ca559ed5-69ac-b578-2b82-fc0a4d532d3d@mentor.com>
Date:   Mon, 6 May 2019 13:27:26 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CACRpkdZ84hkg_8J+OAYpZD0CFzENkUMeaSZoMyTK+hBdTCKGqA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-06.mgc.mentorg.com (139.181.222.6) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 06/05/19 12:27 PM, Linus Walleij wrote:
> Hi Harish,
>
> thank you for your patch!
>
> On Mon, May 6, 2019 at 8:02 AM Harish Jenny K N
> <harish_kandiga@mentor.com> wrote:
>
>> Device could decide to have different convention about what "active" means.
>> ( i.e Active-High (output signal "1" means "active", the default)
>> and Active-Low (output signal "0" means "active")).
>> Therefore it is possible to define a GPIO as being either active-high or
>> active-low .
>>
>> Make it possible to add the information of active state of gpio pin
>> as property into device tree configuration using a
>> "active-state" property u8 array.
>>
>> This is useful for user space applications to identify
>> active state of pins.
>>
>> This commit updates gpio_desc flag for active-state.
>>
>> Note: The active-state attribute is completely optional.
>>
>> example device tree line
>> "active-state = /bits/ 8 <0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0>;"
>>
>> Signed-off-by: Harish Jenny K N <harish_kandiga@mentor.com>
> I see from the code that the intention of the code is to
> encode on the producer side (the GPIO chip) whether to handle
> a certain line with active high or active low semantics.
> In effect setting FLAG_ACTIVE_LOW on some descriptors.
>
> The usual convention is to refer to this as "polarity" so
> you would probably want to name it "polarity" rather than
> "active-state".

I agree. Thanks.

>
> However:
>
> This is problematic because the convention in the device
> tree is to encode this on the consumer side and not on
> the producer side, so e.g. a device node using a GPIO
> line will use something like this:
>
>                 button@1 {
>                         debounce-interval = <50>;
>                         wakeup-source;
>                         linux,code = <2>;
>                         label = "userpb";
>                         gpios = <&gpio1 0 GPIO_ACTIVE_LOW>;
>                 };
>
> If the polarity differs between the consumer and the
> producer, who is going to win? Defining polarity on both
> sides is going to lead to ambiguities.
Can the userspace consumers define the polarity?

Intention was to define polarity for lines which are not having consumers from kernelspace. But yes, there is a possibility of ambiguity if both consumer and producer start defining polarity. But again both consumer and producer should define the same polarity in device tree.
>
> Even when using GPIOs from userspace (which I do not
> recommend) the character device suppors a polarity flag
> GPIOLINE_FLAG_ACTIVE_LOW so also userspace
> consumers define polarity.
yes. aware of the GPIOLINE_FLAG_ACTIVE_LOW flag to get the status.
> What kind of consumers do you have in mind for this
> feature?
Intention is to make it generic. Some pins in hardware be configured as active low, this can vary between hardware samples. User application uses gpio-line-name property to map pins and port, this helps the application to handle pin change from hardware sample to sample. As of now there is no configuration available for user space applications for polarity.


Thanks,

Harish


