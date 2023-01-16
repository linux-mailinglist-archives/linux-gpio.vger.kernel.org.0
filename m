Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9901D66BC98
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jan 2023 12:15:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229560AbjAPLPZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Jan 2023 06:15:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbjAPLPW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Jan 2023 06:15:22 -0500
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1ACB0B44A;
        Mon, 16 Jan 2023 03:15:22 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 2E66C8108;
        Mon, 16 Jan 2023 11:15:21 +0000 (UTC)
Date:   Mon, 16 Jan 2023 13:15:19 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: Update pinctrl-single to use yaml
Message-ID: <Y8UxxwdbiHdJ7WF+@atomide.com>
References: <20230112083152.10277-1-tony@atomide.com>
 <20230113202016.GA2833245-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230113202016.GA2833245-robh@kernel.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Rob,

I ran into error "is not of type 'object'" with two dashes in the property
name.

* Rob Herring <robh@kernel.org> [230113 20:20]:
> On Thu, Jan 12, 2023 at 10:31:50AM +0200, Tony Lindgren wrote:
> > -- #pinctrl-single,gpio-range-cells : the number of parameters after phandle in
> > -  pinctrl-single,gpio-range property.
> > -
> > -	range: gpio-range {
> > -		#pinctrl-single,gpio-range-cells = <3>;
> > -	};
> 
> You've lost describing this.

Thanks for noticing. Adding something like below produces errors for the
pinctrl-single,gpio-range property name:

  pinctrl-single,gpio-range:
    description: Optional list of pin base, nr pins & gpio function
    $ref: /schemas/types.yaml#/definitions/phandle-array
    items:
      - items:
          - description: phandle of a gpio-range node
          - description: pin base
          - description: number of pins
          - description: gpio function

  pinctrl-single,gpio-range = <&range 0 3 0>;

The error is:

pinctrl-single.example.dtb: pinmux@4a100040: pinctrl-single,gpio-range:
[[1, 0, 3, 0]] is not of type 'object'

Changing the property name second dash to something else makes it go away.

This is with dtschema 2022.12. Any ideas?

Regards,

Tony
