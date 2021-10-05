Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 880F64233D4
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Oct 2021 00:46:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236955AbhJEWsM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Oct 2021 18:48:12 -0400
Received: from mail-ot1-f54.google.com ([209.85.210.54]:46812 "EHLO
        mail-ot1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236924AbhJEWsD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Oct 2021 18:48:03 -0400
Received: by mail-ot1-f54.google.com with SMTP id u20-20020a9d7214000000b0054e170300adso762700otj.13;
        Tue, 05 Oct 2021 15:46:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=QK9Imlq5OXfe14Tp+9gPEdkTtY/w5a8pVgEJHriWYS8=;
        b=nsJtdcPMTwIU0vbY7l8UAAfiCCMurJoE/7msV8WVZUFTDPTdpdwLn5gSCNg9xNhw1I
         AKzWCNYFyZsdLiVjH2bqQPQEjrmT78nuhmI3bXZt5C2Llr4iXbMzgOb6an5SVOa1TLA4
         2pRab8gBgt4tYFjuH/PIflZFAulguxRfppfs1+dLepYlFjGyZxsIA+BOKH/7clwWi+IO
         LJlAhbCXYxyd7XVXbpDIyqLhGUViq0Ex2jZVnn0TF6691FTNyIxYg5/7+SjyfV6O4tiE
         povzzy6T6viNbQhHUMIT0vTiiuwmfVHMpP7cSSzqYvzf1m90kvJe+x+U76fMmlh1BY1Z
         Mdzg==
X-Gm-Message-State: AOAM530i7ltzLthKxy8CUdjqMuBFn8WCRbt7BluJ8H6uRgMaF1JwpwGd
        S3JXe0DC7pdvIbHGwn/GHzeXjpAoog==
X-Google-Smtp-Source: ABdhPJx7Av2ARqNLmB8U1zkPeOfgnNrqQH/K8kcCUbN6X7M36zfA/n9GiR9nHGRLwAiQ/dVJajq3Mg==
X-Received: by 2002:a9d:7257:: with SMTP id a23mr17143146otk.311.1633473972200;
        Tue, 05 Oct 2021 15:46:12 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id g21sm3817818ooc.31.2021.10.05.15.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 15:46:11 -0700 (PDT)
Received: (nullmailer pid 106792 invoked by uid 1000);
        Tue, 05 Oct 2021 22:45:59 -0000
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org
In-Reply-To: <20211005144329.2405315-2-dmitry.baryshkov@linaro.org>
References: <20211005144329.2405315-1-dmitry.baryshkov@linaro.org> <20211005144329.2405315-2-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 1/6] dt-bindings: pinctrl: qcom,pmic-mpp: Convert qcom pmic mpp bindings to YAML
Date:   Tue, 05 Oct 2021 17:45:59 -0500
Message-Id: <1633473959.436288.106788.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 05 Oct 2021 17:43:24 +0300, Dmitry Baryshkov wrote:
> Convert Qualcomm PMIC MPP bindings from .txt to .yaml format.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/pinctrl/qcom,pmic-mpp.txt        | 187 ------------------
>  .../bindings/pinctrl/qcom,pmic-mpp.yaml       | 180 +++++++++++++++++
>  2 files changed, 180 insertions(+), 187 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.yaml
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1536695


mpp@50: 'gpio-ranges' is a required property
	arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dt.yaml

mpps@50: 'cm3605-mpps' does not match any of the regexes: '-state$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/qcom-apq8060-dragonboard.dt.yaml

mpps@50: 'gpio-ranges' is a required property
	arch/arm/boot/dts/qcom-apq8060-dragonboard.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-cm-qs600.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-cm-qs600.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-ifc6410.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-ifc6410.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dt.yaml
	arch/arm/boot/dts/qcom-msm8660-surf.dt.yaml

mpps@a000: compatible: ['qcom,pm8916-mpp'] is too short
	arch/arm64/boot/dts/qcom/apq8016-sbc.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dt.yaml

mpps@a000: compatible: ['qcom,pm8994-mpp'] is too short
	arch/arm64/boot/dts/qcom/apq8094-sony-xperia-kitakami-karin_windy.dt.yaml
	arch/arm64/boot/dts/qcom/apq8096-db820c.dt.yaml
	arch/arm64/boot/dts/qcom/apq8096-ifc6640.dt.yaml
	arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dt.yaml
	arch/arm64/boot/dts/qcom/msm8992-msft-lumia-octagon-talkman.dt.yaml
	arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dt.yaml
	arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon-cityman.dt.yaml
	arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-ivy.dt.yaml
	arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-karin.dt.yaml
	arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-satsuki.dt.yaml
	arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-sumire.dt.yaml
	arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-suzuran.dt.yaml
	arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-dora.dt.yaml
	arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-kagura.dt.yaml
	arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-keyaki.dt.yaml
	arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dt.yaml
	arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dt.yaml
	arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dt.yaml

mpps@a000: 'gpio-ranges' is a required property
	arch/arm64/boot/dts/qcom/apq8016-sbc.dt.yaml
	arch/arm64/boot/dts/qcom/apq8094-sony-xperia-kitakami-karin_windy.dt.yaml
	arch/arm64/boot/dts/qcom/apq8096-db820c.dt.yaml
	arch/arm64/boot/dts/qcom/apq8096-ifc6640.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dt.yaml
	arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dt.yaml
	arch/arm64/boot/dts/qcom/msm8992-msft-lumia-octagon-talkman.dt.yaml
	arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dt.yaml
	arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon-cityman.dt.yaml
	arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-ivy.dt.yaml
	arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-karin.dt.yaml
	arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-satsuki.dt.yaml
	arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-sumire.dt.yaml
	arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-suzuran.dt.yaml
	arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-dora.dt.yaml
	arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-kagura.dt.yaml
	arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-keyaki.dt.yaml
	arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dt.yaml
	arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dt.yaml
	arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dt.yaml
	arch/arm/boot/dts/qcom-apq8074-dragonboard.dt.yaml
	arch/arm/boot/dts/qcom-apq8074-dragonboard.dt.yaml
	arch/arm/boot/dts/qcom-apq8084-ifc6540.dt.yaml
	arch/arm/boot/dts/qcom-apq8084-mtp.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-samsung-klte.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-sony-xperia-amami.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-sony-xperia-amami.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dt.yaml

mpps@a000: 'pm8916-mpp4', 'pm8916-mpps-leds' do not match any of the regexes: '-state$', 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/qcom/apq8016-sbc.dt.yaml

mpps@a000: pm8994-mpps-default-state: 'oneOf' conditional failed, one must be fixed:
	arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-dora.dt.yaml
	arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-kagura.dt.yaml
	arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-keyaki.dt.yaml
	arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dt.yaml
	arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dt.yaml
	arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dt.yaml

