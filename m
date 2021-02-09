Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10B06315112
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Feb 2021 14:59:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231923AbhBIN6x (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Feb 2021 08:58:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:49668 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231825AbhBIN5t (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 9 Feb 2021 08:57:49 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 553E264EEE;
        Tue,  9 Feb 2021 13:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612879027;
        bh=NYBRJpVERhcrNPXZUFCqG9eeCVvRA7N1yQGIY6Hsm10=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=CoXx6r9G7v1kTpRmFlkNMSqNy+qXE4rqUTUJXwzKNgMKfKLQBk1c3FSaxpWFUWJYU
         LFN/NC/hFLZ9pz3bD1N+/B2nx/OBd9bT/HCZgs9kM+TJFSvXh3Cp8YOWDSZ2zGIazr
         EtIpfsV2vYLTOadp6htqPxzTh4onfXz/D8QO/XaDcMJHGJ6JfeMD/LECfIlpbzx8wl
         1+Mez/sJWPs+tfzxdq7xHajxiJS2LNVgip/pLWCYVHaiQpqC6iYbf7DKp+QuTd5g43
         IqWtLCXqfRIMh4IhvS5j87Z0dHhTJK0BhRR/xWT7/w5f24vjwaqja4MAo0JWFw6iSS
         FRvAFjVSn8eBQ==
Received: by mail-qk1-f174.google.com with SMTP id s77so17951112qke.4;
        Tue, 09 Feb 2021 05:57:07 -0800 (PST)
X-Gm-Message-State: AOAM531ucW8CNYIWFN/UcopqicS0txCVbwPJLHS668DvPS7QIL7q5Y4L
        1xFZtZcztK9FliY7+7PP8OtINgYTXqd0s/3kvA==
X-Google-Smtp-Source: ABdhPJwcdrYR55bl0azRvAzl06gG/0oJAP1Gh4LIiC0dRNTMkptuigKWwu/4kdUDrdmpeoNg1Zq7xfIeiJ+yd35FIK4=
X-Received: by 2002:ae9:f20b:: with SMTP id m11mr22290060qkg.464.1612879026441;
 Tue, 09 Feb 2021 05:57:06 -0800 (PST)
MIME-Version: 1.0
References: <1611034054-63867-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <1611034054-63867-3-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <20210209022041.GA2527041@robh.at.kernel.org> <CY4PR02MB327015F3EF5FD8C265EE20E2BD8E9@CY4PR02MB3270.namprd02.prod.outlook.com>
In-Reply-To: <CY4PR02MB327015F3EF5FD8C265EE20E2BD8E9@CY4PR02MB3270.namprd02.prod.outlook.com>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 9 Feb 2021 07:56:55 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ31VkmK526BDZy+dg_O1L1A=2EH9Lq7CqhSUE0FPi2OA@mail.gmail.com>
Message-ID: <CAL_JsqJ31VkmK526BDZy+dg_O1L1A=2EH9Lq7CqhSUE0FPi2OA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: pinctrl: Added binding for ZynqMP
 pinctrl driver
To:     Sai Krishna Potthuri <lakshmis@xilinx.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Michal Simek <michals@xilinx.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        git <git@xilinx.com>,
        "saikrishna12468@gmail.com" <saikrishna12468@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Feb 9, 2021 at 2:17 AM Sai Krishna Potthuri <lakshmis@xilinx.com> wrote:
>
> Hi Rob,
>
> Thanks for the review.
>
> > -----Original Message-----
> > From: Rob Herring <robh@kernel.org>
> > Sent: Tuesday, February 9, 2021 7:51 AM
> > To: Sai Krishna Potthuri <lakshmis@xilinx.com>
> > Cc: Linus Walleij <linus.walleij@linaro.org>; Michal Simek
> > <michals@xilinx.com>; Greg Kroah-Hartman <gregkh@linuxfoundation.org>;
> > linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
> > devicetree@vger.kernel.org; linux-gpio@vger.kernel.org; git
> > <git@xilinx.com>; saikrishna12468@gmail.com
> > Subject: Re: [PATCH v2 2/3] dt-bindings: pinctrl: Added binding for ZynqMP
> > pinctrl driver
> >
> > On Tue, Jan 19, 2021 at 10:57:33AM +0530, Sai Krishna Potthuri wrote:
> > > Added documentation and dt-bindings file which contains MIO pin
> > > configuration defines for Xilinx ZynqMP pinctrl driver.
> > >
> > > Signed-off-by: Sai Krishna Potthuri
> > > <lakshmi.sai.krishna.potthuri@xilinx.com>
> > > ---
> > >  .../bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml | 337
> > > ++++++++++++++++++  include/dt-bindings/pinctrl/pinctrl-zynqmp.h  |
> > > 23 ++
> > >  2 files changed, 360 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
> > >  create mode 100644 include/dt-bindings/pinctrl/pinctrl-zynqmp.h
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
> > > b/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
> > > new file mode 100644
> > > index 000000000000..9f2efbafcaa4
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.ya
> > > +++ ml
> > > @@ -0,0 +1,337 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause %YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/pinctrl/xlnx,zynqmp-pinctrl.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Xilinx ZynqMP Pinctrl
> > > +
> > > +maintainers:
> > > +  - Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
> > > +  - Rajan Vaja <rajan.vaja@xilinx.com>
> > > +
> > > +description: |
> > > +  Please refer to pinctrl-bindings.txt in this directory for details
> > > +of the
> > > +  common pinctrl bindings used by client devices, including the
> > > +meaning of the
> > > +  phrase "pin configuration node".
> > > +
> > > +  ZynqMP's pin configuration nodes act as a container for an
> > > + arbitrary number of  subnodes. Each of these subnodes represents
> > > + some desired configuration for a  pin, a group, or a list of pins or
> > > + groups. This configuration can include the  mux function to select
> > > + on those pin(s)/group(s), and various pin configuration  parameters, such
> > as pull-up, slew rate, etc.
> > > +
> > > +  Each configuration node can consist of multiple nodes describing
> > > + the pinmux and  pinconf options. Those nodes can be pinmux nodes or
> > pinconf nodes.
> > > +
> > > +  The name of each subnode is not important; all subnodes should be
> > > + enumerated  and processed purely based on their content.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: xlnx,zynqmp-pinctrl
> > > +
> > > +patternProperties:
> > > +  '^(.*-)?(default|gpio)$':
> > > +    type: object
> > > +    patternProperties:
> > > +      '^mux(.*)$':
> >
> > '^mux' is equivalent.
> I will fix in v3.
>
> >
> > > +        type: object
> > > +        description:
> > > +          Pinctrl node's client devices use subnodes for pin muxes,
> > > +          which in turn use below standard properties.
> > > +        $ref: pinmux-node.yaml#
> > > +
> > > +        properties:
> > > +          groups:
> > > +            description:
> > > +              List of groups to select (either this or "pins" must be
> > > +              specified), available groups for this subnode.
> > > +            items:
> > > +              oneOf:
> > > +                - enum: [ethernet0_0_grp, ethernet1_0_grp,
> > > + ethernet2_0_grp,
> >
> > Don't need 'oneOf' for a single item.
> Here we have a possibility to have more than one group item as below,
> hence used 'oneOf'.
> groups = "uart0_4_grp", "uart0_5_grp";
> Please suggest me if there is a better/another way to represent this.

'items' has 2 forms: a list with a schema per entry or a schema that
applies to all entries.

1 item:
items:
  - enum: [...]

all items:
items:
  enum: [...]

You should use the latter form. You may need 'maxItems' here. Pick a
'should be enough' value if you don't have an actual max.

Rob
