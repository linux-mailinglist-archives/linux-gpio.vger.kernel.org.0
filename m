Return-Path: <linux-gpio+bounces-23218-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4B2B0412E
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 16:15:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 71F00189BC28
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 14:15:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F4D22571A0;
	Mon, 14 Jul 2025 14:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="U6bU3OcR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B86C22FAF4
	for <linux-gpio@vger.kernel.org>; Mon, 14 Jul 2025 14:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752502473; cv=none; b=Sli4MKuscGpQJKsChySRZtSHzcMwBjgfHGcHsEuJmjAKK7NTW5X3mzAdrun02h17C/WdA6F+Ud54cOC/byRmZFI3ZIiC8nCsgrlsqRbROyS9hjF+yB0dVVls4BjhP1mtrfgHo+sXIfNZtYIPYf70AIILQXj1/qk0Hpaza5TZuqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752502473; c=relaxed/simple;
	bh=83AgYV4x+hwPaNGzWopzeXSbiWGOVcEuU5XbcQfD8es=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jkKzP/reqeoYAV1by6NbFwBB7fAj2vCmJFpK3PEfE++R0/n0+ygSS/CnfGvHGnLRayic+r7af5gOuhQbSjkrLYU+zSyKqMjJ4GbBXErR6gk45KLnzBlImznnQCAR91TLSS4TUQm6XRJSLtjwY0kccMTNJ/242E7NaUAYDa2SLRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=U6bU3OcR; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-558f7472d64so4253927e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 14 Jul 2025 07:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752502469; x=1753107269; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aPBTalpHMZbUCps9VnvQc6q/AJch4FZWjrxFyUqpLTw=;
        b=U6bU3OcR9CxT7D5fNr4b8g6YBdbaq/Rs0bevrAvyiaGP2ez3I2i7sSUrrMcbtlQb74
         KnDy0S7Z3A4f34I4S4Jjp7ABtOei2AODpvDr2xLONNHPzmIjF/i+d1IkWozMhmDchR5Q
         c3vO3aFHddX8lRgUGaYod3V5RZxkdq3mdOTLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752502469; x=1753107269;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aPBTalpHMZbUCps9VnvQc6q/AJch4FZWjrxFyUqpLTw=;
        b=CN3rVLDWeukEhMNLMeHzBg9WmP9DdzaTBGkkLAUnOAiUZwKvm+CDqq+uxGxX/T8Y2s
         GZ4JsmnColOIkd8nmyvJzeYwYkmsgpoYKWK2VXXob+Lp6h10lVd1g7Z5oVoBidOchKo5
         4Xn8XHJULKrA3McoX7C7u0vHDPtLcSJaZZ650tDM30Ujw0rikBg6Qw+3tfpKX/ipJxWu
         AFQAHtGnAigkprPhUgQVRpz13ipiXx+eJfLphFWMhsPlKvoYGzR9je6frw3Oh8UwsbYV
         rXRI55zEXEbg3E1lP7Ly+BbUAMd5hB6nFB5j8nL//No0DDo3Ipf/QpPTr36MIV11yG/L
         KPmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdwq2xc7K6917QQU4/HfiVPWA+H+UMo6uG7IF3gv07HDwGhC3sDLZOAauU24dLL64+lzeCGgz6L5Y9@vger.kernel.org
X-Gm-Message-State: AOJu0YwT7kN0V7L0lxePzcZowzFoew3MbJlBL/grDTNvruLZEmHQWaty
	uOynUnI7u1KLGJEhcIdAtG7pbytAz33BxoXfLdlq4ES1wBT+b1qg6aUR6X7sbRZx2Wu9ahojrA8
	eMVs=
