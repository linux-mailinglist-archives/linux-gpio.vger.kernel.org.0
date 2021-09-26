Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57C1C418AE6
	for <lists+linux-gpio@lfdr.de>; Sun, 26 Sep 2021 22:12:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229961AbhIZUNp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 26 Sep 2021 16:13:45 -0400
Received: from gloria.sntech.de ([185.11.138.130]:33902 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229894AbhIZUNp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 26 Sep 2021 16:13:45 -0400
Received: from user91-192-32-221.grape.cz ([91.192.32.221] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1mUaVH-0007k7-1H; Sun, 26 Sep 2021 22:12:03 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     Jianqun Xu <jay.xu@rock-chips.com>,
        linux-rockchip@lists.infradead.org
Cc:     linus.walleij@linaro.org, brgl@bgdev.pl,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Urja Rannikko <urjaman@gmail.com>
Subject: Re: 5.15-rc2 panics on boot on RK3288 veyron speedy, seems related to rockchip pinctrl / gpio split
Date:   Sun, 26 Sep 2021 22:11:59 +0200
Message-ID: <1870262.PYKUYFuaPT@phil>
In-Reply-To: <CAPCnQJm8ABVsv9uXM2iJ59-DCP1Y65i5zf+pM3yQ0Na8Xfra7Q@mail.gmail.com>
References: <CAPCnQJm8ABVsv9uXM2iJ59-DCP1Y65i5zf+pM3yQ0Na8Xfra7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

Am Sonntag, 26. September 2021, 13:57:33 CEST schrieb Urja Rannikko:
> A boot log of this is attached. I can say that this happens on
> 5.15-rc2 but not on 5.14.7.
> 
> Based on the log and some reading of the code my diagnosis is that
> rockchip_pinctrl_probe (via rockchip_pinctrl_register and after that
> the pinctrl core register calls) ends up trying to apply the
> configuration and accesses a null bank->gpio_chip (i think at
> drivers/pinctrl/pinctrl-rockchip.c:2139)
> before the gpio is "populated" / probed a couple of lines later in
> rockchip_pinctrl_probe (line 2710 onwards).
> 
> What I don't know is how this is supposed to work and/or how to
> properly fix it, so that's why I'm sending this bug report instead.
> 
> I'm sending this to the people who last touched the rockchip pinctrl
> (and gpio), because that's where this log points me to.

See
https://lore.kernel.org/all/20210913224926.1260726-1-heiko@sntech.de/

Heiko


