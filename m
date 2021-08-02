Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82C613DD554
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Aug 2021 14:12:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233593AbhHBMMq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Aug 2021 08:12:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233570AbhHBMMn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Aug 2021 08:12:43 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A73BC061798
        for <linux-gpio@vger.kernel.org>; Mon,  2 Aug 2021 05:12:33 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id k65so6288067yba.13
        for <linux-gpio@vger.kernel.org>; Mon, 02 Aug 2021 05:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FkCp4kdPQ6v+pD/rtKzXxvtpigTWSSTz78u5tHl7Xw0=;
        b=oW3C6jQOKtE2Ij6HWnrX36JyH29DLnGDBkzqnseCD3B7Sg45+lwtJoAJZ6sE1xwsBV
         1uBHXVrgz4+y/kx88AZx4qgoDD2KPTmkBnKw+/OWNDXkL0mWqawKi4O+O5aykFa1JYsh
         OGVPL6HQPx5AECzgnWCey3MdUAHaOsAFWBpK9JJwxRnr2cv4E0UwqHZS2mvcAHDSXbGy
         G7/4O+2vt9i5Agaj6h56yWKGWaoep+YCpCW5Q/CDVe3ce1xuv8YzU4KuFO0KKYSykm+8
         /pRoi3FaG/XftwBg2ylo1IwT7R2sGyysK4tkr1v3bWyHZ2/+V/fqiEhBhliFfjUwg+/w
         u4EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FkCp4kdPQ6v+pD/rtKzXxvtpigTWSSTz78u5tHl7Xw0=;
        b=uPT4FeIi6fadA40J2+TnQR0Qs2K6QBnpbvWt8eUJZukwWupL/S8MfKEMXKTWaSo+tF
         5dXS2LJ829cHlOmb6LggmOaxt4bZjFWGXqUhR8Zha63J4lwTJZyh2GB/kzXqXK7suEec
         QmLqLRVc8dkRW+d+4RwLRT0itUfKhZzdo2oEbmMwnxq6YMZ2DsJ3x+FC/6oUs1eLwQXS
         XN4zqMeGBcCwpiJKzvy7KCutJ5w86TQl+t3SnGuF5q+IcHLH2e7RJysc1b4tFfSxoeYF
         vd9X4p1BtyKvYPgO/Zi6y/LofLwwsjSeEwOgEVr6YKcdYSPaZTjjGqbPZyszhOaYOUWo
         tmlA==
X-Gm-Message-State: AOAM530Or0/QO4EqBWkDjVqcgUG0uR+S3VfYRBjkqgVS/47VDe6QjxpZ
        0BNcZtzLFkrLgvPVLvfpU/sRrsTb4UmQWUBh5FwUHQ==
X-Google-Smtp-Source: ABdhPJy6a5HZVxB9QkM1YtlwtQkCC0+Bz2t7K/BwPm0KVMjX6zhDgVGwtwfL/HS+j98n5oZ4L6lpPPFQBXirLB10Zn8=
X-Received: by 2002:a25:48c7:: with SMTP id v190mr20238398yba.312.1627906352461;
 Mon, 02 Aug 2021 05:12:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210716221744.5445-1-robert.marko@sartura.hr> <CAMpxmJXy1L-OC7k+h6pOwFGNS8WntNSMjP1Kvu7tnCQvGNwnRw@mail.gmail.com>
