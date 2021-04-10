Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC3BF35B08F
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Apr 2021 23:07:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234874AbhDJVIL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 10 Apr 2021 17:08:11 -0400
Received: from gloria.sntech.de ([185.11.138.130]:38718 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232659AbhDJVIK (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 10 Apr 2021 17:08:10 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1lVKpd-0001aH-0m; Sat, 10 Apr 2021 23:07:53 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Peter Geis <pgwipeout@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>, kernel@collabora.com
Subject: Re: [PATCH] dt-bindings: pinctrl: rockchip: add RK3568 SoC support
Date:   Sat, 10 Apr 2021 23:07:50 +0200
Message-ID: <2189574.bB369e8A3T@diego>
In-Reply-To: <20210410204500.18091-1-ezequiel@collabora.com>
References: <20210410204500.18091-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am Samstag, 10. April 2021, 22:45:00 CEST schrieb Ezequiel Garcia:
> Add RK3568/RK3566 SoC support to pinctrl.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt
> index d3eae61a340d..91fab614c381 100644
> --- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt
> @@ -33,6 +33,7 @@ Required properties for iomux controller:
>  		"rockchip,rk3328-pinctrl":  for Rockchip RK3328
>  		"rockchip,rk3368-pinctrl":  for Rockchip RK3368
>  		"rockchip,rk3399-pinctrl":  for Rockchip RK3399
> +		"rockchip,rk3568-pinctrl":  for Rockchip RK3568
>  
>    - rockchip,grf: phandle referencing a syscon providing the
>  	 "general register files"
> 




