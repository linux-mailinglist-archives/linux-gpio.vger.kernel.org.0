Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B1EB443AE2
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Nov 2021 02:21:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232844AbhKCBXf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Nov 2021 21:23:35 -0400
Received: from mail-ot1-f45.google.com ([209.85.210.45]:36692 "EHLO
        mail-ot1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232840AbhKCBXU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Nov 2021 21:23:20 -0400
Received: by mail-ot1-f45.google.com with SMTP id r10-20020a056830448a00b0055ac7767f5eso1380644otv.3;
        Tue, 02 Nov 2021 18:20:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=eg6tDiGhmQHR7M4AmqkelwPUQFNkN8vUJTDKmaxB1zA=;
        b=1p+cn5HFBIow7Jt859E7bfygTUxiWlGVtZE4wfURqUsxNWTiAbdUOn+7EzdVUSL9Hs
         BiNxmcPkhWCWOhU7CT6Xhth3QfRv6g3Xg/BxqDyyktIchKXVBA+gUVURoqhLTrm1yftS
         Ov6S58AuiYN+He3UKo6nfuJT+qKJKA7jBYkxIQwYRg40UjRINCRf9nRuBWaRN+ogYUxd
         v4A/xnLWrYU5eoAOD44CRpAd/IgzjYqRYGYtU2/z0e+oPo9/80IZV5GbatpbGXX6Qpl4
         RnhC7lFlaAOg2DmLxtSDHOxNQhtBuQx0MgergY9pI3iMK7CfvSEepGPSZSCId1V0tjA3
         ozxg==
X-Gm-Message-State: AOAM530lPt5AnIBf8pkLeiehvw5cpTgetb1+NHBn74inaibQG0wEqSm7
        r+lnuBHQovGh+ztNctl+wQ==
X-Google-Smtp-Source: ABdhPJxI8TysvZeSMHo8n8LYydlYVwW/NQ65dvUrt2keSHitPnqMkxfUQNAAk5YzrbMonVWDUAFRtg==
X-Received: by 2002:a05:6830:1448:: with SMTP id w8mr24209350otp.345.1635902443178;
        Tue, 02 Nov 2021 18:20:43 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id p190sm179766ooa.1.2021.11.02.18.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 18:20:42 -0700 (PDT)
Received: (nullmailer pid 3880387 invoked by uid 1000);
        Wed, 03 Nov 2021 01:20:37 -0000
From:   Rob Herring <robh@kernel.org>
To:     Jesse Taube <mr.bossman075@gmail.com>
Cc:     Mr.Bossman075@gmail.com, robh+dt@kernel.org, shawnguo@kernel.org,
        mturquette@baylibre.com, linux-gpio@vger.kernel.org,
        kernel@pengutronix.de, olof@lixom.net,
        linux-kernel@vger.kernel.org, adrian.hunter@intel.com,
        gregkh@linuxfoundation.org, ulf.hansson@linaro.org,
        linus.walleij@linaro.org, nobuhiro1.iwamatsu@toshiba.co.jp,
        jirislaby@kernel.org, linux-clk@vger.kernel.org,
        aisheng.dong@nxp.com, festevam@gmail.com, linux@armlinux.org.uk,
        soc@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-imx@nxp.com, devicetree@vger.kernel.org, abel.vesa@nxp.com,
        s.hauer@pengutronix.de, giulio.benetti@benettiengineering.com,
        linux-mmc@vger.kernel.org, linux-serial@vger.kernel.org,
        arnd@arndb.de, stefan@agner.ch, sboyd@kernel.org
In-Reply-To: <20211102225701.98944-6-Mr.Bossman075@gmail.com>
References: <20211102225701.98944-1-Mr.Bossman075@gmail.com> <20211102225701.98944-6-Mr.Bossman075@gmail.com>
Subject: Re: [PATCH v2 05/13] dt-bindings: clock: imx: Add documentation for i.MXRT clock
Date:   Tue, 02 Nov 2021 20:20:37 -0500
Message-Id: <1635902437.638872.3880386.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 02 Nov 2021 18:56:53 -0400, Jesse Taube wrote:
> From: Jesse Taube <mr.bossman075@gmail.com>
> 
> Add DT binding documentation for i.MXRT clock driver.
> 
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
> V1->V2:
> * Replace macros with values
> ---
>  .../bindings/clock/imxrt-clock.yaml           | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/imxrt-clock.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/clock/imxrt-clock.example.dt.yaml:0:0: /example-0/anatop@400d8000: failed to match any schema with compatible: ['fsl,imxrt-anatop']
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/imxrt-clock.example.dt.yaml: ccm@400fc000: interrupts: [[95], [96]] is too long
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/imxrt-clock.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/imxrt-clock.example.dt.yaml: timer@401ec000: clocks: [[4294967295, 3]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/imxrt-clock.example.dt.yaml: timer@401ec000: clock-names:0: 'ipg' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/imxrt-clock.example.dt.yaml: timer@401ec000: clock-names: ['per'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1549993

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

