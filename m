Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C43464EF97
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Dec 2022 17:45:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230462AbiLPQpA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Dec 2022 11:45:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231366AbiLPQou (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Dec 2022 11:44:50 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFCDDBB;
        Fri, 16 Dec 2022 08:44:48 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B0A48A31;
        Fri, 16 Dec 2022 17:44:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671209086;
        bh=sj9dmbw9ICtXedrShhJNo50U1BdPZxgShqW1TYdLY54=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=leleJKtBkxXGoPPleI38QY15WOmGZekccQ/UI5YGGIwDhTJ7qBmAlvkoRigN4P8Ti
         pAIVW4yJMVsaQNYhyBP7uckR82iVZ8hw9IwSAa4J/nGlDjIFmQiFDt5HUdkH2nOwVk
         BP/kOmcffS0OmXUAnu04/muVRrsuGJJt8NGdNt5o=
Date:   Fri, 16 Dec 2022 18:44:42 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans de Goede <hdegoede@redhat.com>
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
Subject: Re: [PATCH v3 06/11] v4l: subdev: Make the v4l2-subdev core code
 enable/disable the privacy LED if present
Message-ID: <Y5ygegq9zrHNIlFM@pendragon.ideasonboard.com>
References: <20221216113013.126881-1-hdegoede@redhat.com>
 <20221216113013.126881-7-hdegoede@redhat.com>
 <Y5x5D4kTnEpcHzsT@pendragon.ideasonboard.com>
 <c0fc35eb-9b26-c1c6-3f85-234acbee0ff8@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c0fc35eb-9b26-c1c6-3f85-234acbee0ff8@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Hans,

On Fri, Dec 16, 2022 at 04:45:29PM +0100, Hans de Goede wrote:
> On 12/16/22 14:56, Laurent Pinchart wrote:
> > On Fri, Dec 16, 2022 at 12:30:08PM +0100, Hans de Goede wrote:
> >> Extend the call_s_stream() wrapper to enable/disable sensor privacy LEDs
> >> for sensors with a privacy LED, rather then having to duplicate this code
> >> in all the sensor drivers.
> >>
> >> Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >> ---
> >>  drivers/media/v4l2-core/v4l2-subdev.c | 40 +++++++++++++++++++++++++++
> >>  include/media/v4l2-subdev.h           |  3 ++
> >>  2 files changed, 43 insertions(+)
> >>
> >> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> >> index 4988a25bd8f4..7344f6cd58b7 100644
> >> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> >> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> >> @@ -318,10 +318,44 @@ static int call_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad,
> >>  	       sd->ops->pad->get_mbus_config(sd, pad, config);
> >>  }
> >>  
> >> +#if IS_REACHABLE(CONFIG_LEDS_CLASS)
> >> +#include <linux/leds.h>
> > 
> > Can this be moved to the top of the file ? It doesn't have to be
> > conditionally compiled there.
> 
> You mean just the #include right? Ack to that.

Yes, that's what I meant.

> >> +
> >> +static void call_s_stream_update_pled(struct v4l2_subdev *sd, int enable)
> >> +{
> >> +	if (!sd->dev)
> >> +		return;
> >> +
> >> +	/* Try to get privacy-led once, at first s_stream() */
> >> +	if (!sd->privacy_led)
> >> +		sd->privacy_led = led_get(sd->dev, "privacy-led");
> > 
> > I'm not sure I like this much. If the LED provider isn't available
> > (yet), the LED will stay off. That's a privacy concern.
> 
> At first I tried to put the led_get() inside v4l2_async_register_subdev_sensor(),
> which could then return an error like -EPROBE_DEFER if the led_get()
> fails (and nicely limits the led_get() to sensors).
> 
> The problem which I hit is that v4l2-fwnode.c is build according to
> CONFIG_V4L2_FWNODE where as v4l2-subdev.c is build according to
> CONFIG_VIDEO_DEV 
> 
> And e.g. CONFIG_VIDEO_DEV could be builtin while CONFIG_V4L2_FWNODE
> could be a module and then having the #if IS_REACHABLE(CONFIG_LEDS_CLASS)
> spread over the 2 could result in different answers in the different
> files ...
> 
> One solution here could be to change CONFIG_V4L2_FWNODE and V4L2_ASYNC
> to bools and link the (quite small) objects for these 2 into videodev.ko:
> 
> videodev-$(CONFIG_V4L2_FWNODE) += v4l2-fwnode.o
> videodev-$(CONFIG_V4L2_ASYNC) += v4l2-async.o

There's a long overdue simplification of Kconfig symbols in the
subsystem. Another option would be to compile both in a single module,
as they're often used together. I'll let Sakari chime in, I don't have a
strong preference.

> >> +
> >> +	if (IS_ERR(sd->privacy_led))
> >> +		return;
> >> +
> >> +	mutex_lock(&sd->privacy_led->led_access);
> >> +
> >> +	if (enable) {
> >> +		led_sysfs_disable(sd->privacy_led);
> >> +		led_trigger_remove(sd->privacy_led);
> >> +		led_set_brightness(sd->privacy_led, sd->privacy_led->max_brightness);
> >> +	} else {
> >> +		led_set_brightness(sd->privacy_led, 0);
> >> +		led_sysfs_enable(sd->privacy_led);
> > 
> > I don't think you should reenable control through sysfs here. I don't
> > really see a use case, and you've removed the trigger anyway, so the
> > behaviour would be quite inconsistent.
> 
> Hmm, I thought this was a good compromise, this way the LED
> can be used for other purposes when the sensor is off if users
> want to.
> 
> Right if users want to use a trigger then they would need
> to re-attach the trigger after using the camera.
> 
> But this way at least they can use the LED for other purposes
> which since many users don't use their webcam that often
> might be interesting for some users ...

If the privacy LED starts being used for other purposes, users may get
used to seeing it on at random times, which defeats the point of the
privacy LED in the first place.

> And this is consistent with how flash LEDs are handled.
> 
> > Also, I think it would be better if the LED device was marked as "no
> > sysfs" when it is registered.
> 
> If we decide to permanently disallow userspace access then
> yes this is an option. Or maybe better (to keep the LED
> drivers generic), do the disable directly after the led_get() ?

I suppose the small race condition wouldn't be a big issue, but if we
decide that the privacy LED should really not be used for user purposes,
then I'd still rather disable userspace access when registering the LED.

> >> +	}
> >> +
> >> +	mutex_unlock(&sd->privacy_led->led_access);
> >> +}
> >> +#else
> >> +static void call_s_stream_update_pled(struct v4l2_subdev *sd, int enable) {}
> >> +#endif
> >> +
> >>  static int call_s_stream(struct v4l2_subdev *sd, int enable)
> >>  {
> >>  	int ret;
> >>  
> >> +	call_s_stream_update_pled(sd, enable);
> >> +
> >>  	ret = sd->ops->video->s_stream(sd, enable);
> >>  
> >>  	if (!enable && ret < 0) {
> > 
> > You need to turn the LED off when enabling if .s_stream() fails.
> 
> Ack.

-- 
Regards,

Laurent Pinchart
