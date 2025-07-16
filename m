Return-Path: <linux-gpio+bounces-23355-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 553A1B0737D
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 12:32:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5CC6B3ABDA1
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 10:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5783C2F1FF1;
	Wed, 16 Jul 2025 10:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ohTjKJBW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA174264FB2
	for <linux-gpio@vger.kernel.org>; Wed, 16 Jul 2025 10:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752661952; cv=none; b=sVZYmREWUsDDR+4vaIbtPT3adgADwpLD4pbczIT9R0+SFB+8WvZ6BlSamsbAgZ1FEH5qm2TGvIdNsRw+uuCiGorJAR6874H5+JBDx6HBRdlotxvO1dFvFyb9CnpSiIJO2d9O3PIEln5FuG8mUAQKLPKMOj6tz53/499fQR38agA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752661952; c=relaxed/simple;
	bh=lQBsia0sYbc3ZhTi0JAkaaWjrbsoT4HfjHir1/c3JVY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NEwl4GivF/HlcOQjiK6OvYGuL+SlwGWdS15nx1yup5K867Gmw4Sm8YjNBiZrT5z360aDgzenqQAbnkpbV2/y3I6JVqypCRNdi/D0m6mFNDATOitEUmHenGFmSWdXQ8L0xRsHcnCHLQ7s2YVWEw9qjsZrOXowErLBrCjTZ6nzT/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ohTjKJBW; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-32cd499007aso47535201fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 16 Jul 2025 03:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752661948; x=1753266748; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XO0Fx40qXcc6y2Q85UzZUUK6JgaXB0+V8kATrQASoZ0=;
        b=ohTjKJBW3AltsPPHsAeRt3wYfQ0SvmYSH9B9KObdZuLXdnMD0Q0GzOfR2qWVzRfiiN
         JXTmDBu28J78MwoGrlPM4LuII0r/gkW/Q9yPu9a6Z9VwjoPV2kxNTrgF2fEPHUtwnnYj
         mpbBDfhxxoSabA9HQI6bc5xeglXFjBFTOZnBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752661948; x=1753266748;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XO0Fx40qXcc6y2Q85UzZUUK6JgaXB0+V8kATrQASoZ0=;
        b=HiWzmyFBGHfS0x5gFkRWU+X50lzC6ft5W1ZaF+v87SJfhIzEGijRnhGZWt+1V7aLcE
         a/JEMtbgfoKG6QbjQJYlS1Zdz+E6C/FJFeDZbs0OCSVBH4vH4JiwXrsO39LCdUAtpca8
         hFLpepRfvRlu3ppopfIAbSQPRZJq7HdcD4dxNL5Wy9fwyF5Y1yXdQXvidVBZkI5cp5g6
         FO2/pretcv24f1JI2ScdtF37+7KgeT+4g1aZRV+maXGpxaka3hzG6C0s4RhR3joeT47K
         +Xj33+o+1Atrr2JqWD7NdfYADYDk+wuZReNyVUKaxcPpu8AzVvw5sw5ZCQBxrS42t0QW
         z1Tg==
X-Forwarded-Encrypted: i=1; AJvYcCX4WbjLoS2EBzE6Cm50Reno9brU0tpurz2WXvfja/m9S9YZbq95w4plA/7xpuxeDNhJdvixwXxehozA@vger.kernel.org
X-Gm-Message-State: AOJu0YyG/bFzUtebeXVT+x4yb5+bW5rFgo1f6EdiZH1tBS/lh8HUC6if
	pApYP533ILSgQwf5wrdAaHKXbTXgdKpcZ1/2A0SHX/8kePW4LoHM1Vf3nPE6snL7rVKf4vhaKZp
	1QeY=
X-Gm-Gg: ASbGncsOL5dWHwtPggipOyT2dtSGveLodgXTHpd8mwYSUf5RSoVMEgqEMj+aBTXFtFc
	N3KRg1GTZgNiYnKOF1Ef5Ti6ztrHiGaxvz3hiS5+69x4BtgebLI4SJjqo+Ko+ROtVqXMSUc3IPN
	VsjLDP3x8a52cTzXSwfwggyHy5IhTUgglM3egHh2lywY2NudetCbDApVuPwvOc0xl6LkW1Lq82O
	6KisKveNlt/FCBPjtvugRfHMszPN4aOdavzT12nG7JuPoYU0jnfqMkP62+yB7Z/e5ie6q3Oby0o
	aI80Jfs7jvOzc7/XbUnHleLx07gcj8bMEnIdjHzv+Ekl6pPd/yEgv4Cktz93JujYb7u1IPJLg20
	0SnTKmixzkW3orJUn/w08pkzNyj4m0VFZsnsX+9Az5f1as+7ZIv1nda+G9MXH
