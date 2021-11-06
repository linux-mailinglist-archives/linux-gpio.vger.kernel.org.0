Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0872446CFE
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Nov 2021 09:28:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231221AbhKFIbF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 6 Nov 2021 04:31:05 -0400
Received: from smtprelay0033.hostedemail.com ([216.40.44.33]:34580 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230426AbhKFIbE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 6 Nov 2021 04:31:04 -0400
Received: from omf03.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay03.hostedemail.com (Postfix) with ESMTP id 01D14837F24A;
        Sat,  6 Nov 2021 08:28:23 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf03.hostedemail.com (Postfix) with ESMTPA id EB6B013D96;
        Sat,  6 Nov 2021 08:28:18 +0000 (UTC)
Message-ID: <103d7321a2d18e44fb8c01483b1197766aff645a.camel@perches.com>
Subject: Re: [PATCH v1 14/19] pinctrl: st: Use temporary variable for struct
 device
From:   Joe Perches <joe@perches.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Jianqun Xu <jay.xu@rock-chips.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-rockchip@lists.infradead.org" 
        <linux-rockchip@lists.infradead.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Andy Shevchenko <andy@kernel.org>
Date:   Sat, 06 Nov 2021 01:28:17 -0700
In-Reply-To: <CAHp75Ve0Bv9VsWFFZxL9wYk=Z_Mm7nat-vf7g8HHTiROi7EY=Q@mail.gmail.com>
References: <20211105124242.27288-1-andriy.shevchenko@linux.intel.com>
         <20211105124242.27288-14-andriy.shevchenko@linux.intel.com>
         <4b3f1ee1179dd6d4b010cb110b38d26e7d91c19f.camel@perches.com>
         <CAHp75Ve0Bv9VsWFFZxL9wYk=Z_Mm7nat-vf7g8HHTiROi7EY=Q@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.43
X-Stat-Signature: h8rybhkjgkwct5m577thmm95p3sew5ni
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: EB6B013D96
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19DqiwzorEKDYikYui8SpA+cKLioisfSSU=
X-HE-Tag: 1636187298-402643
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, 2021-11-06 at 10:07 +0200, Andy Shevchenko wrote:
> On Saturday, November 6, 2021, Joe Perches <joe@perches.com> wrote:
> > On Fri, 2021-11-05 at 14:42 +0200, Andy Shevchenko wrote:
> > > Use temporary variable for struct device to make code neater.
> > []
> > > diff --git a/drivers/pinctrl/pinctrl-st.c b/drivers/pinctrl/pinctrl-st.c
> > []
> > > @@ -814,26 +814,25 @@ static int st_pctl_dt_node_to_map(struct
> > pinctrl_dev *pctldev,
> > >  {
> > >       struct st_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
> > >       const struct st_pctl_group *grp;
> > > +     struct device *dev = info->dev;
> > []
> > > -     new_map = devm_kcalloc(pctldev->dev,
> > > -                             map_num, sizeof(*new_map), GFP_KERNEL);
> > > +     new_map = devm_kcalloc(dev, map_num, sizeof(*new_map), GFP_KERNEL);
> > 
> > Are pctldev->dev and dev the same pointer?
> 
> Seems so.

OK.

> https://elixir.bootlin.com/linux/latest/source/drivers/pinctrl/core.c#L2015
> 
> > It seems they are not.
> 
> Can you elaborate, please?

From code shape, you assign dev to info->dev rather than pctldev->dev

I also believe this single 19 patch series would be better as
multiple patch series.

IMO: the strarray variants introduction and use should be a separate
patchset from the rest.


