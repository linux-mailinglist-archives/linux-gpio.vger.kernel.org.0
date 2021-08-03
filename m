Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9903C3DE777
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Aug 2021 09:49:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234214AbhHCHt6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Aug 2021 03:49:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234209AbhHCHt5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Aug 2021 03:49:57 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0AF5C06175F
        for <linux-gpio@vger.kernel.org>; Tue,  3 Aug 2021 00:49:46 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id k38-20020a05600c1ca6b029025af5e0f38bso1041835wms.5
        for <linux-gpio@vger.kernel.org>; Tue, 03 Aug 2021 00:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=olV9WA7qn9JXM9Zr1zOTL5eTwtsnMh9ztbodG7vQpFw=;
        b=aEVArW1QkUe7FYeYyaPKB3VIMJoTvfuFgc1uZTiBqzJ2V5hNlfiVMVVsjEiF5cziV+
         q8+mQCNShmms13eeDvQnq0uwsnrBa7NL+SzEsFuS2wuxsQUv5QihPm7YhA2Gx9sieOQA
         Q3adYXZBRXhqX7HImQzcErqKgC8lEQD0FrQqy2C9WlYpL3KwR9+Gvuz0zeCNQ3GA969E
         Snb7JajiIyUz5+4qzPRu+2A/XvNEP41F6w7As1BCAmwfM5dp2I0gwJf52Yku505CBece
         /AX2BRvQGU8fvHVjtU+TW23mR/umKGR+aFteeZolPKjN+/KrlJlRBCemStgiSo9hyeiA
         trlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=olV9WA7qn9JXM9Zr1zOTL5eTwtsnMh9ztbodG7vQpFw=;
        b=HimOdU8+t8ZzPUz++RmC6gaIRSjR32AjUv31QbSeQeP4W/YUVRKeRimk9fQE4/zf4h
         ITOi/ckn3nE1j0q8DFrTQlv/gMPfKtg6Ij+asZ4H2KD7JvMME9zkqbROsOzWLBme2inX
         7e0ODqDouqk5hKpiZwt44Xokkom+4vuQHxG8jW7/tB4rCmzow9UdD1fxxsCyhAxShhpg
         uszVw6Evpt+o4RqhP/UdNQWYBxlGdprW8YZFhj2cUHZmJduAsU0avduNdh5vjknJhMUM
         lnZ5SLKUI5IaPVEj4Lzq4bh1pFnRJWIUb06roZiIXIlwpmgkGy7E6rZLOA1BK5kcpxOB
         vuzw==
X-Gm-Message-State: AOAM531PCB+0RMtkIE9gxXIj09o1rdvHeAPmvOolWMZwlXNMNyztVHMz
        aCyE+2RwHKj6gAAmVo+YSXy6QA==
X-Google-Smtp-Source: ABdhPJxDnLCFN1pccysx/SKvMPBNDxfhcCF0B0cYPAeIk61rZ06he6Pgi5l6+Ow0W5TjGSSuX0Qk2w==
X-Received: by 2002:a1c:4b12:: with SMTP id y18mr2752711wma.67.1627976985341;
        Tue, 03 Aug 2021 00:49:45 -0700 (PDT)
Received: from google.com ([109.180.115.228])
        by smtp.gmail.com with ESMTPSA id 104sm14068498wrc.4.2021.08.03.00.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Aug 2021 00:49:44 -0700 (PDT)
Date:   Tue, 3 Aug 2021 08:49:43 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        bhupesh.sharma@linaro.org, Das Srinagesh <gurus@codeaurora.org>,
        kgunda@codeaurora.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [RESEND PATCH V7 1/3] dt-bindings: mfd: pm8008: Add gpio-ranges
 and spmi-gpio compatible
Message-ID: <YQj1FwSyxpblwaxj@google.com>
References: <1627910464-19363-1-git-send-email-skakit@codeaurora.org>
 <1627910464-19363-2-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1627910464-19363-2-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 02 Aug 2021, satya priya wrote:

> Add gpio-ranges and "qcom,spmi-gpio" compatible to match with the
> parent qcom,pmic-gpio.yaml binding.
> 
> Signed-off-by: satya priya <skakit@codeaurora.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Reviewed-by: Guru Das Srinagesh <gurus@codeaurora.org>
> ---
> Changes in V7:
>  - This is newly added in V7 to resolve below error.
>  dtschema/dtc warnings/errors:
>  /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/qcom,pm8008.example.dt.yaml: gpio@c000: compatible: ['qcom,pm8008-gpio'] is too short
> 	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
>  /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/qcom,pm8008.example.dt.yaml: gpio@c000: 'gpio-ranges' is a required property
> 	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
> 
> Changes in RESEND V7:
>  - Rebased on linux-next.
> 
>  Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
