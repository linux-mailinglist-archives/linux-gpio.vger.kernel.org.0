Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDB5132ECE9
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Mar 2021 15:16:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230406AbhCEOPq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Mar 2021 09:15:46 -0500
Received: from mail-oi1-f182.google.com ([209.85.167.182]:33434 "EHLO
        mail-oi1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231144AbhCEOPi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Mar 2021 09:15:38 -0500
Received: by mail-oi1-f182.google.com with SMTP id a13so2684602oid.0;
        Fri, 05 Mar 2021 06:15:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=TY2WFlvvKzi+Asx6ZLSCbDuaLyq9jcqvoByqP07qDkM=;
        b=V8UU1LRuVo0L2JE3zNIq47SkBVP2KBX3B3L5j4TFejTbbGSHJuIKejhVPAG+XzZ689
         d1Fge2oLOpZzX8lMzw2eNTbX7h8HDXLqvHDWyQDoa/Nksv43Jczrrp8FrEeLQmFt3ZkI
         wV/cDLuQU3BNIxX9vQLkSCqqf8rXqypIMk1icHto0iB3k95SL5mTEQO2yRiMd9YSIvzs
         FkAv46YPpNhrEEhEPLTdMhonJv5nz7lSZOqZTA2Jzp19IcLQl8AphTds7jbVEI2+JztE
         P2GRM3NjAfimsvMIU0KNxIe7l31jsgmrsKTi+Icu5uffqBF3v9gVPltNY90IqjNHEl3Y
         WHaA==
X-Gm-Message-State: AOAM533nKSlZJpnx2pRrFVF7Rp0okYH7If2kQfjoMi34fM7GcNaN8hTE
        s2fjvDJ1q0jhI+wC97pWRbCWMlCSZg==
X-Google-Smtp-Source: ABdhPJxetbETFVSnBrp8x8stRbb4Pkr3ZJTZWPOABSPyCyCBvbNxFitUWeVEPZyr4YkhLVYhF7tp8w==
X-Received: by 2002:aca:2411:: with SMTP id n17mr6213097oic.40.1614953737997;
        Fri, 05 Mar 2021 06:15:37 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w7sm550451oie.7.2021.03.05.06.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 06:15:37 -0800 (PST)
Received: (nullmailer pid 90443 invoked by uid 1000);
        Fri, 05 Mar 2021 14:15:34 -0000
From:   Rob Herring <robh@kernel.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        kgunda@codeaurora.org, Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
In-Reply-To: <1614925799-3172-3-git-send-email-skakit@codeaurora.org>
References: <1614925799-3172-1-git-send-email-skakit@codeaurora.org> <1614925799-3172-3-git-send-email-skakit@codeaurora.org>
Subject: Re: [PATCH 2/3] dt-bindings: pinctrl: qcom-pmic-gpio: Convert pmic gpio bindings to YAML
Date:   Fri, 05 Mar 2021 08:15:34 -0600
Message-Id: <1614953734.197344.90442.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 05 Mar 2021 11:59:58 +0530, satya priya wrote:
> Convert Qualcomm PMIC GPIO bindings from .txt to .yaml format.
> 
> Signed-off-by: satya priya <skakit@codeaurora.org>
> ---
>  .../devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 272 --------------------
>  .../bindings/pinctrl/qcom,pmic-gpio.yaml           | 273 +++++++++++++++++++++
>  2 files changed, 273 insertions(+), 272 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml:10:2: [warning] wrong indentation: expected 2 but found 1 (indentation)
./Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml:131:17: [warning] wrong indentation: expected 14 but found 16 (indentation)
./Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml:136:17: [warning] wrong indentation: expected 14 but found 16 (indentation)
./Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml:141:17: [warning] wrong indentation: expected 14 but found 16 (indentation)
./Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml:155:17: [warning] wrong indentation: expected 14 but found 16 (indentation)
./Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml:190:17: [warning] wrong indentation: expected 14 but found 16 (indentation)
./Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml:195:17: [warning] wrong indentation: expected 14 but found 16 (indentation)
./Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml:198:12: [warning] wrong indentation: expected 12 but found 11 (indentation)
./Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml:200:16: [warning] wrong indentation: expected 13 but found 15 (indentation)

dtschema/dtc warnings/errors:

See https://patchwork.ozlabs.org/patch/1447657

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

