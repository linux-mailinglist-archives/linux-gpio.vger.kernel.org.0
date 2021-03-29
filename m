Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33A3A34D127
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Mar 2021 15:31:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231404AbhC2Nad (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Mar 2021 09:30:33 -0400
Received: from mga14.intel.com ([192.55.52.115]:18356 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231400AbhC2Na3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 29 Mar 2021 09:30:29 -0400
IronPort-SDR: Zn+ZsNnqt5xQ4ySmQmSR5t+qzEl0vgn5VjKSsKEvpp/lpHsChEsiSQ1s5kpetu0KrYe/TUuUdh
 lxLuFQHuhdPw==
X-IronPort-AV: E=McAfee;i="6000,8403,9938"; a="191015707"
X-IronPort-AV: E=Sophos;i="5.81,287,1610438400"; 
   d="scan'208";a="191015707"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2021 06:30:29 -0700
IronPort-SDR: d7m3p5eGyttly682WkWwYRQzCcNFEXrxmD4Q1Qo72xX6SMqqZ5RP5r01fkQkwRCPs5ULeK9OHO
 JQu5IhgVUjcQ==
X-IronPort-AV: E=Sophos;i="5.81,287,1610438400"; 
   d="scan'208";a="526958426"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2021 06:30:26 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1lQryA-00H20D-Cq; Mon, 29 Mar 2021 16:30:14 +0300
Date:   Mon, 29 Mar 2021 16:30:14 +0300
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Joe Perches <joe@perches.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] gpiolib: Allow drivers to return EOPNOTSUPP from
 config
Message-ID: <YGHWZuNfbSDe+B6y@smile.fi.intel.com>
References: <cover.1617017060.git.matti.vaittinen@fi.rohmeurope.com>
 <d2c8b7f9a3b420c2764f645da531a57db16905f3.1617017060.git.matti.vaittinen@fi.rohmeurope.com>
 <CAHp75VdXa2bkJ+ej+HNYstLeK4TF+L5H3wTgm0CgJ9hYQeU+ZQ@mail.gmail.com>
 <bf12f668db2f0dce7dfc09351780e295da30714c.camel@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf12f668db2f0dce7dfc09351780e295da30714c.camel@fi.rohmeurope.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 29, 2021 at 03:20:07PM +0300, Matti Vaittinen wrote:
> On Mon, 2021-03-29 at 14:59 +0300, Andy Shevchenko wrote:
> > On Mon, Mar 29, 2021 at 2:43 PM Matti Vaittinen
> > <matti.vaittinen@fi.rohmeurope.com> wrote:
> > > The checkpacth instructs to switch from ENOSUPP to EOPNOTSUPP.
> > > > WARNING: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP
> > > 
> > > Make the gpiolib allow drivers to return both so driver developers
> > > can avoid one of the checkpatch complaints.
> > 
> > Internally we are fine to use the ENOTSUPP.
> > Checkpatch false positives there.
> 
> I agree. OTOH, the checkpatch check makes sense to user-visible stuff.
> Yet, the checkpatch has hard time guessing what is user-visible - so it
> probably is easiest to nag about all ENOTSUPP uses as it does now.
> 
> > I doubt we need this change. Rather checkpatch should rephrase this
> > to
> > point out that this is only applicable to _user-visible_ error path.
> > Cc'ed Joe.
> 
> Yes, thanks for pulling Joe in.
> 
> Anyways, no matter what the warning says, all false positives are
> annoying. I don't see why we should stay with ENOTSUPP in gpiolib?
> (other than the burden of changing it).

For sake of the changing we are not changing the code.

> But I have no strong opinion on this. All options I see have downsides.
> 
> Accepting both ENOTSUPP and EOPNOTSUPP is the easy way to avoid
> allowing checkpatch warnings - but I admit it isn't stylish.

I think the error code which is Linux kernel internal is for a reason.

> Converting all ENOTSUPP cases inside gpiolib to EOPNOTSUPP is teodious
> although end result might be nicer.

Why? You still missed the justification except satisfying some tool that gives
you false positives. We don't do that. It's the tool that has to be fixed /
amended.

> Leaving it as is gives annoying false-positives to driver developers.
> 
> My personal preference was this patch - others can have other view like
> Andy does. I'll leave this to community/maintainers to evaluate :)

This patch misses documentation fixes, for example.

Also, do you suggest that we have to do the same in entire pin control
subsystem?

-- 
With Best Regards,
Andy Shevchenko


