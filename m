Return-Path: <linux-gpio+bounces-14466-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E8749A00AAF
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 15:39:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7CF9163C84
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 14:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBCFC1FA8E3;
	Fri,  3 Jan 2025 14:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="l4stD4aN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828F91FA256
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jan 2025 14:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735915141; cv=none; b=rllrDuCAg82FjkvGhoAmD1H8ejms1UdtFIOZhLGr9iKUjPL1w6zWCCCpu0fw1Zg+GtEDVS0cYdo4Grd1sL5P1xHTcHAernpzSVWKbahf29/v+zViyzXqmT+ahz7Ok7q/i19Sz+7Mk39l0wpbxWpuMwmkrfMoTUjAwrqzn1s7GgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735915141; c=relaxed/simple;
	bh=qilmq/pPX9+oqEOdLNeOo3MBT7fZYFD1CglrPBYAp6M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=snXzqyeL7HQqKC/+VKZNJ9D+Nw7Gpc8WaH2qcfAUgkDFLfhPoauXuS4RsnDgng6mF65nlNDRrqz/QO6QaBuYha9+OgRukAFQ2dhDpbRoMS1HqYE/PbDi7PxObYWZNi5CVcyzbPzc0AKJTYzHVTh1kmHECJXNfc2QnwtmblomCIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=l4stD4aN; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5401bd6cdb7so12900610e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 03 Jan 2025 06:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1735915137; x=1736519937; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TMr4XbUqj7DTSGUo9wS4xSM0wD5+JzVP9DUatq0G5S4=;
        b=l4stD4aNsQdNPhPt/bh9bY4i34rG3MoYkJojl04fmEadnMPnhadxGnLDd/zI/s/3hB
         tq89MvFHY9U3Pjgi/kZChrkNVSnzF6Pujuc4pZv+JW/x2HHPvBmXggEhe37kKdsQm9R+
         p7OHFwPcixsAXD/ZVvU4TwIh9t7sUxahAlAYpWsvBdV+8W0/wcpeft8FTZEnVOI9RDZ4
         rv3kBBzCNkK8y1tGZd0Mb3Kx7UyoXgSVLp6trFLpNYvj8xSwzbc5MrnXeShm9ihWhtBC
         NcdkH8Uva3DhCf3OLd/jx+ZwA5UlvatZgGfV3YQxuF7QrlaVtB7DSCHpJTbhrJR5D06Y
         tnVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735915137; x=1736519937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TMr4XbUqj7DTSGUo9wS4xSM0wD5+JzVP9DUatq0G5S4=;
        b=lZypfPPq4hE/yWX2FbZGBQJdAoowmhyNI9mK70+ajB2/n1IsABKEuZDgI3MsXfK2l9
         2vWxei1pZJTfAIauGVZRBlJXfBDa+wFMdry8bOjt2ptr3u3jpUGh0CKCJLXn2IO1uUkV
         /7A5VTxchz42gPtaVp8UkHI9fTMANIyyrm42Yj4qKHqDZ5EP+KGBSP9K3dPls6TKexUl
         bBnd8EuzNxtXo89VgfsaUbxcgGxH8xqQrOgg7JKnp4mXJzQa79sg+p0BINUGcyrwQ3+a
         wxKf1Rb56nD1vQutbXaYxq0mYvq2qdE3DxAxjTt1lM9AqU7wqCbVDhf2PIfR6hyDL3mc
         +TPA==
X-Gm-Message-State: AOJu0YxjIVxnLxE7ayXoCMOEnScQDoF7jVeiBYXf7xm2puOvZmQx38nP
	WkXHLdql3AZtP0GYSQcIxs03z8vAcQmi8/tO65+49navfJTHoWzCihs7e+DW0lfSZM/LzqfDpVk
	m1BKnLQX3ZMQk/ReXoeNgrlcBd1BR0xpzfrxi5g==
X-Gm-Gg: ASbGncvdI5bcKgoEEoH+Apyz1XlzXau6XA4uEijb23hPuBa8VXW23wzHf0ORBdxS+ji
	A7h0EbxkopuYr8VrvtmgOe3qepAkA52ioePnnBOWpIqkUrsIPxXal1fq41CXeV1vlV6CkAA==
X-Google-Smtp-Source: AGHT+IHTByWayRGKAodkcWsnz9tCdDaAo/D+lxW4KY6+EgKkov8nxXpICDaOA/QxgTVmQoX5tyMM00G2Vmb7vO4RohI=
X-Received: by 2002:a05:6512:3090:b0:540:20bd:739e with SMTP id
 2adb3069b0e04-54229530256mr12781339e87.18.1735915137574; Fri, 03 Jan 2025
 06:38:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250103141829.430662-1-koichiro.den@canonical.com> <20250103141829.430662-2-koichiro.den@canonical.com>
