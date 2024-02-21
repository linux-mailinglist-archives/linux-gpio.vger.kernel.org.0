Return-Path: <linux-gpio+bounces-3610-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA59985EC21
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Feb 2024 23:59:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 320961F248AF
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Feb 2024 22:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8548B129A89;
	Wed, 21 Feb 2024 22:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0dVfC2cC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56145A35
	for <linux-gpio@vger.kernel.org>; Wed, 21 Feb 2024 22:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708556367; cv=none; b=lH9usg3wfFzme0HkM7Q7oEpqzt1Wr6aFiTtA83Ur5A6I6g/af9XPA0sylWZoMV2gfc1KgPInfEKJQuDQjMlwg4FklLFXpq8wb3CHHzObBVNqGaLm4jTicrZRckzUwOgDwsil67gZrDLTfS9LReTn5RHR1rXnr4aexcrvC57R0/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708556367; c=relaxed/simple;
	bh=KJF2sq7XCq75meC0+9X/g850XM3hhV9gNSZA15LUSJo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LKOpbGJrvGZg4seqp254lFZxFLssnRLloQy8koC4+yR3Qphf208GV5ZjWkuHmFrJes7gGJe91vZNPiiYj+/Id72g/hzUyEWbIcE03tQ5bVeyWvg9dB05AY1L54nSEJUSns4MOQvOBKuCgK7Zol3r2viIAVU7t4XEZLYErqj6WJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0dVfC2cC; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-42e2507c6e1so38721cf.1
        for <linux-gpio@vger.kernel.org>; Wed, 21 Feb 2024 14:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708556363; x=1709161163; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZtvPUP2HKSUILFzR5QbPR5TkiY4r8CL4c+f0fgDY8GA=;
        b=0dVfC2cCOYtnXsOhs21bZKzw5SXD/Dk36v0FsQ13XLdRAaURgLGtR70/vApP7/5GuY
         HvThw1r2KgCeCtj7kfZIte2dUjQXVFbmFven78yYfUzpmH7qBGIr0eMOd2i7V7YkS7LV
         EwuFonDQVJy1nY1GRDjoRydLmid+n617ko93ZyIKQ6VtPtsFlmTQlQxIc9xaMJPxaV+0
         wpiP+E7p/Rm5IhA1qw5HOkvIEq6XPsB4EB0ufxHfWRFmhvK2peS3DmKMSw5L6nsQshyN
         dssg5wB0tCqDWwDkw33HjpD6n9C25+LHSJ0qQjA9kskEzYqDKb2/XayXpRO67qdEAswI
         CXRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708556363; x=1709161163;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZtvPUP2HKSUILFzR5QbPR5TkiY4r8CL4c+f0fgDY8GA=;
        b=mYKvnyV+izfCRPEHzrkjlUSESIYJblB0+q1/+X5JtPXRK/nOF5MDq8kimZ05x/g1a4
         Yn3roYa4nA8WOVMc82ZwnqHGm4VF5DfgrR5tAoPgl1oGMPl1uyZciFgi8GFtruFp0Dd1
         1LWTtT93GY+rE2MkgU793OsxR20+/8GKzqYJ17zNy1fd/W2YZEZRDSaxKGZ3l5A/ZWnA
         7VMdLXLJC7818Jy6GYuykPN1Hmo0sDttCXq9v578zwzImVqWWrqr/iTH3Q0HW3ulwoS7
         gR7wsfEKPt3uy9CRTkHI+phXYWpM6/O9En1f0Tsf9p8AAOBkqUiP3mGNpxvkT4T3eXms
         IhWQ==
X-Forwarded-Encrypted: i=1; AJvYcCV26lLEI6HTaJt0PNjiPGeN5NeR/V/PAHQa131WwQil7VRNCGUTUM3F1UzvpR3DA+dzGJX15zHRoAZPFNBAYf87ZE1NAnMj1w4uUw==
X-Gm-Message-State: AOJu0Yz6svFeuCy5AY3JCoxONVLTTh6jje749sdFplL2YQ8WTEFqkIKf
	+T2LGHRsVynDzu9qa5ZYSli3fXDQ5GspHZh1D6vbOJCf9V+0ZPjjBPBFDXvgMsJhEye4h8CLKVj
	UAsiSY/xisbEGtdoCSHvym+FN6p7pR6hb05CX
X-Google-Smtp-Source: AGHT+IEs1Rm/Qfj+u2Q0yKd4+HuwZGZzM8GMzD+EPMGWKBL3jZWX4J8rDK0oxGVgz77SaMFHGMIPXqfWIoqGzCEJ5is=
X-Received: by 2002:a05:622a:1052:b0:42d:d519:c559 with SMTP id
 f18-20020a05622a105200b0042dd519c559mr505589qte.0.1708556363115; Wed, 21 Feb
 2024 14:59:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240220111111.133826-1-herve.codina@bootlin.com>
 <20240220111111.133826-2-herve.codina@bootlin.com> <CACRpkdYWiwR_QBsiCESPYfQSsoiThn6hZyLAJA3u0bzTUNvBYQ@mail.gmail.com>
