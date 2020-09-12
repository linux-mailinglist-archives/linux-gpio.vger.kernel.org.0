Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17726267A32
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Sep 2020 14:02:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725837AbgILMCZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 12 Sep 2020 08:02:25 -0400
Received: from gloria.sntech.de ([185.11.138.130]:41810 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725833AbgILMCZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 12 Sep 2020 08:02:25 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1kH4EY-0000A2-Tt; Sat, 12 Sep 2020 14:02:22 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     Jianqun Xu <jay.xu@rock-chips.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     David Wu <david.wu@rock-chips.com>,
        Kever Yang <kever.yang@rock-chips.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>
Subject: Re: [PATCH 0/2] pinctrl: rockchip: codingstyle for pinctrl-rockchip
Date:   Sat, 12 Sep 2020 14:02:22 +0200
Message-ID: <1646119.L9t6MPyLfv@diego>
In-Reply-To: <CACRpkdYGJsK4Ek8pDCeNMWt41dd2s--Lkxewh4Po4E-45UdwMg@mail.gmail.com>
References: <c4ec95a7-aaf1-2331-352f-2def319a1c7d@rock-chips.com> <20200117081358.5772-1-jay.xu@rock-chips.com> <CACRpkdYGJsK4Ek8pDCeNMWt41dd2s--Lkxewh4Po4E-45UdwMg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

Am Samstag, 12. September 2020, 13:27:44 CEST schrieb Linus Walleij:
> Jianqun, Heiko,
> 
> On Fri, Jan 17, 2020 at 9:14 AM Jianqun Xu <jay.xu@rock-chips.com> wrote:
> 
> > Do codingstyle for pinctrl-rockchip by spliting driver by SoC types.
> >
> > Convenienty for reviewing, the first patch only moving
> > pinctrl-rockchip.c from driver/pinctrl to driver/pinctrl/rockchip/ .
> >
> > Jianqun Xu (2):
> >   pinctrl: rockchip: new rockchip dir for pinctrl-rockchip
> >   pinctrl: rockchip: split rockchip pinctrl driver by SoC type
> 
> Why were these patches never applied? Is it my fault?

It's not your fault :-)

> I don't even have patch 2/2 in my mailbox, possibly it was
> too big!
> 
> Heiko if you're OK with this change can Jianqun just send a
> rebased version?

We agreed to split it into smaller chunks which I think is the 13-patch
series you mentioned elsewhere today. But I guess that fell through
the cracks in my review :-( .

So I guess we should do the current GKI thingy first to get that
module build and after that maybe Jianqun can find the time to rebase
the per-soc split on top of that.


Heiko


