Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C59D44330F
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Nov 2021 17:37:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234841AbhKBQjl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Nov 2021 12:39:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234756AbhKBQjA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Nov 2021 12:39:00 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC151C0432F1
        for <linux-gpio@vger.kernel.org>; Tue,  2 Nov 2021 09:35:56 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id w29-20020a056830411d00b0055abaca9349so2365819ott.13
        for <linux-gpio@vger.kernel.org>; Tue, 02 Nov 2021 09:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=n/RntJXNAkrW0uv0IpMzSuir/PcBl5SVKIKgV75XIB8=;
        b=isBEGC41Hvc8wUmUEuyLHkbMd1h6iLODoNVxaIvZIk01gTWS0aXT2Kzl+JbOAagdxd
         G9H7NtcyejQEScT2h8UhijezCAkUeGSIn3I9vddL9vYfDuI+BKXk7VFbnEJiSrCnrsow
         0oxazuFTD4knb37vMucpKXj75uXjX6x425BdhuMS0YvIqXhP3dBURljIZNIRzWZVeLgH
         GoTVkudz3uWc+lLnkX/c9IaBzorcZCWCucXgnatepOCBGnfSnJvBRRbof/XGa0CNK4mO
         dpyHiGSzTn3BD/DTsp8RgSLaOAv4bIMtn6ecIHCxPP8qbaXsncRUcVCNYQmLttqPnSG3
         eAoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=n/RntJXNAkrW0uv0IpMzSuir/PcBl5SVKIKgV75XIB8=;
        b=HiyqXflCISBuqTwJRJlBgnsUkF3pbGaGGF/qtPYrEQoyShKbXdZHYr7vrYCgAxaPsP
         RPSoWLTOETe0wafbi1d7kuBYw0Xvk/PFnfIQmVlyikvIH7mnjXwNCZBrnwmdEgn3wdd2
         ijAz3xenEQEEAeR2OLcnT3UNFPRXOfRt63J5gOquh4DCCy24tfJNqdWOekTCX8jb/MLA
         JuPfTDJ8LKWJ2vDVihpGHD6/cyMqJTdeHrQhgTyObZmo2f6MzjuG/HbYDvktigAfD8Hp
         njAMioeY0RbqDU+bm5PpwVOyBJiiByK6Wk/gdgj3+FHweV93G57iN3UyEwEeYCXDPzXX
         SJoA==
X-Gm-Message-State: AOAM5329k1B8NGFWwshMS15YFWf9FAex+G/ScXR/pqLhx+nfUkeQeRUj
        kPSF3ThsV2dyMxBKcvmpbiSk0w==
X-Google-Smtp-Source: ABdhPJw+6Xw8t85A50e6lXfI/V58EwMHlfsy2yrC6cuYlesP4xDvDfU30ACuyCZ0j1dGgO6YdJzlug==
X-Received: by 2002:a9d:6315:: with SMTP id q21mr23370259otk.169.1635870956247;
        Tue, 02 Nov 2021 09:35:56 -0700 (PDT)
Received: from [192.168.11.48] (cpe-173-173-107-246.satx.res.rr.com. [173.173.107.246])
        by smtp.gmail.com with ESMTPSA id q5sm5209853otg.1.2021.11.02.09.35.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Nov 2021 09:35:55 -0700 (PDT)
Message-ID: <2197a192-446b-e5cd-afd5-28bba65d89f0@kali.org>
Date:   Tue, 2 Nov 2021 11:35:52 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [PATCH] pinctrl: qcom: sdm845: Enable dual edge errata
Content-Language: en-US
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211102034115.1946036-1-bjorn.andersson@linaro.org>
From:   Steev Klimaszewski <steev@kali.org>
In-Reply-To: <20211102034115.1946036-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 11/1/21 10:41 PM, Bjorn Andersson wrote:
> It has been observed that dual edge triggered wakeirq GPIOs on SDM845
> doesn't trigger interrupts on the falling edge.
>
> Enabling wakeirq_dual_edge_errata for SDM845 indicates that the PDC in
> SDM845 suffers from the same problem described, and worked around, by
> Doug in 'c3c0c2e18d94 ("pinctrl: qcom: Handle broken/missing PDC dual
> edge IRQs on sc7180")', so enable the workaround for SDM845 as well.
>
> The specific problem seen without this is that gpio-keys does not detect
> the falling edge of the LID gpio on the Lenovo Yoga C630 and as such
> consistently reports the LID as closed.
>
> Fixes: e35a6ae0eb3a ("pinctrl/msm: Setup GPIO chip in hierarchy")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>   drivers/pinctrl/qcom/pinctrl-sdm845.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/pinctrl/qcom/pinctrl-sdm845.c b/drivers/pinctrl/qcom/pinctrl-sdm845.c
> index c51793f6546f..fdfd7b8f3a76 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sdm845.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sdm845.c
> @@ -1310,6 +1310,7 @@ static const struct msm_pinctrl_soc_data sdm845_pinctrl = {
>   	.ngpios = 151,
>   	.wakeirq_map = sdm845_pdc_map,
>   	.nwakeirq_map = ARRAY_SIZE(sdm845_pdc_map),
> +	.wakeirq_dual_edge_errata = true,
>   };
>   
>   static const struct msm_pinctrl_soc_data sdm845_acpi_pinctrl = {

Tested here with a number of suspend cycles, works as expected now.  
Thank you so much!

Tested-By: Steev Klimaszewski <steev@kali.org>

