Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 495F6673B83
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jan 2023 15:17:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231330AbjASORL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Jan 2023 09:17:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229787AbjASORJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Jan 2023 09:17:09 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34D1675705
        for <linux-gpio@vger.kernel.org>; Thu, 19 Jan 2023 06:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674137760;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9QmCxXgbVAOmH/8FteiPvamTB8y9Hi4M7Oy+ZMtbQJM=;
        b=NI1BFVB+vv64pZRsu6ygQxI9ajTglKxA+7XpC3ROLuWfB4cVEc8bT3M+TalUSyPmyVnHjm
        +bfgz7W6zJe2KD7BCZPcvxqgG5cZON4n+vbzGCV9fNukpYJ6rahwU/PhV3VkXIScesRvee
        vWwBzK2y6VDC2LwkpFrLzsG864BRPCA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-140-15oDc56EOZ-sPrKEGatIpQ-1; Thu, 19 Jan 2023 09:15:59 -0500
X-MC-Unique: 15oDc56EOZ-sPrKEGatIpQ-1
Received: by mail-ej1-f71.google.com with SMTP id qf20-20020a1709077f1400b0086ec9755517so1680309ejc.15
        for <linux-gpio@vger.kernel.org>; Thu, 19 Jan 2023 06:15:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9QmCxXgbVAOmH/8FteiPvamTB8y9Hi4M7Oy+ZMtbQJM=;
        b=BEsD24NbxzmLE5tBQF3r6+QmgGScpa+hnmaANffLWQoZcAiWvN0f2b+z7rkLCe0N6K
         DrfOtPzNXIJnW9TXBtAR4DVhZsZQaPjZUSbCZnopOW6dJiIDUYGV5O9I/nEh4GyMlS/9
         WnuHqx3CiHMt62U5A1Hckas2vpWcfXRJI4J2xwQJ9G04ZA0mdS7hWmxKDxKbv1rfqbXN
         8MLWt3ZeuHIIsSVcnYCqN6igc4ZS9j38EpQa+qoSgKzF/5X4CI4nua7l2qWT4myRqxxp
         MeTckkE7OLp2+KE7f2pkdGnb4eQSyzqmmuWAJie2Uca6tgtFsvq7Qxh4olMhFcXTTcIS
         +JuQ==
X-Gm-Message-State: AFqh2krzO7IjIgOml1+PxiFLbJmK1HaQqSTh9HFfQkbODPiFgtwQryiq
        +hX4WOCUHdmRmuqLs5QGpckqc1W6tLh2pMOjQ/Ysw+kYQPqkPD/8lxtSyvztIjQbkYNaEnRXJjE
        D9l34jpCeXtAa7Wx9GC9CyQ==
X-Received: by 2002:a17:907:9623:b0:869:236c:ac40 with SMTP id gb35-20020a170907962300b00869236cac40mr14561985ejc.31.1674137758029;
        Thu, 19 Jan 2023 06:15:58 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvN70s3jCumuUCEK9I3ZJUj6f/Olx3HyzIGTL++jCp53/HPi3IFG4FY3XRxO9o92xSKi74LaA==
X-Received: by 2002:a17:907:9623:b0:869:236c:ac40 with SMTP id gb35-20020a170907962300b00869236cac40mr14561949ejc.31.1674137757779;
        Thu, 19 Jan 2023 06:15:57 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id k8-20020a1709062a4800b0083ffb81f01esm16350379eje.136.2023.01.19.06.15.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 06:15:57 -0800 (PST)
Message-ID: <53af2be7-8a10-2ea4-83f7-501668f8042a@redhat.com>
Date:   Thu, 19 Jan 2023 15:15:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4 04/11] leds: led-class: Add generic [devm_]led_get()
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
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VcCEJVx71H9MqNqPP+KAMDzgpx5v1P9h_h375ejeMa2+g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 1/19/23 15:04, Andy Shevchenko wrote:
> On Thu, Jan 19, 2023 at 3:01 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Add a generic [devm_]led_get() method which can be used on both devicetree
>> and non devicetree platforms to get a LED classdev associated with
>> a specific function on a specific device, e.g. the privacy LED associated
>> with a specific camera sensor.
>>
>> Note unlike of_led_get() this takes a string describing the function
>> rather then an index. This is done because e.g. camera sensors might
> 
> than
> 
>> have a privacy LED, or a flash LED, or both and using an index
>> approach leaves it unclear what the function of index 0 is if there is
>> only 1 LED.
>>
>> This uses a lookup-table mechanism for non devicetree platforms.
>> This allows the platform code to map specific LED class_dev-s to a specific
>> device,function combinations this way.
>>
>> For devicetree platforms getting the LED by function-name could be made
>> to work using the standard devicetree pattern of adding a -names string
>> array to map names to the indexes.
> 
> ...
> 
>> +/*
>> + * This is used to tell led_get() device which led_classdev to return for
>> + * a specific consumer device-name, function pair on non devicetree platforms.
>> + * Note all strings must be set.
>> + */
>> +struct led_lookup_data {
>> +       struct list_head list;
>> +       const char *led_name;
>> +       const char *consumer_dev_name;
>> +       const char *consumer_function;
>> +};
> 
> I'm wondering if it would be better to have something like
> 
> struct led_function_map {
>        const char *name;
>        const char *function;
> };
> 
> struct led_lookup_data {
>        struct list_head list;
>        const char *dev_name;
>        const struct led_function_map map[];
> };

Thank you for the review.

Since led_lookup_data now is variable sized, AFAIK this means that
the led_lookup_data now can no longer be embedded in another struct and
instead it must always be dynamically allocated, including adding error
checking + rollback for said allocation.

If you look at the only current consumer of this:

[PATCH v4 09/11] platform/x86: int3472/discrete: Create a LED class device for the privacy LED

then the code there would become more complicated.

> as you may have more than one LED per the device and it would be a
> more compressed list in this case. I'm basically referring to the GPIO
> lookup table.

Right, but having more then 1 GPIO per device is quite common while
I expect having more then 1 (or maybe 2) LEDs per device to be rare while
at the same time the suggested change makes things slightly more
complicated for consumers of the API which know before hand how much
lookup entries they will need (typically 1).

So all in all I believe staying with the current implementation is better
but if there is a strong preference to switch to the structure you suggest
then I have no objection against that.

Regards,

Hans


