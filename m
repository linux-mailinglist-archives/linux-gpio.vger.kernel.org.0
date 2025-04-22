Return-Path: <linux-gpio+bounces-19156-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C41A97945
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Apr 2025 23:41:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 605871B654F9
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Apr 2025 21:41:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A262D2D29B9;
	Tue, 22 Apr 2025 21:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LwnNX2Qf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8465829E052;
	Tue, 22 Apr 2025 21:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745358037; cv=none; b=sF0keiw2M3ivhdgU3iIJUuInkPMeWw+gpc+yxaNNdJ4nXE/dwyfdxlq2T9d2FOJa7ukimHSu2fef8yYZPfOm/mLenHXyccTa7V+b9r1hOANHTpHE4WB6ba3baTJVuM/99XGB01kyumlqvLXN9W0wJZO8clljXiOJq0DkkfF3HFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745358037; c=relaxed/simple;
	bh=6/F4hc2QWsQwsZ+VM0E3XfgIOhd7VJb1+cKuwHZNy+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WWp0xCYWZ77Bfxnlv4RBGs5FPGj6JdX+ouFU6UW601uHwghq+2I5grpbhOliR4GDC/q/4vVGwTVMzQbTxDgm1jyPAIgqgzqsMg6FZO3QrlF6F9YubjYUQPkn3Lh7k6eFp9vOo7HVNuLn72JwcrSHWg35qhSZXTTy0bM9EaqU0iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LwnNX2Qf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3BD122AC;
	Tue, 22 Apr 2025 23:40:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745358032;
	bh=6/F4hc2QWsQwsZ+VM0E3XfgIOhd7VJb1+cKuwHZNy+U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LwnNX2QfGi9zl1FOBx5MgIULgjjthd0EcrcTKYkYBMbGpganpdwgNz/+oytXVByBf
	 AweK9pc1QYu3DHW0ZrKiLX0mfHrVSs/kMyfBZiE4MWf4ITUDraI3bKi6aYhSwVqems
	 Va5bEKziFDavV/dPU5opr9UOv8g5P3IQximGTXXc=
Date: Wed, 23 Apr 2025 00:40:30 +0300
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
Subject: Re: [PATCH 7/8] media: uvcvideo: Add support for
 V4L2_CID_CAMERA_ORIENTATION
Message-ID: <20250422214030.GS17813@pendragon.ideasonboard.com>
References: <20250403-uvc-orientation-v1-0-1a0cc595a62d@chromium.org>
 <20250403-uvc-orientation-v1-7-1a0cc595a62d@chromium.org>
 <20250422213236.GR17813@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250422213236.GR17813@pendragon.ideasonboard.com>

On Wed, Apr 23, 2025 at 12:32:37AM +0300, Laurent Pinchart wrote:
> Hi Ricardo,
> 
> Thank you for the patch.
> 
> On Thu, Apr 03, 2025 at 07:16:18PM +0000, Ricardo Ribalda wrote:
> > Fetch the orientation from the fwnode and map it into a control.
> > 
> > The uvc driver does not use the media controller, so we need to create a
> > virtual entity, like we previously did with the external gpio.
> 
> I don't want to create a new entity every time we need to expose a new
> "software" control. If we keep handling GPIO as an entity, can we use it
> to expose all non-UVC controls ? Otherwise, if we have to create a new
> entity here, let's make sure we can reuse it in the future for more
> controls, and name it appropriately.
> 
> This being said, functionally speaking, wouldn't the
> V4L2_CID_CAMERA_ORIENTATION control make more sense on the camera input
> terminal ? Have you considered adding it there ? Or would it be too
> intrusive ?

Scratch the last comment, I was thinking about exposing controls on
subdevs, which we obviously don't do.

> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/Makefile     |  2 +-
> >  drivers/media/usb/uvc/uvc_ctrl.c   | 21 +++++++++++
> >  drivers/media/usb/uvc/uvc_driver.c | 14 ++++++--
> >  drivers/media/usb/uvc/uvc_entity.c |  1 +
> >  drivers/media/usb/uvc/uvc_fwnode.c | 73 ++++++++++++++++++++++++++++++++++++++
> >  drivers/media/usb/uvc/uvcvideo.h   | 15 ++++++++
> >  include/linux/usb/uvc.h            |  3 ++
> >  7 files changed, 125 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/media/usb/uvc/Makefile b/drivers/media/usb/uvc/Makefile
> > index 85514b6e538fbb8284e574ca14700f2d749e1a2e..2a5b76aab756c21011d966f3ce0410ff6b8e5b19 100644
> > --- a/drivers/media/usb/uvc/Makefile
> > +++ b/drivers/media/usb/uvc/Makefile
> > @@ -1,7 +1,7 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >  uvcvideo-objs  := uvc_driver.o uvc_queue.o uvc_v4l2.o uvc_video.o uvc_ctrl.o \
> >  		  uvc_status.o uvc_isight.o uvc_debugfs.o uvc_metadata.o \
> > -		  uvc_gpio.o
> > +		  uvc_gpio.o uvc_fwnode.o
> >  ifeq ($(CONFIG_MEDIA_CONTROLLER),y)
> >  uvcvideo-objs  += uvc_entity.o
> >  endif
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index cbf19aa1d82374a08cf79b6a6787fa348b83523a..df84bf292dcab6b833fbd3c70eccbe9e567ee567 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -376,6 +376,13 @@ static const struct uvc_control_info uvc_ctrls[] = {
> >  				| UVC_CTRL_FLAG_GET_DEF
> >  				| UVC_CTRL_FLAG_AUTO_UPDATE,
> >  	},
> > +	{
> > +		.entity		= UVC_GUID_FWNODE,
> > +		.selector	= 0,
> > +		.index		= 0,
> > +		.size		= 1,
> > +		.flags		= UVC_CTRL_FLAG_GET_CUR,
> > +	},
> >  };
> >  
> >  static const u32 uvc_control_classes[] = {
> > @@ -975,6 +982,17 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
> >  		.data_type	= UVC_CTRL_DATA_TYPE_BITMASK,
> >  		.name		= "Region of Interest Auto Ctrls",
> >  	},
> > +	{
> > +		.id		= V4L2_CID_CAMERA_ORIENTATION,
> > +		.entity		= UVC_GUID_FWNODE,
> > +		.selector	= 0,
> > +		.size		= 8,
> > +		.offset		= 0,
> > +		.v4l2_type	= V4L2_CTRL_TYPE_MENU,
> > +		.data_type	= UVC_CTRL_DATA_TYPE_ENUM,
> > +		.menu_mask	= GENMASK(V4L2_CAMERA_ORIENTATION_EXTERNAL,
> > +					  V4L2_CAMERA_ORIENTATION_FRONT),
> > +	},
> >  };
> >  
> >  /* ------------------------------------------------------------------------
> > @@ -3170,6 +3188,9 @@ static int uvc_ctrl_init_chain(struct uvc_video_chain *chain)
> >  		} else if (UVC_ENTITY_TYPE(entity) == UVC_EXT_GPIO_UNIT) {
> >  			bmControls = entity->gpio.bmControls;
> >  			bControlSize = entity->gpio.bControlSize;
> > +		} else if (UVC_ENTITY_TYPE(entity) == UVC_FWNODE_UNIT) {
> > +			bmControls = entity->fwnode.bmControls;
> > +			bControlSize = entity->fwnode.bControlSize;
> >  		}
> >  
> >  		/* Remove bogus/blacklisted controls */
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index b52e1ff401e24f69b867b5e975cda4260463e760..9a8e5d94b3eba09e1ee1be20bad5b016b6def915 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -1752,11 +1752,15 @@ static int uvc_scan_device(struct uvc_device *dev)
> >  		return -1;
> >  	}
> >  
> > -	/* Add GPIO entity to the first chain. */
> > -	if (dev->gpio_unit) {
> > +	/* Add virtual entities to the first chain. */
> > +	if (dev->gpio_unit || dev->fwnode_unit) {
> >  		chain = list_first_entry(&dev->chains,
> >  					 struct uvc_video_chain, list);
> > -		list_add_tail(&dev->gpio_unit->chain, &chain->entities);
> > +		if (dev->gpio_unit)
> > +			list_add_tail(&dev->gpio_unit->chain, &chain->entities);
> > +		if (dev->fwnode_unit)
> > +			list_add_tail(&dev->fwnode_unit->chain,
> > +				      &chain->entities);
> >  	}
> >  
> >  	return 0;
> > @@ -2132,6 +2136,10 @@ static int uvc_probe(struct usb_interface *intf,
> >  	if (ret < 0)
> >  		goto error;
> >  
> > +	ret = uvc_fwnode_parse(dev);
> > +	if (ret < 0)
> > +		goto error;
> > +
> >  	dev_info(&dev->udev->dev, "Found UVC %u.%02x device %s (%04x:%04x)\n",
> >  		 dev->uvc_version >> 8, dev->uvc_version & 0xff,
> >  		 udev->product ? udev->product : "<unnamed>",
> > diff --git a/drivers/media/usb/uvc/uvc_entity.c b/drivers/media/usb/uvc/uvc_entity.c
> > index cc68dd24eb42dce5b2846ca52a8dfa499c8aed96..01eeba2f049e9ebb25e091340a133656acbf28ca 100644
> > --- a/drivers/media/usb/uvc/uvc_entity.c
> > +++ b/drivers/media/usb/uvc/uvc_entity.c
> > @@ -106,6 +106,7 @@ static int uvc_mc_init_entity(struct uvc_video_chain *chain,
> >  		case UVC_OTT_MEDIA_TRANSPORT_OUTPUT:
> >  		case UVC_EXTERNAL_VENDOR_SPECIFIC:
> >  		case UVC_EXT_GPIO_UNIT:
> > +		case UVC_FWNODE_UNIT:
> >  		default:
> >  			function = MEDIA_ENT_F_V4L2_SUBDEV_UNKNOWN;
> >  			break;
> > diff --git a/drivers/media/usb/uvc/uvc_fwnode.c b/drivers/media/usb/uvc/uvc_fwnode.c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..20f7b8847551acfd44cbf09bcbf653d89985561f
> > --- /dev/null
> > +++ b/drivers/media/usb/uvc/uvc_fwnode.c
> > @@ -0,0 +1,73 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + *      uvc_fwnode.c  --  USB Video Class driver
> > + *
> > + *      Copyright 2025 Google LLC
> > + */
> > +
> > +#include <linux/kernel.h>
> > +#include <linux/usb/uvc.h>
> > +#include <media/v4l2-fwnode.h>
> > +#include "uvcvideo.h"
> > +
> > +static int uvc_fwnode_get_cur(struct uvc_device *dev, struct uvc_entity *entity,
> > +			      u8 cs, void *data, u16 size)
> > +{
> > +	if (size < 1)
> > +		return -EINVAL;
> > +
> > +	switch (entity->fwnode.props.orientation) {
> > +	case V4L2_FWNODE_ORIENTATION_FRONT:
> > +		*(u8 *)data = V4L2_CAMERA_ORIENTATION_FRONT;
> > +		break;
> > +	case V4L2_FWNODE_ORIENTATION_BACK:
> > +		*(u8 *)data = V4L2_CAMERA_ORIENTATION_BACK;
> > +		break;
> > +	default:
> > +		*(u8 *)data = V4L2_CAMERA_ORIENTATION_EXTERNAL;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int uvc_fwnode_get_info(struct uvc_device *dev,
> > +			       struct uvc_entity *entity, u8 cs, u8 *caps)
> > +{
> > +	*caps = UVC_CONTROL_CAP_GET;
> > +	return 0;
> > +}
> > +
> > +int uvc_fwnode_parse(struct uvc_device *dev)
> > +{
> > +	static const u8 uvc_fwnode_guid[] = UVC_GUID_FWNODE;
> > +	struct v4l2_fwnode_device_properties props;
> > +	struct uvc_entity *unit;
> > +	int ret;
> > +
> > +	ret = v4l2_fwnode_device_parse(&dev->udev->dev, &props);
> > +	if (ret)
> > +		return dev_err_probe(&dev->intf->dev, ret,
> > +				     "Can't parse fwnode\n");
> > +
> > +	if (props.orientation == V4L2_FWNODE_PROPERTY_UNSET)
> > +		return 0;
> > +
> > +	unit = uvc_alloc_entity(UVC_FWNODE_UNIT, UVC_FWNODE_UNIT_ID, 0, 1);
> > +	if (!unit)
> > +		return -ENOMEM;
> > +
> > +	memcpy(unit->guid, uvc_fwnode_guid, sizeof(unit->guid));
> > +	unit->fwnode.props = props;
> > +	unit->fwnode.bControlSize = 1;
> > +	unit->fwnode.bmControls = (u8 *)unit + sizeof(*unit);
> > +	unit->fwnode.bmControls[0] = 1;
> > +	unit->get_cur = uvc_fwnode_get_cur;
> > +	unit->get_info = uvc_fwnode_get_info;
> > +	strscpy(unit->name, "FWNODE", sizeof(unit->name));
> > +
> > +	list_add_tail(&unit->list, &dev->entities);
> > +
> > +	dev->fwnode_unit = unit;
> > +
> > +	return 0;
> > +}
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index aef96b96499ce09ffa286c51793482afd9832097..c52ab99bf8d21ab37270d27ffc040fd115b3f5ba 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -19,6 +19,7 @@
> >  #include <media/v4l2-event.h>
> >  #include <media/v4l2-fh.h>
> >  #include <media/videobuf2-v4l2.h>
> > +#include <media/v4l2-fwnode.h>
> >  
> >  /* --------------------------------------------------------------------------
> >   * UVC constants
> > @@ -41,6 +42,9 @@
> >  #define UVC_EXT_GPIO_UNIT		0x7ffe
> >  #define UVC_EXT_GPIO_UNIT_ID		0x100
> >  
> > +#define UVC_FWNODE_UNIT			0x7ffd
> > +#define UVC_FWNODE_UNIT_ID		0x101
> > +
> >  /* ------------------------------------------------------------------------
> >   * Driver specific constants.
> >   */
> > @@ -242,6 +246,12 @@ struct uvc_entity {
> >  			int irq;
> >  			bool initialized;
> >  		} gpio;
> > +
> > +		struct {
> > +			u8  bControlSize;
> > +			u8  *bmControls;
> > +			struct v4l2_fwnode_device_properties props;
> > +		} fwnode;
> >  	};
> >  
> >  	u8 bNrInPins;
> > @@ -617,6 +627,7 @@ struct uvc_device {
> >  	} async_ctrl;
> >  
> >  	struct uvc_entity *gpio_unit;
> > +	struct uvc_entity *fwnode_unit;
> >  };
> >  
> >  enum uvc_handle_state {
> > @@ -835,4 +846,8 @@ size_t uvc_video_stats_dump(struct uvc_streaming *stream, char *buf,
> >  int uvc_gpio_parse(struct uvc_device *dev);
> >  int uvc_gpio_init_irq(struct uvc_device *dev);
> >  void uvc_gpio_deinit(struct uvc_device *dev);
> > +
> > +/* fwnode */
> > +int uvc_fwnode_parse(struct uvc_device *dev);
> > +
> >  #endif
> > diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
> > index bce95153e5a65613a710d7316fc17cf5462b5bce..d818839b0442988d94ab44935e1ce855b0adf4a1 100644
> > --- a/include/linux/usb/uvc.h
> > +++ b/include/linux/usb/uvc.h
> > @@ -29,6 +29,9 @@
> >  #define UVC_GUID_EXT_GPIO_CONTROLLER \
> >  	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
> >  	 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x03}
> > +#define UVC_GUID_FWNODE \
> > +	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
> > +	 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x04}
> >  
> >  #define UVC_GUID_FORMAT_MJPEG \
> >  	{ 'M',  'J',  'P',  'G', 0x00, 0x00, 0x10, 0x00, \
> > 

-- 
Regards,

Laurent Pinchart

