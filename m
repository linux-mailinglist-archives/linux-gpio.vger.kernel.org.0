Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BC522F6E6A
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Jan 2021 23:45:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730665AbhANWnp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 Jan 2021 17:43:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:58226 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727116AbhANWnp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 14 Jan 2021 17:43:45 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3D19C23977;
        Thu, 14 Jan 2021 22:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610664184;
        bh=qZ/MNWQydkUDlIXZVZ6/n8TRZAwyFdzsMQwirrjnwqg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=uXi0wsURRyW96Ia0XZFtD90Th4/U5vBJcmFnHbz7JtRMhSIF8BsKA2t60WnJSd5vW
         XsLysC2M4Y+2uJoq5j3Sbwk2pxe69+CS9bFqbfevBo/DnnP1MqRIZCdtBEQk/V0BFh
         Satflho+t/kbS48q0pLfiLSvj8FykKhbaU2w3uWGQQW7WsHHVLI66ey5RZLtnzx5S5
         OnkTpXwFW5toZYBdNkq0IDo2PmNV44o69xKCVV243epTvVQJSp5OX5a18VEJxWbj6Z
         +vUni3uKQ6gT6065hdOSP/CiSv3msLTl/TuLXhX5WMSkt0exAt/vmYK+k88ZMEYrKh
         eCYt6jjyF72lw==
Received: by mail-ej1-f42.google.com with SMTP id d17so10575111ejy.9;
        Thu, 14 Jan 2021 14:43:04 -0800 (PST)
X-Gm-Message-State: AOAM533v3yKaUhEOMW81J8TEpupWzunW22bIZgv/np0d2CFvwappAvRc
        Lp/8s0F96ZlL6YVy+c7u2qrLX/YirJj5hXx3zA==
X-Google-Smtp-Source: ABdhPJycUNMxM59kfx7C+D7nZiNTZvcRLWLTpIbtqYITZAWtuPES6DqIj+XHr5HIDaFEUrPXVXNKrgkhBjPZuzwV3vY=
X-Received: by 2002:a17:906:25c4:: with SMTP id n4mr6691033ejb.359.1610664182813;
 Thu, 14 Jan 2021 14:43:02 -0800 (PST)
MIME-Version: 1.0
References: <20210111182928.587285-1-angelogioacchino.delregno@somainline.org>
 <20210111182928.587285-2-angelogioacchino.delregno@somainline.org>
 <20210113024118.GA1404906@robh.at.kernel.org> <3857e97d-2505-6a93-03cd-c36562035445@somainline.org>
In-Reply-To: <3857e97d-2505-6a93-03cd-c36562035445@somainline.org>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 14 Jan 2021 16:42:51 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL4nbF_gfkN9KYvQ6Je_xiPLfQg9-bP9nsnsjtv8PvRYg@mail.gmail.com>
Message-ID: <CAL_JsqL4nbF_gfkN9KYvQ6Je_xiPLfQg9-bP9nsnsjtv8PvRYg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: pinctrl: Add bindings for Awinic AW9523/AW9523B
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, phone-devel@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 13, 2021 at 6:30 AM AngeloGioacchino Del Regno
<angelogioacchino.delregno@somainline.org> wrote:
>
> Il 13/01/21 03:41, Rob Herring ha scritto:
> > On Mon, Jan 11, 2021 at 07:29:28PM +0100, AngeloGioacchino Del Regno wrote:
> >> Add bindings for the Awinic AW9523/AW9523B I2C GPIO Expander driver.
> >>
> >> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> >> ---
> >>   .../pinctrl/awinic,aw9523-pinctrl.yaml        | 112 ++++++++++++++++++
> >>   1 file changed, 112 insertions(+)
> >>   create mode 100644 Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.yaml
> >> new file mode 100644
> >> index 000000000000..a705c05bb5a2
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.yaml
> >> @@ -0,0 +1,112 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/pinctrl/awinic,aw9523-pinctrl.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Awinic AW9523/AW9523B I2C GPIO Expander
> >> +
> >> +maintainers:
> >> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> >> +
> >> +description: |
> >> +  The Awinic AW9523/AW9523B I2C GPIO Expander featuring 16 multi-function
> >> +  I/O, 256 steps PWM mode and interrupt support.
> >> +
> >> +properties:
> >> +  compatible:
> >> +    const: awinic,aw9523-pinctrl
> >> +
> >> +  reg:
> >> +    maxItems: 1
> >> +
> >> +  '#gpio-cells':
> >> +    description: |
> >> +      Specifying the pin number and flags, as defined in
> >> +      include/dt-bindings/gpio/gpio.h
> >> +    const: 2
> >> +
> >> +  gpio-controller: true
> >> +
> >> +  gpio-ranges:
> >> +    maxItems: 1
> >> +
> >> +  interrupt-controller: true
> >> +
> >> +  interrupts:
> >> +    maxItems: 1
> >> +    description: Specifies the INTN pin IRQ.
> >> +
> >> +  '#interrupt-cells':
> >> +    description:
> >> +      Specifies the PIN numbers and Flags, as defined in defined in
> >> +      include/dt-bindings/interrupt-controller/irq.h
> >> +    const: 2
> >> +
> >> +#PIN CONFIGURATION NODES
> >> +patternProperties:
> >> +  '^.*$':
> >> +    if:
> >> +      type: object
> >> +      $ref: "/schemas/pinctrl/pincfg-node.yaml"
> >> +    then:
> >
> > I wish people would stop copying this if/then hack...
> >
> > For new bindings, just name your nodes something sensible you can match
> > on like '-pins$'.
> >
> I always check the newest available yaml that I can find in the same
> folder before writing mine... in this case, it was sm8250-pinctrl.yaml
> and I thought that this was the accepted way, since.. that's.. the
> newest one.

Normally, that's a good strategy. Unfortunately, this one went in
without my review. There was supposed to be a follow-up to fix some of
the issues, but seems that never happened.

Rob
