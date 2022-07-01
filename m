Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A8EF562E43
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Jul 2022 10:30:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233470AbiGAI3O (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Jul 2022 04:29:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235329AbiGAI2q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Jul 2022 04:28:46 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACEA423BE0
        for <linux-gpio@vger.kernel.org>; Fri,  1 Jul 2022 01:28:44 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id d2so2752808ejy.1
        for <linux-gpio@vger.kernel.org>; Fri, 01 Jul 2022 01:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=KpRihbZiSTt9WSRfafM5Hr6SzD6WulPA9ejW+Q/RSW4=;
        b=urqzcie5Vsin+uIl/jgbKt65PLgul2NzQXuJT76Fp6UK2Nk6X2m4bHrGffOW0JjmuE
         bp3HklF/K6nR3d+yvEq1LonlPa4C73uWvY1875g2tmBhQ/PdioH6R/ArOhhJDOECD+bq
         nMMzilAeWFUFDvsO45lhzLtFgGdjpJnUnF60WFOsm2gccwSmsWDjyjlx79q/Yd9/qMYh
         qTUc2IrHfHMtOrWE3VCLxFa4AXGnAeimo4dqdLdrCUeqzu56YZ7SjQewdsEJj5inHQ/J
         tJPSMqnL/N7HbQIJbl7uhQrOqtV1EyejR6AOOKZr/1swaQrJ8mGrNL9ZFlQXGVfhAsMD
         Ng1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=KpRihbZiSTt9WSRfafM5Hr6SzD6WulPA9ejW+Q/RSW4=;
        b=GYOD43eX8tgOoJn83BKDvWToPbnVryFMriBlYuSafr4wYlBxcbSECmPriArip6hJH1
         RZoMstgBSKerc1vI1w+2v0nN9zOeCOm2Km/zO15B07kZCQ6zuJasslDLnDcLM6qk83wX
         zp2Q3NGzVAhTvgxgoTIHyYaxrn16/ncs/JGEsAMsQ9E6GEwNQrqlyhQl/ykSR3eysQfY
         3yIfGbvacEp5SEhzcmAlE2Ec+5hVwZzwsjRZcynC43XElNDTeAGGvF75efRVjlgWM59o
         7oTEvLQfjxafUPxpRT+Hk/dy9M/EESJY0KqgwLal0VCuVDaXxJWSxwkMzUNChi8ziPyW
         txRw==
X-Gm-Message-State: AJIora97aLc7DSnYp8wNh9TNYB97g9F9KZcs+P7PDXeCSXN1WdGXvLwl
        iK5fRFYYALyM+t7yl9xx0PuUHg==
X-Google-Smtp-Source: AGRyM1tsY/ZhfsK0nitrIZl9qMahGP5WendMPNYNOe5gVtJZkp37q6OwEpwydF354sR9EH6KMrEG0w==
X-Received: by 2002:a17:907:7d8b:b0:726:aad6:f421 with SMTP id oz11-20020a1709077d8b00b00726aad6f421mr12821705ejc.80.1656664123249;
        Fri, 01 Jul 2022 01:28:43 -0700 (PDT)
Received: from [192.168.0.190] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id d16-20020a170906545000b006feb20b5235sm10202295ejp.84.2022.07.01.01.28.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Jul 2022 01:28:42 -0700 (PDT)
Message-ID: <2d63cbf2-8e59-a8db-3faf-747b92d2eb66@linaro.org>
Date:   Fri, 1 Jul 2022 10:28:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] MAINTAINERS: pinctrl: update qcom file list to include
 yaml files
Content-Language: en-US
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        bjorn.andersson@linaro.org, linus.walleij@linaro.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220629092514.70752-1-srinivas.kandagatla@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220629092514.70752-1-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 29/06/2022 11:25, Srinivas Kandagatla wrote:
> Currently Qualcomm pinctrl MAINTAINERS file list does not include yaml
> files. Include this for correctness.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c4648e86dc14..71e7725aa574 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15765,6 +15765,7 @@ M:	Bjorn Andersson <bjorn.andersson@linaro.org>
>  L:	linux-arm-msm@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/pinctrl/qcom,*.txt
> +F:	Documentation/devicetree/bindings/pinctrl/qcom,*.yaml

Instead just:
Documentation/devicetree/bindings/pinctrl/qcom,*

>  F:	drivers/pinctrl/qcom/
>  
>  PIN CONTROLLER - RENESAS


Best regards,
Krzysztof
