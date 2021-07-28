Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18C623D901C
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jul 2021 16:10:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236368AbhG1OKi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Jul 2021 10:10:38 -0400
Received: from gloria.sntech.de ([185.11.138.130]:50228 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235427AbhG1OKi (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 28 Jul 2021 10:10:38 -0400
Received: from [95.90.166.74] (helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1m8kGX-0005zA-8U; Wed, 28 Jul 2021 16:10:33 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peter Geis <pgwipeout@gmail.com>
Subject: Re: [PATCH 1/9] dt-bindings: gpio: rockchip,gpio-bank: increase max clocks
Date:   Wed, 28 Jul 2021 16:10:32 +0200
Message-ID: <10355864.nUPlyArG6x@diego>
In-Reply-To: <20210728135534.703028-2-pgwipeout@gmail.com>
References: <20210728135534.703028-1-pgwipeout@gmail.com> <20210728135534.703028-2-pgwipeout@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Peter,

Am Mittwoch, 28. Juli 2021, 15:55:26 CEST schrieb Peter Geis:
> The rk356x adds a debounce clock to the gpio devices.
> Increase the maximum clocks to account for it.
> 
> Signed-off-by: Peter Geis <pgwipeout@gmail.com>

that binding change is also part of Jianqun's gpio driver series,
also adds clock descriptions for both and even got an Ack from Rob
already, so we should be going with that other variant ;-)

Heiko

> ---
>  Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
> index d993e002cebe..489a5263a7a1 100644
> --- a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
> +++ b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
> @@ -22,7 +22,7 @@ properties:
>      maxItems: 1
>  
>    clocks:
> -    maxItems: 1
> +    maxItems: 2
>  
>    gpio-controller: true
>  
> 