In-Reply-To: <CAMpxmJXy1L-OC7k+h6pOwFGNS8WntNSMjP1Kvu7tnCQvGNwnRw@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 2 Aug 2021 14:12:21 +0200
Message-ID: <CAMpxmJVJzaRRe5XyyZM6qOzpi2t36hSbsTec=M3EUk9w17W4qQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: tn48m: Add support for Delta TN4810M CPLD
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 2, 2021 at 2:10 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
>
> On Sat, Jul 17, 2021 at 12:17 AM Robert Marko <robert.marko@sartura.hr> wrote:
> >
> > Delta TN4810M uses a similar CPLD GPIO expander
> > like the TN48M, but it has pins for 48 SFP+ ports,
> > making a total of 192 pins.
> > It also provides the TX fault pins which the TN48M
> > does not.
> >
> > Only TX disable pins like on the TN48M are output
> > ones.
> >
> > Thankfully, regmap GPIO allows for the driver to be
> > easily extended to support the TN4810M.
> >
> > Note that this patch depends on the following series:
> > https://patchwork.ozlabs.org/project/linux-gpio/list/?series=247538
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > ---
> >  drivers/gpio/gpio-tn48m.c | 56 ++++++++++++++++++++++++++++++++++++---
> >  1 file changed, 52 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpio/gpio-tn48m.c b/drivers/gpio/gpio-tn48m.c
> > index b12a6b4bc4b3..e429e7ade941 100644
> > --- a/drivers/gpio/gpio-tn48m.c
> > +++ b/drivers/gpio/gpio-tn48m.c
> > @@ -19,6 +19,10 @@ enum tn48m_gpio_type {
> >         TN48M_SFP_TX_DISABLE = 1,
> >         TN48M_SFP_PRESENT,
> >         TN48M_SFP_LOS,
> > +       TN4810M_SFP_TX_DISABLE,
> > +       TN4810M_SFP_TX_FAULT,
> > +       TN4810M_SFP_PRESENT,
> > +       TN4810M_SFP_LOS,
> >  };
> >
> >  static int tn48m_gpio_probe(struct platform_device *pdev)
> > @@ -46,17 +50,36 @@ static int tn48m_gpio_probe(struct platform_device *pdev)
> >
> >         config.regmap = regmap;
> >         config.parent = &pdev->dev;
> > -       config.ngpio = 4;
> > +       config.ngpio_per_reg = 8;
> >
> >         switch (type) {
> >         case TN48M_SFP_TX_DISABLE:
> >                 config.reg_set_base = base;
> > +               config.ngpio = 4;
> >                 break;
> >         case TN48M_SFP_PRESENT:
> >                 config.reg_dat_base = base;
> > +               config.ngpio = 4;
> >                 break;
> >         case TN48M_SFP_LOS:
> >                 config.reg_dat_base = base;
> > +               config.ngpio = 4;
> > +               break;
> > +       case TN4810M_SFP_TX_DISABLE:
> > +               config.reg_set_base = base;
> > +               config.ngpio = 48;
> > +               break;
> > +       case TN4810M_SFP_TX_FAULT:
> > +               config.reg_dat_base = base;
> > +               config.ngpio = 48;
> > +               break;
> > +       case TN4810M_SFP_PRESENT:
> > +               config.reg_dat_base = base;
> > +               config.ngpio = 48;
> > +               break;
> > +       case TN4810M_SFP_LOS:
> > +               config.reg_dat_base = base;
> > +               config.ngpio = 48;
> >                 break;
> >         default:
> >                 dev_err(&pdev->dev, "unknown type %d\n", type);
> > @@ -67,9 +90,34 @@ static int tn48m_gpio_probe(struct platform_device *pdev)
> >  }
> >
> >  static const struct of_device_id tn48m_gpio_of_match[] = {
> > -       { .compatible = "delta,tn48m-gpio-sfp-tx-disable", .data = (void *)TN48M_SFP_TX_DISABLE },
> > -       { .compatible = "delta,tn48m-gpio-sfp-present", .data = (void *)TN48M_SFP_PRESENT },
> > -       { .compatible = "delta,tn48m-gpio-sfp-los", .data = (void *)TN48M_SFP_LOS },
> > +       {
> > +               .compatible = "delta,tn48m-gpio-sfp-tx-disable",
> > +               .data = (void *)TN48M_SFP_TX_DISABLE
> > +       },
> > +       {
> > +               .compatible = "delta,tn48m-gpio-sfp-present",
> > +               .data = (void *)TN48M_SFP_PRESENT
> > +       },
> > +       {
> > +               .compatible = "delta,tn48m-gpio-sfp-los",
> > +               .data = (void *)TN48M_SFP_LOS
> > +       },
> > +       {
> > +               .compatible = "delta,tn4810m-gpio-sfp-tx-disable",
> > +               .data = (void *)TN4810M_SFP_TX_DISABLE
> > +       },
> > +       {
> > +               .compatible = "delta,tn4810m-gpio-sfp-tx-fault",
> > +               .data = (void *)TN4810M_SFP_TX_FAULT
> > +       },
> > +       {
> > +               .compatible = "delta,tn4810m-gpio-sfp-present",
> > +               .data = (void *)TN4810M_SFP_PRESENT
> > +       },
> > +       {
> > +               .compatible = "delta,tn4810m-gpio-sfp-los",
> > +               .data = (void *)TN4810M_SFP_LOS
> > +       },
> >         { }
> >  };
> >  MODULE_DEVICE_TABLE(of, tn48m_gpio_of_match);
> > --
> > 2.31.1
> >
>
> This looks good to me. I suppose the other patches are going in
> through the MFD tree. I don't see anything that can fail here at
> build-time - can you confirm that I can pick these patches up
> separately for v5.15?
>
> Bartosz

Scratch that, I now saw Linus' comment about the special purpose pins
under the other series. Let's clear that up first.

Bart
