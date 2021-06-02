Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E095E3989C1
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jun 2021 14:35:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230097AbhFBMh3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Jun 2021 08:37:29 -0400
Received: from mail-wr1-f41.google.com ([209.85.221.41]:43862 "EHLO
        mail-wr1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbhFBMh3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Jun 2021 08:37:29 -0400
Received: by mail-wr1-f41.google.com with SMTP id v23so2118109wrd.10
        for <linux-gpio@vger.kernel.org>; Wed, 02 Jun 2021 05:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4Nhkur6Md4F0lV5cADokhI9e1ZbvHW/X/CRyud57vlc=;
        b=mjITBjbjMNgFAedpoaAjzKs6GG7aw2Irys+uxuasdvv+6kOw6nIT0PTcb4SUwWGSpS
         ++cCdocjqVC1DbO1CxGdHNaABJXcI8jts1CWpY4pX0tXEzuk+bhelHIuXzk2NsGJ131j
         d1GhUbXF1HBOiWb8mLhKNiEdIoCp8YQB5rY5XF38Y/hJscxVazCerAAxE6rNQ0cP5VG9
         gh1iZiNNk+kfsW0cuXvXwxu7iXFqXr4YX1LrZo/sTHBEvdNz6jFXOYVYdUjAKqBvtH4c
         HsFS9fiBzQAWLsUPS9wkqOc41FBxf9keEaBlQM7okKF3i9Dm3GzH3g7OjkxTek+cLnF2
         DeXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4Nhkur6Md4F0lV5cADokhI9e1ZbvHW/X/CRyud57vlc=;
        b=ITuoZlD8Sb3gEGbP6JyYsTJSNx59UEWMTVaQPjUECzmDgwQyNTqs4gyLsww5ZoY4H0
         dhrcmr6FV3Zi5g9pcAnmQhaEIkLjdO0KseOKkLQ/gYOlimynVsaCHhLvLP4zSuZYpzLZ
         zV0I9IlYxCRLCqoEdpMtoWe28A+rOl4w1lTRLhFKuacSr8gyrsEbnOUxAlRq4xH9paD0
         nqMVV7BEVALxQ2XzTuQTUHAyQJZQKwBw8uWIDyvbccMMNhrTeSuO4QWhfSszY2QoBqjB
         FBvYS1epmhDjJxwA5t8NbNb+iUqyksoAgdNGU44SO9NjWOEQLjcZPzvmdBZxkbskaieU
         vI6g==
X-Gm-Message-State: AOAM5327XJs9+z5mqKRz1CHjquWCLLFWOtDofHpjtH9nbgT/iZ6vufuk
        Slc8Y1jo++1Lj2FoohbBeXg=
X-Google-Smtp-Source: ABdhPJySDC47e40En/SdS8eSyMtPUoz4xjHmatsVacgtshZ8EQ5TLQymqeonDr1136tfqGOhH3/LBg==
X-Received: by 2002:adf:f708:: with SMTP id r8mr6328716wrp.159.1622637268881;
        Wed, 02 Jun 2021 05:34:28 -0700 (PDT)
Received: from ziggy.stardust ([37.223.145.68])
        by smtp.gmail.com with ESMTPSA id a11sm6498658wrr.48.2021.06.02.05.34.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jun 2021 05:34:28 -0700 (PDT)
Subject: Re: [PATCH] pinctrl: mediatek: move bit assignment
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Cc:     Fabien Parent <fparent@baylibre.com>,
        Sean Wang <sean.wang@kernel.org>,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        linux-mediatek@lists.infradead.org,
        kernel test robot <lkp@intel.com>
References: <20210528091945.411471-1-linus.walleij@linaro.org>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <b3d9f92d-a311-0093-4243-b21f2646997f@gmail.com>
Date:   Wed, 2 Jun 2021 14:34:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210528091945.411471-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On 28/05/2021 11:19, Linus Walleij wrote:
> The bit needs offset to be defined which happens some lines
> below. Looks like a bug. The kernel test robot complains:
> 
> drivers/pinctrl/mediatek/pinctrl-mtk-common.c:137:12:
> warning: variable 'offset' is uninitialized when used here [-Wuninitialized]
>            bit = BIT(offset & pctl->devdata->mode_mask);
>                      ^~~~~~
> 
> Fix it up by reverting to what was done before.
> 
> Cc: Fabien Parent <fparent@baylibre.com>
> Cc: Sean Wang <sean.wang@kernel.org>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: Mattijs Korpershoek <mkorpershoek@baylibre.com>
> Cc: linux-mediatek@lists.infradead.org
> Fixes: 9f940d8ecf92 ("pinctrl: mediatek: don't hardcode mode encoding in common code")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> index 9fe91e11a877..525b1aa7f7a6 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> @@ -134,7 +134,7 @@ static int mtk_pconf_set_ies_smt(struct mtk_pinctrl *pctl, unsigned pin,
>  			pin, pctl->devdata->port_align, value, arg);
>  	}
>  
> -	
> +	bit = BIT(pin & 0xf);

I see this is already applied to linux-next, but I think the correct fix is to move
bit = BIT(offset & pctl->devdata->mode_mask);
just before calling regmap_write(...)

I can provide a patch for that, if you want. Just let me know if I should base
it against linux-next or if you will drop the fix proposed by you?

Regards,
Matthias

>  
>  	if (arg == PIN_CONFIG_INPUT_ENABLE)
>  		offset = pctl->devdata->ies_offset;
> 
