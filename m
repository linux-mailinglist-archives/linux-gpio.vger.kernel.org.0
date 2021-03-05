Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FCB832DE3A
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Mar 2021 01:05:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230107AbhCEAFy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 19:05:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229737AbhCEAFy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 19:05:54 -0500
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A541BC06175F
        for <linux-gpio@vger.kernel.org>; Thu,  4 Mar 2021 16:05:52 -0800 (PST)
Received: by mail-oi1-x22a.google.com with SMTP id l133so509452oib.4
        for <linux-gpio@vger.kernel.org>; Thu, 04 Mar 2021 16:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3rn+KCEOmOu8NeH8O3e1dlLQ9odBWFmrFywzdTHe3Q0=;
        b=j/02VbP9jX5VnNiqlvDxU4Zq+czyYuekx2+AFq60l+s+mFb+M+honHGH71ftng6ipW
         vdWMHwWGo3pLU0pW4Yen46JneheffHWagGaozlpYhScNis9HE6l+Bennm5/Fbd7lNehS
         UrrU6WW46887IJWydbjFVNc2Pxg10QmtU8KNdVLxirscyPzlTSmxUNeA2RS7LunGZPGd
         u1DcT6C/gmZkfHc3rYXrEpse9H2rY0ow64eyGe1VbZBeQYJdA8tldQNOB5uWcpFKLUFm
         OFSmopJhF7KzpR1zDfcvqW3CE98jYXixHcpQFdW6bVpzIk2evB1q/YplZgbfqgJhPqAv
         devQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3rn+KCEOmOu8NeH8O3e1dlLQ9odBWFmrFywzdTHe3Q0=;
        b=dA+ahvhDwknKNHUWn7F0j2RIIbo8cFYJXUJ5UeXXttstBiYIjS53xrcXuWd4NWijhz
         tkDQRqlXJLm/V03eKjGX7iUROzyIF+sMs76diBmP8h3Cwp2YtyNs6qI1onIrPPX8TsFd
         8zOKoMEwDk+JoQvL6FS6hQrol5+bs5FZu0MI/hQG/Iywnhc3jnEa+lqS98+goUUGIGnk
         QwW2+EDdbisfZF/ObAF4F2BREmrK+iIidnqYpRHHxIjNNFZSzeV+f3YY8zoPKxbAlnnT
         qWGZNLHXBRlvJqNYI+KDhnc1Jh2gsLhBP0J0wYYU29bxCoHwi3s7hSRg/6Dyfxl65uMX
         CcwQ==
X-Gm-Message-State: AOAM530aLoJoWs5MT1CMB5kfgtdD9l593t1nCIGnLKlLr50DXpLxdf88
        mawkE7HkyRHC2xf4LzTy0m+xxA==
X-Google-Smtp-Source: ABdhPJwEPJzjaCRNvCQ/xMDgfK7sOeaLw/RhUB7Khaaf0s4n4hopJMtRQH78ob4WfY1vbzMJpZ1S1Q==
X-Received: by 2002:aca:7514:: with SMTP id q20mr4996099oic.86.1614902751942;
        Thu, 04 Mar 2021 16:05:51 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id p67sm170678oih.21.2021.03.04.16.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 16:05:51 -0800 (PST)
Date:   Thu, 4 Mar 2021 18:05:49 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] pinctrl: qcom: lpass lpi: use default pullup/strength
 values
Message-ID: <YEF13ad1wpTzeV9i@builder.lan>
References: <20210304194816.3843-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210304194816.3843-1-jonathan@marek.ca>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu 04 Mar 13:48 CST 2021, Jonathan Marek wrote:

> If these fields are not set in dts, the driver will use these variables
> uninitialized to set the fields. Not only will it set garbage values for
> these fields, but it can overflow into other fields and break those.
> 
> In the current sm8250 dts, the dmic01 entries do not have a pullup setting,
> and might not work without this change.
> 

Perhaps you didn't see it, but Dan reported this a few days back. So
unless you object I would suggest that we include:

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>


Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Fixes: 6e261d1090d6 ("pinctrl: qcom: Add sm8250 lpass lpi pinctrl driver")
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> index 369ee20a7ea95..2f19ab4db7208 100644
> --- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> @@ -392,7 +392,7 @@ static int lpi_config_set(struct pinctrl_dev *pctldev, unsigned int group,
>  			  unsigned long *configs, unsigned int nconfs)
>  {
>  	struct lpi_pinctrl *pctrl = dev_get_drvdata(pctldev->dev);
> -	unsigned int param, arg, pullup, strength;
> +	unsigned int param, arg, pullup = LPI_GPIO_BIAS_DISABLE, strength = 2;
>  	bool value, output_enabled = false;
>  	const struct lpi_pingroup *g;
>  	unsigned long sval;
> -- 
> 2.26.1
> 
