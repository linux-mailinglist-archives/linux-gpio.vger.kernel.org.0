Return-Path: <linux-gpio+bounces-19117-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E470A95A1D
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Apr 2025 02:24:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37A161896950
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Apr 2025 00:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8564313C67C;
	Tue, 22 Apr 2025 00:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gxem5lhJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBCD7603F
	for <linux-gpio@vger.kernel.org>; Tue, 22 Apr 2025 00:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745281454; cv=none; b=u2xei1zKfqWx1Yz/+aX60qmU+gkKV3x71z0F/7L79husxSIbtfBv1mQtdcbvuJIMPN/JitO7/yA3ZUIQOrx5Ma1nagsO2zuNJXOz5/M4Umfo9rwfgnMufODGIATznw2N+nAEErWs7FlLa+RbeJKUmeRaKTfPHmrpaTUoSFDJ1+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745281454; c=relaxed/simple;
	bh=u52bVrB/pZ0lfovnX74KF6WwBxpQoIaVYqukYlfqcMg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XqvspS3+CtsFY27WA1c0Avl6OuhzN8C1Gm6KzyiH5OFgCzP03kq2s/uRoXE6xrxchGVxR90RCU5VVJwhIUmFjHT+x1HOi/WiM3mkEAmsk38HV1H3lIF7HDar45y8eGLJIqt6RzacXfmHgQGUHsCADoR4skZfS4w8HiMmVKEphgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gxem5lhJ; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54b10956398so5317552e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 21 Apr 2025 17:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745281450; x=1745886250; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hfCnlXym9eZAbX+zdYaRO3WcEjSZxfzTyz2pRkP+wp4=;
        b=gxem5lhJ+4DHlvLI3uNia58B73VfYi7pHotLLMwrnPEwyeKAnuPKgbgz4ZnhNLzGSe
         6MNIomgzHCv/S/WDtolKl8Pim3obpqcm4/HlrlY08q3p7Av4G/tdyuxDQWWGkDS8whZY
         Ary/n2nS5YKkjIn6JYHl0c36xfrMFreeuiizQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745281450; x=1745886250;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hfCnlXym9eZAbX+zdYaRO3WcEjSZxfzTyz2pRkP+wp4=;
        b=bhL3+NJTE2St0vHQbPx+YC8J5zsyK4ohH1v8q61vNTE0R+VplvcLJyjDwPkZ0K+FDH
         AhUQhg3Qw19ZdjBEeBji8L8tJCkOOUGUBZUS3lhaQ6SdDTpuSKXk1wB92QOVqT3QNFBb
         iwvO6G0tdqehCawONhGpfV/OLHJ6+cQSu3tGVysXn0Gq9eZKFonwKPxyWSo9P8eDDB2n
         XZtAivzj3tnmdpbjpBzSz0FHWpiaoEsOrihZo/2b8zmgOd3e5+QLpfvGm8W3Bf+F1fhU
         qZB2XhXhsaIEk3uQtgESQtQCuSI0KiTGAsLqKfKKQZu6YLcbWSEGiEgn55pyavZZLWnX
         HONw==
X-Forwarded-Encrypted: i=1; AJvYcCXVMeIAG2x7MJTlsklkALKAHuNcOiFetds2HDuEjARJAGL1RMmLiJlPA0xWZlv0wc5e65TGV+8Fo7Vy@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp/FYIehyezTTk6zKFwosYW4GU9q/vQjGmnju+Z0XZto7Oj7M9
	/aR03n3yi5FXNJQEkt6nT6YugAMk6Uke8qrKADi7BGM913HOuQaiRwRYKB2RSauL2ToewfkGEkQ
	=
