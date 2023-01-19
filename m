Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19B37673CFB
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jan 2023 16:03:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229583AbjASPDl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Jan 2023 10:03:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229724AbjASPDk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Jan 2023 10:03:40 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB4B930D7
        for <linux-gpio@vger.kernel.org>; Thu, 19 Jan 2023 07:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674140583;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EUQ8UTL2Y5cTwGtQsXg2A7ACjWs1mY8h1VGNT9NYx1U=;
        b=blLfQHdKugVj/YDVbK+1tWsM1AUi26jPg1lqWb96zOIctjRPwxMpdYCcwZlPKjhqGH4uZX
        jIQFZiUX2P6rOOGPT9Qq5ltk0ZMi9TYfBzeZFZewy0kkuhuX8W21uJEvklcald3zDFPtLR
        FHp8z6FAXDs0/SNlZrDTkQr3HHIcF38=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-240-KBFvL53MMOOV94p5Uvu2lw-1; Thu, 19 Jan 2023 10:02:46 -0500
X-MC-Unique: KBFvL53MMOOV94p5Uvu2lw-1
Received: by mail-ej1-f71.google.com with SMTP id wz4-20020a170906fe4400b0084c7e7eb6d0so1768711ejb.19
        for <linux-gpio@vger.kernel.org>; Thu, 19 Jan 2023 07:02:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EUQ8UTL2Y5cTwGtQsXg2A7ACjWs1mY8h1VGNT9NYx1U=;
        b=tiXhkrKsvaY2JeJtNOT6ichrvkKJeQmOtChtgEIlIgxX2Z+bmU39fs7C7V7W78kjam
         l0KEcIiq6wZxdBEoJIntfjKKGfMKQAqRu47YLzPPJ5TdD20ieyqxO1yRwhEAeQKwSk7t
         Keh3QI1njLQvQJVMDRHq2+ojQKRCJQ/sRN2TBdApInC08MZumwm/IP+nF7z4YEHEEdhD
         L1moKWyPkYFcRYr1zEkY3p2h8NnvFBXWR9zQiSgZ12erB40BXlBLRlhzMOAjOXh+6kRX
         doSSvE6j6Mftm4J7FEgwv59ttzpaZXnit65kMI/w2+T3Iu2OWs3wRNGLkmzc3LOz8cXc
         Dl/Q==
X-Gm-Message-State: AFqh2kqvn67TsGrq4CFG6idKS8S/YQLhdOAf+kHe+DXdEbYJQmJOhatj
        VzVj73lDpfntmsrQFqM0X8+8+25f+16cnGWbMJ5d8XaDEGg7Z3AZVYOvDPNc4USD2tf7lxx6Avn
        xwWAa7uCOjpzPZP8jIzqyuQ==
X-Received: by 2002:a17:907:d38a:b0:86e:c9e2:6313 with SMTP id vh10-20020a170907d38a00b0086ec9e26313mr12746036ejc.32.1674140557945;
        Thu, 19 Jan 2023 07:02:37 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuy7Pzo3BOt0+GMAUXJGwSUj38s8ESKcKOqi8Wy1yn7ONJTUJEbXECCgYiJxDx+dbbId5NI/w==
X-Received: by 2002:a17:907:d38a:b0:86e:c9e2:6313 with SMTP id vh10-20020a170907d38a00b0086ec9e26313mr12746001ejc.32.1674140557651;
        Thu, 19 Jan 2023 07:02:37 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id b4-20020a1709065e4400b00865ef3a3109sm9740712eju.66.2023.01.19.07.02.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 07:02:36 -0800 (PST)
Message-ID: <566c7382-505f-103b-bfab-59d42142e10f@redhat.com>
Date:   Thu, 19 Jan 2023 16:02:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4 04/11] leds: led-class: Add generic [devm_]led_get()
Content-Language: en-US, nl
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-gpio@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Andy Yeh <andy.yeh@intel.com>, Hao Yao <hao.yao@intel.com>,
        linux-media@vger.kernel.org
