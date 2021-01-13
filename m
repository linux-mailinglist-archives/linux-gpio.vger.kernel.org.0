Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4B982F421E
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Jan 2021 03:57:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728711AbhAMC5K (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Jan 2021 21:57:10 -0500
Received: from mail-ot1-f43.google.com ([209.85.210.43]:37692 "EHLO
        mail-ot1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726840AbhAMC5K (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Jan 2021 21:57:10 -0500
Received: by mail-ot1-f43.google.com with SMTP id o11so593822ote.4;
        Tue, 12 Jan 2021 18:56:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wxopvxGze0KrwrLh4CQC5oDamBjQANLUapKIcQO/MXE=;
        b=k6zmwDG6uO4PvbyJeGNB4MAlXlTB72tL5tUnbUwI/WS+aZ+Fkjt1Yjd5DTUfl3IyKL
         7GzEHkOrfnrmSAoPnAo7jTb2Ke3uyou6T9wl6AKK1l0kyI/8lqpMyEIWW27VDs1u7ndw
         l9Y4nTD5flNzGMWUFzsnmB75Ah02L+dQjL8RJG7ORE1o+5SrXwqgXpOAsQTQK06h7M0k
         b6Qrg+Hu5DCTwTYcaMP1KzTLRRdu1J9WeBNHxQ2JysqFQwN1zbLbwkOksPEinYvY8jEJ
         dRHgCPYiwzTOxcAvZJRxoeccAPhm2vVclnQIPhn5Bs7E9vG4PcJbElEa9lv0mNC1pu3z
         XVuw==
X-Gm-Message-State: AOAM530uO+6ANV/EOEgx+v0jWvNSIr/U7dPg05cqFwtrBehqGbdk/1kY
        5Vzmi7Ys4fjvp0hoQ7h2XA==
X-Google-Smtp-Source: ABdhPJy3qIbJsSo8ZClFtqTOMi0u7CL9lXJnDxywdybq3O1RzBXWkRgzCxuBOC2FJyqihdK8Cbb3kA==
X-Received: by 2002:a05:6830:784:: with SMTP id w4mr1602255ots.53.1610506589186;
        Tue, 12 Jan 2021 18:56:29 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id h11sm146837ooj.36.2021.01.12.18.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 18:56:28 -0800 (PST)
Received: (nullmailer pid 1430607 invoked by uid 1000);
        Wed, 13 Jan 2021 02:56:27 -0000
Date:   Tue, 12 Jan 2021 20:56:27 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: pinctrl: qcom: Add SM8350 pinctrl
 bindings
Message-ID: <20210113025627.GA1414436@robh.at.kernel.org>
References: <20210106054950.303244-1-vkoul@kernel.org>
 <20210106054950.303244-2-vkoul@kernel.org>
 <X/dCIuUR/El8Gxaa@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X/dCIuUR/El8Gxaa@builder.lan>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 07, 2021 at 11:17:22AM -0600, Bjorn Andersson wrote:
> On Tue 05 Jan 23:49 CST 2021, Vinod Koul wrote:
> 
> > Add device tree binding Documentation details for Qualcomm SM8350
> > pinctrl driver.
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  .../bindings/pinctrl/qcom,sm8350-tlmm.yaml    | 149 ++++++++++++++++++
> >  1 file changed, 149 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm8350-tlmm.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-tlmm.yaml
> > new file mode 100644
> > index 000000000000..abdafd25bfc2
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-tlmm.yaml
> > @@ -0,0 +1,149 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pinctrl/qcom,sm8350-tlmm.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm Technologies, Inc. SM8350 TLMM block
> > +
> > +maintainers:
> > +  - Vinod Koul <vkoul@kernel.org>
> > +
> > +description: |
> > +  This binding describes the Top Level Mode Multiplexer block found in the
> > +  SM8350 platform.
> > +
> > +properties:
> > +  compatible:
> > +    const: qcom,sm8350-tlmm
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  interrupt-controller: true
> > +
> > +  '#interrupt-cells':
> > +    description: Specifies the PIN numbers and Flags, as defined in
> > +      include/dt-bindings/interrupt-controller/irq.h
> > +    const: 2
> > +
> > +  gpio-controller: true
> > +
> > +  '#gpio-cells':
> > +    description: Specifying the pin number and flags, as defined in
> > +      include/dt-bindings/gpio/gpio.h
> > +    const: 2
> > +
> > +  gpio-ranges:
> > +    maxItems: 1
> > +
> > +  gpio-reserved-ranges:
> > +    maxItems: 1
> > +
> > +#PIN CONFIGURATION NODES
> > +patternProperties:
> > +  '-pinmux$':
> 
> I believe that what Rob was asking for was the matter of describing the
> mux and config subnodes under this one. But I don't know really how to
> express this, because the following are all valid:
> 
> default_state: default-state {
> 	pins = "gpio1";
> 	bias-disable;
> };
> 
> default_state: default-state {
> 	rx {
> 		pins = "gpio1";
> 		function = "gpio";
> 		bias-disable;
> 	};
> };
> 
> default_state: default-state {
> 	pinmux {
> 		pins = "gpio1";
> 		function = "gpio";
> 	};
> 
> 	pinconf {
> 		pins = "gpio1";
> 		bias-disable;
> 	};
> };
> 
> I.e. the properties described here applies either to this node directly,
> or any subnodes (1 level) down.

Why!?

You can create a definition and reuse it. Something like this:

$defs:
  pin-node:
    type: object
    properties:
      ...

patternProperties:
  '-state$':
    oneOf:
      - $ref: #/$defs/pin-node

      - patternProperties:
          '.*':
            $ref: #/$defs/pin-node


Rob
