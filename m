Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D0EC2ADF4F
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 20:29:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730788AbgKJT3E (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 14:29:04 -0500
Received: from z5.mailgun.us ([104.130.96.5]:34998 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728272AbgKJT3D (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 10 Nov 2020 14:29:03 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1605036543; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=0VxEoZEjoD8/bkzrSGDJ5C9RtI1ekM+Z0OiDWMyF/eE=; b=vJpVM+PHkw6iejpbBBRvQK9fq5dR07Dc16WAdx4/br288Jjcb8wvNOKNyrAFqMtYAaViR2W+
 S6LrNPrlwvkv6GEmU/5SFTIoTYOzvqnwkweHYKNdeIi4VcLXaC53Afxf4o3rsn1OCezWfylF
 wYw3rLR4TqcdgrGs0nHTa+Mg98A=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5faae9fececc309dcb51ede8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 10 Nov 2020 19:29:02
 GMT
Sender: jhugo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B2C1AC433C9; Tue, 10 Nov 2020 19:29:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.226.59.216] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1D8D5C433C6;
        Tue, 10 Nov 2020 19:28:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1D8D5C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH] pinctrl: qcom: Fix msm9853 Kconfig entry to depend on,
 not select PINCTRL_MSM
To:     John Stultz <john.stultz@linaro.org>,
        lkml <linux-kernel@vger.kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Prasad Sodagudi <psodagud@codeaurora.org>,
        Vladimir Lypak <junak.pub@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20201110190054.20517-1-john.stultz@linaro.org>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <19b7b301-3460-7ece-21d3-59cd7490c8ed@codeaurora.org>
Date:   Tue, 10 Nov 2020 12:28:59 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <20201110190054.20517-1-john.stultz@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 11/10/2020 12:00 PM, John Stultz wrote:
> One fixup following my patch commit be117ca32261 ("pinctrl:
> qcom: Kconfig: Rework PINCTRL_MSM to be a depenency rather then
> a selected config") being queued in LinusW's tree, as a new
> config entry was added for the msm9853 that also needs the
> change.
> 
> Applies to LinusW's pinctrl devel tree.
> 
> Cc: Andy Gross <agross@kernel.org>
> Cc: Prasad Sodagudi <psodagud@codeaurora.org>
> Cc: Vladimir Lypak <junak.pub@gmail.com>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
>   drivers/pinctrl/qcom/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
> index 8bdf878fe970c..cf56e029cd9c7 100644
> --- a/drivers/pinctrl/qcom/Kconfig
> +++ b/drivers/pinctrl/qcom/Kconfig
> @@ -115,7 +115,7 @@ config PINCTRL_MSM8916
>   config PINCTRL_MSM8953
>   	tristate "Qualcomm 8953 pin controller driver"
>   	depends on GPIOLIB && OF
> -	select PINCTRL_MSM
> +	depends on PINCTRL_MSM
>   	help
>   	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
>   	  Qualcomm TLMM block found on the Qualcomm MSM8953 platform.
> 

Subject should indicate msm8953, no?

-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
