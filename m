Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B8FE2F0FA2
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Jan 2021 11:04:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728593AbhAKKEE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Jan 2021 05:04:04 -0500
Received: from muru.com ([72.249.23.125]:42728 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728527AbhAKKEE (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 11 Jan 2021 05:04:04 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 6516C80BB;
        Mon, 11 Jan 2021 10:03:22 +0000 (UTC)
Date:   Mon, 11 Jan 2021 12:03:18 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Drew Fustini <drew@beagleboard.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Pantelis Antoniou <pantelis.antoniou@linaro.org>,
        Pantelis Antoniou <pantelis.antoniou@gmail.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>
Subject: Re: [RFC PATCH v2] pinctrl: add helper to expose pinctrl state in
 debugfs
Message-ID: <X/wiZjioLqcTYVfj@atomide.com>
References: <20201218045134.4158709-1-drew@beagleboard.org>
 <CAHp75Vfwb+f3k2+mAj+jB=XsKFX-hCxx61A_PCmwz6y-YKHMcg@mail.gmail.com>
 <20201224203603.GA59600@x1>
 <CACRpkdb9RnGJbct+D-88JPDSbaVp1XS8vjhhHYosy20EPkLjaw@mail.gmail.com>
 <20210109025527.GA2918377@x1>
 <CACRpkdaOfU=OLp5D-EXK2oU9bScLZ-QjLdCSrewiSBa0SRRNwg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdaOfU=OLp5D-EXK2oU9bScLZ-QjLdCSrewiSBa0SRRNwg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

* Linus Walleij <linus.walleij@linaro.org> [210109 21:14]:
> On Sat, Jan 9, 2021 at 3:55 AM Drew Fustini <drew@beagleboard.org> wrote:
> 
> > I discussed my use case and this patch on #armlinux earlier this week
> > and Alexandre Belloni suggested looking at the pinmux-pins debugfs file.
> 
> This sounds reasonable.
> 
> > This made me think that a possible solution could be to define a store
> > function for pinmux-pins to handle something like "<pin#> <function#>".
> > I believe the ability to activate a pin function (or pin group) from
> > userspace would satisfy our beagleboard.org use-case.
> >
> > Does that seem like a reasonable approach?
> 
> This sounds like a good approach.

Makes sense to me too.

We may want to make it into a proper sysfs interface eventually to not
require debugfs be enabled in .config. But that's another set of patches,
certainly makes sense to first enable it for debugfs.

Regards,

Tony
