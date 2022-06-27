Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0655555C1C7
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jun 2022 14:45:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236458AbiF0OpF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Jun 2022 10:45:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236155AbiF0OpE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jun 2022 10:45:04 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD007DEF4
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jun 2022 07:45:02 -0700 (PDT)
Received: from notapiano (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: nfraprado)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id A9ADC660183A;
        Mon, 27 Jun 2022 15:45:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1656341101;
        bh=DidxRA9FuVtzSs+FsqyP8KjaAefBlqvwYqnZS4BeJL4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QnQBDu05ERdYuHPycsRhgHjKUVE0wnIY9QF+s63mRVwHFufi8F/yNiKK8C6NYCHOp
         57nQzfTruH4ZahuDFAaia/vsWk8e86OCc5Qnmdu6pJfcpiF1AIFZ1L2usBn2McY/g6
         GvXylg5Gf8rhswDqSURui83hbkmSzeRDSd3O1WCnVmneQCBf8t+2ZJnrHTXqyqZB84
         qgIgySAubaSXfEzf1TlhFR1WyPdS7l4MMhOM0Zu707ROfz9cJMuCICMsRAoxNoNkJT
         Wcxe9KwhnOQe2rUM0nTxO6x3ljuGJ7cAQy7s4FzZ6tGH0UcLuONGhwF8VXhLgpM+nV
         /IWJBhVjr6QJg==
Date:   Mon, 27 Jun 2022 10:44:57 -0400
From:   =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado 
        <nfraprado@collabora.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, Guodong Liu <guodong.liu@mediatek.com>
Subject: Re: [PATCH] pinctrl: mediatek: mt8192: Fix compile warnings
Message-ID: <20220627144457.esdwcma4wibtc2jm@notapiano>
References: <20220626235743.87821-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220626235743.87821-1-linus.walleij@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 27, 2022 at 01:57:43AM +0200, Linus Walleij wrote:
> After applying patches I get these warnings:
> 
>   drivers/pinctrl/mediatek/pinctrl-mt8192.c:1302:56:
>   warning: "/*" within comment [-Wcomment]
>   drivers/pinctrl/mediatek/pinctrl-mt8192.c:1362:56:
>   warning: "/*" within comment [-Wcomment]
> 
> Something is wrong with the missing end-slashes. Add them.
> 
> Cc: Guodong Liu <guodong.liu@mediatek.com>
> Cc: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Hi,

yes, this issue was noticed during review [1], and fixed on the following
version [2], but since the commit before the correction was applied, this fix
LGTM.

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

[1] https://lore.kernel.org/all/20220624152926.76hvymguryhfv4sq@notapiano
[2] https://lore.kernel.org/all/20220626043955.32756-4-guodong.liu@mediatek.com/

> ---
>  drivers/pinctrl/mediatek/pinctrl-mt8192.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8192.c b/drivers/pinctrl/mediatek/pinctrl-mt8192.c
> index a66394c6f443..78c02b7c81f0 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mt8192.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mt8192.c
> @@ -1299,15 +1299,15 @@ static const unsigned int mt8192_pull_type[] = {
>  	MTK_PULL_PU_PD_TYPE,/*94*/ MTK_PULL_PU_PD_TYPE,/*95*/
>  	MTK_PULL_PU_PD_TYPE,/*96*/ MTK_PULL_PU_PD_TYPE,/*97*/
>  	MTK_PULL_PU_PD_TYPE,/*98*/ MTK_PULL_PU_PD_TYPE,/*99*/
> -	MTK_PULL_PU_PD_TYPE,/*100* MTK_PULL_PU_PD_TYPE,/*101*/
> -	MTK_PULL_PU_PD_TYPE,/*102* MTK_PULL_PU_PD_TYPE,/*103*/
> -	MTK_PULL_PU_PD_TYPE,/*104* MTK_PULL_PU_PD_TYPE,/*105*/
> -	MTK_PULL_PU_PD_TYPE,/*106* MTK_PULL_PU_PD_TYPE,/*107*/
> -	MTK_PULL_PU_PD_TYPE,/*108* MTK_PULL_PU_PD_TYPE,/*109*/
> -	MTK_PULL_PU_PD_TYPE,/*110* MTK_PULL_PU_PD_TYPE,/*111*/
> -	MTK_PULL_PU_PD_TYPE,/*112* MTK_PULL_PU_PD_TYPE,/*113*/
> -	MTK_PULL_PU_PD_TYPE,/*114* MTK_PULL_PU_PD_TYPE,/*115*/
> -	MTK_PULL_PU_PD_TYPE,/*116* MTK_PULL_PU_PD_TYPE,/*117*/
> +	MTK_PULL_PU_PD_TYPE,/*100*/ MTK_PULL_PU_PD_TYPE,/*101*/
> +	MTK_PULL_PU_PD_TYPE,/*102*/ MTK_PULL_PU_PD_TYPE,/*103*/
> +	MTK_PULL_PU_PD_TYPE,/*104*/ MTK_PULL_PU_PD_TYPE,/*105*/
> +	MTK_PULL_PU_PD_TYPE,/*106*/ MTK_PULL_PU_PD_TYPE,/*107*/
> +	MTK_PULL_PU_PD_TYPE,/*108*/ MTK_PULL_PU_PD_TYPE,/*109*/
> +	MTK_PULL_PU_PD_TYPE,/*110*/ MTK_PULL_PU_PD_TYPE,/*111*/
> +	MTK_PULL_PU_PD_TYPE,/*112*/ MTK_PULL_PU_PD_TYPE,/*113*/
> +	MTK_PULL_PU_PD_TYPE,/*114*/ MTK_PULL_PU_PD_TYPE,/*115*/
> +	MTK_PULL_PU_PD_TYPE,/*116*/ MTK_PULL_PU_PD_TYPE,/*117*/
>  	MTK_PULL_PU_PD_RSEL_TYPE,/*118*/ MTK_PULL_PU_PD_RSEL_TYPE,/*119*/
>  	MTK_PULL_PU_PD_RSEL_TYPE,/*120*/ MTK_PULL_PU_PD_RSEL_TYPE,/*121*/
>  	MTK_PULL_PU_PD_RSEL_TYPE,/*122*/ MTK_PULL_PU_PD_RSEL_TYPE,/*123*/
> -- 
> 2.36.1
> 
