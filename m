Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46D09528815
	for <lists+linux-gpio@lfdr.de>; Mon, 16 May 2022 17:09:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245010AbiEPPI6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 May 2022 11:08:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244989AbiEPPIv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 May 2022 11:08:51 -0400
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5DE33BA42
        for <linux-gpio@vger.kernel.org>; Mon, 16 May 2022 08:08:49 -0700 (PDT)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-e656032735so20531043fac.0
        for <linux-gpio@vger.kernel.org>; Mon, 16 May 2022 08:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=elXgl3dl4vAJoBCDptoYieQAN23eMuUcW0bkSZuX+eg=;
        b=Lwbeh96im5IuvkLt390E8uMSvLj3XCZyRcrLRx3TijXYxvpjKgZjDXvPliCmb7nxSw
         fFp/Yh6O9X6Xkey8sFb2XDSr8tRSKi9EwgIGZxBn6WffAf6ojn8YM7ih1vrS2Xw/cGDa
         G17JMjOSQRFt5CDSdh74cRTW2Z338AtLspsbYSoJ0Nbe3cyxj6akBcSkqcSkFG8iv7O0
         HfLKQAZ5aBnhPx5oorFcXlO+7iAcSzbDl7EIZDS3qQgnSHo+3AFR4f/eow9faQd07am6
         F9e9DOWwSzfybN83/1Y2e6Y7t3xgu3q2lloR8y+4NFX8gTrVvQaeWkgtspNxQpA75ZL6
         X6ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=elXgl3dl4vAJoBCDptoYieQAN23eMuUcW0bkSZuX+eg=;
        b=uZnvd7Vc/y4YZT8psJsMTMc2KXEZBdNPFSAMZ4lPuZFfaLIZfgpTaCnWeMIxKQQQTm
         TTOc0crAIOx+lTm4nESiNHXAYgpx3707KS0ZmqiqPMddGoz7+I7oCvpQoOrVqCCvvAMy
         gvXZGJP49fl9YddSUF5QdOmkD7LQhkY9YWN/MyJZIyM49zHa1OuppkijB210KYxEvKQw
         /TcAWSuKARtVl+ecENWfSdx0Jtq64ayGe9amwB8HHwbw8mSRq3nrF27tkV8JJJWMdQTS
         ZyTAloxh8qgdtbSTik90FtTyNQ00JMHU36v/tALeBLg1Fs6CHGGfLUKyes/GnjmUQ463
         nZ5A==
X-Gm-Message-State: AOAM532M/gSAdgwi5CoBL8odtdTyZRFBKlt0ErUM5Q6xgnya8msWIEdt
        FQuWpP/YaZ9dgKNPNrYras1KRA==
X-Google-Smtp-Source: ABdhPJz9R3vuSmtEtCaD+6qvP3nFEpQD2xGDEu/kZCRoF4eUN1B/cQEcyuXSZo8vowPBOqg5QfmoEw==
X-Received: by 2002:a05:6870:41cc:b0:f1:b014:1107 with SMTP id z12-20020a05687041cc00b000f1b0141107mr1207772oac.185.1652713729077;
        Mon, 16 May 2022 08:08:49 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id o203-20020aca41d4000000b00325cda1ff93sm3910010oia.18.2022.05.16.08.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 08:08:48 -0700 (PDT)
Date:   Mon, 16 May 2022 08:11:12 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Luca Weiss <luca@z3ntu.xyz>, David Heidelberg <david@ixit.cz>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Re: [PATCH 1/4] dt-bindings: pinctrl: qcom,pmic-gpio: add
 'gpio-reserved-ranges'
Message-ID: <YoJpkG6vqXf7HFcN@ripper>
References: <20220508135932.132378-1-krzysztof.kozlowski@linaro.org>
 <20220508135932.132378-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220508135932.132378-2-krzysztof.kozlowski@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun 08 May 06:59 PDT 2022, Krzysztof Kozlowski wrote:

