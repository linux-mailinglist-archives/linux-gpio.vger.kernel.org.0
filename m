Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFE0311E5CB
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2019 15:44:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727741AbfLMOof (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Dec 2019 09:44:35 -0500
Received: from mga18.intel.com ([134.134.136.126]:12100 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727619AbfLMOoe (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 13 Dec 2019 09:44:34 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Dec 2019 06:44:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,309,1571727600"; 
   d="scan'208";a="415655861"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga006.fm.intel.com with ESMTP; 13 Dec 2019 06:44:31 -0800
Received: from andy by smile with local (Exim 4.93-RC7)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1ifmBD-0004Dl-I4; Fri, 13 Dec 2019 16:44:31 +0200
Date:   Fri, 13 Dec 2019 16:44:31 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v2 00/24] pinctrl: intel: Move Lynxpoint to pin control
 umbrella
Message-ID: <20191213144431.GV32742@smile.fi.intel.com>
References: <20191209130926.86483-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdaxTMPNcRMkKxJ9y3W8x7pwwnNaG+=Tc0P+-3ZzpnFmww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdaxTMPNcRMkKxJ9y3W8x7pwwnNaG+=Tc0P+-3ZzpnFmww@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 13, 2019 at 02:36:36PM +0100, Linus Walleij wrote:
> On Mon, Dec 9, 2019 at 2:09 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > Intel Lynxpoint GPIO is actually half way to the Chassis specification
> > that has been established starting from Intel Skylake. It has some pin control
> > properties we may utilize. To achieve this, move the driver under pin control
> > umbrella and do a bunch of clean ups.
> >
> > The series has been tested on Broadwell Ultrabook where Lynxpoint GPIO
> > is exposed to the OS.
> >
> > It has a dependency to patches in my review branch [1]. That dependency patch
> > is supposed to be submitted soon as a part of Baytrail clean up. In the
> > mentioned branch the patches are represented in the correct order.
> >
> > [1]: https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git/log/?h=review-andy
> >
> > Changes v2:
> > - fixed ordering in Kconfig and Makefile (Mika)
> > - finished conversion to pin control
> 
> This is some really nice development and just go ahead:
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 
> If you want to make my life simple could you do this:

I want, though I think above makes it harder. I'll not expecting any patches
against gpio-lynxpoint.c (and if they will be an author should Cc me anyway).
Besides the series nicely grouped on top of prerequisites which are solely
Intel pin control (no need for GPIO). Thus I prefer to send simple 1 PR during
this cycle to pin control subsystem and that's it.

Tell me if you think it won't work.

> - One pull request just moving the driver to the pin control
>   subsystem. I will pull this into both the pinctrl and the GPIO
>   tree.
> 
> - One pull request based on top of the last commit in the first
>   pull request with just the rest of refactorings and improvements.
>   I will just pull this into the pinctrl tree on top of the moved driver.

-- 
With Best Regards,
Andy Shevchenko


