Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B7CF3DD1B5
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Aug 2021 10:11:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232688AbhHBILu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Aug 2021 04:11:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232657AbhHBILt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Aug 2021 04:11:49 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F317C06175F
        for <linux-gpio@vger.kernel.org>; Mon,  2 Aug 2021 01:11:39 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id n12so20417069wrr.2
        for <linux-gpio@vger.kernel.org>; Mon, 02 Aug 2021 01:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=0x3dgReXcWC1iYS+qAFXrajP0ewYcayc6ZfVqT+YfLM=;
        b=c4ULYQYnFODtSFxOCRIK+uB3bc4g+h2xCaHtmtontDioQWPqE11fRSw1pyTYLspiWE
         ynH5XhNaQuIZnrNns4h7VPbDlJZbNI7igjlBg4Qoukcsq/yuCqJIFUZW7pu0OetCguZn
         OPvV03I9iVBdyZ9BUheiOG+dTxelg9mYMVnUm3BIaq7zyDwTAfNV3+Yp1RMVgPZd3sJz
         U+2oTQwS+YTK6fhoi6hxbZ5nvJYWifv3c55QahSuXEhWLPijdSH+0hnQv+ZtLuY8m2e5
         PWbfXLGnNVBRUqrXXNjiShXRgSBBPhO3doI7jSfTimAn+aw5zMqtpGoFYrDs6rNzCvqz
         6x4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=0x3dgReXcWC1iYS+qAFXrajP0ewYcayc6ZfVqT+YfLM=;
        b=TytjhcIIs+6qAHMCB1PBpw/jp9RbrVASXq93Bf9x37oynfmgptOiBFql7bUJUqI9sw
         4PoxQ5GMh4yR0OCjUDdl0emXfGOV3l3iDp62wE9AcmZ9NulTlabI+dPNrnp7jpmZjho8
         N/kd0yuENbFX1YltdjFW3w15uZAsJW1OfTJqBdxYH/pBofWSOK2Hc21RWz6/hk4AoXbx
         9K71yV7FGrIpudC/BmVqkv/mm3UCIpO6vi1T/ydD8Fo8srNnCYbv9metv4FQg4oh+ANS
         xEYcy03S4kIk4nzVv4H1xtTfRBqGbspaJniS7s/7xfXk4uNNKQGXJwNjP2RXNSjTucuQ
         RoUQ==
X-Gm-Message-State: AOAM5333jG7IglRjVIKMfZLS+wxX3SONgikTisaewwlwawCzQ0TjwYWS
        ON8ADPVtigP+lvHmOeoeLHbrsA==
X-Google-Smtp-Source: ABdhPJyytz0qtGBKDG8wz0JExBsJg4sVp89R90AMZHsqTJLfgh0N2TC4adR2r3yMg0+e/RVuP4cveA==
X-Received: by 2002:adf:eb4a:: with SMTP id u10mr5296618wrn.11.1627891898264;
        Mon, 02 Aug 2021 01:11:38 -0700 (PDT)
Received: from google.com ([109.180.115.228])
        by smtp.gmail.com with ESMTPSA id d15sm10299636wrn.28.2021.08.02.01.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 01:11:37 -0700 (PDT)
Date:   Mon, 2 Aug 2021 09:11:35 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Das Srinagesh <gurus@codeaurora.org>, kgunda@codeaurora.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH V7 1/3] dt-bindings: mfd: pm8008: Add gpio-ranges and
 spmi-gpio compatible
Message-ID: <YQeot5xqsiQqxXkR@google.com>
References: <1627029074-23449-1-git-send-email-skakit@codeaurora.org>
 <1627029074-23449-2-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1627029074-23449-2-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 23 Jul 2021, satya priya wrote:

> Add gpio-ranges and "qcom,spmi-gpio" compatible to match with the
> parent qcom,pmic-gpio.yaml binding.
> 
> Signed-off-by: satya priya <skakit@codeaurora.org>
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

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
