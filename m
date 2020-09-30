Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9303327E00E
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Sep 2020 07:17:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725871AbgI3FRE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Sep 2020 01:17:04 -0400
Received: from muru.com ([72.249.23.125]:45690 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725320AbgI3FRE (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 30 Sep 2020 01:17:04 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 783E380BF;
        Wed, 30 Sep 2020 05:17:05 +0000 (UTC)
Date:   Wed, 30 Sep 2020 08:16:59 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Drew Fustini <drew@beagleboard.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>,
        Trent Piepho <tpiepho@gmail.com>
Subject: Re: [PATCH] pinctrl: single: check if #pinctrl-cells exceeds 3
Message-ID: <20200930051659.GO9471@atomide.com>
References: <20200913210825.2022552-1-drew@beagleboard.org>
 <CACRpkdZXu9g_Rq7707-6hXqPVfbxPBcrnR8KwLm+zOgS_EabAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZXu9g_Rq7707-6hXqPVfbxPBcrnR8KwLm+zOgS_EabAQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

* Linus Walleij <linus.walleij@linaro.org> [200929 12:51]:
> On Sun, Sep 13, 2020 at 11:17 PM Drew Fustini <drew@beagleboard.org> wrote:
> 
> > The property #pinctrl-cells can either be 2 or 3.  There is currently
> > only a check to make sure that #pinctrl-cells is 2 or greater.  This
> > patch adds a check to make sure it is not greater than 3.
> >
> > Fixes: a13395418888 ("pinctrl: single: parse #pinctrl-cells = 2")
> > Reported-by: Trent Piepho <tpiepho@gmail.com>
> > Link: https://lore.kernel.org/linux-omap/3139716.CMS8C0sQ7x@zen.local/
> > Signed-off-by: Drew Fustini <drew@beagleboard.org>
> 
> Tony, does this and the other patch look good to you?

Hmm well the description looks a bit confusing, #pinctrl-cells can
also be 1 that's the default. Might be worth clarifying that part.

Regards,

Tony
