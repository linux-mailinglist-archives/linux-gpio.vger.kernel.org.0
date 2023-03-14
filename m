Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DA096BA092
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Mar 2023 21:21:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229545AbjCNUVu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Mar 2023 16:21:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjCNUVt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Mar 2023 16:21:49 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4ECD4ECDA
        for <linux-gpio@vger.kernel.org>; Tue, 14 Mar 2023 13:21:47 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id z5so17245458ljc.8
        for <linux-gpio@vger.kernel.org>; Tue, 14 Mar 2023 13:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678825306;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VXwKl3y13aWCfTdvVfO1Y8J7c2z0ucPULTqX7qjAkSs=;
        b=Z4lAJjVFzR4KmEAFSvBY5AGMf2jT71nNoSTPw9Fr5Zoma2bQfUPW1MurANjqa08f8R
         ib6uTVlifwcMCGY1AO/vVZqUJRl+ec5rHdzXapBbbZbq853FlswrDNvNhiqEC1/aFMtj
         Ozh71N5exoclpDx0AuS4vL6vyZ/kZ6R1/EFj7vXl1z6MGzotQLSbXTHqhrEtsQwRZFQC
         b54ZiBFz0R0MPfmx+fQIXTWy9DoAWVt9RNLGN5RkTbLBXppWP+y3v7TOQAA0ROTRCQju
         PZffdykKd0UkWONJ71gkQJtBsDAazVDDfKTneYIQGDP/41A5idkLx3p3cXuTqS6dL8JK
         5ZHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678825306;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VXwKl3y13aWCfTdvVfO1Y8J7c2z0ucPULTqX7qjAkSs=;
        b=zEP0eZ1tEUSxaQt3us7KFpMlWHZzjPoXI4Iyf4l21NJMFiNHDw9I+LydkfqzLiWChM
         5orUM0sAL3l27inRdz633/++ae/IV94ySjLvmgSzOQr57CFEhPpZAGHcJM333fepjHH8
         a8ZRQcPt6Wqz/m1hSKyIU7b8ZVf8zw7L9WjSueWMLn6f6Pc76ky/d6KvjFgk7EDquFGA
         wTDz6hEZ0D2mHGTAXgbaxcYNJYG37gxGIXObzgTQKTlhA9s2S4jYiOtmAipbfVLxgNW1
         55Lv7vFPiYc2WV4a5cNee2TsoyXnvailaSsMzeu/Q38IQGU3IYfv4MPWIc5czTZQ4x3Z
         +Brw==
X-Gm-Message-State: AO0yUKXMr6R0c0ltTfZf7tU8Z9ma2OZWDhgKRQEjKDV/42TBrKXbTp/J
        qTAoqlKRsGEI/zueC6bUdv+Z4g==
X-Google-Smtp-Source: AK7set9x5CMbQO1JVok2thHSbgsn33lemo+wCOJsctzEHzcNZk3EyTAWAaQR+NBYmgxadcQ0QIbR6g==
X-Received: by 2002:a05:651c:2203:b0:295:733a:3463 with SMTP id y3-20020a05651c220300b00295733a3463mr101911ljq.29.1678825305958;
        Tue, 14 Mar 2023 13:21:45 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id k16-20020a05651c10b000b002989f7fd1a7sm388870ljn.24.2023.03.14.13.21.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 13:21:45 -0700 (PDT)
Message-ID: <7bf593e2-5a32-833a-95c3-f06a226212af@linaro.org>
Date:   Tue, 14 Mar 2023 21:21:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 03/14] arm64: dts: qcom: sa8775p: add the spmi node
Content-Language: en-US
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230314183043.619997-1-brgl@bgdev.pl>
 <20230314183043.619997-4-brgl@bgdev.pl>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230314183043.619997-4-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 14.03.2023 19:30, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Add the SPMI PMIC Arbiter node for SA8775p platforms.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index 428d9e0849b8..22c98ebc4c46 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -943,6 +943,24 @@ apps_smmu: iommu@15000000 {
>  		};
>  	};
>  
> +	spmi_bus: spmi@c440000 {
> +		compatible = "qcom,spmi-pmic-arb";
> +		reg = <0x0 0x0c440000 0x0 0x1100>,
> +		      <0x0 0x0c600000 0x0 0x2000000>,
> +		      <0x0 0x0e600000 0x0 0x100000>,
> +		      <0x0 0x0e700000 0x0 0xa0000>,
> +		      <0x0 0x0c40a000 0x0 0x26000>;
> +		reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";
Please make this a vertical list and sort the node properly.

lgtm otherwise

Konrad
> +		qcom,channel = <0>;
> +		qcom,ee = <0>;
> +		interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "periph_irq";
> +		interrupt-controller;
> +		#interrupt-cells = <4>;
> +		#address-cells = <2>;
> +		#size-cells = <0>;
> +	};
> +
>  	arch_timer: timer {
>  		compatible = "arm,armv8-timer";
>  		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
