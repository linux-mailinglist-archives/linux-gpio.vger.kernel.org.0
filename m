Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56CE844367B
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Nov 2021 20:28:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbhKBTat (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Nov 2021 15:30:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229616AbhKBTas (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Nov 2021 15:30:48 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 853E3C061714;
        Tue,  2 Nov 2021 12:28:13 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id ee33so1218536edb.8;
        Tue, 02 Nov 2021 12:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e6nR869W0fXYmtUYDBLiuvK6kyQ8/vraF1nLWI4LcJY=;
        b=c/PlF2mYYJdg6tb03y3/poRALPQShfeRIjjN0Cd/RZgC1AJF17rY4gKpzJAfpq5upL
         DJ83v9oxARR2W9+7XWHfcoIByx13aCRlmuno40QG9iegzDviRyeCPnsEwD4PtF0L3ZVx
         KkA56KC86sUFwwvpbVhAqW7yCzqju+k6e12QJX7txEEashO96LuyOuZpcTtJS4YqDqoJ
         5zhA68u3tq4+ie4DpYmyp3W8sPSUWIvy/XcM3z0T+GqIiG947UeUSsBbpoukRqaFyMi3
         MUmFlU/9Aq84GLSUcSLAk05dCDL61AQSo6eddGu+Zxve8G9pZY6g8q2xgJX0qARvdRtJ
         mewA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e6nR869W0fXYmtUYDBLiuvK6kyQ8/vraF1nLWI4LcJY=;
        b=aPxjxYAVZYN48EKh+6bpmYXdVNU1Oy457LpjZVFu2Ak6HG5qkPz1cLKBOIU6lv80lE
         oZArFiarNjZAmT6am3NLOB9ddl/OSf0MHDweTStK3TOjP4zXlg5JUWoKBejV+Zg1hzcA
         LZeHGuP3Ngd8sFoVLR5gYJO/5hcfbAxXK09tzvHFZ3bSD6Z7mp92jHZ5raNWHr0CdeML
         nIHl+2imeND0+K36wmHHgQpPMF06HWgKdAyxjmTq5KR8kcuC3Vak1abTI/Uomme+yqYd
         SE2m1Qu1j0OC8rxk9CVuJu2PebJDz7Zm4Byrim4/1BpOdw1W8+xwvtYDChDIpHa4bV4E
         8DAw==
X-Gm-Message-State: AOAM5334mT+e74iVjhzVxD4/SZy7fICq6VeBOFyE9WHiMaKx7zS2BXco
        WNBniS9H/JQhCfO9eaXv6KPP2mdxBOYJhq8fsCI=
X-Google-Smtp-Source: ABdhPJzCj0xRCXkjyv/hIiJjCfUJ5rUX5AncZUkcCwb46GZ0zuec8x7+cPEhRp+yVeH+qQy9Q49wGMzka2/UB4eA66o=
X-Received: by 2002:a17:906:1707:: with SMTP id c7mr47083787eje.377.1635881291822;
 Tue, 02 Nov 2021 12:28:11 -0700 (PDT)
MIME-Version: 1.0
References: <20211102165657.3428995-1-robert.marko@sartura.hr> <20211102165657.3428995-2-robert.marko@sartura.hr>
In-Reply-To: <20211102165657.3428995-2-robert.marko@sartura.hr>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 2 Nov 2021 21:27:22 +0200
Message-ID: <CAHp75VdnQq76f5Xeo5LCq83sr4TbcXY_mtZ4x_rFzUkS01BYZg@mail.gmail.com>
Subject: Re: [PATCH v7 2/6] gpio: Add Delta TN48M CPLD GPIO driver
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 2, 2021 at 6:57 PM Robert Marko <robert.marko@sartura.hr> wrote:
>
> Delta TN48M switch has an onboard Lattice CPLD that is used as a GPIO
> expander.
>
> The CPLD provides 12 pins in total on the TN48M, but on more advanced
> switch models it provides up to 192 pins, so the driver is extendable
> to support more switches.

...

> +static int tn48m_gpio_probe(struct platform_device *pdev)
> +{

> +       const struct tn48m_gpio_config *gpio_config = NULL;
> +       struct gpio_regmap_config config = {0};

I don't see a point in assigning these variables.

> +       struct regmap *regmap;
> +       u32 base;
> +       int ret;
> +
> +       if (!pdev->dev.parent)
> +               return -ENODEV;
> +
> +       gpio_config = device_get_match_data(&pdev->dev);
> +       if (!gpio_config)
> +               return -ENODEV;
> +
> +       ret = device_property_read_u32(&pdev->dev, "reg", &base);
> +       if (ret)
> +               return ret;
> +
> +       regmap = dev_get_regmap(pdev->dev.parent, NULL);
> +       if (!regmap)
> +               return -ENODEV;

> +}

-- 
With Best Regards,
Andy Shevchenko
