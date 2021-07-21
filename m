Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 850463D0F63
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jul 2021 15:22:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237554AbhGUMlc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Jul 2021 08:41:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237482AbhGUMlb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Jul 2021 08:41:31 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C51DC061574
        for <linux-gpio@vger.kernel.org>; Wed, 21 Jul 2021 06:22:08 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id c16so3231290ybl.9
        for <linux-gpio@vger.kernel.org>; Wed, 21 Jul 2021 06:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hZwJIZ2K8rI+pgGDI4cRSYEmo/51p2RfSvQRRFc/6G4=;
        b=0gXQ/a23lNAjY5FnFoHI7VxYXSSMWX/t4jL07nsAlNKb6JVO23YYoQw8SWcOtoIaAr
         hN2QjeLOUHkU+hwXt7lLocn7hvj1h20uruk98GGvQzUQaaAw70vph/s3/2yjP4XrmZ81
         qbrkWDqyHMgPlanL4TC2pDIqUjLLYokXvUjlCvfumMke4TBaCVNcHtcom90ZoD77AWw5
         5BpwcsHBx1lRY1BbXn+raMT1dRXenqN6U7SWu1TXDKJSJYVcqLmxrDf4qbwD/jOZHRlS
         MgI0JTrw/d85WSOCt+OVCxkd/9Q9TuzsQIzJVqzoRGEYG+H0AU/CNtxCGu76CoV6tLgU
         TnKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hZwJIZ2K8rI+pgGDI4cRSYEmo/51p2RfSvQRRFc/6G4=;
        b=oSPIHMJhFU9eFElxBKua3HwTrWbmViTyeDbogGDGHTD9zQzjzcXD+Ie9rKUxQ6F5c9
         nd+OqmAaUqFRMrwtwtc9TA53cmPJpdk0iAJLDyHSB3/878k92ySy3qcN8LN5ORS3B3Bx
         Jkni0sweZJoIeR0yNZ+16o8VKF5pP3tTgTIEV62qVtqXDAYD3EUY7YIJzysRCY3ldofF
         me83iU9xYkg/w4GFj6C13tZNR1odXPWl7TnGfooelSavyda1AfAz0hCyH+RPOXoo4Paz
         awnA9hVqXFl+h7Iy5Rh4iMjf9XJQkV0woykGobykIh/4sjwSPqPK57ODN7VOOLDcxB+6
         auUg==
X-Gm-Message-State: AOAM53343HHOjR9tu6b+unfViOLiI8S72Z/F7FJbbaJALQoVBkUOihMd
        /U0NhstVg8qsHaA2zXrlBb8S1DIyB1XPYqVfGv0Y1w==
X-Google-Smtp-Source: ABdhPJw8tfeSdvqXHu/1qe0V/wMQMlfodPC+f/Nl6xWtn/+jWFe1PPf/A/jN0HUkWv08N5OaobskQXxJjgLKnY4J2rc=
X-Received: by 2002:a25:ca54:: with SMTP id a81mr26099538ybg.157.1626873727771;
 Wed, 21 Jul 2021 06:22:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210708152054.361704-1-hannu@hrtk.in>
In-Reply-To: <20210708152054.361704-1-hannu@hrtk.in>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 21 Jul 2021 15:21:57 +0200
Message-ID: <CAMpxmJWT-aG_KL66-0vDc7KAV_yGU7gWFrhk5BNenPix8v+RsA@mail.gmail.com>
Subject: Re: [PATCH] docs: gpio: explain GPIOD_OUT_* values and toggling
 active low
To:     Hannu Hartikainen <hannu@hrtk.in>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-doc <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 8, 2021 at 5:21 PM Hannu Hartikainen <hannu@hrtk.in> wrote:
>
> I was confused about the gpiod_flags values and thought that
> GPIOD_OUT_LOW and GPIOD_OUT_HIGH set the line to be active low / active
> high. This is not true, but I got the misconception because the flags
> GPIOD_OUT_*_OPEN_DRAIN do change line configuration and there's a
> subchapter about *active low* and *open drain* semantics.
>
> Add an explicit mention that the initial value is a logical value (and
> not the line configuration or physical line level). Also add a mention
> of the function gpiod_toggle_active_low which was previously missing
> from this document.
>
> Signed-off-by: Hannu Hartikainen <hannu@hrtk.in>
> ---
>  Documentation/driver-api/gpio/consumer.rst | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/driver-api/gpio/consumer.rst b/Documentation/driver-api/gpio/consumer.rst
> index 3366a991b4aa..47869ca8ccf0 100644
> --- a/Documentation/driver-api/gpio/consumer.rst
> +++ b/Documentation/driver-api/gpio/consumer.rst
> @@ -72,6 +72,10 @@ for the GPIO. Values can be:
>  * GPIOD_OUT_HIGH_OPEN_DRAIN same as GPIOD_OUT_HIGH but also enforce the line
>    to be electrically used with open drain.
>
> +Note that the initial value is *logical* and the physical line level depends on
> +whether the line is configured active high or active low (see
> +:ref:`active_low_semantics`).
> +
>  The two last flags are used for use cases where open drain is mandatory, such
>  as I2C: if the line is not already configured as open drain in the mappings
>  (see board.txt), then open drain will be enforced anyway and a warning will be
> @@ -252,6 +256,8 @@ that can't be accessed from hardIRQ handlers, these calls act the same as the
>  spinlock-safe calls.
>
>
> +.. _active_low_semantics:
> +
>  The active low and open drain semantics
>  ---------------------------------------
>  As a consumer should not have to care about the physical line level, all of the
> @@ -309,9 +315,11 @@ work on the raw line value::
>         void gpiod_set_raw_value_cansleep(struct gpio_desc *desc, int value)
>         int gpiod_direction_output_raw(struct gpio_desc *desc, int value)
>
> -The active low state of a GPIO can also be queried using the following call::
> +The active low state of a GPIO can also be queried and toggled using the
> +following calls::
>
>         int gpiod_is_active_low(const struct gpio_desc *desc)
> +       void gpiod_toggle_active_low(struct gpio_desc *desc)
>
>  Note that these functions should only be used with great moderation; a driver
>  should not have to care about the physical line level or open drain semantics.
> --
> 2.32.0
>

Makes sense, applied!

Bartosz
