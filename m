Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43C2222262D
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jul 2020 16:52:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727044AbgGPOuu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jul 2020 10:50:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:60048 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725867AbgGPOut (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Jul 2020 10:50:49 -0400
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 03249207E8;
        Thu, 16 Jul 2020 14:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594911049;
        bh=itGHyGwyGwIn7xJSRUls/AbSakgJhn2OwaaBcck1O6c=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=G7l9yOfvhASzW7KTX/pcIojotmVYw/hTYPUjhNQ6NVE3q4+RUq80J71iErNaWomRx
         UKRabYn+wQkeD6hGwS7n3zKm8iBDNZv9ZM1lecoR/cHasMZ/1EOOc/UW8+IgRaZV+1
         0Eszk+iwtIBh2IGxYFGTUpolLY1QQUSTR9P7Vv3k=
Received: by mail-ot1-f49.google.com with SMTP id t18so4398509otq.5;
        Thu, 16 Jul 2020 07:50:48 -0700 (PDT)
X-Gm-Message-State: AOAM531ODxVufh5sUmDqrMEzfA+rRRh5vipozx7USo68KjH4Zm9A8+ht
        fTc63P37VOK2XQom/CWUrmQTQ54n1LU8TX6Slg==
X-Google-Smtp-Source: ABdhPJws36HBdEOayihsWikp3aUAmz5CBRJxIoJ6p23yTSn++0oQthCPJmk2Ms7QbSPOx8DvD3x9znHWQOMdZ+OtoIU=
X-Received: by 2002:a05:6830:3104:: with SMTP id b4mr4845789ots.192.1594911048290;
 Thu, 16 Jul 2020 07:50:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1593112402.git.cristian.ciocaltea@gmail.com>
 <2a7610ff9f33cf72d9df6fc4598741fb6d7836e0.1593112402.git.cristian.ciocaltea@gmail.com>
 <20200715200309.GA722435@bogus> <20200716104316.GA309338@BV030612LT>
In-Reply-To: <20200716104316.GA309338@BV030612LT>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 16 Jul 2020 08:50:36 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+8bX5duv=116e=hve1L-h8a=5quqCHVtSAs4PjK6xc1w@mail.gmail.com>
Message-ID: <CAL_Jsq+8bX5duv=116e=hve1L-h8a=5quqCHVtSAs4PjK6xc1w@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: Add bindings for Actions S500 SoC
To:     Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
Cc:     =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-actions@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 16, 2020 at 4:43 AM Cristian Ciocaltea
<cristian.ciocaltea@gmail.com> wrote:
>
> On Wed, Jul 15, 2020 at 02:03:09PM -0600, Rob Herring wrote:
> > On Thu, Jun 25, 2020 at 11:16:18PM +0300, Cristian Ciocaltea wrote:
> > > Add pinctrl and gpio bindings for Actions Semi S500 SoC.
> > >
> > > Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
> > > ---
> > >  .../pinctrl/actions,s500-pinctrl.yaml         | 228 ++++++++++++++++++
> > >  1 file changed, 228 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/pinctrl/actions,s500-pinctrl.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/pinctrl/actions,s500-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/actions,s500-pinctrl.yaml
> > > new file mode 100644
> > > index 000000000000..856947c70844
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/pinctrl/actions,s500-pinctrl.yaml
> > > @@ -0,0 +1,228 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/pinctrl/actions,s500-pinctrl.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Actions Semi S500 SoC pinmux & GPIO controller
> > > +
> > > +maintainers:
> > > +  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > +
> > > +description: |
> > > +  Pinmux & GPIO controller manages pin multiplexing & configuration including
> > > +  GPIO function selection & GPIO attributes configuration. Please refer to
> > > +  pinctrl-bindings.txt in this directory for common binding part and usage.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: actions,s500-pinctrl
> > > +
> > > +  reg:
> > > +    minItems: 1
> > > +    maxItems: 4
> >
> > Need to enumerate what each register range is.
>
> Hi Rob,
>
> Thanks for the review!
>
> Would the update below suffice?
>
>   reg:
>     description: |
>       Specifies the memory region(s) associated with the pin-controller.
>       To improve granularity, up to four register ranges can be provided:

What does 'improve granularity' mean:

>       * GPIO Output + GPIO Input + GPIO Data
>       * Multiplexing Control
>       * PAD Pull Control + PAD Schmitt Trigger enable + PAD Control
>       * PAD Drive Capacity Select

The h/w sometimes has these and sometimes doesn't?

If they do stay, then you want:

items:
  - description: GPIO Output + GPIO Input + GPIO Data
  - description: ...

>
> > > +
> > > +  clocks:
> > > +    maxItems: 1
> > > +
> > > +  gpio-controller: true
> > > +
> > > +  gpio-ranges:
> > > +    maxItems: 1
> > > +
> > > +  '#gpio-cells':
> > > +    description:
> > > +      Specifies the pin number and flags, as defined in
> > > +      include/dt-bindings/gpio/gpio.h
> > > +    const: 2
> > > +
> > > +  interrupt-controller: true
> > > +
> > > +  '#interrupt-cells':
> > > +    description:
> > > +      Specifies the pin number and flags, as defined in
> > > +      include/dt-bindings/interrupt-controller/irq.h
> > > +    const: 2
> > > +
> > > +  interrupts:
> > > +    description:
> > > +      One interrupt per each of the 5 GPIO ports supported by the controller,
> > > +      sorted by port number ascending order.
> > > +    minItems: 5
> > > +    maxItems: 5
> > > +
> > > +patternProperties:
> > > +  '^.*$':
> > > +    if:
> > > +      type: object
> >
> > For a new binding, can you do '-pins$' for the node names so we don't
> > need this if/then hack.
>
> Right, the idea was to be consistent with the existing bindings for
> S700 and S900, which allow free node names, although they are not yet
> converted to yaml format.

If we want consistency, those should have their node names updated.

>
> > > +    then:
> > > +      patternProperties:
> > > +        'pinmux$':
> >
> > Is this really a pattern? Can't tell from the example.
>
> pinmux and pinconf subnodes may appear multiple times, that's why I
> decided to match their names based on the suffix.
>
> The example is not complex enough, I will change it to the following:
>
>     mmc0_default: mmc0_default {
>         pinmux {
>             groups = "sd0_d0_mfp", "sd0_d1_mfp", "sd0_d2_d3_mfp",
>                      "sd0_cmd_mfp", "sd0_clk_mfp";
>             function = "sd0";
>         };
>
>         drv_pinconf {

drv-pinconf

Make the pattern '-?pinconf' to enforce that. (that '-' may need escaping?)
