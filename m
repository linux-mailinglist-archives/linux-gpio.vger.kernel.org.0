Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13C36426BF0
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Oct 2021 15:49:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbhJHNvj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Oct 2021 09:51:39 -0400
Received: from mail-ot1-f49.google.com ([209.85.210.49]:45673 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbhJHNvi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Oct 2021 09:51:38 -0400
Received: by mail-ot1-f49.google.com with SMTP id g15-20020a9d128f000000b0054e3d55dd81so6630018otg.12;
        Fri, 08 Oct 2021 06:49:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=bWXEazop75TJR+kI2eloq93UC63vOjR9qIoQx+KsDQw=;
        b=2DiIRwFwPwynEW3fCM1Y5NE7abeOFGalmu+PmY/KUN3kyJT5siSjTRK9TuTegfzVQk
         hXyR7TwMqW+HiQxDdCRlLu1rCtZSBUuKPzYzV7YBFiCd+sGbZc/EcfC5TWGGxB3FigA0
         p73LoOOCioI5D9snUrXvU5rzsKZJs+9mbnldiAw6SjzQ/9oQfd+Zd3QRkGUiaQV011Fl
         Xkw4KXOp5el1UFfVnSS90Wlo5Fj25VlCgWHeAyNfUsdvOcrFqzd3Gz4mP1i/7unjgtUZ
         +dlU48WnR6tBXM1+ZaRNwaiwMAgAKh7SkWnsfR9UVL6l/diGiS7AiaVn0hVJOhbH+YBm
         CeCg==
X-Gm-Message-State: AOAM532gAuFq0E71ZAQ5CmhiSuxbYFNIgSPVWKxVxuSxct07cu8AlF2t
        arLHwAxdofAx3x2sXfnWUw==
X-Google-Smtp-Source: ABdhPJyMYLKi60w44HsKR1AnDRlwua/9SZ7aCmh11p841ai7yJMRlEDLVAAVqdD/0++63p0N1AYTfg==
X-Received: by 2002:a05:6830:1497:: with SMTP id s23mr8705196otq.148.1633700982938;
        Fri, 08 Oct 2021 06:49:42 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id n17sm617914oic.21.2021.10.08.06.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 06:49:42 -0700 (PDT)
Received: (nullmailer pid 2706682 invoked by uid 1000);
        Fri, 08 Oct 2021 13:49:41 -0000
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        bcm-kernel-feedback-list@broadcom.com,
        Scott Branden <sbranden@broadcom.com>,
        Ray Jui <rjui@broadcom.com>, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
In-Reply-To: <20211008082932.1370-1-zajec5@gmail.com>
References: <20211008082932.1370-1-zajec5@gmail.com>
Subject: Re: [PATCH linux-pinctrl 1/2] Revert "dt-bindings: pinctrl: bcm4708-pinmux: rework binding to use syscon"
Date:   Fri, 08 Oct 2021 08:49:41 -0500
Message-Id: <1633700981.551401.2706681.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 08 Oct 2021 10:29:31 +0200, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This reverts commit 2ae80900f239484069569380e1fc4340fd6e0089.
> 
> My rework was unneeded & wrong. It replaced a clear & correct "reg"
> property usage with a custom "offset" one.
> 
> Back then I didn't understand how to properly handle CRU block binding.
> I heard / read about syscon and tried to use it in a totally invalid
> way. That change also missed Rob's review (obviously).
> 
> Northstar's pin controller is a simple consistent hardware block that
> can be cleanly mapped using a 0x24 long reg space.
> 
> Since the rework commit there wasn't any follow up modifying in-kernel
> DTS files to use the new binding. Broadcom also isn't known to use that
> bugged binding. There is close to zero chance this revert may actually
> cause problems / regressions.
> 
> This commit is a simple revert. Example binding may (should) be updated
> / cleaned up but that can be handled separately.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>  .../bindings/pinctrl/brcm,ns-pinmux.yaml      | 23 +++++++++++--------
>  1 file changed, 13 insertions(+), 10 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/brcm,cru.example.dt.yaml: cru-bus@1800c100: pinctrl: 'reg' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/brcm,cru.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/brcm,cru.example.dt.yaml: cru-bus@1800c100: pinctrl: 'reg-names' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/brcm,cru.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/brcm,cru.example.dt.yaml: cru-bus@1800c100: pinctrl: 'offset' does not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/brcm,cru.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/brcm,cru.example.dt.yaml: pinctrl: 'reg' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/brcm,ns-pinmux.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/brcm,cru.example.dt.yaml: pinctrl: 'reg-names' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/brcm,ns-pinmux.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/brcm,cru.example.dt.yaml: pinctrl: 'offset' does not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/brcm,ns-pinmux.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/brcm,ns-pinmux.example.dt.yaml: cru@1800c100: $nodename:0: 'cru@1800c100' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/simple-bus.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1538264

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

