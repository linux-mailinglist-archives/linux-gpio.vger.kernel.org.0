Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B30A48A23E
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Aug 2019 17:27:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727263AbfHLP1g (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Aug 2019 11:27:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:42850 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727103AbfHLP1f (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 12 Aug 2019 11:27:35 -0400
Received: from X250 (37.80-203-192.nextgentel.com [80.203.192.37])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7261B2070C;
        Mon, 12 Aug 2019 15:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565623655;
        bh=vbVr9jjl22J0zb0ffZlickEWyD1dg9kUn83VsAuo2gc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pV7VfsZmTSwqdx7hJ19BAsFa2hxZSxzosbwfvKgUv/wMxXD6fuH8M5J9Pqve32BHM
         LGi33XJvc9mlNIxCCG7JnfYNDqfXjO0tCKMWDhPFbuQ3/kuQHKbGdxCNTOyTWARIyc
         iGsnxyY//nXtgglWqzmEM9Z93K1D54pAY09YstTk=
Date:   Mon, 12 Aug 2019 17:27:25 +0200
From:   Shawn Guo <shawnguo@kernel.org>
To:     Hui Song <hui.song_1@nxp.com>
Cc:     Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v1 2/3] arm64: dts: fix gpio node
Message-ID: <20190812152723.GK27041@X250>
References: <20190808101628.36782-1-hui.song_1@nxp.com>
 <20190808101628.36782-2-hui.song_1@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190808101628.36782-2-hui.song_1@nxp.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 08, 2019 at 06:16:27PM +0800, Hui Song wrote:
> From: Song Hui <hui.song_1@nxp.com>
> 
> Update the nodes to include little-endian
> property to be consistent with the hardware
> and add ls1088a gpio specify compatible.
> 
> Signed-off-by: Song Hui <hui.song_1@nxp.com>

The prefix should be more specific, like 'arm64: dts: ls1088a: ...'

Shawn

> ---
>  arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> index 20f5ebd..d58d203 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> @@ -269,43 +269,47 @@
>  		};
>  
>  		gpio0: gpio@2300000 {
> -			compatible = "fsl,qoriq-gpio";
> +			compatible = "fsl,ls1088a-gpio", "fsl,qoriq-gpio";
>  			reg = <0x0 0x2300000 0x0 0x10000>;
>  			interrupts = <0 36 IRQ_TYPE_LEVEL_HIGH>;
>  			gpio-controller;
>  			#gpio-cells = <2>;
>  			interrupt-controller;
>  			#interrupt-cells = <2>;
> +			little-endian;
>  		};
>  
>  		gpio1: gpio@2310000 {
> -			compatible = "fsl,qoriq-gpio";
> +			compatible = "fsl,ls1088a-gpio", "fsl,qoriq-gpio";
>  			reg = <0x0 0x2310000 0x0 0x10000>;
>  			interrupts = <0 36 IRQ_TYPE_LEVEL_HIGH>;
>  			gpio-controller;
>  			#gpio-cells = <2>;
>  			interrupt-controller;
>  			#interrupt-cells = <2>;
> +			little-endian;
>  		};
>  
>  		gpio2: gpio@2320000 {
> -			compatible = "fsl,qoriq-gpio";
> +			compatible = "fsl,ls1088a-gpio", "fsl,qoriq-gpio";
>  			reg = <0x0 0x2320000 0x0 0x10000>;
>  			interrupts = <0 37 IRQ_TYPE_LEVEL_HIGH>;
>  			gpio-controller;
>  			#gpio-cells = <2>;
>  			interrupt-controller;
>  			#interrupt-cells = <2>;
> +			little-endian;
>  		};
>  
>  		gpio3: gpio@2330000 {
> -			compatible = "fsl,qoriq-gpio";
> +			compatible = "fsl,ls1088a-gpio", "fsl,qoriq-gpio";
>  			reg = <0x0 0x2330000 0x0 0x10000>;
>  			interrupts = <0 37 IRQ_TYPE_LEVEL_HIGH>;
>  			gpio-controller;
>  			#gpio-cells = <2>;
>  			interrupt-controller;
>  			#interrupt-cells = <2>;
> +			little-endian;
>  		};
>  
>  		ifc: ifc@2240000 {
> -- 
> 2.9.5
> 
