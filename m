Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E9953A6826
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jun 2021 15:39:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233906AbhFNNly (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Jun 2021 09:41:54 -0400
Received: from mail-io1-f42.google.com ([209.85.166.42]:41809 "EHLO
        mail-io1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233489AbhFNNly (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Jun 2021 09:41:54 -0400
Received: by mail-io1-f42.google.com with SMTP id p66so37754013iod.8;
        Mon, 14 Jun 2021 06:39:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=IiRIEUjnGSSY6A6cJgxgBuXoA5APJSnapeUm1MgEDYU=;
        b=N9W/rs15y71TDThs9RSZC9j3YuFRQvCnBiFP6kBvgzcbfm6fEa6NbkcJaA6g9HqS8R
         uJG7KVPoQZKuZ0aCWLQd/3owaxN80TLnLLVh6vSXDQtnQgekw5t/9sEjADoo2O5A0uv0
         5hk61WG3Abe+Wco6G39ZphEcPMTku3UWWDNzjx52UlCFKo1UGEUJQRiNUd6bPkaNCd0M
         C3rNw7uwfi7Nx0d32A15/DfvkB4foT0cLqD80vE3kOA7JUkADFc6wZ6rxSpCHNIKXtER
         N7RMO6z2Gj0181HGkXwv7cIER7tX48GhKLEkSaBNJ3XD9wm3SrIWc3BnYrSYM60waEW6
         0XkA==
X-Gm-Message-State: AOAM533zpBqewi3Zpif2hywgzJFvT+gYrjQIMHwPfrVVL2ytpdFx6VLM
        bKYp0NME2iOYr3kkLMJqFvX3ZgeekQ==
X-Google-Smtp-Source: ABdhPJzSt2Rr9BWPfO4JiRQHeqf35gLGxcEPRqi+J73RDgb1b9gPlNMhPVThxExigVjmTWW6KNA38Q==
X-Received: by 2002:a5e:8513:: with SMTP id i19mr14239071ioj.50.1623677991480;
        Mon, 14 Jun 2021 06:39:51 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id f3sm7336700ilk.78.2021.06.14.06.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 06:39:50 -0700 (PDT)
Received: (nullmailer pid 630746 invoked by uid 1000);
        Mon, 14 Jun 2021 13:39:48 -0000
From:   Rob Herring <robh@kernel.org>
To:     Martin Botka <martin.botka@somainline.org>
Cc:     linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, konrad.dybcio@somainline.org,
        devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20210612094534.88992-1-martin.botka@somainline.org>
References: <20210612094534.88992-1-martin.botka@somainline.org>
Subject: Re: [PATCH V4 1/2] dt-bindings: pinctrl: qcom: sm6125: Document SM6125 pinctrl driver
Date:   Mon, 14 Jun 2021 07:39:48 -0600
Message-Id: <1623677988.119452.630745.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, 12 Jun 2021 11:45:30 +0200, Martin Botka wrote:
> Document the newly added SM6125 pinctrl driver
> 
> Signed-off-by: Martin Botka <martin.botka@somainline.org>
> ---
> Changes in V2:
> Add commit description
> Changes in V3:
> Fix syntax errors
> Remove not needed state from example
> Changes in V4:
> maxItems set to 3
> Correct the pattern
> Remove deleted enums
> Fix the compatible
>  .../bindings/pinctrl/qcom,sm6125-pinctrl.yaml | 124 ++++++++++++++++++
>  1 file changed, 124 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.example.dt.yaml: pinctrl@500000: 'reg-names' does not match any of the regexes: '-state$', 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.yaml
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1491257

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

