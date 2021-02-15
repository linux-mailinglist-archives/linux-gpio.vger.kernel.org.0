Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A74F431B3DB
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Feb 2021 02:13:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229945AbhBOBMy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 14 Feb 2021 20:12:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229875AbhBOBMx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 14 Feb 2021 20:12:53 -0500
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 149C1C061574;
        Sun, 14 Feb 2021 17:12:13 -0800 (PST)
Received: by mail-qt1-x836.google.com with SMTP id b24so3861074qtp.13;
        Sun, 14 Feb 2021 17:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=u/P+klsYT+3oCQuRx6zNma6AUAUqrQJf7IT/OG3OTCY=;
        b=ffmR4pdedM1f3Qslw6Y8/WUmFQ/vzJTIyFZhbX3cQf5JOPGSgUs53Fpf/ajtN8hIhp
         EEzADtiWXdpTcZHe/IcCgOviVxpu86jHgHAdYFtKtSAAEip+Y5WO/onaF3AKD4hIiJGK
         rEhJ4dimvY2Y8GQqFwrPbzBMRiSqX23cY3pbTHicwFtYE2ID3L1CGch1qAxCaq5gyz9/
         LXGYGVMBX0w8BzOiIlUe5ykbEXvJTXIPtvL83NXVMbDMbfvHvczodFGZA/SrB19cI4PS
         piRpJj6sd71JlGTxyDpcq5y6bzcVp031ZtYzo61qTPm468Z+BxrN7Gxg+SeXRLHSNrcz
         rsYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=u/P+klsYT+3oCQuRx6zNma6AUAUqrQJf7IT/OG3OTCY=;
        b=MqnJ6DV8pAVOKSFm2nGP+aoDqwYxz7vfWdO87vh9NvUJ437KvndpZvA7E5+BUslOxE
         RezOpHkfvQO3B+L46krdeVSxPy7Eu2pyCFVjKuvxjbsFwphBJpVJ7ywjca6a76SUB+GQ
         z7N3YcAHI1RV7Ukmfmd6WCHAqQB0TMrkcuHCVIX8OZ5+oX948iWfpB7U2URxNQ0u/0h2
         48N1Ai8Vj0vyXWCxhy0ICVfupNPHIxV7mLBFvOdkcxROfWRlzxVEUqdTHxPwtfMfOwWG
         5Sd9Swn57S10pg4aSMaYokMGAF5CwoRP45Woooj1uE93IRSyqbq0il0IKqfYrJW2Ba8Q
         4juw==
X-Gm-Message-State: AOAM530a7DQagQeaAwZC5kWXEBoXlv8XhtEjuY4TR+HKtgf+EBsH/O3p
        Oeyv5p+J4kAcdHVpd3tiw3E=
X-Google-Smtp-Source: ABdhPJwZMz5lUnadRv1zcJOSM2ZY+QzmwkAhtI1lcOaNSV4PBlPT4f61wh+ACE4/TfwwUqbqR5T90g==
X-Received: by 2002:ac8:6c5c:: with SMTP id z28mr8752586qtu.371.1613351532141;
        Sun, 14 Feb 2021 17:12:12 -0800 (PST)
Received: from [192.168.1.49] (c-67-187-90-124.hsd1.tn.comcast.net. [67.187.90.124])
        by smtp.gmail.com with ESMTPSA id o13sm3521268qkj.130.2021.02.14.17.12.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Feb 2021 17:12:11 -0800 (PST)
Subject: Re: RFC: oftree based setup of composite board devices
To:     Rob Herring <robh+dt@kernel.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree@vger.kernel.org, Johan Hovold <johan@kernel.org>
References: <20210208222203.22335-1-info@metux.net>
 <CAL_JsqJ-bz35mUM3agYjq5x+Y+u9rL1RwesCaA-x=MW8uv5CrA@mail.gmail.com>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <76bf0f7c-9477-f370-8fbd-ce8ef15188b1@gmail.com>
Date:   Sun, 14 Feb 2021 19:12:10 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJ-bz35mUM3agYjq5x+Y+u9rL1RwesCaA-x=MW8uv5CrA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2/8/21 5:48 PM, Rob Herring wrote:
> +Johan H
> 
> On Mon, Feb 8, 2021 at 4:22 PM Enrico Weigelt, metux IT consult
> <info@metux.net> wrote:
>>
>> Hello folks,
>>
>> here's an RFC for using compiled-in dtb's for initializing board devices
>> that can't be probed via bus'es or firmware.

I've just been monitoring this thread for several days, hoping that the
discussion would make things more clear for me.

Disclaimer: I know essentially nothing about ACPI, please excuse improper
naming and misunderstandings on my part.

Why not compile in ACPI data (tables?) instead of devicetree description?

> 
> I'm not convinced compiled in is the mechanism we want.
> 
>> Use cases are boards with non-oftree firmware (ACPI, etc) where certain
>> platform devices can't be directly enumerated via firmware. Traditionally
>> we had to write board specific drivers that check for board identification
>> (DMI strings, etc), then initialize the actual devices and their links
>> (eg. gpio<->leds/buttons, ...). Often this can be expressed just by DT.
> 
> This is something I've wanted to see for a while. There's use cases
> for DT based systems too. The example I'd like to see supported are
> USB serial adapters with downstream serdev, GPIO, I2C, SPI, etc. Then
> plug more than one of those in.

My understanding from the past is that the experts (those who understand both
devicetree and ACPI) regard trying to mix devicetree and ACPI in a single
running Linux kernel image is insanity, or at least likely to be confusing,
difficult, and problematic.

From the devicetree side, I expect nightmares for me if devicetree and ACPI
are mixed in a single running kernel image.

> 
>> This patch queue does a bunch of preparations in oftree code, so we can
>> support multiple fully independent DT's (not using DT overlays). And then
>> adds a generic driver parses compiled-in fdt blobs, checks for mathing
>> DMI strings and initializes the devices. As an example, the last patch
>> adds an alternative implementation for the PC engines APU2/3/4 board
>> family based on device tree.
> 
> I think there's a couple of approaches we could take. Either support
> multiple root nodes as you have done or keep a single root and add
> child nodes to them. I think the latter would be less invasive. In the
> non-DT cases, we'd just always create an empty skeleton DT. A 3rd
> variation on a DT system is we could want to create parent nodes if
> they don't exist to attach this DT to so we have a full hierarchy.
> 
> I'm not saying which one we should do, just laying out some of the options.
> 

Multiple root nodes and disjoint trees both seem problematic.  Existing
subsystems and drivers expect a single cohesive tree.  Changing that
architecture looks to me to be a painful exercise.

>> The approach can be easily be extended to other kinds of composite devices,
>> eg. PCI cards or USB dongles.
>>
>>
>> Yet some drawbacks of the current implementation:
>>
>>  * individual FDT's can't be modularized yet (IMHO, we don't have DMI-based
>>    modprobing anyways)
> 
> I think we need to use either firmware loading or udev mechanisms to
> load the FDTs.
> 
>>  * can't reconfigure or attach to devices outside the individual DT's
>>    (eg. probed by PCI, etc)
> 
> Not sure I follow.
> 
> Rob
> 

