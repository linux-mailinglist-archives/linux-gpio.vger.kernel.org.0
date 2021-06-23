Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 376AE3B1C48
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jun 2021 16:20:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231286AbhFWOWN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Jun 2021 10:22:13 -0400
Received: from mail-io1-f52.google.com ([209.85.166.52]:35621 "EHLO
        mail-io1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231139AbhFWOWL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Jun 2021 10:22:11 -0400
Received: by mail-io1-f52.google.com with SMTP id d9so3645990ioo.2;
        Wed, 23 Jun 2021 07:19:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=lwKnYqnTj9urrJtngBA+D6WD7PR7Tx6Uogg2oTqP4N0=;
        b=DgWhqIHFOlddFmQ0xaoFyVpj22li85T/CJZSt73mOso4TWZIFj/YjRxgpIaRFaReNP
         c3uLPNmGETuzuiXryIWXFdxBtMpJPoB0OL44zvIMCCeUKb/l9CLugFAE9RD+3ZXhzjVp
         ggOe/m5hd6eMVlGMzTRnOm3ftfhSL/cXlFdmBxoK7jPHOFutcBPHKjetPGy8RaCTCOE4
         2xTUJ7KUlqSNPtaj7qJzsFYYh1w6NP5panOsIT/2ZYzd9s3BuJSNI+gROQeSDDxLknI2
         F9g2xZTAw9l7eocq4UIfWdMMWGQt7IhsknN+9ZIcnf7VZHi4SIr1Sdps4UOLP49+eUxj
         ayfw==
X-Gm-Message-State: AOAM5332KfcKFnZwhfN0IMmKdLWMVgRrAh+SoPQkKy304zzTZ1ZAVNnO
        1V8ONL+bpqGdDS9Eow0d2g==
X-Google-Smtp-Source: ABdhPJw0OGW/d0endmXhaOcHhduijirWfmjcDfa1lb1HWOs7ZJ1L2rg7Ci4gyPp7hMJbk430hIxj/Q==
X-Received: by 2002:a5d:8254:: with SMTP id n20mr7481435ioo.85.1624457993743;
        Wed, 23 Jun 2021 07:19:53 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id x11sm25457ilc.40.2021.06.23.07.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jun 2021 07:19:53 -0700 (PDT)
Received: (nullmailer pid 2339999 invoked by uid 1000);
        Wed, 23 Jun 2021 14:19:45 -0000
From:   Rob Herring <robh@kernel.org>
To:     Iskren Chernev <iskren.chernev@gmail.com>
Cc:     linux-gpio@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>
In-Reply-To: <20210622201054.532979-2-iskren.chernev@gmail.com>
References: <20210622201054.532979-1-iskren.chernev@gmail.com> <20210622201054.532979-2-iskren.chernev@gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: pinctrl: qcom: Add SM6115 pinctrl bindings
Date:   Wed, 23 Jun 2021 08:19:45 -0600
Message-Id: <1624457985.989752.2339998.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 22 Jun 2021 23:10:53 +0300, Iskren Chernev wrote:
> Add device tree binding Documentation details for Qualcomm SM6115 and
> SM4250 pinctrl.
> 
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> ---
>  .../bindings/pinctrl/qcom,sm6115-pinctrl.yaml | 172 ++++++++++++++++++
>  1 file changed, 172 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm6115-pinctrl.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/pinctrl/qcom,sm6115-pinctrl.example.dts:35.5-6 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:380: Documentation/devicetree/bindings/pinctrl/qcom,sm6115-pinctrl.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1416: dt_binding_check] Error 2
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1495840

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

