Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30C8B924A9
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Aug 2019 15:20:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727352AbfHSNUY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Aug 2019 09:20:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:46088 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727301AbfHSNUY (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 19 Aug 2019 09:20:24 -0400
Received: from X250 (37.80-203-192.nextgentel.com [80.203.192.37])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2F98E20843;
        Mon, 19 Aug 2019 13:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566220823;
        bh=dE+SiJQE1Ga//QTRSzldLGnM5m2eIprsqb2ueqc8n1U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rBFMxF2Ck/Pj5wW+m4oFvA7SQKUmPliDghwewPJ6v5mVfIfd57IcjJcjOFI8FIH3b
         djdP4zDExqFoiBtoogN29KbJA6/bRo0XbGW/ZeNdMJsSHwHNoQrtTnF2mrwsE3apI3
         PWIpqyd0NPFHpl7Eqc25ZUo0PF8aCF/EPH2Eh/FQ=
Date:   Mon, 19 Aug 2019 15:20:06 +0200
From:   Shawn Guo <shawnguo@kernel.org>
To:     Hui Song <hui.song_1@nxp.com>
Cc:     Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: ls1088a: fix gpio node
Message-ID: <20190819132004.GJ5999@X250>
References: <20190815103016.23125-1-hui.song_1@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190815103016.23125-1-hui.song_1@nxp.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 15, 2019 at 06:30:16PM +0800, Hui Song wrote:
> From: Song Hui <hui.song_1@nxp.com>
> 
> Update the nodes to include little-endian

So the commit log needs an update as well?

Shawn

> property to be consistent with the hardware
> and add ls1088a gpio specify compatible.
> 
> Signed-off-by: Song Hui <hui.song_1@nxp.com>
> ---
> Changes in v3:
> 	- delete the attribute of little-endian.
> Changes in v2:
> 	- update the subject.
> 	
>  arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
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
