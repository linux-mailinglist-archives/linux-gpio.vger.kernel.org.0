Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F5122DF711
	for <lists+linux-gpio@lfdr.de>; Sun, 20 Dec 2020 23:49:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726597AbgLTWsv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 20 Dec 2020 17:48:51 -0500
Received: from vps0.lunn.ch ([185.16.172.187]:35024 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726507AbgLTWsv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 20 Dec 2020 17:48:51 -0500
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
        (envelope-from <andrew@lunn.ch>)
        id 1kr7Ui-00D2SS-MH; Sun, 20 Dec 2020 23:48:04 +0100
Date:   Sun, 20 Dec 2020 23:48:04 +0100
From:   Andrew Lunn <andrew@lunn.ch>
To:     Lars Povlsen <lars.povlsen@microchip.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        linux-gpio@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v10 3/3] arm64: dts: sparx5: Add SGPIO devices
Message-ID: <20201220224804.GA3107610@lunn.ch>
References: <20201113145151.68900-1-lars.povlsen@microchip.com>
 <20201113145151.68900-4-lars.povlsen@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201113145151.68900-4-lars.povlsen@microchip.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 13, 2020 at 03:51:51PM +0100, Lars Povlsen wrote:
> +		led@8 {
> +			label = "eth12:green";
> +			gpios = <&sgpio_out0 12 0 GPIO_ACTIVE_HIGH>;
> +			default-state = "off";
> +		};
> +		led@9 {
> +			label = "eth12:yellow";
> +			gpios = <&sgpio_out0 12 1 GPIO_ACTIVE_HIGH>;
> +			default-state = "off";
> +		};

Hi Lars

I did not see these patches earlier, but i've been looking at the
switch driver patches recently, so went digging.

Can the Ethernet switch itself control these LEDs for indicating
things like packet receive/transmit, link state, and link speed? Or
are they purely software controlled?

    Thanks
	Andrew
