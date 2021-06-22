Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B618A3B056A
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Jun 2021 15:02:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230249AbhFVNEt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Jun 2021 09:04:49 -0400
Received: from gloria.sntech.de ([185.11.138.130]:43302 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230299AbhFVNEq (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 22 Jun 2021 09:04:46 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1lvg2t-0003mM-KV; Tue, 22 Jun 2021 15:02:27 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     linus.walleij@linaro.org, Jianqun Xu <jay.xu@rock-chips.com>
Cc:     linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org,
        robh+dt@kernel.org, kever.yang@rock-chips.com,
        Liang Chen <cl@rock-chips.com>
Subject: Re: [PATCH 4/9] dt-bindings: gpio: change items restriction of clock for rockchip,gpio-bank
Date:   Tue, 22 Jun 2021 15:02:26 +0200
Message-ID: <5359180.zXnORWrf4K@diego>
In-Reply-To: <20210618062449.1067106-5-jay.xu@rock-chips.com>
References: <20210618062449.1067106-1-jay.xu@rock-chips.com> <20210618062449.1067106-5-jay.xu@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Jay,

Am Freitag, 18. Juni 2021, 08:24:44 CEST schrieb Jianqun Xu:
> From: Liang Chen <cl@rock-chips.com>
> 
> The clock property need 2 items on some rockchip chips.
> 
> Signed-off-by: Liang Chen <cl@rock-chips.com>
> ---
>  .../devicetree/bindings/gpio/rockchip,gpio-bank.yaml         | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
> index d993e002cebe..0d62c28fb58d 100644
> --- a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
> +++ b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
> @@ -22,7 +22,10 @@ properties:
>      maxItems: 1
>  
>    clocks:
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description: APB interface clock source
> +      - description: GPIO debounce reference clock source

as said in a previous mail, please adapt this to use clock-names for the
two clock variant. Maybe something like

clocks:
  minItems: 1
  maxItems: 2

clock-names:
  minItems: 1
  maxItems: 2
  items:
    - const: apb_pclk
    - const: debounce

if:
   properties:
     clocks:
       items:
         const: 2
then:
   required:
    - clock-names

[not yet sure if that works]



Heiko

>  
>    gpio-controller: true
>  
> 