> 'gpio-reserved-ranges' property is already used and supported by common pinctrl
> bindings, so add it also here to fix warnings like:
> 
>   qrb5165-rb5.dtb: gpio@c000: 'gpio-reserved-ranges' does not match any of the regexes: '-state$', 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  .../bindings/pinctrl/qcom,pmic-gpio.yaml      | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
> index 7e74a87ccc39..69195660ee2a 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
> @@ -78,6 +78,12 @@ properties:
>      minItems: 2
>      maxItems: 44
>  
> +  gpio-reserved-ranges:
> +    minItems: 1
> +    # maxItems as half of total number of GPIOs, as there has to be at
> +    # least one usable GPIO between each reserved range.
> +    maxItems: 22
> +
>    '#gpio-cells':
>      const: 2
>      description:
> @@ -107,6 +113,8 @@ allOf:
>          gpio-line-names:
>            minItems: 2
>            maxItems: 2
> +        gpio-reserved-ranges:
> +          maxItems: 1
>  
>    - if:
>        properties:
> @@ -124,6 +132,9 @@ allOf:
>          gpio-line-names:
>            minItems: 4
>            maxItems: 4
> +        gpio-reserved-ranges:
> +          minItems: 1
> +          maxItems: 2
>  
>    - if:
>        properties:
> @@ -137,6 +148,9 @@ allOf:
>          gpio-line-names:
>            minItems: 6
>            maxItems: 6
> +        gpio-reserved-ranges:
> +          minItems: 1
> +          maxItems: 3
>  
>    - if:
>        properties:
> @@ -150,6 +164,9 @@ allOf:
>          gpio-line-names:
>            minItems: 8
>            maxItems: 8
> +        gpio-reserved-ranges:
> +          minItems: 1
> +          maxItems: 4
>  
>    - if:
>        properties:
> @@ -163,6 +180,9 @@ allOf:
>          gpio-line-names:
>            minItems: 9
>            maxItems: 9
> +        gpio-reserved-ranges:
> +          minItems: 1
> +          maxItems: 5
>  
>    - if:
>        properties:
> @@ -182,6 +202,9 @@ allOf:
>          gpio-line-names:
>            minItems: 10
>            maxItems: 10
> +        gpio-reserved-ranges:
> +          minItems: 1
> +          maxItems: 5
>  
>    - if:
>        properties:
> @@ -194,6 +217,9 @@ allOf:
>          gpio-line-names:
>            minItems: 11
>            maxItems: 11
> +        gpio-reserved-ranges:
> +          minItems: 1
> +          maxItems: 6
>  
>    - if:
>        properties:
> @@ -212,6 +238,9 @@ allOf:
>          gpio-line-names:
>            minItems: 12
>            maxItems: 12
> +        gpio-reserved-ranges:
> +          minItems: 1
> +          maxItems: 6
>  
>    - if:
>        properties:
> @@ -224,6 +253,9 @@ allOf:
>          gpio-line-names:
>            minItems: 13
>            maxItems: 13
> +        gpio-reserved-ranges:
> +          minItems: 1
> +          maxItems: 7
>  
>    - if:
>        properties:
> @@ -236,6 +268,9 @@ allOf:
>          gpio-line-names:
>            minItems: 14
>            maxItems: 14
> +        gpio-reserved-ranges:
> +          minItems: 1
> +          maxItems: 7
>  
>    - if:
>        properties:
> @@ -248,6 +283,9 @@ allOf:
>          gpio-line-names:
>            minItems: 16
>            maxItems: 16
> +        gpio-reserved-ranges:
> +          minItems: 1
> +          maxItems: 8
>  
>    - if:
>        properties:
> @@ -261,6 +299,9 @@ allOf:
>          gpio-line-names:
>            minItems: 22
>            maxItems: 22
> +        gpio-reserved-ranges:
> +          minItems: 1
> +          maxItems: 11
>  
>    - if:
>        properties:
> @@ -273,6 +314,9 @@ allOf:
>          gpio-line-names:
>            minItems: 26
>            maxItems: 26
> +        gpio-reserved-ranges:
> +          minItems: 1
> +          maxItems: 13
>  
>    - if:
>        properties:
> @@ -285,6 +329,9 @@ allOf:
>          gpio-line-names:
>            minItems: 36
>            maxItems: 36
> +        gpio-reserved-ranges:
> +          minItems: 1
> +          maxItems: 18
>  
>    - if:
>        properties:
> @@ -297,6 +344,9 @@ allOf:
>          gpio-line-names:
>            minItems: 38
>            maxItems: 38
> +        gpio-reserved-ranges:
> +          minItems: 1
> +          maxItems: 19
>  
>    - if:
>        properties:
> @@ -310,6 +360,9 @@ allOf:
>          gpio-line-names:
>            minItems: 44
>            maxItems: 44
> +        gpio-reserved-ranges:
> +          minItems: 1
> +          maxItems: 22
>  
>  patternProperties:
>    '-state$':
> -- 
> 2.32.0
> 
