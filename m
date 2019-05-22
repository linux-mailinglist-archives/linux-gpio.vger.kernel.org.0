Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01E9825B1D
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2019 02:22:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727976AbfEVAW5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 May 2019 20:22:57 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:60062 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725797AbfEVAW5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 May 2019 20:22:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=Hm8KAS51FJgM/544BU4ZzW/jeZKKGVPb5yRLDzOERlY=; b=leU35Iybl8T8ZH3/2J0Fayieg
        mN0/yeeBqOYuC1ZYQEHNHy+tTiuO6vwwKgp2pusxI1PCN1xOmyoCip2vAGQ82/HtdWs+jY8Knha44
        GHz3WT4Gy/EWueH1O3bpM7XJ//tOIrptKYN2Pz9+Akp+IWOK39Emv9W9+3koZlzWlugA2xK4evtx7
        CHq/WoxfPmVWTtmTub4WBz/x8vf+AAu/4nbu876cLK+Y1g6Ig5gouPbuMZis2Ds5Hi8Aey6EqEoMZ
        uB45sUVwuTSVK1YPNx7l4oP/p6p2esbXtZ8Q1Li5u5A3J6a91keIpH8v8w1q/bV29aqVUvSEv+FzY
        B7F7y1Dew==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hTF1v-0004pF-Gz; Wed, 22 May 2019 00:22:51 +0000
Subject: Re: [PATCH] pinctrl: stmfx: Fix compile issue when CONFIG_OF_GPIO is
 not defined
To:     Amelie Delaunay <amelie.delaunay@st.com>,
        Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com, kbuild-all@01.org
References: <1558338735-8444-1-git-send-email-amelie.delaunay@st.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <381dcecc-2ca9-c44f-5a83-a293372ecd1e@infradead.org>
Date:   Tue, 21 May 2019 17:22:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1558338735-8444-1-git-send-email-amelie.delaunay@st.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 5/20/19 12:52 AM, Amelie Delaunay wrote:
> When CONFIG_GPIO_OF is not defined, struct gpio_chip 'of_node' member does
> not exist:
> drivers/pinctrl/pinctrl-stmfx.c: In function 'stmfx_pinctrl_probe':
> drivers/pinctrl/pinctrl-stmfx.c:652:17: error: 'struct gpio_chip' has no member named 'of_node'
>      pctl->gpio_chip.of_node = np;
> 
> Fixes: 1490d9f841b1 ("pinctrl: Add STMFX GPIO expander Pinctrl/GPIO driver")
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>

This is good as far as it goes, but I am also seeing a build error in
pinctrl-stmfx.c when CONFIG_OF is not set/enabled (randconfig):

../drivers/pinctrl/pinctrl-stmfx.c:409:20: error: ‘pinconf_generic_dt_node_to_map_pin’ undeclared here (not in a function)
  .dt_node_to_map = pinconf_generic_dt_node_to_map_pin,
                    ^

> ---
>  drivers/pinctrl/pinctrl-stmfx.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
> index eba872c..bb64aa0 100644
> --- a/drivers/pinctrl/pinctrl-stmfx.c
> +++ b/drivers/pinctrl/pinctrl-stmfx.c
> @@ -648,7 +648,9 @@ static int stmfx_pinctrl_probe(struct platform_device *pdev)
>  	pctl->gpio_chip.base = -1;
>  	pctl->gpio_chip.ngpio = pctl->pctl_desc.npins;
>  	pctl->gpio_chip.can_sleep = true;
> +#ifdef CONFIG_OF_GPIO
>  	pctl->gpio_chip.of_node = np;
> +#endif
>  	pctl->gpio_chip.need_valid_mask = true;
>  
>  	ret = devm_gpiochip_add_data(pctl->dev, &pctl->gpio_chip, pctl);
> 


-- 
~Randy
