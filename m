Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECF253CDC49
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jul 2021 17:32:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243862AbhGSOv6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Jul 2021 10:51:58 -0400
Received: from mail-io1-f51.google.com ([209.85.166.51]:40841 "EHLO
        mail-io1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245560AbhGSOry (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Jul 2021 10:47:54 -0400
Received: by mail-io1-f51.google.com with SMTP id l5so20427626iok.7;
        Mon, 19 Jul 2021 08:28:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=IosNWJDIFYVHvcY5CJfC2XiWhHfG0Sj3FdGBaUCDHHY=;
        b=PnH27gLN7uckgiLrWUAHscWTsvDoQdrXKFKNDy5EHuwsihZWtU3NmrZDFLKMLlPnYZ
         vbb4ufO52Q+IKZUgXFB/4fErz1MKwuGfnbSt87fl2ru4PyUcNqUepRQAvTpTBcPJdIi0
         61MPiB47o7ujk6dAg+eEwKIQmdSDrVzS5BU7Oo6MqgX4VuI93IcBNKPwP3HmByAmDSX3
         YCWphLJWg980GC1iww3aQHcMoKpMZwzjYqvYAZ+SJ5DdhTKX/HGd806qWoGm9/0qCkd9
         xSGxJwolX4Um8uSSvTwGUCXfgMnQQZh3kYQnspBIt9bC6GJVU/mPYkgnskWXiM4FxR7C
         A2nQ==
X-Gm-Message-State: AOAM530vwfLgmKXyh/jMDsnQpMJC99UCvx2X53jpm7Oq7It5AzYufaSY
        EFKyqXlXYfNexrQYZ/jU6g==
X-Google-Smtp-Source: ABdhPJzUYml1EzjuWcIHNIjVXKUGRR/w3ocJdsVTxcX8xIoPgtg5b79mUrh/8Dfn0Zn0MpUFraDkiw==
X-Received: by 2002:a6b:7619:: with SMTP id g25mr18914482iom.151.1626708481552;
        Mon, 19 Jul 2021 08:28:01 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id r8sm10821214iov.39.2021.07.19.08.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 08:28:00 -0700 (PDT)
Received: (nullmailer pid 1967262 invoked by uid 1000);
        Mon, 19 Jul 2021 15:27:59 -0000
From:   Rob Herring <robh@kernel.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        kgunda@codeaurora.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org
In-Reply-To: <1626692855-10194-2-git-send-email-skakit@codeaurora.org>
References: <1626692855-10194-1-git-send-email-skakit@codeaurora.org> <1626692855-10194-2-git-send-email-skakit@codeaurora.org>
Subject: Re: [PATCH V6 1/2] dt-bindings: pinctrl: qcom-pmic-gpio: Convert qcom pmic gpio bindings to YAML
Date:   Mon, 19 Jul 2021 09:27:59 -0600
Message-Id: <1626708479.383201.1967261.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 19 Jul 2021 16:37:34 +0530, satya priya wrote:
> Convert Qualcomm PMIC GPIO bindings from .txt to .yaml format.
> 
> Signed-off-by: satya priya <skakit@codeaurora.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
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
> Changes in RESEND V4:
>  - Rebased on linux-next and sent.
> 
> Changes in V5:
>  - Fixed Bjorn's comments on [1]
> 
>  [1] https://lore.kernel.org/patchwork/patch/1434144/
> 
> Changes in V6:
>  - As per Bjorn's comments, removed formatting for description, changed
>    node name to be more specific to qcom pmic, and fixed few other minor
>    things as suggested here [2].
> 
>  [2] https://lore.kernel.org/patchwork/patch/1452812/#1654560
> 
>  .../devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 288 ---------------------
>  .../bindings/pinctrl/qcom,pmic-gpio.yaml           | 259 ++++++++++++++++++
>  2 files changed, 259 insertions(+), 288 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/qcom,pm8008.example.dt.yaml: gpio@c000: compatible: ['qcom,pm8008-gpio'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/qcom,pm8008.example.dt.yaml: gpio@c000: 'gpio-ranges' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1506906

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

