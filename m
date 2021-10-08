Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACEBE426294
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Oct 2021 04:46:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242366AbhJHCsb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Oct 2021 22:48:31 -0400
Received: from mail-ot1-f53.google.com ([209.85.210.53]:40837 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238786AbhJHCsW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Oct 2021 22:48:22 -0400
Received: by mail-ot1-f53.google.com with SMTP id l16-20020a9d6a90000000b0053b71f7dc83so9967423otq.7;
        Thu, 07 Oct 2021 19:46:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=1fsdcw0Uf2Bf5Gbc+boXtc/UJXaHXY4TE9dopsOWLPk=;
        b=r1KwlI4qZv3eggHJ6eqzXYWvT9lUfUFWykVwBYSTHwtMAHcQHyjXhFd3gL5md6rTBV
         NPuu4Fr3jiMc8EhZkstVn4kiFpkadAp+/dnPZzr2MI4CvrWcE5rpu0nYZIbl6UxYcAIM
         UIK2Tb8PDawOItX+GvZJ3m0NlmFEBHs3eNnkFztn62d0ReeYc3RxwECVHiLLSBQTgVvg
         fAoP+Th4+vzD/U5voHmjW18Y+HADgp+4GsUADnPzDO8UPsbv0CLIAvIbwHSeu6s8weQK
         qf4uamVmFeAO9rHu68NRqwJAtrBR5JZpRFlUQ1w5WiMqZsRMUs2DF8D9qgzKWdYJHPgR
         s32A==
X-Gm-Message-State: AOAM532Lii7rZwqArNOxvgSDLxWB7q3VItJg5eLbMApGYegc9VavOK5R
        eZsnizct6XLaTqQSgJzmra3nN+xrfg==
X-Google-Smtp-Source: ABdhPJypncZGWzOgZa5B53d0Gh2RTElDVyWKE+Q98gVGcQzFUW+QCgDy6Z/YhOPTG+BqYI9dk01O4w==
X-Received: by 2002:a05:6830:1d4d:: with SMTP id p13mr6673779oth.134.1633661187827;
        Thu, 07 Oct 2021 19:46:27 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id 33sm267601otm.28.2021.10.07.19.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 19:46:27 -0700 (PDT)
Received: (nullmailer pid 1409608 invoked by uid 1000);
        Fri, 08 Oct 2021 02:46:12 -0000
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org
In-Reply-To: <20211008012524.481877-3-dmitry.baryshkov@linaro.org>
References: <20211008012524.481877-1-dmitry.baryshkov@linaro.org> <20211008012524.481877-3-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 02/25] dt-bindings: mfd: qcom-pm8xxx: add missing child nodes
Date:   Thu, 07 Oct 2021 21:46:12 -0500
Message-Id: <1633661172.685600.1409607.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 08 Oct 2021 04:25:01 +0300, Dmitry Baryshkov wrote:
> Add gpio@[0-9a-f]+, mpps@[0-9a-f]+ and xoadc@[0-9a-f]+ as possible child
> nodes of qcom,pm8xxx, referencing existint schema files. Schema for
> other possible nodes does not exist yet.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/mfd/qcom-pm8xxx.yaml         | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1538158


pmic@0: compatible:0: 'qcom,pm8018' is not one of ['qcom,pm8058', 'qcom,pm8821', 'qcom,pm8921']
	arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dt.yaml

pmic@0: compatible: Additional items are not allowed ('qcom,pm8921' was unexpected)
	arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dt.yaml

pmic@0: compatible: ['qcom,pm8018', 'qcom,pm8921'] is too long
	arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dt.yaml

pmic@0: gpio@150: 'ak8975-gpios', 'bmp085-gpios', 'cm3605-gpios', 'ethernet-gpios', 'mpu3050-gpios', 'sdcc3-gpios', 'sdcc5-gpios', 'veth-gpios' do not match any of the regexes: '-state$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/qcom-apq8060-dragonboard.dt.yaml

pmic@0: gpio@150: 'gpio-keys-pin-active' does not match any of the regexes: '-state$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dt.yaml

pmic@0: gpio@150: 'nled', 'wlan-gpios' do not match any of the regexes: '-state$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/qcom-apq8064-ifc6410.dt.yaml

pmic@0: gpio@150: 'reg' is a required property
	arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dt.yaml

pmic@0: gpio@150: 'usb_vbus_5v_pins' does not match any of the regexes: '-state$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dt.yaml

pmic@0: gpio@150: 'wlan-gpios' does not match any of the regexes: '-state$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/qcom-apq8064-cm-qs600.dt.yaml

pmic@0: 'keypad@148', 'led@131', 'led@132', 'led@133', 'led@48', 'pwrkey@1c', 'vibrator@4a' do not match any of the regexes: 'gpio@[0-9a-f]+$', 'mpps@[0-9a-f]+$', 'pinctrl-[0-9]+', 'rtc@[0-9a-f]+$', 'xoadc@[0-9a-f]+$'
	arch/arm/boot/dts/qcom-apq8060-dragonboard.dt.yaml

pmic@0: 'keypad@148', 'pwrkey@1c' do not match any of the regexes: 'gpio@[0-9a-f]+$', 'mpps@[0-9a-f]+$', 'pinctrl-[0-9]+', 'rtc@[0-9a-f]+$', 'xoadc@[0-9a-f]+$'
	arch/arm/boot/dts/qcom-msm8960-cdp.dt.yaml

pmic@0: 'keypad@148', 'pwrkey@1c', 'vibrator@4a' do not match any of the regexes: 'gpio@[0-9a-f]+$', 'mpps@[0-9a-f]+$', 'pinctrl-[0-9]+', 'rtc@[0-9a-f]+$', 'xoadc@[0-9a-f]+$'
	arch/arm/boot/dts/qcom-msm8660-surf.dt.yaml

pmic@0: 'mpp@50', 'pwrkey@1c' do not match any of the regexes: 'gpio@[0-9a-f]+$', 'mpps@[0-9a-f]+$', 'pinctrl-[0-9]+', 'rtc@[0-9a-f]+$', 'xoadc@[0-9a-f]+$'
	arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dt.yaml

pmic@0: mpps@50: 'cm3605-mpps' does not match any of the regexes: '-state$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/qcom-apq8060-dragonboard.dt.yaml

pmic@0: mpps@50: 'gpio-ranges' is a required property
	arch/arm/boot/dts/qcom-apq8060-dragonboard.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-cm-qs600.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-ifc6410.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dt.yaml
	arch/arm/boot/dts/qcom-msm8660-surf.dt.yaml

pmic@0: 'pwrkey@1c' does not match any of the regexes: 'gpio@[0-9a-f]+$', 'mpps@[0-9a-f]+$', 'pinctrl-[0-9]+', 'rtc@[0-9a-f]+$', 'xoadc@[0-9a-f]+$'
	arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-cm-qs600.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-ifc6410.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dt.yaml

pmic@0: rtc@11d:compatible: Additional items are not allowed ('qcom,pm8921-rtc' was unexpected)
	arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dt.yaml

pmic@0: rtc@11d:compatible: ['qcom,pm8018-rtc', 'qcom,pm8921-rtc'] is too long
	arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dt.yaml

pmic@0: xoadc@197: 'mpp5@5', 'mpp6@6', 'mpp7@7', 'mpp8@8', 'mpp9@9' do not match any of the regexes: '^(adc-channel@)[0-9a-f]$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/qcom-apq8060-dragonboard.dt.yaml

pmic@1: mpps@50: 'gpio-ranges' is a required property
	arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-cm-qs600.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-ifc6410.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dt.yaml

