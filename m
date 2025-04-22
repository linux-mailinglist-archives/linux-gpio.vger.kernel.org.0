Return-Path: <linux-gpio+bounces-19160-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03EFFA97A8B
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 00:35:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC0EE3A7F75
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Apr 2025 22:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C8142BEC42;
	Tue, 22 Apr 2025 22:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nDWRT35h"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32282C257B
	for <linux-gpio@vger.kernel.org>; Tue, 22 Apr 2025 22:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745361330; cv=none; b=Po6ersokO+dV8gt1cJoveuNNOIEOAABWT4rLXSanoD98a0fIayzaMYRCKUFTrpXst9hGn7k4OlqBuuBeoOnSRf7Xq1CMZ/4P/v2eeKM98MjpjKeJ0wAP1k5zryvLhr1aFZRPO6gPre02XLHN9SYZBoV6WrIFA/DX157FFIj795o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745361330; c=relaxed/simple;
	bh=qRekH6R/El0In+C0U93oyIPC0KY9/RSZc7MPaQOtdb4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tvnm7Q8//WE2EK/NvyrJZijdze6D5ibZWMP+BpBnL+V4dMt3S8Skh9oSxChGia1BAZkkedkW4TXxYil3vFxVsJQ16FW1I6iAXZxJRjODrJWqNb5x7tlk+u5IfhuLqyFwTIe9DGzfrXVcHj7oRRQg1eaZLi0Fv0cvnH4cxfoUbgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nDWRT35h; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30de488cf81so57052311fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 22 Apr 2025 15:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745361326; x=1745966126; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+1OwQffmoWOZiK+v3GN4nUgP2aMHL/nD/L2tk0hINuY=;
        b=nDWRT35h+ey/2Aw3y6UikN40b2sFKkzd24s+EYa03Zfxhf7CxxRHuMW7Me94kvvYcd
         4TXzNxPwtKKzZzq0e2zZ2AYgH3NUGzLicVgoUEpZbQzDgkS2ljYj8yPKz7fo2vcVWY1n
         TZVW4enqflBfEjDwB9qutwBcoYgf6J3c9+PjA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745361326; x=1745966126;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+1OwQffmoWOZiK+v3GN4nUgP2aMHL/nD/L2tk0hINuY=;
        b=JBZdGVxmj+z5QchfkDKlZFegMvqTqtwiCaDhQK+bdWHA9D/4+3W9YCsRb//i0w7tyf
         9bcnoogmuIAk4zEcWpBeWe/Ql1gPCAljRsaCXEwJ/7Uu9qtNGR5sxasSDRqIOq1U00cJ
         Hy8CwbrPlroRAqfKwXtTsihDNdoe3uyUF0IDSzz84FbagUQqrU/A+FxZz0k90J4E2vJU
         1+4diCY/UvVvlefVCtths1fRMdFdchirwEWhKp+Ez0iYybzM2X+ENjCY6n7RN5RseJW9
         8fxTVtTSw4aktkBXX89XhN+cmIwvgmP9ZtiV2OEoRQ0yOcZ1CHAjMwGopAopMMLoQuCq
         5Vjg==
X-Forwarded-Encrypted: i=1; AJvYcCUAxZhFfpOEXVU09tkXacZZmT4ZYpHl4D0nJU+fESXlz8KYe37xcJw6Bz5guX9950DWuwP8WuGxhTZe@vger.kernel.org
X-Gm-Message-State: AOJu0Yzmq/AyjH4sAvBTLyTZXGNYREjUZYulnARfLQlMzejAei8BxOg1
	uFfocylmjrUbRu4zRnmomLRvcYVKvrNt92xh/tuyefzF+E+kR0swu6/6kM6qI+wGH6H/MnqZzVE
	kzw==
