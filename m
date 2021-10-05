Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F0D1422677
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Oct 2021 14:27:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234912AbhJEM2v (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Oct 2021 08:28:51 -0400
Received: from mail-oi1-f172.google.com ([209.85.167.172]:42959 "EHLO
        mail-oi1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234835AbhJEM2m (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Oct 2021 08:28:42 -0400
Received: by mail-oi1-f172.google.com with SMTP id x124so25920159oix.9;
        Tue, 05 Oct 2021 05:26:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=2osazg+rgssFYou7cJPxJJYsoEViInPF7W7tjIEWU+o=;
        b=7kM7P46OQSeYaRinmjadZwEO1OMmhvK2c80/tXcDKNw2uq4nq8N5Jc+8OfAycMf/TE
         3qCAcYXT6ZqwMRMSyqGIhD34ZoY8JPIEyK3mwZnzI1vLaYLdVe6hB7hj8vCqCRuam+ij
         ZyyTI/u72Np0fhsBu3Qd2t3wVNpb87z1y/0WtjbkVic3tPWWsTzvy4H97L0t5ys5oqbz
         QHOlBMqZD9t9VrKYw4W+nGDo4HSlLKM3we1f2MimyG01rEJzeFf4neOILHZOtdkwbQer
         NDZyV1ZCHDrKXJTiX9YHPgn7+8Jys0cUWqW3QUPtGQ1qFavJu/6+kb3KLollY3KziUEk
         9TAg==
X-Gm-Message-State: AOAM531lNnGDJWcodNOeNsMCwNAh0pmTWjKPXGUG0mmJ5dplHpfa1C1d
        lOJIJJxvwoQA+Sn1gAjHFQ==
X-Google-Smtp-Source: ABdhPJzfEZ9aViNQ+wNyxoesg87WpUSfv1C3aSQXrqzcF2YV68dCtOeQlDw/DwWo1foaIpxrZVtVEA==
X-Received: by 2002:aca:ab4d:: with SMTP id u74mr2218524oie.120.1633436811833;
        Tue, 05 Oct 2021 05:26:51 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id k3sm2593351otn.16.2021.10.05.05.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 05:26:51 -0700 (PDT)
Received: (nullmailer pid 3226800 invoked by uid 1000);
        Tue, 05 Oct 2021 12:26:38 -0000
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
In-Reply-To: <20211004232225.2260665-2-dmitry.baryshkov@linaro.org>
References: <20211004232225.2260665-1-dmitry.baryshkov@linaro.org> <20211004232225.2260665-2-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 1/6] dt-bindings: pinctrl: qcom,pmic-mpp: Convert qcom pmic mpp bindings to YAML
Date:   Tue, 05 Oct 2021 07:26:38 -0500
Message-Id: <1633436798.574602.3226799.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 05 Oct 2021 02:22:20 +0300, Dmitry Baryshkov wrote:
> Convert Qualcomm PMIC MPP bindings from .txt to .yaml format.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/pinctrl/qcom,pmic-mpp.txt        | 187 ------------------
>  .../bindings/pinctrl/qcom,pmic-mpp.yaml       | 178 +++++++++++++++++
>  2 files changed, 178 insertions(+), 187 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.example.dt.yaml: mpps@a000: 'interrupt-controller' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1536426

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

