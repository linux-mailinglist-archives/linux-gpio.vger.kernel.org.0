Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFA462F4C8E
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Jan 2021 14:55:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726693AbhAMNy3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Jan 2021 08:54:29 -0500
Received: from mail-oi1-f173.google.com ([209.85.167.173]:37889 "EHLO
        mail-oi1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725773AbhAMNy3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Jan 2021 08:54:29 -0500
Received: by mail-oi1-f173.google.com with SMTP id x13so2157749oic.5;
        Wed, 13 Jan 2021 05:54:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SLDxHEIiMv0Ul6jSa6uW97zErWgxJixLM8YFfIBWWlo=;
        b=Ajnxd1EldyRbliZqkNNTrAWtfUu4HIEuiBmLjWz4yzzfd4aUAl1FYRjbFC/OwTIKcZ
         9WTOYlrgGBUcu3uTSLAQqhB7gqB4grqb9AhPJmTG0FepYcuys2FhvRpa61xm668bj8M8
         hCd2MnSqfRyRGtITslP5mcYpeC7bbsxeTPk2AUJbhclP0oCftsnbUZeHmpNQrR7JrFtr
         J2FxEtbYxWhnKowR9aAFpoRZzevQWyv4rZb+YhRC5z2VmqMqBRK5rvckd+UyqxA1GlqT
         5mC6JoiZ5qKkZ4ADDr8R+HqzQsFUoutYo/kBOWU2TIFCtgDdZ+izN9nUJA36SyvoLRQn
         KUdQ==
X-Gm-Message-State: AOAM532E+E3pVurwz7tPFMKZrEbuWldVcE8ci1wkJE7llqcc5Ou436nY
        qUWdcTPN6BdK9d5pd9lvSA==
X-Google-Smtp-Source: ABdhPJwc6tdpSHMMbUnABB9JL9v+E/xQr1hRrNetLbA+I3WmIE3wytA3OCDR6UlO4Rh6XgZXPuPYhw==
X-Received: by 2002:aca:5643:: with SMTP id k64mr1264775oib.146.1610546028027;
        Wed, 13 Jan 2021 05:53:48 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r133sm398750oia.17.2021.01.13.05.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jan 2021 05:53:46 -0800 (PST)
Received: (nullmailer pid 2334321 invoked by uid 1000);
        Wed, 13 Jan 2021 13:53:45 -0000
Date:   Wed, 13 Jan 2021 07:53:45 -0600
From:   Rob Herring <robh@kernel.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 06/15] dt_bindings: regulator: Add ROHM BD71815 PMIC
 regulators
Message-ID: <20210113135345.GA2332349@robh.at.kernel.org>
References: <cover.1610110144.git.matti.vaittinen@fi.rohmeurope.com>
 <3ca03c3b76d6898c46ee645ddb5fa25cbfc62367.1610110144.git.matti.vaittinen@fi.rohmeurope.com>
 <20210111190953.GB2890911@robh.at.kernel.org>
 <c953405d630efba5377b89931ae4e0aa1abfa4dd.camel@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c953405d630efba5377b89931ae4e0aa1abfa4dd.camel@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 12, 2021 at 08:10:14AM +0200, Matti Vaittinen wrote:
> 
> On Mon, 2021-01-11 at 13:09 -0600, Rob Herring wrote:
> > On Fri, Jan 08, 2021 at 03:36:38PM +0200, Matti Vaittinen wrote:
> > > Add binding documentation for regulators on ROHM BD71815 PMIC.
> > > 5 bucks, 7 LDOs and a boost for LED.
> > > 
> > > Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> > > ---
> > >  .../regulator/rohm,bd71815-regulator.yaml     | 104
> > > ++++++++++++++++++
> > >  1 file changed, 104 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/regulator/rohm,bd71815-
> > > regulator.yaml
> > > 
> > > diff --git
> > > a/Documentation/devicetree/bindings/regulator/rohm,bd71815-
> > > regulator.yaml
> > > b/Documentation/devicetree/bindings/regulator/rohm,bd71815-
> > > regulator.yaml
> > > new file mode 100644
> > > index 000000000000..2aa21603698c
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/regulator/rohm,bd71815-
> > > regulator.yaml
> > > @@ -0,0 +1,104 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > > +%YAML 1.2
> > > +---
> > > +$id: 
> > > http://devicetree.org/schemas/regulator/rohm,bd71815-regulator.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: ROHM BD71815 Power Management Integrated Circuit regulators
> > > +
> > > +maintainers:
> > > +  - Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> > > +
> > > +description: |
> > > +  This module is part of the ROHM BD718215 MFD device. For more
> > > details
> > > +  see Documentation/devicetree/bindings/mfd/rohm,bd71815-
> > > pmic.yaml.
> > > +
> > > +  The regulator controller is represented as a sub-node of the
> > > PMIC node
> > > +  on the device tree.
> > > +
> > > +  The valid names for BD71815 regulator nodes are
> > > +  buck1, buck2, buck3, buck4, buck5,
> > > +  ldo1, ldo2, ldo3, ldo4, ldo5,
> > > +  ldodvref, ldolpsr, wled
> > 
> > No schema for the last 3?
> 
> Thanks Rob. I'm unsure what I have been thinking of :( I'll fix this
> for next version.
> 
> > 
> > > +
> > > +patternProperties:
> > > +  "^(ldo|buck)[1-5]$":
> > > +    type: object
> > > +    description:
> > > +      Properties for single LDO/BUCK regulator.
> > > +    $ref: regulator.yaml#
> > > +
> > > +    properties:
> > > +      regulator-name:
> > > +        pattern: "^(ldo|buck)[1-5]$"
> > > +        description:
> > > +          should be "ldo1", ..., "ldo5" and "buck1", ..., "buck5"
> > > +
> > > +      rohm,vsel-gpios:
> > > +        description:
> > > +          GPIO used to control ldo4 state (when ldo4 is controlled
> > > by GPIO).
> > > +
> > > +      rohm,dvs-run-voltage:
> > 
> > These should have a unit suffix.
> 
> I know but these are existing properties. I'd like to re-use them as
> they have exported parser helpers - and I am unsure what kind of
> breakages changing them would cause. (The BD71837/BD71847 which
> introduced these properties are one of the PMICs which are pretty
> widely used.)

Okay. Hopefully I remember next time I see this...

Rob
