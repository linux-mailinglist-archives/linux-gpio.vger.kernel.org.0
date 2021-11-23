Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C525C459CD0
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Nov 2021 08:38:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234028AbhKWHl4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Nov 2021 02:41:56 -0500
Received: from muru.com ([72.249.23.125]:59222 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233737AbhKWHl4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 23 Nov 2021 02:41:56 -0500
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 6489480F5;
        Tue, 23 Nov 2021 07:39:26 +0000 (UTC)
Date:   Tue, 23 Nov 2021 09:38:45 +0200
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
Subject: Re: [PATCH 2/5] dt-bindings: pinctrl: brcm,ns-pinmux: extend example
Message-ID: <YZyahbYwMFz7baTu@atomide.com>
References: <20211118132152.15722-1-zajec5@gmail.com>
 <20211118132152.15722-3-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211118132152.15722-3-zajec5@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

200* Rafał Miłecki <zajec5@gmail.com> [211118 13:30]:
> @@ -83,6 +83,33 @@ examples:
>          reg = <0x1800c1c0 0x24>;
>          reg-names = "cru_gpio_control";
>  
> +        pins {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            pin@4 {
> +                reg = <4>;
> +                label = "i2c_scl";
> +            };
> +
> +            pin@5 {
> +                reg = <5>;
> +                label = "i2c_sda";
> +            };
> +        };

The reg property should indicate the hardware offset from the device base
address. The reg values above for 4 and 5 seem to be indexed instead :)
Please update to use real register offsets from the 0x1800c1c0 base
instead. If a reg offset + bit offset are needed, the #address-cells or
#pinctrl-cells can be used.

The main problem using an index is that you need to keep it in sync
between the dts and device driver. And if a new SoC variant adds an entry
between the registers, you end up having to renumber the index.

Regards,

Tony

