Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EEED1EAF73
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jun 2020 21:06:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728144AbgFATGk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Jun 2020 15:06:40 -0400
Received: from gateway32.websitewelcome.com ([192.185.145.1]:39281 "EHLO
        gateway32.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726125AbgFATGj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Jun 2020 15:06:39 -0400
X-Greylist: delayed 1225 seconds by postgrey-1.27 at vger.kernel.org; Mon, 01 Jun 2020 15:06:38 EDT
Received: from cm11.websitewelcome.com (cm11.websitewelcome.com [100.42.49.5])
        by gateway32.websitewelcome.com (Postfix) with ESMTP id 329E861F1BE
        for <linux-gpio@vger.kernel.org>; Mon,  1 Jun 2020 13:46:10 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id fpRqjYEOKSl8qfpRqjmk30; Mon, 01 Jun 2020 13:46:10 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=i8OiqMOzFDC/YmBf9XdSjuS/5OCBgcpIubHC+5FY6Xw=; b=qBprnfP7tUKaUUsr/gGVVmmxNj
        U7kMgv6M2fIGGT0QTQtpeCJPLnl8iChcqi016SsLMXGG+YaCyeSkmyiBOcR12/OUp2924TvQCAjYt
        pemacE2uxIlrgKY4YbiDSaBeYqpJ6I5i+TsdeISvq37hCvRCcnJNAIrGTFS4NgMb49TgOhCAWKa0e
        K3YycJ1xq8DoYxX4ENyGMheWXljVnbg70JiVjzwl+grgDIIuoZrxvinmuj1DtaNyeg4OYc4aUcMQZ
        yeH8FP7NuEWDcJEIlA+F3UC4pUUktK58jGkpdIWP9bLNC6jdDk+kanEYNLerNeQOzIjXf5zo1snbh
        BOsQ+G0A==;
Received: from [189.207.59.248] (port=50148 helo=[192.168.15.6])
        by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <gustavo@embeddedor.com>)
        id 1jfpRp-00323v-Kc; Mon, 01 Jun 2020 13:46:09 -0500
Subject: Re: [PATCH] pinctrl-single: fix pcs_parse_pinconf() return val
To:     Drew Fustini <drew@beagleboard.org>,
        Tony Lindgren <tony@atomide.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>
References: <20200531204147.GA664833@x1>
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Autocrypt: addr=gustavo@embeddedor.com; keydata=
 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
 AP7RWS474w==