In-Reply-To: <CACRpkdYWiwR_QBsiCESPYfQSsoiThn6hZyLAJA3u0bzTUNvBYQ@mail.gmail.com>
From: Saravana Kannan <saravanak@google.com>
Date: Wed, 21 Feb 2024 14:58:44 -0800
Message-ID: <CAGETcx9zWsZcWteGDcKA-H67JCwJCsLPHWb0PH28T62M7ZLo2Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpiolib: Introduce gpiod_device_add_link()
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Herve Codina <herve.codina@bootlin.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Pavel Machek <pavel@ucw.cz>, 
	Lee Jones <lee@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-leds@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 21, 2024 at 2:44=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> Looping in Saravana, he should always look at patches like this.

Thanks Linus. Bartosz suggested a RESEND with me and I replied in that thre=
ad.

https://lore.kernel.org/all/20240220133950.138452-1-herve.codina@bootlin.co=
m/

-Saravana
>
> On Tue, Feb 20, 2024 at 12:11=E2=80=AFPM Herve Codina <herve.codina@bootl=
in.com> wrote:
> >
> > With device-tree, some devlink related to gpios are automatically added
> > when a consumer device is added and the attached node has phandles
> > related to GPIOs.
> > In some cases, the real device used to get the gpio during a probe() ca=
n
> > be related to an of-node parent of the of-node used for the already don=
e
> > automatically devlink creation.
> > For instance, a driver can be bound to a device and, during the
> > probe(), the driver can walk its of-node children to get the GPIO
> > described in these children nodes.
> > In that case, an additional devlink between the device attached to the
> > driver and the gpio consumer need to be created.
> > Indeed, if the GPIO is removed, the consumer/supplier dependency should
> > lead to remove first the consuming driver before removing the supplier.
> >
> > In order to give the possibility to this kind of driver to add addition=
al
> > devlinks, introduce gpiod_device_add_link().
> >
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > ---
> >  drivers/gpio/gpiolib.c        | 32 ++++++++++++++++++++++++++++++++
> >  include/linux/gpio/consumer.h |  5 +++++
> >  2 files changed, 37 insertions(+)
> >
> > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > index 8b3a0f45b574..416ab334b02d 100644
> > --- a/drivers/gpio/gpiolib.c
> > +++ b/drivers/gpio/gpiolib.c
> > @@ -4195,6 +4195,38 @@ static struct gpio_desc *gpiod_find_and_request(=
struct device *consumer,
> >         return desc;
> >  }
> >
> > +/**
> > + * gpiod_device_add_link - Add a link between a GPIO consumer and a GP=
IO.
> > + * @consumer: GPIO consumer.
> > + * @desc: GPIO consumed.
> > + * @flags: Link flags, see device_link_add().
> > + *
> > + * This function can be used for drivers that need to add an additiona=
l
> > + * consumer/supplier device link to a GPIO.
> > + *
> > + * Returns:
> > + * On successful, the link created.
> > + * NULL if the link was not created due to a missing GPIO parent.
> > + *
> > + * In case of error an ERR_PTR() is returned.
> > + */
> > +struct device_link *gpiod_device_add_link(struct device *consumer,
> > +                                         struct gpio_desc *desc,
> > +                                         u32 flags)
> > +{
> > +       struct device_link *link;
> > +
> > +       if (!desc->gdev->dev.parent)
> > +               return NULL;
> > +
> > +       link =3D device_link_add(consumer, desc->gdev->dev.parent, flag=
s);
> > +       if (!link)
> > +               return ERR_PTR(-EINVAL);
> > +
> > +       return link;
> > +}
> > +EXPORT_SYMBOL_GPL(gpiod_device_add_link);
> > +
> >  /**
> >   * fwnode_gpiod_get_index - obtain a GPIO from firmware node
> >   * @fwnode:    handle of the firmware node
> > diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consume=
r.h
> > index db2dfbae8edb..4feed4e166b0 100644
> > --- a/include/linux/gpio/consumer.h
> > +++ b/include/linux/gpio/consumer.h
> > @@ -7,6 +7,7 @@
> >
> >  struct acpi_device;
> >  struct device;
> > +struct device_link;
> >  struct fwnode_handle;
> >
> >  struct gpio_array;
> > @@ -106,6 +107,10 @@ void devm_gpiod_put(struct device *dev, struct gpi=
o_desc *desc);
> >  void devm_gpiod_unhinge(struct device *dev, struct gpio_desc *desc);
> >  void devm_gpiod_put_array(struct device *dev, struct gpio_descs *descs=
);
> >
> > +struct device_link *gpiod_device_add_link(struct device *consumer,
> > +                                         struct gpio_desc *desc,
> > +                                         u32 flags);
> > +
> >  int gpiod_get_direction(struct gpio_desc *desc);
> >  int gpiod_direction_input(struct gpio_desc *desc);
> >  int gpiod_direction_output(struct gpio_desc *desc, int value);
>
> The function as such is pretty straight forward, but the cross call
> here happens on instatiated
> devices etc, and we need to know why this can't be done earlier when sort=
ing out
> the dependencies in the device tree e.g.
>
> Yours,
> Linus Walleij

