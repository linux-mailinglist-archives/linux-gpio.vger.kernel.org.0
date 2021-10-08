Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2283427188
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Oct 2021 21:49:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241514AbhJHTvA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Oct 2021 15:51:00 -0400
Received: from mail-oi1-f171.google.com ([209.85.167.171]:35829 "EHLO
        mail-oi1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231433AbhJHTu6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Oct 2021 15:50:58 -0400
Received: by mail-oi1-f171.google.com with SMTP id n64so15182299oih.2;
        Fri, 08 Oct 2021 12:49:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=iYW5a/WfjqZkA3dxEOCsXG2hPPwjpbSd/NNDb4AaYG8=;
        b=N/A5T+6ZgNayIsyr/PLwXkLwH/v+C5AxJeqZnbExPld86mIqjS3I/wlrQkwZmPrHU2
         Mpo7mH+fsesqJb+KBy+Nic5RHbbrwGL16yDAbxSqAHPJdRUEb2gfvFBTaSXK6NmvMFZM
         Cpu4h3U+naYYmF4UGuBNc0sNbz/uFhl0My8L8jdjLMwbQ3+N9nI7jPptD8z+XLHO66fw
         hijftN4oeN7k363ZeyNXORWllOqqtt/EZijW2BVh6cIqA8v4UT14Djomhrmtaf9bbrCD
         CTftWG98HsXdvPlHlSzKSR8dJoSjwnfvnBoeV1twlFmyoGKagXm6avE0LFkCO0AbrXZX
         Hptg==
X-Gm-Message-State: AOAM5305wJoSseQ1bdHVFW1JNkwKL2LqIBrCcJi6Yr7BBigutLUtP+Bu
        wUeRSNvprOCZkqivS+CM1g==
X-Google-Smtp-Source: ABdhPJzKLAI3g8h5KEzLDKuLq5LOxSjmRGXYrXDykrvA9wcW8RE4moFjl93x90z7RbyZz6FBFLQ5fA==
X-Received: by 2002:aca:aa42:: with SMTP id t63mr769693oie.118.1633722542073;
        Fri, 08 Oct 2021 12:49:02 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id i24sm67851oie.42.2021.10.08.12.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 12:49:01 -0700 (PDT)
Received: (nullmailer pid 3211953 invoked by uid 1000);
        Fri, 08 Oct 2021 19:48:56 -0000
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, Ray Jui <rjui@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Scott Branden <sbranden@broadcom.com>,
        =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
In-Reply-To: <20211008153939.19685-1-zajec5@gmail.com>
References: <20211008153939.19685-1-zajec5@gmail.com>
Subject: Re: [PATCH V2 linux-pinctrl 1/2] Revert "dt-bindings: pinctrl: bcm4708-pinmux: rework binding to use syscon"
Date:   Fri, 08 Oct 2021 14:48:56 -0500
Message-Id: <1633722536.868012.3211952.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 08 Oct 2021 17:39:38 +0200, Rafał Miłecki wrote:
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
> V2: Update brcm,cru.yaml to avoid new yamllint warnings/errors
> ---
>  .../devicetree/bindings/mfd/brcm,cru.yaml     | 11 +++++----
>  .../bindings/pinctrl/brcm,ns-pinmux.yaml      | 23 +++++++++++--------
>  2 files changed, 19 insertions(+), 15 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/brcm,ns-pinmux.example.dt.yaml: cru@1800c100: $nodename:0: 'cru@1800c100' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/simple-bus.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1538413

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

