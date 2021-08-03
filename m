Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FD603DF0D0
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Aug 2021 16:55:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235607AbhHCOzP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Aug 2021 10:55:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:35148 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234206AbhHCOzO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 3 Aug 2021 10:55:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D391C60EB7;
        Tue,  3 Aug 2021 14:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628002503;
        bh=DRuO5cfsBSAF+iYWFud7iNIH4PmO8sgoaJdiS0nJyGo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=tH973fCua+p9oBH6RvfFvQbdSi2vNr/Rp2EDqcYJ3u/fN0Pfff+HAtHBvsec8IwB8
         yRXp3m6wMZDvbiiK26MH09JvMwy5KNIg//hZzbPpiP3mUV2UXm3M/1iHzCwkpMPx/P
         k0LxD16I3oT0w122yfFd1GvMMP4/pLYe4ZVpqRLWq9+75fgicATh5X5hK3q5TuucNl
         DNaCyD3y5xTh5q4y0Yp6KnPykWboe1BwbsiFVFEEn5L0R4ELkN9+3dI+HEeEPT/rfR
         bCRuyxciaI8ry0bcs8XVRMcSpJt9HV9P+q8rOFKrr6p8a5jtWTIusOl5hhPj7tECp1
         DSdDZ+zlrx9tA==
Received: by mail-ed1-f46.google.com with SMTP id z11so6913673edb.11;
        Tue, 03 Aug 2021 07:55:03 -0700 (PDT)
X-Gm-Message-State: AOAM533L4DmyK4tnzusxbMVrTiI0jf/m3mjQonEiS4C1X0LkITYF7jFD
        DPnIOVajYzW5x4LT867bsKYqBBtBdDoeaLT1ug==
X-Google-Smtp-Source: ABdhPJx1mfvWAIa8Gzwj7redo7OPRL41TR54YoEAvn/Pb97SizGwd3m59UMsPWWCkCPr5eL+6Ekyw1g8j/oB9veO4yA=
X-Received: by 2002:aa7:cb19:: with SMTP id s25mr26400510edt.194.1628002502460;
 Tue, 03 Aug 2021 07:55:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210803051318.2570994-1-hsinyi@chromium.org> <20210803051318.2570994-3-hsinyi@chromium.org>
 <1627999172.502726.3179055.nullmailer@robh.at.kernel.org>
In-Reply-To: <1627999172.502726.3179055.nullmailer@robh.at.kernel.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 3 Aug 2021 08:54:49 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJOppSJx+rNvqtz9LGM_GFwjy9xCF1+On3-K1b8fOmuyg@mail.gmail.com>
Message-ID: <CAL_JsqJOppSJx+rNvqtz9LGM_GFwjy9xCF1+On3-K1b8fOmuyg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] dt-bindings: mediatek: convert pinctrl to yaml
To:     Hsin-Yi Wang <hsinyi@chromium.org>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>, devicetree@vger.kernel.org,
        Andy Teng <andy.teng@mediatek.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Enric Balletbo Serra <eballetbo@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 3, 2021 at 7:59 AM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, 03 Aug 2021 13:13:19 +0800, Hsin-Yi Wang wrote:
> > Convert mt65xx, mt6796, mt7622, mt8183 bindings to yaml.
> >
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> > v2->v3:
> > fix comments in v2.
> > ---
> >  .../pinctrl/mediatek,mt65xx-pinctrl.yaml      | 206 ++++++++
> >  .../pinctrl/mediatek,mt6797-pinctrl.yaml      | 173 +++++++
> >  .../pinctrl/mediatek,mt7622-pinctrl.yaml      | 373 +++++++++++++
> >  .../pinctrl/mediatek,mt8183-pinctrl.yaml      | 228 ++++++++
> >  .../bindings/pinctrl/pinctrl-mt65xx.txt       | 156 ------
> >  .../bindings/pinctrl/pinctrl-mt6797.txt       |  83 ---
> >  .../bindings/pinctrl/pinctrl-mt7622.txt       | 490 ------------------
> >  .../bindings/pinctrl/pinctrl-mt8183.txt       | 132 -----
> >  8 files changed, 980 insertions(+), 861 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt6797-pinctrl.yaml
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
> >  delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt6797.txt
> >  delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt7622.txt
> >  delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt8183.txt
> >
>
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.example.dts:21:18: fatal error: dt-bindings/pinctrl/mt8183-pinfunc.h: No such file or directory
>    21 |         #include <dt-bindings/pinctrl/mt8183-pinfunc.h>
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[1]: *** [scripts/Makefile.lib:380: Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.example.dt.yaml] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1419: dt_binding_check] Error 2
> \ndoc reference errors (make refcheckdocs):
> MAINTAINERS: Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
> MAINTAINERS: Documentation/devicetree/bindings/pinctrl/pinctrl-mt7622.txt

Not sure why the header patch is not getting applied, so ignore that.
But these MAINTAINERS references need to be fixed.

Rob
