Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38FBD7AFF5F
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Sep 2023 11:03:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230260AbjI0JDn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Sep 2023 05:03:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229945AbjI0JDi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Sep 2023 05:03:38 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9713FE5
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 02:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1695805374;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZHDNG2oLtCKFL7nnqgWKmlxUsBwItqSJ3/ACBQ8Jd1M=;
        b=h0rPCY/mNLU2UEMAacJQJS6/0QeadDWnOm4Rmy9cyobBc8OtkcElGVjOw2alQ5gGobddNk
        rlaMiAdn6oMN2P77rWuslp1Kz8Y6XLVlR2hx448weR1CmQ6NM4YUfCbUkqJNZJwb3uvH6W
        N+KBrBc0jhW/fvBfAAjsMQQOTn/uDGs=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-350-nKNpkfqnOUKDkRAl3tZbLQ-1; Wed, 27 Sep 2023 05:02:53 -0400
X-MC-Unique: nKNpkfqnOUKDkRAl3tZbLQ-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-5043353efbdso14942300e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 02:02:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695805372; x=1696410172;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZHDNG2oLtCKFL7nnqgWKmlxUsBwItqSJ3/ACBQ8Jd1M=;
        b=CzhOHnw2pXxOdDuZJ+wyx3+kTED3aNIJDLnJ2Uq2OVUQnb4O4CLVnZbGmcyQ/ThedZ
         MLApFqnXPEUHsnQx//o7gil0dUJtr3kYB13KnxM7eQN29UDWQ/xnEsPzwsTAFXbWqCNk
         Qr56Z4hWd5TFmMGXciuEl/Lq7W73Y98WnUPK8PrNWfCbrM0s+N56185Tvm73faGLb/fx
         k7QnaFSD8TpZ2QxMj2lUk6MIuxRa28CGu/TRp2k12cdxbW5PY0FC7FDsHmq9hNTwnFE1
         /api3KcCw1i5uDKxZnpeU1PaTYJhCG4Ex0Mcgbc42Hayg7St6B3045168AEzYEjZOnKr
         rxqA==
X-Gm-Message-State: AOJu0YzoYjY9s9T9zts3nn85DS3PlL+jCudRg2QpQ6UF5rUaqwXtL0DZ
        Eh2+5QlQYAHHN2tzjHJQMjPfgLLXOWxQRBsHf5UZNOjMUHN1cexW3l5UQ6yY5h+IJ1h/UzNMLJl
        npWz3HOvRdvUqumQ11xxqJw==
X-Received: by 2002:a05:6512:6c6:b0:500:bf33:3add with SMTP id u6-20020a05651206c600b00500bf333addmr1474711lff.47.1695805371926;
        Wed, 27 Sep 2023 02:02:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzgcQfNmthFWe8n+JY4871ed5ukj8WaenpOn3atUNLdX0G9xbeUGHOPgejNS3m6e5BLlYpaA==
X-Received: by 2002:a05:6512:6c6:b0:500:bf33:3add with SMTP id u6-20020a05651206c600b00500bf333addmr1474682lff.47.1695805371484;
        Wed, 27 Sep 2023 02:02:51 -0700 (PDT)
Received: from [192.168.1.217] ([109.36.155.235])
        by smtp.gmail.com with ESMTPSA id n19-20020a170906165300b009a1c05bd672sm8862365ejd.127.2023.09.27.02.02.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Sep 2023 02:02:50 -0700 (PDT)
Message-ID: <181dd873-90eb-0db2-03a6-0809c9e3d835@redhat.com>
Date:   Wed, 27 Sep 2023 11:02:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFT PATCH 0/4] platform/x86: int3472: don't use
 gpiod_toggle_active_low()
Content-Language: en-US
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Mark Gross <markgross@kernel.org>, linux-gpio@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230926145943.42814-1-brgl@bgdev.pl>
 <ffb5b1a8-a4fa-f794-afc8-52eed4420a5c@redhat.com>
 <CAMRc=MeoRRzc+JHCSyOqYb2t5p6GMLdA5wX_-uq15O3tdzC1mQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAMRc=MeoRRzc+JHCSyOqYb2t5p6GMLdA5wX_-uq15O3tdzC1mQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bartosz,

On 9/27/23 10:48, Bartosz Golaszewski wrote:
> On Wed, Sep 27, 2023 at 10:38 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi Bartosz,
>>
>> On 9/26/23 16:59, Bartosz Golaszewski wrote:
>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>
>>> gpiod_toggle_active_low() is a badly designed API that should have never
>>> been used elsewhere then in the MMC code. And even there we should find
>>> a better solution.
>>>
>>> Replace the uses of it in the int3472 driver with the good old temporary
>>> lookup table trick. This is not very pretty either but it's the lesser
>>> evil.
>>
>> I saw your previous proposal which added a new api to directly set
>> the active_low flag, rather then toggle it.
>>
>> I intended to reply to that thread to say that I liked that approach,
>> but I don't remember if I actually did reply.
>>
>> I wonder what made you abandon the new function to directly set
>> the active-low flag on a gpio_desc?
>>
>> For the int3472 code that would work pretty well and it would
>> be much cleaner then the temp gpio-lookup approach.
>>
> 
> You did reply, yes. Under one of the other patches Linus W stated that
> first: adding the ability for consumers to toggle the polarity was
> added to handle the MMC slot quirk, then it was used unknowingly to
> GPIO maintainers in other places (including this driver). I then
> acknowledged the fact that it should have never existed in the first
> place as this is HW description and should be defined in ACPI, DT or
> lookup flags.

I see and I understand.

> I'm not sure why this information needs to be hard-coded in the driver
> in int3472_get_func_and_polarity() but maybe it could be pulled into
> gpiolib-acpi.c with other quirks?

The problem is that for camera sensors Intel uses this special
INT3472 ACPI device with a custom _DSM to list GPIOs, with the _DSM
returning an u32 and one of the bits in the u32 is the polarity.

We really do not want to deal with this Intel camera team hack
inside gpiolib-acpi and I can understand why you and Linus W
want to get rid of functions which allow drivers to meddle
with a gpio_desc's active-low flag.

So using a temporary gpio-lookup in the int3472 code as
you are proposing is the best (least bad) thing to do
here then.

I'll try to make some time to test this sometime
the coming days.

Other then the discussion we just had is there any specific
reason why this should be considered a RFC / why this would
not be ready for merging?  (I still need to review these,
but lets assume that goes well)

Regards,

Hans

