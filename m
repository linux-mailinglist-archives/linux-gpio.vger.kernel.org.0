Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD48F315AB2
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Feb 2021 01:10:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233627AbhBJAIr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Feb 2021 19:08:47 -0500
Received: from mail-oi1-f179.google.com ([209.85.167.179]:45952 "EHLO
        mail-oi1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234843AbhBIXVz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Feb 2021 18:21:55 -0500
Received: by mail-oi1-f179.google.com with SMTP id m7so21289284oiw.12
        for <linux-gpio@vger.kernel.org>; Tue, 09 Feb 2021 15:21:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gYxKP75LmIpzRSgUYVpjMw/sU2Fxi77FH3ZjQaBxftc=;
        b=YuCZVzS+4mftyNGb7Vw8GIz176EEdSxIDSH9PU2ILTGyXewHw0PRMxHH7uhGSNrED2
         4TMFalVVkdIUflI2Poatb1SaEeq0DkQOvBcp48LBJwjOnB9R2LT/lPHDHKJHY7qGCqgr
         NyFux2psCTXhAwVQ8KNgXCAIIng9z7l5PM3yosKQBg9hSYofMTIdZVpM+i2y8JjDTdtM
         l0TrsO+tjy/gJVrtg66cEk1YReYgGcPsC1M5H9gxUUE1slMJP6hz8PzqR5V8riVLpux0
         ZbfFK16Q5cbxVciPuNmiuMEdLDjWX8+SfYD6ufjZ7QeFJqodXjTGtaQEP3BU43ORyH8y
         mpbw==
X-Gm-Message-State: AOAM531E85ZBMPhynzgbv8fhs0RUG97rFF5TpUrNwSlC5mXY2KmmdoSK
        dxsNBddlRvxjLht5k1CxNYfRTIpMow==
X-Google-Smtp-Source: ABdhPJwrvMZfxWbpsM9XyfvegpZTNctZFmlC+br/cQVMXgoJbjSrAO3hMqspjmEgwRgCTu4EaLUXWQ==
X-Received: by 2002:aca:a914:: with SMTP id s20mr29215oie.33.1612911097993;
        Tue, 09 Feb 2021 14:51:37 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id o14sm3831253otl.68.2021.02.09.14.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 14:51:37 -0800 (PST)
Received: (nullmailer pid 370189 invoked by uid 1000);
        Tue, 09 Feb 2021 22:51:35 -0000
Date:   Tue, 9 Feb 2021 16:51:35 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Tomasz Figa <tomasz.figa@gmail.com>,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Stefan Agner <stefan@agner.ch>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        linux-samsung-soc@vger.kernel.org,
        Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] dt-bindings: pinctrl: Group tuples in pin control
 properties
Message-ID: <20210209225135.GA370159@robh.at.kernel.org>
References: <20210204125718.1646082-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210204125718.1646082-1-geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 04 Feb 2021 13:57:18 +0100, Geert Uytterhoeven wrote:
> To improve human readability and enable automatic validation, the tuples
> in "pinctrl-*" properties should be grouped using angle brackets.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../devicetree/bindings/pinctrl/brcm,ns2-pinmux.txt    |  2 +-
>  .../devicetree/bindings/pinctrl/brcm,nsp-pinmux.txt    |  2 +-
>  .../devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.txt  |  2 +-
>  .../devicetree/bindings/pinctrl/pinctrl-bindings.txt   |  4 ++--
>  .../devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt   |  2 +-
>  .../devicetree/bindings/pinctrl/pinctrl-mt65xx.txt     |  2 +-
>  .../devicetree/bindings/pinctrl/pinctrl-single.txt     | 10 +++++-----
>  .../devicetree/bindings/pinctrl/samsung-pinctrl.txt    |  2 +-
>  8 files changed, 13 insertions(+), 13 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
