Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7ECC3174205
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2020 23:33:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726589AbgB1WdK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Feb 2020 17:33:10 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:40222 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725957AbgB1WdK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Feb 2020 17:33:10 -0500
Received: by mail-lj1-f196.google.com with SMTP id 143so5064091ljj.7
        for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2020 14:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kpMCwJPHsrLHrJr/d/YMgs2GY9/L334aO8TrlrMaCrA=;
        b=g0xgaarU05W3RSjtAPA9tblHgqI6V0WPrwGkBFm1qkHKVRGZCKgYUKlrVXvftftHow
         nnsJ7vO0KEApkPGIbs4EuQF6ysI3PtAWtYxocPPwiFezn49DVXs0JgdF8ugNvdvJSnXC
         oCSYRW7DSRCFAzBU4mp/E3C4uS+SpA0DGRZVqTPZMe5TPIGLJ/7DzuD5pAY9aTRRGXc4
         eBHRMO/0odwgM3kPTcsEgdG2TRgcZSsXO48emgRRJZB65r8PSjSYEj+jJZHhtguCGsZP
         V9+uwYPRBEjD00y8GLfojLelEEWNO/7Ocv/ur+p1nu+asiIjpD9Pc/SglIpw3nTMi1xC
         HcdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kpMCwJPHsrLHrJr/d/YMgs2GY9/L334aO8TrlrMaCrA=;
        b=RHQyFdqWShs4xAaWYquAZpH1AZYYZUfVojSHzvCk0euhkpSjNrlih0cf4U1cEn/l10
         QpTQKVX846pelH+uc7x+x3SUK/AogWMIQEqlUdRrK7Kc5Xgh/9uvSmOudsM2Wm8nxa8g
         Ie29AV/m8Dr2k0Ni5sPjfAhiZdBGp+9r2mVKPo/5tzjdtfOO7c9DjR7jVnMgZX/aQ3zc
         sUAcYvrUCmQgMncFDrrZ++nMaF2vsf0W/uVFrc1BJlYer1JPfIC8lxAQsjT/ZoQdMhm+
         e2AamAaZyGQB0yYpCjjsCfBl6BT525yHax7Ey//Y2TKnHs7DJ5kpMz3dG57b+LdrAPXT
         ITVQ==
X-Gm-Message-State: ANhLgQ37eKjF+BsTRugvXTMV6xGA7/bI1NMUKYeef/i5F1GUSq8xqPLQ
        r7W6jT6YCYvp6Rh+PdoPrOxYm6jAJpEHxrCFnes6Pw1nWgQ=
X-Google-Smtp-Source: ADFU+vtc1OzGddV5djfc//H/DNZzPS/rutyJLa99T7WGqAXyEX27iUhLOlCXVDp8//D7AaqwnHMg9AMSkedfxzU5NNk=
X-Received: by 2002:a2e:9013:: with SMTP id h19mr4375691ljg.223.1582929188647;
 Fri, 28 Feb 2020 14:33:08 -0800 (PST)
MIME-Version: 1.0
References: <20200221154837.18845-1-brgl@bgdev.pl> <20200221154837.18845-4-brgl@bgdev.pl>
In-Reply-To: <20200221154837.18845-4-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 28 Feb 2020 23:32:57 +0100
Message-ID: <CACRpkdYtHqTBr7HW4Oex+igAbyb3PuS16uq1DXe4mK2vzxNoCw@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] gpiolib: use kref in gpio_desc
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Khouloud Touil <ktouil@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Feb 21, 2020 at 4:48 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> GPIO descriptors are freed by consumers using gpiod_put(). The name of
> this function suggests some reference counting is going on but it's not
> true.
>
> Use kref to actually introduce reference counting for gpio_desc objects.
> Add a corresponding gpiod_get() helper for increasing the reference count.
>
> This doesn't change anything for already existing (correct) drivers but
> allows us to keep track of GPIO descs used by multiple users.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

I'm having some trouble figuring out if we might be reinventing
a wheel here.

A while back there was a proposed patch to add device links
between GPIO producers and consumers, so that a GPIO
chip won't be dropped while there are active consumers.

(I don't remember who sent the patch.)

We have a similar functionality in pin control if the
.link_consumers property is set on the pincontrol device.
I was thinking about making that compulsory at one point.

The device links use a kref already existing in struct
device and would in this case be the kref in the struct
device for the struct gpio_device.

So if that existed, gpiod_ref could just grab another
device_link_add().

Maybe we should just add device links between all
GPIO consumers (devices) and struct gpio_device:s
struct device and implement it like this so we don't
have to back out of this later?

C.f. commit
commit 036f394dd77f8117346874151793ec38967d843f
pinctrl: Enable device link creation for pin control

(...)
> @@ -81,6 +81,7 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
>  struct gpio_descs *__must_check gpiod_get_array_optional(struct device *dev,
>                                                         const char *con_id,
>                                                         enum gpiod_flags flags);
> +struct gpio_desc *gpiod_ref(struct gpio_desc *desc);
>  void gpiod_put(struct gpio_desc *desc);
>  void gpiod_put_array(struct gpio_descs *descs);

You forgot to add a stub for the case where GPIOLIB is not
compiled in I think? (Lower in the same file.)

Yours,
Linus Walleij
