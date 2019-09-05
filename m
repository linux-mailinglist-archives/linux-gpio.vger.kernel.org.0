Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A8DAA9917
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2019 05:59:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728267AbfIED7F (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Sep 2019 23:59:05 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:47789 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727562AbfIED7E (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Sep 2019 23:59:04 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id E36DC399A;
        Wed,  4 Sep 2019 23:59:03 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute4.internal (MEProxy); Wed, 04 Sep 2019 23:59:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm3; bh=bsxI63SDV53IBgVMw9ODo8bNo53LTDF
        tLsvuYgDTumc=; b=cxi0lxLMshDNFApXwHb+YnUgaXybAEJD4RXHoK45E5SVzBo
        jwmlEP9AamppX+wLLstsGJrBCfPKqKxYTMOiHYBvNOtYR4BHt0qAMn/6nvtu023i
        oMz1+L2EopbHYaibpSYOnjKxAhVvo5SUX8K3Qa+3iN/LCYg3YTy43UJAMOni17wS
        isZJzyTCpSunnQGn8kUtTNSfo247l0wubez2B7LoDLQGWwZHpYtjlpDMdX58fOOv
        T33ukMTx5ZzovB0jlb61CseEJQECpU+CIQwN7aWfrCZihc3fGTANoan9eiMlbSAV
        AAEnEw94LbDxVSanAo6cUFTVRs3r9RHWLiouxOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=bsxI63
        SDV53IBgVMw9ODo8bNo53LTDFtLsvuYgDTumc=; b=XdIJZOQmJhKJ1LqYXYYS4h
        IuDgZApzHMLe2yXEYn0Jtah0T1STxbmaFDguklzz9+FQxNcd7MQ2ZROl4q2YpepQ
        Z50PtQvsk9GWP6cRgkknPJjFbp2qtfbwKGBQ0TFC8aqEidJT2EgF16qVkSUgBXzi
        cSJ4phSg7BAjkAOu9lkYR7zNYzrhZTAZotpvpRHZ7uGr3DZsYzCGwro4nVos4uOc
        G7wyG0OLNiVC2N28x9rXNrNAC9FehG6IsnPTl7t0FyXaMCvjYuEpG7bRQGh3MFfB
        WTr7pByxoFMtdEwVfr0IWC4UBM//mL8o48rTXsI5/RVMVxALWsHX2XogHIR84WGw
        ==
X-ME-Sender: <xms:B4hwXayjsygOYaj8l4PbulBAuT8qWTh1NBH6NzyMdJkaY2VTz--qaA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudejiedgjeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
    grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
    rhfuihiivgeptd
X-ME-Proxy: <xmx:B4hwXfGnLBul3l6Udc_i_53IEol2R6CjpoL9MJLEZQo750pyaTOnGA>
    <xmx:B4hwXTTC5oI7XVX6BT1Jm-kZAOwa8B4ZmTbvqP9BsUX7oP_Vjkmo_A>
    <xmx:B4hwXaGdHvnq3xcZ3ahDizMlAjxwfEdCU6WlswcVpTDnExbf4FfDZQ>
    <xmx:B4hwXeyGK36-A7d6lMJZBk4iEBP9mmUowTbonVUncqdCVaq0n2Trwg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 933F9E00A3; Wed,  4 Sep 2019 23:59:03 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-186-gf4cb3c3-fmstable-20190904v1
Mime-Version: 1.0
Message-Id: <3f9d48eb-79ed-42e9-a346-761871e74c98@www.fastmail.com>
In-Reply-To: <20190905011800.16156-1-rashmica.g@gmail.com>
References: <20190905011800.16156-1-rashmica.g@gmail.com>
Date:   Thu, 05 Sep 2019 13:29:29 +0930
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Rashmica Gupta" <rashmica.g@gmail.com>,
        "Linus Walleij" <linus.walleij@linaro.org>
Cc:     "Bartosz Golaszewski" <bgolaszewski@baylibre.com>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Mark Rutland" <mark.rutland@arm.com>,
        "Joel Stanley" <joel@jms.id.au>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: =?UTF-8?Q?Re:_[PATCH_v2_4/4]_gpio:_dt-bindings:_Update_documentation_wit?=
 =?UTF-8?Q?h_ast2600_controllers?=
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Thu, 5 Sep 2019, at 10:48, Rashmica Gupta wrote:
> The ast2600 is a new generation of SoC from ASPEED. Similarly to the
> ast2400 and ast2500, it has a GPIO controller for it's 3.6V GPIO pins.
> Additionally, it has a GPIO controller for 36 1.8V GPIO pins. These
> voltages are fixed and cannot be configured via pinconf, so we have two
> separate drivers for them.

See 3/4 for discussion about the commit message.

> 
> Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>
> ---
>  Documentation/devicetree/bindings/gpio/gpio-aspeed.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt 
> b/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt
> index 7e9b586770b0..cd388797e07c 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt
> @@ -2,7 +2,8 @@ Aspeed GPIO controller Device Tree Bindings
>  -------------------------------------------
>  
>  Required properties:
> -- compatible		: Either "aspeed,ast2400-gpio" or "aspeed,ast2500-gpio"
> +- compatible		: Either "aspeed,ast2400-gpio", "aspeed,ast2500-gpio",
> +					  "aspeed,ast2600-gpio", or "aspeed,ast2600-1-8v-gpio"

See the discussion on patch 3/4 about how we might eliminate the
aspeed,ast2600-1-8v-gpio compatible string.

Also, this patch should be the first in the series and start the subject with
"dt-bindings: gpio: aspeed: ..."

Cheers,

Andrew
