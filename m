Return-Path: <linux-gpio+bounces-28691-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 32418C6B180
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 19:05:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7F71E363504
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 18:01:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50E202D7DEA;
	Tue, 18 Nov 2025 18:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="E3+/bxp0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0370E29BD81
	for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 18:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763488901; cv=none; b=RxM9Op+mXHBe7sp1O6MFzjT2Obih5PQvJddH0xmmiOmrvpWyXwkrnmp/yOHseokTdd+llMh/TMaGVTt79+qLzwgm7HMh0ElxQlEK5pdZKP3X+8m7E98QqIWrHFVOQcjtoCvL3ZgubGHtEiqgAlxxLqHD8CzGaiWCDHNrP3U/AuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763488901; c=relaxed/simple;
	bh=SnW7UzuqKJ5rM/ZgtBMlRbig81FOve9wzINRcn1dYzc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BQB8BnHVeiU9qi9jMiVRDoGmpGsqypc3VaYfkDLYaYmV6q/Dpk3gioprICJavTNrrFjBEdCiUF5y8mtyzg7sK3bNUTOgRJuEBqKZuxCURL7JK3FrCK+8aj1a5uFld7XfmCXRp82iuR311DELAX2OgQeQ9a3pOKIAfJHRR58g2ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=E3+/bxp0; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5942bac322dso5508682e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 10:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763488896; x=1764093696; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3P3rRUVq+sFXnSS3zCUbO/spJbXMMnxEdI7C9ymapPQ=;
        b=E3+/bxp0dR+U3ZgTfutVW/ikhcWxlOOzr9LdmcSKEYvCNk6aaCwEQsjFlBocsfV18S
         XZBaSa8tFiRjPWY4sgkuqf3COwuP3OSAv4Eej4ky2IIa1YDJOrX3a4BWZm2aAhoLNrxm
         lQPUsjIEBI+a53nX9vYWqQHq6RU7wdQoGQK7Tq8vcFSYxea7lhMjeRkBKrlLgZ4Vio4C
         UxVIzZ+wk8V4GjkbEiX/X+14Hy4JKwthI1pZU2yNUj+84n4St0iw6Vdi2leaa2UxR6gW
         mVKnHd6AlIcC4Dr6uEvYrEhRWfZXQ1r2BSbwbV5M2Jqi1TX/tYoxizCMA/y+Yb6WXYST
         jq/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763488896; x=1764093696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3P3rRUVq+sFXnSS3zCUbO/spJbXMMnxEdI7C9ymapPQ=;
        b=wiof4aJLOa4LD7/YYySSB9737FWH0FVc0X7ADxkxElCdLrVEyRUvmsygstxNmXiaTt
         CobHAtxYKgsRl3Lzw+BWkf8cWXhPks4wcWiPUGM9RGNCjJXaU9g6Qr4O3t0yovxc70fz
         X1F1/tZvjqdwdMcAwgEMHh8KYxPeWy0k6qhkXN+HUTKlkzyRYgq5ylay7OZuyLteIAlM
         BRaU6GB+T4L+AusEqZg+FhBTTai9zKhG8tN/mdWxxIU/Ub3Pt+1X5yyFpE1nxW7lUNbO
         RQck/0LvQQXI4f1r75i1dsBr6yYAVUNs2CFmZRM559k9bkDee4RMSHzHhoQ411VADAKC
         XslQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqnMQL6/u33Aixsn/3B7j47sRRlbM7gPOUedh5gbrxkJOxo2MjEQHtQ7JzkcIhsAtJUVtVW5PJ+wv2@vger.kernel.org
X-Gm-Message-State: AOJu0YyNxvTnXwrvqtt8YUxm8e4oAyc5gMteylQzNks5BGoKCsJeusjy
	pd8yNfHgCMj5M0X+lUWuteSUgQd+oEsv+8c5CaR2CtWR/2kHGOTOEiLKWcWc/gfnBchddingPlw
	H33qo3AtT/ZajknCgpkfJa1M85wYSsFetU4ExNJP4bA==
