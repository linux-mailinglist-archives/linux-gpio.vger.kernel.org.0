Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10EF32F2839
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Jan 2021 07:11:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731296AbhALGLA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Jan 2021 01:11:00 -0500
Received: from mail-lf1-f51.google.com ([209.85.167.51]:43144 "EHLO
        mail-lf1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731262AbhALGLA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Jan 2021 01:11:00 -0500
Received: by mail-lf1-f51.google.com with SMTP id 23so1578544lfg.10;
        Mon, 11 Jan 2021 22:10:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:reply-to:to:cc
         :in-reply-to:references:mime-version:date:user-agent
         :content-transfer-encoding;
        bh=oRVO+BDWKpeCueQ+kzarXJUcBI/yOauyA0mzezFi66I=;
        b=kM3TDsoOH/egdTuJtSvE1q2GmFDoxbRgA7Juklwl/5spNN0woOvNjRH4Gy91hP/2E4
         5CIZCFfuMQfvYSnrS+9xGBeQPLvgdwRyu6xMikARBHftOlIwOdFhAOld3xUBLk6o9Eqo
         obZhk0QKLH5P88P9VdqL7prxAHy+qA5xlHjiU7g4D4QeIXwgJf4J3f+C7t8TfYI5DgVt
         sYgnSvSZDMHI892lefcsMmk4l6+eYc0ANmAppdLYcg1/aLKZYAAoOl1HXsOIDAnkWAok
         b7dScXwg2qJRngTp71e+mAuddmR5Y3YUutkrFJsV46hveZxGigcoZX4OzihezbWxvGjK
         LkqA==
X-Gm-Message-State: AOAM530iQXgb34yLl8LG7E2QpJx17HIqWciPl0N9liTQLqIf1tNcLzwf
        Ps80Gps33GsNppMv97baZ+I=
X-Google-Smtp-Source: ABdhPJzDhEVzVXXU/b+VKdX3lqsnfNFQEOnx3T+2A4v45B3y+lJ4XjfZoQ2sXonGchrBl8jduy9LNw==
X-Received: by 2002:a19:6c7:: with SMTP id 190mr1497073lfg.614.1610431818955;
        Mon, 11 Jan 2021 22:10:18 -0800 (PST)
Received: from localhost.localdomain (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id f26sm224806ljg.137.2021.01.11.22.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 22:10:18 -0800 (PST)
Message-ID: <c953405d630efba5377b89931ae4e0aa1abfa4dd.camel@fi.rohmeurope.com>
Subject: Re: [PATCH 06/15] dt_bindings: regulator: Add ROHM BD71815 PMIC
 regulators
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Reply-To: matti.vaittinen@fi.rohmeurope.com
To:     Rob Herring <robh@kernel.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-gpio@vger.kernel.org
In-Reply-To: <20210111190953.GB2890911@robh.at.kernel.org>
References: <cover.1610110144.git.matti.vaittinen@fi.rohmeurope.com>
         <3ca03c3b76d6898c46ee645ddb5fa25cbfc62367.1610110144.git.matti.vaittinen@fi.rohmeurope.com>
         <20210111190953.GB2890911@robh.at.kernel.org>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Date:   Tue, 12 Jan 2021 08:10:14 +0200
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On Mon, 2021-01-11 at 13:09 -0600, Rob Herring wrote:
> On Fri, Jan 08, 2021 at 03:36:38PM +0200, Matti Vaittinen wrote:
> > Add binding documentation for regulators on ROHM BD71815 PMIC.
> > 5 bucks, 7 LDOs and a boost for LED.
> > 
> > Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> > ---
> >  .../regulator/rohm,bd71815-regulator.yaml     | 104
> > ++++++++++++++++++
> >  1 file changed, 104 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/regulator/rohm,bd71815-
> > regulator.yaml
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/regulator/rohm,bd71815-
> > regulator.yaml
> > b/Documentation/devicetree/bindings/regulator/rohm,bd71815-
> > regulator.yaml
> > new file mode 100644
> > index 000000000000..2aa21603698c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/regulator/rohm,bd71815-
> > regulator.yaml
> > @@ -0,0 +1,104 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: 
> > http://devicetree.org/schemas/regulator/rohm,bd71815-regulator.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: ROHM BD71815 Power Management Integrated Circuit regulators
> > +
> > +maintainers:
> > +  - Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> > +
> > +description: |
> > +  This module is part of the ROHM BD718215 MFD device. For more
> > details
> > +  see Documentation/devicetree/bindings/mfd/rohm,bd71815-
> > pmic.yaml.
> > +
> > +  The regulator controller is represented as a sub-node of the
> > PMIC node
> > +  on the device tree.
> > +
> > +  The valid names for BD71815 regulator nodes are
> > +  buck1, buck2, buck3, buck4, buck5,
> > +  ldo1, ldo2, ldo3, ldo4, ldo5,
> > +  ldodvref, ldolpsr, wled
> 
> No schema for the last 3?

Thanks Rob. I'm unsure what I have been thinking of :( I'll fix this
for next version.

> 
> > +
> > +patternProperties:
> > +  "^(ldo|buck)[1-5]$":
> > +    type: object
> > +    description:
> > +      Properties for single LDO/BUCK regulator.
> > +    $ref: regulator.yaml#
> > +
> > +    properties:
> > +      regulator-name:
> > +        pattern: "^(ldo|buck)[1-5]$"
> > +        description:
> > +          should be "ldo1", ..., "ldo5" and "buck1", ..., "buck5"
> > +
> > +      rohm,vsel-gpios:
> > +        description:
> > +          GPIO used to control ldo4 state (when ldo4 is controlled
> > by GPIO).
> > +
> > +      rohm,dvs-run-voltage:
> 
> These should have a unit suffix.

I know but these are existing properties. I'd like to re-use them as
they have exported parser helpers - and I am unsure what kind of
breakages changing them would cause. (The BD71837/BD71847 which
introduced these properties are one of the PMICs which are pretty
widely used.)

Best Regards
	Matti Vaittinen


