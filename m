Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D68B275202
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Sep 2020 08:58:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726557AbgIWG6a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Sep 2020 02:58:30 -0400
Received: from muru.com ([72.249.23.125]:45156 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726179AbgIWG6a (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 23 Sep 2020 02:58:30 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 8086B80A0;
        Wed, 23 Sep 2020 06:58:31 +0000 (UTC)
Date:   Wed, 23 Sep 2020 09:59:25 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>,
        Trent Piepho <tpiepho@gmail.com>, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: document pinctrl-single,pins when
 #pinctrl-cells = 2
Message-ID: <20200923065925.GS7101@atomide.com>
References: <20200914104352.2165818-1-drew@beagleboard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200914104352.2165818-1-drew@beagleboard.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

* Drew Fustini <drew@beagleboard.org> [200914 10:44]:
> Document the values in pinctrl-single,pins when #pinctrl-cells = <2>
> 
> Fixes: 27c90e5e48d0 ("ARM: dts: am33xx-l4: change #pinctrl-cells from 1 to 2")
> Reported-by: Trent Piepho <tpiepho@gmail.com>
> Link: https://lore.kernel.org/linux-omap/3139716.CMS8C0sQ7x@zen.local/
> Signed-off-by: Drew Fustini <drew@beagleboard.org>

Acked-by: Tony Lindgren <tony@atomide.com>

> ---
>  .../bindings/pinctrl/pinctrl-single.txt       | 20 ++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-single.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-single.txt
> index ba428d345a56..ef560afdd52e 100644
> --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-single.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-single.txt
> @@ -96,16 +96,22 @@ pinctrl-single,bit-per-mux is set), and uses the common pinctrl bindings as
>  specified in the pinctrl-bindings.txt document in this directory.
>  
>  The pin configuration nodes for pinctrl-single are specified as pinctrl
> -register offset and value pairs using pinctrl-single,pins. Only the bits
> -specified in pinctrl-single,function-mask are updated. For example, setting
> -a pin for a device could be done with:
> +register offset and values using pinctrl-single,pins. Only the bits specified
> +in pinctrl-single,function-mask are updated.
> +
> +When #pinctrl-cells = 1, then setting a pin for a device could be done with:
>  
>  	pinctrl-single,pins = <0xdc 0x118>;
>  
> -Where 0xdc is the offset from the pinctrl register base address for the
> -device pinctrl register, and 0x118 contains the desired value of the
> -pinctrl register. See the device example and static board pins example
> -below for more information.
> +Where 0xdc is the offset from the pinctrl register base address for the device
> +pinctrl register, and 0x118 contains the desired value of the pinctrl register.
> +
> +When #pinctrl-cells = 2, then setting a pin for a device could be done with:
> +
> +	pinctrl-single,pins = <0xdc 0x30 0x07>;
> +
> +Where 0x30 is the pin configuration value and 0x07 is the pin mux mode value.
> +See the device example and static board pins example below for more information.
>  
>  In case when one register changes more than one pin's mux the
>  pinctrl-single,bits need to be used which takes three parameters:
> -- 
> 2.25.1
> 
