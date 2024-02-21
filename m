Return-Path: <linux-gpio+bounces-3608-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C01885EBF5
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Feb 2024 23:46:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 461211C21135
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Feb 2024 22:46:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0F4F12B178;
	Wed, 21 Feb 2024 22:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CBIhantO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F8112AAD1
	for <linux-gpio@vger.kernel.org>; Wed, 21 Feb 2024 22:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708555558; cv=none; b=FA4Uek3NE2yHpaIEtvzQJHxOYv3B+zL+AXjIPEdh4x3tkydgYfSAAUqUS3lsLzHLr1Wg6WWmr1sEDjpIDJawEktsvDHI7ujiGykJ1K1rxJVvj90FhZbUdG+vUKsGyjeVgsPKzB1+aq3qPt1Rk0AaG7y6z99w68tHJAqVmSjR1Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708555558; c=relaxed/simple;
	bh=PzPmVzNR72x1DSNGKMlcRbhI9DT2jbL/sgZikt4MkkQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L/gMEetaafQHXKu5DwVBr7JlyaAGmtTxyTs2kl+EStTcahrzcN5vA4rcUUtyLJlLjinU94Kma+/199vxG6FSwalRsCk6wCa0i20mDPLrmovsHsKiHuqQ3QhOP6ZsyCBYrPTmHQg4Ax9Zx2nwOXvEnXljOIAQETx3ZOC+847tMmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CBIhantO; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-60869c68926so24799097b3.3
        for <linux-gpio@vger.kernel.org>; Wed, 21 Feb 2024 14:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708555542; x=1709160342; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tLealWf5HBstatX5jbeT2siWwuvRI4tzv53uDOTCcKI=;
        b=CBIhantOZlZ+uRI0NZLRnfNfKOPmxZRiUNDr6ksmw3kpBlT8EpGW+GTnXRFEINAsl5
         0ezEqbqfa3GRY53cAlDGKtXhvL8g0cTalLgomkFWnzfqTeaY4Y2y/yDHCSS00tpHgt6E
         G0/Evap/sfAR2DZD36H+nMQdE6+ZCOq7hhSCSg3kdEmEfR0uPI7TfkgXspOBhx4OGCQD
         bE5GD9u3mwGKl7PkqLi7cp46DhwE1r6nmSNxoHhISdoITndrP/KY4BOYG1Z2HpLhgWdX
         X6LWmMhbEbDiEkJGQ/Rtmz/QkPPmAeNdJtjhy0nvap6c6nD9/ezFr1xbonNbQXz3dYwH
         +4GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708555542; x=1709160342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tLealWf5HBstatX5jbeT2siWwuvRI4tzv53uDOTCcKI=;
        b=jVkh5ygrHmU2zCqUxg3WrXLzC6+x6ov+uW78B/AAt6n7q+/ovQ+HxlXHCRiH/a9FRC
         p4Cz6gXVCBW+W4aXzYydN+NM/+hmkeWkjHUXPEnAfAs3fGmdbWvx3uF1RflVuni0DQ3R
         2qZt/tnn5SgjfakfmUFaoQRm/mb61ALktdwSzz1aARFU19bkZpOx8GtgGJKn+Q0cdWWq
         TOUiv5jJOyyroILo/N/UdJUY3INLa+6XRDcK5b6EDQpMnUFjRxz8VDycC6mbcgWmRD/0
         aOp72JI+Qon9f/JK1fGQDsG+5xssmiLkKMwaQkclyoiMGMWPD7TnDded86aF3x1/6eVd
         UBBg==
X-Forwarded-Encrypted: i=1; AJvYcCWaE/FP/cC95a4ED1QxX3PSdAp51jQncyO/ilMGnEo7/0voM61oujacg+yNx3jnC740k90EBrYIY6JDfrFxYkMeszL/aNJ2Tqa0xA==
X-Gm-Message-State: AOJu0Yww8DsXI3edB1hYfTrFDf8qzHSuGbrJgjzHcBtU0WsxyDOHr+7X
	uTqjPJtupLLTdiMsSersObROehJDKcmlTe5nkOH3gTHx8VhEFqwjm2Z7yiEThGI5mC04sT0FGp1
	VTFT39va4vxVlgOLA20p1+UOinNYjDroCOPP8aQ==
