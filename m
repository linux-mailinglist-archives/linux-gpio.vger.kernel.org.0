Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A7AD69FF6
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jul 2019 02:37:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731909AbfGPAhd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jul 2019 20:37:33 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:37725 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730383AbfGPAhc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 Jul 2019 20:37:32 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 941BF218C1;
        Mon, 15 Jul 2019 20:37:31 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute4.internal (MEProxy); Mon, 15 Jul 2019 20:37:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm3; bh=dfqDwOhQ9WBt6ksH+5VF00Qt1urgtHH
        QLOlTLa0F4XU=; b=M9Br2+QfxAgSsZIGKX482YVEKwFDfQHQRPsHJKVASZMdCw3
        1NrDz5ETEsYUfJ0BXZndHbZAUEKsWIu8UTGb515lBQzACUX/tyAht0vIkalMlwSB
        /3f9D19Vs8QYix4J+UjYh2aVYcXiHimUExbeXrnvkemw+S9YoRS0C+huGR2A89hD
        6Iy9izesvxmFspwZFKFRIL6dTStsHaeSSrWAF7uFgrJiFx3gPeCkaO409bH3aQBH
        IQrHOXUJAnorNegQ/AU6zHxDnrhFLPEB99l/WH3bo4a2dGrYqWvHnc0fnNSJ2uom
        Ie2H57UaPK4paMfUrwOI9ywFZ3/Ivx2rmyGr4eg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=dfqDwO
        hQ9WBt6ksH+5VF00Qt1urgtHHQLOlTLa0F4XU=; b=XWunKyj8jEiZAro3Kf0qXc
        ioEEzH97MzpEIom6FeoT4fm2NBQvVdhERU0k06B2Kx52EMpqLTccYaOH9iHRI3fT
        5S8F1eiHRxcni46cj3qYHkEyoK62Ow3kTH+GVLowoVV2S53OaSD7oxRaEuZSS5Zt
        D1zcou2WpCGI+8DcC9FK5qq3JD/IaM5KXbdAOA/3CqzYx82lPUbo0WBk2JNJJgmu
        gKvbISkqbowSft8YTb6PwIcE7AO1FBBDmyIkQFoOsdswDqr+Q/bhErYXwmhaw9ej
        H6z/Ow6SXhGClj5i1QplpQaTF337wFoYpxuNYdcla6RQ0AXXLvfalQYub7o+wNqw
        ==
X-ME-Sender: <xms:SxwtXZNbZfxSQwFBGpSYhNkRXnCZtqB22Cj-z6NaSILw9FD_xFYLSA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrheelgdefgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
    vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
    hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
    ufhiiigvpedt
X-ME-Proxy: <xmx:SxwtXSWOXL8yKJEpa42VbHWWcfSlbo6jQP41r4fixPSybQSzZH9wnw>
    <xmx:SxwtXUjlKT8FKPtKeGkiDDTI12HNmIkC0zOsY87Z-Jm6jVi81jHdKg>
    <xmx:SxwtXTjvoryiWJ00-VsOKIfGbswMi8sjgGoFMRsjl7bKw4xzd6Bp2Q>
    <xmx:SxwtXQZIqd26NqbRVW2wwMl5uas0xqV6T42EqUlWyvKsosL39osAtg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 531A9E01C8; Mon, 15 Jul 2019 20:37:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-731-g19d3b16-fmstable-20190627v1
Mime-Version: 1.0
Message-Id: <3c579d04-1a52-4573-825e-44e2ce25adbd@www.fastmail.com>
In-Reply-To: <20190715223725.12924-1-robh@kernel.org>
References: <20190715223725.12924-1-robh@kernel.org>
Date:   Tue, 16 Jul 2019 10:07:41 +0930
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Rob Herring" <robh@kernel.org>, devicetree@vger.kernel.org,
        "Linus Walleij" <linus.walleij@linaro.org>
Cc:     "Joel Stanley" <joel@jms.id.au>, linux-aspeed@lists.ozlabs.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: =?UTF-8?Q?Re:_[PATCH]_dt-bindings:_pinctrl:_aspeed:_Fix_'compatible'_sch?=
 =?UTF-8?Q?ema_errors?=
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Tue, 16 Jul 2019, at 08:07, Rob Herring wrote:
> The Aspeed pinctl schema have errors in the 'compatible' schema:
> 
> Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml: \
> properties:compatible:enum: ['aspeed', 'ast2400-pinctrl', 'aspeed', 
> 'g4-pinctrl'] has non-unique elements
> Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml: \
> properties:compatible:enum: ['aspeed', 'ast2500-pinctrl', 'aspeed', 
> 'g5-pinctrl'] has non-unique elements
> 
> Flow style sequences have to be quoted if the vales contain ','. Fix
> this by using the more common one line per entry formatting.
> 
> Fixes: 0a617de16730 ("dt-bindings: pinctrl: aspeed: Convert AST2500 
> bindings to json-schema")
> Fixes: 07457937bb5c ("dt-bindings: pinctrl: aspeed: Convert AST2400 
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
>  .../devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml   | 4 +++-
>  .../devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml   | 4 +++-
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git 
> a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml 
> b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml
> index 61a110a7db8a..125599a2dc5e 100644
> --- 
> a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml
> +++ 
> b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml
> @@ -22,7 +22,9 @@ description: |+
>  
>  properties:
>    compatible:
> -    enum: [ aspeed,ast2400-pinctrl, aspeed,g4-pinctrl ]
> +    enum:
> +      - aspeed,ast2400-pinctrl
> +      - aspeed,g4-pinctrl
>  
>  patternProperties:
>    '^.*$':
> diff --git 
> a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml 
> b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
> index cf561bd55128..a464cfa0cba3 100644
> --- 
> a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
> +++ 
> b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
> @@ -22,7 +22,9 @@ description: |+
>  
>  properties:
>    compatible:
> -    enum: [ aspeed,ast2500-pinctrl, aspeed,g5-pinctrl ]
> +    enum:
> +      - aspeed,ast2500-pinctrl
> +      - aspeed,g5-pinctrl
>    aspeed,external-nodes:
>      minItems: 2
>      maxItems: 2
> -- 
> 2.20.1
> 
>
