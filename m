Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63F7E3105A1
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Feb 2021 08:13:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231532AbhBEHMW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Feb 2021 02:12:22 -0500
Received: from mail-ed1-f48.google.com ([209.85.208.48]:34461 "EHLO
        mail-ed1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231476AbhBEHMC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Feb 2021 02:12:02 -0500
Received: by mail-ed1-f48.google.com with SMTP id df22so7616633edb.1;
        Thu, 04 Feb 2021 23:11:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=c6300FPJgdNhEYdiFOY4v3mF7KUoaPzekcF12DCQngw=;
        b=hdFWJBMgnYjS+npkASqdNs4Mjy+usqtZ+wYzYFN/iYHou/F6DcA/RAhUEEggqA9UR5
         g2MKG5zxzR+ytdjKEoPJjRL7mTku+4v8C8K1HCpsBS4rWF5Dc0wThOgEl4Td6GPtRzMy
         DDc6Y4oB4Tsrnn5IeRSOVcJdMp9OAGn4cWQtCyM8XTnPN4m5jNk5yEBYcklegTyeaCQQ
         IJiav7nVW9Ope+ypg9BfNGQxpkrME5xjXbPyaJXWPRTA3AtPZoNwwPVzysI2R3OwRfJl
         DLCluZAWVcH+SMi/6BpLXgix7B1xZgI3CmmtLOTdKwVMBCE8w/sLPLQWpChiYuQspivO
         x76w==
X-Gm-Message-State: AOAM532kojfKtDfQ1EKmKe2G8iZzJjvpm3QHDETfLhKgg53f21o7KEKV
        es7xhEOro3qMhDWVHnHokeo=
X-Google-Smtp-Source: ABdhPJzMsS7GJ3tNPHi18Tl9yXVfbJrYFFNhnZea/BS4TtA/CfEwjxcggsZUsuEjnlIp7/Nj3dKCog==
X-Received: by 2002:aa7:dc17:: with SMTP id b23mr2263816edu.139.1612509080553;
        Thu, 04 Feb 2021 23:11:20 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id e6sm3746713edv.46.2021.02.04.23.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 23:11:19 -0800 (PST)
Date:   Fri, 5 Feb 2021 08:11:18 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sean Wang <sean.wang@kernel.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: Group tuples in pin control
 properties
Message-ID: <20210205071118.obqsdlu64udsp5b2@kozik-lap>
References: <20210204125718.1646082-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210204125718.1646082-1-geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 04, 2021 at 01:57:18PM +0100, Geert Uytterhoeven wrote:
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

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
