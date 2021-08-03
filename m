Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9BFA3DEF78
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Aug 2021 15:59:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236128AbhHCN7t (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Aug 2021 09:59:49 -0400
Received: from mail-il1-f182.google.com ([209.85.166.182]:35788 "EHLO
        mail-il1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236045AbhHCN7s (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Aug 2021 09:59:48 -0400
Received: by mail-il1-f182.google.com with SMTP id k3so19579880ilu.2;
        Tue, 03 Aug 2021 06:59:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=YJEwfvXxEQoCSvi3Imkoy2A3S44+KPxOIY3UOxwGxYQ=;
        b=hDF5TTvJm6RMl6lMIiIAi27zZIFhspe8JBB42RXhRkwobWToDSSV9ygdLV0qBw1Bzl
         By/sfNztFmoyrU3LyFnn/PDyku84v27lmeMHb7Dez62+HsM6KbD4B69fj/xuvcKF7W6s
         bmIM6X8emE6yLugatcGjs7PDChRVq0Le+ELN53TtSiR3w6Tyy+yng3YyFeVBiaDLoTXW
         CgJ/078qJmWXc3lY97/nNnAZdcCk+lbqDOioiVY033OmLUjhiptapg2xbbYChjpzuqlS
         wbv1EqUHPQlMAbGMdKm6eLKrw1rBPvaJjuplmPQngwdcLDx9CuMwKNjFdftd0DCPN7/I
         a/DA==
X-Gm-Message-State: AOAM532uxRERaitgsxwyWs5jf0VkcrOxW1fAmdpgEf/v31J1Kwin7/n1
        tX7AIevLVZERuDBWrLhnpg==
X-Google-Smtp-Source: ABdhPJydosHbUMC3l3Q5iokZVtVDy0/O4JeNWAppyEHHOo14g7SwbkcNcU6C2ZSn78b0VCB1rUrOgw==
X-Received: by 2002:a92:c043:: with SMTP id o3mr876190ilf.189.1627999176150;
        Tue, 03 Aug 2021 06:59:36 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id d9sm7561292ilu.9.2021.08.03.06.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Aug 2021 06:59:34 -0700 (PDT)
Received: (nullmailer pid 3179056 invoked by uid 1000);
        Tue, 03 Aug 2021 13:59:32 -0000
From:   Rob Herring <robh@kernel.org>
To:     Hsin-Yi Wang <hsinyi@chromium.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        Andy Teng <andy.teng@mediatek.com>, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Enric Balletbo Serra <eballetbo@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
In-Reply-To: <20210803051318.2570994-3-hsinyi@chromium.org>
References: <20210803051318.2570994-1-hsinyi@chromium.org> <20210803051318.2570994-3-hsinyi@chromium.org>
Subject: Re: [PATCH v3 3/3] dt-bindings: mediatek: convert pinctrl to yaml
Date:   Tue, 03 Aug 2021 07:59:32 -0600
Message-Id: <1627999172.502726.3179055.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 03 Aug 2021 13:13:19 +0800, Hsin-Yi Wang wrote:
> Convert mt65xx, mt6796, mt7622, mt8183 bindings to yaml.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> v2->v3:
> fix comments in v2.
> ---
>  .../pinctrl/mediatek,mt65xx-pinctrl.yaml      | 206 ++++++++
>  .../pinctrl/mediatek,mt6797-pinctrl.yaml      | 173 +++++++
>  .../pinctrl/mediatek,mt7622-pinctrl.yaml      | 373 +++++++++++++
>  .../pinctrl/mediatek,mt8183-pinctrl.yaml      | 228 ++++++++
>  .../bindings/pinctrl/pinctrl-mt65xx.txt       | 156 ------
>  .../bindings/pinctrl/pinctrl-mt6797.txt       |  83 ---
>  .../bindings/pinctrl/pinctrl-mt7622.txt       | 490 ------------------
>  .../bindings/pinctrl/pinctrl-mt8183.txt       | 132 -----
>  8 files changed, 980 insertions(+), 861 deletions(-)
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
MAINTAINERS: Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
MAINTAINERS: Documentation/devicetree/bindings/pinctrl/pinctrl-mt7622.txt

See https://patchwork.ozlabs.org/patch/1512734

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

