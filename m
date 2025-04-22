Return-Path: <linux-gpio+bounces-19154-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C036A97881
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Apr 2025 23:28:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA3971768D6
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Apr 2025 21:28:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 863B92D92CF;
	Tue, 22 Apr 2025 21:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Op/zgiNa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649DE2989AD;
	Tue, 22 Apr 2025 21:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745357311; cv=none; b=dFWMamI+2GoaM5baUkX5AkeGsB9W77mdkyA2d3wfbz81Kl+vuJmyN8MtNtD6mveCL3T2xrJrhoLRrK5HhIygRWPIQ3P8NOVBUJTKU//WVO1xOG9EP+C8/46qzj8HkIYCj/AZeY9FWXd05iE2x3OAzDPuwLSklBhvdZLvljjEBBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745357311; c=relaxed/simple;
	bh=Pt+d2OB6y6KnV8YoFpG15PScJZHceb8lmSxfo80k9wQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oAEhSNJJ25N6YWSmrCidhCe/x65jr9kvHYOO1Rj27eFK8hGZMmfaQYGAPTuU0yNu7DcLxdsbCTuF5hri69IJAOtBEpTaY3UKMfYHTtJHjhCG4MjDe2FMBtfGOWaRZ7IhwvaL15zeyj/OkVhR6l9jrbeGw6VBseOkZyukd/vWNCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Op/zgiNa; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4D69A2AC;
	Tue, 22 Apr 2025 23:28:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745357306;
	bh=Pt+d2OB6y6KnV8YoFpG15PScJZHceb8lmSxfo80k9wQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Op/zgiNazUeBWHVM9Nf3Viqktcp0WxcuODyKPpzMybHpCqbktS+i/nkBPysDotr5+
	 sFv977ITNdSvsgcyYyinbNzkKFokd6UKyU9Aa8YO3+S0G9AUUtgfK2je2OSDYilYFb
	 gX7DeCxpo8o5qb9IUEh3ppNZorcU3z9Qv88enrX4=
Date: Wed, 23 Apr 2025 00:28:24 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 6/8] media: uvcvideo: Factor out gpio functions to its
 own file
Message-ID: <20250422212824.GQ17813@pendragon.ideasonboard.com>
References: <20250403-uvc-orientation-v1-0-1a0cc595a62d@chromium.org>
 <20250403-uvc-orientation-v1-6-1a0cc595a62d@chromium.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250403-uvc-orientation-v1-6-1a0cc595a62d@chromium.org>

Hi Ricardo,

Thank you for the patch.

Hans raised an issue on "[PATCH v3 2/8] media: uvcvideo: Factor out gpio
functions to its own file" (part of "[PATCH v3 0/8] media: uvcvideo:
Implement the Privacy GPIO as a evdev"), asking if GPIO handling should
still use a uvc_entity if it moves to a evdev. There are implications on
this series too. Unless I'm mistaken, I haven't seen a reply from you to
my last e-mail. Can we please first finish that discussion ?