X-Gm-Gg: ASbGncvstUGjvmmH/QISzfYmAMrbdXkd54S7XvXmDk30blpc4r0HRdvvQDwtDAPUTnJ
	qTZd4VngbFoH4Ro7EM5z/yJolXsK1Bt/1D7E++t10AOXZiuZVEsuluu5Ln+9uConpb/F5rjl1xI
	3l3C1siF/yK8uZ9BI8vEiTTJCyGd8cY/AUALgPJu6RIdCznwEJdyf7pWbi7KUjyYVeEHhGCgFl1
	nbibCI5ZkaeCcyVe4uDfwRH0TbFLDL8MN7xpHl/hDcJb2bbSNrNkaHcb5s4PJjW7CfpG0Q74G4B
	/s174wHoM/8LKdP3PHwLp4+v1v0=
X-Google-Smtp-Source: AGHT+IEWC7zJ3AFn5UbdpabBbmuXW3FNWuLD3q3ufY8SHzYHgz3vTgCcqOFiEET7iKyCQIGYrA3eeq0SfERai1S6P+g=
X-Received: by 2002:ac2:4e08:0:b0:595:9d86:2cc7 with SMTP id
 2adb3069b0e04-5959d863118mr191555e87.39.1763488896009; Tue, 18 Nov 2025
 10:01:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251103-reset-gpios-swnodes-v4-0-6461800b6775@linaro.org>
 <20251103-reset-gpios-swnodes-v4-4-6461800b6775@linaro.org> <aRyf7qDdHKABppP8@opensource.cirrus.com>
In-Reply-To: <aRyf7qDdHKABppP8@opensource.cirrus.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 18 Nov 2025 19:01:24 +0100
X-Gm-Features: AWmQ_bn5fs5An1Ys_Go6Dt64d65nQeBWJZvAP84oOejrkVzt78TppX6f_h1mou4
Message-ID: <CAMRc=MfD7ZbwU4akkCJNgmRPwgSOqSVi2-L2dJDOBHrfdD-yZw@mail.gmail.com>
Subject: Re: [PATCH v4 04/10] gpio: swnode: don't use the swnode's name as the
 key for GPIO lookup
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 5:34=E2=80=AFPM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
>
> On Mon, Nov 03, 2025 at 10:35:24AM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Looking up a GPIO controller by label that is the name of the software
> > node is wonky at best - the GPIO controller driver is free to set
> > a different label than the name of its firmware node. We're already bei=
ng
> > passed a firmware node handle attached to the GPIO device to
> > swnode_get_gpio_device() so use it instead for a more precise lookup.
> >
> > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  drivers/gpio/gpiolib-swnode.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpio/gpiolib-swnode.c b/drivers/gpio/gpiolib-swnod=
e.c
> > index f21dbc28cf2c8c2d06d034b7c89d302cc52bb9b5..e3806db1c0e077d76fcc71a=
50ca40bbf6872ca40 100644
> > --- a/drivers/gpio/gpiolib-swnode.c
> > +++ b/drivers/gpio/gpiolib-swnode.c
> > @@ -41,7 +41,7 @@ static struct gpio_device *swnode_get_gpio_device(str=
uct fwnode_handle *fwnode)
> >           !strcmp(gdev_node->name, GPIOLIB_SWNODE_UNDEFINED_NAME))
> >               return ERR_PTR(-ENOENT);
> >
> > -     gdev =3D gpio_device_find_by_label(gdev_node->name);
> > +     gdev =3D gpio_device_find_by_fwnode(fwnode);
> >       return gdev ?: ERR_PTR(-EPROBE_DEFER);
> >  }
>
> One small problem is this does break drivers/spi/spi-cs42l43.c.

I'd say it's a big problem. :)

> That driver has to register some swnodes to specify some GPIO
> chip selects due to some squiffy ACPI from Windows land. Currently
> it relies on the sw node being called cs42l43-pinctrl to match
> the driver.
>

What is the problem exactly? The "cs42l43-pinctrl" swnode is
associated with a GPIO device I suppose? Does it not find it? I'd need
some more information in order to figure out a way to fix it.

> I guess that is not quite the right way to handle that but its
> not clear to me how to link the software node properties to the
> pinctrl otherwise, anyone have any pointers there?
>

Depends what you mean. Creating software nodes is fine, depending on
some arbitrary string not so much. As I said: I need more information
but I'm willing to help you fix it ASAP.

Bart

