Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 161DFAD7DB
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Sep 2019 13:26:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403812AbfIIL01 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Sep 2019 07:26:27 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:53360 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730089AbfIIL01 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Sep 2019 07:26:27 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 5538960271; Mon,  9 Sep 2019 11:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568028386;
        bh=aGObAo7JXSTQg8/hilz+tj4Iff/k/ApkzjZWhbD7P/g=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=XyUjZ3fNsE/mmmtbuTZKRcv7p/Y2x2fkEhvFPT/aS1QcHAyBxpROhm81EBQAzQLuN
         H40EroCwKI0abRFSSVXTfR7GLFJOQ3foeEBduV29LXXTgL3oZibIlUx11sc7kgZ18n
         xz9GUi8/5+WpsRFY2YsVRTXAxrZEKgNPoX+YYwHQ=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.206.13.37] (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8AAD460769;
        Mon,  9 Sep 2019 11:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568028385;
        bh=aGObAo7JXSTQg8/hilz+tj4Iff/k/ApkzjZWhbD7P/g=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=o513epvpzF7DiEHZqA1NpKsUgt9QsWcjI8pWXX/qrBy/S7duZOa9HrZtCqmiAl30q
         JJ8vhWsKxVnZTA8gtn6vrZ2L/CZrLk+IFOnLm4S5LKBJXkBkyRnY44dw8plOV4FNu5
         JMr0MgGOem9wTCCO7/FICypwuLACjjmpHIgQ6+Ig=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8AAD460769
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH RFC 12/14] arm64: dts: qcom: add PDC interrupt controller
 for SDM845
To:     Lina Iyer <ilina@codeaurora.org>, swboyd@chromium.org,
        evgreen@chromium.org, marc.zyngier@arm.com,
        linus.walleij@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, linux-gpio@vger.kernel.org,
        rnayak@codeaurora.org
References: <20190829181203.2660-1-ilina@codeaurora.org>
 <20190829181203.2660-13-ilina@codeaurora.org>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <1e311bff-752a-4226-ab75-be5e87ffcc62@codeaurora.org>
Date:   Mon, 9 Sep 2019 16:56:19 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190829181203.2660-13-ilina@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 8/29/2019 11:42 PM, Lina Iyer wrote:
> Add PDC interrupt controller device bindings for SDM845.
>
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> ---
>   arch/arm64/boot/dts/qcom/sdm845.dtsi | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index be0022e09465..ffe28b3e41d8 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -2375,6 +2375,16 @@
>   			#power-domain-cells = <1>;
>   		};
>   
> +		pdc_intc: interrupt-controller@b220000 {
> +			compatible = "qcom,sdm845-pdc";
> +			reg = <0 0x0b220000 0 0x30000>, <0x179900f0 0x60>;

second register also needs to be in below format

<0 0x179900f0 0 0x60>

> +			qcom,pdc-ranges = <0 480 94>, <94 609 15>, <115 630 7>;
> +			#interrupt-cells = <2>;
> +			interrupt-parent = <&intc>;
> +			interrupt-controller;
> +			qcom,scm-spi-cfg;
> +		};
> +
>   		pdc_reset: reset-controller@b2e0000 {
>   			compatible = "qcom,sdm845-pdc-global";
>   			reg = <0 0x0b2e0000 0 0x20000>;

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

