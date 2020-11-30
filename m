Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BEC12C8CA2
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Nov 2020 19:23:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387810AbgK3SXL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Nov 2020 13:23:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:60822 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728560AbgK3SXK (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 30 Nov 2020 13:23:10 -0500
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 349A420825;
        Mon, 30 Nov 2020 18:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606760549;
        bh=E0BB209av1T4xjJt8kpahDP7HWO4xmG/752fcnwHuQ8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=QcuAlpFbiwESgR2Fj27yHh+PTsUf5dtG3KT7rwm4bti7dGE6dMIppQvCiMo6pdXkj
         ZWppZdcvgaEyZ3lXhXw75wORyK2bnKybK9ZsbFgAnZifNia04u2D6i1pCnnGkXNKK5
         iDasGt+5drd0sVOrGgK/fE5l2tTzPyEu/HaXVwqc=
Received: by mail-ej1-f47.google.com with SMTP id m19so806185ejj.11;
        Mon, 30 Nov 2020 10:22:29 -0800 (PST)
X-Gm-Message-State: AOAM530zzoVn+ZgWtitL9fAkF7r29DToBeqh35E7q5eSH1aXjAJHT+cP
        nyp7S+k/M+6asJ7xZ/7ccMDic+scVTzVNGsaow==
X-Google-Smtp-Source: ABdhPJyFXzK9r0+Iq/RD0xk5Sv0ZjyHxf2HQDuB9wTBjW13VgvYZTDrt6EdHznDLJXLUx5QV3ZAnjwzk/CmJafmC3rg=
X-Received: by 2002:a17:906:c20f:: with SMTP id d15mr22155794ejz.341.1606760547636;
 Mon, 30 Nov 2020 10:22:27 -0800 (PST)
MIME-Version: 1.0
References: <20201119060921.311747-1-damien.lemoal@wdc.com>
 <20201119060921.311747-2-damien.lemoal@wdc.com> <20201125210629.27al2cjp5jjuj354@mobilestation>
In-Reply-To: <20201125210629.27al2cjp5jjuj354@mobilestation>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 30 Nov 2020 11:22:15 -0700
X-Gmail-Original-Message-ID: <CAL_JsqK3VDb4Jv2H+0Rh7V3ZA+PmKt=+fbn+_a4eHHh8zQmQ9Q@mail.gmail.com>
Message-ID: <CAL_JsqK3VDb4Jv2H+0Rh7V3ZA+PmKt=+fbn+_a4eHHh8zQmQ9Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] of: Fix property supplier parsing
To:     Serge Semin <fancer.lancer@gmail.com>
Cc:     Damien Le Moal <damien.lemoal@wdc.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 25, 2020 at 2:06 PM Serge Semin <fancer.lancer@gmail.com> wrote:
>
> On Thu, Nov 19, 2020 at 03:09:20PM +0900, Damien Le Moal wrote:
> > The DesignWare gpio-dwapb GPIO driver ("snps,dw-apb-gpio" or
> > "apm,xgene-gpio-v2" compatible string) defines the now deprecated
> > property "snps,nr-gpios" to specify the number of GPIOs available
> > on a port. However, if this property is used in a device tree, its
> > "-gpios" suffix causes the generic property supplier parsing code to
> > interpret it as a cell reference when properties are parsed in
> > of_link_to_suppliers(), leading to an error messages such as:
> >
> > OF: /soc/bus@50200000/gpio-controller@50200000/gpio-port@0: could not
> > find phandle
> >
> > Fix this by manually defining a parse_gpios() function which ignores
> > this deprecated property that is still present in many device trees,
> > skipping the search for the supplier and thus avoiding the device tree
> > parsing error.
> >
> > Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> > ---
> >  drivers/of/property.c | 16 +++++++++++++++-
> >  1 file changed, 15 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/of/property.c b/drivers/of/property.c
> > index 408a7b5f06a9..4eefe8efc2fe 100644
> > --- a/drivers/of/property.c
> > +++ b/drivers/of/property.c
> > @@ -1308,7 +1308,6 @@ DEFINE_SIMPLE_PROP(pinctrl7, "pinctrl-7", NULL)
> >  DEFINE_SIMPLE_PROP(pinctrl8, "pinctrl-8", NULL)
> >  DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
> >  DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")
> > -DEFINE_SUFFIX_PROP(gpios, "-gpios", "#gpio-cells")
> >
> >  static struct device_node *parse_iommu_maps(struct device_node *np,
> >                                           const char *prop_name, int index)
> > @@ -1319,6 +1318,21 @@ static struct device_node *parse_iommu_maps(struct device_node *np,
> >       return of_parse_phandle(np, prop_name, (index * 4) + 1);
> >  }
> >
> > +static struct device_node *parse_gpios(struct device_node *np,
> > +                                    const char *prop_name, int index)
> > +{
> > +     /*
> > +      * Quirk for the deprecated "snps,nr-gpios" property of the
> > +      * DesignWare gpio-dwapb GPIO driver: as this property parsing
> > +      * conflicts with the "xx-gpios" phandle reference property, ignore it.
> > +      */
>
> > +     if (strcmp(prop_name, "snps,nr-gpios") == 0)
> > +             return NULL;
>
> What about printing the warning from instead of doing that from the driver?
> Like this:
>
> +       if (strcmp(prop_name, "snps,nr-gpios") == 0) {
> +               pr_warn("%pOF: %s is deprecated in favor of ngpios\n");
> +               return NULL;
> +       }
>
> So when the property is removed from all dts'es we wouldn't
> forget to discard the quirk?

Why do we need this change at all? We've already got a message printed
and devlink is still default off. If someone cares about devlink and
the error message, then they should fix their dts file.

Now if there's a stable/mature platform using "snps,nr-gpios" and we
enable devlink by default (which needs to happen at some point), then
I'd feel differently and we'll need to handle this. But until then, I
don't want to carry this quirk.

Rob
