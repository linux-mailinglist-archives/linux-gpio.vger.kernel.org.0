Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1194FB68F
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2019 18:47:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726564AbfKMRrg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Nov 2019 12:47:36 -0500
Received: from mga03.intel.com ([134.134.136.65]:53263 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726105AbfKMRrg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 13 Nov 2019 12:47:36 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Nov 2019 09:47:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,301,1569308400"; 
   d="scan'208";a="202809300"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008.fm.intel.com with ESMTP; 13 Nov 2019 09:47:33 -0800
Received: from andy by smile with local (Exim 4.93-RC1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iUwjt-0006tl-4I; Wed, 13 Nov 2019 19:47:33 +0200
Date:   Wed, 13 Nov 2019 19:47:33 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 3/7] gpiolib: Introduce ->add_pin_ranges() callback
Message-ID: <20191113174733.GJ32742@smile.fi.intel.com>
References: <20191105203557.78562-1-andriy.shevchenko@linux.intel.com>
 <20191105203557.78562-4-andriy.shevchenko@linux.intel.com>
 <CACRpkdZ9A+VjUX8kyOQ0SYWXu8VD+fVdthsgGbdZWLDzYuU_nw@mail.gmail.com>
 <20191113132203.GE32742@smile.fi.intel.com>
 <CACRpkdaUhMRRHYbvs=K10V7f5BdRPMNJ=M_7hD-nrUA5b6YZ-A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdaUhMRRHYbvs=K10V7f5BdRPMNJ=M_7hD-nrUA5b6YZ-A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 13, 2019 at 06:25:25PM +0100, Linus Walleij wrote:
> On Wed, Nov 13, 2019 at 2:22 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Wed, Nov 13, 2019 at 10:46:24AM +0100, Linus Walleij wrote:
> > > On Tue, Nov 5, 2019 at 9:36 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > > When IRQ chip is being added by GPIO library, the ACPI based platform expects
> > > > GPIO <-> pin mapping ranges to be initialized in order to correctly initialize
> > > > ACPI event mechanism on affected platforms. Unfortunately this step is missed.
> > > >
> > > > Introduce ->add_pin_ranges() callback to fill the above mentioned gap.
> > > >
> > > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > >
> > > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> >
> > Thank you.
> >
> > > I also think DT drivers can benefit from this.
> > > I expect this in a big pull request :)
> >
> > You mean GPIO library one? Pin control is the other one and it seems that part
> > of Intel pin control (despite Lynxpoint case) will be split between v5.5 and
> > v5.6 due to this very patch as dependency.
> 
> No need for that I think, we can just create some shared baseline
> and pull that into both trees? (If it doesn't get too messy...)

Anyway, I sent two PRs, and looking forward for them being accepted. Then we
can continue based on updated repositories.

-- 
With Best Regards,
Andy Shevchenko


