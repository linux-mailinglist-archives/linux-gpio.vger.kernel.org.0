Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5EAC35B092
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Apr 2021 23:10:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234874AbhDJVLB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 10 Apr 2021 17:11:01 -0400
Received: from gloria.sntech.de ([185.11.138.130]:38768 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232659AbhDJVLA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 10 Apr 2021 17:11:00 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1lVKsI-0001bv-Bg; Sat, 10 Apr 2021 23:10:38 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Jianqun Xu <jay.xu@rock-chips.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>
Subject: Re: [PATCH v4] pinctrl: rockchip: add support for rk3568
Date:   Sat, 10 Apr 2021 23:10:37 +0200
Message-ID: <3262311.AJdgDx1Vlc@diego>
In-Reply-To: <CAMdYzYqk3k0UqCyFwB+W1tKKKTg39Mx0Vdsrj+eeC58nARaumQ@mail.gmail.com>
References: <20210304013342.1106361-1-jay.xu@rock-chips.com> <CACRpkdYYpgFWH9pVOT=o7unWXRqVeHtvsJgbByNGZ170CZ_FXA@mail.gmail.com> <CAMdYzYqk3k0UqCyFwB+W1tKKKTg39Mx0Vdsrj+eeC58nARaumQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Peter,

Am Samstag, 10. April 2021, 20:30:52 CEST schrieb Peter Geis:
> Good Afternoon,
> 
> I'm currently working on the rk3566 early bringup support in mainline
> and encountered an issue with this patch set.
> Unfortunately in the rk3568/rk3566 the gpio registers switched to the
> (16 bits write enable / 16 bits config) register format that other
> rockchip registers use.
> This differs from previous chips where all 32 bits were used for gpio
> configuration.
> The patch fails to account for this, which causes all gpios to fail to function.
> 
> For clarity, this only affects GPIO_SWPORT_DR and GPIO_SWPORT_DDR.
> 
> I'm currently working on a patch to fix this issue, but I know that
> you are planning on breaking out the gpio functions into a separate
> driver and wanted to make you aware of this immediately.

just pointing to Jianqun's series providing the gpio controller support:

https://lore.kernel.org/r/20210324064704.950104-1-jay.xu@rock-chips.com

which introduces the necessary writemask-handling but seems to need an
update, judging by Ezequiel's reply to it.


Heiko


> Very Respectfully,
> Peter Geis
> 
> On Fri, Apr 9, 2021 at 8:38 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > On Fri, Apr 9, 2021 at 6:17 AM Ezequiel Garcia
> > <ezequiel@vanguardiasur.com.ar> wrote:
> >
> > > Seems we are missing the dt-bindings for the new compatible string
> > > "rockchip,rk3568-pinctrl". Is there a patch for it somewhere?
> >
> > Nope please send one :)
> >
> > Yours,
> > Linus Walleij
> >
> > _______________________________________________
> > Linux-rockchip mailing list
> > Linux-rockchip@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-rockchip
> 




