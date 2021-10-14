Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B88942DBAF
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Oct 2021 16:31:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232009AbhJNOdY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 Oct 2021 10:33:24 -0400
Received: from mail-oo1-f47.google.com ([209.85.161.47]:33316 "EHLO
        mail-oo1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231956AbhJNOdT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Oct 2021 10:33:19 -0400
Received: by mail-oo1-f47.google.com with SMTP id u5-20020a4ab5c5000000b002b6a2a05065so1960170ooo.0;
        Thu, 14 Oct 2021 07:31:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=4cNofa+G4dhjMSIDHBWRSxnSxUlK6Lt3DNvniT5Wl2Q=;
        b=qU8uxv/pzYAvvLkeOWQ/fb6s7P1vG9QfCmAr91ifJVKhddBhU9Bac7jEqI5uuGPGj7
         yYKDHVZz17qw/PK4yHtVjGyvCkBUUz1gQreg6QhoS03PBlBQanlI33KBFFO2sx625Xzt
         oNVYF+UC8k06AbmU52ggR9KJJA7Sq2AglwfJy0CN/0kXdNPfv+I8iq7BQcTMSb5bZuok
         OLEo9ofWxrcsNUa2GA5NdCNCOOvGwaBUJkN0BMfAlF1hfhkKZESdrsx0Luk75lmrI2z1
         VeGUwqu6uj+wnFljuqfo7xs1Gh9AaHVl84DoRm32ualC2KKGAU15IbBSpWNmD0miG5Gp
         I/bA==
X-Gm-Message-State: AOAM532JzHiTCHh7hjSe72pb1IhOFeFb9ILZIQh+YMuhALtlUncU/SkX
        IUH7ttj5qbNQXtpOIqA41Q==
X-Google-Smtp-Source: ABdhPJy9Rh4sKWGiPLtzJei6nJmXJAXjFDgOaH5xk78UYN7aJpCxe7aso4p9zzX06/Ktp2RSAaWvIA==
X-Received: by 2002:a4a:a38d:: with SMTP id s13mr4345196ool.60.1634221874182;
        Thu, 14 Oct 2021 07:31:14 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id e1sm664619oiw.16.2021.10.14.07.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 07:31:13 -0700 (PDT)
Received: (nullmailer pid 3295877 invoked by uid 1000);
        Thu, 14 Oct 2021 14:31:04 -0000
From:   Rob Herring <robh@kernel.org>
To:     Sam Shih <sam.shih@mediatek.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Ryder Lee <Ryder.Lee@mediatek.com>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org, Sean Wang <sean.wang@kernel.org>,
        John Crispin <john@phrozen.org>,
        linux-arm-kernel@lists.infradead.org
In-Reply-To: <20211014075836.17681-2-sam.shih@mediatek.com>
References: <20211014075836.17681-1-sam.shih@mediatek.com> <20211014075836.17681-2-sam.shih@mediatek.com>
Subject: Re: [PATCH v7 1/4] dt-bindings: pinctrl: update bindings for MT7986 SoC
Date:   Thu, 14 Oct 2021 09:31:04 -0500
Message-Id: <1634221864.165084.3295876.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 14 Oct 2021 15:58:33 +0800, Sam Shih wrote:
> This updates bindings for MT7986 pinctrl driver. The
> difference of pinctrl between mt7986a and mt7986b is that pin-41 to
> pin-65 do not exist on mt7986b
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> 
> ---
> v7 : updated pinctcl node binding description, and separate pinctrl
>      part into a single patch series
> 
> Original thread:
> https://lore.kernel.org/all/8348ed3e-c561-ad7e-fe9e-a31ed346d8d0@gmail.com/
> 
> v6 : fixed yamllint warnings/errors v2
> v5 : fixed yamllint warnings/errors v1
> v4 : used yaml format instead of txt format document
> v3 : make mt7986 pinctrl bindings as a separate file
> v2 : deleted the redundant description of mt7986a/mt7986b
> ---
>  .../pinctrl/mediatek,mt7986-pinctrl.yaml      | 364 ++++++++++++++++++
>  1 file changed, 364 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.example.dts:52.36-57.15: ERROR (duplicate_node_names): /example-0/soc/pinctrl@1001f000/uart1-pins: Duplicate node name
ERROR: Input tree has errors, aborting (use -f to force output)
make[1]: *** [scripts/Makefile.lib:385: Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.example.dt.yaml] Error 2
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1441: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1540821

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

