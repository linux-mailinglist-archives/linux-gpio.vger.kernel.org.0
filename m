Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9046B1AC141
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2020 14:31:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2635579AbgDPMbi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Apr 2020 08:31:38 -0400
Received: from mga17.intel.com ([192.55.52.151]:7542 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2635583AbgDPMbZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Apr 2020 08:31:25 -0400
IronPort-SDR: 4KjrpwzWdjzRQlabKlDicEycTj/j/IWRmX2FpYEY1LGcZY+swk6aVSiT2aW46l2EQuGRsAUHcs
 g2q/2uFkmecg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2020 05:31:18 -0700
IronPort-SDR: NnK6ZlKP6tAicX/R65bG4WH04mQdyZOtvnYSMRME6cDAKKbh9AEw7LRG5liAP6qo8MDO0wIjxk
 b5qECB2Ijyaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,390,1580803200"; 
   d="scan'208";a="272053964"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002.jf.intel.com with ESMTP; 16 Apr 2020 05:31:17 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jP3fs-0011eR-8m; Thu, 16 Apr 2020 15:31:20 +0300
Date:   Thu, 16 Apr 2020 15:31:20 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] gpio: merrifield: Switch over to MSI interrupts
Message-ID: <20200416123120.GC185537@smile.fi.intel.com>
References: <20200408154155.68310-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdZKEpz=acfw0zQ71pWmLU8dALS4tap412U2x6GyY82opw@mail.gmail.com>
 <20200416113543.GB185537@smile.fi.intel.com>
 <CACRpkdZt-Amd64qE+UaGjUu4CuJ17yqyNBoFstxpcPgyx8c7nw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZt-Amd64qE+UaGjUu4CuJ17yqyNBoFstxpcPgyx8c7nw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 16, 2020 at 02:16:36PM +0200, Linus Walleij wrote:
> On Thu, Apr 16, 2020 at 1:35 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Thu, Apr 16, 2020 at 12:50:43PM +0200, Linus Walleij wrote:
> > > On Wed, Apr 8, 2020 at 5:41 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > > Some devices may support MSI interrupts. Let's at least try to use them
> > > > in platforms that provide MSI capability.
> > > >
> > > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > >
> > > Patch applied.
> >
> > Can we return to established scheme when we send a PR to you? Or you think
> > better not to do like that anymore?
> 
> No problem, I haven't pushed this out or anything, I will drop these.

Thank you. Let's keep it the way we agreed before, i.e. PR for Intel GPIO
drivers. For this cycle it seems PCH and Merrifield ones to the date.

-- 
With Best Regards,
Andy Shevchenko


