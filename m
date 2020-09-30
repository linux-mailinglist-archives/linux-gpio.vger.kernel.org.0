Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF18627E6B2
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Sep 2020 12:32:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725872AbgI3KcX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Sep 2020 06:32:23 -0400
Received: from mga02.intel.com ([134.134.136.20]:62252 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725779AbgI3KcX (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 30 Sep 2020 06:32:23 -0400
IronPort-SDR: S8ZQjQYEFcDksdOHChbGlil0fi/SUnI82o6L56q+4SMjLmSbYYkB9kdofM0+rHF5GApijXElR6
 nrM1b9QdaB3g==
X-IronPort-AV: E=McAfee;i="6000,8403,9759"; a="150078441"
X-IronPort-AV: E=Sophos;i="5.77,322,1596524400"; 
   d="scan'208";a="150078441"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2020 03:32:21 -0700
IronPort-SDR: vPmH/pTMMUdjf+XYvHM0TFThN4+zc5zyJtehnV0PPr1DUe4ok5l72isTfWVsKa6sRRmLScllrJ
 CNVo+RSYySbQ==
X-IronPort-AV: E=Sophos;i="5.77,322,1596524400"; 
   d="scan'208";a="312549001"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2020 03:32:19 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1kNZPC-002zg2-C8; Wed, 30 Sep 2020 13:32:14 +0300
Date:   Wed, 30 Sep 2020 13:32:14 +0300
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v1 1/3] pinctrl: tigerlake: Fix register offsets for
 TGL-H variant
Message-ID: <20200930103214.GK3956970@smile.fi.intel.com>
References: <20200929110306.40852-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdYgHt6ajbLPfajQ8ZJn9=SHfRiDZV6gDbwAPB8XSQBpGA@mail.gmail.com>
 <CAHp75Vf2Ztqxfth31cysC3JWpcr813OxG8W3FUBQ4HhCbrd=Qg@mail.gmail.com>
 <CACRpkdY2cQZioG3hY5cyf9WQLMuf_LW0R5B=ArvQ4wvc0cm_Ww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdY2cQZioG3hY5cyf9WQLMuf_LW0R5B=ArvQ4wvc0cm_Ww@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 30, 2020 at 11:44:34AM +0200, Linus Walleij wrote:
> On Tue, Sep 29, 2020 at 3:30 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Tue, Sep 29, 2020 at 4:25 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> > > On Tue, Sep 29, 2020 at 1:03 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > > It appears that almost traditionally the H variants have some deviations
> > > > in the register offsets in comparison to LP ones. This is the case for
> > > > Intel Tiger Lake as well. Fix register offsets for TGL-H variant.
> > > >
> > > > Fixes: 653d96455e1e ("pinctrl: tigerlake: Add support for Tiger Lake-H")
> > > > Reported-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> > > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > >
> > > I could apply this one for fixes as you indicated in another thread,
> > > does the other two patches depend on it?
> >
> > Logically -- yes, functionally -- no. They may be applied for v5.10
> > or, as I said, v5.11 (but in the latter case I will do it the usual
> > way, via our branch).
> 
> OK since they are all ACKed I just applied all three for v5.10.

Thanks! First one can be part of v5.9 (it's a fix) in case it doesn't hurt your
workflow.

-- 
With Best Regards,
Andy Shevchenko


