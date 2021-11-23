Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A11E3459F11
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Nov 2021 10:15:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234064AbhKWJSv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Nov 2021 04:18:51 -0500
Received: from muru.com ([72.249.23.125]:59266 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230306AbhKWJSv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 23 Nov 2021 04:18:51 -0500
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 7C1DE80F5;
        Tue, 23 Nov 2021 09:16:21 +0000 (UTC)
Date:   Tue, 23 Nov 2021 11:15:41 +0200
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
Message-ID: <YZyxPdBYl/yWYyoT@atomide.com>
References: <20211118132152.15722-1-zajec5@gmail.com>
 <20211118132152.15722-3-zajec5@gmail.com>
 <YZyahbYwMFz7baTu@atomide.com>
 <2fb0593a-208f-a732-843b-b6723633e208@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2fb0593a-208f-a732-843b-b6723633e208@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

* Rafał Miłecki <zajec5@gmail.com> [211123 07:56]:
> Does it mean above "reg" usages are all incorrect and binding "reg" in
> such way is deprecated? This is something totally new to me, can you
> confirm that, please?

Here you have a device with multiple control register instances at
various register offsets. Using index here makes as much sense as
the old interrupt number defines we used to have but got rid of.

Please don't use an index to address them. Index makes sense when
there is no real offset to use, like a SPI chip select, or a bit
offset inside the register like a GPIO instance bit.

Regards,

Tony
