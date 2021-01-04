Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D19912E91C3
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Jan 2021 09:32:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726303AbhADIcc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Jan 2021 03:32:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:36192 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726258AbhADIcb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 4 Jan 2021 03:32:31 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C3C9A20798;
        Mon,  4 Jan 2021 08:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609749110;
        bh=/l4LNgcZQuQKp8LjOcoiZ+3D5i2u+KxinFDst/ZT+Xw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bH9nLgUy6rQaKDLX1sw1beUf9Aq83lpTkkF5ADT9W2qKlL12x7qcISW2nja3aqI1Y
         WzpG1HIteKGSrWtfL4/MJWWFZPBQZigPtLn7owPGJgh1SKwM/Z0NWd4326bSyG2UVp
         cbtkAJ/BJ+ksAQAWS715qAMvFPntnXind4CHexEHnKoDA38+VGZGUq5N3KFvPcQKRJ
         umggJKKxXJrxQebYyCNBK4D1yb/2Cva4LLilwnlwEgsxwCT0/1TdV5UeDY3sdvXAvG
         TRTNprpXnycMUQpKcKL+L1jkCD7tuLfQvRYX6/z0/rd93m1CzYF32NtvmESwNcScE6
         VCK/MmB55ljqQ==
Received: by wens.tw (Postfix, from userid 1000)
        id A190F5F823; Mon,  4 Jan 2021 16:31:48 +0800 (CST)
Date:   Mon, 4 Jan 2021 16:31:48 +0800
From:   Chen-Yu Tsai <wens@kernel.org>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Andre Przywara <andre.przywara@arm.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [linux-sunxi] [PATCH v2 0/4] Allwinner H6 RSB support
Message-ID: <X/LSdICpXl6vT65y@wens.csie.org>
References: <20210103100007.32867-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210103100007.32867-1-samuel@sholland.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Sun, Jan 03, 2021 at 04:00:03AM -0600, Samuel Holland wrote:
> The Allwinner H6 SoC contains an RSB controller. It is almost completely
> undocumented, so it was missed when doing the initial SoC bringup.
> 
> This series adds the clock/reset, pin configuration, and device tree
> node needed to use the RSB controller. Since RSB is faster, simpler, and
> generally more reliable than the I2C controller IP in the SoC, switch to
> using it where possible.
> 
> This was tested on an Orange Pi 3 and a Pine H64 model B. This series
> does not switch the Pine H64 to use RSB, as doing so would prevent
> accessing the external RTC that shares the I2C bus.
> 
> Changes v1->v2:
>   - Put the new values at the end of the DT binding headers
> 
> Samuel Holland (4):
>   clk: sunxi-ng: h6-r: Add R_APB2_RSB clock and reset
>   pinctrl: sunxi: h6-r: Add s_rsb pin functions
>   arm64: dts: allwinner: h6: Add RSB controller node
>   arm64: dts: allwinner: h6: Use RSB for AXP805 PMIC connection

I queued up patches 1, 3, and 4 locally for v5.12. Obviously this won't
work unless the pinctrl patch is also queued up, so they won't be pushed
out until that happens.

Regarding patch 3, I replaced the clock and reset macros with raw
numbers to get rid of cross-tree dependencies. The following fix
will be posted for v5.12 later on during its RC cycle.

------------------------ >8 ------------------------

commit 0b4781666adc5e19c4d4fb4a2bff33883181cc39
Author: Chen-Yu Tsai <wens@csie.org>
Date:   Mon Jan 4 16:19:17 2021 +0800

    arm64: dts: allwinner: h6: Switch to macros for RSB clock/reset indices
    
    The macros for the clock and reset indices for the RSB hardware block
    were replaced with raw numbers when the RSB controller node was added.
    This was done to avoid cross-tree dependencies.
    
    Now that both the clk and DT changes have been merged, we can switch
    back to using the macros.
    
    Signed-off-by: Chen-Yu Tsai <wens@csie.org>

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
index d897697849d6..b043beea8e6e 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
@@ -988,9 +988,9 @@ r_rsb: rsb@7083000 {
 			compatible = "allwinner,sun8i-a23-rsb";
 			reg = <0x07083000 0x400>;
 			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&r_ccu 13>;
+			clocks = <&r_ccu CLK_R_APB2_RSB>;
 			clock-frequency = <3000000>;
-			resets = <&r_ccu 7>;
+			resets = <&r_ccu RST_R_APB2_RSB>;
 			pinctrl-names = "default";
 			pinctrl-0 = <&r_rsb_pins>;
 			status = "disabled";
------------------------ >8 ------------------------

> 
>  .../dts/allwinner/sun50i-h6-beelink-gs1.dts   | 38 +++++++++----------
>  .../dts/allwinner/sun50i-h6-orangepi-3.dts    | 14 +++----
>  .../dts/allwinner/sun50i-h6-orangepi.dtsi     | 22 +++++------
>  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  | 19 ++++++++++
>  drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c        |  5 +++
>  drivers/clk/sunxi-ng/ccu-sun50i-h6-r.h        |  2 +-
>  drivers/pinctrl/sunxi/pinctrl-sun50i-h6-r.c   |  2 +
>  include/dt-bindings/clock/sun50i-h6-r-ccu.h   |  2 +
>  include/dt-bindings/reset/sun50i-h6-r-ccu.h   |  1 +
>  9 files changed, 67 insertions(+), 38 deletions(-)
> 
> -- 
> 2.26.2
> 
> -- 
> You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe@googlegroups.com.
> To view this discussion on the web, visit https://groups.google.com/d/msgid/linux-sunxi/20210103100007.32867-1-samuel%40sholland.org.
