Return-Path: <linux-gpio+bounces-22396-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0534AED76D
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jun 2025 10:35:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6DEF3A6838
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jun 2025 08:34:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53073242928;
	Mon, 30 Jun 2025 08:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="YaHawtC5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11BB24166A
	for <linux-gpio@vger.kernel.org>; Mon, 30 Jun 2025 08:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751272508; cv=none; b=gxfMfAQM8AVeLWhXAct68dF3FjZZZeCoz9Q4WiYsWB2v8jIIKkplN2NveAuVzAPKh/EUZ+yiagqmLND3nCJ/6regjGl7+Yi6Jg6dUOCDvJ8G6Pz7Rk60ZqFFZn/aHDM6BSmaNrU1/Lbc5AdlOGiVLN6YOnsdosQqPd/jf9n1RIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751272508; c=relaxed/simple;
	bh=KugLlYAD2LleLePnFiqZ2ZUqh7vrYEKpovYcsYTZsM4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nuJKrBTaz1eataseNcgK+fX+bA3wevLTTNTCrlBDhntzX4d/W6W3WkRa7nv0nuriBVAbIxZr4HajtWjCJWJaH5kdj5sft8J6uP9dVS7I6EXnS4dFqoYChOKxJT7BFxTtY4u3GqPdJMdTNPNSoB8zjtECpbkQNBwKx8EgVlhhyR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=YaHawtC5; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-553b6a349ccso2017068e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jun 2025 01:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751272504; x=1751877304; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yKa/Onc4wBm+A53XbVVZfjcePpt4oSz+cRgODhBWQ5k=;
        b=YaHawtC5If1GSWnOe+XLxuYsf7eckbrsJ9NaTLIwEnVZUqjrfCY10Gj6MM0omaIJEn
         h9uTw2nJFw8rVVpeFHeHvkxI07XBOdD3KfOqLamk8ZnxoIEi7IkdaTUK9M+mke7XqdrJ
         /XoxEB1bcXh4r1VgNvsGkXxZ9DOrvguX0u898WEG/HIu97brvR/Enjd2dA1429Amiegv
         NLza4V0vEcfE//640vXWuc6NR7gAIJ3BamF+hLIohP4rgL97bMNSXRF6+uIK/hNR7bVd
         vsME9VIB8lZSDQV+K6zAtPYrfTnUPoHGaXVzgff8wuptH1Up0C/NuyvDBleh8wkrQHM5
         5ZbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751272504; x=1751877304;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yKa/Onc4wBm+A53XbVVZfjcePpt4oSz+cRgODhBWQ5k=;
        b=f1JyfLRozhpfto3pc6/lFlgCiC5qwys+MEdc6HzYBwKXS13XJJB0pYFp8O5U3SP5p+
         Ez1ER03sZl+7dmHzoDk6/7dac7B98yY47OeumfW3rHE6eoFQo8xreqgQl4CvzIA0SaQ8
         pKBGKarAuicSl3n4Mq8mV37w2dqymOv82nYt0TmefEZdkZRAneGjghIcUy/YvkhxwCzn
         wy1qu+K4xJaiEX6gTrtPr65zsJ4ePAlJEnpytk7VWET82ZJfiCBuSQ2JZBEK3PqqaTag
         mAYyMfflN0cLiGVdlViYnvlmmIYYH1Jpq8sabugHCzn4ylLCI7sx4nwrmxa2Ifr3eyIw
         nENA==
X-Forwarded-Encrypted: i=1; AJvYcCVJlD/zg9SrBc/P7wxcCMPq3TmaF7YFCSD4Kn8i5CzY0zUUoaClqW4gYdckndFXJPhC2vEHFC9kY0H7@vger.kernel.org
X-Gm-Message-State: AOJu0YyrrmhILk1Cw/pQPYwDkp8wvNLPW05FS7m/379b7I4xuX1B7Ktk
	Xa0w0c4DKN4j+0SDVbTr/d+lpr4IxCvord0ziDNzEcVtyzglMaTRX8XTqthnaP+dEUmPjnV9W80
	Y5vXaFvgbbQJ0mqb2i25RiEaMUbfyPMGhoFrZmWPE9nqfHr5dD9F3VMHwcg==
X-Gm-Gg: ASbGncvJj+nA/VwTrxq9heZXVFo5ltfCaNQRahXDt32dsggJBa5XCt0Hg6FZQ5RT5sG
	4En+8suvHpRj3DOs7v9+trroLVZ7UR/6PBHFRNU+eKXWyuz3q0YtANXItvgwZf6LFrCCTnR40bk
	3rJOAglj2kRdDp4WLWDM3gqFvuUtFAYArShQKTT40Enr69uKxTHQmZywboHx+6VJLPicLZPwnnJ
	jg=
X-Google-Smtp-Source: AGHT+IGLFbI/oj/m56i7yTSGNYyD/abp82gQ6IFpfIiOODHABIW0Gjarq66eVDHDhAlzLlnOFAMHf5+mzvXzLMEeqRE=
X-Received: by 2002:ac2:4bd5:0:b0:54f:c6b0:4b67 with SMTP id
 2adb3069b0e04-5550b7e6742mr4577930e87.4.1751272503893; Mon, 30 Jun 2025
 01:35:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250623-gpio-sysfs-chip-export-v2-0-d592793f8964@linaro.org>
 <20250623-gpio-sysfs-chip-export-v2-1-d592793f8964@linaro.org> <aF627RVZ8GFZ_S_x@black.fi.intel.com>
