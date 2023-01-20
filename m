Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 359E0675518
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jan 2023 13:58:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230437AbjATM6L (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Jan 2023 07:58:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230424AbjATM6L (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Jan 2023 07:58:11 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D26ECA57A6;
        Fri, 20 Jan 2023 04:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674219489; x=1705755489;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RokbqfGGIiirr07pIn8RB5Ap2jYFpoUIVx6SFqUq2EI=;
  b=Jf0Cc70pdNzkUVDUbx3qHcGRyVGHgg3nizXtSJok3Z8UtAYQJptT3Gql
   u+xUkd8FUWnXUZAYwnTdNh5EikCim9UuuhT0JQXpWMP2KEDLqKJRBKFCC
   0fzxzbDCqXOKptAAY0xaQaG5tQ3NCWHD8hUpl6ZcjMb5E4QXPlI29mqeb
   iqbzsTgKS9lV4K2jIHmGK7Wa/Au685snC/CmPel2cZThQTniYF9LkHRSL
   MVQewSByhnDiKaxLlh/rp+DaQFsRhLhtR9MliAFaUQJj0G2LgQWdGRZFt
   bUhvH5fbcVnj+2z7WO3hHeWQ0iVQuAK8UBrncMaSifkrlsev45BqEHtK0
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="313458770"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; 
   d="scan'208";a="313458770"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 04:58:09 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="660575097"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; 
   d="scan'208";a="660575097"
Received: from turnipsi.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.44])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 04:58:04 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id D147B20397;
        Fri, 20 Jan 2023 14:51:46 +0200 (EET)
Date:   Fri, 20 Jan 2023 12:51:46 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
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
Subject: Re: [PATCH v5 07/11] media: v4l2-core: Make the v4l2-core code
 enable/disable the privacy LED if present
Message-ID: <Y8qOYlAm4flqe1tp@paasikivi.fi.intel.com>
References: <20230120114524.408368-1-hdegoede@redhat.com>
 <20230120114524.408368-8-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230120114524.408368-8-hdegoede@redhat.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Hans,

