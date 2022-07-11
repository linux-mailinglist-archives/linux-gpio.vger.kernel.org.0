Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F1FD563409
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Jul 2022 15:07:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235162AbiGANH5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Jul 2022 09:07:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234234AbiGANH5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Jul 2022 09:07:57 -0400
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBCAF5073D;
        Fri,  1 Jul 2022 06:07:52 -0700 (PDT)
Received: from p508fd39e.dip0.t-ipconnect.de ([80.143.211.158] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <heiko@sntech.de>)
        id 1o7GN7-0001bD-JW; Fri, 01 Jul 2022 15:07:45 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org
Cc:     Samuel Holland <samuel@sholland.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Maxime Ripard <mripard@kernel.org>, Ondrej Jirman <x@xff.cz>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
        Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 4/6] pinctrl: sunxi: Refactor register/offset calculation
Date:   Fri, 01 Jul 2022 15:07:45 +0200
Message-ID: <20243196.sWSEgdgrri@phil>
In-Reply-To: <20220626021148.56740-5-samuel@sholland.org>
References: <20220626021148.56740-1-samuel@sholland.org> <20220626021148.56740-5-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,T_SPF_HELO_TEMPERROR autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am Sonntag, 26. Juni 2022, 04:11:45 CEST schrieb Samuel Holland:
> Starting with the D1/D1s/T113 SoC, Allwinner changed the layout of the
> pinctrl registers. This new layout widens the drive level field, which
> affects the pull register offset and the overall bank size.
> 
> As a first step to support this, combine the register and offset
> calculation functions, and refactor the math to depend on one constant
> for field widths instead of three. This minimizes the code size impact
> of making some of the factors dynamic.
> 
> While rewriting these functions, move them to the implementation file,
> since that is the only file where they are used. And make the comment
> more generic, without mentioning specific offsets/sizes.
> 
> The callers are updated to expect a shifted mask, and to use consistent
> terminology (reg/shift/mask/val).
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

On a D1-Nezha
Tested-by: Heiko Stuebner <heiko@sntech.de>

Change also looks good
Reviewed-by: Heiko Stuebner <heiko@sntech.de>


