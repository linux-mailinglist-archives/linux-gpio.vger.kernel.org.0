Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 838D271FD2B
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jun 2023 11:10:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234832AbjFBJKQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Jun 2023 05:10:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233908AbjFBJJh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Jun 2023 05:09:37 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 828591728
        for <linux-gpio@vger.kernel.org>; Fri,  2 Jun 2023 02:08:05 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4f6067a9029so2233335e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 02 Jun 2023 02:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685696883; x=1688288883;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QzUaWnynIThHp3wYMq9RJrcT9lEzhLBhWFn+M0bToOw=;
        b=ZAOEvq4sE8gXzvryPEgB8TuxwcXUVOcc5WNP4MU9pZ7Cm85bTB42QxPJBXBT4QUUM/
         qb32MDwsISGFWjdXkFnjfmMw+P39QAujSCnSI4s/4Wuoz0+xrGzBb+Vq/Zy1dYB94Iye
         ytOXbB8dXBaQq672qdHYQ9L10FE2wBjBwc8CKKeiUdZmSENEUsLWeWC77QsXZT8q8WFv
         WVX69ZUem8W96C3T1sN+Ey2FQOD6Y4VCW4AK6+q7vI/8xBNXjSg4cr+7ro+RCJgWNI/W
         CJ6RKVhdxt06a5CjINrB8QmT32Oeu+0HXkr+D6HPAjX+Q+sV0SDeGWnXrMR1q/9tDiSH
         RvhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685696883; x=1688288883;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QzUaWnynIThHp3wYMq9RJrcT9lEzhLBhWFn+M0bToOw=;
        b=JDjPRf/YqtdxC5VZ5lkmOlUVORXsoOHtnrZNRllVBdgOcpQEVZcYynzUrq1CaqS1Hf
         dzoVKUZG3DDOS+POuRjxmRG1n9nXq2HHlVUyfyckE3TJRyrCX5Y7eeqS1m5MS+UU+JNd
         70GH3x3SiJW36AHSzCnO/GM5qhzWmsQLUfUTqfA/tQnuNsv6vgAL12clk7/I6RAGeIou
         BB14GaojNfojisjtXn2s0DHmZJtxf7ooEX4uoxmV2egipf9spWYaY3ndgHF75RzszqD4
         0qsNfhwgrbDXeDqFm0RG8RozuNL43bNpO+MYgpSHwjjOQeqg5b+ds4Q+BXq8fu0kmqZ2
         5veA==
X-Gm-Message-State: AC+VfDxy6qC1qyiwmgc76nfvB/0wKnT0cN3zsx8vs/k8zAUiroKYrFqV
        d5AlN8Wzuhdb6VQpHsdg7uXwFw==
X-Google-Smtp-Source: ACHHUZ6CVTwCKkIVO3jrU3f5xp5gnZ1XgYNwvotAt0SgJIOZpLt/FNEoRI4fgGX7mVnJErOrgqtngA==
X-Received: by 2002:a2e:b018:0:b0:2a8:c82f:2996 with SMTP id y24-20020a2eb018000000b002a8c82f2996mr1316357ljk.43.1685696882943;
        Fri, 02 Jun 2023 02:08:02 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id t2-20020a2e7802000000b002ac87c15fd4sm148889ljc.95.2023.06.02.02.08.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jun 2023 02:08:02 -0700 (PDT)
Message-ID: <8f364aac-f9f3-4b85-9718-78f084bdf104@linaro.org>
Date:   Fri, 2 Jun 2023 11:08:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 6/8] pinctrl: qcom: allow true compile testing
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20230601152026.1182648-1-krzysztof.kozlowski@linaro.org>
 <20230601152026.1182648-6-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230601152026.1182648-6-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 1.06.2023 17:20, Krzysztof Kozlowski wrote:
> Makefile selected Qualcomm pinctrl drivers only for ARCH_QCOM, making
> any COMPILE_TEST options inside Kconfig ((ARCH_QCOM || COMPILE_TEST) or
> (OF || COMPILE_TEST)) not effective.  Always descent to the qcom
> subdirectory to fix this.  All individual drivers are selected in
> Makefile via dedicated CONFIG entries, thus this should not have
> functional impact except when compile testing.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Should analogous changes be made for all remaining
obj-$(CONFIG_PINCTRL_VENDOR) entries?

Konrad
>  drivers/pinctrl/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
> index e196c6e324ad..482b391b5deb 100644
> --- a/drivers/pinctrl/Makefile
> +++ b/drivers/pinctrl/Makefile
> @@ -66,7 +66,7 @@ obj-y				+= nomadik/
>  obj-y				+= nuvoton/
>  obj-y				+= nxp/
>  obj-$(CONFIG_PINCTRL_PXA)	+= pxa/
> -obj-$(CONFIG_ARCH_QCOM)		+= qcom/
> +obj-y				+= qcom/
>  obj-$(CONFIG_PINCTRL_RENESAS)	+= renesas/
>  obj-$(CONFIG_PINCTRL_SAMSUNG)	+= samsung/
>  obj-$(CONFIG_PINCTRL_SPEAR)	+= spear/
