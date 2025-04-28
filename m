Return-Path: <linux-gpio+bounces-19424-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E9DA9F484
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 17:33:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7614317E6F3
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 15:33:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E12A279904;
	Mon, 28 Apr 2025 15:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Z5tjrcrf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC86826F47F
	for <linux-gpio@vger.kernel.org>; Mon, 28 Apr 2025 15:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745854391; cv=none; b=b1Wn47ReVwax7+QUzWNvHe8FBdamNQgLFV/MH0NcCByb+rEO09ojO0EjmIZuW7RLl38S8lloYqIcHpOPsURqRkHv9kE2b2I5R8LMMK9JT0ILkOtxMMp654lmgP36/4jVb7NbrDxBGO08nzxKfD3AxghRRyYgpkgxEd7oJSH0neg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745854391; c=relaxed/simple;
	bh=3RkcV1mJSdBVLKXnP092JtjTS1ioFCIhKWkATUM0Ols=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ni40+KlZOoTLQ4GTFM/B0Pz/95WslD6FZ3nSwEXnA1DiCE5ay18ETkV4P3cBasl1Fg+tkhoUGv6OXP9m0LB7a4EVCTAf3XeBCNjF7H0o2MgEmHjIssYrRcQtTDXDbEWfCm1HdvMylOSNLkNSov8AkkiJpLv2WFXXIJ/xCDl8Zto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Z5tjrcrf; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54d6f933152so6656205e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 28 Apr 2025 08:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745854387; x=1746459187; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9WuwtIohfhi7g92ooy28Ov5X+M+ATrx4yIp+s+NkPjE=;
        b=Z5tjrcrffIPFnJ+vXsTdRfshNGLzDg9rFiAS7u+pD/nvdoxrVqOrS8LYpzZW/7E1hG
         yxrvu01Vll51ywlO5UHuqqxPRWlATKnsX5WwhPAggA2tcXk3wxrDcNZqCxMmOy5qQnx9
         W+3ibz2HvnOe6ETUjCRyrCRxVqxDZBniaHx7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745854387; x=1746459187;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9WuwtIohfhi7g92ooy28Ov5X+M+ATrx4yIp+s+NkPjE=;
        b=PYEE30rWCxEexavevIf2xZnohD1kh+zvtFOI4ar1hmDN6NwOlECWJTSxtEaYRAL/yg
         tS3VGfB/2l3y97grGTaGb5FxAzyukfR2nRACApfIFVkwAmTVJu+8SYgIEEin4mLAZKbb
         I2sPzdyCEdI6dGAV/7iSzeNemDVA4gfKO+vkmqXHCOWJVMtw7OTea2VjVs79+JXWdgpE
         36u4kEfYL+SmRPgXPSZPfayDq1jokfJqwXA/kWTxacGaqnochSboJUCe7g3RvazOzaXh
         iVkPjcnU3CY4LZPbGiu2l0AhdUYhKUaApPODSJgpCZM4jfJYwKkdQ2aWL+oY+qAMwt9c
         kSmA==
X-Forwarded-Encrypted: i=1; AJvYcCUncJlTJXEuxYKyhLh+tFRg5YexL8g0RPPIGNJ8Um6iOkjL7sWwYDPds0qJS2s4j/bEECpPMbEBSDw/@vger.kernel.org
X-Gm-Message-State: AOJu0Yx79IaXeLBEmH9Wbc3l3o9HmCNpWtrBF7+H5r7c+pAVaXAoGoR7
	Bux5qzsGx91R3XyBukDkgP1T3ggYEzoPm10j5n4TE3irxoLolrVukwO/y/Xy8t250P+n55tPZXw
	=
