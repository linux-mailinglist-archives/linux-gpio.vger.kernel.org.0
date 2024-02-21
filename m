Return-Path: <linux-gpio+bounces-3607-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9F485EBEB
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Feb 2024 23:44:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 734A11C21E9E
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Feb 2024 22:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6172F45C10;
	Wed, 21 Feb 2024 22:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hpbKQrTC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804F73C473
	for <linux-gpio@vger.kernel.org>; Wed, 21 Feb 2024 22:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708555484; cv=none; b=k2MM5/oOeZfY41sYwuGxVRus0+mgo2fLYiuZVL8Z5WDdcrflw7XMfqZwzjMdjdYrIzkrmLz9zmuWiWa6WtXN01vIcVho3CGtDhO2oyluKmUE063KkxsbbM1bwf4Uy7YX9cGegTPAXTmzSNUzD/msVGlvYPCAJA/3zonRS8jm49s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708555484; c=relaxed/simple;
	bh=RC4tI31fIOZp3su17PHYaJtaFUx2oWlHNy6vF8MKmi4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mg1b6jDa18NPO5pY5i6LM8SMXMXR2Wk6lwQPRbos+NCfFuCOzkN8xF+jyfXkDRmcEy0ZVTMAdzYnZZ3w/FiK0+bYuwAKXntD5++rV6oeh7YnyW/TsmLJsUw1Oo7hCDdY8gVnr5VYorC8drpUpS5s+m9J8oxUxselnhABLn3QX5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hpbKQrTC; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dcbc00f6c04so5881353276.3
        for <linux-gpio@vger.kernel.org>; Wed, 21 Feb 2024 14:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708555480; x=1709160280; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1E0gzbVlMt+nTGQE9Y6a9K/TasUA67+XJLQHC7xqZZI=;
        b=hpbKQrTCHD3ciTk2R2xG/100QK9dCR/cF7Qj+eqiJ0XKSTSwRSIPMAQ8jMPCqAXaxn
         7EcbrPE6sl2/hOw9uBfF1OfcqzO38Y5A04r/nM3ksTLhhA2TFPvcyzcGJ4IiXgBDy7HV
         ZgFIhFwtEU/Q4W83z5jpmoAZHGQvjl6wQFoO4EkqMd2c5gPseyOwHvKm2B6TLUmNz4sE
         1ffAKI9OTWuAoN2pfeb21EK7nW8NiXoO3AWhjwMLAaOn7HDkovC9TL4iKlSWr0ZFn+PW
         ED/9Rh9SzJvJHTBunrPYvaVV9jrgob/E6R0Xi7tHLaWkr0QyTdrKwUDoKm9khHT9lLq6
         zqYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708555480; x=1709160280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1E0gzbVlMt+nTGQE9Y6a9K/TasUA67+XJLQHC7xqZZI=;
        b=Q9j8LBmXdZ4caJKDDI49pqUmAr83r7Ia6EAaJjPTg/6vektm/GPA2q7FWLiJWHhlPb
         yu0CFbZXyr0zI8YijpZFh0NYKnLO2aOZ9pTXjPLyrl/xKwGsB6DfD7tA2GYTgLHCsLQl
         tfwqEFcZ0WKlzGtT2RolHhmREZzoAlTjA3EN7hNX+QC0sRbdJZOTxzBKKx05OgUSUiHt
         zSa0Pj6ASOcGqEaUXDE/zzxoWqAMpVT705SYHzUGmyf18HbT3cxRVV4w7hcZys2mnplx
         l54ne27/B/sxFGUq0JCFqJyyzFWT9SfWQjZXrgljn6471wt9DAfokITXRUdP2ZzNpxgp
         YDdg==
X-Forwarded-Encrypted: i=1; AJvYcCVtCMobWTNbYFyuW/FxtwR3MKJoC76wxMhom+tJ+mKEbNVx4/Ch+Umd6BOSKjf/MWlb+KkKDj6RU+f4aCKlnIoB2xHJ4emKid1aGA==
X-Gm-Message-State: AOJu0YztnCRAdjpAZQN0ZwdhnBmq2DFohstSOhP6KcaUBvPUF+zOaNlA
	oL79Lr01r2TDmHtpI8EpL2gGkPcM/eXhtjdEcJDlLAYi5wpiWzEAoLIqSpEEaRLPle7kiwa6T2N
	zREPvvefMttXkEOLZRKUvcRSq8pVcIwR4YgusMQ==
