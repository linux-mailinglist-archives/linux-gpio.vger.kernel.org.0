Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B977926D409
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Sep 2020 08:58:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726171AbgIQG6d (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Sep 2020 02:58:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:52590 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726142AbgIQG62 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 17 Sep 2020 02:58:28 -0400
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9DA8C21D41;
        Thu, 17 Sep 2020 06:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600325906;
        bh=nPSrDuBIqK++Cs2Yf8watCT9FKUAvE8l/UEvBK+iyoI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=R8+Zxy8DVnHIGDtj/rxH1HYE7+ZI7x6ClAOFZg+v/22EvmPQmS0iR+V1m6PRFpW3X
         X873efb8X9+8WoporP624GJXUCGLxqPWvml5scUjhzOAEvZNxJr7BjL3kGMyKIHRIa
         H25+QiYH6WFTG3Sh7e7uJRiq2cQfj0Qetv1YjJ4k=
Received: by mail-ed1-f43.google.com with SMTP id n22so1324522edt.4;
        Wed, 16 Sep 2020 23:58:26 -0700 (PDT)
X-Gm-Message-State: AOAM533xf7kos8Rcs+nf+MxotAttzjoFfbIq9U+TD7aKPz2l89rq5mbZ
        qhys+waoSlxfQM72s1cF7a4C95/G/ii+VuZdo4c=
X-Google-Smtp-Source: ABdhPJw6oBjGfpKJpPCFXBca1WTyVw1bjowRIiOkT6Iq1M84hhnCUG0jSC0ArmHu21bBl/Bc3OMUftiIy2mZoqPT59s=
X-Received: by 2002:a50:e78f:: with SMTP id b15mr31833332edn.104.1600325905101;
 Wed, 16 Sep 2020 23:58:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200916162250.16098-1-krzk@kernel.org> <20200916162250.16098-3-krzk@kernel.org>
 <CAMuHMdUS134fokz9Xus_pnL6tVYvgQE_uAS4Q-+B4r77VeY=xg@mail.gmail.com>
In-Reply-To: <CAMuHMdUS134fokz9Xus_pnL6tVYvgQE_uAS4Q-+B4r77VeY=xg@mail.gmail.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Thu, 17 Sep 2020 08:58:13 +0200
X-Gmail-Original-Message-ID: <CAJKOXPeTTbrz5Ja8Y=qeCx_vbUub9sBzQqQY1yNa8dWN0nafGg@mail.gmail.com>
Message-ID: <CAJKOXPeTTbrz5Ja8Y=qeCx_vbUub9sBzQqQY1yNa8dWN0nafGg@mail.gmail.com>
Subject: Re: [PATCH 2/8] dt-bindings: gpio: include common schema in GPIO controllers
To:     Geert Uytterhoeven <geert@linux-m68k.org>
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

On Thu, 17 Sep 2020 at 08:40, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Krzysztof,
>
> On Wed, Sep 16, 2020 at 6:23 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > Include the common GPIO schema in GPIO controllers to be sure all common
> > properties are properly validated.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> Thanks for your patch!
>
> > ---
> >  .../devicetree/bindings/gpio/brcm,xgs-iproc-gpio.yaml          | 3 +++
> >  Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml       | 3 +++
> >  Documentation/devicetree/bindings/gpio/gpio-mxs.yaml           | 3 +++
> >  Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml       | 3 +++
> >  Documentation/devicetree/bindings/gpio/gpio-rda.yaml           | 3 +++
> >  Documentation/devicetree/bindings/gpio/gpio-vf610.yaml         | 3 +++
> >  Documentation/devicetree/bindings/gpio/mrvl-gpio.yaml          | 1 +
> >  Documentation/devicetree/bindings/gpio/qcom,wcd934x-gpio.yaml  | 3 +++
> >  Documentation/devicetree/bindings/gpio/renesas,em-gio.yaml     | 3 +++
> >  Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml  | 3 +++
> >  Documentation/devicetree/bindings/gpio/sifive,gpio.yaml        | 3 +++
> >  .../devicetree/bindings/gpio/socionext,uniphier-gpio.yaml      | 3 +++
> >  Documentation/devicetree/bindings/gpio/xylon,logicvc-gpio.yaml | 3 +++
> >  13 files changed, 37 insertions(+)
>
> There are more binding files describing GPIO controllers outside the
> Documentation/devicetree/bindings/gpio/ subdirectory, cfr.
> 'git grep gpio-controller:.true -- "Doc*yaml"'

Oh, indeed. Thanks for spotting these. I will check them and send a follow up.

Best regards,
Krzysztof