X-Gm-Gg: ASbGnctUMd8iQ7BiZe0lebY1/f4vb68y9CUJ+MRNFrP3vZS89a2S3Gt6tXxWELqjTWI
	iilE5iYmnafnynjGDOxCOttf180HDrcXSx0W4DUwrwKXxDZZOa3NbmnHRGsY1VciLGabX2ydtep
	to1/Zhao3xiz8rmUSkY/dCw90KUPoHkstFpq8oloD8LoG3u3c+JyYP9gvRqJixDhAyaJ1g9Sunc
	OdgggJEye4BJd4jsGxDQ60q8xr4LbRsS1XZ1BIlbCySJyn0KNsd/1YgiPrwOuyfu4FWnRcMsTbd
	vUAH8iyI8/AqcS/ccvvoflnINoKb7pGnZZb8r4W8aFI+htbkvVT5peHXLC9fsoKm1qCAnXPwBU6
	UEpU0jY4=
X-Google-Smtp-Source: AGHT+IHRToBYvaBsoVQE86T9aJDmteD5HlTXEt6sGy3VvPUJR3emOpB3MyujuMjCtKWM7kYOZfOWQg==
X-Received: by 2002:a05:6512:39d4:b0:545:5bd:bf42 with SMTP id 2adb3069b0e04-54e900012cfmr2609746e87.36.1745854386564;
        Mon, 28 Apr 2025 08:33:06 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb408f5sm1689186e87.104.2025.04.28.08.33.03
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 08:33:05 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30db1bd3bebso52431421fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 28 Apr 2025 08:33:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWjNI8gQDHWq3IT64TGLOdUjZf6z77c52Se7FY/16U6AC9SvsaImHVWXG54smoPwJbeYnc3lUMJDNLe@vger.kernel.org
X-Received: by 2002:a2e:a98a:0:b0:30b:f924:357c with SMTP id
 38308e7fff4ca-319dc0211damr26226941fa.15.1745854383126; Mon, 28 Apr 2025
 08:33:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403-uvc-orientation-v1-0-1a0cc595a62d@chromium.org>
 <20250403-uvc-orientation-v1-6-1a0cc595a62d@chromium.org> <20250422212824.GQ17813@pendragon.ideasonboard.com>
 <CANiDSCuOaZ9bnd20tGLWzOA7cGA2q+oKdGktvouT-8+cUkHF1w@mail.gmail.com>
 <20250422222517.GU17813@pendragon.ideasonboard.com> <CANiDSCv3om=6puzMVC0OYAqsKGdH+JJQ-unmizhRmYLyTfKxkQ@mail.gmail.com>
 <f2b15a53-c4a6-4434-9e7b-b231b4054fba@redhat.com>
In-Reply-To: <f2b15a53-c4a6-4434-9e7b-b231b4054fba@redhat.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 28 Apr 2025 17:32:49 +0200
X-Gmail-Original-Message-ID: <CANiDSCvq-yo=Cc4pWoTwOdj0ak2Pes+ZQX-Sxu3ccwcOw5sdxA@mail.gmail.com>
X-Gm-Features: ATxdqUEMUfe-MJTP1D_4mbueh1kaMY1YVv5iJ4f--XCyekjYNLPoYK6voLU0diQ
Message-ID: <CANiDSCvq-yo=Cc4pWoTwOdj0ak2Pes+ZQX-Sxu3ccwcOw5sdxA@mail.gmail.com>
Subject: Re: [PATCH 6/8] media: uvcvideo: Factor out gpio functions to its own file
To: Hans de Goede <hdegoede@redhat.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Hans