X-Google-Smtp-Source: AGHT+IHuu4Lp2pW2NjzZuLZxH6vx6PUKD/LiuL+7y9Bacxbpsq6vZLxkcOzHR67PhVx1mA6/6VAv6KIjsFFUQoZC/sM=
X-Received: by 2002:a25:ada1:0:b0:dc7:46b7:b7f6 with SMTP id
 z33-20020a25ada1000000b00dc746b7b7f6mr743897ybi.28.1708555480555; Wed, 21 Feb
 2024 14:44:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240220111111.133826-1-herve.codina@bootlin.com> <20240220111111.133826-2-herve.codina@bootlin.com>
In-Reply-To: <20240220111111.133826-2-herve.codina@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 Feb 2024 23:44:29 +0100
Message-ID: <CACRpkdYWiwR_QBsiCESPYfQSsoiThn6hZyLAJA3u0bzTUNvBYQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpiolib: Introduce gpiod_device_add_link()
To: Herve Codina <herve.codina@bootlin.com>, Saravana Kannan <saravanak@google.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-leds@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Looping in Saravana, he should always look at patches like this.

On Tue, Feb 20, 2024 at 12:11=E2=80=AFPM Herve Codina <herve.codina@bootlin=
.com> wrote:
>
> With device-tree, some devlink related to gpios are automatically added
> when a consumer device is added and the attached node has phandles
> related to GPIOs.
> In some cases, the real device used to get the gpio during a probe() can
> be related to an of-node parent of the of-node used for the already done
> automatically devlink creation.
> For instance, a driver can be bound to a device and, during the
> probe(), the driver can walk its of-node children to get the GPIO
> described in these children nodes.
> In that case, an additional devlink between the device attached to the
> driver and the gpio consumer need to be created.
> Indeed, if the GPIO is removed, the consumer/supplier dependency should
> lead to remove first the consuming driver before removing the supplier.
>
> In order to give the possibility to this kind of driver to add additional
> devlinks, introduce gpiod_device_add_link().
>
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  drivers/gpio/gpiolib.c        | 32 ++++++++++++++++++++++++++++++++
>  include/linux/gpio/consumer.h |  5 +++++
>  2 files changed, 37 insertions(+)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 8b3a0f45b574..416ab334b02d 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -4195,6 +4195,38 @@ static struct gpio_desc *gpiod_find_and_request(st=
ruct device *consumer,
>         return desc;
>  }
>
> +/**
> + * gpiod_device_add_link - Add a link between a GPIO consumer and a GPIO=
.
> + * @consumer: GPIO consumer.
> + * @desc: GPIO consumed.
> + * @flags: Link flags, see device_link_add().
> + *
> + * This function can be used for drivers that need to add an additional
> + * consumer/supplier device link to a GPIO.
> + *
> + * Returns:
> + * On successful, the link created.
> + * NULL if the link was not created due to a missing GPIO parent.
> + *
> + * In case of error an ERR_PTR() is returned.
> + */
> +struct device_link *gpiod_device_add_link(struct device *consumer,
> +                                         struct gpio_desc *desc,
> +                                         u32 flags)
> +{
> +       struct device_link *link;
> +
> +       if (!desc->gdev->dev.parent)
> +               return NULL;
> +
> +       link =3D device_link_add(consumer, desc->gdev->dev.parent, flags)=
;
> +       if (!link)
> +               return ERR_PTR(-EINVAL);
> +
> +       return link;
> +}
> +EXPORT_SYMBOL_GPL(gpiod_device_add_link);
> +
>  /**
>   * fwnode_gpiod_get_index - obtain a GPIO from firmware node
>   * @fwnode:    handle of the firmware node
> diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.=
h
> index db2dfbae8edb..4feed4e166b0 100644
> --- a/include/linux/gpio/consumer.h
> +++ b/include/linux/gpio/consumer.h
> @@ -7,6 +7,7 @@
>
>  struct acpi_device;
>  struct device;
> +struct device_link;
>  struct fwnode_handle;
>
>  struct gpio_array;
> @@ -106,6 +107,10 @@ void devm_gpiod_put(struct device *dev, struct gpio_=
desc *desc);
>  void devm_gpiod_unhinge(struct device *dev, struct gpio_desc *desc);
>  void devm_gpiod_put_array(struct device *dev, struct gpio_descs *descs);
>
> +struct device_link *gpiod_device_add_link(struct device *consumer,
> +                                         struct gpio_desc *desc,
> +                                         u32 flags);
> +
>  int gpiod_get_direction(struct gpio_desc *desc);
>  int gpiod_direction_input(struct gpio_desc *desc);
>  int gpiod_direction_output(struct gpio_desc *desc, int value);

The function as such is pretty straight forward, but the cross call
here happens on instatiated
devices etc, and we need to know why this can't be done earlier when sortin=
g out
the dependencies in the device tree e.g.

Yours,
Linus Walleij