References: <20230119130053.111344-1-hdegoede@redhat.com>
 <20230119130053.111344-5-hdegoede@redhat.com>
 <CAHp75VcCEJVx71H9MqNqPP+KAMDzgpx5v1P9h_h375ejeMa2+g@mail.gmail.com>
 <53af2be7-8a10-2ea4-83f7-501668f8042a@redhat.com>
 <CAHp75Vd1TjAedSGmA=fQTy-f5NsZDG96VCxtbLN2Nf+rUOo-TA@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vd1TjAedSGmA=fQTy-f5NsZDG96VCxtbLN2Nf+rUOo-TA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 1/19/23 15:54, Andy Shevchenko wrote:
> On Thu, Jan 19, 2023 at 4:16 PM Hans de Goede <hdegoede@redhat.com> wrote:
>> On 1/19/23 15:04, Andy Shevchenko wrote:
>>> On Thu, Jan 19, 2023 at 3:01 PM Hans de Goede <hdegoede@redhat.com> wrote:
> 
> ...
> 
>>>> +/*
>>>> + * This is used to tell led_get() device which led_classdev to return for
>>>> + * a specific consumer device-name, function pair on non devicetree platforms.
>>>> + * Note all strings must be set.
>>>> + */
>>>> +struct led_lookup_data {
>>>> +       struct list_head list;
>>>> +       const char *led_name;
>>>> +       const char *consumer_dev_name;
>>>> +       const char *consumer_function;
>>>> +};
>>>
>>> I'm wondering if it would be better to have something like
>>>
>>> struct led_function_map {
>>>        const char *name;
>>>        const char *function;
>>> };
>>>
>>> struct led_lookup_data {
>>>        struct list_head list;
>>>        const char *dev_name;
>>>        const struct led_function_map map[];
>>> };
>>
>> Thank you for the review.
>>
>> Since led_lookup_data now is variable sized, AFAIK this means that
>> the led_lookup_data now can no longer be embedded in another struct and
>> instead it must always be dynamically allocated, including adding error
>> checking + rollback for said allocation.
> 
> I'm not sure what you are talking about here. GPIO lookup table
> defined in the same way and doesn't strictly require heap allocation.
> For the embedding into another structure, it can be as the last entry AFAIU.

That will probably work, but only if there is only 1 variable sized
struct which you want to embed.

Also note that in the current use-case the struct is embedded in
a sub-struct of the main driver_data struct, so then not only
would this need to be the last member of the sub-struct, but
the sub-struct itself would need to be the last member of
the main driver_data struct.

Variable sized structs can be nice sometimes, but in cases where
we may want to embed them they are not always ideal.

>> If you look at the only current consumer of this:
>>
>> [PATCH v4 09/11] platform/x86: int3472/discrete: Create a LED class device for the privacy LED
>>
>> then the code there would become more complicated.
> 
>>> as you may have more than one LED per the device and it would be a
>>> more compressed list in this case. I'm basically referring to the GPIO
>>> lookup table.
>>
>> Right, but having more then 1 GPIO per device is quite common while
>> I expect having more then 1 (or maybe 2) LEDs per device to be rare while
>> at the same time the suggested change makes things slightly more
>> complicated for consumers of the API which know before hand how much
>> lookup entries they will need (typically 1).
>>
>> So all in all I believe staying with the current implementation is better
>> but if there is a strong preference to switch to the structure you suggest
>> then I have no objection against that.
> 
> I have no strong opinion, I just want to have fewer variants of the
> lookup tables.
> Anyway, reset framework has something similar to yours.

Right, so there is precedent for this variant too.

> Question: can you
> rename fields to be something like dev_id, con_id, etc as it's done in the most
> of the lookup data types?

I see that the gpio and reset lookups indeed both use dev_id and con_id
I will change the LED lookups to use this to for version 5 of this
patch-set.

Regards,

Hans


