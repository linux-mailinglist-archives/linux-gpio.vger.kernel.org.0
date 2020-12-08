Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 678072D281F
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Dec 2020 10:51:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728569AbgLHJtz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Dec 2020 04:49:55 -0500
Received: from mga05.intel.com ([192.55.52.43]:49714 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727612AbgLHJty (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 8 Dec 2020 04:49:54 -0500
IronPort-SDR: AhwOPcVDt1ers1VwhQ30CvzDh7ptS9Gief+Lbcru42k2cav8eAzoyGjjKYJY/N9J2O21bCUuhq
 lPPG8wQCUyBA==
X-IronPort-AV: E=McAfee;i="6000,8403,9828"; a="258571502"
X-IronPort-AV: E=Sophos;i="5.78,402,1599548400"; 
   d="scan'208";a="258571502"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2020 01:49:12 -0800
IronPort-SDR: dRj7bKcKtov4mcBPA406RnmF+B6iFBRFMdsFp4hdm3Y0WhVKe28/yEzITYaK+kzfEAm21yfwuU
 yh92aHMZZ14g==
X-IronPort-AV: E=Sophos;i="5.78,402,1599548400"; 
   d="scan'208";a="407554476"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2020 01:49:11 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1kmZdN-00CnCZ-GL; Tue, 08 Dec 2020 11:50:13 +0200
Date:   Tue, 8 Dec 2020 11:50:13 +0200
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v1] pinctrl: intel: Actually disable Tx and Rx buffers on
 GPIO request
Message-ID: <20201208095013.GG4077@smile.fi.intel.com>
References: <20201207175940.10631-1-andriy.shevchenko@linux.intel.com>
 <CAHp75VeHz3CAZMQgQsU+WdDyjS+woMTyeOWYDzARePq1aaa=Og@mail.gmail.com>
 <CACRpkdb4AYx1dOYkZvHzRD7fbGfVbKoGqdnmh1m=rdhGnAaPag@mail.gmail.com>
 <20201208094853.GF4077@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201208094853.GF4077@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 08, 2020 at 11:48:53AM +0200, Andy Shevchenko wrote:
> On Tue, Dec 08, 2020 at 09:34:43AM +0100, Linus Walleij wrote:
> > On Mon, Dec 7, 2020 at 7:07 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > > On Mon, Dec 7, 2020 at 8:02 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:

...

> > > Linus, since we are at rc7 I'm not going to send a PR for this single
> > > fix (I truly do not expect anything to come). Please, proceed as usual
> > > (either to v5.10 or to v5.11 cycle, there is not much difference b/c
> > > culptin is sitting in v5.9).
> > 
> > OK no problem, I applied the patch directly for fixes so we get it in ASAP.
> 
> Linus, thanks, however something happened to it. i.e. BugLink tag disappeared.
> It's not good, because due to that link and Kai's report I quickly understood
> what was the issue.
> 
> Besides that commit message has some grammar / style issues.
> Can you please fix above and use below (fixed) text as commit message?
> 
> ---8<---8<---
> 
> Mistakenly the buffers (input and output) become together enabled for a short
> period of time during GPIO request. This is problematic, because instead of
> initial motive to disable them in the commit af7e3eeb84e2
> ("pinctrl: intel: Disable input and output buffer when switching to GPIO"),
> the driven value on the pin, which might be used as an IRQ line, brings
> firmwares of some touch pads to an awkward state that needs a full power off
> to recover. Fix this by, as stated in the culprit commit, disabling the buffers.
> 
> P.S. I'm looking at 5f4592bc20c8 in your pin control tree, fixes branch.

I can send a v2 for your convenience.

-- 
With Best Regards,
Andy Shevchenko


