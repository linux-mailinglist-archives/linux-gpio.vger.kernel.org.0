Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAA127063BC
	for <lists+linux-gpio@lfdr.de>; Wed, 17 May 2023 11:14:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229778AbjEQJOZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 May 2023 05:14:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229833AbjEQJOY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 May 2023 05:14:24 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A1A1040EA;
        Wed, 17 May 2023 02:14:20 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 883A58117;
        Wed, 17 May 2023 09:14:19 +0000 (UTC)
Date:   Wed, 17 May 2023 12:14:18 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Conor Dooley <conor+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Nishanth Menon <nm@ti.com>,
        linux-arm-kernel@lists.infradead.org,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH v4 2/2] dt-bindings: pinctrl: Update pinctrl-single to
 use yaml
Message-ID: <20230517091418.GT14287@atomide.com>
References: <20230510095330.30742-1-tony@atomide.com>
 <20230510095330.30742-2-tony@atomide.com>
 <20230510124836.thqtol6qac762ggx@krzk-bin>
 <20230517080013.GS14287@atomide.com>
 <6e8ab385-8d4f-b1fc-e964-64149c085dd9@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e8ab385-8d4f-b1fc-e964-64149c085dd9@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

* Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> [230517 08:23]:
> On 17/05/2023 10:00, Tony Lindgren wrote:
> > Hi,
> > 
> > * Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> [230510 12:48]:
> >> On Wed, 10 May 2023 12:53:29 +0300, Tony Lindgren wrote:
> >>> Update binding for yaml and remove the old related txt bindings. Note that
> >>> we are also adding the undocumented pinctrl-single,slew-rate property. And
> >>> we only use the first example from the old binding.
> > ...
> >> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> >> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> >>
> >> yamllint warnings/errors:
> >>
> >> dtschema/dtc warnings/errors:
> >> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/pinctrl-single.example.dtb: pinmux@4a100040: #pinctrl-cells: [[2]] is not of type 'object'
> >> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
> >> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/pinctrl-single.example.dtb: pinmux@4a100040: #pinctrl-cells: [[2]] is not of type 'object'
> >> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
> >> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/pinctrl-single.example.dtb: pinmux@4a100040: pinctrl-single,register-width: [[16]] is not of type 'object'
> >> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
> >> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/pinctrl-single.example.dtb: pinmux@4a100040: pinctrl-single,register-width: [[16]] is not of type 'object'
> >> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
> >> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/pinctrl-single.example.dtb: pinmux@4a100040: pinctrl-single,function-mask: [[65535]] is not of type 'object'
> >> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
> >> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/pinctrl-single.example.dtb: pinmux@4a100040: pinctrl-single,function-mask: [[65535]] is not of type 'object'
> >> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
> >> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/pinctrl-single.example.dtb: pinmux@4a100040: pinctrl-single,gpio-range: [[1, 0, 3, 0]] is not of type 'object'
> >> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
> >> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/pinctrl-single.example.dtb: pinmux@4a100040: pinctrl-single,gpio-range: [[1, 0, 3, 0]] is not of type 'object'
> >> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
> > 
> > Looks like these are happening because of the patternProperties match for
> > pin, will need to add more patterns like like -pin|_pin instead.
> 
> It would be great if you can change _pin to -pin in all DTS. Underscores
> are unwelcome.

Yes np, I have a hackish script to change things to use -pins node naming
for pin groups. Will send out patches this week.

Regards,

Tony