X-Gm-Gg: ASbGncsYWu6+Hjg8caFUUQ9H2lWjc1WvVJ5Hems2xsQE6at3vdmjHGCFOI16Xr0HWSa
	YtjAPOtFcDwXTjHzs001YQzQipT7VGP9+lqwd/9QGX47Y0HHtnr6lPNtxddOT/kyQN8fGN+pw03
	58nmYDmfedlLYiC30HkW+e0mxBHdq3wUOA5DXIHo8JikK5wcnP60jFtnSUeVVQSyiNG2YJFxhXx
	LXAAzgZoeRRhnJl2g15rmd3cnvKC/4RdPh7BXlL3sGvfj3Bi6UQhthYi1O0lLZ/Hu8Xd6S1tlNo
	3cfxWPgDRtb4Mi6X6kIrrskvuG5XMR0HJ8N2CEQ9M50M+4l7/UP6epsbOH8bSR6TVnWMzRL8Mjo
	dctwsnRE=
X-Google-Smtp-Source: AGHT+IHGELWgUYF+uUweT4yJ/LzTyefgE7oZe843z2N6jiRiwSBzggMHtBkeBBZEzvln/T6QSS4FWA==
X-Received: by 2002:a2e:a5c3:0:b0:30b:fd7a:22e9 with SMTP id 38308e7fff4ca-310904ea2a9mr47751271fa.13.1745361325808;
        Tue, 22 Apr 2025 15:35:25 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3109084d640sm15959581fa.92.2025.04.22.15.35.23
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 15:35:23 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30bfca745c7so51151901fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 22 Apr 2025 15:35:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWsQZt6/lkPh0Vw1F0lg4RNKcIK6p2qn125d8LLLJM8sj4/moy+e6hNxsVezAMEtexcnq6l30JQXcy5@vger.kernel.org
X-Received: by 2002:a2e:a99c:0:b0:30c:6f3a:dce9 with SMTP id
 38308e7fff4ca-310904dc6famr51168381fa.10.1745361322526; Tue, 22 Apr 2025
 15:35:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403-uvc-orientation-v1-0-1a0cc595a62d@chromium.org>
 <20250403-uvc-orientation-v1-6-1a0cc595a62d@chromium.org> <20250422212824.GQ17813@pendragon.ideasonboard.com>
 <CANiDSCuOaZ9bnd20tGLWzOA7cGA2q+oKdGktvouT-8+cUkHF1w@mail.gmail.com> <20250422222517.GU17813@pendragon.ideasonboard.com>
In-Reply-To: <20250422222517.GU17813@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 23 Apr 2025 06:35:08 +0800
X-Gmail-Original-Message-ID: <CANiDSCv3om=6puzMVC0OYAqsKGdH+JJQ-unmizhRmYLyTfKxkQ@mail.gmail.com>
X-Gm-Features: ATxdqUFRRVRmeagR9-6yuKs1PFlrDu1BvYYrOr34vEdivXpSYxBiSNwRKoK-z8A
Message-ID: <CANiDSCv3om=6puzMVC0OYAqsKGdH+JJQ-unmizhRmYLyTfKxkQ@mail.gmail.com>
Subject: Re: [PATCH 6/8] media: uvcvideo: Factor out gpio functions to its own file
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 23 Apr 2025 at 06:25, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Wed, Apr 23, 2025 at 06:20:09AM +0800, Ricardo Ribalda wrote:
> > Hi Laurent
> >
> > On Wed, 23 Apr 2025 at 05:28, Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> > >
> > > Hi Ricardo,
> > >
> > > Thank you for the patch.
> > >
> > > Hans raised an issue on "[PATCH v3 2/8] media: uvcvideo: Factor out gpio
> > > functions to its own file" (part of "[PATCH v3 0/8] media: uvcvideo:
> > > Implement the Privacy GPIO as a evdev"), asking if GPIO handling should
> > > still use a uvc_entity if it moves to a evdev. There are implications on
> > > this series too. Unless I'm mistaken, I haven't seen a reply from you to
> > > my last e-mail. Can we please first finish that discussion ?
> >
> > Are you referring to:
> > https://lore.kernel.org/all/0dfb780b-f2dc-43ed-a67d-afd5f50bb88f@redhat.com/
> > ?
>
> I was referring to https://lore.kernel.org/all/20241125214523.GW19381@pendragon.ideasonboard.com/

I believe the three of us agreed to remove the entity. Am I missing something?

