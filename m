Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BCA847125B
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Dec 2021 08:07:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229797AbhLKHHp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 11 Dec 2021 02:07:45 -0500
Received: from muru.com ([72.249.23.125]:37134 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229455AbhLKHHp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 11 Dec 2021 02:07:45 -0500
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 63829809F;
        Sat, 11 Dec 2021 07:08:26 +0000 (UTC)
Date:   Sat, 11 Dec 2021 09:07:42 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V3 2/2] dt-bindings: pinctrl: brcm,ns-pinmux: describe
 pins, groups & functions
Message-ID: <YbROPvoDXKCGHYti@atomide.com>
References: <20211210114222.26581-1-zajec5@gmail.com>
 <20211210114222.26581-3-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211210114222.26581-3-zajec5@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

* Rafał Miłecki <zajec5@gmail.com> [211210 11:43]:
> @@ -83,6 +97,28 @@ examples:
>          reg = <0x1800c1c0 0x24>;
>          reg-names = "cru_gpio_control";
>  
> +        pins {
> +            i2c_scl: i2c_scl {
> +                number = <4>;
> +            };
> +
> +            i2c_sda: i2c_sda {
> +                number = <5>;
> +            };
> +        };

Please don't add custom properties for something that can be done with
standard register based addressing using a hardware offset based reg
property. Your driver can easily translate it. Also, please don't use
custom node names, instead do:

pins {
	i2c_scl: pin@0x1234 {
		/* Any generic standard properties or numbers here please :)d */
	};
	...
};

I think I've already commented on the register addressing twice before..

Regards,

Tony
