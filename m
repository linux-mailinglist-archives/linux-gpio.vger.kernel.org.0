Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8AFA2F4F26
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Jan 2021 16:50:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726929AbhAMPsy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Jan 2021 10:48:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:37098 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726612AbhAMPsy (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 13 Jan 2021 10:48:54 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5422823406;
        Wed, 13 Jan 2021 15:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610552893;
        bh=vl/j9fY04Q4QKepnlpWcEBboiOHtYd5YlcbSUw/UEiw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=bG7zO7Kh5L+sFUiW/N1k3sqkVj2KQI6mrcwtvVmoV/3e9VmkRZ3M9HFNrxCijvu2V
         pSv0ZCjR8hnC9LYXKv1DjwW5kxmKz91q+tNMi2+KnpPaHdvqx8qhkI4LdG8Php0ai2
         gKA2AcaLeAvbV6TkDRvkMesJaNUY1sPbc86YX0ljutBurBMVLIQJKGW35mFdUbp/WR
         P8zJSVcFRKRbmi30daabu7F/LFOBe3Suz+Nwp6X+P8kRF1XJBlyfxOraqVAH/N6YuN
         N/EIr3qfB2bAdaMTaLlIi5LOWk2UV195bWLsJtN5+uf3rKg9X9i/D+7ASzyMcdfJeg
         JACkTO1fV2s2Q==
Received: by mail-ej1-f48.google.com with SMTP id n26so3727513eju.6;
        Wed, 13 Jan 2021 07:48:13 -0800 (PST)
X-Gm-Message-State: AOAM5331Vul+C4JnHIfma8Uhy187Zul5AdsnHDmm7BYQWxe8ev0nRCBl
        Em+a7wkUMcgQ8+Iz9pwWT8WgK78IEtz8sRakcg==
X-Google-Smtp-Source: ABdhPJzZZzBuNWt4zBP6oYChCdDAG8dOO3P0AP/b5Es8D36Y7ObsNG06lrcvG5s0YbH/HHYPqG29t3s3Un8yiIKd8P0=
X-Received: by 2002:a17:906:dfdb:: with SMTP id jt27mr775014ejc.360.1610552891782;
 Wed, 13 Jan 2021 07:48:11 -0800 (PST)
MIME-Version: 1.0
References: <cover.1610110144.git.matti.vaittinen@fi.rohmeurope.com>
 <3ca03c3b76d6898c46ee645ddb5fa25cbfc62367.1610110144.git.matti.vaittinen@fi.rohmeurope.com>
 <20210111190953.GB2890911@robh.at.kernel.org> <c953405d630efba5377b89931ae4e0aa1abfa4dd.camel@fi.rohmeurope.com>
 <20210113135345.GA2332349@robh.at.kernel.org> <55d19aaa27522c06c1a34f2a6422b82d069117c8.camel@fi.rohmeurope.com>
In-Reply-To: <55d19aaa27522c06c1a34f2a6422b82d069117c8.camel@fi.rohmeurope.com>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 13 Jan 2021 09:47:59 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJH4C31db4Q_D_pme1=YSK6nJCxucVc4MnrU9tvBirNYg@mail.gmail.com>
Message-ID: <CAL_JsqJH4C31db4Q_D_pme1=YSK6nJCxucVc4MnrU9tvBirNYg@mail.gmail.com>
Subject: Re: [PATCH 06/15] dt_bindings: regulator: Add ROHM BD71815 PMIC regulators
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     "broonie@kernel.org" <broonie@kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 13, 2021 at 8:23 AM Vaittinen, Matti
<Matti.Vaittinen@fi.rohmeurope.com> wrote:
>
>
> On Wed, 2021-01-13 at 07:53 -0600, Rob Herring wrote:
> > On Tue, Jan 12, 2021 at 08:10:14AM +0200, Matti Vaittinen wrote:
> > > On Mon, 2021-01-11 at 13:09 -0600, Rob Herring wrote:
> > > > On Fri, Jan 08, 2021 at 03:36:38PM +0200, Matti Vaittinen wrote:
> > > > > Add binding documentation for regulators on ROHM BD71815 PMIC.
> > > > > 5 bucks, 7 LDOs and a boost for LED.
> > > > >
> > > > > Signed-off-by: Matti Vaittinen <
> > > > > matti.vaittinen@fi.rohmeurope.com>
> > > > > ---
> > > > >  .../regulator/rohm,bd71815-regulator.yaml     | 104
> > > > > ++++++++++++++++++
> > > > >  1 file changed, 104 insertions(+)
> > > > >  create mode 100644
> > > > > Documentation/devicetree/bindings/regulator/rohm,bd71815-
> > > > > regulator.yaml
> > > > >
> > > > > diff --git
> > > > > a/Documentation/devicetree/bindings/regulator/rohm,bd71815-
> > > > > regulator.yaml
> > > > > b/Documentation/devicetree/bindings/regulator/rohm,bd71815-
> > > > > regulator.yaml
> > > > > new file mode 100644
> > > > > index 000000000000..2aa21603698c
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/regulator/rohm,bd71815-
> > > > > regulator.yaml
> > > > > @@ -0,0 +1,104 @@
> > > > > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id:
> > > > > http://devicetree.org/schemas/regulator/rohm,bd71815-regulator.yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: ROHM BD71815 Power Management Integrated Circuit
> > > > > regulators
> > > > > +
> > > > > +maintainers:
> > > > > +  - Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> > > > > +
> > > > > +description: |
> > > > > +  This module is part of the ROHM BD718215 MFD device. For
> > > > > more
> > > > > details
> > > > > +  see Documentation/devicetree/bindings/mfd/rohm,bd71815-
> > > > > pmic.yaml.
> > > > > +
> > > > > +  The regulator controller is represented as a sub-node of the
> > > > > PMIC node
> > > > > +  on the device tree.
> > > > > +
> > > > > +  The valid names for BD71815 regulator nodes are
> > > > > +  buck1, buck2, buck3, buck4, buck5,
> > > > > +  ldo1, ldo2, ldo3, ldo4, ldo5,
> > > > > +  ldodvref, ldolpsr, wled
> > > >
> > > > No schema for the last 3?
> > >
> > > Thanks Rob. I'm unsure what I have been thinking of :( I'll fix
> > > this
> > > for next version.
> > >
> > > > > +
> > > > > +patternProperties:
> > > > > +  "^(ldo|buck)[1-5]$":
> > > > > +    type: object
> > > > > +    description:
> > > > > +      Properties for single LDO/BUCK regulator.
> > > > > +    $ref: regulator.yaml#
> > > > > +
> > > > > +    properties:
> > > > > +      regulator-name:
> > > > > +        pattern: "^(ldo|buck)[1-5]$"
> > > > > +        description:
> > > > > +          should be "ldo1", ..., "ldo5" and "buck1", ...,
> > > > > "buck5"
> > > > > +
> > > > > +      rohm,vsel-gpios:
> > > > > +        description:
> > > > > +          GPIO used to control ldo4 state (when ldo4 is
> > > > > controlled
> > > > > by GPIO).
> > > > > +
> > > > > +      rohm,dvs-run-voltage:
> > > >
> > > > These should have a unit suffix.
> > >
> > > I know but these are existing properties. I'd like to re-use them
> > > as
> > > they have exported parser helpers - and I am unsure what kind of
> > > breakages changing them would cause. (The BD71837/BD71847 which
> > > introduced these properties are one of the PMICs which are pretty
> > > widely used.)
> >
> > Okay. Hopefully I remember next time I see this...
>
> Actually, I think I can add support for rohm,dvs-run-microvolt and
> fellows to these same helpers so new devices can use appropriately
> named properties. That would mean there is duplicate properties for
> same purpose - but maybe it allows us to eventually deprecate the old
> ones... Which of these options would you prefer?

Just keep the existing ones.

Rob
