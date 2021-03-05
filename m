Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3C8932EBE7
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Mar 2021 14:11:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229528AbhCENKd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Mar 2021 08:10:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229672AbhCENKZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Mar 2021 08:10:25 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29BB2C061756
        for <linux-gpio@vger.kernel.org>; Fri,  5 Mar 2021 05:10:25 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id w11so2006497wrr.10
        for <linux-gpio@vger.kernel.org>; Fri, 05 Mar 2021 05:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lvRMx9fuzhRV1OU+wVVNvO051Bw/5hEEULvhLdN6++M=;
        b=zjU0n+LQ1FfA8UUJ+w8kRd3hL7n55ebkeduiYPeA0oVDnOvSAoBG518Np9fff6DeZw
         3XSz2syDAc6ugB1WxDFcHmE/B7zwaWiQBsnalqDs79EWJu8VYcwNMGrYRoCTNzWX3zUD
         mFjJZ10ZU7ak5dCtrtQzETRSHF2O5qAJgWoX3IQeMh47HrsorI9qmuhsmDEj4V11um1i
         eXIMezeI/7qVfwAyQI/MtaN0flmYD5SBokfSvlEQDTy3rWDLVEOYfeVdMSWYgULwas9M
         4dl4n543VUYjWURxa0agOx+5jyFBsNV1eQLoLDqZVchW/JuVyU6JjmBjT4W6AQ39lnMC
         lx9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lvRMx9fuzhRV1OU+wVVNvO051Bw/5hEEULvhLdN6++M=;
        b=q9JsDF8+x1Bj13xcuewZfi7M+2k/6ePWBexgGsQ2KHiDEoCOYivh/S2B4QxbxkyJCo
         J+C/Apq3oB4VCCqsqG5bpRGlOGPts2fE2aumRuhhTnTurpdRYtEmtIuv9JwclRMxquhU
         NDrDuGcgOYhES2uq6gGi4bekjtPoG+edmlAix2jqQK+PoDSFwk8+R7htE2cLWuslW0QG
         mBh/KTVe3NIKsnYO+sg78QIic4XpCBjb/DhavIdn4Smnj8B1Xu4Fu6L8JH5T9vAtUkRK
         r/CNDV4JZ7F+SOdD4MIBejRkqG57RudAR9MP5336HyhJ0VXSIEv/Iqigl3lpQtBKkI3t
         RMLw==
X-Gm-Message-State: AOAM5329FvpK681pEkmw7ztlAT09hDvj1CBqzN6Ab2mfGPolqdUbqojt
        90vJcP7zGYDkM+B/4UTA+4/8gbJxCsesAg==
X-Google-Smtp-Source: ABdhPJzqgjP8kzbOu06orYle5LzGqmsq6Kl6y4pKIfQ6cDL9jmqc/7eXH4wTzsIqPj2yVZltUP5xHw==
X-Received: by 2002:a5d:4fcb:: with SMTP id h11mr9820748wrw.66.1614949823768;
        Fri, 05 Mar 2021 05:10:23 -0800 (PST)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id i26sm5014075wmb.18.2021.03.05.05.10.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Mar 2021 05:10:23 -0800 (PST)
Subject: Re: [PATCH] pinctrl: qcom: lpass lpi: use default pullup/strength
 values
To:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20210304194816.3843-1-jonathan@marek.ca>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <f30a6c1b-cd91-3442-fbac-10f508f8a640@linaro.org>
Date:   Fri, 5 Mar 2021 13:10:22 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210304194816.3843-1-jonathan@marek.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Thanks Jonathan for fixing this!

On 04/03/2021 19:48, Jonathan Marek wrote:
> If these fields are not set in dts, the driver will use these variables
> uninitialized to set the fields. Not only will it set garbage values for
> these fields, but it can overflow into other fields and break those.
> 
> In the current sm8250 dts, the dmic01 entries do not have a pullup setting,
> and might not work without this change.
> 
> Fixes: 6e261d1090d6 ("pinctrl: qcom: Add sm8250 lpass lpi pinctrl driver")
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---

LGTM,
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


--srini


>   drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> index 369ee20a7ea95..2f19ab4db7208 100644
> --- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> @@ -392,7 +392,7 @@ static int lpi_config_set(struct pinctrl_dev *pctldev, unsigned int group,
>   			  unsigned long *configs, unsigned int nconfs)
>   {
>   	struct lpi_pinctrl *pctrl = dev_get_drvdata(pctldev->dev);
> -	unsigned int param, arg, pullup, strength;
> +	unsigned int param, arg, pullup = LPI_GPIO_BIAS_DISABLE, strength = 2;
>   	bool value, output_enabled = false;
>   	const struct lpi_pingroup *g;
>   	unsigned long sval;
> 
