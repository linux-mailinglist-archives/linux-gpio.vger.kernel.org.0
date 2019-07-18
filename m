Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43A176C4AB
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2019 03:48:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732404AbfGRBs1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Jul 2019 21:48:27 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:51231 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727804AbfGRBs1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 17 Jul 2019 21:48:27 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id BD7FF2942;
        Wed, 17 Jul 2019 21:48:23 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute4.internal (MEProxy); Wed, 17 Jul 2019 21:48:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm3; bh=FDtAha3aM/d7uySbVX6vDZnPDLMPpkQ
        a4d+2z+nDkSw=; b=mRG+7PMfIT+vCcwHo0gdhqnL4lMvsLsNLq65jw6Q6pbUTb+
        u12le5/HXSk6FLw+pspOYBp1nMpPWdPTAbrZAlZJ33yuY6b/fOefBwjxmNI+rRrJ
        mCVY8EwTXBbXobAdtB3iZpA24y4QME3ApQmhBfeoxP9UnEU1NYWy4htADuvr36rG
        wxZB6oE+ZwE1m+wZgcosCwaVyD2mloWWZYWNn84djblf1bjJEIGgYxE6qeXj1K6U
        4xr9HAG1zLUj+BQ78R6dNfOzkJTyndSpu0v7t/ui8C2EkttkNDeVD/8GUVWIVW4n
        m3Sn4R9ZIEo+GAESQEWqxVxWSMEDJhECIxfDAVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=FDtAha
        3aM/d7uySbVX6vDZnPDLMPpkQa4d+2z+nDkSw=; b=Tm7whVMvkVnMhjx7wSeVwg
        NmZLxtcINIEt+TvTc/Yse+AWv58Qzg3bgV3Gc8ywxNu8LX1jp/o10XnPnep+AFy1
        vKFIxhemFb71uNunnPEb0vwBvd+J2M5rLa8o/RitCYq/6T2iDLYx2Ylj7NvPDaxP
        5OXdQbAR3xZ2aXilTUO5rYs1OPF0mKXYqnyJkZy+eF+r1K39hdbYV3+PSM6JbpYA
        uwnKpO226esrlEdVzWjMFaUKqBavVXGwBKZaULu4+QkR5IW5xnyA0+4DExKfaT6i
        jZC1fBjnUTei0jhzgZkxkKDmB/PuR5A7D6bE/GLIL/T2LnRyWLR6iO5/nDaIMyHg
        ==
X-ME-Sender: <xms:5s8vXdK5zURUKobPB6VxEAlu0IO77MFnRoBvJDSRFxvuy4KwhM_toA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrieeggdeglecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
    vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucffohhmrg
    hinhepkhgvrhhnvghlrdhorhhgnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgv
    fiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:5s8vXXy-0vpsWkOw3eYGa4hc7Kadwe8o2-UgtEwHV5-C27O5PUAkeQ>
    <xmx:5s8vXVUS6Ynnx8mqEFsgnwx9FHrmzA7EERgzZFwqM77hVDGdUFS19g>
    <xmx:5s8vXUmNmjvoKr2WmhBxnuhYxOKOfxp5qLTBwNeuy3OfPHnu1zrEYA>
    <xmx:588vXTm4qUFyCosHKHr7T6nADc1lutgBpHEG2TgZbddTwYeDiB2LGw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 470C0E03EA; Wed, 17 Jul 2019 21:48:22 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-731-g19d3b16-fmstable-20190627v1
Mime-Version: 1.0
Message-Id: <f1a91695-e02b-4ec4-9bf4-0bd97ac2ffc4@www.fastmail.com>
In-Reply-To: <1563394325-15941-1-git-send-email-hongweiz@ami.com>
References: <1563394325-15941-1-git-send-email-hongweiz@ami.com>
Date:   Thu, 18 Jul 2019 11:18:29 +0930
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Hongwei Zhang" <hongweiz@ami.com>,
        "Joel Stanley" <joel@jms.id.au>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org
Cc:     "Rob Herring" <robh+dt@kernel.org>,
        "Mark Rutland" <mark.rutland@arm.com>,
        "Bartosz Golaszewski" <bgolaszewski@baylibre.com>,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 2/3 v4] dt-bindings: gpio: aspeed: Add SGPIO support
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The subject is largely correct, but please see the discussion on the driver patch
about how to clean up the [PATCH ...] prefix.

On Thu, 18 Jul 2019, at 05:42, Hongwei Zhang wrote:
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
> index 0000000..2d6305e
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
> +- nr-gpios		: number of GPIO pins to serialise. 
> +			  (should be multiple of 8, up to 80 pins)

Please change the property name to "ngpios", as per the generic GPIO
bindings[1].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/gpio/gpio.txt?h=v5.2#n141

Cheers,

Andrew

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
> +		nr-gpios = <8>;
> +		bus-frequency = <12000000>;
> +	};
> -- 
> 2.7.4
> 
>
