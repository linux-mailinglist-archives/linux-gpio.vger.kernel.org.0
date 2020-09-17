Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C131626D3D1
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Sep 2020 08:40:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726196AbgIQGkX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Sep 2020 02:40:23 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:45823 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbgIQGkX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Sep 2020 02:40:23 -0400
Received: by mail-oi1-f193.google.com with SMTP id z26so1227927oih.12;
        Wed, 16 Sep 2020 23:40:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5pAuv3apgn3zMedgKzg1fHsW6HJeuRQq0Uxv7kzEHzU=;
        b=JMbyxdtTPrmF0AVnhh4zj4ejRp4/6VNksf8YkXFoy/ewqv7u356jGMUm+ntfKYEtLQ
         wEvUbedmg1f8jtfcsa+0PyLMzXAqw2gFy4rBoDZZXw0s82eGU+Ct3+i1xd0PPGeNO3KU
         7L50PI/rFWnyeq7U3o6CXI0CIXAZ0JbxfTeNnu6b3NCsUJIjmM5X7cdyBdpGYcST6WDo
         xh/2Q7k2SFaONcds4a7bqGfErLI75J3xjp4wNKWroTYI7SvmcI8IY7kZw35VxKxX9blP
         +LLVDqYHfgHITkUrrmtgGgMi8IMkrayPP2hLA7qnxZXL3Ijx27EY9o4+BK1KDGzdHcut
         EAyw==
X-Gm-Message-State: AOAM530iWB9cmtTehu5cfT7sXfFiVXp96CKluMp19uaD4hSAnmwaLui8
        lwdkCEkJUafcVktLPj36q/6kEp2LvmjdeI+JVQU=
X-Google-Smtp-Source: ABdhPJwRx5EmCljn9g3yX8DYdM4t9aUSxsmqF94I58rxrRGiI/zXEZcu6GX1mLgMwnc0JY0rw/qLetnZRUk/FQe87lA=
X-Received: by 2002:aca:52d6:: with SMTP id g205mr5458445oib.54.1600324822000;
 Wed, 16 Sep 2020 23:40:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200916162250.16098-1-krzk@kernel.org> <20200916162250.16098-3-krzk@kernel.org>
In-Reply-To: <20200916162250.16098-3-krzk@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 17 Sep 2020 08:40:10 +0200
Message-ID: <CAMuHMdUS134fokz9Xus_pnL6tVYvgQE_uAS4Q-+B4r77VeY=xg@mail.gmail.com>
Subject: Re: [PATCH 2/8] dt-bindings: gpio: include common schema in GPIO controllers
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Anson Huang <Anson.Huang@nxp.com>,
        Sungbo Eo <mans0n@gorani.run>, Stefan Agner <stefan@agner.ch>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yash Shah <yash.shah@sifive.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-unisoc@lists.infradead.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Krzysztof,

On Wed, Sep 16, 2020 at 6:23 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> Include the common GPIO schema in GPIO controllers to be sure all common
> properties are properly validated.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Thanks for your patch!

> ---
>  .../devicetree/bindings/gpio/brcm,xgs-iproc-gpio.yaml          | 3 +++
>  Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml       | 3 +++
>  Documentation/devicetree/bindings/gpio/gpio-mxs.yaml           | 3 +++
>  Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml       | 3 +++
>  Documentation/devicetree/bindings/gpio/gpio-rda.yaml           | 3 +++
>  Documentation/devicetree/bindings/gpio/gpio-vf610.yaml         | 3 +++
>  Documentation/devicetree/bindings/gpio/mrvl-gpio.yaml          | 1 +
>  Documentation/devicetree/bindings/gpio/qcom,wcd934x-gpio.yaml  | 3 +++
>  Documentation/devicetree/bindings/gpio/renesas,em-gio.yaml     | 3 +++
>  Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml  | 3 +++
>  Documentation/devicetree/bindings/gpio/sifive,gpio.yaml        | 3 +++
>  .../devicetree/bindings/gpio/socionext,uniphier-gpio.yaml      | 3 +++
>  Documentation/devicetree/bindings/gpio/xylon,logicvc-gpio.yaml | 3 +++
>  13 files changed, 37 insertions(+)

There are more binding files describing GPIO controllers outside the
Documentation/devicetree/bindings/gpio/ subdirectory, cfr.
'git grep gpio-controller:.true -- "Doc*yaml"'

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