X-Google-Smtp-Source: AGHT+IEtrs3X+VwFy3h0pcdOGzJb1mUr75bulp2MAiOKicOtrJQYH1fFqx4i9LN04kgoU8TFoHmcDA==
X-Received: by 2002:a2e:be90:0:b0:32b:9652:2c04 with SMTP id 38308e7fff4ca-3308e50e728mr8458851fa.33.1752661947501;
        Wed, 16 Jul 2025 03:32:27 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32fab8ec210sm19652231fa.79.2025.07.16.03.32.25
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 03:32:26 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-55a25635385so378472e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 16 Jul 2025 03:32:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUvnaiQ/h4C17SnM4fUQUGrTR7KB4h8SS01gVJKifjPLVppJ6z8v+ebEhFrzn8kAJ4eBFLIePGa4dLO@vger.kernel.org
X-Received: by 2002:a05:651c:20cc:20b0:32b:7123:ec4c with SMTP id
 38308e7fff4ca-3308e534766mr5343651fa.38.1752661944634; Wed, 16 Jul 2025
 03:32:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605-uvc-orientation-v2-0-5710f9d030aa@chromium.org>
 <20250605-uvc-orientation-v2-10-5710f9d030aa@chromium.org>
 <20250629181246.GE6260@pendragon.ideasonboard.com> <CANiDSCsu0RT4dcGyBJRutP=9HTe+niUoohxTZE=qJ8O_9ez=+A@mail.gmail.com>
 <20250714142926.GI8243@pendragon.ideasonboard.com> <CANiDSCvFe23xmrJ0-qbWWa6+vKGb+QdDFV8VSLkmWdAnfsFtzw@mail.gmail.com>
 <20250715193505.GB19299@pendragon.ideasonboard.com>
In-Reply-To: <20250715193505.GB19299@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 16 Jul 2025 12:32:12 +0200
X-Gmail-Original-Message-ID: <CANiDSCtvt6qnROQ0_-0iG5hqkU_uHZABujZPN7xuh7pUASSGyw@mail.gmail.com>
X-Gm-Features: Ac12FXxTxa1OMnAHd5xkxGC40dZgahlVF2ufC7vQULE72HOrmtGjhNO81HxFS-Q
Message-ID: <CANiDSCtvt6qnROQ0_-0iG5hqkU_uHZABujZPN7xuh7pUASSGyw@mail.gmail.com>
Subject: Re: [PATCH v2 10/12] media: uvcvideo: Add get_* functions to uvc_entity
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Jul 2025 at 21:35, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Mon, Jul 14, 2025 at 05:46:40PM +0200, Ricardo Ribalda wrote:
> > On Mon, 14 Jul 2025 at 16:30, Laurent Pinchart wrote:
> > > On Tue, Jul 01, 2025 at 01:13:10PM +0200, Ricardo Ribalda wrote:
> > > > On Sun, 29 Jun 2025 at 20:13, Laurent Pinchart wrote:
> > > > > On Thu, Jun 05, 2025 at 05:53:03PM +0000, Ricardo Ribalda wrote:
> > > > > > Virtual entities need to provide more values than get_cur and get_cur
> > > > >
> > > > > I think you meant "get_info and get_cur".
> > > > >
> > > > > > for their controls. Add support for get_def, get_min, get_max and
> > > > > > get_res.
> > > > >
> > > > > Do they ? The UVC specification defines controls that don't list
> > > > > GET_DEF, GET_MIN, GET_MAX and GET_RES as mandatory requests. Can't we do
> > > > > the same for the software controls ? This patch is meant to support the
> > > > > UVC_SWENTITY_ORIENTATION and UVC_SWENTITY_ROTATION control in the next
> > > > > patch, and those are read-only controls. Aren't GET_INFO and GET_CUR
> > > > > enough ?
> > > >
> > > > V4L2_CID_CAMERA_ROTATION has the type UVC_CTRL_DATA_TYPE_UNSIGNED,
> > > > that time requires get_min and get_max.
> > >
> > > Where does that requirement come from ? Is it because how the
> > > corresponding V4L2 type (V4L2_CTRL_TYPE_INTEGER) is handled in
> > > uvc_ctrl_clamp() ? uvc_ctrl_clamp() is only called when setting a
> > > control, from uvc_ctrl_set(), and V4L2_CID_CAMERA_ROTATION should be
> > > read-only.
> >
> > It its for VIDIOC_QUERY_EXT_CTRL
> >
> > uvc_query_v4l2_ctrl -> __uvc_query_v4l2_ctrl -> __uvc_queryctrl_boundaries
> >
> > We need to list the min, max, def and step for every control. They are
> > fetched with uvc_ctrl_populate_cache()
>
> Ah, I see, thanks.
>
> For GET_RES, I think we can leave it unimplemented.
> __uvc_queryctrl_boundaries() will set v4l2_ctrl->step = 0 which seems to
> be the right behaviour for a read-only control whose value never
> changes.