X-Gm-Gg: ASbGnct2HumTFM1UWDPZ6U3lzY7WcJq6UFJ7pCeYSCuh8RDw4bCj7fYtcg/TQg3PGq5
	xTDp0XCfaYnJuHwlIhoxbYual8GODAsjwit05ZtfWRvMG1ZEB95la+DcygTI+Pp/LFXuLZsrMIa
	+VpfzghxTEiKcDnsCv0Kc+9AgIeR7ZjmCMAIZxYPJPsewtfusvz+DyHkRsxGi2/ZHYSvs/fPSq0
	eO/d5eMTNHHrJGzvgytN1Mt+M8gLmPjhqFVFmDkt3FqVINXq7eakFF7mUNMuC+gsZXmN1dt25J/
	mGE7hGybs4X+1SVgYUVu+uUoUxO0jP2M6JMwnzxO+DBlvmXZgNCxW79WdepydiZZoK9PZp+59BQ
	rQ+zijXdv6Fqdhk6qKb0vnv3NjXbFUXts32e5EOgfzq2CnHON3/dyl2QU5UZ2y+Nt
X-Google-Smtp-Source: AGHT+IHWNv46S6HQMmO7mz3irbhyg8mNFm83hWk7EqkYEWVqwI0lvHTb6Qwj4Wwgxevxhr9UFoCW5g==
X-Received: by 2002:ac2:4c4c:0:b0:553:2375:c6e8 with SMTP id 2adb3069b0e04-55a038e3bdfmr4191961e87.1.1752502469359;
        Mon, 14 Jul 2025 07:14:29 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5593c7bcd81sm1974718e87.20.2025.07.14.07.14.28
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 07:14:28 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-32b7f41d3e6so53789021fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 14 Jul 2025 07:14:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWTfTM+xuSFAg7vrvFP9qO9n+gpB+PFGvHZ3XCdbDNs9g0wZEVr0i3ChgP7nJqXZe0/KHmwqwNQR+Vf@vger.kernel.org
X-Received: by 2002:a05:651c:2002:b0:32b:59d1:7ef2 with SMTP id
 38308e7fff4ca-32f50c780f8mr41327731fa.9.1752502467634; Mon, 14 Jul 2025
 07:14:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605-uvc-orientation-v2-0-5710f9d030aa@chromium.org>
 <20250605-uvc-orientation-v2-2-5710f9d030aa@chromium.org> <a02801c8-4be0-4a53-a037-e38bf0f05db1@redhat.com>
