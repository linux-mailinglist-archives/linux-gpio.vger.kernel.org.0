Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81616247246
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Aug 2020 20:41:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391368AbgHQSkY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Aug 2020 14:40:24 -0400
Received: from mga07.intel.com ([134.134.136.100]:34905 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387965AbgHQSkX (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 17 Aug 2020 14:40:23 -0400
IronPort-SDR: C+wxtgCfVfmKhcjAu48yXh8rPzLOnHkB+CFaCj57oPK8885Sx8EVQPlttXu/S6u7+7lcDEsWJi
 uA6MSfaaFWpA==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="219093665"
X-IronPort-AV: E=Sophos;i="5.76,324,1592895600"; 
   d="scan'208";a="219093665"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2020 11:40:21 -0700
IronPort-SDR: qwIq53Nbz+h+rUZRC7HF+/ezgtonG3ao5oVglIRhEJtkrL7hwHqBOsP2WxnnIOK8/5fin4ByJG
 fv0DtQKglrDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,324,1592895600"; 
   d="scan'208";a="326491264"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 17 Aug 2020 11:40:19 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1k7k3O-009UFq-Ck; Mon, 17 Aug 2020 21:40:18 +0300
Date:   Mon, 17 Aug 2020 21:40:18 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 00/20] gpio: cdev: add uAPI v2
Message-ID: <20200817184018.GV1891694@smile.fi.intel.com>
References: <20200814030257.135463-1-warthog618@gmail.com>
 <CAMpxmJUCwXVv6U9sE=8isRMoNd8QvM9XLu4PU2Rr454wt_FTUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMpxmJUCwXVv6U9sE=8isRMoNd8QvM9XLu4PU2Rr454wt_FTUw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 17, 2020 at 08:24:24PM +0200, Bartosz Golaszewski wrote:
> On Fri, Aug 14, 2020 at 5:03 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > This patchset defines and implements adds a new version of the
> > GPIO CDEV uAPI to address existing 32/64-bit alignment issues, add
> > support for debounce, event sequence numbers, and allowing for requested
> > lines with different configurations.
> > It provides some future proofing by adding optional configuration fields
> > and padding reserved for future use.
> >
> > The series can be partitioned into two sets; the first eleven
> > contain the v2 uAPI implementation, and the final seven port
> > the GPIO tools to the v2 uAPI and extend them to use new uAPI features.
> >
> > The more complicated patches include their own commentary where
> > appropriate.

> The series looks quite good to me and I think we're on track to get it
> in for v5.10. I'd love to have Andy (Cc'd) take a look as well. There
> are some nits here and there but as long as we get the ABI right, any
> implementation details can be ironed out later.
> 
> I need to think about some details a bit more but I really like the
> current state of the patches.

First of all, I apologize for being silent, I'm quite busy with internal
development / work.

Second, I didn't hear further why we can't fix current ABI as proposed by Arnd
and see what we will have afterwards?

Third, I'm not satisfied with the approach of wasting some memory for padding
and I think the proper solution for the ABI is to have versioning inside the
structures.

What do you think?

-- 
With Best Regards,
Andy Shevchenko


