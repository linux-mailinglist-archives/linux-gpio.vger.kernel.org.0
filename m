Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD5C13D92B0
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jul 2021 18:03:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235688AbhG1QDC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Jul 2021 12:03:02 -0400
Received: from mail-io1-f48.google.com ([209.85.166.48]:44810 "EHLO
        mail-io1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230372AbhG1QDB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Jul 2021 12:03:01 -0400
Received: by mail-io1-f48.google.com with SMTP id l18so3510155ioh.11;
        Wed, 28 Jul 2021 09:02:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AlrRt63O8LnOYD8MBx5zu+erqllBRCmDVTupX8LxCl4=;
        b=lfX7bbMoMTuJxZPOf9YXFv/Yatv7dWC5pFw3isjDUU0A0BxbJ1Gv4jKcFX4R4NGG8L
         fZrVhV1kiQAMfHuFa3h/K2TRxCFIfmKI0pSH0ZvEMUOxNvxxLkqpTu0xtCHSdJACDc4u
         F/uH4t+lDlI78sOiwKDmGSwyhu6NWUOXclmS2QrMh0gECxDjK1bmcxxHWODXY+DUwKLX
         vROkubl9eKaLo3KXeDU8emZB65/M8M+v/lIT8ndmCooZDtsruVL0Z7EfRpImf7FZM6+h
         FYpf7AUIHI130io3Tl+7+HjhdaczzRnGTN0R/XV7/LFwmYf+jHDp0BMx7PdcD20pf53H
         3E4A==
X-Gm-Message-State: AOAM530t8SdSFgEdL2/55v6ilBMmHaoJUJgAVbmBTZyn3emFxTifu7s8
        IspbFWMgwk6HxIqQA5UugA==
X-Google-Smtp-Source: ABdhPJxgx+iXa8zZL6hdbpKKkzPoHiC+UmtuBd1XEyLj60qo3WskzKZEDMsDRQXw9uC0k+WDOaFnrQ==
X-Received: by 2002:a05:6602:1814:: with SMTP id t20mr168381ioh.204.1627488178433;
        Wed, 28 Jul 2021 09:02:58 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id z6sm159022ilz.54.2021.07.28.09.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 09:02:57 -0700 (PDT)
Received: (nullmailer pid 1150584 invoked by uid 1000);
        Wed, 28 Jul 2021 16:02:53 -0000
Date:   Wed, 28 Jul 2021 10:02:53 -0600
From:   Rob Herring <robh@kernel.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Prabhakar <prabhakar.csengg@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v4 1/4] dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Add
 DT bindings for RZ/G2L pinctrl
Message-ID: <20210728160253.GA1150550@robh.at.kernel.org>
References: <20210727112328.18809-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210727112328.18809-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210727112328.18809-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 27 Jul 2021 12:23:25 +0100, Lad Prabhakar wrote:
> Add device tree binding documentation and header file for Renesas
> RZ/G2L pinctrl.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Hi Rob,
> 
> This patch requires the base series to be Linux 5.14-rc2(or +) or
> the bots would complain about check failures
> 
> Cheers,
> Prabhakar
> ---
>  .../pinctrl/renesas,rzg2l-pinctrl.yaml        | 155 ++++++++++++++++++
>  include/dt-bindings/pinctrl/rzg2l-pinctrl.h   |  23 +++
>  2 files changed, 178 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
>  create mode 100644 include/dt-bindings/pinctrl/rzg2l-pinctrl.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
