Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFF7E69FF1
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jul 2019 02:36:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731909AbfGPAgx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jul 2019 20:36:53 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:38359 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730383AbfGPAgx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 Jul 2019 20:36:53 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 1E8482177A;
        Mon, 15 Jul 2019 20:36:52 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute4.internal (MEProxy); Mon, 15 Jul 2019 20:36:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm3; bh=XWZLz+txdqRGTGaK1dZN+f7z4rUZi4Y
        KqrDw0xfe4HM=; b=jjqyglpudjzsVZLhnWYx9xgxywyjAovUnur4o64PIiE6/oD
        bWfRfH8iiS9ycGEwevHjy+kbgjyu9pUpzn+mCUPRAaS1VhEZ73Lo+ujf3f4XpbzQ
        l4u05mmZ20sCCjd2+KqBwldWeIkTVKcqJIexOK34ChugLII8CANTvCdHKhc5+TFV
        S7+ivSTItRNt3VBS8XDvKhaKaCwXydCuvKZjY287WLETJw3O1eMYT82si4f2ynFv
        79nkZsIerPn6hR0FEwOYtO720zAgCJ0jvje2zHwbjNYCUXAe6yCXsn7QTO8XZhzR
        j2U/3I+V75KNy6/h5HPouB9xa/8o2tctdpUytLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=XWZLz+
        txdqRGTGaK1dZN+f7z4rUZi4YKqrDw0xfe4HM=; b=W3Iw272ICRf0EDD/DryRQz
        M5dgPRk1xQvHrQs93w1bkKWbZgZn1vTF+9PV/ExXAAHxsN8N1Wx8lN8aJa4+WpuC
        fwbPfdOwBd56RcFprff+ERt8NK48SyNzd1nyJlkxcoqK1PA/gpKvjpb3FPwjHgBA
        5lUCnbumFehUxGcoKzUm7HDVPmzaf5fyCwCk5F3WddYYpDu1VC9tNfxrw9jELTjH
        1xuWAFeWWASs+ayB7EeABPtY+jAsZR4trJc0bpGh8rr9mMffRxDR09MZGHIkfxvN
        WiPdQEJAN4uaNvzSj85q5b/2V8joyK5I/zbIVsUUBmRnS0n7qB4syHO+LbTdGo6A
        ==
X-ME-Sender: <xms:IxwtXf77jaxpTbBAQIqoOaKT_tPfi6eUud37XX8Gz4Hh5OqWyYH6yQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrheelgdefgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
    vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
    hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
    ufhiiigvpedt
X-ME-Proxy: <xmx:IxwtXSYv0so1UDrxrgCP1PBLZvAeIFb_V_kjuVYMHzyqQstLt5UPCw>
    <xmx:IxwtXShNV6dv1iDjgpJ93yiW76yzP8ZaamiNxj9NBCBzLf8ltayVmA>
    <xmx:IxwtXdaxzh5FPwQrKjuHo-IzB93hG52ZGB7Uw84OjqtWpB0EgeUxXg>
    <xmx:JBwtXVuV7atOVYa2dOZe8UAscvlNOzzmLO_aKGt7mGM0b_WwnKk3qA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id D358CE00CC; Mon, 15 Jul 2019 20:36:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-731-g19d3b16-fmstable-20190627v1
Mime-Version: 1.0
Message-Id: <0b4f89e7-a60f-4978-ba9c-1e04c551b1f1@www.fastmail.com>
In-Reply-To: <20190715224841.6771-1-robh@kernel.org>
References: <20190715224841.6771-1-robh@kernel.org>
Date:   Tue, 16 Jul 2019 10:07:01 +0930
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Rob Herring" <robh@kernel.org>, devicetree@vger.kernel.org,
        "Linus Walleij" <linus.walleij@linaro.org>
Cc:     "Joel Stanley" <joel@jms.id.au>, linux-aspeed@lists.ozlabs.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: pinctrl: aspeed: Fix AST2500 example errors
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Tue, 16 Jul 2019, at 08:18, Rob Herring wrote:
> The schema examples are now validated against the schema itself. The
> AST2500 pinctrl schema has a couple of errors:
> 
> Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.example.dt.yaml: \
> example-0: $nodename:0: 'example-0' does not match 
> '^(bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
> Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.example.dt.yaml: \
> pinctrl: aspeed,external-nodes: [[1, 2]] is too short
> 
> Fixes: 0a617de16730 ("dt-bindings: pinctrl: aspeed: Convert AST2500 
> bindings to json-schema")
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: linux-aspeed@lists.ozlabs.org
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  .../devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml  | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git 
> a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml 
> b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
> index a464cfa0cba3..3e6d85318577 100644
> --- 
> a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
> +++ 
> b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
> @@ -76,9 +76,6 @@ required:
>  
>  examples:
>    - |
> -    compatible = "simple-bus";
> -    ranges;
> -
>      apb {
>          compatible = "simple-bus";
>          #address-cells = <1>;
> @@ -91,7 +88,7 @@ examples:
>  
>              pinctrl: pinctrl {
>                  compatible = "aspeed,g5-pinctrl";
> -                aspeed,external-nodes = <&gfx &lhc>;
> +                aspeed,external-nodes = <&gfx>, <&lhc>;
>  
>                  pinctrl_i2c3_default: i2c3_default {
>                      function = "I2C3";
> -- 
> 2.20.1
> 
>
