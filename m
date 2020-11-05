Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B0902A8364
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Nov 2020 17:21:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729361AbgKEQVl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 11:21:41 -0500
Received: from mga12.intel.com ([192.55.52.136]:45918 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725998AbgKEQVl (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 5 Nov 2020 11:21:41 -0500
IronPort-SDR: QjLkw2Ixu6vsKkBCPp2NrT3I9BJUckvY+4hkMGkdxxqk0rACwfkcg4nKnq/hYqSENgnWSw8yYD
 8ySKAUzrlJcw==
X-IronPort-AV: E=McAfee;i="6000,8403,9796"; a="148691535"
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; 
   d="scan'208";a="148691535"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 08:21:40 -0800
IronPort-SDR: lEhrknC+qM7uO23QoYWw2BIe7IHTX6lupNi3rZ5cNS49n5bUPySl1Jew6TIStBqEeaqEyc80+n
 FrOTyndOVYqA==
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; 
   d="scan'208";a="326078848"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 08:21:38 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kai23-0046Oo-Gd; Thu, 05 Nov 2020 18:22:39 +0200
Date:   Thu, 5 Nov 2020 18:22:39 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Jamie McClymont <jamie@kwiius.com>
Subject: Re: [PATCH v1 1/2] pinctrl: intel: Fix 2 kOhm bias which is 833 Ohm
Message-ID: <20201105162239.GY4077@smile.fi.intel.com>
References: <20201014104638.84043-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdb_zWU0a3th4XAiZn65iO=8mAt6mpAEOjz-q32kYKpLZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdb_zWU0a3th4XAiZn65iO=8mAt6mpAEOjz-q32kYKpLZQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 05, 2020 at 10:09:45AM +0100, Linus Walleij wrote:
> On Wed, Oct 14, 2020 at 12:46 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > 2 kOhm bias was never an option in Intel GPIO hardware, the available
> > matrix is:
> >
> >         000     none
> >         001     1 kOhm (if available)
> >         010     5 kOhm
> >         100     20 kOhm
> >
> > As easy to get the 3 resistors are gated separately and according to
> > parallel circuits calculations we may get combinations of the above where
> > the result is always strictly less than minimal resistance. Hence,
> > additional values can be:
> >
> >         011     ~833.3 Ohm
> >         101     ~952.4 Ohm
> >         110     ~4 kOhm
> >         111     ~800 Ohm
> >
> > That said, convert TERM definitions to be the bit masks to reflect the above.
> >
> > While at it, enable the same setting for pull down case.
> >
> > Fixes: 7981c0015af2 ("pinctrl: intel: Add Intel Sunrisepoint pin controller and GPIO support")
> > Cc: Jamie McClymont <jamie@kwiius.com>
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Good research!
> 
> I expect this as part of a pull request for fixes or devel.

for-next, but yes, I don't want to be in hurry of backporting this, better to
test it carefully.

-- 
With Best Regards,
Andy Shevchenko


