Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63E154101F1
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Sep 2021 02:00:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241454AbhIRAB6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Sep 2021 20:01:58 -0400
Received: from gloria.sntech.de ([185.11.138.130]:59322 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241321AbhIRAB6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 Sep 2021 20:01:58 -0400
Received: from ip5f5a6e92.dynamic.kabel-deutschland.de ([95.90.110.146] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1mRNmN-0000hh-VN; Sat, 18 Sep 2021 02:00:28 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jianqun Xu <jay.xu@rock-chips.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/4] gpio/rockchip: fetch deferred output settings on probe
Date:   Sat, 18 Sep 2021 02:00:27 +0200
Message-ID: <1992229.jx4eJSTThl@diego>
In-Reply-To: <CACRpkda2Hc6E27LK=vH_qKkTayG3qP=BGdqBKyLR2dMhekyWTw@mail.gmail.com>
References: <20210913224926.1260726-1-heiko@sntech.de> <20210913224926.1260726-5-heiko@sntech.de> <CACRpkda2Hc6E27LK=vH_qKkTayG3qP=BGdqBKyLR2dMhekyWTw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

Am Samstag, 18. September 2021, 01:38:08 CEST schrieb Linus Walleij:
> On Tue, Sep 14, 2021 at 12:49 AM Heiko Stuebner <heiko@sntech.de> wrote:
> 
> > Fetch the output settings the pinctrl driver may have created
> > for pinctrl hogs and set the relevant pins as requested.
> >
> > Fixes: 9ce9a02039de ("pinctrl/rockchip: drop the gpio related codes")
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> 
> Since this patch depends on patch 4/4 I applied this to the pinctrl
> tree as well.
> 
> I still think this looks a bit kludgy but can't think of anything better
> right now and we need a fix for the problem so this goes in.
> 
> But we need to think of something better,

I'm all ears :-) . And yes I do agree with you that this is not very
elegant right now.

The issue is that the pinconf part for PIN_CONFIG_OUTPUT is actually
using the gpio controller to realize this setting. So when this ends up
in a pinctrl-hog, stuff explodes while probing the first pinctrl part.

I guess one way would be to somehow only do the pinctrl-hogs
_after_ all parts have probed.


Thinking about this, the component framework may be one option?
And then adding a pinctr-register / init+enable variant where the
pinctrl hogs can be aquired separately, not as part of pinctrl_enable?

Or maybe I'm thinking way too complex and a way easier solution
is around the corner ;-) .


Heiko


