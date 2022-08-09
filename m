Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8118E58E0EA
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Aug 2022 22:19:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232070AbiHIUTx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Aug 2022 16:19:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245489AbiHIUTw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Aug 2022 16:19:52 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCC04255BE
        for <linux-gpio@vger.kernel.org>; Tue,  9 Aug 2022 13:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
        Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
        Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
        In-Reply-To:References; bh=r4N9SdQW/dOC2LPni9a9r8+QuY1I2hw3aE3Gq7lwiqY=; b=m+
        wChraoLykeN2Twxl/eUymviSA3vhA6L38feaKGDZM+ke+lbW+Qpr/OoXWywZuBMS5NLWX7Cef1SVU
        i8efglOD4X13kzr4kOtPR4wVn5pNUK0kdPOf80yK/2cqTR2vruPoG/M/WykexCFV/mkrbY7r8EwWT
        s+yGXWPlsaZPWqg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1oLVhN-00CsMu-V9; Tue, 09 Aug 2022 22:19:33 +0200
Date:   Tue, 9 Aug 2022 22:19:33 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Cc:     Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 1/4] pinctrl: armada-37xx: Add missing GPIO-only pins
Message-ID: <YvLBVdn7hQydeobO@lunn.ch>
References: <20220805122202.23174-1-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220805122202.23174-1-pali@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 05, 2022 at 02:21:59PM +0200, Pali Rohár wrote:
> gpio1_5 and gpio2_2 are GPIO-only pins. Add them into MPP groups table
> so they are properly exported as valid pin numbers.
> 
> Fixes: 87466ccd9401 ("pinctrl: armada-37xx: Add pin controller support for Armada 37xx")
> Signed-off-by: Pali Rohár <pali@kernel.org>
> ---
>  drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
> index a140b6bfbfaa..2b44c634ccb5 100644
> --- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
> +++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
> @@ -122,6 +122,16 @@ struct armada_37xx_pinctrl {
>  		.funcs = {_func1, _func2}	\
>  	}
>  
> +#define PIN_GRP_GPIO_0(_name, _start, _nr)	\

The naming of these macros are a bit odd, but this does not make it
any worse.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
