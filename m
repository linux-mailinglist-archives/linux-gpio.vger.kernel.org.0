Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7728F629330
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Nov 2022 09:20:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232302AbiKOIUy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Nov 2022 03:20:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbiKOIUy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Nov 2022 03:20:54 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5895DCA
        for <linux-gpio@vger.kernel.org>; Tue, 15 Nov 2022 00:20:51 -0800 (PST)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 1008866029B1;
        Tue, 15 Nov 2022 08:20:50 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1668500450;
        bh=aUUEA6STphJLN0we3WA6USGJVGqaKdcNS/Mrg9ypojA=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=FOTNRViJLxY80v4MT3/CxPJW5x5xn/rbKqObs+J137e+5b15EFln/9n3W/te7voL3
         1YGfn+TAdl310+bveDAmMAxw0BX4CYZNRbvhlvrRlvsD91xRHqSd9suHU0bCkP/YJ3
         tnPbICjnyh7j07tYFZb/MtYbRzXUl7xyBnliMC7cjdmAS6YKDQMWlwPGKYrKhlEgw5
         ZFObXDS1eUsdq9JvWfCSWlmXPtivcvKQrv9380Cng90hpGuzM7Dkm5nfYDN6rU5kaI
         VIhEraPLgbPfcpkR/2KjFCXMBv3UnAZl1ppTtGG4vsv/X49LE1Teeu/uZX/GSs6VQe
         eoib6Lv+66x0Q==
Message-ID: <cbada69f-2b67-f61b-dbd7-152098160a1f@collabora.com>
Date:   Tue, 15 Nov 2022 09:20:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH] pinctrl: mediatek: Export debounce time tables
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
References: <20221115081340.2180495-1-linus.walleij@linaro.org>
Content-Language: en-US
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221115081340.2180495-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Il 15/11/22 09:13, Linus Walleij ha scritto:
> The kernel test robot complains that in certain combinations
> when building the Mediatek drivers as modules we lack some
> debounce table symbols, so export them.
> 
> Fixes: e1ff91f9d230 ("pinctrl: mediatek: Fix EINT pins input debounce time configuration")
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

I'm sorry, I didn't notice :-(

Will be more careful next time.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/pinctrl/mediatek/mtk-eint.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
> index e94ee802c603..65d312967619 100644
> --- a/drivers/pinctrl/mediatek/mtk-eint.c
> +++ b/drivers/pinctrl/mediatek/mtk-eint.c
> @@ -52,14 +52,17 @@ static const struct mtk_eint_regs mtk_generic_eint_regs = {
>   const unsigned int debounce_time_mt2701[] = {
>   	500, 1000, 16000, 32000, 64000, 128000, 256000, 0
>   };
> +EXPORT_SYMBOL_GPL(debounce_time_mt2701);
>   
>   const unsigned int debounce_time_mt6765[] = {
>   	125, 250, 500, 1000, 16000, 32000, 64000, 128000, 256000, 512000, 0
>   };
> +EXPORT_SYMBOL_GPL(debounce_time_mt6765);
>   
>   const unsigned int debounce_time_mt6795[] = {
>   	500, 1000, 16000, 32000, 64000, 128000, 256000, 512000, 0
>   };
> +EXPORT_SYMBOL_GPL(debounce_time_mt6795);
>   
>   static void __iomem *mtk_eint_get_offset(struct mtk_eint *eint,
>   					 unsigned int eint_num,

