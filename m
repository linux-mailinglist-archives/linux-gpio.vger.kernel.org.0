Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 392963F40D2
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Aug 2021 20:25:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231452AbhHVS0N (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 22 Aug 2021 14:26:13 -0400
Received: from mail-ot1-f41.google.com ([209.85.210.41]:37440 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230245AbhHVS0M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 22 Aug 2021 14:26:12 -0400
Received: by mail-ot1-f41.google.com with SMTP id i3-20020a056830210300b0051af5666070so20213475otc.4;
        Sun, 22 Aug 2021 11:25:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=CohCaViilWEbRBKTkbbu2wctSsE1MZKMrL6dyx4nTdo=;
        b=PEb32oIz9eGjyCTS16/QdbGrtdHJkRjMBSMg0TrLdZ38457c7nrXkmwVsKVsDho+Zr
         HaxGOUR/+4Fb2Y6S6hd1sAWGmcvTQoj19ueXaakwiA3CUp8aKDg/hWv1kM1+P2CokY/l
         CO9O5JiVra2rjqRJ77S+/QbK1QF6XqcrvFRHkNEzzNt7HgcelkNQthBp2j06QB9VCc2e
         T4icFqtbbrRlNTmTSInfwVC9k6saf1bHKa0D31BR0Y8LCTVUxZilt76m83uLVONVgX8X
         QAIWuMzX0+uuO6JwCijHKt7d6/uHQ3YpB1JXsfgaiI6je4xzrwzbMfeE2DubeKH6Uo3x
         LdKQ==
X-Gm-Message-State: AOAM5329xdWnuGV6ZiCDMs0LMKpSAPmkE5B1ws32MSdA8doYziQr9A7H
        ye6nswQge0A/YC9go09cBQ==
X-Google-Smtp-Source: ABdhPJyl0dir0Y3/k3lJLtDRaWvyY4xLRhaXD/vifkRmdY3eUtcy+7CA2SkwNF3yQR3Pg2Ym86TbEA==
X-Received: by 2002:a54:4093:: with SMTP id i19mr7815683oii.156.1629656730919;
        Sun, 22 Aug 2021 11:25:30 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id 97sm3257444otv.26.2021.08.22.11.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 11:25:30 -0700 (PDT)
Received: (nullmailer pid 131027 invoked by uid 1000);
        Sun, 22 Aug 2021 18:25:29 -0000
From:   Rob Herring <robh@kernel.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     martin.botka@somainline.org, marijn.suijten@somainline.org,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        angelogioacchino.delregno@somainline.org,
        linux-kernel@vger.kernel.org, jamipkettunen@somainline.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Gross <agross@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, devicetree@vger.kernel.org
In-Reply-To: <20210820203751.232645-2-konrad.dybcio@somainline.org>
References: <20210820203751.232645-1-konrad.dybcio@somainline.org> <20210820203751.232645-2-konrad.dybcio@somainline.org>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add SM6350 pinctrl bindings
Date:   Sun, 22 Aug 2021 13:25:29 -0500
Message-Id: <1629656729.157497.131026.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 20 Aug 2021 22:37:50 +0200, Konrad Dybcio wrote:
> Add device tree binding Documentation details for Qualcomm SM6350
> pinctrl driver.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  .../bindings/pinctrl/qcom,sm6350-pinctrl.yaml | 156 ++++++++++++++++++
>  .../bindings/pinctrl/qcom,tlmm-common.yaml    |   2 +-
>  2 files changed, 157 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm6350-pinctrl.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.example.dt.yaml: pinctrl@f100000: interrupts: [[0, 208, 4]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-pinctrl.example.dt.yaml: pinctrl@3100000: interrupts: [[0, 208, 4]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-pinctrl.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.example.dt.yaml: pinctrl@500000: interrupts: [[0, 227, 4]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1519185

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

