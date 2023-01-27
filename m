Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20F3C67E1A7
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jan 2023 11:30:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231659AbjA0Kax (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Jan 2023 05:30:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231652AbjA0Kav (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Jan 2023 05:30:51 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04E60303F1
        for <linux-gpio@vger.kernel.org>; Fri, 27 Jan 2023 02:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674815402;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=miXkr3yovZC21nPb2F6+DQmin4f6UAgSFtTg/u4u55s=;
        b=Ojm5wOF81ESPUKKuMCwQXVbJclOuZzL1ZbSIRDAaGMfUrLX7HRhtdaeDlTuUT1wRgDVSF9
        PV2xkTL8QSOCXaXGQgzJ6QUzLWBfVEd4nWIxMnL4KaN8lkr4Cn4/T9Odey/of09pCpD2oW
        fshsK7HtOLMEWtvFwBIfz9OqypOdxpc=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-198-dBmpHK1APpKyYS6sAHXAKA-1; Fri, 27 Jan 2023 05:30:00 -0500
X-MC-Unique: dBmpHK1APpKyYS6sAHXAKA-1
Received: by mail-ed1-f72.google.com with SMTP id v8-20020a056402348800b0049e1913bd43so3328720edc.20
        for <linux-gpio@vger.kernel.org>; Fri, 27 Jan 2023 02:30:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=miXkr3yovZC21nPb2F6+DQmin4f6UAgSFtTg/u4u55s=;
        b=ZM68zAO09WQ7v6f3MNFwUiOiHekab9AK/STHkXQbVsOe07jHxxXJA0qH2UkTXQwVgz
         zH0ZE2E9PpY7ig/yVU2xK+PbrHA7YPl3AKiiWnDGb0D1ly1rKK6pPTfS/g6YTvUKsyoi
         3WeC4N8u8ItVXb79bngoxywsD9xdG91f2XoPO8uFrRNhLjNwyULMiQ42qK670B/+2vuM
         wTF2mp7FNf53lYRl5a/GB+1O0UXVD4yIOOAjTdmHy7fgv1Y69UGGcFoyHuFF6GP+papz
         EwAsuJp1l7ir59ed5m376GDl6M5lMnkB4x5S3+L4P8ksjNdKOGe4qBh8tuEMYpimL5lw
         Kd/A==
X-Gm-Message-State: AFqh2kr1r5Zuj2c8BP3o4PlLTCA9lJN2yLPY6yYUglk+1pV6oqZmDr3o
        wpUqSJCQOL5mvY3w7A1sAWMOgP1rqYbkeJbdLpteWTnX8HzdgcRJNMuFqBmD76M/4l4/VJylCP7
        JntlV0Gi8D9vs6Wo6vZtCuA==
X-Received: by 2002:a17:907:7f12:b0:7c1:9eb:845b with SMTP id qf18-20020a1709077f1200b007c109eb845bmr67238754ejc.16.1674815399530;
        Fri, 27 Jan 2023 02:29:59 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuzyQrTD3dqej2MVPnY3ccbE7JDKPp4j+9aQCkGOpgn6a51CB/LmnLf0aOYkbtDz+HMutse4Q==
X-Received: by 2002:a17:907:7f12:b0:7c1:9eb:845b with SMTP id qf18-20020a1709077f1200b007c109eb845bmr67238730ejc.16.1674815399304;
        Fri, 27 Jan 2023 02:29:59 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ss24-20020a170907039800b00878706e35acsm1976876ejb.95.2023.01.27.02.29.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 02:29:58 -0800 (PST)
Message-ID: <cd2ca584-6914-0882-4cfc-c5edee0adf54@redhat.com>
Date:   Fri, 27 Jan 2023 11:29:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 07/11] media: v4l2-core: Make the v4l2-core code
 enable/disable the privacy LED if present
Content-Language: en-US, nl
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-gpio@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Andy Yeh <andy.yeh@intel.com>, Hao Yao <hao.yao@intel.com>,
        linux-media@vger.kernel.org
References: <20230120114524.408368-1-hdegoede@redhat.com>
 <20230120114524.408368-8-hdegoede@redhat.com>
 <Y8qOYlAm4flqe1tp@paasikivi.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y8qOYlAm4flqe1tp@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Sakari,

On 1/20/23 13:51, Sakari Ailus wrote:
> Hi Hans,
> 
> On Fri, Jan 20, 2023 at 12:45:20PM +0100, Hans de Goede wrote:
>> Make v4l2_async_register_subdev_sensor() try to get a privacy LED
>> associated with the sensor and extend the call_s_stream() wrapper to
>> enable/disable the privacy LED if found.
>>
>> This makes the core handle privacy LED control, rather then having to
>> duplicate this code in all the sensor drivers.
>>
>> Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>> Changes in v4 (requested by Laurent Pinchart):
>> - Move the led_get() call to v4l2_async_register_subdev_sensor() and
>>   make errors other then -ENOENT fail the register() call.
>> - Move the led_disable_sysfs() call to be done at led_get() time, instead
>>   of only disabling the sysfs interface when the sensor is streaming.
>> ---
>>  drivers/media/v4l2-core/v4l2-fwnode.c | 15 +++++++++++++++
>>  drivers/media/v4l2-core/v4l2-subdev.c | 18 ++++++++++++++++++
>>  include/media/v4l2-subdev.h           |  3 +++
>>  3 files changed, 36 insertions(+)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
>> index c8a2264262bc..cfac1e2ae501 100644
>> --- a/drivers/media/v4l2-core/v4l2-fwnode.c
>> +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
>> @@ -16,6 +16,7 @@
>>   */
>>  #include <linux/acpi.h>
>>  #include <linux/kernel.h>
>> +#include <linux/leds.h>
>>  #include <linux/mm.h>
>>  #include <linux/of.h>
>>  #include <linux/property.h>
>> @@ -1295,6 +1296,20 @@ int v4l2_async_register_subdev_sensor(struct v4l2_subdev *sd)
>>  	if (WARN_ON(!sd->dev))
>>  		return -ENODEV;
>>  
>> +#if IS_REACHABLE(CONFIG_LEDS_CLASS)
>> +	sd->privacy_led = led_get(sd->dev, "privacy-led");
>> +	if (IS_ERR(sd->privacy_led) && PTR_ERR(sd->privacy_led) != -ENOENT)
>> +		return dev_err_probe(sd->dev, PTR_ERR(sd->privacy_led), "getting privacy LED\n");
>> +
>> +	if (!IS_ERR_OR_NULL(sd->privacy_led)) {
>> +		mutex_lock(&sd->privacy_led->led_access);
>> +		led_sysfs_disable(sd->privacy_led);
>> +		led_trigger_remove(sd->privacy_led);
>> +		led_set_brightness(sd->privacy_led, 0);
>> +		mutex_unlock(&sd->privacy_led->led_access);
>> +	}
>> +#endif
>> +
>>  	notifier = kzalloc(sizeof(*notifier), GFP_KERNEL);
>>  	if (!notifier)
>>  		return -ENOMEM;
>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
>> index 4988a25bd8f4..f33e943aab3f 100644
>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>> @@ -9,6 +9,7 @@
>>   */
>>  
>>  #include <linux/ioctl.h>
>> +#include <linux/leds.h>
>>  #include <linux/mm.h>
>>  #include <linux/module.h>
>>  #include <linux/slab.h>
>> @@ -322,6 +323,14 @@ static int call_s_stream(struct v4l2_subdev *sd, int enable)
>>  {
>>  	int ret;
>>  
>> +#if IS_REACHABLE(CONFIG_LEDS_CLASS)
>> +	if (!IS_ERR_OR_NULL(sd->privacy_led)) {
>> +		if (enable)
>> +			led_set_brightness(sd->privacy_led, sd->privacy_led->max_brightness);
>> +		else
>> +			led_set_brightness(sd->privacy_led, 0);
>> +	}
>> +#endif
>>  	ret = sd->ops->video->s_stream(sd, enable);
>>  
>>  	if (!enable && ret < 0) {
>> @@ -1050,6 +1059,14 @@ EXPORT_SYMBOL_GPL(__v4l2_subdev_init_finalize);
>>  
>>  void v4l2_subdev_cleanup(struct v4l2_subdev *sd)
> 
> v4l2_subdev_cleanup() is currently called by drivers using V4L2 subdev
> state at the moment, making it unsuitable for the purpose of releasing the
> privacy led.
> 
> Could you move this to v4l2_async_unregister_subdev() instead?

Good point.

Looking into this also made me realize that I forgot to cleanup
the LED reference (and re-enable sysfs control) in case of
errors in v4l2_async_register_subdev_sensor() after getting it.

Fixing this requires adding a v4l2_subdev_put_privacy_led()
helper. At which point it makes sense to also put the code
to get the led in a v4l2_subdev_get_privacy_led() helper
and then all privacy-led code lives inside a v4l2-subdev.c
removing the need for:

[PATCH v5 06/11] media: v4l2-core: Built async and fwnode code into videodev.ko

all together :)   So I'll drop that from v6 of this series to
make the series simpler.

Regards,

Hans





> 
>>  {
>> +#if IS_REACHABLE(CONFIG_LEDS_CLASS)
>> +	if (!IS_ERR_OR_NULL(sd->privacy_led)) {
>> +		mutex_lock(&sd->privacy_led->led_access);
>> +		led_sysfs_enable(sd->privacy_led);
>> +		mutex_unlock(&sd->privacy_led->led_access);
>> +		led_put(sd->privacy_led);
>> +	}
>> +#endif
>>  	__v4l2_subdev_state_free(sd->active_state);
>>  	sd->active_state = NULL;
>>  }
>> @@ -1090,6 +1107,7 @@ void v4l2_subdev_init(struct v4l2_subdev *sd, const struct v4l2_subdev_ops *ops)
>>  	sd->grp_id = 0;
>>  	sd->dev_priv = NULL;
>>  	sd->host_priv = NULL;
>> +	sd->privacy_led = NULL;
>>  #if defined(CONFIG_MEDIA_CONTROLLER)
>>  	sd->entity.name = sd->name;
>>  	sd->entity.obj_type = MEDIA_ENTITY_TYPE_V4L2_SUBDEV;
>> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
>> index b15fa9930f30..0547313f98cc 100644
>> --- a/include/media/v4l2-subdev.h
>> +++ b/include/media/v4l2-subdev.h
>> @@ -38,6 +38,7 @@ struct v4l2_subdev;
>>  struct v4l2_subdev_fh;
>>  struct tuner_setup;
>>  struct v4l2_mbus_frame_desc;
>> +struct led_classdev;
>>  
>>  /**
>>   * struct v4l2_decode_vbi_line - used to decode_vbi_line
>> @@ -982,6 +983,8 @@ struct v4l2_subdev {
>>  	 * appropriate functions.
>>  	 */
>>  
>> +	struct led_classdev *privacy_led;
>> +
>>  	/*
>>  	 * TODO: active_state should most likely be changed from a pointer to an
>>  	 * embedded field. For the time being it's kept as a pointer to more
> 

