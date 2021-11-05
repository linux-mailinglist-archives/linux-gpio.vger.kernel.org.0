Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 462384462C7
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Nov 2021 12:34:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232513AbhKELhD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Nov 2021 07:37:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232481AbhKELg7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Nov 2021 07:36:59 -0400
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE3E4C061205
        for <linux-gpio@vger.kernel.org>; Fri,  5 Nov 2021 04:34:19 -0700 (PDT)
Received: by mail-il1-x136.google.com with SMTP id h23so9133513ila.4
        for <linux-gpio@vger.kernel.org>; Fri, 05 Nov 2021 04:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=37ldEtgbRfj0gqJFzrwwBrgWWYf34odeJI+ew8Grfis=;
        b=YolaZi91DDInT1dsVjqw+qJjbqUg/DG2N5OtKURQJqUi1AtMdKBQ4T/eN8i9EQTu0K
         x38l3saebRQUlavZpRqAx1otsI5SWyxMUwdPY7d8riV7CvuHEL4d0TIBeJ1YnX8faTt7
         EtRTyQvUDH9AwYmipszH6ap767jpkXr93M1ci73GT2aj5hQIm8OQ2q3uZtOBOkOT+XNC
         78WMvGvksnwxlVkLXhXdSK/k/QzxjU73Jtyft4sXbFvWCz2n298EWpmNKY/PvaM3xT3U
         6UiRThnJWbvRXMYFYTk7jR1IFNpnCZZj2UNXWO0Q/ebuMp8UtS7GWZxmpqJAUD/eLA13
         pIlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=37ldEtgbRfj0gqJFzrwwBrgWWYf34odeJI+ew8Grfis=;
        b=AL1VV9PtwPlCi7IAsA7An/LYl/YPnfa0ThizPliSJNELr3o/44MXD+XQkl4XlW67MQ
         eECnu8ZQzy0xzIC28oHFh7legaEcI6IMe9ZHATW1SB46E5YCByWT84x8ezFQopJ20Zep
         oUqZNmtZVgYamp9kmSC49uiRomQtmlmlSKX87BuPZIA3nr7KkxDLrw9MPD+CnG3g+mqQ
         kYRIfiAAzsvaojpbnjZkGz6jvQa10RVRwX/Pa3CHsFQqjnB5qyeywtnqU6kZLHbIAp9n
         h/LVOhY+HavDwSqFhCj6IZkFRQph+YnT7eFmnPHkdXQ2Ck3TuWCL4mJ2AenFIHWKcV6/
         36DA==
X-Gm-Message-State: AOAM531hkHNuuL1Bo44Etskip968jr4Txg37ZGRqsS3rzcJlm3KnJ/A9
        zj1wq9BKxK8hiOMXD7iYYDK6vquZytiqjNmMUyuZww==
X-Google-Smtp-Source: ABdhPJyqSxx6zA492c2fosRkmsEeZkENhNp9Ep1J+ItnlqIdyZs5DCFE4cjf+WNodDJC9IapBTWEyMozmEqtlF1Dd1Y=
X-Received: by 2002:a05:6e02:1a4e:: with SMTP id u14mr28496369ilv.159.1636112059176;
 Fri, 05 Nov 2021 04:34:19 -0700 (PDT)
MIME-Version: 1.0
References: <20211102165657.3428995-1-robert.marko@sartura.hr>
 <20211102165657.3428995-2-robert.marko@sartura.hr> <CAHp75VdnQq76f5Xeo5LCq83sr4TbcXY_mtZ4x_rFzUkS01BYZg@mail.gmail.com>
In-Reply-To: <CAHp75VdnQq76f5Xeo5LCq83sr4TbcXY_mtZ4x_rFzUkS01BYZg@mail.gmail.com>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Fri, 5 Nov 2021 12:34:08 +0100
Message-ID: <CA+HBbNEEPHLbJSdWPdxWb5gASha_NavJrEBBRkbvzEW2aDSjmQ@mail.gmail.com>
Subject: Re: [PATCH v7 2/6] gpio: Add Delta TN48M CPLD GPIO driver
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Michael Walle <michael@walle.cc>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 2, 2021 at 8:28 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Nov 2, 2021 at 6:57 PM Robert Marko <robert.marko@sartura.hr> wrote:
> >
> > Delta TN48M switch has an onboard Lattice CPLD that is used as a GPIO
> > expander.
> >
> > The CPLD provides 12 pins in total on the TN48M, but on more advanced
> > switch models it provides up to 192 pins, so the driver is extendable
> > to support more switches.
>
> ...
>
> > +static int tn48m_gpio_probe(struct platform_device *pdev)
> > +{
>
> > +       const struct tn48m_gpio_config *gpio_config = NULL;
> > +       struct gpio_regmap_config config = {0};
>
> I don't see a point in assigning these variables.

Hi,
The NULL one isn't required, but the regmap one is, otherwise the
devm_gpio_regmap_register call will
return -EINVAL.

It will fail here:
https://elixir.bootlin.com/linux/latest/source/drivers/gpio/gpio-regmap.c#L209

I see that Michael Walle who did the GPIO regmap uses it as well in
the Kontron CPLD driver.
Michael, can you shed some light on this?

Regards,
Robert
>
> > +       struct regmap *regmap;
> > +       u32 base;
> > +       int ret;
> > +
> > +       if (!pdev->dev.parent)
> > +               return -ENODEV;
> > +
> > +       gpio_config = device_get_match_data(&pdev->dev);
> > +       if (!gpio_config)
> > +               return -ENODEV;
> > +
> > +       ret = device_property_read_u32(&pdev->dev, "reg", &base);
> > +       if (ret)
> > +               return ret;
> > +
> > +       regmap = dev_get_regmap(pdev->dev.parent, NULL);
> > +       if (!regmap)
> > +               return -ENODEV;
>
> > +}
>
> --
> With Best Regards,
> Andy Shevchenko



-- 
Robert Marko
Staff Embedded Linux Engineer
Sartura Ltd.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