On Thu, Apr 03, 2025 at 07:16:17PM +0000, Ricardo Ribalda wrote:
> This is just a refactor patch, no new functionality is added.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/Makefile     |   3 +-
>  drivers/media/usb/uvc/uvc_driver.c | 121 +-----------------------------------
>  drivers/media/usb/uvc/uvc_gpio.c   | 123 +++++++++++++++++++++++++++++++++++++
>  drivers/media/usb/uvc/uvcvideo.h   |   6 ++
>  4 files changed, 133 insertions(+), 120 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/Makefile b/drivers/media/usb/uvc/Makefile
> index 4f9eee4f81ab6436a8b90324a688a149b2c3bcd1..85514b6e538fbb8284e574ca14700f2d749e1a2e 100644
> --- a/drivers/media/usb/uvc/Makefile
> +++ b/drivers/media/usb/uvc/Makefile
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  uvcvideo-objs  := uvc_driver.o uvc_queue.o uvc_v4l2.o uvc_video.o uvc_ctrl.o \
> -		  uvc_status.o uvc_isight.o uvc_debugfs.o uvc_metadata.o
> +		  uvc_status.o uvc_isight.o uvc_debugfs.o uvc_metadata.o \
> +		  uvc_gpio.o
>  ifeq ($(CONFIG_MEDIA_CONTROLLER),y)
>  uvcvideo-objs  += uvc_entity.o
>  endif
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index da24a655ab68cc0957762f2b67387677c22224d1..b52e1ff401e24f69b867b5e975cda4260463e760 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -8,7 +8,6 @@
>  
>  #include <linux/atomic.h>
>  #include <linux/bits.h>
> -#include <linux/gpio/consumer.h>
>  #include <linux/kernel.h>
>  #include <linux/list.h>
>  #include <linux/module.h>
> @@ -792,8 +791,8 @@ static const u8 uvc_media_transport_input_guid[16] =
>  	UVC_GUID_UVC_MEDIA_TRANSPORT_INPUT;
>  static const u8 uvc_processing_guid[16] = UVC_GUID_UVC_PROCESSING;
>  
> -static struct uvc_entity *uvc_alloc_entity(u16 type, u16 id,
> -		unsigned int num_pads, unsigned int extra_size)
> +struct uvc_entity *uvc_alloc_entity(u16 type, u16 id, unsigned int num_pads,
> +				    unsigned int extra_size)
>  {
>  	struct uvc_entity *entity;
>  	unsigned int num_inputs;
> @@ -1242,122 +1241,6 @@ static int uvc_parse_control(struct uvc_device *dev)
>  	return 0;
>  }
>  
> -/* -----------------------------------------------------------------------------
> - * Privacy GPIO
> - */
> -
> -static void uvc_gpio_event(struct uvc_device *dev)
> -{
> -	struct uvc_entity *unit = dev->gpio_unit;
> -	struct uvc_video_chain *chain;
> -	u8 new_val;
> -
> -	if (!unit)
> -		return;
> -
> -	new_val = gpiod_get_value_cansleep(unit->gpio.gpio_privacy);
> -
> -	/* GPIO entities are always on the first chain. */
> -	chain = list_first_entry(&dev->chains, struct uvc_video_chain, list);
> -	uvc_ctrl_status_event(chain, unit->controls, &new_val);
> -}
> -
> -static int uvc_gpio_get_cur(struct uvc_device *dev, struct uvc_entity *entity,
> -			    u8 cs, void *data, u16 size)
> -{
> -	if (cs != UVC_CT_PRIVACY_CONTROL || size < 1)
> -		return -EINVAL;
> -
> -	*(u8 *)data = gpiod_get_value_cansleep(entity->gpio.gpio_privacy);
> -
> -	return 0;
> -}
> -
> -static int uvc_gpio_get_info(struct uvc_device *dev, struct uvc_entity *entity,
> -			     u8 cs, u8 *caps)
> -{
> -	if (cs != UVC_CT_PRIVACY_CONTROL)
> -		return -EINVAL;
> -
> -	*caps = UVC_CONTROL_CAP_GET | UVC_CONTROL_CAP_AUTOUPDATE;
> -	return 0;
> -}
> -
> -static irqreturn_t uvc_gpio_irq(int irq, void *data)
> -{
> -	struct uvc_device *dev = data;
> -
> -	uvc_gpio_event(dev);
> -	return IRQ_HANDLED;
> -}
> -
> -static int uvc_gpio_parse(struct uvc_device *dev)
> -{
> -	struct uvc_entity *unit;
> -	struct gpio_desc *gpio_privacy;
> -	int irq;
> -
> -	gpio_privacy = devm_gpiod_get_optional(&dev->intf->dev, "privacy",
> -					       GPIOD_IN);
> -	if (!gpio_privacy)
> -		return 0;
> -
> -	if (IS_ERR(gpio_privacy))
> -		return dev_err_probe(&dev->intf->dev,
> -				     PTR_ERR(gpio_privacy),
> -				     "Can't get privacy GPIO\n");
> -
> -	irq = gpiod_to_irq(gpio_privacy);
> -	if (irq < 0)
> -		return dev_err_probe(&dev->intf->dev, irq,
> -				     "No IRQ for privacy GPIO\n");
> -
> -	unit = uvc_alloc_entity(UVC_EXT_GPIO_UNIT, UVC_EXT_GPIO_UNIT_ID, 0, 1);
> -	if (!unit)
> -		return -ENOMEM;
> -
> -	unit->gpio.gpio_privacy = gpio_privacy;
> -	unit->gpio.irq = irq;
> -	unit->gpio.bControlSize = 1;
> -	unit->gpio.bmControls = (u8 *)unit + sizeof(*unit);
> -	unit->gpio.bmControls[0] = 1;
> -	unit->get_cur = uvc_gpio_get_cur;
> -	unit->get_info = uvc_gpio_get_info;
> -	strscpy(unit->name, "GPIO", sizeof(unit->name));
> -
> -	list_add_tail(&unit->list, &dev->entities);
> -
> -	dev->gpio_unit = unit;
> -
> -	return 0;
> -}
> -
> -static int uvc_gpio_init_irq(struct uvc_device *dev)
> -{
> -	struct uvc_entity *unit = dev->gpio_unit;
> -	int ret;
> -
> -	if (!unit || unit->gpio.irq < 0)
> -		return 0;
> -
> -	ret = request_threaded_irq(unit->gpio.irq, NULL, uvc_gpio_irq,
> -				   IRQF_ONESHOT | IRQF_TRIGGER_FALLING |
> -				   IRQF_TRIGGER_RISING,
> -				   "uvc_privacy_gpio", dev);
> -
> -	unit->gpio.initialized = !ret;
> -
> -	return ret;
> -}
> -
> -static void uvc_gpio_deinit(struct uvc_device *dev)
> -{
> -	if (!dev->gpio_unit || !dev->gpio_unit->gpio.initialized)
> -		return;
> -
> -	free_irq(dev->gpio_unit->gpio.irq, dev);
> -}
> -
>  /* ------------------------------------------------------------------------
>   * UVC device scan
>   */
> diff --git a/drivers/media/usb/uvc/uvc_gpio.c b/drivers/media/usb/uvc/uvc_gpio.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..30e3e6dd22cbc9cfee420dde7f7f64dbdce499b9
> --- /dev/null
> +++ b/drivers/media/usb/uvc/uvc_gpio.c
> @@ -0,0 +1,123 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + *      uvc_gpio.c  --  USB Video Class driver
> + *
> + *      Copyright 2025 Google LLC
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/gpio/consumer.h>
> +#include "uvcvideo.h"
> +
> +static void uvc_gpio_event(struct uvc_device *dev)
> +{
> +	struct uvc_entity *unit = dev->gpio_unit;
> +	struct uvc_video_chain *chain;
> +	u8 new_val;
> +
> +	if (!unit)
> +		return;
> +
> +	new_val = gpiod_get_value_cansleep(unit->gpio.gpio_privacy);
> +
> +	/* GPIO entities are always on the first chain. */
> +	chain = list_first_entry(&dev->chains, struct uvc_video_chain, list);
> +	uvc_ctrl_status_event(chain, unit->controls, &new_val);
> +}
> +
> +static int uvc_gpio_get_cur(struct uvc_device *dev, struct uvc_entity *entity,
> +			    u8 cs, void *data, u16 size)
> +{
> +	if (cs != UVC_CT_PRIVACY_CONTROL || size < 1)
> +		return -EINVAL;
> +
> +	*(u8 *)data = gpiod_get_value_cansleep(entity->gpio.gpio_privacy);
> +
> +	return 0;
> +}
> +
> +static int uvc_gpio_get_info(struct uvc_device *dev, struct uvc_entity *entity,
> +			     u8 cs, u8 *caps)
> +{
> +	if (cs != UVC_CT_PRIVACY_CONTROL)
> +		return -EINVAL;
> +
> +	*caps = UVC_CONTROL_CAP_GET | UVC_CONTROL_CAP_AUTOUPDATE;
> +	return 0;
> +}
> +
> +static irqreturn_t uvc_gpio_irq(int irq, void *data)
> +{
> +	struct uvc_device *dev = data;
> +
> +	uvc_gpio_event(dev);
> +	return IRQ_HANDLED;
> +}
> +
> +int uvc_gpio_parse(struct uvc_device *dev)
> +{
> +	struct uvc_entity *unit;
> +	struct gpio_desc *gpio_privacy;
> +	int irq;
> +
> +	gpio_privacy = devm_gpiod_get_optional(&dev->intf->dev, "privacy",
> +					       GPIOD_IN);
> +	if (!gpio_privacy)
> +		return 0;
> +
> +	if (IS_ERR(gpio_privacy))
> +		return dev_err_probe(&dev->intf->dev,
> +				     PTR_ERR(gpio_privacy),
> +				     "Can't get privacy GPIO\n");
> +
> +	irq = gpiod_to_irq(gpio_privacy);
> +	if (irq < 0)
> +		return dev_err_probe(&dev->intf->dev, irq,
> +				     "No IRQ for privacy GPIO\n");
> +
> +	unit = uvc_alloc_entity(UVC_EXT_GPIO_UNIT, UVC_EXT_GPIO_UNIT_ID, 0, 1);
> +	if (!unit)
> +		return -ENOMEM;
> +
> +	unit->gpio.gpio_privacy = gpio_privacy;
> +	unit->gpio.irq = irq;
> +	unit->gpio.bControlSize = 1;
> +	unit->gpio.bmControls = (u8 *)unit + sizeof(*unit);
> +	unit->gpio.bmControls[0] = 1;
> +	unit->get_cur = uvc_gpio_get_cur;
> +	unit->get_info = uvc_gpio_get_info;
> +	strscpy(unit->name, "GPIO", sizeof(unit->name));
> +
> +	list_add_tail(&unit->list, &dev->entities);
> +
> +	dev->gpio_unit = unit;
> +
> +	return 0;
> +}
> +
> +int uvc_gpio_init_irq(struct uvc_device *dev)
> +{
> +	struct uvc_entity *unit = dev->gpio_unit;
> +	int ret;
> +
> +	if (!unit || unit->gpio.irq < 0)
> +		return 0;
> +
> +	ret = request_threaded_irq(unit->gpio.irq, NULL, uvc_gpio_irq,
> +				   IRQF_ONESHOT | IRQF_TRIGGER_FALLING |
> +				   IRQF_TRIGGER_RISING,
> +				   "uvc_privacy_gpio", dev);
> +
> +	unit->gpio.initialized = !ret;
> +
> +	return ret;
> +}
> +
> +void uvc_gpio_deinit(struct uvc_device *dev)
> +{
> +	if (!dev->gpio_unit || !dev->gpio_unit->gpio.initialized)
> +		return;
> +
> +	free_irq(dev->gpio_unit->gpio.irq, dev);
> +}
> +
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index b4ee701835fc016474d2cd2a0b67b2aa915c1c60..aef96b96499ce09ffa286c51793482afd9832097 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -683,6 +683,8 @@ do {									\
>   */
>  
>  struct uvc_entity *uvc_entity_by_id(struct uvc_device *dev, int id);
> +struct uvc_entity *uvc_alloc_entity(u16 type, u16 id, unsigned int num_pads,
> +				    unsigned int extra_size);
>  
>  /* Video buffers queue management. */
>  int uvc_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type);
> @@ -829,4 +831,8 @@ void uvc_debugfs_cleanup_stream(struct uvc_streaming *stream);
>  size_t uvc_video_stats_dump(struct uvc_streaming *stream, char *buf,
>  			    size_t size);
>  
> +/* gpio */
> +int uvc_gpio_parse(struct uvc_device *dev);
> +int uvc_gpio_init_irq(struct uvc_device *dev);
> +void uvc_gpio_deinit(struct uvc_device *dev);
>  #endif
> 

-- 
Regards,

Laurent Pinchart