>
> > Is it an open discussion? I believe we agreed to remove the uvc_entity.
> >
> > I posted v4 back in november. In that version I remove completely the
> > uvc_entity:
> > https://patchwork.linuxtv.org/project/linux-media/patch/20241125-uvc-subdev-v4-6-51e040599f1a@chromium.org/
>
> Should I review that series first ?

It would be nicer if you follow the order of what Hans already merged
in the uvc tree. And if we *need* a change, post it on top of it
(unless it is a bug).

HdG and I have gone through multiple revisions, tested it, solved
conflicts, and reviewed merges.  CodeStyles and nice-to-have are
*very* painful to handle this late in the review cycle.

Regards!

>
> > > On Thu, Apr 03, 2025 at 07:16:17PM +0000, Ricardo Ribalda wrote:
> > > > This is just a refactor patch, no new functionality is added.
> > > >
> > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > ---
> > > >  drivers/media/usb/uvc/Makefile     |   3 +-
> > > >  drivers/media/usb/uvc/uvc_driver.c | 121 +-----------------------------------
> > > >  drivers/media/usb/uvc/uvc_gpio.c   | 123 +++++++++++++++++++++++++++++++++++++
> > > >  drivers/media/usb/uvc/uvcvideo.h   |   6 ++
> > > >  4 files changed, 133 insertions(+), 120 deletions(-)
> > > >
> > > > diff --git a/drivers/media/usb/uvc/Makefile b/drivers/media/usb/uvc/Makefile
> > > > index 4f9eee4f81ab6436a8b90324a688a149b2c3bcd1..85514b6e538fbb8284e574ca14700f2d749e1a2e 100644
> > > > --- a/drivers/media/usb/uvc/Makefile
> > > > +++ b/drivers/media/usb/uvc/Makefile
> > > > @@ -1,6 +1,7 @@
> > > >  # SPDX-License-Identifier: GPL-2.0
> > > >  uvcvideo-objs  := uvc_driver.o uvc_queue.o uvc_v4l2.o uvc_video.o uvc_ctrl.o \
> > > > -               uvc_status.o uvc_isight.o uvc_debugfs.o uvc_metadata.o
> > > > +               uvc_status.o uvc_isight.o uvc_debugfs.o uvc_metadata.o \
> > > > +               uvc_gpio.o
> > > >  ifeq ($(CONFIG_MEDIA_CONTROLLER),y)
> > > >  uvcvideo-objs  += uvc_entity.o
> > > >  endif
> > > > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > > > index da24a655ab68cc0957762f2b67387677c22224d1..b52e1ff401e24f69b867b5e975cda4260463e760 100644
> > > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > > @@ -8,7 +8,6 @@
> > > >
> > > >  #include <linux/atomic.h>
> > > >  #include <linux/bits.h>
> > > > -#include <linux/gpio/consumer.h>
> > > >  #include <linux/kernel.h>
> > > >  #include <linux/list.h>
> > > >  #include <linux/module.h>
> > > > @@ -792,8 +791,8 @@ static const u8 uvc_media_transport_input_guid[16] =
> > > >       UVC_GUID_UVC_MEDIA_TRANSPORT_INPUT;
> > > >  static const u8 uvc_processing_guid[16] = UVC_GUID_UVC_PROCESSING;
> > > >
> > > > -static struct uvc_entity *uvc_alloc_entity(u16 type, u16 id,
> > > > -             unsigned int num_pads, unsigned int extra_size)
> > > > +struct uvc_entity *uvc_alloc_entity(u16 type, u16 id, unsigned int num_pads,
> > > > +                                 unsigned int extra_size)
> > > >  {
> > > >       struct uvc_entity *entity;
> > > >       unsigned int num_inputs;
> > > > @@ -1242,122 +1241,6 @@ static int uvc_parse_control(struct uvc_device *dev)
> > > >       return 0;
> > > >  }
> > > >
> > > > -/* -----------------------------------------------------------------------------
> > > > - * Privacy GPIO
> > > > - */
> > > > -
> > > > -static void uvc_gpio_event(struct uvc_device *dev)
> > > > -{
> > > > -     struct uvc_entity *unit = dev->gpio_unit;
> > > > -     struct uvc_video_chain *chain;
> > > > -     u8 new_val;
> > > > -
> > > > -     if (!unit)
> > > > -             return;
> > > > -
> > > > -     new_val = gpiod_get_value_cansleep(unit->gpio.gpio_privacy);
> > > > -
> > > > -     /* GPIO entities are always on the first chain. */
> > > > -     chain = list_first_entry(&dev->chains, struct uvc_video_chain, list);
> > > > -     uvc_ctrl_status_event(chain, unit->controls, &new_val);
> > > > -}
> > > > -
> > > > -static int uvc_gpio_get_cur(struct uvc_device *dev, struct uvc_entity *entity,
> > > > -                         u8 cs, void *data, u16 size)
> > > > -{
> > > > -     if (cs != UVC_CT_PRIVACY_CONTROL || size < 1)
> > > > -             return -EINVAL;
> > > > -
> > > > -     *(u8 *)data = gpiod_get_value_cansleep(entity->gpio.gpio_privacy);
> > > > -
> > > > -     return 0;
> > > > -}
> > > > -
> > > > -static int uvc_gpio_get_info(struct uvc_device *dev, struct uvc_entity *entity,
> > > > -                          u8 cs, u8 *caps)
> > > > -{
> > > > -     if (cs != UVC_CT_PRIVACY_CONTROL)
> > > > -             return -EINVAL;
> > > > -
> > > > -     *caps = UVC_CONTROL_CAP_GET | UVC_CONTROL_CAP_AUTOUPDATE;
> > > > -     return 0;
> > > > -}
> > > > -
> > > > -static irqreturn_t uvc_gpio_irq(int irq, void *data)
> > > > -{
> > > > -     struct uvc_device *dev = data;
> > > > -
> > > > -     uvc_gpio_event(dev);
> > > > -     return IRQ_HANDLED;
> > > > -}
> > > > -
> > > > -static int uvc_gpio_parse(struct uvc_device *dev)
> > > > -{
> > > > -     struct uvc_entity *unit;
> > > > -     struct gpio_desc *gpio_privacy;
> > > > -     int irq;
> > > > -
> > > > -     gpio_privacy = devm_gpiod_get_optional(&dev->intf->dev, "privacy",
> > > > -                                            GPIOD_IN);
> > > > -     if (!gpio_privacy)
> > > > -             return 0;
> > > > -
> > > > -     if (IS_ERR(gpio_privacy))
> > > > -             return dev_err_probe(&dev->intf->dev,
> > > > -                                  PTR_ERR(gpio_privacy),
> > > > -                                  "Can't get privacy GPIO\n");
> > > > -
> > > > -     irq = gpiod_to_irq(gpio_privacy);
> > > > -     if (irq < 0)
> > > > -             return dev_err_probe(&dev->intf->dev, irq,
> > > > -                                  "No IRQ for privacy GPIO\n");
> > > > -
> > > > -     unit = uvc_alloc_entity(UVC_EXT_GPIO_UNIT, UVC_EXT_GPIO_UNIT_ID, 0, 1);
> > > > -     if (!unit)
> > > > -             return -ENOMEM;
> > > > -
> > > > -     unit->gpio.gpio_privacy = gpio_privacy;
> > > > -     unit->gpio.irq = irq;
> > > > -     unit->gpio.bControlSize = 1;
> > > > -     unit->gpio.bmControls = (u8 *)unit + sizeof(*unit);
> > > > -     unit->gpio.bmControls[0] = 1;
> > > > -     unit->get_cur = uvc_gpio_get_cur;
> > > > -     unit->get_info = uvc_gpio_get_info;
> > > > -     strscpy(unit->name, "GPIO", sizeof(unit->name));
> > > > -
> > > > -     list_add_tail(&unit->list, &dev->entities);
> > > > -
> > > > -     dev->gpio_unit = unit;
> > > > -
> > > > -     return 0;
> > > > -}
> > > > -
> > > > -static int uvc_gpio_init_irq(struct uvc_device *dev)
> > > > -{
> > > > -     struct uvc_entity *unit = dev->gpio_unit;
> > > > -     int ret;
> > > > -
> > > > -     if (!unit || unit->gpio.irq < 0)
> > > > -             return 0;
> > > > -
> > > > -     ret = request_threaded_irq(unit->gpio.irq, NULL, uvc_gpio_irq,
> > > > -                                IRQF_ONESHOT | IRQF_TRIGGER_FALLING |
> > > > -                                IRQF_TRIGGER_RISING,
> > > > -                                "uvc_privacy_gpio", dev);
> > > > -
> > > > -     unit->gpio.initialized = !ret;
> > > > -
> > > > -     return ret;
> > > > -}
> > > > -
> > > > -static void uvc_gpio_deinit(struct uvc_device *dev)
> > > > -{
> > > > -     if (!dev->gpio_unit || !dev->gpio_unit->gpio.initialized)
> > > > -             return;
> > > > -
> > > > -     free_irq(dev->gpio_unit->gpio.irq, dev);
> > > > -}
> > > > -
> > > >  /* ------------------------------------------------------------------------
> > > >   * UVC device scan
> > > >   */
> > > > diff --git a/drivers/media/usb/uvc/uvc_gpio.c b/drivers/media/usb/uvc/uvc_gpio.c
> > > > new file mode 100644
> > > > index 0000000000000000000000000000000000000000..30e3e6dd22cbc9cfee420dde7f7f64dbdce499b9
> > > > --- /dev/null
> > > > +++ b/drivers/media/usb/uvc/uvc_gpio.c
> > > > @@ -0,0 +1,123 @@
> > > > +// SPDX-License-Identifier: GPL-2.0-or-later
> > > > +/*
> > > > + *      uvc_gpio.c  --  USB Video Class driver
> > > > + *
> > > > + *      Copyright 2025 Google LLC
> > > > + */
> > > > +
> > > > +#include <linux/kernel.h>
> > > > +#include <linux/gpio/consumer.h>
> > > > +#include "uvcvideo.h"
> > > > +
> > > > +static void uvc_gpio_event(struct uvc_device *dev)
> > > > +{
> > > > +     struct uvc_entity *unit = dev->gpio_unit;
> > > > +     struct uvc_video_chain *chain;
> > > > +     u8 new_val;
> > > > +
> > > > +     if (!unit)
> > > > +             return;
> > > > +
> > > > +     new_val = gpiod_get_value_cansleep(unit->gpio.gpio_privacy);
> > > > +
> > > > +     /* GPIO entities are always on the first chain. */
> > > > +     chain = list_first_entry(&dev->chains, struct uvc_video_chain, list);
> > > > +     uvc_ctrl_status_event(chain, unit->controls, &new_val);
> > > > +}
> > > > +
> > > > +static int uvc_gpio_get_cur(struct uvc_device *dev, struct uvc_entity *entity,
> > > > +                         u8 cs, void *data, u16 size)
> > > > +{
> > > > +     if (cs != UVC_CT_PRIVACY_CONTROL || size < 1)
> > > > +             return -EINVAL;
> > > > +
> > > > +     *(u8 *)data = gpiod_get_value_cansleep(entity->gpio.gpio_privacy);
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static int uvc_gpio_get_info(struct uvc_device *dev, struct uvc_entity *entity,
> > > > +                          u8 cs, u8 *caps)
> > > > +{
> > > > +     if (cs != UVC_CT_PRIVACY_CONTROL)
> > > > +             return -EINVAL;
> > > > +
> > > > +     *caps = UVC_CONTROL_CAP_GET | UVC_CONTROL_CAP_AUTOUPDATE;
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static irqreturn_t uvc_gpio_irq(int irq, void *data)
> > > > +{
> > > > +     struct uvc_device *dev = data;
> > > > +
> > > > +     uvc_gpio_event(dev);
> > > > +     return IRQ_HANDLED;
> > > > +}
> > > > +
> > > > +int uvc_gpio_parse(struct uvc_device *dev)
> > > > +{
> > > > +     struct uvc_entity *unit;
> > > > +     struct gpio_desc *gpio_privacy;
> > > > +     int irq;
> > > > +
> > > > +     gpio_privacy = devm_gpiod_get_optional(&dev->intf->dev, "privacy",
> > > > +                                            GPIOD_IN);
> > > > +     if (!gpio_privacy)
> > > > +             return 0;
> > > > +
> > > > +     if (IS_ERR(gpio_privacy))
> > > > +             return dev_err_probe(&dev->intf->dev,
> > > > +                                  PTR_ERR(gpio_privacy),
> > > > +                                  "Can't get privacy GPIO\n");
> > > > +
> > > > +     irq = gpiod_to_irq(gpio_privacy);
> > > > +     if (irq < 0)
> > > > +             return dev_err_probe(&dev->intf->dev, irq,
> > > > +                                  "No IRQ for privacy GPIO\n");
> > > > +
> > > > +     unit = uvc_alloc_entity(UVC_EXT_GPIO_UNIT, UVC_EXT_GPIO_UNIT_ID, 0, 1);
> > > > +     if (!unit)
> > > > +             return -ENOMEM;
> > > > +
> > > > +     unit->gpio.gpio_privacy = gpio_privacy;
> > > > +     unit->gpio.irq = irq;
> > > > +     unit->gpio.bControlSize = 1;
> > > > +     unit->gpio.bmControls = (u8 *)unit + sizeof(*unit);
> > > > +     unit->gpio.bmControls[0] = 1;
> > > > +     unit->get_cur = uvc_gpio_get_cur;
> > > > +     unit->get_info = uvc_gpio_get_info;
> > > > +     strscpy(unit->name, "GPIO", sizeof(unit->name));
> > > > +
> > > > +     list_add_tail(&unit->list, &dev->entities);
> > > > +
> > > > +     dev->gpio_unit = unit;
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +int uvc_gpio_init_irq(struct uvc_device *dev)
> > > > +{
> > > > +     struct uvc_entity *unit = dev->gpio_unit;
> > > > +     int ret;
> > > > +
> > > > +     if (!unit || unit->gpio.irq < 0)
> > > > +             return 0;
> > > > +
> > > > +     ret = request_threaded_irq(unit->gpio.irq, NULL, uvc_gpio_irq,
> > > > +                                IRQF_ONESHOT | IRQF_TRIGGER_FALLING |
> > > > +                                IRQF_TRIGGER_RISING,
> > > > +                                "uvc_privacy_gpio", dev);
> > > > +
> > > > +     unit->gpio.initialized = !ret;
> > > > +
> > > > +     return ret;
> > > > +}
> > > > +
> > > > +void uvc_gpio_deinit(struct uvc_device *dev)
> > > > +{
> > > > +     if (!dev->gpio_unit || !dev->gpio_unit->gpio.initialized)
> > > > +             return;
> > > > +
> > > > +     free_irq(dev->gpio_unit->gpio.irq, dev);
> > > > +}
> > > > +
> > > > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > > > index b4ee701835fc016474d2cd2a0b67b2aa915c1c60..aef96b96499ce09ffa286c51793482afd9832097 100644
> > > > --- a/drivers/media/usb/uvc/uvcvideo.h
> > > > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > > > @@ -683,6 +683,8 @@ do {                                                                      \
> > > >   */
> > > >
> > > >  struct uvc_entity *uvc_entity_by_id(struct uvc_device *dev, int id);
> > > > +struct uvc_entity *uvc_alloc_entity(u16 type, u16 id, unsigned int num_pads,
> > > > +                                 unsigned int extra_size);
> > > >
> > > >  /* Video buffers queue management. */
> > > >  int uvc_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type);
> > > > @@ -829,4 +831,8 @@ void uvc_debugfs_cleanup_stream(struct uvc_streaming *stream);
> > > >  size_t uvc_video_stats_dump(struct uvc_streaming *stream, char *buf,
> > > >                           size_t size);
> > > >
> > > > +/* gpio */
> > > > +int uvc_gpio_parse(struct uvc_device *dev);
> > > > +int uvc_gpio_init_irq(struct uvc_device *dev);
> > > > +void uvc_gpio_deinit(struct uvc_device *dev);
> > > >  #endif
> > > >
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

