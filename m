Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6E46459D3A
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Nov 2021 08:56:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233894AbhKWH7O (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Nov 2021 02:59:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233842AbhKWH7N (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Nov 2021 02:59:13 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99D4DC061574;
        Mon, 22 Nov 2021 23:56:05 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id u3so88722686lfl.2;
        Mon, 22 Nov 2021 23:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:cc:references
         :from:in-reply-to:content-transfer-encoding;
        bh=DjjH7TGlsBg96V5cUpOrwA/evrR4dCMvIcHzMQCBnGY=;
        b=Eb6Drds8qwOS7naO1X591z9Sn6UnmtldIHb+5Dao2BBOMgJoY4biTy250j40Urh0Dr
         k34HHzCNVgFHfcZqsYSX/qBJmokHAsqg5g4F+eUM9hmgAYJwl0Id4i/3Xa3oyyZVm6u6
         8lZZKqS6ZMQlCKVYcbDhkVjhkNHN2w5YLnoq+Y/lLdBCalpqWdP2mOa2jtd1Eyvwvn3Z
         YZm7UkDbkJVRwEhbpdB/iEvhFtuA2zQew9+/J9iPweKwTsFH8N6gFk4JdYJnSCiibfH6
         k+g+kPulxAFtXmHrw1WD7f/nMyXGzLoB7qLk9DMhzFydgyXLhCEZ7rKajpvrSFZBgT15
         jXew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:cc:references:from:in-reply-to:content-transfer-encoding;
        bh=DjjH7TGlsBg96V5cUpOrwA/evrR4dCMvIcHzMQCBnGY=;
        b=6akBmLhvRiv4CWgEaXv6SKLgNFflF+U1hV14z1Auvf6OLKaQRiX2j5hHvw9A4roJgz
         1HT0R3Qf+7KwrTXuj6MB0Uy+9h02JJTpEhVSo3ewKVxf+2YQdeEPH4dQTkjXcj9NWNYd
         BNgMELxym6onFQF9lNrAWLYSHTL2d+/Ul5MzJGeAyOYOYj/obmnxQTyGzxK2CM0WVVNT
         kJn/hKzl1/3eF3DsXhQ53biJcil8m85igXEkNayWhm4hB3mUWMPl8i6bph+qXGGlRcLI
         +6ChWryjUdxuDeY/MaHWQH2H1XAEXGdcuwYbfFd+cFeFNEo5MAsLGFa5XNUHHYKxyarS
         vVcQ==
X-Gm-Message-State: AOAM533mZFclHu1LRLA+piEWCvB5QzS8vtWzGXxYobeKx/2ryuSPYxlE
        AMEWtYAlkKwB1QMMi+UZGUQ=
X-Google-Smtp-Source: ABdhPJxcVprN2E+veoq+JcB0mEI4OMFEuGluWS95cFvc1FspoWdXnjAesSc0BFE7gQKJcy6g9oT5yA==
X-Received: by 2002:ac2:4116:: with SMTP id b22mr2940191lfi.587.1637654163884;
        Mon, 22 Nov 2021 23:56:03 -0800 (PST)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id s14sm1401273lfg.230.2021.11.22.23.56.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Nov 2021 23:56:03 -0800 (PST)
Message-ID: <2fb0593a-208f-a732-843b-b6723633e208@gmail.com>
Date:   Tue, 23 Nov 2021 08:56:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:95.0) Gecko/20100101
 Thunderbird/95.0
Subject: Re: [PATCH 2/5] dt-bindings: pinctrl: brcm,ns-pinmux: extend example
To:     Tony Lindgren <tony@atomide.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20211118132152.15722-1-zajec5@gmail.com>
 <20211118132152.15722-3-zajec5@gmail.com> <YZyahbYwMFz7baTu@atomide.com>
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <YZyahbYwMFz7baTu@atomide.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 23.11.2021 08:38, Tony Lindgren wrote:
> 200* Rafał Miłecki <zajec5@gmail.com> [211118 13:30]:
>> @@ -83,6 +83,33 @@ examples:
>>           reg = <0x1800c1c0 0x24>;
>>           reg-names = "cru_gpio_control";
>>   
>> +        pins {
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            pin@4 {
>> +                reg = <4>;
>> +                label = "i2c_scl";
>> +            };
>> +
>> +            pin@5 {
>> +                reg = <5>;
>> +                label = "i2c_sda";
>> +            };
>> +        };
> 
> The reg property should indicate the hardware offset from the device base
> address. The reg values above for 4 and 5 seem to be indexed instead :)
> Please update to use real register offsets from the 0x1800c1c0 base
> instead. If a reg offset + bit offset are needed, the #address-cells or
> #pinctrl-cells can be used.

It's true those are "reg"s are PINS indexes and not actual hw registers.
That concept of changing "reg" context is nothing new here however. It's
used in many other places.

Some examples:

1. net/mdio-mux.yaml
"reg" is used for "The sub-bus number" (not actual hw register)

2. usb/usb-device.yaml
"reg" is used for USB port index on USB hub

3. spi/spi-controller.yaml
"reg" is used for "Chip select used by the device."

4. mtd/partitions/partition.yaml
"reg" is used for "partition's offset and size within the flash"

Does it mean above "reg" usages are all incorrect and binding "reg" in
such way is deprecated? This is something totally new to me, can you
confirm that, please?


> The main problem using an index is that you need to keep it in sync
> between the dts and device driver. And if a new SoC variant adds an entry
> between the registers, you end up having to renumber the index.

I don't understand that part. That index ("reg" value in above example)
is actual PIN number. It's expected to match hw datasheets. Order
doesn't matter there.

If new hw revision adds PIN 2, I could just add pin@2 { ... };
