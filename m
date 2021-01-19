Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CB1C2FBD5A
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Jan 2021 18:18:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730005AbhASRQT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Jan 2021 12:16:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389382AbhASRLF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Jan 2021 12:11:05 -0500
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D625C061575
        for <linux-gpio@vger.kernel.org>; Tue, 19 Jan 2021 09:10:25 -0800 (PST)
Received: by mail-ot1-x331.google.com with SMTP id a109so20517585otc.1
        for <linux-gpio@vger.kernel.org>; Tue, 19 Jan 2021 09:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pXSkCf6NTgWeornYKqyzoK7uvy0u52bJAmSUmFRq6Kk=;
        b=fSkRlQI1Eq9zu7gjrvH74OD6VquTHZLJC/QSHGiWhCmHuBGHf/OjtT5VlBJz9LG/s8
         Yom9x6VRsm+PgVQGiKa4yfQjuh6OdKacXb2GZBG/Cmp5wDGTgkEIWNqS4eptcZnafWI3
         3q7b5gb7fBw70nh6VliSeSefH4OUygnybHTDjtX1YrZUs+u2feJoIU/hCZRBXYzREtFN
         nnLlVPr6etMMpEHSq0mWn3mLQAaUHGlEBUgvtDtlB+E8dHQJ8PtuKMZWlCPtuXfRg/g3
         9tAduNlcf1iAza8c9/WS4JRwj69Bo0S3q9aDnOVFbb7XDYylU51lK6DAfKIIjwXWQOWn
         ZPAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pXSkCf6NTgWeornYKqyzoK7uvy0u52bJAmSUmFRq6Kk=;
        b=mpa0ZF5/C+bPjgiYOvpLkiwtTkXze0gQvovo2NlOLRoRjtORsLePko6vsql6uf7EwK
         cX7nWUpqvSQz5cIbTF0rWqhOBlcMg9IYL4mXSMd1T6vNFgo9/+Tnc2mMYPfffWc/e/jK
         HfItkaiCIzcMniWp1ArfN6p1rbsUMEoJ+l/MMv45vG4l+DDEx7QP7f7aMzQVXSnTyZW8
         XXSXoVk3Um8VA4CI/CnIjtyb9LkPGEFc8BaFAgrFg7EVdfNo634C8m8to0S7A9sv8wjC
         /j62iJNW7U5loj+ZKDegV+DfJK1fRgmbmMrE5Dtl6Ei5Gb3NG0Oql1BBAixgf/aVFtBj
         bE6A==
X-Gm-Message-State: AOAM532jU4o3hJXohHK2LIwwxgacC4EAMaUIzJtHXlo/vA/Oxtk50/eo
        ElhmnpToTu9CA+8VfKPBwOlqPg==
X-Google-Smtp-Source: ABdhPJwIVkhmej3WLIceC3lEJrYdFar4S/jJLeGL7N6ySC0eU3Z1pEwOya5yOuDEO52p/OcABnn1HQ==
X-Received: by 2002:a9d:6188:: with SMTP id g8mr4131050otk.299.1611076224437;
        Tue, 19 Jan 2021 09:10:24 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id n11sm3975378oij.37.2021.01.19.09.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 09:10:23 -0800 (PST)
Date:   Tue, 19 Jan 2021 11:10:22 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: pinctrl: qcom: Add SM8350 pinctrl
 bindings
Message-ID: <YAcSfhpy3IA9H0qb@builder.lan>
References: <20210106054950.303244-1-vkoul@kernel.org>
 <20210106054950.303244-2-vkoul@kernel.org>
 <X/dCIuUR/El8Gxaa@builder.lan>
 <20210113025627.GA1414436@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210113025627.GA1414436@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue 12 Jan 20:56 CST 2021, Rob Herring wrote:

> On Thu, Jan 07, 2021 at 11:17:22AM -0600, Bjorn Andersson wrote:
> > On Tue 05 Jan 23:49 CST 2021, Vinod Koul wrote:
> > 
> > > Add device tree binding Documentation details for Qualcomm SM8350
> > > pinctrl driver.
> > > 
> > > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > > ---
> > >  .../bindings/pinctrl/qcom,sm8350-tlmm.yaml    | 149 ++++++++++++++++++
> > >  1 file changed, 149 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm8350-tlmm.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-tlmm.yaml
> > > new file mode 100644
> > > index 000000000000..abdafd25bfc2
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-tlmm.yaml
> > > @@ -0,0 +1,149 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/pinctrl/qcom,sm8350-tlmm.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Qualcomm Technologies, Inc. SM8350 TLMM block
> > > +
> > > +maintainers:
> > > +  - Vinod Koul <vkoul@kernel.org>
> > > +
> > > +description: |
> > > +  This binding describes the Top Level Mode Multiplexer block found in the
> > > +  SM8350 platform.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: qcom,sm8350-tlmm
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  interrupt-controller: true
> > > +
> > > +  '#interrupt-cells':
> > > +    description: Specifies the PIN numbers and Flags, as defined in
> > > +      include/dt-bindings/interrupt-controller/irq.h
> > > +    const: 2
> > > +
> > > +  gpio-controller: true
> > > +
> > > +  '#gpio-cells':
> > > +    description: Specifying the pin number and flags, as defined in
> > > +      include/dt-bindings/gpio/gpio.h
> > > +    const: 2
> > > +
> > > +  gpio-ranges:
> > > +    maxItems: 1
> > > +
> > > +  gpio-reserved-ranges:
> > > +    maxItems: 1
> > > +
> > > +#PIN CONFIGURATION NODES
> > > +patternProperties:
> > > +  '-pinmux$':
> > 
> > I believe that what Rob was asking for was the matter of describing the
> > mux and config subnodes under this one. But I don't know really how to
> > express this, because the following are all valid:
> > 
> > default_state: default-state {
> > 	pins = "gpio1";
> > 	bias-disable;
> > };
> > 
> > default_state: default-state {
> > 	rx {
> > 		pins = "gpio1";
> > 		function = "gpio";
> > 		bias-disable;
> > 	};
> > };
> > 
> > default_state: default-state {
> > 	pinmux {
> > 		pins = "gpio1";
> > 		function = "gpio";
> > 	};
> > 
> > 	pinconf {
> > 		pins = "gpio1";
> > 		bias-disable;
> > 	};
> > };
> > 
> > I.e. the properties described here applies either to this node directly,
> > or any subnodes (1 level) down.
> 
> Why!?
> 

That's is how the generic pinctrl framework in Linux has parsed these
nodes for the last several years, so I expect all pinctrl bindings to
show this.

And in particular, rather than forcing people to use the third form
above the free naming of the subnodes allows to describe an entire 4 pin
UART in a single pin state (the last requires 3-4 nodes + duplicates for
sleep state), and for single gpio things the first one doesn't force
people to make up phony names - which typically lands them in the last
case (using pinmux/pinconf).

> You can create a definition and reuse it. Something like this:
> 
> $defs:
>   pin-node:
>     type: object
>     properties:
>       ...
> 
> patternProperties:
>   '-state$':
>     oneOf:
>       - $ref: #/$defs/pin-node
> 
>       - patternProperties:
>           '.*':
>             $ref: #/$defs/pin-node

So I presume then that it would make sense to convert
{pinmux,pinconf}-node.yaml this form and then in our binding we should
somehow just refer to these.

But what's the appropriate method of extending and limiting pin-node? We
have additional constraints and not all the properties are valid for the
Qualcomm TLMM.

Regards,
Bjorn

> 
> 
> Rob
