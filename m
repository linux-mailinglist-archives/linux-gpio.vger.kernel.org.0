Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 516772DDCC6
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Dec 2020 03:05:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732024AbgLRCE6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Dec 2020 21:04:58 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:39681 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732022AbgLRCE6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 17 Dec 2020 21:04:58 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id A715A5C00B8;
        Thu, 17 Dec 2020 21:04:11 -0500 (EST)
Received: from imap2 ([10.202.2.52])
  by compute3.internal (MEProxy); Thu, 17 Dec 2020 21:04:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm1; bh=Y7Ew9qU645KkFKnRLSkyFUJqNP2X5xh
        QRkebZl8XCiU=; b=aL0EacX61Pr3T4+SpRWJKI2tm3QUTLmXm86Ub3qf4I/DFa9
        ThfSSh46NjTB4Wc4WuG2pdRTpELkjmuYRqMYK/G5Q6JYkl2pSsxC0Rsu1XgrjHeT
        665nVRfQWp9xKl1ijCLtlTrUYrZD73XvCarK7MjlHSFJ4u+ie+DQMeb3BQjdjTuL
        X7aP0Mb4O8pLK8c3cPXROFeZwZXC7uDTwYAxjzeQgn6h7DOuHkxx7LFF1soE7c5O
        Uug7v15f0i2Zw/D6S7d4TgfEyfQuAqMvfGWLgVHiyxJXNwat3DGHXoIqaNueLzjv
        PEHfwdaD84qqE/TLBbz1dcHC15jCk2sEgBLsK1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Y7Ew9q
        U645KkFKnRLSkyFUJqNP2X5xhQRkebZl8XCiU=; b=KX6/MxJ/ytJWlhucfC4zDD
        m0It9sEUpnoh8k2CdmOxJGnzsIcEtJJxf6CB3wGOvv7in+HSFCcx2ERhLo+mVuvT
        rh0TvFHRvZYqvHyB/hj533GZ3Os527JhCCnlQgx4Y1z15+LKpCs2xsbBEN+kIYdn
        XhDJbY2iMVOY24FTSmRiZmfjlqFsL6MJoVX2gMT3oEXy9MKN4I5dwLP82rBBRelx
        x7DnndzCIGXcdM0al9cbohtdP46cjxgewt3eT+NZMT+SSvCiQJc1nw+BUB8Q8yw2
        tskFHiZUDQPzc7ZQdZEGUtQ1IBzykfNptndpDFDEso1CuOpDzDHLhYGSrkX2RHtw
        ==
X-ME-Sender: <xms:Gg7cX5cX-dMhX_bms_DjxSRFobjIEC2ZdczmNbWEWSQpDQgayN2Nog>
    <xme:Gg7cX3PRagXEMKxisyDFtD6qOid4l1YX3S02QVKIFS6ipc-uHgqj-DsqtvaNBDRik
    nXsVH3FZyK3__1eKQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudelhedggedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
    grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
    hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:Gg7cXyjYDA5oqkIZwsPrPKByRErYGgO2lB8mK-6L7nWG-99opao0Iw>
    <xmx:Gg7cXy9lb7801al5Z6-FzsRDUDvhZcyqSz5Ohnb0yNB8kjI5Iq740g>
    <xmx:Gg7cX1sT7ty_d9zLYPq8UEn5Z3blXm1ZKX2QZxSiEnLfEASfIVaz3w>
    <xmx:Gw7cX5iQR8A0nZ5TJBDG9u75YzMnWpmM7eEWGQGFoNK-jHCmg9lKqA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id F01A1E0505; Thu, 17 Dec 2020 21:04:08 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.1-61-gb52c239-fm-20201210.001-gb52c2396
Mime-Version: 1.0
Message-Id: <890073c1-3905-4602-83f7-b823c4a4ee13@www.fastmail.com>
In-Reply-To: <20201217024912.3198-1-billy_tsai@aspeedtech.com>
References: <1e823780-b1ef-42dd-bb60-321b4d482d31@www.fastmail.com>
 <20201217024912.3198-1-billy_tsai@aspeedtech.com>
Date:   Fri, 18 Dec 2020 12:33:50 +1030
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Billy Tsai" <billy_tsai@aspeedtech.com>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        "Joel Stanley" <joel@jms.id.au>, linux-aspeed@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     BMC-SW@aspeedtech.com
Subject: Re: [PATCH v3] driver: aspeed: g6: Fix PWMG0 pinctrl setting
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Thu, 17 Dec 2020, at 13:19, Billy Tsai wrote:
> The SCU offset for signal PWM8 in group PWM8G0 is wrong, fix it from
> SCU414 to SCU4B4.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

Thanks Billy.

> ---
>  drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c 
> b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> index b673a44ffa3b..aa53e9d3489b 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> @@ -367,7 +367,7 @@ FUNC_GROUP_DECL(RMII4, F24, E23, E24, E25, C25, 
> C24, B26, B25, B24);
>  
>  #define D22 40
>  SIG_EXPR_LIST_DECL_SESG(D22, SD1CLK, SD1, SIG_DESC_SET(SCU414, 8));
> -SIG_EXPR_LIST_DECL_SEMG(D22, PWM8, PWM8G0, PWM8, SIG_DESC_SET(SCU414, 8));
> +SIG_EXPR_LIST_DECL_SEMG(D22, PWM8, PWM8G0, PWM8, SIG_DESC_SET(SCU4B4, 8));
>  PIN_DECL_2(D22, GPIOF0, SD1CLK, PWM8);
>  GROUP_DECL(PWM8G0, D22);
>  
> -- 
> 2.17.1
> 
>
