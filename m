Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 811F964EFCF
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Dec 2022 17:53:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230233AbiLPQxh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Dec 2022 11:53:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231488AbiLPQxf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Dec 2022 11:53:35 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBE4E2634
        for <linux-gpio@vger.kernel.org>; Fri, 16 Dec 2022 08:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671209569;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kja3SmecApGMN61IK4pCNwdjsbD0sNLmT1vc6A1JaUY=;
        b=TSsrlYcUKtmJZeAKgZoU+1VNECYG7K/ks9YK2pJBLoFHQtglYCy95NrTCAKiLNgTD1z2tR
        zjVuromEUhOWofwVs/UanXG0dXbQ0LUwcHXoXXeIclBEH79flsPVBMnS8mNyPRqiJA/YLV
        HtAV4Bfxv9JJ5ON+97S94oYl6whQGtk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-653-J30bqVH6Mbi7Iwd3Do2NbA-1; Fri, 16 Dec 2022 11:52:47 -0500
X-MC-Unique: J30bqVH6Mbi7Iwd3Do2NbA-1
Received: by mail-ej1-f71.google.com with SMTP id qa18-20020a170907869200b007df87611618so1921613ejc.1
        for <linux-gpio@vger.kernel.org>; Fri, 16 Dec 2022 08:52:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kja3SmecApGMN61IK4pCNwdjsbD0sNLmT1vc6A1JaUY=;
        b=Qa9dwaY16SBuU4wrAGrRLiYagfylIR2ucfYpuYdiqlMRxlgHdi704UuXvLw5dQkHA7
         bViOpo84R873MwjLIgEOb2EnvDIGC7t0pAHR4qQ9CUG8ds/NGJsCYSytNZxRDHKEp/uQ
         ZDiAdHqJ44xAJdvQG7RfvFz7u/SuOB/easuEMjJM9BzXdJwY6t2xNuSxRZx6I+LASeuP
         FvJOByFYu8BulLSmwl/xxQoPhs4XvbxMOd9H3x+1rIQmyfW8Tr5bA4uefEgBfB9ljNuy
         TFeG3aln450bFyN33IpcJ2ug+f0H6aupQ/qB0vchFhk+kZXDbwvihaGaFdpTclLTfgOZ
         Iw9w==
X-Gm-Message-State: ANoB5ple5vu2pzxDEQnflsTsergptmbGjjy3PHWOfoMHos9JalGCDVru
        RSnSvWJgOySDJk9u7IzzzkWd6JiSsetInqOc//UK8puh7tulbmv0kCsdKB32AwxOmktjIoiOJqd
        pdrUzZ0c46MlnhHBsCPz2og==
X-Received: by 2002:a17:907:c295:b0:78d:f455:c398 with SMTP id tk21-20020a170907c29500b0078df455c398mr17377373ejc.62.1671209566792;
        Fri, 16 Dec 2022 08:52:46 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5WWxTV0JYtZ3TMrkOYvf0JwKwvXkcY0xL7zTiDLfTkOMDCQwGw4d6CiPXcNcUJFXAvP9l8+Q==
X-Received: by 2002:a17:907:c295:b0:78d:f455:c398 with SMTP id tk21-20020a170907c29500b0078df455c398mr17377348ejc.62.1671209566593;
        Fri, 16 Dec 2022 08:52:46 -0800 (PST)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6? (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
        by smtp.gmail.com with ESMTPSA id 27-20020a170906301b00b00782539a02absm1033118ejz.194.2022.12.16.08.52.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 08:52:46 -0800 (PST)
Message-ID: <a01dfb96-9d70-e3ce-36e7-b06b8fe60911@redhat.com>
Date:   Fri, 16 Dec 2022 17:52:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 06/11] v4l: subdev: Make the v4l2-subdev core code
 enable/disable the privacy LED if present
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-gpio@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Andy Yeh <andy.yeh@intel.com>, Yao Hao <yao.hao@intel.com>,
        linux-media@vger.kernel.org
References: <20221216113013.126881-1-hdegoede@redhat.com>
 <20221216113013.126881-7-hdegoede@redhat.com>
 <Y5x5D4kTnEpcHzsT@pendragon.ideasonboard.com>
 <c0fc35eb-9b26-c1c6-3f85-234acbee0ff8@redhat.com>
 <Y5ygegq9zrHNIlFM@pendragon.ideasonboard.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y5ygegq9zrHNIlFM@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 12/16/22 17:44, Laurent Pinchart wrote:
