Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E8E4351884
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Apr 2021 19:48:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236046AbhDARp6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Apr 2021 13:45:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234694AbhDARjM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Apr 2021 13:39:12 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92CA8C0225A1
        for <linux-gpio@vger.kernel.org>; Thu,  1 Apr 2021 08:26:31 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id w21-20020a9d63950000b02901ce7b8c45b4so2456224otk.5
        for <linux-gpio@vger.kernel.org>; Thu, 01 Apr 2021 08:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=y1kLTUZ2DutDMLECPCDo/9HBwkSTm4jPer4fs/ISbQw=;
        b=omBsYOeENt7SVjBE01WDqu8qkh6IuqJn18S0GxB8wH2g235QZGZzREfvWVIVJaIfO/
         1TBmzjcHZeaLC1gXmZ6rI8Tlon9Hb6qxp1KLHxDAhJ20so+bIy87AGTfgQ+Q22cqtCJw
         H4WvKG6fHJxtHglO3JEZM4qD/GaeefgOmd+tXSeqLdk4SklBHGNyWmy/0Hn/jBYf+HsX
         pFbuUB1HhJH98ir9FIYsXxZb6i+xtPJzpKLENPuOd8GgAfqvlWooyCQaAIFJVGoEmGe0
         EOqoltRJIhpiPjTBvaTbju0ULDdXLW5Hf688IH6WMu7qG0p1vO6emJ83VHxl7hPSfcP+
         rkqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=y1kLTUZ2DutDMLECPCDo/9HBwkSTm4jPer4fs/ISbQw=;
        b=Ivge0T4VAmDOI5a6PXi+9qk7zSciqLRoU1H45CIwqrepqg2kNmEvLs2iKLGy6/r4Zo
         cRyqv2pvGXK3nFqA5URC9q663O4h9x2Akw9iNLRySUKOhC2SGveTvJ7Iu3eiGjII1pmB
         y0nEwLmW1Gbdftb8IU5iLUcclkvVgpnwSfrE5DuFd6Cxypd8HdaNNAIML/42hwZr/6Qe
         lhjQGUmY9m0pgP+fUgLOqvVYPwRLt8xUuFGjCkgup+apInSv/KBP6+JDMTcmQry/S8ge
         HICcynrLqNfy41BFgKmZJN+K9VtCXnUjxEaCRVcsmz+qG7lOhha2komoTWWP9LiP3FSB
         59pg==
X-Gm-Message-State: AOAM530HV+1hGVik1eQI1IWSqGON3fV7YBf4DnLlIbkNMRWtn621qL8d
        lU8QxIEWKqw7xGMoN1oRYWD4rw==
X-Google-Smtp-Source: ABdhPJwuxhgyUQPNdxqijp4NxdjFRqjeSz9/Ag+fpV3UkbEs/6cB1Wjoefn5mCAup82be648Kb/y8w==
X-Received: by 2002:a9d:6013:: with SMTP id h19mr7353121otj.72.1617290791027;
        Thu, 01 Apr 2021 08:26:31 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m127sm1093411oib.32.2021.04.01.08.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 08:26:30 -0700 (PDT)
Date:   Thu, 1 Apr 2021 10:26:28 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, kgunda@codeaurora.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH V2 2/3] dt-bindings: pinctrl: qcom-pmic-gpio: Update the
 binding to add four new variants
Message-ID: <20210401152628.GQ904837@yoga>
References: <1617280546-9583-1-git-send-email-skakit@codeaurora.org>
 <1617280546-9583-3-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1617280546-9583-3-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu 01 Apr 07:35 CDT 2021, satya priya wrote:

> Update the binding to add PM7325, PM8350C, PMK8350 and PMR735A GPIO support.
> 
> Signed-off-by: satya priya <skakit@codeaurora.org>
> ---
> Changes in V2:
>  - Placed this patch before conversion patch and updated commit text
>    to be more clear.
> 
>  Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> index 7648ab0..da7c35e 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> @@ -30,6 +30,10 @@ PMIC's from Qualcomm.
>  		    "qcom,pm6150-gpio"
>  		    "qcom,pm6150l-gpio"
>  		    "qcom,pmx55-gpio"
> +		    "qcom,pm7325-gpio"
> +		    "qcom,pm8350c-gpio"
> +		    "qcom,pmk8350-gpio"
> +		    "qcom,pmr735a-gpio"

As with the driver, please try to keep these sorted alphabetically and
please rebase on linux-next, which already defines 2 of these.

Regards,
Bjorn

>  
>  		    And must contain either "qcom,spmi-gpio" or "qcom,ssbi-gpio"
>  		    if the device is on an spmi bus or an ssbi bus respectively
> @@ -113,6 +117,10 @@ to specify in a pin configuration subnode:
>  		    gpio1-gpio12 for pm6150l
>  		    gpio1-gpio11 for pmx55 (holes on gpio3, gpio7, gpio10
>  					    and gpio11)
> +		    gpio1-gpio10 for pm7325
> +		    gpio1-gpio9 for pm8350c
> +		    gpio1-gpio4 for pmk8350
> +		    gpio1-gpio4 for pmr735a
>  
>  - function:
>  	Usage: required
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
> of Code Aurora Forum, hosted by The Linux Foundation
> 
