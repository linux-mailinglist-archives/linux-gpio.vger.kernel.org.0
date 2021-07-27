Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1361F3D78BA
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jul 2021 16:44:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233321AbhG0OoE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Jul 2021 10:44:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:34732 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232419AbhG0OoE (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 27 Jul 2021 10:44:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0797761AFF;
        Tue, 27 Jul 2021 14:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627397044;
        bh=DCZF5vBtRxSN3Atl2JhvAAXniNqQ9yKfWqAuw901/g0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=hXmkITMiD+G++yOdjW8wvcqV7BEWConYzRL7641nwDZEuw3AsVgfogwi2oLfraOAi
         eCpITE1ME7ar+yxsaWsDT6BqcgMhr6goj4e2jzTyDjsoANtCbVbCB4+F0IRmnW8QfI
         2yKPtVByc5VwdN+++Fo4CdqnT/LTpEWaUXVHLYVJV5ii0yMRKy+wgT7lAdPr85tC7G
         ZR5MoP9Aed3Xt1rtxWSxJmeM0XSfNdVH7kFEhdGOtTp/3EYfgS6P2vCRjUDzsFI0aS
         geDl2wujqFTNaN/23At38LkTBaLLw3kO99hI/FLsyAjtZvITSpbH1TwOPdNu7vhKEq
         qd7n6CC9zW7YQ==
Received: by mail-ed1-f54.google.com with SMTP id u12so15696008eds.2;
        Tue, 27 Jul 2021 07:44:03 -0700 (PDT)
X-Gm-Message-State: AOAM5304AhnuUB1i7sTjf3Xha6V4SCP6D+FAVWT4zHvmdMFNd16zOISy
        d39dH/ldQa76KU8sLALeOveOckwqMeHVG1ulsg==
X-Google-Smtp-Source: ABdhPJx8n4J+Z7UVlfNp/CVCcr9EQN4eY3722ljng8pzZMprzmkjsfd/Smzx7DvX5NOBodU83zHEZApOaOyOxc/Uv34=
X-Received: by 2002:aa7:df12:: with SMTP id c18mr28268276edy.62.1627397042636;
 Tue, 27 Jul 2021 07:44:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210721191558.22484-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20210721191558.22484-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210721191558.22484-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 27 Jul 2021 08:43:51 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKLGf5VGwt9fbs4nYuxkq12sfTnuvmENTLshz45jPE+GA@mail.gmail.com>
Message-ID: <CAL_JsqKLGf5VGwt9fbs4nYuxkq12sfTnuvmENTLshz45jPE+GA@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Add
 DT bindings for RZ/G2L pinctrl
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 21, 2021 at 1:16 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
>
> Add device tree binding documentation and header file for Renesas
> RZ/G2L pinctrl.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../pinctrl/renesas,rzg2l-pinctrl.yaml        | 155 ++++++++++++++++++
>  include/dt-bindings/pinctrl/rzg2l-pinctrl.h   |  23 +++
>  2 files changed, 178 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
>  create mode 100644 include/dt-bindings/pinctrl/rzg2l-pinctrl.h

Reviewed-by: Rob Herring <robh@kernel.org>