On Mon, 28 Apr 2025 at 16:07, Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 23-Apr-25 00:35, Ricardo Ribalda wrote:
> > On Wed, 23 Apr 2025 at 06:25, Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> >>
> >> On Wed, Apr 23, 2025 at 06:20:09AM +0800, Ricardo Ribalda wrote:
> >>> Hi Laurent
> >>>
> >>> On Wed, 23 Apr 2025 at 05:28, Laurent Pinchart
> >>> <laurent.pinchart@ideasonboard.com> wrote:
> >>>>
> >>>> Hi Ricardo,
> >>>>
> >>>> Thank you for the patch.
> >>>>
> >>>> Hans raised an issue on "[PATCH v3 2/8] media: uvcvideo: Factor out gpio
> >>>> functions to its own file" (part of "[PATCH v3 0/8] media: uvcvideo:
> >>>> Implement the Privacy GPIO as a evdev"), asking if GPIO handling should
> >>>> still use a uvc_entity if it moves to a evdev. There are implications on
> >>>> this series too. Unless I'm mistaken, I haven't seen a reply from you to
> >>>> my last e-mail. Can we please first finish that discussion ?
> >>>
> >>> Are you referring to:
> >>> https://lore.kernel.org/all/0dfb780b-f2dc-43ed-a67d-afd5f50bb88f@redhat.com/
> >>> ?
> >>
> >> I was referring to https://lore.kernel.org/all/20241125214523.GW19381@pendragon.ideasonboard.com/
> >
> > I believe the three of us agreed to remove the entity. Am I missing something?
>
> That is what I remember too.
>
> 2 other remarks:
>
> 1. About this patch, what is this patch doing in *this* series, outside of exporting
> uvc_alloc_entity(), I don't think we need this here. So for v2 I would prefer to
> have this replaced with a patch just making uvc_alloc_entity() non static.
>
> That avoids unnecessary dependencies between this series and the GPIO privacy control
> use evdev series. Any conflicts from exporting uvc_alloc_entity() in this series should
> be trivial to fix.

will do

>
> 2. About the series making the GPIO privacy control use evdev, if I've understood
> things correctly the main motivation for that was power-consumption reasons and with
> the granular power management series sitting in uvc/next those reasons are gone ?

For ChromeOS that was the main motivation, you are correct. But I
still see the value of unifying the userspace API.

If you want to review that set (with low prio) that would be appreciated.

Regards!

