Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D75F571FCF6
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jun 2023 11:02:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234733AbjFBJCk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Jun 2023 05:02:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232404AbjFBJCP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Jun 2023 05:02:15 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78842E5C
        for <linux-gpio@vger.kernel.org>; Fri,  2 Jun 2023 02:02:08 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4f4b0a0b557so2386929e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 02 Jun 2023 02:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685696527; x=1688288527;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jn9KtYEytTDklN/wQkH8WvxRZbrq0Tj5SoO/tfynL90=;
        b=mJxOIDCJTBPGRPWCNOUKmtahZkupvKIyoXJ/+x2AMV15Xgm8Vz/PMjLOR5RdCb3g31
         A8ruFpiAO9jTT5oSO0TAivmUaZ7I0oRzMAabyVrRxxXC2ZD7JIqBXjnRdLYEtPsi+kZ4
         neXXyjevKNtR/s4z4tMi6mZygiZ+13QPX7TdGXHFJQ0TZl0r3aieb+qfsyxTIg6hnpSz
         c46cYUbAiaBPRnQ9bQjuYyzhvMSDWTjUJGmml1kfVI375XjjkOCoijrvM9yAP7pbggtf
         LzZ8fBZA6CRux9JHJsZz4z24wZwF6eZRh/4vbVytxf1upY6MvGYw/ct/+YTaEYJCXQmr
         0gsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685696527; x=1688288527;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jn9KtYEytTDklN/wQkH8WvxRZbrq0Tj5SoO/tfynL90=;
        b=Tx3GV8m1zN+ve9XwrYFDn/ECEkVZOHGf5n94EG3+OyoVkCEexunBAZ5TZGJQ6olRMk
         xJVqMBMO90T7vrYSlTLwST1U1WpoiwNAFf2NvwGRly/W9oANyxlPWmLxxHqy6p/4Urk5
         H0DqzNF8zA84Z+oOQUwnhdB7g9gpWXw7giTVCHyIUeitph5nipdtehDz3rkrZxqDlzyE
         sXbhvOQNUb+Z02Yeh9zu3B6XnRMWePDnwkyT/wko6oo1rFFTmw8T7C6C+xajPF2HeDkK
         MhDvJhQCV2qLgrYtdnRry9d7Fn+W3T7IbFxZc/r+2qB+WrL6qWmPh5dm6OypJR9z5vy4
         MD5w==
X-Gm-Message-State: AC+VfDwQbiixAC2NhDanTvc00ydm3wnEtxh20+7kg30Aj4CldUu0Cug1
        /3eptGq1gl5Ue9+QiJrpoK+XNQ==
X-Google-Smtp-Source: ACHHUZ5uiS5fhyuwDiDuWRBZFmoz0muJPJMEusndEmE656pv7iMJUjq73YIQYckseG5HzNpf1xqNHw==
X-Received: by 2002:ac2:5397:0:b0:4f1:5015:43c4 with SMTP id g23-20020ac25397000000b004f1501543c4mr1684956lfh.38.1685696526762;
        Fri, 02 Jun 2023 02:02:06 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id h18-20020ac25972000000b004efd3c2b746sm95597lfp.162.2023.06.02.02.02.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jun 2023 02:02:06 -0700 (PDT)
Message-ID: <ea2c099b-7bfe-2056-00d8-b99fb24e6cf4@linaro.org>
Date:   Fri, 2 Jun 2023 11:02:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 2/8] pinctrl: qcom: fix indentation in Kconfig
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20230601152026.1182648-1-krzysztof.kozlowski@linaro.org>
 <20230601152026.1182648-2-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230601152026.1182648-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 1.06.2023 17:20, Krzysztof Kozlowski wrote:
> Use tab for correct Kconfig indentation.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/pinctrl/qcom/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
> index 28b19458b20d..9f957d16cd68 100644
> --- a/drivers/pinctrl/qcom/Kconfig
> +++ b/drivers/pinctrl/qcom/Kconfig
> @@ -245,7 +245,7 @@ config PINCTRL_QCOM_SPMI_PMIC
>  	select PINMUX
>  	select PINCONF
>  	select GENERIC_PINCONF
> -  select GPIOLIB
> +	select GPIOLIB
>  	select GPIOLIB_IRQCHIP
>  	select IRQ_DOMAIN_HIERARCHY
>  	help
> @@ -260,7 +260,7 @@ config PINCTRL_QCOM_SSBI_PMIC
>  	select PINMUX
>  	select PINCONF
>  	select GENERIC_PINCONF
> -  select GPIOLIB
> +	select GPIOLIB
>  	select GPIOLIB_IRQCHIP
>  	select IRQ_DOMAIN_HIERARCHY
>  	help
