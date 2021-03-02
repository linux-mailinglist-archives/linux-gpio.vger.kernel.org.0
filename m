Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B248732AD41
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 03:16:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1443721AbhCBV3f (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Mar 2021 16:29:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350401AbhCBTxf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Mar 2021 14:53:35 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DD95C061756;
        Tue,  2 Mar 2021 11:52:27 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id m1so3949833wml.2;
        Tue, 02 Mar 2021 11:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5cti0gPMZZjZb9qo2Ie40MXe+6IQtAetbpVmB+JNm60=;
        b=A9K0Fux6TCM6Vt1tzBnJNzknnSUtacjTcRDQyzocqq5XUsoaC65xxFoUTgnLTyoPzw
         U8dSvwtof595mhjy4F+94fqrxI3a+Y8r5vjq9t+XpMlyN3cqMHQ2oO/jQSYTK3KOafSI
         ayY5eG6e9mgCUjbFcNyFcaXqj9wYjC31JTJ+VP896OCcZAtuqrDuVGnQIGwvRP3FVaq0
         /0mtDLv1VrEDNBHz3UHFTomKbxvB7Hu5/GGjt6t0JU09IEKXOCQ/Gglg2iXxddFeGef1
         uj3/J9M88gK2N7fDXG94AG6VBq0++MiQ0I9l/L87UuXXNdz+E5i3WMKvOztj3dBmDwts
         Jt8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5cti0gPMZZjZb9qo2Ie40MXe+6IQtAetbpVmB+JNm60=;
        b=ETj6x8Rf6tWVnxiCAhfV9mub5TyZ1D0xQO1Nfn5XwtIrjCH0+SluHbnZb0HX2TtkrV
         eq5YGsqGlpT8ii3bBJ1ne83Nne7EwUYO44e8+1bsvW6B/vWJ0ilMxsZM9YCtRIVGZMo+
         eS5Z0xyXfsWTbd9m4UmkDLgolsjiJiS48AK7+2esJZXlUaH8XYAVznS5FXbaNKZN4v6J
         p9L2Sl0ECfdAG4BcJLGcaMAemOOP2G+lb3LgHVtDZGZThzn8tD0TiqXdj+TFRRN80+Dx
         BrZ9CnUrNy64h6tEttSfoNjY+i7u+8jeRdonaRJoDLbUDrvGomT32weTn0LJHlsvrd0m
         Q0yg==
X-Gm-Message-State: AOAM532p8igIFo4wzHAEWk6lf8Ku1oC6x0CryT4I49VW1kxOqWiGhA5p
        LyJfLnFFSadv9++PV6GXX8KsAcyyVJFvIw==
X-Google-Smtp-Source: ABdhPJyHQ3S26awCN8qQSy5RBww2oQJjV7sb4mXB+Ln6fD7VUzj3UGTTyF18cTxqDL1i7oNhGjnV1g==
X-Received: by 2002:a7b:c1c4:: with SMTP id a4mr5684506wmj.122.1614714745830;
        Tue, 02 Mar 2021 11:52:25 -0800 (PST)
Received: from [192.168.1.10] (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id s23sm3500498wmc.29.2021.03.02.11.52.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Mar 2021 11:52:25 -0800 (PST)
Subject: Re: [PATCH] gpio: regmap: move struct gpio_regmap definition
To:     Michael Walle <michael@walle.cc>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210302180601.12082-1-noltari@gmail.com>
 <b4a344af55ad238a554c56e31b1b87ed@walle.cc>
 <4af4b519-84eb-3cb4-bb0e-9c5ac6204348@gmail.com>
 <8f703cfde0245a280340f2c9c8a5359a@walle.cc>
From:   =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>
Message-ID: <835b06b1-7a63-b6ff-9004-03f504f8fb63@gmail.com>
Date:   Tue, 2 Mar 2021 20:52:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <8f703cfde0245a280340f2c9c8a5359a@walle.cc>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: es-ES
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Michael,

El 02/03/2021 a las 20:24, Michael Walle escribió:
> Hi,
> 
> Am 2021-03-02 19:14, schrieb Álvaro Fernández Rojas:
>> El 02/03/2021 a las 19:10, Michael Walle escribió:
>>> Am 2021-03-02 19:06, schrieb Álvaro Fernández Rojas:
>>>> struct gpio_regmap should be declared in gpio/regmap.h.
>>>> This way other drivers can access the structure data when 
>>>> registering a gpio
>>>> regmap controller.
>>>
>>> The intention was really to keep this private to the gpio-regmap
>>> driver. Why do you need to access to the properties?
>>
>> I'm trying to add support for bcm63xx pin controllers, and Linus
>> suggested that I could use gpio regmap instead of adding duplicated
>> code.
> 
> nice!
> 
>> However, I need to access gpio_chip inside gpio_regmap to call
>> pinctrl_add_gpio_range() with gpio_chip.base.
> 
> Can't we add something to gpio-regmap.c which will (1) either call
> pinctrl_add_gpio_range(), just (2) return the struct gpio_chip* or
> (3) even only gpio_chip.base?

Sure, I'm OK with any way of doing it, so it's up to you and Linus :)

> 
> I don't know how many sense (1) make and how reusable that code would
> be for other drivers, though. Linus?
> 
> -michael

Best regards,
Álvaro.
