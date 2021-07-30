Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D89423DC105
	for <lists+linux-gpio@lfdr.de>; Sat, 31 Jul 2021 00:28:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230077AbhG3W2S (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jul 2021 18:28:18 -0400
Received: from mail-io1-f42.google.com ([209.85.166.42]:46706 "EHLO
        mail-io1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbhG3W2S (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jul 2021 18:28:18 -0400
Received: by mail-io1-f42.google.com with SMTP id z7so12383289iog.13;
        Fri, 30 Jul 2021 15:28:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=1SioxWYOB4GKQF75otjmPAgYQGJ4juMB4TymylBvulE=;
        b=P0oOjp24LssnbVlPk3D5V1NeORXdoYw0NAbgnpFs3zBRQAUzC5OqCIUA5FEGXWfXSC
         jtBE5lf9imS4oP7f6dBARdZ44IL1MaShg/6APgsop5KA7NdUYEpTQuNv61ePpXIZYp+/
         wntmrXX1/lxxcK86eGdFAVbvdocNTWJcu0w6qcxPcPnu9YQqpf6GB70G35GBI6SsFQk7
         dTHbtWz65RQsdcewEqMiMcy2bj5WU4425dZydAyhKc81XkwVTGOrfTBMP9SMtm+Uob9Y
         yNksvrVoGsOxM/ZGkwUuIQPuvhujvZTYkRvGsgRjXkxh5klou8WIhW9tz18dXUug/70r
         /uAQ==
X-Gm-Message-State: AOAM530dv4Y0kUN7WRRr9UZJDnzVMhYrTnW3XcsEtTu3ZXNVe4MVM0g4
        oB42/vJCkjV7z1WDgXD9IOPEcvF8xw==
X-Google-Smtp-Source: ABdhPJw92Pxgc45lpYhnZL98mHP5QmwqnkzlX6tQ6SiGz6QcI3EsfiGGEi2BDOlTWCaMN4QVg4tTIA==
X-Received: by 2002:a02:90cb:: with SMTP id c11mr3909371jag.53.1627684092766;
        Fri, 30 Jul 2021 15:28:12 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id q1sm1887882ioi.42.2021.07.30.15.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 15:28:12 -0700 (PDT)
Received: (nullmailer pid 3442792 invoked by uid 1000);
        Fri, 30 Jul 2021 22:28:10 -0000
From:   Rob Herring <robh@kernel.org>
To:     Hsin-Yi Wang <hsinyi@chromium.org>
Cc:     Andy Teng <andy.teng@mediatek.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Enric Balletbo Serra <eballetbo@gmail.com>,
        Sean Wang <sean.wang@kernel.org>,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20210730120937.1435204-3-hsinyi@chromium.org>
References: <20210730120937.1435204-1-hsinyi@chromium.org> <20210730120937.1435204-3-hsinyi@chromium.org>
Subject: Re: [PATCH v2 3/3] dt-bindings: mediatek: convert pinctrl to yaml
Date:   Fri, 30 Jul 2021 16:28:10 -0600
Message-Id: <1627684090.548356.3442791.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 30 Jul 2021 20:09:37 +0800, Hsin-Yi Wang wrote:
> Convert mt65xx, mt6796, mt7622, mt8183 bindings to yaml.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> v1->v2:
> - fix comments in v1.
> - fix mt7622 where groups is not required for conf node.
> ---
>  .../pinctrl/mediatek,mt65xx-pinctrl.yaml      | 206 ++++++++
>  .../pinctrl/mediatek,mt6797-pinctrl.yaml      | 173 +++++++
>  .../pinctrl/mediatek,mt7622-pinctrl.yaml      | 416 +++++++++++++++
>  .../pinctrl/mediatek,mt8183-pinctrl.yaml      | 228 ++++++++
>  .../bindings/pinctrl/pinctrl-mt65xx.txt       | 156 ------
>  .../bindings/pinctrl/pinctrl-mt6797.txt       |  83 ---
>  .../bindings/pinctrl/pinctrl-mt7622.txt       | 490 ------------------
>  .../bindings/pinctrl/pinctrl-mt8183.txt       | 132 -----
>  8 files changed, 1023 insertions(+), 861 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt6797-pinctrl.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt6797.txt
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt7622.txt
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt8183.txt
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.example.dts:21:18: fatal error: dt-bindings/pinctrl/mt8183-pinfunc.h: No such file or directory
   21 |         #include <dt-bindings/pinctrl/mt8183-pinfunc.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:380: Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1419: dt_binding_check] Error 2
\ndoc reference errors (make refcheckdocs):
Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/pinctrl-mt7622.txt
MAINTAINERS: Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
MAINTAINERS: Documentation/devicetree/bindings/pinctrl/pinctrl-mt7622.txt

See https://patchwork.ozlabs.org/patch/1511632

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

