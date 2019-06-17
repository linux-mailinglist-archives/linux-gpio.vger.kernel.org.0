Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D2A9479FF
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 08:25:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725554AbfFQGZH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 02:25:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:49596 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725468AbfFQGZH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 17 Jun 2019 02:25:07 -0400
Received: from localhost (unknown [122.178.208.218])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D14202189F;
        Mon, 17 Jun 2019 06:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560752706;
        bh=co4CH3+SDS8TMkRgK/NCJ9ECqQhqAHMJdhoNOGwoOuo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=X8Pfmd/rIU96IjvzY+RN4dwMfiLLpJtl74U3hxuwtuKX/aTl4lbPWXvaSFakH+RUi
         qzB5vRYtTNTN5ASjIF9dNN6HsKOMCJzQkTwiZEyN/jzyp/7Me3DJi6EuSi/Ywpm4en
         J8eG7dVIMlCWxnrBDNra6ZL/TyA0skTChyzI2CT4=
Date:   Mon, 17 Jun 2019 11:51:58 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Prasad Sodagudi <psodagud@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Isaac J . Manjarres" <isaacm@codeaurora.org>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add SM8150 pinctrl
 binding
Message-ID: <20190617062158.GG2962@vkoul-mobl>
References: <20190614053032.24208-1-vkoul@kernel.org>
 <20190617042032.GE750@tuxbook-pro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190617042032.GE750@tuxbook-pro>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 16-06-19, 21:20, Bjorn Andersson wrote:
> On Thu 13 Jun 22:30 PDT 2019, Vinod Koul wrote:

> > +- reg:
> > +	Usage: required
> > +	Value type: <prop-encoded-array>
> > +	Definition: the base address and size of the north, south , west
> 
> Extra space after south.

Thanks will fix that

> > +- #gpio-cells:
> > +	Usage: required
> > +	Value type: <u32>
> > +	Definition: must be 2. Specifying the pin number and flags, as defined
> > +		    in <dt-bindings/gpio/gpio.h>
> > +
> 
> Please also document gpio-ranges and gpio-reserved-ranges.

Will add

> > +Example:
> > +
> > +	tlmm: pinctrl@3000000 {
> > +		compatible = "qcom,sm8150-pinctrl";
> > +		reg = <0x03100000 0x300000>,
> > +		      <0x03500000 0x300000>,
> > +		      <0x03900000 0x300000>,
> > +		      <0x03D00000 0x300000>;
> > +		reg-names = "west", "east", "north", "south";
> > +		interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
> > +		gpio-controller;
> > +		#gpio-cells = <2>;
> > +		interrupt-controller;
> > +		#interrupt-cells = <2>;
> 
> You're missing the required gpio-ranges from the example, see e.g.
> msm8996 (and please send a patch to the binding you based this on).

I ported this from downstream but did look at existing upstream
examples so will do that

-- 
~Vinod
