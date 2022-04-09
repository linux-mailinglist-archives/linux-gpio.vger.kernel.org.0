Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 571794FA1D7
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Apr 2022 04:53:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230049AbiDICzv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Apr 2022 22:55:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229996AbiDICzv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Apr 2022 22:55:51 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B6BB1F51AD;
        Fri,  8 Apr 2022 19:53:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E1F0DB82DEE;
        Sat,  9 Apr 2022 02:53:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16563C385A3;
        Sat,  9 Apr 2022 02:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649472821;
        bh=WCQR2N7KIiL4SwaxODSB6/18lPomnZZuU2D6eNxjWI0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tdVbdcQjW6IlJaRg3fn0/iXxXq5DKM7DY39o4blrym295Cktbw9Nudx7Nc5oMj3MW
         gWVO71yc6zM0BVYhWxdvPZF1HdDl1T/xp5gnKfW/uNJwPrbTqJY9Y4QqNPemMt4eDq
         9cdf5EyD3vSYYlyJsxm8ahaiYEPfvj6WQJM6+ytyB7zdFooPYV5H8ay/V4mWDF9dlv
         TpRkc4XvT44IM5qU8Awb7myoxNX34RHaAYGXxWj4GF+tTNBl+4boUQTc2JKirUomb9
         pf7qpNK7/jxO6ms6I5rL9JQPzUZz1M8tR8ooDgFccq+DPTw6f2yu02nD93vqgwn4Ch
         loTv0jZYpukIw==
Date:   Sat, 9 Apr 2022 10:53:34 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Stefan Agner <stefan@agner.ch>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] ARM: dts: imx7s: fix iomuxc_lpsr node name
Message-ID: <20220409025334.GX129381@dragon>
References: <20220303150653.1903910-1-alexander.stein@ew.tq-group.com>
 <20220303150653.1903910-2-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220303150653.1903910-2-alexander.stein@ew.tq-group.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 03, 2022 at 04:06:53PM +0100, Alexander Stein wrote:
> Schema requires the node being named 'pinctrl'.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

I expect patch #1 would go through pinctrl tree, so only applied this
one.

Shawn

> ---
>  arch/arm/boot/dts/imx7s.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
> index 5af6d58666f4..008e3da460f1 100644
> --- a/arch/arm/boot/dts/imx7s.dtsi
> +++ b/arch/arm/boot/dts/imx7s.dtsi
> @@ -446,7 +446,7 @@ wdog4: watchdog@302b0000 {
>  				status = "disabled";
>  			};
>  
> -			iomuxc_lpsr: iomuxc-lpsr@302c0000 {
> +			iomuxc_lpsr: pinctrl@302c0000 {
>  				compatible = "fsl,imx7d-iomuxc-lpsr";
>  				reg = <0x302c0000 0x10000>;
>  				fsl,input-sel = <&iomuxc>;
> -- 
> 2.25.1
> 
