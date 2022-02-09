Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B3704AF9C8
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Feb 2022 19:16:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239308AbiBISQu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Feb 2022 13:16:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239183AbiBISQM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Feb 2022 13:16:12 -0500
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07923C050CFB;
        Wed,  9 Feb 2022 10:13:13 -0800 (PST)
Received: by mail-qv1-xf30.google.com with SMTP id g3so2471395qvb.8;
        Wed, 09 Feb 2022 10:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=H749CW18B+mXSE8eDYv1/GPO2QZK74ZBmLg43pWkuuA=;
        b=F841N1bERIlML4db9R0BT96CTA0QpP6aRLjqXVe6M/anxj8aMvl9ww5b82+0Rg2cSK
         oEJeNIvwGxmPa39+RJ79oUcKYbtS8PINfXmbu/eDhOlc16EQqExTMSOeVSJxSkz/3Q/E
         bn3qhLPZKt6rBf2rLqCE8ptDtVCVMyyHZWrmDSBUVf88iAxD8ijTFoO0w+XZu+lm3vAt
         9xjLd1LfCyAHjmW+dR3EbKjCWpG5A986FjK0BiPKLtBWC22MPb5Mq47Rz0dTmUQlnwno
         FEKiKFZA5wJTupKZ2ddtfa9VOfsGGFLzj7aQP1FSoLFw2hU3/0LfGOJiadUJB53aClBW
         8bqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=H749CW18B+mXSE8eDYv1/GPO2QZK74ZBmLg43pWkuuA=;
        b=TPlxp/8lzZxU/7wHTdPQMwb1uiMtXeBIP9d89uj4In3eDmqxG6wl5TztUjC5Yl7Wrm
         Y7medJgPDjEC63mwZyAgCQlxvg3iv+ngcVllSZ+FUpgLBMNiaDSjlf6JSiaHsmsulbR8
         Gq0vsRXPIWa4aU5WTU5lGaytxUZI1OvL2H3w5cTgZlfxGd4Yr08F8qwoGjZOgx0uBJyZ
         77VcWvJM61vgRtsIeWsvuuUdysGXQ5UX108Ei9/gXWXm4Zd/X54fwYroo8UVcMCWIMZH
         VLnampympCDZf4fD9ru2K+Nq0JkWRJ/6DiobuHyjONsJDwyzHa1CFY2sBlfclVh+CL+T
         A+7w==
X-Gm-Message-State: AOAM5336SZkdidLZKndGtOyMo6w37PiuTtIFXOA9S9e2FyaIe+HwQJYq
        unIvH1ooSVzuhnuCqPIroEK23ZjBUiE=
X-Google-Smtp-Source: ABdhPJxTkH0UgeZjlxNYBmI+nkSHngYHyjuvLMzA1KReVb0DkSWEUzByshGHR1LnuHXR5sRorgpGmg==
X-Received: by 2002:a05:6214:e84:: with SMTP id hf4mr2476659qvb.12.1644430391595;
        Wed, 09 Feb 2022 10:13:11 -0800 (PST)
Received: from [192.168.1.201] (pool-108-18-137-133.washdc.fios.verizon.net. [108.18.137.133])
        by smtp.googlemail.com with ESMTPSA id x18sm9525495qta.57.2022.02.09.10.13.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Feb 2022 10:13:11 -0800 (PST)
Subject: Re: [PATCH] pinctrl: fix loop in k210_pinconf_get_drive()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Damien Le Moal <damien.lemoal@wdc.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Palmer Dabbelt <palmerdabbelt@google.com>,
        linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <20220209180804.GA18385@kili>
From:   Sean Anderson <seanga2@gmail.com>
Message-ID: <4c833488-8763-f8d7-c96a-6f7420abe35c@gmail.com>
Date:   Wed, 9 Feb 2022 13:13:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20220209180804.GA18385@kili>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2/9/22 1:08 PM, Dan Carpenter wrote:
> The loop exited too early so the k210_pinconf_drive_strength[0] array
> element was never used.
> 
> Fixes: d4c34d09ab03 ("pinctrl: Add RISC-V Canaan Kendryte K210 FPIOA driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   drivers/pinctrl/pinctrl-k210.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-k210.c b/drivers/pinctrl/pinctrl-k210.c
> index 49e32684dbb2..e3d03f2de7ef 100644
> --- a/drivers/pinctrl/pinctrl-k210.c
> +++ b/drivers/pinctrl/pinctrl-k210.c
> @@ -482,7 +482,7 @@ static int k210_pinconf_get_drive(unsigned int max_strength_ua)
>   {
>   	int i;
>   
> -	for (i = K210_PC_DRIVE_MAX; i; i--) {
> +	for (i = K210_PC_DRIVE_MAX; i >= 0; i--) {
>   		if (k210_pinconf_drive_strength[i] <= max_strength_ua)
>   			return i;
>   	}
> 

Reviewed-by: Sean Anderson <seanga2@gmail.com>
