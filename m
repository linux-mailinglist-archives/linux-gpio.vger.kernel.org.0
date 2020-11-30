Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCA652C89C6
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Nov 2020 17:41:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728039AbgK3Qkx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Nov 2020 11:40:53 -0500
Received: from mail-il1-f195.google.com ([209.85.166.195]:42323 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727924AbgK3Qkw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Nov 2020 11:40:52 -0500
Received: by mail-il1-f195.google.com with SMTP id f5so11882352ilj.9;
        Mon, 30 Nov 2020 08:40:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bAYc28O40kbetv9cXus2ITFmscdZF+ewqzJQFnlg8NE=;
        b=rTGAJbaL01siTjSFUfKc6mUECZtsPovF879e/C22LUBk/TOWLtMEmOtVLV66m6dEmb
         U5bUEaxTqmPxbbymDBgK60X5e66ZJUnY0kxP+XqOSaEGQQxEPO4T2qS6+BDRtt96dp/x
         Gdmw4FYJlzn/xJZ/vGUWqkswnQ7b9+NkX/WM0Y8e6aGULUCFw5WWlDLq2ZlE/WiYEAtK
         pTLJCWm1raiVg8UtBSmxGbTP7J19im7zyIU8RqpvZzh9A7iNdAsXxT/XBtKObB5Kglju
         SeqSuOBcUJvhH1oS8YieiLeB3AiCba6rBrhatDAFclVhr6dEmX7iHasA29f3zeDn/gvf
         V3/w==
X-Gm-Message-State: AOAM533K8eWJejk4x0atbvD2ztrsNjLfKhfOHQ+QqDhlLxu1PJMeiVSZ
        0KErhXzF7aJmwInhKT37Vw==
X-Google-Smtp-Source: ABdhPJxRWZfczSYCVHlAHpdcSkC/qm5wJX03gIby4IS304rXTN1z3EjI2USfEgJ9eEXADu3AgXzv6g==
X-Received: by 2002:a92:c887:: with SMTP id w7mr18648555ilo.277.1606754411806;
        Mon, 30 Nov 2020 08:40:11 -0800 (PST)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id u1sm11192110ilb.74.2020.11.30.08.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 08:40:11 -0800 (PST)
Received: (nullmailer pid 2594996 invoked by uid 1000);
        Mon, 30 Nov 2020 16:40:09 -0000
Date:   Mon, 30 Nov 2020 09:40:09 -0700
From:   Rob Herring <robh@kernel.org>
To:     Damien Le Moal <damien.lemoal@wdc.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Sean Anderson <seanga2@gmail.com>, linux-clk@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 10/21] dt-binding: Document canaan,k210-sysctl bindings
Message-ID: <20201130164009.GA2593992@robh.at.kernel.org>
References: <20201124043728.199852-1-damien.lemoal@wdc.com>
 <20201124043728.199852-11-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201124043728.199852-11-damien.lemoal@wdc.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 24 Nov 2020 13:37:17 +0900, Damien Le Moal wrote:
> Document the device tree bindings of the Canaan Kendryte K210 SoC
> system controller driver in
> Documentation/devicetree/bindings/mfd/canaan,k210-sysctl.yaml.
> 
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  .../bindings/mfd/canaan,k210-sysctl.yaml      | 116 ++++++++++++++++++
>  1 file changed, 116 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/canaan,k210-sysctl.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Unknown file referenced: [Errno 2] No such file or directory: '/usr/local/lib/python3.8/dist-packages/dtschema/schemas/clock/canaan,k210-clk.yaml'
xargs: dt-doc-validate: exited with status 255; aborting
make[1]: *** [Documentation/devicetree/bindings/Makefile:59: Documentation/devicetree/bindings/processed-schema-examples.json] Error 124
make: *** [Makefile:1364: dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1405243

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

