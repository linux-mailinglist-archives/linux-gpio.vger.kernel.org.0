Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2AFAB7B66F
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2019 01:59:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727959AbfG3X7G (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jul 2019 19:59:06 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:44919 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725975AbfG3X7G (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 30 Jul 2019 19:59:06 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 649912222B;
        Tue, 30 Jul 2019 19:59:02 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute4.internal (MEProxy); Tue, 30 Jul 2019 19:59:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm3; bh=LbhKQoZqdxV+FyL2mwG35/QPyn9PEC7
        JgRbmiOeNOKs=; b=H/N9ZWWAUoC7TI+7xDGE7x5/qU/3kpM3kb6ukIpLrQHhohe
        ZoCfxAEiFHDCRjlH90i+M328gC7z51eoLkUBSxn9H+a93dOAQCha99Cc2HZZqQw7
        4i5OJ3OuQ7L1Zf51aIvS16QWLRucjRcOKfWfQocczxpaIuernv6HlLBtEyPzCc83
        uKpB9e04kiTtnBIEtYbzpLuFDcXMPOUrf9CSpMJZKOFDMuT4Ty0s6Ek0Ax2NZdgI
        CO6GBzzTyd48YbQGOs63RaETWQ+qBrSYpdwtACcCN/3+AsmHIEwwooOeFoI9mi/u
        SSYVO86Et4skrL9py6S48FminHiFVh/bL57pLPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=LbhKQo
        ZqdxV+FyL2mwG35/QPyn9PEC7JgRbmiOeNOKs=; b=RtkoNgbZl4NxnK2LXMZkiB
        6pLZKctXFK7NPqiaPEmiQ2AmS1tnhzZtV729zAW0JcP3ShQ7H6epxCE5yrzEqE8y
        jS7ipNLQgrpyY9iFURWL8ATKvp+yiMgelBn84QaLOlXkypnLVHUpL0VHTqI+9hl7
        /3N7iG+GnHvRXvvjWnQUJQBXW6yM+kEbrORhBnHV9GfTbVe2HlErAKq9z15X6ihq
        SSYQlX5w80nMhfnvr+v/yYvysRRIFvXxoci+gsHry92/sSG/Ouwc/EPg95M8TpGJ
        RdwX91Iwg1vcPQ0an78HsihBzT1/SpADpI+1ovfIi0SuZ5up6GCGuRkW10QTTTiw
        ==
X-ME-Sender: <xms:xNlAXe17BXmoxBo25Ez3iPBdJTxezcLyjRfcvI5ZCkxbVpiDWgld1Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrleeggddvlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
    vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
    hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
    ufhiiigvpedt
X-ME-Proxy: <xmx:xNlAXXOVszbMbFu48LtMPfYbKIOD6I8TLlalhsUxC84AkMgjsmr_vQ>
    <xmx:xNlAXdal8ewJPHdGPcyg4vtK36wpQxiUY9sj4hxpHGhuCb6I3h9oUA>
    <xmx:xNlAXZ11wkN97U0OsYSrsvzFs1fndP2bfvyTbPgaA1qiAR5HkYSJew>
    <xmx:xtlAXSrdFGXaWAroQYZagEcubiQWf4Qvjh_NPUFjlbF8k7awnhntMA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id AF4B6E00A2; Tue, 30 Jul 2019 19:59:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-799-g925e343-fmstable-20190729v1
Mime-Version: 1.0
Message-Id: <f22b671a-2968-41cb-b158-372663fa6843@www.fastmail.com>
In-Reply-To: <1564500268-2627-2-git-send-email-hongweiz@ami.com>
References: <1564500268-2627-1-git-send-email-hongweiz@ami.com>
 <1564500268-2627-2-git-send-email-hongweiz@ami.com>
Date:   Wed, 31 Jul 2019 09:28:49 +0930
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Hongwei Zhang" <hongweiz@ami.com>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        "Joel Stanley" <joel@jms.id.au>, devicetree@vger.kernel.org
Cc:     "Rob Herring" <robh+dt@kernel.org>,
        "Bartosz Golaszewski" <bgolaszewski@baylibre.com>,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [v6 1/2] dt-bindings: gpio: aspeed: Add SGPIO support
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Wed, 31 Jul 2019, at 00:55, Hongwei Zhang wrote:
> Add bindings to support SGPIO on AST2400 or AST2500.
> 
> Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
> ---
>  .../devicetree/bindings/gpio/sgpio-aspeed.txt      | 55 ++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
> 
> diff --git a/Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt 
> b/Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
> new file mode 100644
> index 0000000..f9ed438
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
> @@ -0,0 +1,55 @@
> +Aspeed SGPIO controller Device Tree Bindings
> +-------------------------------------------
> +
> +This SGPIO controller is for ASPEED AST2500 SoC, it supports up to 80 
> full 
> +featured Serial GPIOs. Each of the Serial GPIO pins can be programmed 
> to 
> +support the following options:
> +- Support interrupt option for each input port and various interrupt 
> +  sensitivity option (level-high, level-low, edge-high, edge-low)
> +- Support reset tolerance option for each output port
> +- Directly connected to APB bus and its shift clock is from APB bus 
> clock
> +  divided by a programmable value.
> +- Co-work with external signal-chained TTL components (74LV165/74LV595)
> +
> +
> +Required properties:
> +
> +- compatible		: Either "aspeed,ast2400-sgpio" or "aspeed,ast2500-sgpio"
> +
> +- #gpio-cells 		: Should be two
> +			  - First cell is the GPIO line number
> +			  - Second cell is used to specify optional
> +			    parameters (unused)
> +
> +- reg			: Address and length of the register set for the device
> +- gpio-controller	: Marks the device node as a GPIO controller
> +- interrupts		: Interrupt specifier (see interrupt bindings for
> +			  details)
> +
> +- interrupt-controller	: Mark the GPIO controller as an 
> interrupt-controller
> +
> +- ngpios		: number of GPIO pins to serialise. 
> +			  (should be multiple of 8, up to 80 pins)
> +
> +- clocks                : A phandle to the APB clock for SGPM clock 
> division
> +
> +- bus-frequency		: SGPM CLK frequency
> +
> +
> +The sgpio and interrupt properties are further described in their 
> respective bindings documentation:
> +
> +- Documentation/devicetree/bindings/sgpio/gpio.txt

This isn't a file? This one is (s/sgpio/gpio/):

 Documentation/devicetree/bindings/gpio/gpio.txt

I assume this was the result of a stray search/replace?

With that fixed you can add: Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

Andrew

> +- Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
> +
> +  Example:
> +	sgpio: sgpio@1e780200 {
> +		#gpio-cells = <2>;
> +		compatible = "aspeed,ast2500-sgpio";
> +		gpio-controller;
> +		interrupts = <40>;
> +		reg = <0x1e780200 0x0100>;
> +		clocks = <&syscon ASPEED_CLK_APB>;
> +		interrupt-controller;
> +		ngpios = <8>;
> +		bus-frequency = <12000000>;
> +	};
> -- 
> 2.7.4
> 
>
