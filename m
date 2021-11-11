Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73C0C44DCAE
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Nov 2021 21:47:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233551AbhKKUun (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Nov 2021 15:50:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233303AbhKKUuk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Nov 2021 15:50:40 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41686C061766;
        Thu, 11 Nov 2021 12:47:51 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id m14so29320664edd.0;
        Thu, 11 Nov 2021 12:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ki6gnkwkkMma7xyvXJjnx5oSHaJdOKulL9iIZlSS/Jw=;
        b=c7IMSwmuWO7NipfDZrAgm+RV41xtN+bkn9ASeZENBSkWBctNkFAyXVnzvmfRB4DN/K
         Ow3+Ty5JpVBB18ScbmlL9JxG1fj95Q/Py0Hc0vVOzGC2mJszlxWCRVdg5QDMnBTPAKrF
         hSAt7FUDXu5pUqaS54z86oQcVpNNHLsg+dbSZKYc8Xg5FvmRb+U2CuizuvV0niyaXAws
         HXkHZB0gQg17Sx6FRxt4MqLrWVBzl1WvBceVXJM2e+jsRrtyTCt/zVDkFIF2HyWbT37p
         RNFRxiddgj4pasET7lYZqmYN1pBY0fmI8ogYM6JfxH+wj1iC2fkyDBl1sqqc2FVIGmUP
         pqvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ki6gnkwkkMma7xyvXJjnx5oSHaJdOKulL9iIZlSS/Jw=;
        b=vG3UIzPrx2ZOUejIcQZ0VLQ7q3bS05uZ0djL+9G/zCrprVE8rpDhwrKWszSTBh0jHZ
         pgSc6tkavl/+fiiQJQECojtik8yhvE2cjmMXk+WT90+Dp0DLMFkltDYZ9RaYSz7EALW6
         ni94i0ll4F/z7ZIC715ne49Hz9v6FTY/EKuEFTxxQ1z647XuJWR0QLoRFllnwBAuurwX
         EJ0bVr+b+fxe5VPXbsTwwHz1C1EHqY1tCT0LLp5QKB8F2SUerjCSwgT0PJfkRHVZ2BJb
         UnV72o99VKlSmx34SFBgHg1I5oAw5aZVKEHdAdFfB4+3D2L6ciW/+AYxOrmh6ElSRmSA
         rjHA==
X-Gm-Message-State: AOAM5320E+Xjm++d2CYoAxBwSOfW7mcoZDtB1sFbjhZ7XxEdxV5dufV/
        r2ep0A/eYC7OwMtRYm1fRrpidanfXj4tmnLoWTISIs8v8gVIsFTd
X-Google-Smtp-Source: ABdhPJw2xTC4uFOXclli48iZqg7DZ7H2eMiErevx2tFX0ST84bN1EoxGa51FKKdBhwkbQFVDa6l654RnYzY3ImOqyv0=
X-Received: by 2002:a05:6402:c89:: with SMTP id cm9mr4955222edb.283.1636663669885;
 Thu, 11 Nov 2021 12:47:49 -0800 (PST)
MIME-Version: 1.0
References: <20211111202506.19459-1-brgl@bgdev.pl> <20211111202506.19459-2-brgl@bgdev.pl>
In-Reply-To: <20211111202506.19459-2-brgl@bgdev.pl>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 11 Nov 2021 22:47:06 +0200
Message-ID: <CAHp75Vdbgk-SVe_eFHUdnNUF65ZSRPHVZXExus13Q6j2CHFy=g@mail.gmail.com>
Subject: Re: [PATCH RFC 2/2] gpiolib: check the 'ngpios' property in core
 gpiolib code
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 11, 2021 at 10:26 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> Several drivers read the 'ngpios' device property on their own, but
> since it's defined as a standard GPIO property in the device tree bindings
> anyway, it's a good candidate for generalization. If the driver didn't
> set its gc->ngpio, try to read the 'ngpios' property from the GPIO
> device's firmware node before bailing out.

Thanks!

...

> +               ret = fwnode_property_read_u32(gdev->dev.fwnode, "ngpios",
> +                                              &ngpios);

I'm wondering if there is any obstacle to call

               ret = device_property_read_u32(&gdev->dev, "ngpios", &ngpios);

?

Rationale (the main one) is to avoid direct dereference of fwnode from
struct device (it might be changed in the future). I really prefer API
calls here.

> +               if (ret == 0) {
> +                       gc->ngpio = ngpios;
> +               } else {
> +                       chip_err(gc, "tried to insert a GPIO chip with zero lines\n");
> +                       ret = -EINVAL;
> +                       goto err_free_descs;
> +               }

I would prefer the other way around and without 'else' being involved.

>         }


-- 
With Best Regards,
Andy Shevchenko
