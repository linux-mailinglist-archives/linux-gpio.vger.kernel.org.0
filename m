Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2F403D7D5E
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jul 2021 20:26:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229974AbhG0S0p (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Jul 2021 14:26:45 -0400
Received: from mail-io1-f48.google.com ([209.85.166.48]:43702 "EHLO
        mail-io1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbhG0S0p (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Jul 2021 14:26:45 -0400
Received: by mail-io1-f48.google.com with SMTP id 185so17074060iou.10;
        Tue, 27 Jul 2021 11:26:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=Snb7zzXm5yWtNjnULb0kW5b9lE7iA5FbVYfHIKqzxsw=;
        b=VJ/yqrJYQvSRgGLdj7o9yJz12OZn89+DNiNRw4QLC8jR8EX8ZWl1c6PR8ibQmNpW//
         S9ffPlK7wGloDCsns2KsG+etEE2Vj2e+m3vvkobFkDQEc2Pgus18sPUOvI9Iaj+bwuSM
         +hUMfFwZOBXg/kpmzLmQoihUyar07nwKxpqw7yn6k87cIW5BjIi7PYhHowb2Kqtd7M22
         K2KamGJiaFs6NRpYJTHEl5YZaWAdwQaOuVSewXckp8VUyXNDLaliN5uueBdN/tjEciP0
         99R4v2eNJO68/t9g1oRmEUo3l96lNA7L6QxuQVOOtuUao1H4aGoleNngFplUplk+YYyB
         Zq5A==
X-Gm-Message-State: AOAM530werW3IW00WPLnHr1suszEXSPJAhDOCw71VMYWeqjgct16oiI3
        zR82L9o5FngLELawEWZGhQ==
X-Google-Smtp-Source: ABdhPJydLoroS1MPOE0r8YMTbwZhoygvk6C14R/FG87IJjqNCquTF05RQiCyoCtwuz4P8BnWRM5/Qw==
X-Received: by 2002:a05:6602:59d:: with SMTP id v29mr20162821iox.132.1627410403994;
        Tue, 27 Jul 2021 11:26:43 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id p21sm2713572iog.37.2021.07.27.11.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 11:26:43 -0700 (PDT)
Received: (nullmailer pid 3210654 invoked by uid 1000);
        Tue, 27 Jul 2021 18:26:35 -0000
From:   Rob Herring <robh@kernel.org>
To:     Hsin-Yi Wang <hsinyi@chromium.org>
Cc:     Enric Balletbo Serra <eballetbo@gmail.com>,
        Andy Teng <andy.teng@mediatek.com>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Sean Wang <sean.wang@kernel.org>
In-Reply-To: <20210727110232.2503763-3-hsinyi@chromium.org>
References: <20210727110232.2503763-1-hsinyi@chromium.org> <20210727110232.2503763-3-hsinyi@chromium.org>
Subject: Re: [PATCH 3/3] dt-bindings: mediatek: convert pinctrl to yaml
Date:   Tue, 27 Jul 2021 12:26:35 -0600
Message-Id: <1627410395.874547.3210653.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 27 Jul 2021 19:02:32 +0800, Hsin-Yi Wang wrote:
> Convert mt65xx, mt6796, mt7622, mt8183 bindings to yaml.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  .../pinctrl/mediatek,mt65xx-pinctrl.yaml      | 202 +++++++
>  .../pinctrl/mediatek,mt6797-pinctrl.yaml      | 175 ++++++
>  .../pinctrl/mediatek,mt7622-pinctrl.yaml      | 537 ++++++++++++++++++
>  .../pinctrl/mediatek,mt8183-pinctrl.yaml      | 230 ++++++++
>  .../bindings/pinctrl/pinctrl-mt65xx.txt       | 156 -----
>  .../bindings/pinctrl/pinctrl-mt6797.txt       |  83 ---
>  .../bindings/pinctrl/pinctrl-mt7622.txt       | 490 ----------------
>  .../bindings/pinctrl/pinctrl-mt8183.txt       | 132 -----
>  8 files changed, 1144 insertions(+), 861 deletions(-)
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
make: *** [Makefile:1418: dt_binding_check] Error 2
\ndoc reference errors (make refcheckdocs):
Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/pinctrl-mt7622.txt
MAINTAINERS: Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
MAINTAINERS: Documentation/devicetree/bindings/pinctrl/pinctrl-mt7622.txt

See https://patchwork.ozlabs.org/patch/1510444

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

