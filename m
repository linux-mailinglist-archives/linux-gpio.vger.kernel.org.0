Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F7C32F8351
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Jan 2021 19:09:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728155AbhAOSJZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Jan 2021 13:09:25 -0500
Received: from mx.blih.net ([212.83.155.74]:46812 "EHLO mx.blih.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725818AbhAOSJZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 15 Jan 2021 13:09:25 -0500
X-Greylist: delayed 400 seconds by postgrey-1.27 at vger.kernel.org; Fri, 15 Jan 2021 13:09:23 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bidouilliste.com;
        s=mx; t=1610733721;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/ukk1KmMKOjY989GVPIe8alQEeaLXXaWWupQX1f4jk4=;
        b=fI90d3/3h1q91CxwjnZxFLdnBD8nAaoOfyiAg+keL20VrXYOgJ24HaPHb2lrecBjOqU9pT
        OqdDrnBC2O6divMS/3ZjgATR9MnlTQ0uLYpFSj3jwYz3ky0lpa4zsqfN79jeImfHz/0aF+
        /3oA5rXvBDodNhSbCJaanO7u0ClqEL8=
Received: from skull.home.blih.net (lfbn-idf2-1-745-114.w86-247.abo.wanadoo.fr [86.247.192.114])
        by mx.blih.net (OpenSMTPD) with ESMTPSA id e912b7b2 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
        Fri, 15 Jan 2021 18:02:01 +0000 (UTC)
Date:   Fri, 15 Jan 2021 19:02:01 +0100
From:   Emmanuel Vadot <manu@bidouilliste.com>
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        devicetree@vger.kernel.org, bcousson@baylibre.com,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Subject: Re: [PATCH v4 2/2] ARM: dts: am33xx-l4: change #pinctrl-cells from
 1 to 2
Message-Id: <20210115190201.9273b637a7f967e7e55bc740@bidouilliste.com>
In-Reply-To: <20200701013320.130441-3-drew@beagleboard.org>
References: <20200701013320.130441-1-drew@beagleboard.org>
        <20200701013320.130441-3-drew@beagleboard.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; amd64-portbld-freebsd13.0)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


 Hello Drew,

On Wed,  1 Jul 2020 03:33:20 +0200
Drew Fustini <drew@beagleboard.org> wrote:

> Increase #pinctrl-cells to 2 so that mux and conf be kept separate. This
> requires the AM33XX_PADCONF macro in omap.h to also be modified to keep pin
> conf and pin mux values separate.
> 
> Signed-off-by: Drew Fustini <drew@beagleboard.org>
> ---
>  arch/arm/boot/dts/am33xx-l4.dtsi   | 2 +-
>  include/dt-bindings/pinctrl/omap.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
> index a9cbefc80c0c..3141590e5889 100644
> --- a/arch/arm/boot/dts/am33xx-l4.dtsi
> +++ b/arch/arm/boot/dts/am33xx-l4.dtsi
> @@ -278,7 +278,7 @@ scm: scm@0 {
>  				am33xx_pinmux: pinmux@800 {
>  					compatible = "pinctrl-single";
>  					reg = <0x800 0x238>;
> -					#pinctrl-cells = <1>;
> +					#pinctrl-cells = <2>;
>  					pinctrl-single,register-width = <32>;
>  					pinctrl-single,function-mask = <0x7f>;
>  				};
> diff --git a/include/dt-bindings/pinctrl/omap.h b/include/dt-bindings/pinctrl/omap.h
> index 625718042413..2d2a8c737822 100644
> --- a/include/dt-bindings/pinctrl/omap.h
> +++ b/include/dt-bindings/pinctrl/omap.h
> @@ -65,7 +65,7 @@
>  #define DM814X_IOPAD(pa, val)		OMAP_IOPAD_OFFSET((pa), 0x0800) (val)
>  #define DM816X_IOPAD(pa, val)		OMAP_IOPAD_OFFSET((pa), 0x0800) (val)
>  #define AM33XX_IOPAD(pa, val)		OMAP_IOPAD_OFFSET((pa), 0x0800) (val)
> -#define AM33XX_PADCONF(pa, dir, mux)	OMAP_IOPAD_OFFSET((pa), 0x0800) ((dir) | (mux))
> +#define AM33XX_PADCONF(pa, conf, mux)	OMAP_IOPAD_OFFSET((pa), 0x0800) (conf) (mux)
>  
>  /*
>   * Macros to allow using the offset from the padconf physical address
> -- 
> 2.25.1

 Based on the bindings doc a value of 2 is only acceptable if one uses
pinctrl-single,bits but all the am33xx pins still uses
pinctrl-single,pins.
 I noticed this because this breaks FreeBSD when I tried with 5.9 dts.

-- 
Emmanuel Vadot <manu@bidouilliste.com> <manu@freebsd.org>
