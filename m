Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E04E3899CF
	for <lists+linux-gpio@lfdr.de>; Thu, 20 May 2021 01:27:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229808AbhESX21 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 May 2021 19:28:27 -0400
Received: from gloria.sntech.de ([185.11.138.130]:40218 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229518AbhESX2Z (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 19 May 2021 19:28:25 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1ljVae-0003Mu-T8; Thu, 20 May 2021 01:27:00 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jianqun Xu <jay.xu@rock-chips.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 6/7] gpio/rockchip: always enable clock for gpio controller
Date:   Thu, 20 May 2021 01:27:00 +0200
Message-ID: <3790260.ZaRXLXkqSa@diego>
In-Reply-To: <CACRpkdbRONGkiukppCROFFLFkCz+vDJFj_OGC=8MSR4JpZaXrQ@mail.gmail.com>
References: <20210510063602.505829-1-jay.xu@rock-chips.com> <7622756.lOV4Wx5bFT@phil> <CACRpkdbRONGkiukppCROFFLFkCz+vDJFj_OGC=8MSR4JpZaXrQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am Donnerstag, 20. Mai 2021, 01:18:24 CEST schrieb Linus Walleij:
> On Thu, May 13, 2021 at 10:49 PM Heiko Stuebner <heiko@sntech.de> wrote:
> > Am Montag, 10. Mai 2021, 08:37:22 CEST schrieb Jianqun Xu:
> > > Since gate and ungate pclk of gpio has very litte benifit for system
> > > power consumption, just keep it always ungate.
> > >
> > > Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
> >
> > Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> >
> > I do agree with the reasoning and as an added benefit, we
> > also drop all the clk_enable calls that don't do proper error
> > handling right now ;-)
> 
> Heiko what is your general stance on the rest of the patches?
> I was thinking I should merge them soon if you're not
> against.

I'm definitly in favor of them :-)

I haven't seen any major issues, but sadly also haven't found the
time to really dig deeper into the other patches.

One thing pinctrl/gpio maintainer will need to check is if the

+#include "../pinctrl/core.h"
+#include "../pinctrl/pinctrl-rockchip.h"

(in patch 3)

is actually the right way to go.


Heiko