X-Gm-Gg: ASbGncvAKuQOZjzkoWbsvCK2OPqVBWVRGP3kOo3h2LFYNN28KZ1Mr+I+62EGbsy7QnR
	i2BCmKbEHs+nezAkaDlw8Wo1CljeTtJLt9lfW8KaOQ8HeY7jVQJTYI/uaPYtaEnSG86UmGGw5Iv
	qIi6Es6SuIILBJ/k2XFuwLiXFFPUky8cmc9fYfgN56TU/QJHjxf0yirt5yVUBzkhaYSOX4ETmGw
	gPYNR3lXVmhG4kg6LbGQZNAg8Whxqx+MNM4Hzp/fXz6mOfOX8aSp1UyBoPaNWPZL+8PR8jTdLF0
	YBM2Ud6GMLRvfwgh2NcVljIPMAVJeIxWGUYz785agiVKFo5hkfoHTDy/u2MHQ9a/495fB4GjRZf
	RZ5y+Qjk=
X-Google-Smtp-Source: AGHT+IFbODrgwyL0swG78W/FiwBrYxbXaiMTmmys3s+rjcJmgEswVid6xDLerLDMdiU+MN8+KFzUZQ==
X-Received: by 2002:ac2:4f16:0:b0:549:94c4:9f01 with SMTP id 2adb3069b0e04-54d6dbbdc77mr4675827e87.6.1745281450366;
        Mon, 21 Apr 2025 17:24:10 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-31090850bb2sm13121211fa.107.2025.04.21.17.24.07
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 17:24:10 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30bee278c2aso56927041fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 21 Apr 2025 17:24:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX9y3EOk3XKVnRx7VbR4F7nBjuZ13DwQMIjLK9wU5YbBlxkWJcw6X3JlFHIlmljt3tnzPh97aHSykxT@vger.kernel.org
X-Received: by 2002:a05:6512:3995:b0:54a:cc10:1050 with SMTP id
 2adb3069b0e04-54d6e789b2bmr3360285e87.15.1745281447045; Mon, 21 Apr 2025
 17:24:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403-uvc-orientation-v1-0-1a0cc595a62d@chromium.org>
 <20250403-uvc-orientation-v1-3-1a0cc595a62d@chromium.org> <Z_uIyEe4uU_BC5aY@valkosipuli.retiisi.eu>
In-Reply-To: <Z_uIyEe4uU_BC5aY@valkosipuli.retiisi.eu>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 22 Apr 2025 08:23:52 +0800
X-Gmail-Original-Message-ID: <CANiDSCvQC25ZrSZgUuFt6deCogFL6=GPsYYrsegK1NOK=uzRJA@mail.gmail.com>
X-Gm-Features: ATxdqUGV9UNm6rsWa1b6fT7zaIeRsrhtYZHR863_Li8k5tC_mUahvNyGq--RUEU
Message-ID: <CANiDSCvQC25ZrSZgUuFt6deCogFL6=GPsYYrsegK1NOK=uzRJA@mail.gmail.com>
Subject: Re: [PATCH 3/8] media: v4l: fwnode: Support acpi devices for v4l2_fwnode_device_parse
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hdegoede@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sakari

On Sun, 13 Apr 2025 at 17:50, Sakari Ailus <sakari.ailus@iki.fi> wrote:
>
> Hi Ricardo,
>
> Thanks for the patch.
>
> On Thu, Apr 03, 2025 at 07:16:14PM +0000, Ricardo Ribalda wrote:
> > This patch modifies v4l2_fwnode_device_parse() to support ACPI devices.
> >
> > We initially add support only for orientation via the ACPI _PLD method.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/v4l2-core/v4l2-fwnode.c | 58 +++++++++++++++++++++++++++++++----
> >  1 file changed, 52 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> > index cb153ce42c45d69600a3ec4e59a5584d7e791a2a..81563c36b6436bb61e1c96f2a5ede3fa9d64dab3 100644
> > --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> > +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> > @@ -15,6 +15,7 @@
> >   * Author: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
> >   */
> >  #include <linux/acpi.h>
> > +#include <acpi/acpi_bus.h>
> >  #include <linux/kernel.h>
> >  #include <linux/mm.h>
> >  #include <linux/module.h>
> > @@ -807,16 +808,47 @@ int v4l2_fwnode_connector_add_link(struct fwnode_handle *fwnode,
> >  }
> >  EXPORT_SYMBOL_GPL(v4l2_fwnode_connector_add_link);
> >
> > -int v4l2_fwnode_device_parse(struct device *dev,
> > -                          struct v4l2_fwnode_device_properties *props)
> > +static int v4l2_fwnode_device_parse_acpi(struct device *dev,
> > +                                      struct v4l2_fwnode_device_properties *props)
> > +{
> > +     struct acpi_pld_info *pld;
> > +     int ret = 0;
> > +
> > +     if (!acpi_get_physical_device_location(ACPI_HANDLE(dev), &pld)) {
> > +             dev_dbg(dev, "acpi _PLD call failed\n");
> > +             return 0;
> > +     }
>
> You could have software nodes in an ACPI system as well as DT-aligned
> properties. They're not the primary means to convey this information still.
>
> How about returning e.g. -ENODATA here if _PLD doesn't exist for the device
> and then proceeding to parse properties as in DT?

Do you mean that there can be devices with ACPI handles that can also
have DT properties?

Wow that is new to me :).