In-Reply-To: <20250103141829.430662-2-koichiro.den@canonical.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 3 Jan 2025 15:38:46 +0100
Message-ID: <CAMRc=MfwK8o44MYk9pPAkHn6t+wY3=x99Uy88CKgx7nN8x81mw@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] gpio: virtuser: fix missing lookup table cleanups
To: Koichiro Den <koichiro.den@canonical.com>
Cc: linux-gpio@vger.kernel.org, linus.walleij@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 3, 2025 at 3:18=E2=80=AFPM Koichiro Den <koichiro.den@canonical=
.com> wrote:
>
> When a virtuser device is created via configfs and the probe fails due
> to an incorrect lookup table, the table is not removed. This prevents
> subsequent probe attempts from succeeding, even if the issue is
> corrected, unless the device is released. Additionally, cleanup is also
> needed in the less likely case of platform_device_register_full()
> failure.
>
> Besides, a consistent memory leak in lookup_table->dev_id was spotted
> using kmemleak by toggling the live state between 0 and 1 with a correct
> lookup table.
>
> Introduce gpio_virtuser_remove_lookup_table() as the counterpart to the
> existing gpio_virtuser_make_lookup_table() and call it from all
> necessary points to ensure proper cleanup.
>
> Fixes: 91581c4b3f29 ("gpio: virtuser: new virtual testing driver for the =
GPIO API")
> Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
> ---
>  drivers/gpio/gpio-virtuser.c | 36 +++++++++++++++++++++++++-----------
>  1 file changed, 25 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpio/gpio-virtuser.c b/drivers/gpio/gpio-virtuser.c
> index 91b6352c957c..e89b1239b635 100644
> --- a/drivers/gpio/gpio-virtuser.c
> +++ b/drivers/gpio/gpio-virtuser.c
> @@ -1439,6 +1439,15 @@ gpio_virtuser_make_lookup_table(struct gpio_virtus=
er_device *dev)
>         return 0;
>  }
>
> +static void
> +gpio_virtuser_remove_lookup_table(struct gpio_virtuser_device *dev)
> +{
> +       gpiod_remove_lookup_table(dev->lookup_table);
> +       kfree(dev->lookup_table->dev_id);

Ah, this has been here all along as well. :/


> +       kfree(dev->lookup_table);
> +       dev->lookup_table =3D NULL;
> +}
> +
>  static struct fwnode_handle *
>  gpio_virtuser_make_device_swnode(struct gpio_virtuser_device *dev)
>  {
> @@ -1487,10 +1496,8 @@ gpio_virtuser_device_activate(struct gpio_virtuser=
_device *dev)
>         pdevinfo.fwnode =3D swnode;
>
>         ret =3D gpio_virtuser_make_lookup_table(dev);
> -       if (ret) {
> -               fwnode_remove_software_node(swnode);
> -               return ret;
> -       }
> +       if (ret)
> +               goto err_remove_swnode;
>
>         reinit_completion(&dev->probe_completion);
>         dev->driver_bound =3D false;
> @@ -1498,23 +1505,31 @@ gpio_virtuser_device_activate(struct gpio_virtuse=
r_device *dev)
>
>         pdev =3D platform_device_register_full(&pdevinfo);
>         if (IS_ERR(pdev)) {
> +               ret =3D PTR_ERR(pdev);
>                 bus_unregister_notifier(&platform_bus_type, &dev->bus_not=
ifier);
> -               fwnode_remove_software_node(swnode);
> -               return PTR_ERR(pdev);
> +               goto err_remove_lookup_table;
>         }
>
>         wait_for_completion(&dev->probe_completion);
>         bus_unregister_notifier(&platform_bus_type, &dev->bus_notifier);
>
>         if (!dev->driver_bound) {
> -               platform_device_unregister(pdev);
> -               fwnode_remove_software_node(swnode);
> -               return -ENXIO;
> +               ret =3D -ENXIO;
> +               goto err_unregister_pdev;
>         }
>
>         dev->pdev =3D pdev;
>
>         return 0;
> +
> +err_unregister_pdev:
> +       platform_device_unregister(pdev);
> +err_remove_lookup_table:
> +       gpio_virtuser_remove_lookup_table(dev);
> +err_remove_swnode:
> +       fwnode_remove_software_node(swnode);
> +
> +       return ret;
>  }
>
>  static void
> @@ -1526,10 +1541,9 @@ gpio_virtuser_device_deactivate(struct gpio_virtus=
er_device *dev)
>
>         swnode =3D dev_fwnode(&dev->pdev->dev);
>         platform_device_unregister(dev->pdev);
> +       gpio_virtuser_remove_lookup_table(dev);

Any reason for moving it earlier?

Bart

>         fwnode_remove_software_node(swnode);
>         dev->pdev =3D NULL;
> -       gpiod_remove_lookup_table(dev->lookup_table);
> -       kfree(dev->lookup_table);
>  }
>
>  static ssize_t
> --
> 2.43.0
>

