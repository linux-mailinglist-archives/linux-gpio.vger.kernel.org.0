Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 145356BA0AC
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Mar 2023 21:26:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231233AbjCNU0G (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Mar 2023 16:26:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230445AbjCNUZ7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Mar 2023 16:25:59 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82ACE2BEFB
        for <linux-gpio@vger.kernel.org>; Tue, 14 Mar 2023 13:25:14 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id f18so21638402lfa.3
        for <linux-gpio@vger.kernel.org>; Tue, 14 Mar 2023 13:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678825512;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5Td1bebZ6aK4cMakRGNCVIAz8u4A34OSTM2iigQ6lUc=;
        b=huBzCcE5tuvCOmYGf6ZYLhlcfxtyEVs2Z1wFE3X0IQul/+v2S4BIbVfvvacc0pqGDh
         IAJm1IyTPdduph7Gwr7KhQQ0R/jzKdNlK/8T4f8PkxLLIZusjRNbF5fsNkj0eMBwZxS9
         WbDBanc6eFHHseKxlVmvxcqjzQ+ms/FOUmCWZ0LhZbqlc/OINPvmigAk+2f5F1/qqSLN
         LY2aKP3BG22xFM99IkPJgpcVy3CUh30AJxGHUnCPq+GjzNQCk1KVuVYulXmNr4ufKv/X
         fXoUKY7UyRJ18eiC0R3AAE1ylMb2WZojng1huFDR+ekrKuDoprCVB1968T/ZsxEbOoeC
         TWgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678825512;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Td1bebZ6aK4cMakRGNCVIAz8u4A34OSTM2iigQ6lUc=;
        b=bLwr4ED836fH5+bIGP61uFb1rALHvwdTKIj1bSr7YkLL40wXdj/nqR5xZBVaabx0i1
         u1v0BGearOG3g3F/fB4Gfx99zN7n8qLfa8mCFhQLT4th8b9Bd0z3dXTbi+iwwrZjbRJ8
         KWqNpFxWgpyN24ZBjSTLlBSmdnTgCGfLkPXNOQ91a4p55S+owprO+n+RHrZMmRf3MH93
         7NVgX18A3mxeo+jdJBLBqEoZHWm0gC98dhwhxrQw42IWM98tRhIu+B1zVaU8nwRmwD1j
         7FWPmbdnAFVaf+ZWN9DgX2ZaaIWD5qghFXD+DklUkFlMqVyHvW7sZ+cOsNpExQistSRo
         RJnA==
X-Gm-Message-State: AO0yUKVcni39gGt0RcwjCZoQgGsH+PjcLQZc1zsLrUWseroTAYnb/N4K
        UWmvIbzT3/XCPFU+phMNcL74Iw==
X-Google-Smtp-Source: AK7set9hX7nss9bI3ZSSY0CbtJwbgcUGwmvp4NZuqCHIYpQpKEqzt7AwhMuuPB5JHg7WfW6QApK/Cg==
X-Received: by 2002:ac2:51ab:0:b0:4d8:6577:d2bf with SMTP id f11-20020ac251ab000000b004d86577d2bfmr1059539lfk.37.1678825512663;
        Tue, 14 Mar 2023 13:25:12 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id w28-20020ac2443c000000b004ddef915fe4sm518770lfl.274.2023.03.14.13.25.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 13:25:12 -0700 (PDT)
Message-ID: <0fc9ba28-cb78-67fb-4cef-f786c345bc19@linaro.org>
Date:   Tue, 14 Mar 2023 21:25:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 07/14] arm64: dts: qcom: sa8775p: add the Power On device
 node
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
 <20230314183043.619997-8-brgl@bgdev.pl>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230314183043.619997-8-brgl@bgdev.pl>
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
> Add the PON node to PMIC #0 for sa8775p platforms.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
> index 77e2515a7ab9..5d73212fbd16 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
> @@ -12,6 +12,13 @@ pmk8775_0: pmic@0 {
>  		reg = <0x0 SPMI_USID>;
>  		#address-cells = <1>;
>  		#size-cells = <0>;
> +
> +		pmk8775_0_pon: pon@1200 {
> +			compatible = "qcom,pmk8350-pon";
> +			reg = <0x1200>, <0x800>;
reg-names = "hlos", "pbs"

Also, are you sure hlos shouldn't be @1300?

Konrad
> +			mode-recovery = <0x1>;
> +			mode-bootloader = <0x2>;
> +		};
>  	};
>  
>  	pmk8775_1: pmic@2 {
