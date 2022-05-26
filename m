Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F565535516
	for <lists+linux-gpio@lfdr.de>; Thu, 26 May 2022 22:52:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240833AbiEZUwk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 26 May 2022 16:52:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236629AbiEZUwj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 26 May 2022 16:52:39 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F320663FC
        for <linux-gpio@vger.kernel.org>; Thu, 26 May 2022 13:52:38 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id f21so5081303ejh.11
        for <linux-gpio@vger.kernel.org>; Thu, 26 May 2022 13:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zjJ5UCoJeEEihDN4cVR/wdYe+l5GkBSpbVBb3aSL4no=;
        b=fmCZGiSEap2Sdg2Jlb5iXaZ7JVSkwbh+dArG/YZsXXY674HMsPQBqz7nF3kI/a1vi2
         h1KsAfji5yU3wvX8nswk6Y+k+0jsVf9GH4Tv9zLclptTrrAe/bOGy8qQMrfPompfJcxx
         OHgOf2qjCrCXP1lCTzZEqW9quldpOgto7x6K1UHu8F1TF/e6g2lj5BP4Q8cWqBPK7I6D
         mWlL7Y9AHd6TB3xoyjpY0fm3kk6S/P0pKPFg6ni9PMposl3RUYbhwcyMKqzOez3eJI7r
         fc6RebtGxyjarWJTFMQGT540zTK7JQyofIVuDc4/m7O2hS43b1mg3/dvE/cdNQftPMJF
         3LGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zjJ5UCoJeEEihDN4cVR/wdYe+l5GkBSpbVBb3aSL4no=;
        b=IbQQz4wJjvYo/rtbxfhibmV+3giV2UGbhyvce/z9+VkW+uZbORm9VxbplZRy89Yao4
         aZKxXM/acBRKgBj/GvalxyFw1/RCP6rajGZnHNSQVLKo2Vz2YHL4qa2ItMUMpBYjjI+j
         +YJnuYDNIFR1Hf6Jg/y5GMap7MZNrvORoYF3kwSbYmnkvQFhdygGo0v9ZHmoV6ICqRxQ
         BQ8ECl7FpplFXVyjXLpvsvrTPcdYUW9FNENNjrLV3MHkUyXDvC3w676xXK4VQSNyEB6r
         p6hC1CIADUjLTBwq2oz2uyf0FLdEzCvSp/0p6hK3Kngr+37heWMtLmMwqYA+kgaLu8WC
         eH1g==
X-Gm-Message-State: AOAM530yMNMux3/Yq+ty5dXOtRMtKRnEeBVjV8vzSgPlWjaVZpk1T0M6
        9IBLzEs+cRpTka1rfP5Cx2g=
X-Google-Smtp-Source: ABdhPJzyP6vXYbvseTprmcbD7yTLmiYVknJtdA3ZxP10dTaYa5/p1h3eSUCZzGxfr18pM+7PjFtGjQ==
X-Received: by 2002:a17:906:d7ba:b0:6fe:a119:c4ac with SMTP id pk26-20020a170906d7ba00b006fea119c4acmr32307672ejb.129.1653598356730;
        Thu, 26 May 2022 13:52:36 -0700 (PDT)
Received: from kista.localnet (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id i10-20020a1709064eca00b006fe0abb00f0sm823522ejv.209.2022.05.26.13.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 13:52:36 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     linus.walleij@linaro.org, wens@csie.org, samuel@sholland.org,
        linux-gpio@vger.kernel.org, Andrei Lalaev <andrey.lalaev@gmail.com>
Cc:     linux-sunxi@lists.linux.dev,
        Andrei Lalaev <andrey.lalaev@gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: sunxi_pconf_set: use correct offset
Date:   Thu, 26 May 2022 22:52:35 +0200
Message-ID: <8939552.CDJkKcVGEf@kista>
In-Reply-To: <20220525190423.410609-1-andrey.lalaev@gmail.com>
References: <20220525190423.410609-1-andrey.lalaev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi!

Dne sreda, 25. maj 2022 ob 21:04:25 CEST je Andrei Lalaev napisal(a):
> Some Allwinner SoCs have 2 pinctrls (PIO and R_PIO).
> Previous implementation used absolute pin numbering and it was incorrect
> for R_PIO pinctrl.
> It's necessary to take into account the base pin number.

You didn't explain how issue manifests. How did you find it?

Best regards,
Jernej

> 
> Fixes: 90be64e27621 ("pinctrl: sunxi: implement pin_config_set")
> Signed-off-by: Andrei Lalaev <andrey.lalaev@gmail.com>
> ---
>  drivers/pinctrl/sunxi/pinctrl-sunxi.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/
pinctrl-sunxi.c
> index d9327d7d56ee..dd928402af99 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -544,6 +544,8 @@ static int sunxi_pconf_set(struct pinctrl_dev *pctldev, 
unsigned pin,
>  	struct sunxi_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
>  	int i;
>  
> +	pin -= pctl->desc->pin_base;
> +
>  	for (i = 0; i < num_configs; i++) {
>  		enum pin_config_param param;
>  		unsigned long flags;
> -- 
> 2.25.1
> 
> 


