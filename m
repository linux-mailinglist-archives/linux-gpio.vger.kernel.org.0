Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AEDD3DF58A
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Aug 2021 21:24:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239837AbhHCTY1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Aug 2021 15:24:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239807AbhHCTY0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Aug 2021 15:24:26 -0400
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1E7EC061757
        for <linux-gpio@vger.kernel.org>; Tue,  3 Aug 2021 12:24:15 -0700 (PDT)
Received: by mail-il1-x132.google.com with SMTP id r1so20494711iln.6
        for <linux-gpio@vger.kernel.org>; Tue, 03 Aug 2021 12:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y/96BfjABv+2ZK/jpZFi0iu7CC65Hm3uVOTHPl3m7mc=;
        b=Ko8QTO3UZSL5npPAstJpoSRhMsNNBsd/m+RXr2vM4jmlvFN7qFCzS2Pel07CpVgoeX
         fwBBq7ddPVKUAPWN8a87MqRGb9P2/Z5aAKH1ENiY25Hn5M09EgDvChWoZ+USVGBrawS/
         Aurnhygcg52ToqtSfIQtMLFg6HScrNQXM/33c0M01M+itkfov12rPTIg/b34qBXMBmub
         pvWAIUI8mQRFLtAGY3PSt4bdvqkYmBZFcQbSHioXvnXQUGxeSdMmNDj64L5n6UPopYef
         O3wwWReeV6RTCpGuPSuQHOA6sWKPNyoSmF8I9L+1nEsrKSHExR9zVAFTngqD41zI61c4
         ZAqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y/96BfjABv+2ZK/jpZFi0iu7CC65Hm3uVOTHPl3m7mc=;
        b=iek6J83PfN3PHieduBjzlb+sLzQcw7pwJy3oKS5lEpbBIv5kdtf8oHdKKhzkADPLZ5
         1uwd6BOFFN9XMPf/Z/hlH3mHKcYmwLN+jOICUVzsEd2CjED1FeJ7svzrXYuSrgD2Vf/M
         oNMF8NoTK6yY/99k2/bPgbNtLquEl5CqbUSOkrL5/UAQX836HasL8f/WtwzGIN5EAjz+
         VqnQw07FnAomcXals5m7bAclhDE2xChHFrlIofddlCjI0XBENQq9IS+ZKl+Xhl0tVKex
         kqZzoGKTTs2gvI5MzotgbOhb6CKlIrPeDf8egZCCEyLxDH5FB5H5M9wUNGK63vyL2lKO
         Vchw==
X-Gm-Message-State: AOAM530ffbdZal/jNusuvbRjlTmdCynX39k0h0I8V4mfNQ4U7sVhGhK1
        QCWN/l0Uj1peh7sb+AGVbtx42h2tFLxuF9K7l/TLjw==
X-Google-Smtp-Source: ABdhPJyX1ZSfqH/AM+chZ4P6MWp2pVXcWeKNvN7A233YTlajJvq47+chl66UqJg64+jhJfxV2EFAZb7KkWOPXkqX60s=
X-Received: by 2002:a05:6e02:5cf:: with SMTP id l15mr2268307ils.90.1628018655151;
 Tue, 03 Aug 2021 12:24:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210716221744.5445-1-robert.marko@sartura.hr>
 <CAMpxmJXy1L-OC7k+h6pOwFGNS8WntNSMjP1Kvu7tnCQvGNwnRw@mail.gmail.com> <CAMpxmJVJzaRRe5XyyZM6qOzpi2t36hSbsTec=M3EUk9w17W4qQ@mail.gmail.com>
