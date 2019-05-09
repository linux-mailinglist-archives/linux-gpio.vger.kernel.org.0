Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C82F18968
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2019 14:01:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726511AbfEIMBg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 May 2019 08:01:36 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:48922 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726546AbfEIMBg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 May 2019 08:01:36 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 89A6A25AD66;
        Thu,  9 May 2019 22:01:34 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 896129403F2; Thu,  9 May 2019 14:01:32 +0200 (CEST)
Date:   Thu, 9 May 2019 14:01:32 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Cao Van Dong <cv-dong@jinso.co.jp>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 0/4] sh-pfc: r8a7795/6/65: Add TPU pins, groups and
 functions
Message-ID: <20190509120126.mhx72pg77djbpqml@verge.net.au>
References: <20190508134012.16002-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190508134012.16002-1-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 08, 2019 at 03:40:08PM +0200, Geert Uytterhoeven wrote:
> 	Hi Linus,
> 
> This patch series adds pins, groups and functions for the 16-Bit Timer
> Pulse Unit (TPU) outputs on the R-Car H3/M3-W/M3-N and RZ/G2M SoCs.
> 
> This has been tested on the Salvator-XS development board with R-Car
> M3-N.  As the TPU parts of the R-Car H3/M3-W and RZ/G2M SoCs are very
> similar, I expect this to work on those SoCs, too.
> 
> Changes compared to v1:
>   - Update .common[] array sizes in pfc-r8a7796.c.
> 
> I intend to queue this in sh-pfc-for-v5.3.
> 
> Test procedure:
>   - Apply Cao Van Dong's series "[PATCH v2 0/5] Add TPU support for R-Car
>     H3/M3-W/M3-N"
>     (https://lore.kernel.org/linux-renesas-soc/1556155517-5054-1-git-send-email-cv-dong@jinso.co.jp/),
>   - Make sure switches SW31-[1-4] are switched off,
>   - Enable TPU and pin control in DTS:
> 
> 	--- a/arch/arm64/boot/dts/renesas/salvator-xs.dtsi
> 	+++ b/arch/arm64/boot/dts/renesas/salvator-xs.dtsi
> 	@@ -27,3 +27,18 @@
> 			clock-names = "xin";
> 		};
> 	 };
> 	+
> 	+&tpu {
> 	+       // SW31-[1-4] OFF
> 	+       pinctrl-0 = <&tpu_pins>;
> 	+       pinctrl-names = "default";
> 	+
> 	+       status = "okay";
> 	+};
> 	+
> 	+&pfc {
> 	+       tpu_pins: tpu {
> 	+               groups = "tpu_to2", "tpu_to3";
> 	+               function = "tpu";
> 	+       };
> 	+};
> 
>   - Exercise userspace PWM control for pwm[23] of
>     /sys/class/pwm/pwmchip1/,
>   - Inspect PWM signals on the input side of SW31-[12] using an
>     oscilloscope,
>   - Disable TPU and pin control in DTS, and restore SW31 switch
>     settings.
> 
> Thanks!
> 
> Geert Uytterhoeven (4):
>   pinctrl: sh-pfc: r8a7795-es1: Add TPU pins, groups and functions
>   pinctrl: sh-pfc: r8a7795: Add TPU pins, groups and functions
>   pinctrl: sh-pfc: r8a7796: Add TPU pins, groups and functions
>   pinctrl: sh-pfc: r8a77965: Add TPU pins, groups and functions

Thanks Geert,

for all patches:

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