In-Reply-To: <aF627RVZ8GFZ_S_x@black.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 30 Jun 2025 10:34:52 +0200
X-Gm-Features: Ac12FXwteuFWX5OxpPzhYCStpBUe26-_BiNn01jAiVVAZa1D5iI1G9kmFgXiCF8
Message-ID: <CAMRc=Mci_q8PsJT2A33KtsPfSoO1BiDhB854M9__0KSv9YcB9w@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] gpio: sysfs: add a parallel class device for each
 GPIO chip using device IDs
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, Kent Gibson <warthog618@gmail.com>, 
	=?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, Marek Vasut <marex@denx.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 27, 2025 at 5:21=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Mon, Jun 23, 2025 at 10:59:49AM +0200, Bartosz Golaszewski wrote:
> >
> > In order to enable moving away from the global GPIO numberspace-based
> > exporting of lines over sysfs: add a parallel, per-chip entry under
> > /sys/class/gpio/ for every registered GPIO chip, denoted by device ID
> > in the file name and not its base GPIO number.
> >
> > Compared to the existing chip group: it does not contain the "base"
> > attribute as the goal of this change is to not refer to GPIOs by their
> > global number from user-space anymore. It also contains its own,
> > per-chip export/unexport attribute pair which allow to export lines by
> > their hardware offset within the chip.
> >
> > Caveat #1: the new device cannot be a link to (or be linked to by) the
> > existing "gpiochip<BASE>" entry as we cannot create links in
> > /sys/class/xyz/.
> >
> > Caveat #2: the new entry cannot be named "gpiochipX" as it could
> > conflict with devices whose base is statically defined to a low number.
> > Let's go with "chipX" instead.
> >
> > While at it: the chip label is unique so update the untrue statement
> > when extending the docs.
>
> ...
>
> >  struct gpiodev_data {
> >       struct gpio_device *gdev;
> >       struct device *cdev_base; /* Class device by GPIO base */
> > +     struct device *cdev_id; /* Class device by GPIO device ID */
>
> I would add it in the middle in a way of the possible drop or conditional
> compiling of the legacy access in the future.
>

I'm not sure what difference it makes?

> >  };
>
> ...
>
> > +static int export_gpio_desc(struct gpio_desc *desc)
> > +{
> > +     int offset, ret;
>
> Why offset is signed?
>

Because gpio_chip_hwgpio() returns a signed int.

> > +     CLASS(gpio_chip_guard, guard)(desc);
> > +     if (!guard.gc)
> > +             return -ENODEV;
> > +
> > +     offset =3D gpio_chip_hwgpio(desc);
> > +     if (!gpiochip_line_is_valid(guard.gc, offset)) {
> > +             pr_debug_ratelimited("%s: GPIO %d masked\n", __func__,
> > +                                  gpio_chip_hwgpio(desc));
>
> Can we use gdev here? (IIRC we can't due to some legacy corner cases)
>

Yeah, I think there was some revert here? In any case: it's material
for a different series, I'm just moving the code here.

> > +             return -EINVAL;
> > +     }
> > +
> > +     /*
> > +      * No extra locking here; FLAG_SYSFS just signifies that the
> > +      * request and export were done by on behalf of userspace, so
> > +      * they may be undone on its behalf too.
> > +      */
> > +
> > +     ret =3D gpiod_request_user(desc, "sysfs");
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D gpiod_set_transitory(desc, false);
> > +     if (ret) {
> > +             gpiod_free(desc);
> > +             return ret;
> > +     }
> > +
> > +     ret =3D gpiod_export(desc, true);
> > +     if (ret < 0) {
> > +             gpiod_free(desc);
> > +     } else {
> > +             set_bit(FLAG_SYSFS, &desc->flags);
> > +             gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_REQUES=
TED);
> > +     }
> > +
> > +     return ret;
> > +}
>
> ...
>
> > +static struct device_attribute dev_attr_export =3D __ATTR(export, 0200=
, NULL,
> > +                                                     chip_export_store=
);
>
> __ATTR_WO()
>

No can do, the attribute would have to be called "chip_export". A
function called export_store() already exists in this file.

> ...
>
> > +static struct device_attribute dev_attr_unexport =3D __ATTR(unexport, =
0200,
> > +                                                       NULL,
> > +                                                       chip_unexport_s=
tore);
>
> Ditto.
>
> ...
>
> > +static struct attribute *gpiochip_ext_attrs[] =3D {
> > +     &dev_attr_label.attr,
> > +     &dev_attr_ngpio.attr,
> > +     &dev_attr_export.attr,
> > +     &dev_attr_unexport.attr,
> > +     NULL,
>
> No comma for the terminator, please.
>

Ok.

> > +};
>
> ...
>
> > +     data->cdev_id =3D device_create_with_groups(&gpio_class, parent,
> > +                                               MKDEV(0, 0), data,
> > +                                               gpiochip_ext_groups,
> > +                                               "chip%d", gdev->id);
> > +     if (IS_ERR(data->cdev_id)) {
> > +             device_unregister(data->cdev_base);
> > +             kfree(data);
>
> UAF
>

Ok.

> > +             return PTR_ERR(data->cdev_id);
> > +     }
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Thanks,
Bart