That will break v4l2-compatiblity. Step needs to be != 0
https://git.linuxtv.org/v4l-utils.git/tree/utils/v4l2-compliance/v4l2-test-controls.cpp#n77

Control ioctls (Input 0):
                fail: v4l2-test-controls.cpp(77): step == 0
                fail: v4l2-test-controls.cpp(201): invalid control 009a0923

>
> As for the minimum and maximum, they are currently set to 0 if the
> corresponding operations are not supported. I wonder if we should set
> them to the current value instead for read-only controls (as in controls
> whose flags report support for GET_CUR only)..

I am not sure that I like that approach IMO the code looks worse...
but if you prefer that, we can go that way


diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index ec472e111248..47224437018b 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -35,6 +35,8 @@
 /* ------------------------------------------------------------------------
  * Controls
  */
+static int __uvc_ctrl_load_cur(struct uvc_video_chain *chain,
+                              struct uvc_control *ctrl);

 static const struct uvc_control_info uvc_ctrls[] = {
        {
@@ -1272,6 +1274,13 @@ static int uvc_ctrl_populate_cache(struct
uvc_video_chain *chain,
                                        uvc_ctrl_data(ctrl, UVC_CTRL_DATA_DEF));
                if (ret < 0)
                        return ret;
+       } else if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR)) {
+               ret = __uvc_ctrl_load_cur(chain, ctrl);
+               if (!ret) {
+                       memcpy(uvc_ctrl_data(ctrl, UVC_CTRL_DATA_DEF),
+                              uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
+                              ctrl->info.size);
+               }
        }

        if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN) {
@@ -1279,14 +1288,31 @@ static int uvc_ctrl_populate_cache(struct
uvc_video_chain *chain,
                                        uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN));
                if (ret < 0)
                        return ret;
+       } else if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR)) {
+               ret = __uvc_ctrl_load_cur(chain, ctrl);
+               if (!ret) {
+                       memcpy(uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN),
+                              uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
+                              ctrl->info.size);
+               }
        }
+
        if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MAX) {
                ret = uvc_ctrl_query_entity(chain->dev, ctrl, UVC_GET_MAX,
                                        uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX));
                if (ret < 0)
                        return ret;
+       } else if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR)) {
+               ret = __uvc_ctrl_load_cur(chain, ctrl);
+               if (!ret) {
+                       memcpy(uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX),
+                              uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
+                              ctrl->info.size);
+               }
        }
+
        if (ctrl->info.flags & UVC_CTRL_FLAG_GET_RES) {
+               u8 *res;
                ret = uvc_ctrl_query_entity(chain->dev, ctrl, UVC_GET_RES,
                                        uvc_ctrl_data(ctrl, UVC_CTRL_DATA_RES));
                if (ret < 0) {
@@ -1304,7 +1330,13 @@ static int uvc_ctrl_populate_cache(struct
uvc_video_chain *chain,
                                      "an XU control. Enabling workaround.\n");
                        memset(uvc_ctrl_data(ctrl, UVC_CTRL_DATA_RES), 0,
                               ctrl->info.size);
+                       res = uvc_ctrl_data(ctrl, UVC_CTRL_DATA_RES);
+                       *res = 1
                }
+       } else {
+               memset(uvc_ctrl_data(ctrl, UVC_CTRL_DATA_RES), 0,
ctrl->info.size);
+               res = uvc_ctrl_data(ctrl, UVC_CTRL_DATA_RES);
+               *res = 1;
        }

        ctrl->cached = 1;
@@ -1541,11 +1573,8 @@ static int __uvc_queryctrl_boundaries(struct
uvc_video_chain *chain,
                        return ret;
        }

-       if (ctrl->info.flags & UVC_CTRL_FLAG_GET_DEF)
                v4l2_ctrl->default_value = uvc_mapping_get_s32(mapping,
                                UVC_GET_DEF, uvc_ctrl_data(ctrl,
UVC_CTRL_DATA_DEF));
-       else
-               v4l2_ctrl->default_value = 0;

        switch (mapping->v4l2_type) {
        case V4L2_CTRL_TYPE_MENU:
@@ -1576,23 +1605,14 @@ static int __uvc_queryctrl_boundaries(struct
uvc_video_chain *chain,
                break;
        }

-       if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN)
-               v4l2_ctrl->minimum = uvc_mapping_get_s32(mapping, UVC_GET_MIN,
-                               uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN));
-       else
-               v4l2_ctrl->minimum = 0;
+       v4l2_ctrl->minimum = uvc_mapping_get_s32(mapping, UVC_GET_MIN,
+                                       uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN));

