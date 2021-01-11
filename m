Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 546BE2F1A48
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Jan 2021 16:58:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388054AbhAKP5c (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Jan 2021 10:57:32 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:13648 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388005AbhAKP5c (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Jan 2021 10:57:32 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1610380628; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=rpUhQsbkZqOoeekzL8PjncrrfDvQYa9XwRlpvRyebcY=; b=F+pQzTl5mvy7vddLAWQ8ewrrDdaz42IrDgL3v609Vqg8hScR/KCs+6ut7fFwRxzPd+smWA99
 EFixKFcN2Ezj/Obq9xEFtFPuvQvA26NtW+fua80b7w4bqlVJZBysFUB1iI7QGLL8dnr8fp7P
 yFDey8us2l4DDhY2moNz0/Fr4HA=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-east-1.postgun.com with SMTP id
 5ffc75318fb3cda82f37df61 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 11 Jan 2021 15:56:33
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 15C47C433CA; Mon, 11 Jan 2021 15:56:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.29.129] (unknown [49.36.75.31])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4671AC433C6;
        Mon, 11 Jan 2021 15:56:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4671AC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v5 1/4] pinctrl: qcom: Allow SoCs to specify a GPIO
 function that's not 0
To:     Douglas Anderson <dianders@chromium.org>,
        Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Neeraj Upadhyay <neeraju@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>, linux-gpio@vger.kernel.org,
        Srinivas Ramana <sramana@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-kernel@vger.kernel.org
References: <20210108093339.v5.1.I3ad184e3423d8e479bc3e86f5b393abb1704a1d1@changeid>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <3aaf589e-ece1-1b9c-52fd-f7e8274b4938@codeaurora.org>
Date:   Mon, 11 Jan 2021 21:26:23 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210108093339.v5.1.I3ad184e3423d8e479bc3e86f5b393abb1704a1d1@changeid>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Doug,

Reviewed-by: Maulik Shah <mkshah@codeaurora.org>
Tested-by: Maulik Shah <mkshah@codeaurora.org>

Thanks,
Maulik

On 1/8/2021 11:05 PM, Douglas Anderson wrote:
> There's currently a comment in the code saying function 0 is GPIO.
> Instead of hardcoding it, let's add a member where an SoC can specify
> it.  No known SoCs use a number other than 0, but this just makes the
> code clearer.  NOTE: no SoC code needs to be updated since we can rely
> on zero-initialization.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>
> (no changes since v1)
>
>   drivers/pinctrl/qcom/pinctrl-msm.c | 4 ++--
>   drivers/pinctrl/qcom/pinctrl-msm.h | 2 ++
>   2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index e051aecf95c4..1d2a78452c2d 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -210,8 +210,8 @@ static int msm_pinmux_request_gpio(struct pinctrl_dev *pctldev,
>   	if (!g->nfuncs)
>   		return 0;
>   
> -	/* For now assume function 0 is GPIO because it always is */
> -	return msm_pinmux_set_mux(pctldev, g->funcs[0], offset);
> +	return msm_pinmux_set_mux(pctldev,
> +				  g->funcs[pctrl->soc->gpio_func], offset);
>   }
>   
>   static const struct pinmux_ops msm_pinmux_ops = {
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.h b/drivers/pinctrl/qcom/pinctrl-msm.h
> index 333f99243c43..e31a5167c91e 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.h
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.h
> @@ -118,6 +118,7 @@ struct msm_gpio_wakeirq_map {
>    * @wakeirq_dual_edge_errata: If true then GPIOs using the wakeirq_map need
>    *                            to be aware that their parent can't handle dual
>    *                            edge interrupts.
> + * @gpio_func: Which function number is GPIO (usually 0).
>    */
>   struct msm_pinctrl_soc_data {
>   	const struct pinctrl_pin_desc *pins;
> @@ -134,6 +135,7 @@ struct msm_pinctrl_soc_data {
>   	const struct msm_gpio_wakeirq_map *wakeirq_map;
>   	unsigned int nwakeirq_map;
>   	bool wakeirq_dual_edge_errata;
> +	unsigned int gpio_func;
>   };
>   
>   extern const struct dev_pm_ops msm_pinctrl_dev_pm_ops;

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

