Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B22B390701
	for <lists+linux-gpio@lfdr.de>; Tue, 25 May 2021 18:58:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231895AbhEYRAS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 May 2021 13:00:18 -0400
Received: from mail-oi1-f180.google.com ([209.85.167.180]:35779 "EHLO
        mail-oi1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230451AbhEYRAR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 May 2021 13:00:17 -0400
Received: by mail-oi1-f180.google.com with SMTP id v22so30933610oic.2;
        Tue, 25 May 2021 09:58:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=+Ub17SKUCiFrW/0XnMAb39e/HKd8J7ZuUG7/Pe9ECTU=;
        b=K2h7bnaRGKKPIkMXjAhPPjuY1ygk5HKDuwDFOotHjkndId8NjJmUWkITC/fnt1f/pU
         Gw8C12DUxVGseQFhGt6JC0HcSo1zHMWd1+xemXGOpPTd0caB6FQMzh9Fwj8aY7M95Xsk
         U3yA34QWUTM49K85wDwkmq5Jzi1CD4LWr/6fpBVEv89nrvsOXuDZW4fcv6jHSy6GVfrA
         XYhK5bYuQN+MIZhGYiIHvvBCiMAgC9cnBSTGmcFHtLuepuUUYuaMfgZB+TiHgFoLm3oi
         tmNqCcrk59eGsdQbm4sfLkPWkGfhWaTSW/H9oU/m8j+o/HSdQfNnCth6mbIULBt52cMY
         U+7g==
X-Gm-Message-State: AOAM531u1cZVMI4SLwEtAPJ2eUax89zFa64wXsfDdMMvbNGGWt/IE7bd
        cdvM29Th6Nqk5e2/DcxQ1w==
X-Google-Smtp-Source: ABdhPJwgCGUg2pkmWn431sPZ2Rha6dEqNzcF+M+tHOxzTgWGI4V4nVhgN6ikfmP91QTxww3QomGT8g==
X-Received: by 2002:aca:602:: with SMTP id 2mr14477308oig.113.1621961925868;
        Tue, 25 May 2021 09:58:45 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id j33sm3635838otj.72.2021.05.25.09.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 09:58:44 -0700 (PDT)
Received: (nullmailer pid 18644 invoked by uid 1000);
        Tue, 25 May 2021 16:58:43 -0000
From:   Rob Herring <robh@kernel.org>
To:     Martin Botka <martin.botka@somainline.org>
Cc:     linux-gpio@vger.kernel.org,
        angelogioacchino.delregno@somainline.org,
        Rob Herring <robh+dt@kernel.org>, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        jamipkettunen@somainline.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org
In-Reply-To: <20210524193012.592210-1-martin.botka@somainline.org>
References: <20210524193012.592210-1-martin.botka@somainline.org>
Subject: Re: [PATCH V3 1/2] dt-bindings: pinctrl: qcom: sm6125: Document SM6125 pinctrl driver
Date:   Tue, 25 May 2021 11:58:43 -0500
Message-Id: <1621961923.316297.18643.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 24 May 2021 21:30:09 +0200, Martin Botka wrote:
> Document the newly added SM6125 pinctrl driver
> 
> Signed-off-by: Martin Botka <martin.botka@somainline.org>
> ---
> Changes in V2:
> Add commit description
> Changes in V3:
> Fix syntax errors
> Remove not needed state from example
>  .../bindings/pinctrl/qcom,sm6125-pinctrl.yaml | 134 ++++++++++++++++++
>  1 file changed, 134 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.example.dt.yaml:0:0: /example-0/pinctrl@500000: failed to match any schema with compatible: ['qcom,sm6125-pinctrl']

See https://patchwork.ozlabs.org/patch/1482937

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

