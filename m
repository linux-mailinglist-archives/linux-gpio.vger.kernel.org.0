Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC40D62BB78
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Nov 2022 12:22:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239218AbiKPLWm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Nov 2022 06:22:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233719AbiKPLWZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Nov 2022 06:22:25 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A97BE3136C
        for <linux-gpio@vger.kernel.org>; Wed, 16 Nov 2022 03:11:35 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id p8so28933761lfu.11
        for <linux-gpio@vger.kernel.org>; Wed, 16 Nov 2022 03:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KNZ4Igio5emEh4SkCJ3dHZOYQ982mq8RJOosJ99k5uM=;
        b=lBg2RM6woSINCU91J9E09hX5j33mC66M3DopJVCqj+jrh4LjlkPSRKPTCHnTzOYS/u
         b8hyqhXH4rjSyRQN/r+iZHmi+KT0f0GI/lK9EEOuomO9tRYd8VIt36xViG8hWTIA5HEN
         NgQp64wVbiUHA40S4QEIjgOLoguhDkhOSiBeof/4nkQqwgUiqaXL6piOXc64j1KF6MGA
         N8VSv/ueHpXVMd+gi+jAxGnFlEU0iDWf7bBXXFY1eLQHfjNmgd8Szga99w739Tufk6At
         hiPiYvG3v6dr0/8wxrn8eGXeNWoElaStAqlbz+tr5AV8/w442jcA66yQ5Av0sS5E2wsL
         kdYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KNZ4Igio5emEh4SkCJ3dHZOYQ982mq8RJOosJ99k5uM=;
        b=DWq8GQ6QiufvFhzoojPnSqErBZ2cUH4eHjE4H9VvjCOCWR2eXYP5ILwDMykHIpO9jB
         7MyDkug/qFtE9qj9fcK2OuRXVzMVRLEWYvF4bLG4IEIkJ7DajP4c2Nh3UCkD+J4i7Fd5
         aQo5b11udKpsagFb1BFse1y2R8tmISCYzP/rKdwx8mfg6x0+lq818VANGLrtq6K5/Lo/
         YhCd+knfZnXSVlFcH2pVy61K9n5IFF5iPxT0EGfQZ2IVhsF0os6k7V8smvZgJMxv5qTc
         YolEdXE6iYT7gUCfLimOcYMvhid5oL7kP2eRYJo/v6riRuj7Mh+OaQIB7qHg18zO5E35
         R8ww==
X-Gm-Message-State: ANoB5pm2Oz2OtrIRvyDe7U7atWP+AjarxXKH8G0SMT0i3wVPT1qUktZ5
        jmpliIK1RJFYvMcmHDsRy0yGxQ==
X-Google-Smtp-Source: AA0mqf7leKzTD8bPA93rlmYWzQPCMtDob6HMY0WIYlf1BncUT12Xsw5M1ORa/egEqsTcAeu26jKOfA==
X-Received: by 2002:a05:6512:2033:b0:4b0:8a8f:8e28 with SMTP id s19-20020a056512203300b004b08a8f8e28mr6511086lfs.682.1668597093955;
        Wed, 16 Nov 2022 03:11:33 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id f31-20020a0565123b1f00b004b3b7557893sm2539160lfv.259.2022.11.16.03.11.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 03:11:33 -0800 (PST)
Message-ID: <af028226-3678-86f6-6a02-3bd4e71e137b@linaro.org>
Date:   Wed, 16 Nov 2022 12:11:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/4] dt-bindings: pinctrl: qcom,tlmm-common: document i2c
 pull property
Content-Language: en-US
To:     Abel Vesa <abel.vesa@linaro.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20221116105724.2600349-1-abel.vesa@linaro.org>
 <20221116105724.2600349-3-abel.vesa@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221116105724.2600349-3-abel.vesa@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 16/11/2022 11:57, Abel Vesa wrote:
> From: Neil Armstrong <neil.armstrong@linaro.org>
> 
> Document the new i2c_pull property introduced for SM8550 setting
> an I2C specific pull mode on I2C able pins.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Your SoB is missing and this patch cannot be before the first.

> ---
>  .../devicetree/bindings/pinctrl/qcom,tlmm-common.yaml          | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
> index e1354f0c64f8..eddd58eafba9 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
> @@ -77,6 +77,9 @@ $defs:
>        input-enable: true
>        output-high: true
>        output-low: true
> +      qcom,i2c-pull:
> +        type: boolean
> +        description: enable bias pull feature designed for i2c on pin

s/i2c/I2C/

>  
>      allOf:
>        - $ref: pincfg-node.yaml#

Best regards,
Krzysztof