What shall we do if _PLD contradicts the DT property? What takes precedence?

>
> > +
> > +     switch (pld->panel) {
> > +     case ACPI_PLD_PANEL_FRONT:
> > +             props->orientation = V4L2_FWNODE_ORIENTATION_FRONT;
> > +             break;
> > +     case ACPI_PLD_PANEL_BACK:
> > +             props->orientation = V4L2_FWNODE_ORIENTATION_BACK;
> > +             break;
> > +     case ACPI_PLD_PANEL_TOP:
> > +     case ACPI_PLD_PANEL_LEFT:
> > +     case ACPI_PLD_PANEL_RIGHT:
> > +     case ACPI_PLD_PANEL_UNKNOWN:
> > +             props->orientation = V4L2_FWNODE_ORIENTATION_EXTERNAL;
> > +             break;
>
> How about the rotation in _PLD?

If we agree on the orientation part I will extend it to support
rotation. It should not be a complicated change.

>
> > +     default:
> > +             dev_dbg(dev, "Unknown _PLD panel val %d\n", pld->panel);
> > +             ret = -EINVAL;
> > +             break;
> > +     }
> > +
> > +     ACPI_FREE(pld);
> > +     return ret;
> > +}
> > +
> > +static int v4l2_fwnode_device_parse_dt(struct device *dev,
> > +                                    struct v4l2_fwnode_device_properties *props)
> >  {
> >       struct fwnode_handle *fwnode = dev_fwnode(dev);
> >       u32 val;
> >       int ret;
> >
> > -     memset(props, 0, sizeof(*props));
> > -
> > -     props->orientation = V4L2_FWNODE_PROPERTY_UNSET;
> >       ret = fwnode_property_read_u32(fwnode, "orientation", &val);
> >       if (!ret) {
> >               switch (val) {
> > @@ -833,7 +865,6 @@ int v4l2_fwnode_device_parse(struct device *dev,
> >               dev_dbg(dev, "device orientation: %u\n", val);
> >       }
> >
> > -     props->rotation = V4L2_FWNODE_PROPERTY_UNSET;
> >       ret = fwnode_property_read_u32(fwnode, "rotation", &val);
> >       if (!ret) {
> >               if (val >= 360) {
> > @@ -847,6 +878,21 @@ int v4l2_fwnode_device_parse(struct device *dev,
> >
> >       return 0;
> >  }
> > +
> > +int v4l2_fwnode_device_parse(struct device *dev,
> > +                          struct v4l2_fwnode_device_properties *props)
> > +{
> > +     struct fwnode_handle *fwnode = dev_fwnode(dev);
> > +
> > +     memset(props, 0, sizeof(*props));
> > +
> > +     props->orientation = V4L2_FWNODE_PROPERTY_UNSET;
> > +     props->rotation = V4L2_FWNODE_PROPERTY_UNSET;
> > +
> > +     if (is_acpi_device_node(fwnode))
> > +             return v4l2_fwnode_device_parse_acpi(dev, props);
> > +     return v4l2_fwnode_device_parse_dt(dev, props);
> > +}
> >  EXPORT_SYMBOL_GPL(v4l2_fwnode_device_parse);
> >
> >  /*
> >
>
> --
> Kind regards,
>
> Sakari Ailus



-- 
Ricardo Ribalda