> Hi Hans,
> 
> On Fri, Dec 16, 2022 at 04:45:29PM +0100, Hans de Goede wrote:
>> On 12/16/22 14:56, Laurent Pinchart wrote:
>>> On Fri, Dec 16, 2022 at 12:30:08PM +0100, Hans de Goede wrote:
>>>> Extend the call_s_stream() wrapper to enable/disable sensor privacy LEDs
>>>> for sensors with a privacy LED, rather then having to duplicate this code
>>>> in all the sensor drivers.
>>>>
>>>> Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>> ---
>>>>  drivers/media/v4l2-core/v4l2-subdev.c | 40 +++++++++++++++++++++++++++
>>>>  include/media/v4l2-subdev.h           |  3 ++
>>>>  2 files changed, 43 insertions(+)
>>>>
>>>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
>>>> index 4988a25bd8f4..7344f6cd58b7 100644
>>>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>>>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>>>> @@ -318,10 +318,44 @@ static int call_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad,
>>>>  	       sd->ops->pad->get_mbus_config(sd, pad, config);
>>>>  }
>>>>  
>>>> +#if IS_REACHABLE(CONFIG_LEDS_CLASS)
>>>> +#include <linux/leds.h>
>>>
>>> Can this be moved to the top of the file ? It doesn't have to be
>>> conditionally compiled there.
>>
>> You mean just the #include right? Ack to that.
> 
> Yes, that's what I meant.
> 
>>>> +
>>>> +static void call_s_stream_update_pled(struct v4l2_subdev *sd, int enable)
>>>> +{
>>>> +	if (!sd->dev)
>>>> +		return;
>>>> +
>>>> +	/* Try to get privacy-led once, at first s_stream() */
>>>> +	if (!sd->privacy_led)
>>>> +		sd->privacy_led = led_get(sd->dev, "privacy-led");
>>>
>>> I'm not sure I like this much. If the LED provider isn't available
>>> (yet), the LED will stay off. That's a privacy concern.
>>
>> At first I tried to put the led_get() inside v4l2_async_register_subdev_sensor(),
>> which could then return an error like -EPROBE_DEFER if the led_get()
>> fails (and nicely limits the led_get() to sensors).
>>
>> The problem which I hit is that v4l2-fwnode.c is build according to
>> CONFIG_V4L2_FWNODE where as v4l2-subdev.c is build according to
>> CONFIG_VIDEO_DEV 
>>
>> And e.g. CONFIG_VIDEO_DEV could be builtin while CONFIG_V4L2_FWNODE
>> could be a module and then having the #if IS_REACHABLE(CONFIG_LEDS_CLASS)
>> spread over the 2 could result in different answers in the different
>> files ...
>>
>> One solution here could be to change CONFIG_V4L2_FWNODE and V4L2_ASYNC
>> to bools and link the (quite small) objects for these 2 into videodev.ko:
>>
>> videodev-$(CONFIG_V4L2_FWNODE) += v4l2-fwnode.o
>> videodev-$(CONFIG_V4L2_ASYNC) += v4l2-async.o
> 
> There's a long overdue simplification of Kconfig symbols in the
> subsystem. Another option would be to compile both in a single module,
> as they're often used together. I'll let Sakari chime in, I don't have a
> strong preference.
> 
>>>> +
>>>> +	if (IS_ERR(sd->privacy_led))
>>>> +		return;
>>>> +
>>>> +	mutex_lock(&sd->privacy_led->led_access);
>>>> +
>>>> +	if (enable) {
>>>> +		led_sysfs_disable(sd->privacy_led);
>>>> +		led_trigger_remove(sd->privacy_led);
>>>> +		led_set_brightness(sd->privacy_led, sd->privacy_led->max_brightness);
>>>> +	} else {
>>>> +		led_set_brightness(sd->privacy_led, 0);
>>>> +		led_sysfs_enable(sd->privacy_led);
>>>
>>> I don't think you should reenable control through sysfs here. I don't
>>> really see a use case, and you've removed the trigger anyway, so the
>>> behaviour would be quite inconsistent.
>>
>> Hmm, I thought this was a good compromise, this way the LED
>> can be used for other purposes when the sensor is off if users
>> want to.
>>
>> Right if users want to use a trigger then they would need
>> to re-attach the trigger after using the camera.
>>
>> But this way at least they can use the LED for other purposes
>> which since many users don't use their webcam that often
>> might be interesting for some users ...
> 
> If the privacy LED starts being used for other purposes, users may get
> used to seeing it on at random times, which defeats the point of the
> privacy LED in the first place.

Using it for other purposes it not something which I expect
e.g. distros to do OOTB, so normal users won't see the LED used
in another way.  But it may be useful for tinkerers who do this
as a local modification, in which case they know the LED
behavior.

With that said I'm fine with just disabling the sysfs interface
once at probe / register time.

Regards,

Hans


> 
>> And this is consistent with how flash LEDs are handled.
>>
>>> Also, I think it would be better if the LED device was marked as "no
>>> sysfs" when it is registered.
>>
>> If we decide to permanently disallow userspace access then
>> yes this is an option. Or maybe better (to keep the LED
>> drivers generic), do the disable directly after the led_get() ?
> 
> I suppose the small race condition wouldn't be a big issue, but if we
> decide that the privacy LED should really not be used for user purposes,
> then I'd still rather disable userspace access when registering the LED.
> 
>>>> +	}
>>>> +
>>>> +	mutex_unlock(&sd->privacy_led->led_access);
>>>> +}
>>>> +#else
>>>> +static void call_s_stream_update_pled(struct v4l2_subdev *sd, int enable) {}
>>>> +#endif
>>>> +
>>>>  static int call_s_stream(struct v4l2_subdev *sd, int enable)
>>>>  {
>>>>  	int ret;
>>>>  
>>>> +	call_s_stream_update_pled(sd, enable);
>>>> +
>>>>  	ret = sd->ops->video->s_stream(sd, enable);
>>>>  
>>>>  	if (!enable && ret < 0) {
>>>
>>> You need to turn the LED off when enabling if .s_stream() fails.
>>
>> Ack.
> 

