Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35C2847659C
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Dec 2021 23:27:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230352AbhLOW1b (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Dec 2021 17:27:31 -0500
Received: from mail-oi1-f182.google.com ([209.85.167.182]:38746 "EHLO
        mail-oi1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbhLOW1a (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Dec 2021 17:27:30 -0500
Received: by mail-oi1-f182.google.com with SMTP id r26so33678926oiw.5;
        Wed, 15 Dec 2021 14:27:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=HfqN6FJMlfs7L3+Cs2CO8gMcSI1LPysdwY7vFCHYvzg=;
        b=Ot+jWr6a6MieyBiAIdbsodDA+mJpUyMgLHKQ3B2xgxPdXqX3YWxGN1f8OW84Ll2QKn
         fuC1LN0oVpA65CS8UZDlCuNMyPrNvBp9baUIKyRsmdIuAwje6bhvrkg875qPvHTXQrae
         JYGKMHOD/+yJbqbfZeDL+R2LRiMtFC8AvNYVbPLkWSkQqOsv1edZmD7E88lSeDZvwnht
         w51hpUJSv3og4Kdlqw/6eA0CEPG5JT7TuSePtd9x+/THqIi3MI2gc1TyVyL0Qrle7GRg
         bBJ5YprpnA+O3MKSiXzzQXyhYCRSrO5PBCAUPsyS3c5sHttjc3gKKoq0gaOmmB2/+Zb6
         yKEg==
X-Gm-Message-State: AOAM532ZhBJda+2JCmXcwwZ9HQ141IyGpDIZ48xy21XdXhxQwpslNzjV
        6PFWcRQLA4PNtJKgw0AOebjXx2t5CA==
X-Google-Smtp-Source: ABdhPJwUUpSaTZQw9i1ks1KxUw1drlRY9guiYYYGHetb3L8jIHN/4b8OlPJoJ4EGBe/cpXqnBV3mZA==
X-Received: by 2002:aca:1204:: with SMTP id 4mr1830445ois.136.1639607250051;
        Wed, 15 Dec 2021 14:27:30 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id m2sm742734oop.12.2021.12.15.14.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 14:27:29 -0800 (PST)
Received: (nullmailer pid 1954725 invoked by uid 1000);
        Wed, 15 Dec 2021 22:27:28 -0000
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        =?utf-8?q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20211215204753.5956-1-zajec5@gmail.com>
References: <20211215204753.5956-1-zajec5@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: Add binding for BCM4908 pinctrl
Date:   Wed, 15 Dec 2021 16:27:28 -0600
Message-Id: <1639607248.075072.1954724.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 15 Dec 2021 21:47:52 +0100, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> It's hardware block that is part of every SoC from BCM4908 family.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>  .../pinctrl/brcm,bcm4908-pinctrl.yaml         | 72 +++++++++++++++++++
>  MAINTAINERS                                   |  7 ++
>  2 files changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm4908-pinctrl.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Unknown file referenced: [Errno 2] No such file or directory: '/usr/local/lib/python3.8/dist-packages/dtschema/schemas/pinctrl/pinctrl.yaml'
xargs: dt-doc-validate: exited with status 255; aborting
make[1]: *** Deleting file 'Documentation/devicetree/bindings/pinctrl/brcm,bcm4908-pinctrl.example.dt.yaml'
Unknown file referenced: [Errno 2] No such file or directory: '/usr/local/lib/python3.8/dist-packages/dtschema/schemas/pinctrl/pinctrl.yaml'
make[1]: *** [scripts/Makefile.lib:373: Documentation/devicetree/bindings/pinctrl/brcm,bcm4908-pinctrl.example.dt.yaml] Error 255
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1413: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1568760

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

