Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 131E34396D2
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Oct 2021 14:54:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233434AbhJYM4o (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Oct 2021 08:56:44 -0400
Received: from mail-ot1-f54.google.com ([209.85.210.54]:39677 "EHLO
        mail-ot1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233414AbhJYM4n (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Oct 2021 08:56:43 -0400
Received: by mail-ot1-f54.google.com with SMTP id e59-20020a9d01c1000000b00552c91a99f7so14791170ote.6;
        Mon, 25 Oct 2021 05:54:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=xfPmPgNFQgIKrWKVU27Szuu0QsSCtm+5R24aa/F4BSg=;
        b=lefDfrVSvWR8U4WnOGkF76AwFCk8T7kwi4iXWysxEQOHCWhxgytedxzDmpLotohspU
         4yIHd1goYVMJ62GPiS7B0X1CWbsgkgb5Ahqzrywtp7mk3EcFto3F+iaMnAuSSvGd4SZA
         z2mSapmsWoNGGnGXMs+2LjUd39+PrxCAB/gXm7/q8cXzs3EI8sx/T6EasX+de84STXna
         c9/UfbPjWGJWOjO2RajtyLPcLrkp3ds8n+bTR4Rq52mY9fWbDQMLOZD8Noou3ntkp0w6
         NHR2piQo0ZUn5zoocHV9C1z2Vbr9FEwc0gIdDzqHFqVRZ7VyFZ+qmIVG0xR4OcabjR8r
         zXWg==
X-Gm-Message-State: AOAM532ryVk5dLiBR4k316724wgmMcaTKOhvxgMEi0iRdQGPRETIJRTT
        EIAXQki6lhWh5Tn/vglSPA==
X-Google-Smtp-Source: ABdhPJxSzDa6Aw86E7HU9PcZR3V6hQx/apZrKRCDa2ilOHhh7Q1/dkrii+HwuqomKgo/nUzIa6Dt1Q==
X-Received: by 2002:a05:6830:1e08:: with SMTP id s8mr13970909otr.305.1635166460875;
        Mon, 25 Oct 2021 05:54:20 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id bf3sm3946646oib.34.2021.10.25.05.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 05:54:20 -0700 (PDT)
Received: (nullmailer pid 190976 invoked by uid 1000);
        Mon, 25 Oct 2021 12:54:14 -0000
From:   Rob Herring <robh@kernel.org>
To:     Jesse Taube <mr.bossman075@gmail.com>
Cc:     arnd@arndb.de, mturquette@baylibre.com, olof@lixom.net,
        aisheng.dong@nxp.com, sboyd@kernel.org, Mr.Bossman075@gmail.com,
        fugang.duan@nxp.com, nobuhiro1.iwamatsu@toshiba.co.jp,
        adrian.hunter@intel.com, linux-arm-kernel@lists.infradead.org,
        b20788@freescale.com, linux-serial@vger.kernel.org,
        gregkh@linuxfoundation.org, linus.walleij@linaro.org,
        ulf.hansson@linaro.org, linux-kernel@vger.kernel.org,
        kernel@pengutronix.de, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, s.hauer@pengutronix.de,
        abel.vesa@nxp.com, leonard.crestez@nxp.com, linux@armlinux.org.uk,
        shawnguo@kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, jirislaby@kernel.org,
        linux-imx@nxp.com, linux-mmc@vger.kernel.org, festevam@gmail.com,
        stefan@agner.ch, giulio.benetti@benettiengineering.com,
        soc@kernel.org
In-Reply-To: <20211024154027.1479261-6-Mr.Bossman075@gmail.com>
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com> <20211024154027.1479261-6-Mr.Bossman075@gmail.com>
Subject: Re: [PATCH 05/13] dt-bindings: clock: imx: Add documentation for i.MXRT clock
Date:   Mon, 25 Oct 2021 07:54:14 -0500
Message-Id: <1635166454.818167.190975.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, 24 Oct 2021 11:40:19 -0400, Jesse Taube wrote:
> Add DT binding documentation for i.MXRT clock driver.
> 
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
>  .../bindings/clock/imxrt-clock.yaml           | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/imxrt-clock.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/clock/imxrt-clock.example.dts:32.27-28 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:385: Documentation/devicetree/bindings/clock/imxrt-clock.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1441: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1545398

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

