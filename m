Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A9C1F4D5B
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Nov 2019 14:39:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727677AbfKHNjq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Nov 2019 08:39:46 -0500
Received: from mga09.intel.com ([134.134.136.24]:6424 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726445AbfKHNjq (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 8 Nov 2019 08:39:46 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 08 Nov 2019 05:39:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,281,1569308400"; 
   d="scan'208";a="201355734"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008.fm.intel.com with ESMTP; 08 Nov 2019 05:39:43 -0800
Received: from andy by smile with local (Exim 4.93-RC1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iT4UI-0004be-RE; Fri, 08 Nov 2019 15:39:42 +0200
Date:   Fri, 8 Nov 2019 15:39:42 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [RESEND][PATCH v2 0/7] gpiolib: fix GPIO <-> pin mapping
 registration
Message-ID: <20191108133942.GH32742@smile.fi.intel.com>
References: <20191105203557.78562-1-andriy.shevchenko@linux.intel.com>
 <20191106173055.GQ32742@smile.fi.intel.com>
 <CACRpkdaAxY-8A7gindeA8fsQ9rEdnwp8k90CyULxNs4J5VBSBw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdaAxY-8A7gindeA8fsQ9rEdnwp8k90CyULxNs4J5VBSBw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 08, 2019 at 10:40:47AM +0100, Linus Walleij wrote:
> On Wed, Nov 6, 2019 at 6:30 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > Linus, I think it would be good if we have first 3 (okay, I noticed you have
> > pushed first one to your devel branch) patches to go to v5.4. It will reduce
> > dependency burden in v5.5.
> 
> At this point in the kernel release cycle I can really only apply
> patches for serious regressions. That's the policy I need to keep
> to.
> 
> It also causes a problem if I put dependencies on Torvald's
> tree this late in the kernel cycle, because I need to get the
> changes back into my tree in order to base new stuff on them.
> I can't really do that until he releases an -rc that I can merge
> back.
> 
> At this point I'd maybe have to merge back v5.4 and that doesn't
> feel good at all.
> 
> So far I applied patches 1 & 2 for v5.5.

Thanks! Does it mean that the rest is material for v5.6?

-- 
With Best Regards,
Andy Shevchenko


