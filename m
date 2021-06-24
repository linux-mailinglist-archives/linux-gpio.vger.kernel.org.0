Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFD4F3B3288
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jun 2021 17:26:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232038AbhFXP3O (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Jun 2021 11:29:14 -0400
Received: from mail-io1-f41.google.com ([209.85.166.41]:42735 "EHLO
        mail-io1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230008AbhFXP3N (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Jun 2021 11:29:13 -0400
Received: by mail-io1-f41.google.com with SMTP id v3so8649491ioq.9;
        Thu, 24 Jun 2021 08:26:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=HOGrYrM6PV3hDIcITNjHdQ5hR0yFg+mdRVz9ZVSehKY=;
        b=AcB5fK9ggx9Rfb8Gg81At9znpYj1WkKdjrzq+pUmE0B4X0f0wD2c6pJa9FW9dLznwB
         KeGy0anBgRQis3JCen6jR9c0sEGUWiYsdaIAexLPJgHAEKJF+LmLb+WopCrqgCUH/eaf
         9+MVUZvhfHjAegYBxPEQcpAQUK8BiO2dxyWKdVMh81uzeANc9gmrQDTX0dE2u/Jp8vW7
         JJFKv9djJAiOAAzd5PmrQwPQuU3rccQzMTlvCDwegWYl8TrW4ku10dU0xMG398oDpQI6
         wumMoaothyngb5e8iEVi+xUvbpxa2q79cyw29mzxHUMBn5laXGBftSq93CS9G20A+31U
         1VSg==
X-Gm-Message-State: AOAM530j/zqD6J9m7cTzHwb254E1CLlDDpOLYHQk4SgqqG13Y0N4ORkp
        rm1GrrA8QEKVwUzMn44wqQ==
X-Google-Smtp-Source: ABdhPJzWP2QA98bwU+FK2Yi3UK9Ab0rpz2jWx9eXkC1Md3Yj8ox+xFZMLtvmpJjlaymU3ExKkp3c5Q==
X-Received: by 2002:a02:ce88:: with SMTP id y8mr5095030jaq.34.1624548413557;
        Thu, 24 Jun 2021 08:26:53 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id h18sm1874242ilr.86.2021.06.24.08.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 08:26:52 -0700 (PDT)
Received: (nullmailer pid 1393281 invoked by uid 1000);
        Thu, 24 Jun 2021 15:26:48 -0000
From:   Rob Herring <robh@kernel.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, marijn.suijten@somainline.org,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, martin.botka@somainline.org,
        devicetree@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        jamipkettunen@somainline.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        angelogioacchino.delregno@somainline.org
In-Reply-To: <20210623175354.248103-1-konrad.dybcio@somainline.org>
References: <20210623175354.248103-1-konrad.dybcio@somainline.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl: qcom: Add bindings for MDM9607
Date:   Thu, 24 Jun 2021 09:26:48 -0600
Message-Id: <1624548408.751488.1393280.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 23 Jun 2021 19:53:51 +0200, Konrad Dybcio wrote:
> Document the newly added MDM9607 pinctrl driver.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
> Changes since v2:
> - Fixed up to use qcom,tlmm-common.yaml as per Bjorn's request
> - NOT added Rob Herring's r-b as the yaml changed somewhat significantly
>  .../pinctrl/qcom,mdm9607-pinctrl.yaml         | 133 ++++++++++++++++++
>  1 file changed, 133 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,mdm9607-pinctrl.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/pinctrl/qcom,mdm9607-pinctrl.example.dt.yaml:0:0: /example-0/pinctrl@1000000: failed to match any schema with compatible: ['qcom,mdm9607-pinctrl']
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1496238

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