>
> It would still be good to move to evdev to unify the userspace API with various
> x86 laptop EC/ACPI drivers, but AFAIK this is a somewhat lower priority series to
> get merged now because the power-consumption issues are resolved now, right ?
>
> Regards,
>
> Hans
>
>
>
> >>>> On Thu, Apr 03, 2025 at 07:16:17PM +0000, Ricardo Ribalda wrote:
> >>>>> This is just a refactor patch, no new functionality is added.
> >>>>>
> >>>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> >>>>> ---
> >>>>>  drivers/media/usb/uvc/Makefile     |   3 +-
> >>>>>  drivers/media/usb/uvc/uvc_driver.c | 121 +-----------------------------------
> >>>>>  drivers/media/usb/uvc/uvc_gpio.c   | 123 +++++++++++++++++++++++++++++++++++++
> >>>>>  drivers/media/usb/uvc/uvcvideo.h   |   6 ++
> >>>>>  4 files changed, 133 insertions(+), 120 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/media/usb/uvc/Makefile b/drivers/media/usb/uvc/Makefile
> >>>>> index 4f9eee4f81ab6436a8b90324a688a149b2c3bcd1..85514b6e538fbb8284e574ca14700f2d749e1a2e 100644
> >>>>> --- a/drivers/media/usb/uvc/Makefile
> >>>>> +++ b/drivers/media/usb/uvc/Makefile
> >>>>> @@ -1,6 +1,7 @@
> >>>>>  # SPDX-License-Identifier: GPL-2.0
> >>>>>  uvcvideo-objs  := uvc_driver.o uvc_queue.o uvc_v4l2.o uvc_video.o uvc_ctrl.o \
> >>>>> -               uvc_status.o uvc_isight.o uvc_debugfs.o uvc_metadata.o
> >>>>> +               uvc_status.o uvc_isight.o uvc_debugfs.o uvc_metadata.o \
> >>>>> +               uvc_gpio.o
> >>>>>  ifeq ($(CONFIG_MEDIA_CONTROLLER),y)
> >>>>>  uvcvideo-objs  += uvc_entity.o
> >>>>>  endif
> >>>>> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> >>>>> index da24a655ab68cc0957762f2b67387677c22224d1..b52e1ff401e24f69b867b5e975cda4260463e760 100644
> >>>>> --- a/drivers/media/usb/uvc/uvc_driver.c
> >>>>> +++ b/drivers/media/usb/uvc/uvc_driver.c
> >>>>> @@ -8,7 +8,6 @@
> >>>>>
> >>>>>  #include <linux/atomic.h>
> >>>>>  #include <linux/bits.h>
> >>>>> -#include <linux/gpio/consumer.h>
> >>>>>  #include <linux/kernel.h>
> >>>>>  #include <linux/list.h>
> >>>>>  #include <linux/module.h>
> >>>>> @@ -792,8 +791,8 @@ static const u8 uvc_media_transport_input_guid[16] =
> >>>>>       UVC_GUID_UVC_MEDIA_TRANSPORT_INPUT;
> >>>>>  static const u8 uvc_processing_guid[16] = UVC_GUID_UVC_PROCESSING;
> >>>>>
> >>>>> -static struct uvc_entity *uvc_alloc_entity(u16 type, u16 id,
> >>>>> -             unsigned int num_pads, unsigned int extra_size)
> >>>>> +struct uvc_entity *u16 type, u16 id, unsigned int num_pads,
> >>>>> +                                 unsigned int extra_size)
> >>>>>  {
> >>>>>       struct uvc_entity *entity;
> >>>>>       unsigned int num_inputs;
> >>>>> @@ -1242,122 +1241,6 @@ static int uvc_parse_control(struct uvc_device *dev)
> >>>>>       return 0;
> >>>>>  }
> >>>>>
> >>>>> -/* -----------------------------------------------------------------------------
> >>>>> - * Privacy GPIO
> >>>>> - */
> >>>>> -
> >>>>> -static void uvc_gpio_event(struct uvc_device *dev)
> >>>>> -{
> >>>>> -     struct uvc_entity *unit = dev->gpio_unit;
> >>>>> -     struct uvc_video_chain *chain;
> >>>>> -     u8 new_val;
> >>>>> -
> >>>>> -     if (!unit)
> >>>>> -             return;
> >>>>> -
> >>>>> -     new_val = gpiod_get_value_cansleep(unit->gpio.gpio_privacy);
> >>>>> -
> >>>>> -     /* GPIO entities are always on the first chain. */
> >>>>> -     chain = list_first_entry(&dev->chains, struct uvc_video_chain, list);
> >>>>> -     uvc_ctrl_status_event(chain, unit->controls, &new_val);
> >>>>> -}
> >>>>> -
> >>>>> -static int uvc_gpio_get_cur(struct uvc_device *dev, struct uvc_entity *entity,
> >>>>> -                         u8 cs, void *data, u16 size)
> >>>>> -{
> >>>>> -     if (cs != UVC_CT_PRIVACY_CONTROL || size < 1)
> >>>>> -             return -EINVAL;
> >>>>> -
> >>>>> -     *(u8 *)data = gpiod_get_value_cansleep(entity->gpio.gpio_privacy);
> >>>>> -
> >>>>> -     return 0;
> >>>>> -}
> >>>>> -
> >>>>> -static int uvc_gpio_get_info(struct uvc_device *dev, struct uvc_entity *entity,
> >>>>> -                          u8 cs, u8 *caps)
> >>>>> -{
> >>>>> -     if (cs != UVC_CT_PRIVACY_CONTROL)
> >>>>> -             return -EINVAL;
> >>>>> -
> >>>>> -     *caps = UVC_CONTROL_CAP_GET | UVC_CONTROL_CAP_AUTOUPDATE;
> >>>>> -     return 0;
> >>>>> -}
> >>>>> -
> >>>>> -static irqreturn_t uvc_gpio_irq(int irq, void *data)
> >>>>> -{
> >>>>> -     struct uvc_device *dev = data;
> >>>>> -
> >>>>> -     uvc_gpio_event(dev);
> >>>>> -     return IRQ_HANDLED;
> >>>>> -}
> >>>>> -
> >>>>> -static int uvc_gpio_parse(struct uvc_device *dev)
> >>>>> -{
> >>>>> -     struct uvc_entity *unit;
> >>>>> -     struct gpio_desc *gpio_privacy;
> >>>>> -     int irq;
> >>>>> -
> >>>>> -     gpio_privacy = devm_gpiod_get_optional(&dev->intf->dev, "privacy",
> >>>>> -                                            GPIOD_IN);
> >>>>> -     if (!gpio_privacy)
> >>>>> -             return 0;
> >>>>> -
> >>>>> -     if (IS_ERR(gpio_privacy))
> >>>>> -             return dev_err_probe(&dev->intf->dev,
> >>>>> -                                  PTR_ERR(gpio_privacy),
> >>>>> -                                  "Can't get privacy GPIO\n");
> >>>>> -
> >>>>> -     irq = gpiod_to_irq(gpio_privacy);
> >>>>> -     if (irq < 0)
> >>>>> -             return dev_err_probe(&dev->intf->dev, irq,
> >>>>> -                                  "No IRQ for privacy GPIO\n");
> >>>>> -
> >>>>> -     unit = uvc_alloc_entity(UVC_EXT_GPIO_UNIT, UVC_EXT_GPIO_UNIT_ID, 0, 1);
> >>>>> -     if (!unit)
> >>>>> -             return -ENOMEM;
> >>>>> -
> >>>>> -     unit->gpio.gpio_privacy = gpio_privacy;
> >>>>> -     unit->gpio.irq = irq;
> >>>>> -     unit->gpio.bControlSize = 1;
> >>>>> -     unit->gpio.bmControls = (u8 *)unit + sizeof(*unit);
> >>>>> -     unit->gpio.bmControls[0] = 1;
> >>>>> -     unit->get_cur = uvc_gpio_get_cur;
> >>>>> -     unit->get_info = uvc_gpio_get_info;
> >>>>> -     strscpy(unit->name, "GPIO", sizeof(unit->name));
> >>>>> -
> >>>>> -     list_add_tail(&unit->list, &dev->entities);
> >>>>> -
> >>>>> -     dev->gpio_unit = unit;
> >>>>> -
> >>>>> -     return 0;
> >>>>> -}
> >>>>> -
> >>>>> -static int uvc_gpio_init_irq(struct uvc_device *dev)
> >>>>> -{
> >>>>> -     struct uvc_entity *unit = dev->gpio_unit;
> >>>>> -     int ret;
> >>>>> -
> >>>>> -     if (!unit || unit->gpio.irq < 0)
> >>>>> -             return 0;
> >>>>> -
> >>>>> -     ret = request_threaded_irq(unit->gpio.irq, NULL, uvc_gpio_irq,
> >>>>> -                                IRQF_ONESHOT | IRQF_TRIGGER_FALLING |
> >>>>> -                                IRQF_TRIGGER_RISING,
> >>>>> -                                "uvc_privacy_gpio", dev);
> >>>>> -
> >>>>> -     unit->gpio.initialized = !ret;
> >>>>> -
> >>>>> -     return ret;
> >>>>> -}
> >>>>> -
> >>>>> -static void uvc_gpio_deinit(struct uvc_device *dev)
> >>>>> -{
> >>>>> -     if (!dev->gpio_unit || !dev->gpio_unit->gpio.initialized)
> >>>>> -             return;
> >>>>> -
> >>>>> -     free_irq(dev->gpio_unit->gpio.irq, dev);
> >>>>> -}
> >>>>> -
> >>>>>  /* ------------------------------------------------------------------------
> >>>>>   * UVC device scan
> >>>>>   */
> >>>>> diff --git a/drivers/media/usb/uvc/uvc_gpio.c b/drivers/media/usb/uvc/uvc_gpio.c
> >>>>> new file mode 100644
> >>>>> index 0000000000000000000000000000000000000000..30e3e6dd22cbc9cfee420dde7f7f64dbdce499b9
> >>>>> --- /dev/null
> >>>>> +++ b/drivers/media/usb/uvc/uvc_gpio.c
> >>>>> @@ -0,0 +1,123 @@
> >>>>> +// SPDX-License-Identifier: GPL-2.0-or-later
> >>>>> +/*
> >>>>> + *      uvc_gpio.c  --  USB Video Class driver
> >>>>> + *
> >>>>> + *      Copyright 2025 Google LLC
> >>>>> + */
> >>>>> +
> >>>>> +#include <linux/kernel.h>
> >>>>> +#include <linux/gpio/consumer.h>
> >>>>> +#include "uvcvideo.h"
> >>>>> +
> >>>>> +static void uvc_gpio_event(struct uvc_device *dev)
> >>>>> +{
> >>>>> +     struct uvc_entity *unit = dev->gpio_unit;
> >>>>> +     struct uvc_video_chain *chain;
> >>>>> +     u8 new_val;
> >>>>> +
> >>>>> +     if (!unit)
> >>>>> +             return;
> >>>>> +
> >>>>> +     new_val = gpiod_get_value_cansleep(unit->gpio.gpio_privacy);
> >>>>> +
> >>>>> +     /* GPIO entities are always on the first chain. */
> >>>>> +     chain = list_first_entry(&dev->chains, struct uvc_video_chain, list);
> >>>>> +     uvc_ctrl_status_event(chain, unit->controls, &new_val);
> >>>>> +}
> >>>>> +
> >>>>> +static int uvc_gpio_get_cur(struct uvc_device *dev, struct uvc_entity *entity,
> >>>>> +                         u8 cs, void *data, u16 size)
> >>>>> +{
> >>>>> +     if (cs != UVC_CT_PRIVACY_CONTROL || size < 1)
> >>>>> +             return -EINVAL;
> >>>>> +
> >>>>> +     *(u8 *)data = gpiod_get_value_cansleep(entity->gpio.gpio_privacy);
> >>>>> +
> >>>>> +     return 0;
> >>>>> +}
> >>>>> +
> >>>>> +static int uvc_gpio_get_info(struct uvc_device *dev, struct uvc_entity *entity,
> >>>>> +                          u8 cs, u8 *caps)
> >>>>> +{
> >>>>> +     if (cs != UVC_CT_PRIVACY_CONTROL)
> >>>>> +             return -EINVAL;
> >>>>> +
> >>>>> +     *caps = UVC_CONTROL_CAP_GET | UVC_CONTROL_CAP_AUTOUPDATE;
> >>>>> +     return 0;
> >>>>> +}
> >>>>> +
> >>>>> +static irqreturn_t uvc_gpio_irq(int irq, void *data)
> >>>>> +{
> >>>>> +     struct uvc_device *dev = data;
> >>>>> +
> >>>>> +     uvc_gpio_event(dev);
> >>>>> +     return IRQ_HANDLED;
> >>>>> +}
> >>>>> +
> >>>>> +int uvc_gpio_parse(struct uvc_device *dev)
> >>>>> +{
> >>>>> +     struct uvc_entity *unit;
> >>>>> +     struct gpio_desc *gpio_privacy;
> >>>>> +     int irq;
> >>>>> +
> >>>>> +     gpio_privacy = devm_gpiod_get_optional(&dev->intf->dev, "privacy",
> >>>>> +                                            GPIOD_IN);
> >>>>> +     if (!gpio_privacy)
> >>>>> +             return 0;
> >>>>> +
> >>>>> +     if (IS_ERR(gpio_privacy))
> >>>>> +             return dev_err_probe(&dev->intf->dev,
> >>>>> +                                  PTR_ERR(gpio_privacy),
> >>>>> +                                  "Can't get privacy GPIO\n");
> >>>>> +
> >>>>> +     irq = gpiod_to_irq(gpio_privacy);
> >>>>> +     if (irq < 0)
> >>>>> +             return dev_err_probe(&dev->intf->dev, irq,
> >>>>> +                                  "No IRQ for privacy GPIO\n");
> >>>>> +
> >>>>> +     unit = uvc_alloc_entity(UVC_EXT_GPIO_UNIT, UVC_EXT_GPIO_UNIT_ID, 0, 1);
> >>>>> +     if (!unit)
> >>>>> +             return -ENOMEM;
> >>>>> +
> >>>>> +     unit->gpio.gpio_privacy = gpio_privacy;
> >>>>> +     unit->gpio.irq = irq;
> >>>>> +     unit->gpio.bControlSize = 1;
> >>>>> +     unit->gpio.bmControls = (u8 *)unit + sizeof(*unit);
> >>>>> +     unit->gpio.bmControls[0] = 1;
> >>>>> +     unit->get_cur = uvc_gpio_get_cur;
> >>>>> +     unit->get_info = uvc_gpio_get_info;
> >>>>> +     strscpy(unit->name, "GPIO", sizeof(unit->name));
> >>>>> +
> >>>>> +     list_add_tail(&unit->list, &dev->entities);
> >>>>> +
> >>>>> +     dev->gpio_unit = unit;
> >>>>> +
> >>>>> +     return 0;
> >>>>> +}
> >>>>> +
> >>>>> +int uvc_gpio_init_irq(struct uvc_device *dev)
> >>>>> +{
> >>>>> +     struct uvc_entity *unit = dev->gpio_unit;
> >>>>> +     int ret;
> >>>>> +
> >>>>> +     if (!unit || unit->gpio.irq < 0)
> >>>>> +             return 0;
> >>>>> +
> >>>>> +     ret = request_threaded_irq(unit->gpio.irq, NULL, uvc_gpio_irq,
> >>>>> +                                IRQF_ONESHOT | IRQF_TRIGGER_FALLING |
> >>>>> +                                IRQF_TRIGGER_RISING,
> >>>>> +                                "uvc_privacy_gpio", dev);
> >>>>> +
> >>>>> +     unit->gpio.initialized = !ret;
> >>>>> +
> >>>>> +     return ret;
> >>>>> +}
> >>>>> +
> >>>>> +void uvc_gpio_deinit(struct uvc_device *dev)
> >>>>> +{
> >>>>> +     if (!dev->gpio_unit || !dev->gpio_unit->gpio.initialized)
> >>>>> +             return;
> >>>>> +
> >>>>> +     free_irq(dev->gpio_unit->gpio.irq, dev);
> >>>>> +}
> >>>>> +
> >>>>> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> >>>>> index b4ee701835fc016474d2cd2a0b67b2aa915c1c60..aef96b96499ce09ffa286c51793482afd9832097 100644
> >>>>> --- a/drivers/media/usb/uvc/uvcvideo.h
> >>>>> +++ b/drivers/media/usb/uvc/uvcvideo.h
> >>>>> @@ -683,6 +683,8 @@ do {                                                                      \
> >>>>>   */
> >>>>>
> >>>>>  struct uvc_entity *uvc_entity_by_id(struct uvc_device *dev, int id);
> >>>>> +struct uvc_entity *uvc_alloc_entity(u16 type, u16 id, unsigned int num_pads,
> >>>>> +                                 unsigned int extra_size);
> >>>>>
> >>>>>  /* Video buffers queue management. */
> >>>>>  int uvc_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type);
> >>>>> @@ -829,4 +831,8 @@ void uvc_debugfs_cleanup_stream(struct uvc_streaming *stream);
> >>>>>  size_t uvc_video_stats_dump(struct uvc_streaming *stream, char *buf,
> >>>>>                           size_t size);
> >>>>>
> >>>>> +/* gpio */
> >>>>> +int uvc_gpio_parse(struct uvc_device *dev);
> >>>>> +int uvc_gpio_init_irq(struct uvc_device *dev);
> >>>>> +void uvc_gpio_deinit(struct uvc_device *dev);
> >>>>>  #endif
> >>>>>
> >>
> >> --
> >> Regards,
> >>
> >> Laurent Pinchart
> >
> >
> >
>


-- 
Ricardo Ribalda