In-Reply-To: <a02801c8-4be0-4a53-a037-e38bf0f05db1@redhat.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 14 Jul 2025 16:14:14 +0200
X-Gmail-Original-Message-ID: <CANiDSCsq4_R5R6+W3qxN6tpDJxqSkZ8E20Hza=Ye-HpqfCza1w@mail.gmail.com>
X-Gm-Features: Ac12FXyYIipkCH4Sx5CVKejVWW7_NLIKMhi6EeKATJWIjzTAUBbADXkCmkZ4IHg
Message-ID: <CANiDSCsq4_R5R6+W3qxN6tpDJxqSkZ8E20Hza=Ye-HpqfCza1w@mail.gmail.com>
Subject: Re: [PATCH v2 02/12] media: v4l: fwnode: Support ACPI's _PLD for v4l2_fwnode_device_parse
To: Hans de Goede <hdegoede@redhat.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Jul 2025 at 15:03, Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 5-Jun-25 19:52, Ricardo Ribalda wrote:
> > Currently v4l2_fwnode_device_parse() obtains the orientation and
> > rotation via fwnode properties.
> >
> > Extend the function to support as well ACPI devices with _PLD info.
> >
> > We give a higher priority to fwnode, because it might contain quirks
> > injected via swnodes.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/v4l2-core/v4l2-fwnode.c | 85 ++++++++++++++++++++++++++++++++---
> >  1 file changed, 79 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> > index cb153ce42c45d69600a3ec4e59a5584d7e791a2a..379290ab3cfde74c8f663d61837a9a95011b5ae0 100644
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
> > @@ -807,16 +808,65 @@ int v4l2_fwnode_connector_add_link(struct fwnode_handle *fwnode,
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
> > +     if (!is_acpi_device_node(dev_fwnode(dev)))
> > +             return 0;
> > +
> > +     if (!acpi_get_physical_device_location(ACPI_HANDLE(dev), &pld)) {
> > +             dev_dbg(dev, "acpi _PLD call failed\n");
> > +             return 0;
> > +     }
> > +
> > +     if (props->orientation != V4L2_FWNODE_PROPERTY_UNSET) {
>
> "!=" should be "==" here. So that we set it when not set already,
> rather then leaving it unset when not set already.
>
> > +             switch (pld->panel) {
> > +             case ACPI_PLD_PANEL_FRONT:
> > +                     props->orientation = V4L2_FWNODE_ORIENTATION_FRONT;
> > +                     break;
> > +             case ACPI_PLD_PANEL_BACK:
> > +                     props->orientation = V4L2_FWNODE_ORIENTATION_BACK;
> > +                     break;
> > +             case ACPI_PLD_PANEL_TOP:
> > +             case ACPI_PLD_PANEL_LEFT:
> > +             case ACPI_PLD_PANEL_RIGHT:
> > +             case ACPI_PLD_PANEL_UNKNOWN:
> > +                     props->orientation = V4L2_FWNODE_ORIENTATION_EXTERNAL;
> > +                     break;
> > +             default:
> > +                     dev_dbg(dev, "Unknown _PLD panel val %d\n", pld->panel);
> > +                     ret = -EINVAL;
> > +                     goto done;
> > +             }
> > +     }
> > +
> > +     if (props->rotation != V4L2_FWNODE_PROPERTY_UNSET) {
>
> Same here.
>
>
> > +             switch (pld->rotation) {
> > +             case 0 ... 7:
> > +                     props->rotation = pld->rotation * 45;
> > +                     break;
> > +             default:
> > +                     dev_dbg(dev, "Unknown _PLD rotation val %d\n", pld->panel);
> > +                     ret = -EINVAL;
> > +                     goto done;
> > +             }
> > +     }
> > +
> > +done:
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
> > @@ -833,7 +883,6 @@ int v4l2_fwnode_device_parse(struct device *dev,
> >               dev_dbg(dev, "device orientation: %u\n", val);
> >       }
> >
> > -     props->rotation = V4L2_FWNODE_PROPERTY_UNSET;
> >       ret = fwnode_property_read_u32(fwnode, "rotation", &val);
> >       if (!ret) {
> >               if (val >= 360) {
> > @@ -847,6 +896,30 @@ int v4l2_fwnode_device_parse(struct device *dev,
> >
> >       return 0;
> >  }
> > +
> > +int v4l2_fwnode_device_parse(struct device *dev,
> > +                          struct v4l2_fwnode_device_properties *props)
> > +{
> > +     int ret;
> > +
> > +     memset(props, 0, sizeof(*props));
> > +
> > +     props->orientation = V4L2_FWNODE_PROPERTY_UNSET;
> > +     props->rotation = V4L2_FWNODE_PROPERTY_UNSET;
> > +
> > +     /* Start by looking into swnodes and dt. */
> > +     ret =  v4l2_fwnode_device_parse_dt(dev, props);
> > +     if (ret)
> > +             return ret;
> > +
> > +     /* Orientation and rotation found!, we are ready. */
> > +     if (props->orientation != V4L2_FWNODE_PROPERTY_UNSET &&
> > +         props->rotation != V4L2_FWNODE_PROPERTY_UNSET)
> > +             return 0;
>
> As Sakari set, this can be dropped, with the 2 checks above
> fixed to be == v4l2_fwnode_device_parse_acpi() will become
> a no-op in this case.

I wanted to avoid calling he _PLD method if it was not necessary.

But if both Sakari and you dislike the optimization then let's get rid of it :)

Thanks


>
> With these things fixed:
>
> Reviewed-by: Hans de Goede <hansg@kernel.org>
>
> Regards,
>
> Hans
>
>
> > +
> > +     /* Let's check the acpi table. */
> > +     return v4l2_fwnode_device_parse_acpi(dev, props);
> > +}
> >  EXPORT_SYMBOL_GPL(v4l2_fwnode_device_parse);
> >
> >  /*
> >
>


--
Ricardo Ribalda

