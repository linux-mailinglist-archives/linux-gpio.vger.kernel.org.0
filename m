Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3CB7107216
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Nov 2019 13:22:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727388AbfKVMWh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Nov 2019 07:22:37 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:40241 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726676AbfKVMWh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Nov 2019 07:22:37 -0500
Received: by mail-lj1-f194.google.com with SMTP id q2so7149367ljg.7
        for <linux-gpio@vger.kernel.org>; Fri, 22 Nov 2019 04:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Nmv33MELYtHNW1JfSh62V5xviPKhtu29GeC7rSDHuak=;
        b=ldxD3IhYiBpXt0HtDqPy+vLU768rI80wemhHlXIxuozaMFv5BDMGXKOwBdiTtG9qrR
         K7zRO7F/VgnMzk8I8ViyED5oc2rFQNjKTHMCKLQzSVexza+EwBbDstq+EFImT/WDe/zG
         503aY643zXLckIPlmPcnJgLOZJdjVCE1nglK67MKhx6dB+GbBLtRnybiR8UXj6qrbp9x
         dqZlKECSFxFo0Hoi4CrvCufy4IpzUbDbldl2pNTGpKSx5NJLQo5vB78ttUb88d8B/gwV
         ogwPci75B5adEZt65PD+NaL85SKKIgd2iVepO5qxnX7cs08JeYbvg5nc8A2VuhY8jRZr
         KH+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Nmv33MELYtHNW1JfSh62V5xviPKhtu29GeC7rSDHuak=;
        b=F6Tz/c6fwZ7YXYmdBOI4+U1xmwwwFFj3d80sq6+HWqlYmO74s6omh8+wWWM3ykxYsX
         lErlQW6EH4a/A5Ktq50zrqmU3Ljo3o7FWbnfaN3fafskVPTKg3ZRsppEbamUfhiFjntx
         eU+oIFO/j08IwiMAGXYFADMWPJQA0iLD5wjeOI/ms+roNGai4EQ4KQ2lWtHdOkuZZ3Pu
         5XvpNwwbNMr6Rg+Tmdv/h949XuImcyaEjUUg2K/30KypVStaLkPsYmCZDDjNJCN2u1Di
         QBwR9nfKRdAnCcObFYl0aTc8FKejuSKSocvy3p3m0sWv78yok4D1PhLJC91r0yBwSx/m
         J36w==
X-Gm-Message-State: APjAAAVnowkJKK0ZNUQM6cAAwX2KGry9Kmlv4S64pku0HGcUQpXyiWwt
        CjdajLSXJ5HSYlV1IlVTemJWaC3mtPhmkq7vJfnaJA==
X-Google-Smtp-Source: APXvYqyuibo8EMRCgLutCbJAKbmXaQdrAZ0ALQbk7n8Lv+v95MQiTUFmPlM0+aEEhGrw1vBXS7BDDJdva4A7Rhaxntk=
X-Received: by 2002:a2e:8597:: with SMTP id b23mr12114009lji.218.1574425354454;
 Fri, 22 Nov 2019 04:22:34 -0800 (PST)
MIME-Version: 1.0
References: <20191120133409.9217-1-peter.ujfalusi@ti.com> <20191120133409.9217-3-peter.ujfalusi@ti.com>
In-Reply-To: <20191120133409.9217-3-peter.ujfalusi@ti.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 22 Nov 2019 13:22:23 +0100
Message-ID: <CACRpkdYt5P=GNc3EgHb-ry9fxMbXfpZd4FC=tuLqonNJKUM2wg@mail.gmail.com>
Subject: Re: [RFC 2/2] gpiolib: Support for (output only) shared GPIO line
To:     Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mark Brown <broonie@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 20, 2019 at 2:34 PM Peter Ujfalusi <peter.ujfalusi@ti.com> wrote:

> This patch adds basic support for handling shared GPIO lines in the core.
> The line must be configured with a child node in DT.
> Based on the configuration the core will use different strategy to manage
> the shared line:
> refcounted low: Keep the line low as long as there is at least one low
>                 request is registered
> refcounted high: Keep the line high as long as there is at least one high
>                 request is registered
> pass through: all requests are allowed to go through without refcounting.
>
> The pass through mode is equivalent to how currently the
> GPIOD_FLAGS_BIT_NONEXCLUSIVE is handled.
>
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>

This is a good start! Some ideas on how I'd like this to develop.

>  drivers/gpio/gpiolib-of.c |  28 ++++++--
>  drivers/gpio/gpiolib.c    | 132 +++++++++++++++++++++++++++++++++++---

Please put this API under its own Kconfig option
and in its own file in
drivers/gpio/gpiolib-refcounted.c
local header in
drivers/gpio/gpiolib-refcounted.h
only built in if the appropriate Kconfig is selected.

Consumer header in
include/linux/gpio/reference-counted.h
And add external driver API to this last file.

> --- a/drivers/gpio/gpiolib-of.c

No commenting on this because as pointed out in the binding
patch I want this done by simply detecting the same GPIO
being referenced by several <&gpio N> phandles.

> diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
> index ca9bc1e4803c..0eec0857e3a8 100644
> --- a/drivers/gpio/gpiolib.h
> +++ b/drivers/gpio/gpiolib.h
> @@ -111,11 +111,18 @@ struct gpio_desc {
>  #define FLAG_PULL_UP    13     /* GPIO has pull up enabled */
>  #define FLAG_PULL_DOWN  14     /* GPIO has pull down enabled */
>  #define FLAG_BIAS_DISABLE    15        /* GPIO has pull disabled */
> +#define FLAG_IS_SHARED 16      /* GPIO is shared */

This is a good way of flagging that this is a refcounted GPIO
I would call it FLAG_IS_REFERENCE_COUNTED as it is
more precise to what it means.

> +#define FLAG_REFCOUNT_LOW 17   /* Shared GPIO is refcounted for raw low */
> +#define FLAG_REFCOUNT_HIGH 18  /* Shared GPIO is refcounted for raw high */

Do not put this here, keep it in the local refcounted GPIO
struct gpio_refcount_desc.

>         /* Connection label */
>         const char              *label;
>         /* Name of the GPIO */
>         const char              *name;
> +       /* Number of users of a shared GPIO */
> +       int                     shared_users;
> +       /* Reference counter for shared GPIO (low or high level) */
> +       int                     level_refcount;

We can't expand this struct for everyone on the planet like this.

In the local header

drivers/gpio/gpiolib-refcount.h create something like:

struct gpio_refcount_desc {
    struct gpio_desc *gd;
    int shared_users;
    int level_refcount;
};

This should be the opaque cookie returned to consumers of this new
refcounted API.

It defines the reference counted API as separate and optional from
the non-reference counted API, also using its own API.

The only effect on the core
gpiolib will be the single flag in struct gpio_desc; and some
calls into the shared code with stubs if the support for systems
that do not enable the reference counting API.

Yours,
Linus Walleij