In-Reply-To: <CAMpxmJVJzaRRe5XyyZM6qOzpi2t36hSbsTec=M3EUk9w17W4qQ@mail.gmail.com>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Tue, 3 Aug 2021 21:24:04 +0200
Message-ID: <CA+HBbNGZ7=bfVQ0k6Yz6ywomBpf7upG7gOxN8dJEd6ErdWzaMA@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: tn48m: Add support for Delta TN4810M CPLD
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Luka Perkov <luka.perkov@sartura.hr>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 2, 2021 at 2:12 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
>
> On Mon, Aug 2, 2021 at 2:10 PM Bartosz Golaszewski
> <bgolaszewski@baylibre.com> wrote:
> >
> > On Sat, Jul 17, 2021 at 12:17 AM Robert Marko <robert.marko@sartura.hr> wrote:
> > >
> > > Delta TN4810M uses a similar CPLD GPIO expander
> > > like the TN48M, but it has pins for 48 SFP+ ports,
> > > making a total of 192 pins.
> > > It also provides the TX fault pins which the TN48M
> > > does not.
> > >
> > > Only TX disable pins like on the TN48M are output
> > > ones.
> > >
> > > Thankfully, regmap GPIO allows for the driver to be
> > > easily extended to support the TN4810M.
> > >
> > > Note that this patch depends on the following series:
> > > https://patchwork.ozlabs.org/project/linux-gpio/list/?series=247538
> > >
> > > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > > ---
> > >  drivers/gpio/gpio-tn48m.c | 56 ++++++++++++++++++++++++++++++++++++---
> > >  1 file changed, 52 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/gpio/gpio-tn48m.c b/drivers/gpio/gpio-tn48m.c
> > > index b12a6b4bc4b3..e429e7ade941 100644
> > > --- a/drivers/gpio/gpio-tn48m.c
> > > +++ b/drivers/gpio/gpio-tn48m.c
> > > @@ -19,6 +19,10 @@ enum tn48m_gpio_type {
> > >         TN48M_SFP_TX_DISABLE = 1,
> > >         TN48M_SFP_PRESENT,
> > >         TN48M_SFP_LOS,
> > > +       TN4810M_SFP_TX_DISABLE,
> > > +       TN4810M_SFP_TX_FAULT,
> > > +       TN4810M_SFP_PRESENT,
> > > +       TN4810M_SFP_LOS,
> > >  };
> > >
> > >  static int tn48m_gpio_probe(struct platform_device *pdev)
> > > @@ -46,17 +50,36 @@ static int tn48m_gpio_probe(struct platform_device *pdev)
> > >
> > >         config.regmap = regmap;
> > >         config.parent = &pdev->dev;
> > > -       config.ngpio = 4;
> > > +       config.ngpio_per_reg = 8;
> > >
> > >         switch (type) {
> > >         case TN48M_SFP_TX_DISABLE:
> > >                 config.reg_set_base = base;
> > > +               config.ngpio = 4;
> > >                 break;
> > >         case TN48M_SFP_PRESENT:
> > >                 config.reg_dat_base = base;
> > > +               config.ngpio = 4;
> > >                 break;
> > >         case TN48M_SFP_LOS:
> > >                 config.reg_dat_base = base;
> > > +               config.ngpio = 4;
> > > +               break;
> > > +       case TN4810M_SFP_TX_DISABLE:
> > > +               config.reg_set_base = base;
> > > +               config.ngpio = 48;
> > > +               break;
> > > +       case TN4810M_SFP_TX_FAULT:
> > > +               config.reg_dat_base = base;
> > > +               config.ngpio = 48;
> > > +               break;
> > > +       case TN4810M_SFP_PRESENT:
> > > +               config.reg_dat_base = base;
> > > +               config.ngpio = 48;
> > > +               break;
> > > +       case TN4810M_SFP_LOS:
> > > +               config.reg_dat_base = base;
> > > +               config.ngpio = 48;
> > >                 break;
> > >         default:
> > >                 dev_err(&pdev->dev, "unknown type %d\n", type);
> > > @@ -67,9 +90,34 @@ static int tn48m_gpio_probe(struct platform_device *pdev)
> > >  }
> > >
> > >  static const struct of_device_id tn48m_gpio_of_match[] = {
> > > -       { .compatible = "delta,tn48m-gpio-sfp-tx-disable", .data = (void *)TN48M_SFP_TX_DISABLE },
> > > -       { .compatible = "delta,tn48m-gpio-sfp-present", .data = (void *)TN48M_SFP_PRESENT },
> > > -       { .compatible = "delta,tn48m-gpio-sfp-los", .data = (void *)TN48M_SFP_LOS },
> > > +       {
> > > +               .compatible = "delta,tn48m-gpio-sfp-tx-disable",
> > > +               .data = (void *)TN48M_SFP_TX_DISABLE
> > > +       },
> > > +       {
> > > +               .compatible = "delta,tn48m-gpio-sfp-present",
> > > +               .data = (void *)TN48M_SFP_PRESENT
> > > +       },
> > > +       {
> > > +               .compatible = "delta,tn48m-gpio-sfp-los",
> > > +               .data = (void *)TN48M_SFP_LOS
> > > +       },
> > > +       {
> > > +               .compatible = "delta,tn4810m-gpio-sfp-tx-disable",
> > > +               .data = (void *)TN4810M_SFP_TX_DISABLE
> > > +       },
> > > +       {
> > > +               .compatible = "delta,tn4810m-gpio-sfp-tx-fault",
> > > +               .data = (void *)TN4810M_SFP_TX_FAULT
> > > +       },
> > > +       {
> > > +               .compatible = "delta,tn4810m-gpio-sfp-present",
> > > +               .data = (void *)TN4810M_SFP_PRESENT
> > > +       },
> > > +       {
> > > +               .compatible = "delta,tn4810m-gpio-sfp-los",
> > > +               .data = (void *)TN4810M_SFP_LOS
> > > +       },
> > >         { }
> > >  };
> > >  MODULE_DEVICE_TABLE(of, tn48m_gpio_of_match);
> > > --
> > > 2.31.1
> > >
> >
> > This looks good to me. I suppose the other patches are going in
> > through the MFD tree. I don't see anything that can fail here at
> > build-time - can you confirm that I can pick these patches up
> > separately for v5.15?
> >
> > Bartosz
>
> Scratch that, I now saw Linus' comment about the special purpose pins
> under the other series. Let's clear that up first.

Yeah,
I have finally replied to Linus,
hopefully, we can clear it up.

Thanks,
Robert
>
> Bart



-- 
Robert Marko
Staff Embedded Linux Engineer
Sartura Ltd.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
