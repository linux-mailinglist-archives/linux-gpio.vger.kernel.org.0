Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CB583D4F6C
	for <lists+linux-gpio@lfdr.de>; Sun, 25 Jul 2021 20:17:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231189AbhGYRhO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 25 Jul 2021 13:37:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230244AbhGYRhO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 25 Jul 2021 13:37:14 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04471C061764
        for <linux-gpio@vger.kernel.org>; Sun, 25 Jul 2021 11:17:43 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id 48-20020a9d0bb30000b02904cd671b911bso7734286oth.1
        for <linux-gpio@vger.kernel.org>; Sun, 25 Jul 2021 11:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=sswnSXSh197nslKDxXOTclBgYIN74ZxttZPIZEPCju4=;
        b=ht29vs68FcSwPAZQyqQVAnK4RvwQwB8upF5Qyf8QVeleL84dga0CF5zXIDgzt6mZx+
         s+iIf7G0Rzphde/JrZ6v5sT3oG31RvXqrOK/2am0KbQWxXm5r3PJK0ezUFXChv4zy7oW
         yIQRkQ0zzOP2Xnnw8MqBfUC7ccgwef7Uhy6zieuTEu/z+8DbHLgv5g7gUHGTaz8WKOsi
         aZyf11ZJrXnlhakR11BKTwMEDZmI1vjVsP/+HCo2Z91ZhpQ1EESXBwVfaUM34MpQYfFW
         wxUs8MyZ49PdDgvwxGNFeeEDlzwwscZL6KOb6m/KWjfHbby9+QKMLM2lx87510I6o1TH
         2yPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sswnSXSh197nslKDxXOTclBgYIN74ZxttZPIZEPCju4=;
        b=lXJ3c4+T9uG2PGqUrxUohHFM8DIqTyXAa6U7tg1xe7pGN8w0bB/fp6fFBjgRT63ywd
         jij1rg78cxnpG1Z1mdA6tfnVJgj01vWu+GYZBgBEzE+b0LOKeixwH9y2fdcRgG2Wj0+n
         7tDrd9wff3UrC/zdpy6lStVe+3OLmoXByVgg9l9xR5JACiNnAGbfgsekTvMMt1vgytq2
         F+1IcVR+4QCGrpOQ92tZgA/CWqxbEWRVn6wYr1JO/uxDrZ3OVYFrnziLrCh0exULlept
         zVmF+3pfSJEFKw2KFqmrgOcPWFrPv3q2EGO+Yih7n3Nad+lKNQt5hL3hcq6/vwTuzNjn
         sWZA==
X-Gm-Message-State: AOAM533LbQ/Q6Z3KcMF1b5goA6rVcQ9gnnrN9xmu6k/Gn+C0uJiTQyik
        5x7ztvpQyvHh3CBPGzKjeRO5yg==
X-Google-Smtp-Source: ABdhPJzqXUAQfTJzM5uGDuuYAIFHVt1QfUg6wB4yj7Nkjgw7rlxyy9f48ybB1v7Q90LiaZdJk8U7Lg==
X-Received: by 2002:a05:6830:4108:: with SMTP id w8mr9811615ott.216.1627237063253;
        Sun, 25 Jul 2021 11:17:43 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id y61sm6824329ota.31.2021.07.25.11.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jul 2021 11:17:42 -0700 (PDT)
Date:   Sun, 25 Jul 2021 13:17:40 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Das Srinagesh <gurus@codeaurora.org>, kgunda@codeaurora.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH V7 1/3] dt-bindings: mfd: pm8008: Add gpio-ranges and
 spmi-gpio compatible
Message-ID: <YP2qxMTaTb+i1+W1@yoga>
References: <1627029074-23449-1-git-send-email-skakit@codeaurora.org>
 <1627029074-23449-2-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1627029074-23449-2-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri 23 Jul 03:31 CDT 2021, satya priya wrote:

> Add gpio-ranges and "qcom,spmi-gpio" compatible to match with the
> parent qcom,pmic-gpio.yaml binding.
> 
> Signed-off-by: satya priya <skakit@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

But it doesn't capture the full binding of qcom,pm8008-gpio - which is
properly described by the end of this series. As such I expect that any
non-trivial usage of the pm8008-gpio in a dts will fail dts validation.

I still think this patch can be merged, but I don't think we're done
expressing the PMIC bindings.

Regards,
Bjorn

> ---
> Changes in V7:
>  - This is newly added in V7 to resolve below error.
>  dtschema/dtc warnings/errors:
>  /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/qcom,pm8008.example.dt.yaml: gpio@c000: compatible: ['qcom,pm8008-gpio'] is too short
> 	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
>  /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/qcom,pm8008.example.dt.yaml: gpio@c000: 'gpio-ranges' is a required property
> 	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
> 
>  Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
> index 7799368..ec3138c 100644
> --- a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
> +++ b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
> @@ -53,7 +53,9 @@ patternProperties:
>  
>      properties:
>        compatible:
> -        const: qcom,pm8008-gpio
> +        items:
> +          - const: qcom,pm8008-gpio
> +          - const: qcom,spmi-gpio
>  
>        reg:
>          description: Peripheral address of one of the two GPIO peripherals.
> @@ -61,6 +63,9 @@ patternProperties:
>  
>        gpio-controller: true
>  
> +      gpio-ranges:
> +        maxItems: 1
> +
>        interrupt-controller: true
>  
>        "#interrupt-cells":
> @@ -75,6 +80,7 @@ patternProperties:
>        - gpio-controller
>        - interrupt-controller
>        - "#gpio-cells"
> +      - gpio-ranges
>        - "#interrupt-cells"
>  
>      additionalProperties: false
> @@ -107,10 +113,11 @@ examples:
>          interrupt-parent = <&tlmm>;
>          interrupts = <32 IRQ_TYPE_EDGE_RISING>;
>  
> -        gpio@c000 {
> -          compatible = "qcom,pm8008-gpio";
> +        pm8008_gpios: gpio@c000 {
> +          compatible = "qcom,pm8008-gpio", "qcom,spmi-gpio";
>            reg = <0xc000>;
>            gpio-controller;
> +          gpio-ranges = <&pm8008_gpios 0 0 2>;
>            #gpio-cells = <2>;
>            interrupt-controller;
>            #interrupt-cells = <2>;
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
> of Code Aurora Forum, hosted by The Linux Foundation
> 
