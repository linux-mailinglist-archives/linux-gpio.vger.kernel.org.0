Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A3C25E9C5C
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Sep 2022 10:47:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234500AbiIZIrS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Sep 2022 04:47:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234422AbiIZIrO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Sep 2022 04:47:14 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C39324082
        for <linux-gpio@vger.kernel.org>; Mon, 26 Sep 2022 01:47:05 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id a14so6593943ljj.8
        for <linux-gpio@vger.kernel.org>; Mon, 26 Sep 2022 01:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=vrv065D+ctkztUjNUa3Jmz1/DXnw7DhEXSuZPsqfZUM=;
        b=J071zhv/iyvxBhhD3psGEI6Cg1DZGDrWbj/a2rzs1PQrBZVi1x4YFbVXd+qF8v1zeM
         L5LcIQmhQXg+djyOPZlWWjEH+2xODIqEOphDzDqNuV+U/0uYUKhy09ZIsGrBweC6pKJa
         ucZJ5Rvx0mqq7jjlw4fcxWPltrTPib8k3vLvTPGV/DukWFB+dhhjprSk5yGd/ggRY6TA
         skkp+RGujF6/85kzXHXolxPh0l4y9aTeTn2KdGvufQoCQOyBXW0M+gIWNpUqERTg++UJ
         iwtcvRRvx+9130yMOkp9pG77Ghe9H2+TJ3G5r3QhBWKXwAQxVZefiQptIznsD90ckZT7
         ppSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=vrv065D+ctkztUjNUa3Jmz1/DXnw7DhEXSuZPsqfZUM=;
        b=LMjwi2q0LZQv4eaeaB2AGTHoMHwrqc+Fdy9wvfp/kqSvEdRDnwQWlF4iNh7EB9epc8
         hw6rFyWHc9pzaghHWqCXqBGdql3O2nIt+8QfyvD7caHrhcg6Kt67Nq37Tpi4iuiCXUOI
         4bYIWGVtO0NhGkvNp+LHdd+LI55634hnLzFguSj0+s1eZDZnTQ5D4Z+doo90+i16ZePA
         JC8Y2tH3GmvOxY6pEt/tHf5UMg7egeYV1NATl9bhqrmpbGikfjVsds7xeePHjdThzZqd
         43D1Hi86CY0t/FxTTqDbxV0wFHLZfHK2NActVtha0Ie31qZhWMmzGAecKm12GRXW50cj
         er7w==
X-Gm-Message-State: ACrzQf2Ed62nyPZx5xHwrqGJhW950khp6bJzoXGY3d2KVyEqfO3cHVJS
        0AxaRIfrN9e2ZZ3d4jS9LIAkVw==
X-Google-Smtp-Source: AMsMyM6LLIPv9bce/eO6Q1DzKsESf0rQUW8AIaaA5vkZLY+uRsnwWBGJc9Ve5Sr0LN9Vt9PSnwuvlQ==
X-Received: by 2002:a2e:b74b:0:b0:26c:5cf3:cc87 with SMTP id k11-20020a2eb74b000000b0026c5cf3cc87mr7568481ljo.75.1664182023890;
        Mon, 26 Sep 2022 01:47:03 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id z17-20020a05651c11d100b0026c1cbbf464sm2289057ljo.112.2022.09.26.01.47.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 01:47:03 -0700 (PDT)
Message-ID: <98adff9a-e55c-1b3a-4951-e569ff25499f@linaro.org>
Date:   Mon, 26 Sep 2022 10:47:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 12/15] dt-bindings: pinctrl: qcom,sm8250: fix matching pin
 config
Content-Language: en-US
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220925110608.145728-1-krzysztof.kozlowski@linaro.org>
 <20220925110608.145728-13-krzysztof.kozlowski@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220925110608.145728-13-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 25/09/2022 13:06, Krzysztof Kozlowski wrote:
> The TLMM pin controller follows generic pin-controller bindings, so
> should have subnodes with '-state' and '-pins'.  Otherwise the subnodes
> (level one and two) are not properly matched.  This method also unifies
> the bindings with other Qualcomm TLMM and LPASS pinctrl bindings.
> 
> The change causes indentation decrement, so the diff-hunk looks big, but
> there are no functional changes in the subnode "properties" section.
> The only difference there is removal of blank lines between common GPIO
> pinconf properties.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/pinctrl/qcom,sm8250-pinctrl.yaml | 145 +++++++++---------
>  1 file changed, 75 insertions(+), 70 deletions(-)
> 

(...)

> +
> +    required:
> +      - pins
> +
> +    allOf:
> +      - $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
> +      - if:
> +          properties:
> +            pins:
> +              pattern: "^gpio([0-9]|[1-9][0-9]|1[0-7][0-9])$"
> +        then:
> +          required:
> +            - function

In my other patchset, I moved this if:then: to common schema, therefore
this patch will be later rebased. All other patches in the patchset are
free to go, so far.

Best regards,
Krzysztof