Message-ID: <5a8e58b6-d81e-cfde-db78-92d33aa2d523@embeddedor.com>
Date:   Mon, 1 Jun 2020 13:51:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200531204147.GA664833@x1>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 189.207.59.248
X-Source-L: No
X-Exim-ID: 1jfpRp-00323v-Kc
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.15.6]) [189.207.59.248]:50148
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 7
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 5/31/20 15:41, Drew Fustini wrote:
> This patch causes pcs_parse_pinconf() to return an error when no
> pinctrl_map is added.  The current behavior is to return 0 when
> !PCS_HAS_PINCONF or !nconfs.  Thus pcs_parse_one_pinctrl_entry()
> incorrectly assumes that a map was added and sets num_maps = 2.
> 
> Analysis:
> =========
> The function pcs_parse_one_pinctrl_entry() calls pcs_parse_pinconf()
> if PCS_HAS_PINCONF is enabled.  The function pcs_parse_pinconf()
> returns 0 to indicate there was no error and num_maps is then set to 2:
> 
>  980 static int pcs_parse_one_pinctrl_entry(struct pcs_device *pcs,
>  981                                                 struct device_node *np,
>  982                                                 struct pinctrl_map **map,
>  983                                                 unsigned *num_maps,
>  984                                                 const char **pgnames)
>  985 {
> <snip>
> 1053         (*map)->type = PIN_MAP_TYPE_MUX_GROUP;
> 1054         (*map)->data.mux.group = np->name;
> 1055         (*map)->data.mux.function = np->name;
> 1056
> 1057         if (PCS_HAS_PINCONF && function) {
> 1058                 res = pcs_parse_pinconf(pcs, np, function, map);
> 1059                 if (res)
> 1060                         goto free_pingroups;
> 1061                 *num_maps = 2;
> 1062         } else {
> 1063                 *num_maps = 1;
> 1064         }
> 
> However, pcs_parse_pinconf() will also return 0 if !PCS_HAS_PINCONF or
> !nconfs.  I believe these conditions should indicate that no map was
> added by returning non-zero. Otherwise pcs_parse_one_pinctrl_entry()
> will set num_maps = 2 even though no maps were successfully added, as
> it does not reach "m++" on line 940:
> 
>  895 static int pcs_parse_pinconf(struct pcs_device *pcs, struct device_node *np,
>  896                              struct pcs_function *func,
>  897                              struct pinctrl_map **map)
>  898
>  899 {
>  900         struct pinctrl_map *m = *map;
> <snip>
>  917         /* If pinconf isn't supported, don't parse properties in below. */
>  918         if (!PCS_HAS_PINCONF)
>  919                 return 0;
>  920
>  921         /* cacluate how much properties are supported in current node */
>  922         for (i = 0; i < ARRAY_SIZE(prop2); i++) {
>  923                 if (of_find_property(np, prop2[i].name, NULL))
>  924                         nconfs++;
>  925         }
>  926         for (i = 0; i < ARRAY_SIZE(prop4); i++) {
>  927                 if (of_find_property(np, prop4[i].name, NULL))
>  928                         nconfs++;
>  929         }
>  930         if (!nconfs)
>  919                 return 0;
>  932
>  933         func->conf = devm_kcalloc(pcs->dev,
>  934                                   nconfs, sizeof(struct pcs_conf_vals),
>  935                                   GFP_KERNEL);
>  936         if (!func->conf)
>  937                 return -ENOMEM;
>  938         func->nconfs = nconfs;
>  939         conf = &(func->conf[0]);
>  940         m++;
> 
> This situtation will cause a boot failure [0] on the BeagleBone Black
> (AM3358) when am33xx_pinmux node in arch/arm/boot/dts/am33xx-l4.dtsi
> has compatible = "pinconf-single" instead of "pinctrl-single".
> 
> The patch fixes this issue by returning -ENOSUPP when !PCS_HAS_PINCONF
> or !nconfs, so that pcs_parse_one_pinctrl_entry() will know that no
> map was added.
> 
> [0] https://lore.kernel.org/linux-omap/20200529175544.GA3766151@x1/
> 

Maybe add this Fixes tag here:

Fixes: 9dddb4df90d1 ("pinctrl: single: support generic pinconf")

--
Gustavo

> Signed-off-by: Drew Fustini <drew@beagleboard.org>
> ---
>  drivers/pinctrl/pinctrl-single.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
> index 1e0614daee9b..18a02cd0c701 100644
> --- a/drivers/pinctrl/pinctrl-single.c
> +++ b/drivers/pinctrl/pinctrl-single.c
> @@ -916,7 +916,7 @@ static int pcs_parse_pinconf(struct pcs_device *pcs, struct device_node *np,
>  
>  	/* If pinconf isn't supported, don't parse properties in below. */
>  	if (!PCS_HAS_PINCONF)
> -		return 0;
> +		return -ENOTSUPP; /* do not return 0 as no map added */
>  
>  	/* cacluate how much properties are supported in current node */
>  	for (i = 0; i < ARRAY_SIZE(prop2); i++) {
> @@ -928,7 +928,7 @@ static int pcs_parse_pinconf(struct pcs_device *pcs, struct device_node *np,
>  			nconfs++;
>  	}
>  	if (!nconfs)
> -		return 0;
> +		return -ENOTSUPP; /* do not return 0 as no map added */
>  
>  	func->conf = devm_kcalloc(pcs->dev,
>  				  nconfs, sizeof(struct pcs_conf_vals),
> 
