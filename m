Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03FD532D12A
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 11:52:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238890AbhCDKvL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 05:51:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235138AbhCDKup (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 05:50:45 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 015C8C061574;
        Thu,  4 Mar 2021 02:50:05 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id x24so1407880pfn.5;
        Thu, 04 Mar 2021 02:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=FoGsnOzXi7H9nz19W/bgb/1Kxx0meiyadtP/QvxkNiA=;
        b=n53vzKHXuqPKNk87GMWTNa2nfV96TlDoPYmjDgzqyo8kcAWpEOU6OhiwMfLVeo/qf2
         pyjk16yl/13dlOsHu5T3E2PzqDcGryW6gjBTdeA99cZm0dp452DOUH2E84CvTqOSJul9
         mPFfdH0ASp/msC5XRsUr0CLBhjO0o6J7dMG8/0X1uTFZdYJX9skqHIIyjFRIteJnQa/S
         /r5eWnNud0OqXJ3jGdt/96Th4uZDK/NPoTKSjRqVT9fCkw4IVc/eoE4HoCA+Ge37X7ED
         aKTuI9TdwZddRXhrkVPFbNO4zmy/YPz03Dv6OnJ2mgSySDmjEh6jnHvG1cHqR2mrGvm3
         knNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=FoGsnOzXi7H9nz19W/bgb/1Kxx0meiyadtP/QvxkNiA=;
        b=ShtlVHSOQCsGU7NIKVfN996S3l1Qok5athbKuuxCdVZd5SjpfeHI4nCdjEeX33fs0y
         0OuHE+Yu6EXC4LbxemzC5xKnwXNP5FpMODQcQXR1S9e1ErNYoAZfiujV5rH8UxwNS+HK
         3KuHRnYy7yOrq04oGt+4UGSKrk8A9N1qvVepAhyklzNfTVPpxtC+F5AzT7txkSDs0PA1
         xltWOD6gEXBZ3/bYinV0teDoLObT12vMMyQjYTIIxsbDGvpg0r5DSEBwMgpqkwQ/gyR5
         aTXovzGyteHCZFZht/zAxpEMX9w804R7IsjbkS5zYKWT2RMrd8E4ivIGdtZsgIb6ITqI
         hTIg==
X-Gm-Message-State: AOAM532W+v5ZzSN9boaC9gj9koKAWkrtMZrEZNS9zgs/JxCfjEJhvhOO
        2QcwT4MSSA5KNE9S2SNg477TSdHKZVFUOHwnVv8=
X-Google-Smtp-Source: ABdhPJy2flX7Ea1zvFciNHtUD9op+hNlZxpNVpbA5cITJj9ODh1I6pHXRdOeEnWrzVfiJdLABTAKr4UQrRue03M70aQ=
X-Received: by 2002:a62:7c43:0:b029:1ef:20ce:ba36 with SMTP id
 x64-20020a627c430000b02901ef20ceba36mr2144918pfc.40.1614855004451; Thu, 04
 Mar 2021 02:50:04 -0800 (PST)
MIME-Version: 1.0
References: <20210304085710.7128-1-noltari@gmail.com> <20210304085710.7128-6-noltari@gmail.com>
In-Reply-To: <20210304085710.7128-6-noltari@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 4 Mar 2021 12:49:48 +0200
Message-ID: <CAHp75Vc8Gk0ZVjfQH71-Du1ZB1HT5qrgbT6HZgXQd-C6xE05ZQ@mail.gmail.com>
Subject: Re: [PATCH v4 05/15] pinctrl: add a pincontrol driver for BCM6328
To:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 4, 2021 at 10:57 AM =C3=81lvaro Fern=C3=A1ndez Rojas
<noltari@gmail.com> wrote:
>
> Add a pincontrol driver for BCM6328. BCM628 supports muxing 32 pins as
> GPIOs, as LEDs for the integrated LED controller, or various other
> functions. Its pincontrol mux registers also control other aspects, like
> switching the second USB port between host and device mode.

...

> +static inline unsigned int bcm6328_mux_off(unsigned int pin)
> +{
> +       static const unsigned int bcm6328_mux[] =3D {
> +               BCM6328_MUX_LO_REG,
> +               BCM6328_MUX_HI_REG,

> +               BCM6328_MUX_OTHER_REG

When it's not terminator add a comma, otherwise remove a comma.

Also, why is it inside a function? It's anyway global and constant.

> +       };

...

> +       regmap_update_bits(pc->regs, bcm6328_mux_off(pin),
> +                          3UL << ((pin % 16) * 2),

3UL =3D> #define BLABLA  GENMASK(1, 0)

> +                          mux << ((pin % 16) * 2));

...

> +static const struct of_device_id bcm6328_pinctrl_match[] =3D {
> +       { .compatible =3D "brcm,bcm6328-pinctrl", },
> +       { },

No comma.

> +};

Above comments to all your patches.

--=20
With Best Regards,
Andy Shevchenko