-       if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MAX)
-               v4l2_ctrl->maximum = uvc_mapping_get_s32(mapping, UVC_GET_MAX,
-                               uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX));
-       else
-               v4l2_ctrl->maximum = 0;
+       v4l2_ctrl->maximum = uvc_mapping_get_s32(mapping, UVC_GET_MAX,
+                                       uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX));

-       if (ctrl->info.flags & UVC_CTRL_FLAG_GET_RES)
-               v4l2_ctrl->step = uvc_mapping_get_s32(mapping, UVC_GET_RES,
-                               uvc_ctrl_data(ctrl, UVC_CTRL_DATA_RES));
-       else
-               v4l2_ctrl->step = 0;
+       v4l2_ctrl->step = uvc_mapping_get_s32(mapping, UVC_GET_RES,
+                                       uvc_ctrl_data(ctrl, UVC_CTRL_DATA_RES));

        return 0;
 }

>
> > > > We can create a new type UVC_CTRL_DATA_TYPE_UNSIGNED_READ_ONLY that
> > > > fakes min, max and res, but I think that it is cleaner this approach.
> > > >
> > > > > > This is a preparation patch.
> > > > > >
> > > > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > > > ---
> > > > > >  drivers/media/usb/uvc/uvc_ctrl.c | 12 ++++++++++++
> > > > > >  drivers/media/usb/uvc/uvcvideo.h |  8 ++++++++
> > > > > >  2 files changed, 20 insertions(+)
> > > > > >
> > > > > > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > > > > > index 21ec7b978bc7aca21db7cb8fd5d135d876f3330c..59be62ae24a4219fa9d7aacf2ae7382c95362178 100644
> > > > > > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > > > > > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > > > > > @@ -596,6 +596,18 @@ static int uvc_ctrl_query_entity(struct uvc_device *dev,
> > > > > >       if (query == UVC_GET_CUR && ctrl->entity->get_cur)
> > > > > >               return ctrl->entity->get_cur(dev, ctrl->entity,
> > > > > >                                            ctrl->info.selector, data, len);
> > > > > > +     if (query == UVC_GET_DEF && ctrl->entity->get_def)
> > > > > > +             return ctrl->entity->get_def(dev, ctrl->entity,
> > > > > > +                                          ctrl->info.selector, data, len);
> > > > > > +     if (query == UVC_GET_MIN && ctrl->entity->get_min)
> > > > > > +             return ctrl->entity->get_min(dev, ctrl->entity,
> > > > > > +                                          ctrl->info.selector, data, len);
> > > > > > +     if (query == UVC_GET_MAX && ctrl->entity->get_max)
> > > > > > +             return ctrl->entity->get_max(dev, ctrl->entity,
> > > > > > +                                          ctrl->info.selector, data, len);
> > > > > > +     if (query == UVC_GET_RES && ctrl->entity->get_res)
> > > > > > +             return ctrl->entity->get_res(dev, ctrl->entity,
> > > > > > +                                          ctrl->info.selector, data, len);
> > > > > >       if (query == UVC_GET_INFO && ctrl->entity->get_info)
> > > > > >               return ctrl->entity->get_info(dev, ctrl->entity,
> > > > > >                                             ctrl->info.selector, data);
> > > > > > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > > > > > index a931750bdea25b9062dcc7644bf5f2ed89c1cb4c..d6da8ed3ad4cf3377df49923e051fe04d83d2e38 100644
> > > > > > --- a/drivers/media/usb/uvc/uvcvideo.h
> > > > > > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > > > > > @@ -261,6 +261,14 @@ struct uvc_entity {
> > > > > >                       u8 cs, u8 *caps);
> > > > > >       int (*get_cur)(struct uvc_device *dev, struct uvc_entity *entity,
> > > > > >                      u8 cs, void *data, u16 size);
> > > > > > +     int (*get_def)(struct uvc_device *dev, struct uvc_entity *entity,
> > > > > > +                    u8 cs, void *data, u16 size);
> > > > > > +     int (*get_min)(struct uvc_device *dev, struct uvc_entity *entity,
> > > > > > +                    u8 cs, void *data, u16 size);
> > > > > > +     int (*get_max)(struct uvc_device *dev, struct uvc_entity *entity,
> > > > > > +                    u8 cs, void *data, u16 size);
> > > > > > +     int (*get_res)(struct uvc_device *dev, struct uvc_entity *entity,
> > > > > > +                    u8 cs, void *data, u16 size);
> > > > > >
> > > > > >       unsigned int ncontrols;
> > > > > >       struct uvc_control *controls;
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

