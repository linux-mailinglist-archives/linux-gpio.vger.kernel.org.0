Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C27C0222DD8
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jul 2020 23:26:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbgGPV0h (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jul 2020 17:26:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725970AbgGPV0g (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2020 17:26:36 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43DB7C061755;
        Thu, 16 Jul 2020 14:26:36 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id n22so5278352ejy.3;
        Thu, 16 Jul 2020 14:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vAseUwcQJdDJQQra5TLeLm+SJbx5n23UWFenIaII7YI=;
        b=RzNAZoejioCvLIzByvtQGVtgUKb7+UXluj3R4ebR91VeNxXDXqhn/1nQu7qixemUju
         lvd1pm3mo9dtStJ4jO1jA2sQD+J+y0XTqn0t7HjG/qPGj2is9EUTVvKNkixDUF105Ab5
         SQINgUAcT3LjEbzb3g3qu4aAzpwfg+6AHBLhWTFZZhLIw1MG02TBNfGXudsDH9sioMwQ
         hwQtaJoXjnFlddCrOEfOhW732LZQaZSs0Ze+lpLPhhObICHV5LgRJAOlE93qjqiJwmUE
         QOrPzoZUiJee7xMoTbubCeTtzHCddwETMiGdL34b/4/JFdaUa4E76Lp3tnbBerKHKsin
         op2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vAseUwcQJdDJQQra5TLeLm+SJbx5n23UWFenIaII7YI=;
        b=fhjbeqYS/oEfvzNCqL4E5CRF+3V/73tf4+F/941N2qFk/jnp0q1JIMuc+vcQXmhIN1
         dI54b5iTxs8YcO0sWD22DD5RNJwy1O80GN/qgDWI8bXWhq5OqK/STl5OiAO77KATjWrP
         UxcGQd5vwa6pE7axwgHQ8gz6NbjIneZllP0vRsoG/V3BunDnBu3J+Iy59lHsizj/O/o1
         4SIqYHE+/NUuuR5bedNVmwb0YzdBPq5I/AFVfkTKyEAzqj2KoLB22BT6WtNIetRh8wsV
         SeneGoLy/mD+NZMD4r6oMrt2MTPXRQt8OGEn49Dl8Tg1iLiif8L0FY0/dTDNuTR9jSuc
         ktqA==
X-Gm-Message-State: AOAM532CIDkT3P6LsDfmvzp82IdkDiVsa1CVQDzxtmXKHUj0hPrKZyuN
        dTlU7znYQ4DGchD6n/QH9Hg=
X-Google-Smtp-Source: ABdhPJy07RGdNa3FOJhhw3BUf5RTKV1JBhUIdwZloMswtbvXh0JJPkU0i4+HLCgqbVLI3plPHTGP+w==
X-Received: by 2002:a17:906:434c:: with SMTP id z12mr5444703ejm.33.1594934794860;
        Thu, 16 Jul 2020 14:26:34 -0700 (PDT)
Received: from BV030612LT ([188.24.137.55])
        by smtp.gmail.com with ESMTPSA id o15sm6249168edv.55.2020.07.16.14.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 14:26:33 -0700 (PDT)
Date:   Fri, 17 Jul 2020 00:26:31 +0300
From:   Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-actions@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: Add bindings for Actions S500
 SoC
Message-ID: <20200716212631.GA348917@BV030612LT>
References: <cover.1593112402.git.cristian.ciocaltea@gmail.com>
 <2a7610ff9f33cf72d9df6fc4598741fb6d7836e0.1593112402.git.cristian.ciocaltea@gmail.com>
 <20200715200309.GA722435@bogus>
 <20200716104316.GA309338@BV030612LT>
 <CAL_Jsq+8bX5duv=116e=hve1L-h8a=5quqCHVtSAs4PjK6xc1w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+8bX5duv=116e=hve1L-h8a=5quqCHVtSAs4PjK6xc1w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 16, 2020 at 08:50:36AM -0600, Rob Herring wrote:
> On Thu, Jul 16, 2020 at 4:43 AM Cristian Ciocaltea
> <cristian.ciocaltea@gmail.com> wrote:
> >
> > On Wed, Jul 15, 2020 at 02:03:09PM -0600, Rob Herring wrote:
> > > On Thu, Jun 25, 2020 at 11:16:18PM +0300, Cristian Ciocaltea wrote:
> > > > Add pinctrl and gpio bindings for Actions Semi S500 SoC.
> > > >
> > > > Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
> > > > ---
> > > >  .../pinctrl/actions,s500-pinctrl.yaml         | 228 ++++++++++++++++++
> > > >  1 file changed, 228 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/pinctrl/actions,s500-pinctrl.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/pinctrl/actions,s500-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/actions,s500-pinctrl.yaml
> > > > new file mode 100644
> > > > index 000000000000..856947c70844
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/pinctrl/actions,s500-pinctrl.yaml
> > > > @@ -0,0 +1,228 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/pinctrl/actions,s500-pinctrl.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Actions Semi S500 SoC pinmux & GPIO controller
> > > > +
> > > > +maintainers:
> > > > +  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > +
> > > > +description: |
> > > > +  Pinmux & GPIO controller manages pin multiplexing & configuration including
> > > > +  GPIO function selection & GPIO attributes configuration. Please refer to
> > > > +  pinctrl-bindings.txt in this directory for common binding part and usage.
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    const: actions,s500-pinctrl
> > > > +
> > > > +  reg:
> > > > +    minItems: 1
> > > > +    maxItems: 4
> > >
> > > Need to enumerate what each register range is.
> >
> > Hi Rob,
> >
> > Thanks for the review!
> >
> > Would the update below suffice?
> >
> >   reg:
> >     description: |
> >       Specifies the memory region(s) associated with the pin-controller.
> >       To improve granularity, up to four register ranges can be provided:
> 
> What does 'improve granularity' mean:

Technically all the registers used by the driver could be specified via
a single contiguous range. However, there are a few unrelated registers
(i.e. PWM Output Control) which should be excluded in order to come up
with a more accurate specification. The 4 ranges below are basically
the result of this exclusion:

> >       * GPIO Output + GPIO Input + GPIO Data
> >       * Multiplexing Control
> >       * PAD Pull Control + PAD Schmitt Trigger enable + PAD Control
> >       * PAD Drive Capacity Select
> 
> The h/w sometimes has these and sometimes doesn't?

No, the h/w is fixed, the only reason of this approach was to allow a
precise memory region specification, as explained above.

I'm not sure if this should be made mandatory or it's also fine to let
(a lazy) user provide combined ranges or just a contiguous one (like
in the example), with the drawback of loosing the accuracy, of course.

> If they do stay, then you want:
> 
> items:
>   - description: GPIO Output + GPIO Input + GPIO Data
>   - description: ...

Would this be applicable even if we keep this flexible approach and
don't set 'minItems: 4'?

> >
> > > > +
> > > > +  clocks:
> > > > +    maxItems: 1
> > > > +
> > > > +  gpio-controller: true
> > > > +
> > > > +  gpio-ranges:
> > > > +    maxItems: 1
> > > > +
> > > > +  '#gpio-cells':
> > > > +    description:
> > > > +      Specifies the pin number and flags, as defined in
> > > > +      include/dt-bindings/gpio/gpio.h
> > > > +    const: 2
> > > > +
> > > > +  interrupt-controller: true
> > > > +
> > > > +  '#interrupt-cells':
> > > > +    description:
> > > > +      Specifies the pin number and flags, as defined in
> > > > +      include/dt-bindings/interrupt-controller/irq.h
> > > > +    const: 2
> > > > +
> > > > +  interrupts:
> > > > +    description:
> > > > +      One interrupt per each of the 5 GPIO ports supported by the controller,
> > > > +      sorted by port number ascending order.
> > > > +    minItems: 5
> > > > +    maxItems: 5
> > > > +
> > > > +patternProperties:
> > > > +  '^.*$':
> > > > +    if:
> > > > +      type: object
> > >
> > > For a new binding, can you do '-pins$' for the node names so we don't
> > > need this if/then hack.
> >
> > Right, the idea was to be consistent with the existing bindings for
> > S700 and S900, which allow free node names, although they are not yet
> > converted to yaml format.
> 
> If we want consistency, those should have their node names updated.

Fair enough, I have already updated the node names to use the '-pins'
suffix.

> >
> > > > +    then:
> > > > +      patternProperties:
> > > > +        'pinmux$':
> > >
> > > Is this really a pattern? Can't tell from the example.
> >
> > pinmux and pinconf subnodes may appear multiple times, that's why I
> > decided to match their names based on the suffix.
> >
> > The example is not complex enough, I will change it to the following:
> >
> >     mmc0_default: mmc0_default {
> >         pinmux {
> >             groups = "sd0_d0_mfp", "sd0_d1_mfp", "sd0_d2_d3_mfp",
> >                      "sd0_cmd_mfp", "sd0_clk_mfp";
> >             function = "sd0";
> >         };
> >
> >         drv_pinconf {
> 
> drv-pinconf
> 
> Make the pattern '-?pinconf' to enforce that. (that '-' may need escaping?)

Actually the pattern should be '^(.*-)?pinconf$', to restrict the names
to either 'pinconf' or '<label>-pinconf'.

I have just made some more validation tests and noticed I had missed an
'additionalProperties: false' line, for the 'pins' node. Should be fine
now!

Thanks,
Cristi

