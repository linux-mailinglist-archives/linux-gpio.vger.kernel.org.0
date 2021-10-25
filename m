Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 781F34396C5
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Oct 2021 14:54:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233392AbhJYM4k (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Oct 2021 08:56:40 -0400
Received: from mail-oi1-f169.google.com ([209.85.167.169]:38452 "EHLO
        mail-oi1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233071AbhJYM4j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Oct 2021 08:56:39 -0400
Received: by mail-oi1-f169.google.com with SMTP id t4so15379928oie.5;
        Mon, 25 Oct 2021 05:54:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=nOxpnvvs9keLKH1c5NIl1Op/Q3M/paHDZ/uEML4RAj8=;
        b=XrWOBoTSyo8xIiQGixTxXTlZlvbi/48umGU+Wk7Y34+sqA4wMPHsdzQejEPAWrUywo
         4xFpPT7VSJMtn0M+6yiC8bIN4MXuOuuSluqV3/m6tmCNWjTMz3NW57lCNIg1WPYB5Uvs
         ul3zT9wiRBejZzxqAj76rMuG8BlTDBYXVZi1aFCMyVtupvGC/4TO7Q6bNT7NPF2xJ4Jw
         SfkyidrdYioVWSOM9wjiQf+XCsfbjv4UIh4MczzD5yYfqtc1OAx1C4rOX3X/Le8zCYd5
         RrdnmLoG7MN3Da4JGjkaPcA17AWg2p7rKVLK+aqIOL43TF1GOdD+f6EYY1Yhr0kK6DmB
         XLlw==
X-Gm-Message-State: AOAM53198XAoOlZISUyle2eR93UDhnm4IcWdtj7xmu2VLyBS6v5BZCcj
        XC01Mgq/Ucj6ArQkBwOFUBMdkZwzwA==
X-Google-Smtp-Source: ABdhPJwAYx33aOCRRNq15+hxM7oFC/tQ62gb8M3eAH/L5tagUglqpAPdaQRE7dl7XsJg+Z68tP1Q1w==
X-Received: by 2002:a05:6808:118a:: with SMTP id j10mr22403635oil.101.1635166456864;
        Mon, 25 Oct 2021 05:54:16 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id r14sm3806703oiw.44.2021.10.25.05.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 05:54:16 -0700 (PDT)
Received: (nullmailer pid 190973 invoked by uid 1000);
        Mon, 25 Oct 2021 12:54:14 -0000
From:   Rob Herring <robh@kernel.org>
To:     Jesse Taube <mr.bossman075@gmail.com>
Cc:     aisheng.dong@nxp.com, linux-gpio@vger.kernel.org,
        leonard.crestez@nxp.com, b20788@freescale.com,
        linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        gregkh@linuxfoundation.org, giulio.benetti@benettiengineering.com,
        olof@lixom.net, linux-kernel@vger.kernel.org, arnd@arndb.de,
        Mr.Bossman075@gmail.com, abel.vesa@nxp.com,
        linus.walleij@linaro.org, mturquette@baylibre.com,
        linux-mmc@vger.kernel.org, jirislaby@kernel.org,
        devicetree@vger.kernel.org, ulf.hansson@linaro.org,
        stefan@agner.ch, festevam@gmail.com,
        nobuhiro1.iwamatsu@toshiba.co.jp, shawnguo@kernel.org,
        robh+dt@kernel.org, fugang.duan@nxp.com,
        linux-serial@vger.kernel.org, linux@armlinux.org.uk,
        soc@kernel.org, s.hauer@pengutronix.de, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, kernel@pengutronix.de,
        adrian.hunter@intel.com
In-Reply-To: <20211024154027.1479261-3-Mr.Bossman075@gmail.com>
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com> <20211024154027.1479261-3-Mr.Bossman075@gmail.com>
Subject: Re: [PATCH 02/13] dt-bindings: pinctrl: add i.MXRT1050 pinctrl binding doc
Date:   Mon, 25 Oct 2021 07:54:14 -0500
Message-Id: <1635166454.807053.190972.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, 24 Oct 2021 11:40:16 -0400, Jesse Taube wrote:
> Add i.MXRT1050 pinctrl binding doc
> 
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
>  .../bindings/pinctrl/fsl,imxrt1050.yaml       | 85 +++++++++++++++++++
>  1 file changed, 85 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/pinctrl/fsl,imxrt1050.yaml#
Error: Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.example.dts:27.15-16 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:385: Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1441: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1545393

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

