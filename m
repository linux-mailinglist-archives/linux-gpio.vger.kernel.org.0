Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 821D99BFC8
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Aug 2019 21:14:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727997AbfHXTOx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 24 Aug 2019 15:14:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:59664 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726553AbfHXTOx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 24 Aug 2019 15:14:53 -0400
Received: from X250.getinternet.no (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 864092146E;
        Sat, 24 Aug 2019 19:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566674092;
        bh=8qX1ZJe1XLYMzC7AJza+cKAUFCy/FnwUUpWjirZd0JY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ia/mYxruLGEEb0ATpZpUyBqnVlcfnLCbSfL9lrPv495b+HukbAQOuSsBDb36Ok2uC
         gaxroPEWyjeNjJQO+xN6+137UrES0LIxO9culjvY5e425FKLEi6ElxU+sKnAWXg4P7
         phqPRMe6N7kmWdzUGmYC9lccfSdVtTAgBQcYugQk=
Date:   Sat, 24 Aug 2019 21:14:39 +0200
From:   Shawn Guo <shawnguo@kernel.org>
To:     Hui Song <hui.song_1@nxp.com>
Cc:     Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4] arm64: dts: ls1088a: fix gpio node
Message-ID: <20190824191438.GE16308@X250.getinternet.no>
References: <20190820055438.43469-1-hui.song_1@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190820055438.43469-1-hui.song_1@nxp.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 20, 2019 at 01:54:38PM +0800, Hui Song wrote:
> From: Song Hui <hui.song_1@nxp.com>
> 
> add ls1088a gpio specify compatible.
> 
> Signed-off-by: Song Hui <hui.song_1@nxp.com>

I updated the patch subject as below, and applied the patch.

  arm64: dts: ls1088a: update gpio compatible

Shawn

> ---
> Changes in v4:
> 	- update the patch description.
> Changes in v3:
> 	- delete the attribute of little-endian.
> Changes in v2:
> 	- update the subject.
>  
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> index dfbead4..ff669c8 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> @@ -269,7 +269,7 @@
>  		};
>  
>  		gpio0: gpio@2300000 {
> -			compatible = "fsl,qoriq-gpio";
> +			compatible = "fsl,ls1088a-gpio", "fsl,qoriq-gpio";
>  			reg = <0x0 0x2300000 0x0 0x10000>;
>  			interrupts = <0 36 IRQ_TYPE_LEVEL_HIGH>;
>  			little-endian;
> @@ -280,7 +280,7 @@
>  		};
>  
>  		gpio1: gpio@2310000 {
> -			compatible = "fsl,qoriq-gpio";
> +			compatible = "fsl,ls1088a-gpio", "fsl,qoriq-gpio";
>  			reg = <0x0 0x2310000 0x0 0x10000>;
>  			interrupts = <0 36 IRQ_TYPE_LEVEL_HIGH>;
>  			little-endian;
> @@ -291,7 +291,7 @@
>  		};
>  
>  		gpio2: gpio@2320000 {
> -			compatible = "fsl,qoriq-gpio";
> +			compatible = "fsl,ls1088a-gpio", "fsl,qoriq-gpio";
>  			reg = <0x0 0x2320000 0x0 0x10000>;
>  			interrupts = <0 37 IRQ_TYPE_LEVEL_HIGH>;
>  			little-endian;
> @@ -302,7 +302,7 @@
>  		};
>  
>  		gpio3: gpio@2330000 {
> -			compatible = "fsl,qoriq-gpio";
> +			compatible = "fsl,ls1088a-gpio", "fsl,qoriq-gpio";
>  			reg = <0x0 0x2330000 0x0 0x10000>;
>  			interrupts = <0 37 IRQ_TYPE_LEVEL_HIGH>;
>  			little-endian;
> -- 
> 2.9.5
> 
