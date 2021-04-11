Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D10F535B66F
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Apr 2021 19:55:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235430AbhDKRzf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 11 Apr 2021 13:55:35 -0400
Received: from gloria.sntech.de ([185.11.138.130]:42092 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233822AbhDKRze (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 11 Apr 2021 13:55:34 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1lVeIe-0005oy-5c; Sun, 11 Apr 2021 19:55:08 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     Peter Geis <pgwipeout@gmail.com>,
        Jianqun Xu <jay.xu@rock-chips.com>, huangtao@rock-chips.com,
        kever.yang@rock-chips.com, linus.walleij@linaro.org,
        Johan Jonker <jbx6244@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/7] gpio: separate gpio driver from pinctrl-rockchip driver
Date:   Sun, 11 Apr 2021 19:55:07 +0200
Message-ID: <3591437.LM0AJKV5NW@diego>
In-Reply-To: <5308a59c-29e9-75a4-2c9a-4aeb3d37bf6e@gmail.com>
References: <20210411133030.1663936-1-pgwipeout@gmail.com> <20210411133030.1663936-4-pgwipeout@gmail.com> <5308a59c-29e9-75a4-2c9a-4aeb3d37bf6e@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Johan,

Am Sonntag, 11. April 2021, 19:51:52 CEST schrieb Johan Jonker:
> Hi,
> 
> When I check "rockchip,gpio-bank" with YAML it turns out that
> rk3288-veyron-XXX has 'gpio-line-names' as 'extra' property.
> It is not defined in the "rockchip,pinctrl.txt" document, but in
> ~/.local/lib/python3.5/site-packages/dtschema/schemas/gpio/gpio.yaml
> 
> Where is that in use?
> In this driver or external?
> Can it be removed from mainline dts?

gpio-line-names gets defined in devicetree/bindings/gpio/gpio.txt
which isn't converted to yaml yet:

Optionally, a GPIO controller may have a "gpio-line-names" property. This is
an array of strings defining the names of the GPIO lines going out of the
GPIO controller.


So that property is perfectly fine where it is.

Heiko


> 
> Johan
> 
> /arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml: gpio7@ff7e0000:
> 'gpio-line-names' does not match any of the regexes: 'pinctrl-[0-9]+'
> 	From schema:
> /Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
> 
> On 4/11/21 3:30 PM, Peter Geis wrote:
> > From: Jianqun Xu <jay.xu@rock-chips.com>
> > 
> > Separate the gpio driver from the pinctrl driver.
> > 
> > Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
> > ---
> 




