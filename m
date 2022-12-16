Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29B3D64EF17
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Dec 2022 17:30:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230510AbiLPQaM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Dec 2022 11:30:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbiLPQaF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Dec 2022 11:30:05 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 741EB63E5
        for <linux-gpio@vger.kernel.org>; Fri, 16 Dec 2022 08:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671208158;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+upODwCg9US2WboUst6jxBy7JMyZUXll6f2pBaNMS+o=;
        b=D04xc5dM+DpL+YiArqtIHoneKkU3WKFkZ7MgxR2dfaw9MBijHTPV9R0JhXcFOmlsMhYOLR
        XmfmheOMAZHkBRc9mIh2ID+WI9UJ7Ptp3FeJu+Nre7ot7xIvBsXqEcwv15mj8wBSc+/wlq
        j1+WkomByg/kwaGjs+L2j8szpGcD2w4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-484-lPjycgviOSy4guU-PlfWUw-1; Fri, 16 Dec 2022 11:29:16 -0500
X-MC-Unique: lPjycgviOSy4guU-PlfWUw-1
Received: by mail-ej1-f71.google.com with SMTP id ne1-20020a1709077b8100b007c198bb8c0eso2148081ejc.8
        for <linux-gpio@vger.kernel.org>; Fri, 16 Dec 2022 08:29:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+upODwCg9US2WboUst6jxBy7JMyZUXll6f2pBaNMS+o=;
        b=WoC9Qbkvy0Uhm6dW3X5mEhQQ6VUuhozwOpEPjQixrzlq/qmLbWCMQmDSRwxUxSrWQa
         iGqxZEQ+JgfX1fW7nfl4olfYzRxnWcONybOl0d8ELXRMPjFeV1dwLg2gWxn5gzqvEEMu
         p93nHG7tVx6obJYeKF1yC9glnNOn4BIkeduc64mgRyLcLozf/aDj/vy2kxGo5MCfxEeF
         h1AdiDd8QcxVXNbMER6m8qp4L9+Hggm56oCp6+lI6VDw4RVO+d0C09v69v0qKffVl3AF
         bDx4cV44X39xsJc1qIsePMxEXxiMJlsWoQB/wBARQf8ekHBWMTa64xFwRaYZ4HP7sOL/
         XNiA==
X-Gm-Message-State: ANoB5pmkJdRoNpaTTd+vMHPT1xN7v/zlVHgg034Tl0SIsWNNgrwE2RQ/
        ssUDi4Xa9LUe7vf5kFj2AlRFeIPm8ubhXiP0X82Bs06UcOk7p4t6hT0pT5T8I3bT4e/epA8HUnM
        R0f8T6h2hET485x0IHpw0pQ==
X-Received: by 2002:a05:6402:3215:b0:470:362f:6ba9 with SMTP id g21-20020a056402321500b00470362f6ba9mr15467371eda.41.1671208155204;
        Fri, 16 Dec 2022 08:29:15 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5WR/ICG+hCQ7tsp1AjkRTWv6crUFBhwdQ8eI9rOPW40h5MgzNku5U+bYTUizn2MdPALr/Oww==
X-Received: by 2002:a05:6402:3215:b0:470:362f:6ba9 with SMTP id g21-20020a056402321500b00470362f6ba9mr15467354eda.41.1671208155043;
        Fri, 16 Dec 2022 08:29:15 -0800 (PST)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6? (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
        by smtp.gmail.com with ESMTPSA id da15-20020a056402176f00b004615f7495e0sm1044190edb.8.2022.12.16.08.29.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 08:29:14 -0800 (PST)
Message-ID: <d3d28b30-a364-66eb-7870-06c43d683bb7@redhat.com>
Date:   Fri, 16 Dec 2022 17:29:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 08/11] platform/x86: int3472/discrete: Create a LED
 class device for the privacy LED
Content-Language: en-US
To:     Andy Shevchenko <andy@kernel.org>
Cc:     Mark Gross <markgross@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-gpio@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Andy Yeh <andy.yeh@intel.com>, Yao Hao <yao.hao@intel.com>,
        linux-media@vger.kernel.org
References: <20221216113013.126881-1-hdegoede@redhat.com>
 <20221216113013.126881-9-hdegoede@redhat.com>
 <Y5x9uHm8NnVHc0Lv@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y5x9uHm8NnVHc0Lv@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 12/16/22 15:16, Andy Shevchenko wrote:
> On Fri, Dec 16, 2022 at 12:30:10PM +0100, Hans de Goede wrote:
>> On some systems, e.g. the Lenovo ThinkPad X1 Yoga gen 7 and the ThinkPad
>> X1 Nano gen 2 there is no clock-enable pin, triggering the:
>> "No clk GPIO. The privacy LED won't work" warning and causing the privacy
>> LED to not work.
>>
>> Fix this by modeling the privacy LED as a LED class device rather then
>> integrating it with the registered clock.
>>
>> Note this relies on media subsys changes to actually turn the LED on/off
>> when the sensor's v4l2_subdev's s_stream() operand gets called.
> 
> ...
> 
>> +	struct int3472_pled {
>> +		char name[INT3472_LED_MAX_NAME_LEN];
>> +		struct led_lookup_data lookup;
> 
>> +		struct led_classdev classdev;
> 
> Why not putting this as a first member in the struct, so any container_of()
> against it become no-op at compile time?

Ack will fix for v4.

> 
>> +		struct gpio_desc *gpio;
>> +	} pled;
> 
> ...
> 
>> +	if (IS_ERR(int3472->pled.gpio)) {
>> +		ret = PTR_ERR(int3472->pled.gpio);
>> +		return dev_err_probe(int3472->dev, ret, "getting privacy LED GPIO\n");
> 
> 	return dev_err_probe(...);

That goes over 100 chars.


> 
>> +	}
> 
> ...
> 
>> +	/* Generate the name, replacing the ':' in the ACPI devname with '_' */
>> +	snprintf(int3472->pled.name, sizeof(int3472->pled.name),
>> +		 "%s::privacy_led", acpi_dev_name(int3472->sensor));
> 
>> +	for (i = 0; int3472->pled.name[i]; i++) {
>> +		if (int3472->pled.name[i] == ':') {
>> +			int3472->pled.name[i] = '_';
>> +			break;
>> +		}
>> +	}
> 
> NIH strreplace().

Please look more careful, quoting from the strreplace() docs:

 * strreplace - Replace all occurrences of character in string.

Notice the *all* and we only want to replace the first ':' here,
because the ':' char has a special meaning in LED class-device-names.


> 
> ...
> 
>> +void skl_int3472_unregister_pled(struct int3472_discrete_device *int3472)
>> +{
>> +	if (IS_ERR_OR_NULL(int3472->pled.classdev.dev))
>> +		return;
> 
> This dups the check inside the _unregister() below, right?

Right.

> 
>> +	led_remove_lookup(&int3472->pled.lookup);
> 
> With list_del_init() I believe the above check can be droped.

No it cannot, list_del_init() inside led_remove_lookup() would
protect against double led_remove_lookup() calls.

But here we may have a completely uninitialized list_head on
devices without an INT3472 privacy-led, which will trigger
either __list_del_entry_valid() errors or lead to NULL
pointer derefs.


> 
>> +	led_classdev_unregister(&int3472->pled.classdev);
>> +	gpiod_put(int3472->pled.gpio);
>> +}
> 

Regards.

Hans

