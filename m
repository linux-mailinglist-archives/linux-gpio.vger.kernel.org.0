Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97FDB35B243
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Apr 2021 09:55:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230498AbhDKHzg convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Sun, 11 Apr 2021 03:55:36 -0400
Received: from gloria.sntech.de ([185.11.138.130]:40232 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229792AbhDKHzf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 11 Apr 2021 03:55:35 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1lVUw3-0003jc-Rs; Sun, 11 Apr 2021 09:55:11 +0200
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
Date:   Sun, 11 Apr 2021 09:55:11 +0200
Message-ID: <6488150.4vTCxPXJkl@diego>
In-Reply-To: <CAMdYzYp80DdEp8LM7YkEUqmu-7WwhyTvFU4QAfGu9uimsE6rYg@mail.gmail.com>
References: <20210304013342.1106361-1-jay.xu@rock-chips.com> <CACRpkdZeZuHe9kFywrdQxcNMfAcBCJVAhJjfyD6ahLinT0hvmg@mail.gmail.com> <CAMdYzYp80DdEp8LM7YkEUqmu-7WwhyTvFU4QAfGu9uimsE6rYg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="iso-8859-1"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Peter,

Am Sonntag, 11. April 2021, 05:40:05 CEST schrieb Peter Geis:
> On Sat, Apr 10, 2021 at 8:40 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > On Sat, Apr 10, 2021 at 11:10 PM Heiko Stübner <heiko@sntech.de> wrote:
> > > Am Samstag, 10. April 2021, 20:30:52 CEST schrieb Peter Geis:
> > > > Good Afternoon,
> > > >
> > > > I'm currently working on the rk3566 early bringup support in mainline
> > > > and encountered an issue with this patch set.
> > > > Unfortunately in the rk3568/rk3566 the gpio registers switched to the
> > > > (16 bits write enable / 16 bits config) register format that other
> > > > rockchip registers use.
> > > > This differs from previous chips where all 32 bits were used for gpio
> > > > configuration.
> > > > The patch fails to account for this, which causes all gpios to fail to function.
> > > >
> > > > For clarity, this only affects GPIO_SWPORT_DR and GPIO_SWPORT_DDR.
> > > >
> > > > I'm currently working on a patch to fix this issue, but I know that
> > > > you are planning on breaking out the gpio functions into a separate
> > > > driver and wanted to make you aware of this immediately.
> > >
> > > just pointing to Jianqun's series providing the gpio controller support:
> > >
> > > https://lore.kernel.org/r/20210324064704.950104-1-jay.xu@rock-chips.com
> > >
> > > which introduces the necessary writemask-handling but seems to need an
> > > update, judging by Ezequiel's reply to it.
> >
> > Does this mean that if we get a speedy and nice looking respin of the
> > GPIO series we probably got this problem covered?
> >
> > The merge window is getting close but it would be nice to get this in.
> 
> Thank you for the responses!
> With a bit of effort and a quick build fix, I've successfully rebased
> the gpio patch set to the latest linux-next.
> I now have functional gpio control on the rk3566.
> I haven't tested them on older devices yet though.
> 
> With your blessing I can send in the rebased patches in the morning,
> unless Jianqun wants to handle it.

I don't know which blessing you need, but from my POV - please do that :-D
Especially as Jianqun already submitted where he wants to go with that
and you just rebased it there shouldn't be any opposing directions here.

I can give it a test on other platforms when you submit if needed.


Heiko

> 
> >
> > Yours,
> > Linus Walleij
> 