X-Google-Smtp-Source: AGHT+IEAbOt0U475gEe5FkMJwU7SU74wskhh7ls1GEZkCyuz898a19Y3NlIdf1mAPQo4igt+D+F2bAX0hsvHDSXIFM0=
X-Received: by 2002:a0d:d60a:0:b0:604:b6b2:1fc9 with SMTP id
 y10-20020a0dd60a000000b00604b6b21fc9mr19084807ywd.49.1708555541895; Wed, 21
 Feb 2024 14:45:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240220111111.133826-1-herve.codina@bootlin.com> <20240220111111.133826-3-herve.codina@bootlin.com>
In-Reply-To: <20240220111111.133826-3-herve.codina@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 Feb 2024 23:45:31 +0100
Message-ID: <CACRpkdZA1a6xxPL7hP_B4e0b5PoCv8CNhnxvM+dR5TGYkYv7Nw@mail.gmail.com>
Subject: Re: [PATCH 2/2] leds: gpio: Add devlinks between the gpio consumed
 and the gpio leds device
To: Herve Codina <herve.codina@bootlin.com>, Saravana Kannan <saravanak@google.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-leds@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Saravana needs to look at this patch too, so I am top-posting.

Yours,
Linus Walleij

On Tue, Feb 20, 2024 at 12:11=E2=80=AFPM Herve Codina <herve.codina@bootlin=
.com> wrote:

> When a gpio is removed, the gpio leds consumer need to be removed first.
> This dependency consumer/supplier can be described by devlink links.
> In case of device-tree, even if some devlinks are created due to the
> presence of gpio phandles in the gpio leds children, these links do not
> help in removing the gpio leds device (i.e. the real consumer) before
> the consumed gpio.
> We can reach cases where the gpio are no more present and the gpio leds
> driver continue to have leds using these gpio.
> Further more, when the gpio come back, the gpio leds still use the old
> removed one.
>
> Indeed, the gpio are consumed by the parent of the consumer used in the
> devlink creation due to phandles. A link is missing between the gpio and
> the real gpio consumer, the gpio leds device itself.
>
> Use the newly introduced gpiod_device_add_link() to create this
> missing link between the gpio leds devices and the gpios.
> With that done, if a gpio is removed, the gpio leds is removed and the
> resources are correctly released.
>
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  drivers/leds/leds-gpio.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
> index 83fcd7b6afff..b3ec8ecbe5da 100644
> --- a/drivers/leds/leds-gpio.c
> +++ b/drivers/leds/leds-gpio.c
> @@ -150,6 +150,7 @@ static struct gpio_leds_priv *gpio_leds_create(struct=
 device *dev)
>  {
>         struct fwnode_handle *child;
>         struct gpio_leds_priv *priv;
> +       struct device_link *link;
>         int count, ret;
>
>         count =3D device_get_child_node_count(dev);
> @@ -197,6 +198,20 @@ static struct gpio_leds_priv *gpio_leds_create(struc=
t device *dev)
>                 /* Set gpiod label to match the corresponding LED name. *=
/
>                 gpiod_set_consumer_name(led_dat->gpiod,
>                                         led_dat->cdev.dev->kobj.name);
> +
> +               /*
> +                * Create a link between the GPIO and the gpio-leds devic=
e.
> +                * This allow to have a relationship between the gpio use=
d and
> +                * the gpio-leds device in order to automatically remove =
the
> +                * gpio-leds device (consumer) when a GPIO (supplier) is =
removed.
> +                */
> +               link =3D gpiod_device_add_link(dev, led_dat->gpiod,
> +                                            DL_FLAG_AUTOREMOVE_CONSUMER)=
;
> +               if (IS_ERR(link)) {
> +                       fwnode_handle_put(child);
> +                       return ERR_CAST(link);
> +               }
> +
>                 priv->num_leds++;
>         }
>
> --
> 2.43.0
>

