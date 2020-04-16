Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B4841AC656
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2020 16:38:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728166AbgDPOhl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Apr 2020 10:37:41 -0400
Received: from mga03.intel.com ([134.134.136.65]:48419 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2393413AbgDPOJN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Apr 2020 10:09:13 -0400
IronPort-SDR: siJmaYYDSjuV+ahszg6N9PWAQ9z7l8kwDgIKUlWJbzJwijPl7t2ZpY69puQrERAfUy/yxCI6XF
 v0MCvin+Lh3w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2020 07:09:12 -0700
IronPort-SDR: 9IaX/fYBJAgXatengMnHO39Tua0QJ/AXr1tAe0qgoZumkO3CBX+VYZ7J5C0G7vHUlchx/QB1Hv
 AbtnXR9RtyrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,391,1580803200"; 
   d="scan'208";a="400680686"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004.jf.intel.com with ESMTP; 16 Apr 2020 07:09:11 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jP5Cb-0012mF-R1; Thu, 16 Apr 2020 17:09:13 +0300
Date:   Thu, 16 Apr 2020 17:09:13 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Serge Semin <fancer.lancer@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v2 14/14] gpio: dwapb: Amend indentation in some cases
Message-ID: <20200416140913.GD185537@smile.fi.intel.com>
References: <20200415141534.31240-1-andriy.shevchenko@linux.intel.com>
 <20200415141534.31240-15-andriy.shevchenko@linux.intel.com>
 <20200415171516.cugbzhvjua6cygnq@mobilestation>
 <20200416105614.GZ185537@smile.fi.intel.com>
 <20200416110613.4yyrlcle4oiy46a7@mobilestation>
 <CACRpkdacW7_Q7YW1WOazLaP_HKBbNKev3caJyKSNMBbXp7j1Zw@mail.gmail.com>
 <20200416133737.lvve4svqak6tbgwn@mobilestation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200416133737.lvve4svqak6tbgwn@mobilestation>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 16, 2020 at 04:37:37PM +0300, Serge Semin wrote:
> On Thu, Apr 16, 2020 at 02:14:10PM +0200, Linus Walleij wrote:
> > On Thu, Apr 16, 2020 at 1:06 PM Serge Semin <fancer.lancer@gmail.com> wrote:
> > 
> > > Ah, Linus already pulled the series in. Next time then.)
> > 
> > Yeah sorry, I was a bit stressed by a big mail backlog and also a bit
> > infatuated with my new b4 tool.
> > 
> > Is it fine to fix any remaining issues with extra patches?
> 
> I see. No worries. Andy did a good work fixing the indentations. But that
> caused the 80 chars line rule violation in some cases. The best way would
> be to avoid the rule violation in the first place, though sometimes it's
> just impossible without weakening the code readability. I suggested to fix
> some of the issues by reducing the error messages length and in another
> case just to remove the no-op &-operation. So If there were following up
> patches with fixes it would have been great. Though since we have got a
> violation for several chars in just a few lines of code, we can leave
> with that for now. So if Andy doesn't have a time to send the followup
> patches, I'll do this sometime later in the framework of my next patchset.

I see an immutable branch with this series, so, it means it will be easier
to all of us to move on from this point now.

-- 
With Best Regards,
Andy Shevchenko


