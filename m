Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEDA92CE734
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Dec 2020 06:03:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726244AbgLDFCs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Dec 2020 00:02:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:41048 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726210AbgLDFCs (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 4 Dec 2020 00:02:48 -0500
Date:   Fri, 4 Dec 2020 10:32:03 +0530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607058127;
        bh=x+sZrOAMiWD2UQXV2Ez8qwjEDXVGD9pQGScuVkg3Mg4=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=aU1OVC68GlAq2dtT3M4iMXX9nEbkM0zIl88wnAxuLojrywfMjCV0ps/YS1q5z5002
         jKPee0Xlc1PCactmWSBQdb7/mlZDPP288oUOR8lvp3GhxkcXzDHmAz3xAUqhUK7+b7
         mwSK3/Azy9Qr5zp90AptEbXpmX7wz/cGkk/4BERPVnmBz6CkVMxrMMaoXgyBAx5BE/
         q7Ydh9kfAPN57LAGT4uSTBraoLGLoHbzveXDiML4GY0EBCXq7tBAGpHfIeXxXMLxiM
         IRKdDIb52uFoK4GBhOC8p/5BhCM30LKHmpUQeSr4ba9FaXYRim1jm/mCqthkkM2iXU
         ZkAffChOHYYyw==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add SM8350 pinctrl
 bindings
Message-ID: <20201204050203.GL8403@vkoul-mobl>
References: <20201203070900.2651127-1-vkoul@kernel.org>
 <X8l5ietmcGv/i7Vx@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X8l5ietmcGv/i7Vx@builder.lan>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 03-12-20, 17:49, Bjorn Andersson wrote:

> > +#PIN CONFIGURATION NODES
> > +patternProperties:
> > +  '-pins$':
> > +    type: object
> > +    description:
> > +      Pinctrl node's client devices use subnodes for desired pin configuration.
> > +      Client device subnodes use below standard properties.
> > +    $ref: "/schemas/pinctrl/pincfg-node.yaml"
> > +
> > +    properties:
> > +      pins:
> > +        description:
> > +          List of gpio pins affected by the properties specified in this subnode.
> > +        items:
> > +          oneOf:
> > +            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-1][0-6])$"
> 
> That doesn't cover the entire pin space, I think should be:
> 
> 	"^gpio([0-9]|[1-9][0-9]|1[0-9][0-9]|20[0-3])$"

I thought I had fixed this up, will update

> > +examples:
> > +  - |
> > +        #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +        tlmm: pinctrl@f000000 {
> > +          compatible = "qcom,sm8350-pinctrl";
> > +          reg = <0x0f100000 0x300000>;
> > +          interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
> > +          gpio-controller;
> > +          #gpio-cells = <2>;
> > +          interrupt-controller;
> > +          #interrupt-cells = <2>;
> > +          gpio-ranges = <&tlmm 0 0 203>;
> > +          serial-pins {
> > +            pins = "gpio18", "gpio19";
> > +            function = "qup3";
> > +            drive-strength = <8>;
> > +            bias-disable;
> > +            };
> 
> Indentation is slightly off here.

Oops, thanks for pointing out

-- 
~Vinod
