Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E74D263BFE8
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Nov 2022 13:20:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232484AbiK2MUx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Nov 2022 07:20:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232401AbiK2MUw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Nov 2022 07:20:52 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46BC35D69C
        for <linux-gpio@vger.kernel.org>; Tue, 29 Nov 2022 04:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669724401;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=h+VylQnPU570h37x9UjTHWMzANF3h54ZhxETOQFnrz0=;
        b=MKpBRtXFtR8cjVM+tO0Y9MTPRifC4xqFuzUuCSHAZ0W7jKTET76MndetKLTZLCZuw88I0B
        Fr5zz4RYBrUayyZ9eT/Lz9D0gzLw+rDjSGXtLOqyJQNuXOTeoOEUWFzNy8GcmqyhXseaem
        Ur8PyUJjIkdFpI0KBUDqQD/BjBIG5M0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-57--Ew_xnT6MX--uILZ98IBJw-1; Tue, 29 Nov 2022 07:20:00 -0500
X-MC-Unique: -Ew_xnT6MX--uILZ98IBJw-1
Received: by mail-ej1-f70.google.com with SMTP id qw20-20020a1709066a1400b007af13652c92so6474875ejc.20
        for <linux-gpio@vger.kernel.org>; Tue, 29 Nov 2022 04:20:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h+VylQnPU570h37x9UjTHWMzANF3h54ZhxETOQFnrz0=;
        b=l23kD/7ZEuudRO/E41T2KIVvdDHjviNGPcMcQnXkU9msRi7zaS/NOXV/3R5ic19v/e
         9S5iKqHrI3P1PbUYXz45Ds+Tw4DCa4hW0g+pnEP+doPtGnC7LPb/PLTV5p2J8xlss3JT
         V6cmu0QzNpiwaxiEQ17DILKg9UlC0pC7c5zZ2BlwGg7MyRNTPQFkCt3RoweO+we9YPDq
         gky307jvdwZfGI3rXwRbls9k8hv5Zd1rsqWVh+K7VNrF+r4R7ARsStLTNFocRT+s7YQf
         hQXOqtQG3euBZJ3TRdWDSJxU6D9rlEsnA7oy7Op9lQbsUtpvjIwOtti0Pqw+ZDKu0U59
         0dJg==
X-Gm-Message-State: ANoB5pkqCV3C9rtbbtDDB1kFP52HSnhBS9B2kn4/2iPwiR1LPLfTSDwQ
        j48P9oWuiQHbDlczXFQgPldLqb7bqU6NfF7lhqF4kywkv6jkT6XsMhzCDgEFztgTjonuNZemL86
        YMYP9bprm7DO7DYYYtgz38w==
X-Received: by 2002:a17:906:9718:b0:7bf:1090:ded6 with SMTP id k24-20020a170906971800b007bf1090ded6mr9925696ejx.577.1669724398863;
        Tue, 29 Nov 2022 04:19:58 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7AHtlWkiqkj0UM5H1WUvDEAl7vxBq2J7zflwfg6xETHeUCVzMRyvKFjB4eYzNpFz3dqSSvNA==
X-Received: by 2002:a17:906:9718:b0:7bf:1090:ded6 with SMTP id k24-20020a170906971800b007bf1090ded6mr9925685ejx.577.1669724398673;
        Tue, 29 Nov 2022 04:19:58 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id d25-20020a50fe99000000b004588ef795easm6138657edt.34.2022.11.29.04.19.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Nov 2022 04:19:58 -0800 (PST)
Message-ID: <1eb61f7a-3b93-32a1-21bf-6929bbb40d36@redhat.com>
Date:   Tue, 29 Nov 2022 13:19:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 1/5] gpio: tps68470: Fix tps68470_gpio_get() reading from
 the wrong register
Content-Language: en-US, nl
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
References: <20221128214408.165726-1-hdegoede@redhat.com>
 <20221128214408.165726-2-hdegoede@redhat.com>
 <CAHp75VcXfh46z4m+R4bDTZbcWrqEmebzg-2gT_P+2uAYTNPoYQ@mail.gmail.com>
 <9a4336d1-3222-fe50-f234-93ab175d606a@redhat.com>
 <CAHp75VdEd2-YMm2kGdRh2n7WwTJDEmOk68O4ydHU1m3W+Z83Lg@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VdEd2-YMm2kGdRh2n7WwTJDEmOk68O4ydHU1m3W+Z83Lg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 11/29/22 12:56, Andy Shevchenko wrote:
> On Tue, Nov 29, 2022 at 1:27 PM Hans de Goede <hdegoede@redhat.com> wrote:
>> On 11/29/22 11:22, Andy Shevchenko wrote:
>>> On Mon, Nov 28, 2022 at 11:44 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>>>
>>>> For the regular GPIO pins the value should be read from TPS68470_REG_GPDI,
>>>> so that the actual value of the pin is read, rather then the value the pin
>>>
>>> than
>>
>> Ack.
>>
>>>> would output when put in output mode.
>>>
>>> I don't see it here and haven't checked the context, but the idea is
>>> to check the direction and return either input (if pin is in input
>>> mode) or [cached] output.If it's the case, the patch looks good to me.
>>
>> No the idea is to always actually use the input register when reading
>> the pins, independent of the input/output mode. Instead of always
>> reading the [cached] output register value.
> 
> But why? This makes a little sense to me.

I don't understand what your problem is with this patch ?

This is standard behavior for GPIO drivers, the get() callback
always reads the actual pin values when there is a registers
to get the actual pin-values. AFAIK this is no different from what
countless other GPIO drivers do ?

>> The input buffer will still work when the device is in output mode
> 
> Does this hardware support HiZ?

Yes the 7 standard GPIO pins can be put in input mode, aka HiZ mode.

>> and if somehow an external force is pushing the pin low/high against
>> the output value then the input buffer will correctly reflect this
>> (assuming the output is current limited and thus the magic smoke
>> stays inside the chip).
> 
> Exactly, when smoke comes out, the hardware is broken and code,
> whatever is it, makes no difference at all.

The GPIO part of the TPS68470 supports open-drain outputs, to correctly
get the actual value on the pin from the get() callback, the GPDI
register must be used. And being able to detect some outside chip
forcing the line low in open-drain mode is important to be able to
e.g. implement a software I2C master.

As I mentioned above actually using the input buffer value in
the get() method is standard behavior for GPIO drivers, exactly
for reasons like allowing a sw I2C master implementation to
detect clock stretching or conflicts (in the multi master case).

I really don't understand what is so controversial about this
patch?

Note the datasheet describes the GPDO / GPDI bit 0  values as:

GPDO bit 0: "Control of the GPIO0 output"
GPDI bit 0: "State of the GPIO0 input"

So clearly GPDI is the correct register to use for the get()
callback, which is what this patch is doing.

Regards,

Hans