On Fri, Jan 20, 2023 at 12:45:20PM +0100, Hans de Goede wrote:
> Make v4l2_async_register_subdev_sensor() try to get a privacy LED
> associated with the sensor and extend the call_s_stream() wrapper to
> enable/disable the privacy LED if found.
> 
> This makes the core handle privacy LED control, rather then having to
> duplicate this code in all the sensor drivers.
> 
> Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v4 (requested by Laurent Pinchart):
> - Move the led_get() call to v4l2_async_register_subdev_sensor() and
>   make errors other then -ENOENT fail the register() call.
> - Move the led_disable_sysfs() call to be done at led_get() time, instead
>   of only disabling the sysfs interface when the sensor is streaming.
> ---
>  drivers/media/v4l2-core/v4l2-fwnode.c | 15 +++++++++++++++
>  drivers/media/v4l2-core/v4l2-subdev.c | 18 ++++++++++++++++++
>  include/media/v4l2-subdev.h           |  3 +++
>  3 files changed, 36 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> index c8a2264262bc..cfac1e2ae501 100644
> --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> @@ -16,6 +16,7 @@
>   */
>  #include <linux/acpi.h>
>  #include <linux/kernel.h>
> +#include <linux/leds.h>
>  #include <linux/mm.h>
>  #include <linux/of.h>
>  #include <linux/property.h>
> @@ -1295,6 +1296,20 @@ int v4l2_async_register_subdev_sensor(struct v4l2_subdev *sd)
>  	if (WARN_ON(!sd->dev))
>  		return -ENODEV;
>  
> +#if IS_REACHABLE(CONFIG_LEDS_CLASS)
> +	sd->privacy_led = led_get(sd->dev, "privacy-led");
> +	if (IS_ERR(sd->privacy_led) && PTR_ERR(sd->privacy_led) != -ENOENT)
> +		return dev_err_probe(sd->dev, PTR_ERR(sd->privacy_led), "getting privacy LED\n");
> +
> +	if (!IS_ERR_OR_NULL(sd->privacy_led)) {
> +		mutex_lock(&sd->privacy_led->led_access);
> +		led_sysfs_disable(sd->privacy_led);
> +		led_trigger_remove(sd->privacy_led);
> +		led_set_brightness(sd->privacy_led, 0);
> +		mutex_unlock(&sd->privacy_led->led_access);
> +	}
> +#endif
> +
>  	notifier = kzalloc(sizeof(*notifier), GFP_KERNEL);
>  	if (!notifier)
>  		return -ENOMEM;
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 4988a25bd8f4..f33e943aab3f 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -9,6 +9,7 @@
>   */
>  
>  #include <linux/ioctl.h>
> +#include <linux/leds.h>
>  #include <linux/mm.h>
>  #include <linux/module.h>
>  #include <linux/slab.h>
> @@ -322,6 +323,14 @@ static int call_s_stream(struct v4l2_subdev *sd, int enable)
>  {
>  	int ret;
>  
> +#if IS_REACHABLE(CONFIG_LEDS_CLASS)
> +	if (!IS_ERR_OR_NULL(sd->privacy_led)) {
> +		if (enable)
> +			led_set_brightness(sd->privacy_led, sd->privacy_led->max_brightness);
> +		else
> +			led_set_brightness(sd->privacy_led, 0);
> +	}
> +#endif
>  	ret = sd->ops->video->s_stream(sd, enable);
>  
>  	if (!enable && ret < 0) {
> @@ -1050,6 +1059,14 @@ EXPORT_SYMBOL_GPL(__v4l2_subdev_init_finalize);
>  
>  void v4l2_subdev_cleanup(struct v4l2_subdev *sd)

v4l2_subdev_cleanup() is currently called by drivers using V4L2 subdev
state at the moment, making it unsuitable for the purpose of releasing the
privacy led.

Could you move this to v4l2_async_unregister_subdev() instead?

>  {
> +#if IS_REACHABLE(CONFIG_LEDS_CLASS)
> +	if (!IS_ERR_OR_NULL(sd->privacy_led)) {
> +		mutex_lock(&sd->privacy_led->led_access);
> +		led_sysfs_enable(sd->privacy_led);
> +		mutex_unlock(&sd->privacy_led->led_access);
> +		led_put(sd->privacy_led);
> +	}
> +#endif
>  	__v4l2_subdev_state_free(sd->active_state);
>  	sd->active_state = NULL;
>  }
> @@ -1090,6 +1107,7 @@ void v4l2_subdev_init(struct v4l2_subdev *sd, const struct v4l2_subdev_ops *ops)
>  	sd->grp_id = 0;
>  	sd->dev_priv = NULL;
>  	sd->host_priv = NULL;
> +	sd->privacy_led = NULL;
>  #if defined(CONFIG_MEDIA_CONTROLLER)
>  	sd->entity.name = sd->name;
>  	sd->entity.obj_type = MEDIA_ENTITY_TYPE_V4L2_SUBDEV;
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index b15fa9930f30..0547313f98cc 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -38,6 +38,7 @@ struct v4l2_subdev;
>  struct v4l2_subdev_fh;
>  struct tuner_setup;
>  struct v4l2_mbus_frame_desc;
> +struct led_classdev;
>  
>  /**
>   * struct v4l2_decode_vbi_line - used to decode_vbi_line
> @@ -982,6 +983,8 @@ struct v4l2_subdev {
>  	 * appropriate functions.
>  	 */
>  
> +	struct led_classdev *privacy_led;
> +
>  	/*
>  	 * TODO: active_state should most likely be changed from a pointer to an
>  	 * embedded field. For the time being it's kept as a pointer to more

-- 
Kind regards,

Sakari Ailus
