Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 421E7443AE5
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Nov 2021 02:21:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233370AbhKCBXf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Nov 2021 21:23:35 -0400
Received: from mail-ot1-f51.google.com ([209.85.210.51]:42808 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231231AbhKCBXV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Nov 2021 21:23:21 -0400
Received: by mail-ot1-f51.google.com with SMTP id v19-20020a9d69d3000000b00555a7318f31so1336286oto.9;
        Tue, 02 Nov 2021 18:20:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=HT3Al7yEHGSK6UDiiYAJrJ+g635E3g2QC/oWZ2X7eXk=;
        b=l49sQ984V7lOuh6F5V/F54iAObJulj8ENHq5BAnuoPJ3LoCz8MpBuqeXSWn9PAO18o
         ZCPkM2O2tYcViQO8DE/dsrShXeoz12ORRfQSzvQFKzZvfAWIPhFcdNT1VGV6KFdrd7so
         AypBOIDQubMtHo+9e/lJowiNfbTWjXoExWfTqQGiE4zhPifPaJmENLSZgA4vUq6EUMMK
         ZWBmP6fmaBvfpLa15tsE/iUJtBZ5kVV2NWjt0UC9AdCgf9Fp7AS+o1Uvqo6fR2gBYKWb
         BVkF21c/p72VXAA/Bc1fWVoAS/s/LMOJPh71SCj3NitVF/v77Lq53ka0TAUxfApNB327
         2Jiw==
X-Gm-Message-State: AOAM533+fAqjrvLh+BYMEzRkJZV14DbJeVE1w404K9JjRvaTJ0r9tLvS
        zUtPlWQsX7c8mtuBHnX0hQ==
X-Google-Smtp-Source: ABdhPJxhVbGuEfatKMxasFBTo+fCT+0b/sjoW6AfDHk20XhnyuWHqQdGzyx+ihb2pZY1CE+wyKCCoQ==
X-Received: by 2002:a9d:6f8e:: with SMTP id h14mr1526386otq.50.1635902445227;
        Tue, 02 Nov 2021 18:20:45 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id 70sm158943otn.74.2021.11.02.18.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 18:20:44 -0700 (PDT)
Received: (nullmailer pid 3880385 invoked by uid 1000);
        Wed, 03 Nov 2021 01:20:37 -0000
From:   Rob Herring <robh@kernel.org>
To:     Jesse Taube <mr.bossman075@gmail.com>
Cc:     mturquette@baylibre.com, aisheng.dong@nxp.com,
        linux@armlinux.org.uk, s.hauer@pengutronix.de,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        adrian.hunter@intel.com, linux-mmc@vger.kernel.org,
        kernel@pengutronix.de, shawnguo@kernel.org,
        linus.walleij@linaro.org, linux-serial@vger.kernel.org,
        jirislaby@kernel.org, robh+dt@kernel.org, abel.vesa@nxp.com,
        festevam@gmail.com, ulf.hansson@linaro.org,
        linux-kernel@vger.kernel.org, stefan@agner.ch, olof@lixom.net,
        sboyd@kernel.org, Mr.Bossman075@gmail.com,
        nobuhiro1.iwamatsu@toshiba.co.jp, linux-clk@vger.kernel.org,
        arnd@arndb.de, devicetree@vger.kernel.org, linux-imx@nxp.com,
        soc@kernel.org, gregkh@linuxfoundation.org,
        giulio.benetti@benettiengineering.com
In-Reply-To: <20211102225701.98944-3-Mr.Bossman075@gmail.com>
References: <20211102225701.98944-1-Mr.Bossman075@gmail.com> <20211102225701.98944-3-Mr.Bossman075@gmail.com>
Subject: Re: [PATCH v2 02/13] dt-bindings: pinctrl: add i.MXRT1050 pinctrl binding doc
Date:   Tue, 02 Nov 2021 20:20:37 -0500
Message-Id: <1635902437.626178.3880384.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 02 Nov 2021 18:56:50 -0400, Jesse Taube wrote:
> From: Jesse Taube <mr.bossman075@gmail.com>
> 
> Add i.MXRT1050 pinctrl binding doc
> 
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
> V1->V2:
> * Replace macros with values
> * Add tab for last pinctrl value
> ---
>  .../bindings/pinctrl/fsl,imxrt1050.yaml       | 83 +++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/pinctrl/fsl,imxrt1050.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.example.dt.yaml: iomuxc@401f8000: 'fsl,mux_mask', 'imxrt1050-evk' do not match any of the regexes: 'grp$', 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.example.dt.yaml: iomuxc@401f8000: 'pinctrl-0' is a dependency of 'pinctrl-names'
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/pinctrl/pinctrl-consumer.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1549987

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

