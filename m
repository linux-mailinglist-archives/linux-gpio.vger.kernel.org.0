Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24E8D3992D0
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jun 2021 20:49:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229554AbhFBSvI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Jun 2021 14:51:08 -0400
Received: from mail-ot1-f54.google.com ([209.85.210.54]:45626 "EHLO
        mail-ot1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229467AbhFBSvH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Jun 2021 14:51:07 -0400
Received: by mail-ot1-f54.google.com with SMTP id t10-20020a05683022eab0290304ed8bc759so3328542otc.12;
        Wed, 02 Jun 2021 11:49:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RlxUj7bGsFvw2USIB98VuWjgVTpSrZLSh88VYHOyjxA=;
        b=QnGFM0E8v5y48nSkgN0iN7TD4rsuCt4GapuUaagKy2h0kn96EVx+0fwSGU/Iu9FUnj
         5NTkQ+vzrLDtKOPHvhcQ5CA5yg2KDfcwBXhK9FYO3R/MG+iWk07lYvN9SiaL+kipdrMN
         TpIl9Mop7jwv/LtyR0xoIspKseEZfZicvExovusV/C80Mpmf4u+HeBm8s6kctFJa4UYL
         vaVATcoxKTqO5gcLb4vzVoUl5ub9iu/Mf9dVCB9rgbUv5kkH65kaYYqiqLuKneEaoRLv
         pz5+QqbcLX36KwWaDoaxk65yl5vlOd0oXfSuVCxd/CT4jEplGoFlZr2BO8j1G1uyjZ/w
         8e+A==
X-Gm-Message-State: AOAM532/L/YiCZDboiUJvaHE4MNFIp2cyLmIerthDIcWeSku3HJQV43m
        aaVJbc1850we8x+q+AKSaw==
X-Google-Smtp-Source: ABdhPJx5XNMY1INJmrlMN0TFHO/2shEZyUm45YJTxt3+Wj19EVMqfUT3u4NxHJre+JeoflKmJQZw6Q==
X-Received: by 2002:a05:6830:119a:: with SMTP id u26mr4585253otq.87.1622659764221;
        Wed, 02 Jun 2021 11:49:24 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x8sm140181oiv.51.2021.06.02.11.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 11:49:23 -0700 (PDT)
Received: (nullmailer pid 3762130 invoked by uid 1000);
        Wed, 02 Jun 2021 18:49:22 -0000
Date:   Wed, 2 Jun 2021 13:49:22 -0500
From:   Rob Herring <robh@kernel.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-gpio@vger.kernel.org, Andy Gross <agross@kernel.org>,
        devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        kgunda@codeaurora.org, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V4] dt-bindings: pinctrl: qcom-pmic-gpio: Convert qcom
 pmic gpio bindings to YAML
Message-ID: <20210602184922.GA3762097@robh.at.kernel.org>
References: <1621578615-4613-1-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621578615-4613-1-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 21 May 2021 12:00:15 +0530, satya priya wrote:
> Convert Qualcomm PMIC GPIO bindings from .txt to .yaml format.
> 
> Signed-off-by: satya priya <skakit@codeaurora.org>
> ---
> Changes in V2:
>  - As per Rob's comments fixed bot erros.
>  - Moved this patch to end of the series so that other patches are not
>    blocked on this.
> 
> Changes in V3:
>  - As per Rob's comments, added maxItems for reg and interrupts.
>    Added reference of "pinmux-node.yaml" and "pincfg-node.yaml".
>    Made 'additionalProperties' as false.
> 
> Changes in V4:
>  - As per Rob's comments, added description for interrupts, defined
>    constraints for "qcom,drive-strength", dropped description for function
>    property.
> 
>  .../devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 286 ---------------------
>  .../bindings/pinctrl/qcom,pmic-gpio.yaml           | 256 ++++++++++++++++++
>  2 files changed, 256 insertions(+), 286 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
