Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AC932AAA5D
	for <lists+linux-gpio@lfdr.de>; Sun,  8 Nov 2020 10:31:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728204AbgKHJbk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 8 Nov 2020 04:31:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34314 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728191AbgKHJbk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 8 Nov 2020 04:31:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604827898;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zpmmVtJiLF/7ZB4tkJLHOE9quYGR+xzRArppdDKuwXk=;
        b=dVCgY9pY74aI17bwTGBiLs5jLrNodpBp1iKxV98olkRLV+ra7jaPbCmKedbgjTMzHsjBLR
        8OFo7g0dd8dEXe65XvOcfv092pa2gdIZFOFjU7zLPbuYFESlbElCmi7mE/EPoeTgO786wo
        rPf6F2JcaR1hPiocvAgOwxfYYe8M0jY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-sCaUmwcvPoOf8K9MubHCrw-1; Sun, 08 Nov 2020 04:31:35 -0500
X-MC-Unique: sCaUmwcvPoOf8K9MubHCrw-1
Received: by mail-ej1-f70.google.com with SMTP id a9so2470515ejy.22
        for <linux-gpio@vger.kernel.org>; Sun, 08 Nov 2020 01:31:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zpmmVtJiLF/7ZB4tkJLHOE9quYGR+xzRArppdDKuwXk=;
        b=sw9YGAqwtIp//WMIC4jT5VQWW0j23uv2JtCp9enTq27K2LagarR4gLTQ/gWjeqoBtY
         nQNdqI6OdpBf9+3U7NQFu11/UbyP/dS7ntVPAzRA8vmis6sP9hlvRjpxJ5EaJ5jzJ/0P
         vwg+0Aum4uFlE4WSdhOSBNeX3ehrOMuw+xTtksgimdpfq34yhkrJho9LQmGMExp6X1Z6
         dwU62UfIJh6sJu9+7Nzwemw2QgbtRnnRSiYl9FWCwjWWepnSVX1wZK+/ckR5mZhRT6LR
         m+pNrDCSqGJt7MGsj9zFIXiUQQQRsdnj0uzanXuKkaK0CNBSYi5u6l29AUO7zcANOur8
         l22A==
X-Gm-Message-State: AOAM5329KBA+NO2ZLEhZ0kzQf6tAcj73ZAttNlCrv/nGzeWNYRJznKML
        IeKDL3xV2tNJ+snprdra3AUa0D974OMYeOO2VxhcePvfCntyKLPizfQRlbMJhia4z4T+eXTttHD
        Kb1OausG/Cn864D4tEvcUag==
X-Received: by 2002:a17:906:1804:: with SMTP id v4mr10200103eje.201.1604827893799;
        Sun, 08 Nov 2020 01:31:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxO1i/hwQkjFZXZKNi5ug6MC9BItxzaySWhlKElgxfITIAdJGx/xJcYCj5P8tHE4ob8zk036A==
X-Received: by 2002:a17:906:1804:: with SMTP id v4mr10200095eje.201.1604827893624;
        Sun, 08 Nov 2020 01:31:33 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id hj13sm5588094ejb.125.2020.11.08.01.31.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2020 01:31:33 -0800 (PST)
Subject: Re: [PATCH v4 3/9] gpiolib: acpi: Take into account debounce settings
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Coiby Xu <coiby.xu@gmail.com>
References: <20201106192304.49179-1-andriy.shevchenko@linux.intel.com>
 <20201106192304.49179-4-andriy.shevchenko@linux.intel.com>
 <0756cd6c-c0a7-17e8-2e32-de3e6db6a69b@redhat.com>
 <CAHp75Vf8MkaNGmH1-FWxR66mB6pAWoV=Xw3sAi2Riw1uLe5YNA@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <35581c32-8022-87e6-259d-84ea6aaebbae@redhat.com>
Date:   Sun, 8 Nov 2020 10:31:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CAHp75Vf8MkaNGmH1-FWxR66mB6pAWoV=Xw3sAi2Riw1uLe5YNA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 11/7/20 4:26 PM, Andy Shevchenko wrote:
> On Sat, Nov 7, 2020 at 4:49 PM Hans de Goede <hdegoede@redhat.com> wrote:
>> On 11/6/20 8:22 PM, Andy Shevchenko wrote:
> 
> ...
> 
>> I added an older version of this (which only modified acpi_dev_gpio_irq_get())
>> for testing and when booting a kernel with that version applied to it,
>> on a Cherry Trail device I noticed that a whole bunch of devices where no
>> longer seen by the kernel because of acpi_dev_gpio_irq_get() returning
>> errors now (-ENOTSUPP).
>>
>> Quoting from the gpiod_set_debounce docs:
>>
>> /**
>>  * gpiod_set_debounce - sets @debounce time for a GPIO
>>  * @desc: descriptor of the GPIO for which to set debounce time
>>  * @debounce: debounce time in microseconds
>>  *
>>  * Returns:
>>  * 0 on success, %-ENOTSUPP if the controller doesn't support setting the
>>  * debounce time.
>>  */
>>
>> This is expected on GPIO chips where setting the debounce time
>> is not supported. So the error handling should be modified to
>> ignore -ENOTSUPP errors here.
>>
>> This certainly MUST NOT be merged as is because it breaks a lot
>> of things as is.
> 
> Thank you very much for the testing! I remember that I fixed debounce
> for BayTrail, but it seems I have yet to fix Cherry Trail pin control
> as a prerequisite to this patch.
> 
> And like I said this series is definitely not for backporting.

Independent of fixing the CherryTrail pinctrl driver to support this,
I strongly believe that -ENOTSUPP should be ignored (treated as success)
by this patch. Remember ACPI is not only used on x86 but also on ARM
now a days. We simply cannot guarantee that all pinctrls will support
(let alone implement) debounce settings. E.g. I'm pretty sure that
the pinctrl on the popular Allwinner A64 does not support debouncing
and there are builts using a combination of uboot + EDK2 to boot!

The documentation for gpiod_set_debounce even explicitly mentioned that
-ENOTSUPP is an error which one may expect (and thus treat specially).

The same goes for the bias stuff too.

Regards,

Hans



