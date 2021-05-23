Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03D5138D824
	for <lists+linux-gpio@lfdr.de>; Sun, 23 May 2021 03:55:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231500AbhEWB4j (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 22 May 2021 21:56:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231495AbhEWB4j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 22 May 2021 21:56:39 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0206BC061574;
        Sat, 22 May 2021 18:55:14 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 877AD89A;
        Sun, 23 May 2021 03:55:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621734912;
        bh=lIHG9XdMCsPizWjhBdh9flUm6yNe69HSqjnRPgAdvn4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NuKuwKCJEhOhOIwRa1jSp1EREag6jf/N2MAOvY0/Rr3fCBYkvXRd4leOum0wJzOnm
         Tdd3ZfN0RjrW830uVDd5526YaS0n8hXWe1VGxAiQnJd7ChtvjAGaPJv4nRtdDtK/I0
         zC2QlMV2JJYh5yUsvGzQ1Q0OX6CLV4cxv9cTCJBQ=
Date:   Sun, 23 May 2021 04:55:10 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Jan Tuerk <jan.tuerk@emtrion.com>,
        Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] ARM: dts: imx: emcon-avari: Fix nxp,pca8574
 #gpio-cells
Message-ID: <YKm1/hFtNmS6rPiu@pendragon.ideasonboard.com>
References: <cover.1621583562.git.geert+renesas@glider.be>
 <6cd916fc8c0a133cd216eee06cac86716b66eff4.1621583562.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6cd916fc8c0a133cd216eee06cac86716b66eff4.1621583562.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Geert,

Thank you for the patch.

On Fri, May 21, 2021 at 09:54:07AM +0200, Geert Uytterhoeven wrote:
> According to the DT bindings, #gpio-cells must be two.
> 
> Fixes: 63e71fedc07c4ece ("ARM: dts: Add support for emtrion emCON-MX6 series")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  arch/arm/boot/dts/imx6qdl-emcon-avari.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/imx6qdl-emcon-avari.dtsi b/arch/arm/boot/dts/imx6qdl-emcon-avari.dtsi
> index 828cf3e39784afd6..c4e146f3341bb85d 100644
> --- a/arch/arm/boot/dts/imx6qdl-emcon-avari.dtsi
> +++ b/arch/arm/boot/dts/imx6qdl-emcon-avari.dtsi
> @@ -126,7 +126,7 @@ boardid: gpio@3a {
>  		compatible = "nxp,pca8574";
>  		reg = <0x3a>;
>  		gpio-controller;
> -		#gpio-cells = <1>;
> +		#gpio-cells = <2>;
>  	};
>  };
>  

-- 
Regards,

Laurent Pinchart
