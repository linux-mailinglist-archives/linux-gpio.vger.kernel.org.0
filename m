Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9A051A99CE
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2020 12:02:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2896085AbgDOKAc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Apr 2020 06:00:32 -0400
Received: from mga14.intel.com ([192.55.52.115]:60203 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2895955AbgDOKAb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 15 Apr 2020 06:00:31 -0400
IronPort-SDR: 5JgyYJ26YInuRCAkHNAJRsE3lY9OvcL5Ns7/xU1zzid/4je+PU0KUCD4XFjY019wfNmCr78b0B
 lzjGmRtOboQA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2020 03:00:27 -0700
IronPort-SDR: Ar2EFutLqMhbsnWlBemUKP4XSSJ8a0f6fMvHaHDtIvtZ1DSoJ94PMS483/QAZD0YIhxFj5TQHM
 112+e9iRo6AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,386,1580803200"; 
   d="scan'208";a="400264550"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004.jf.intel.com with ESMTP; 15 Apr 2020 03:00:22 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jOeqG-000kI3-Bw; Wed, 15 Apr 2020 13:00:24 +0300
Date:   Wed, 15 Apr 2020 13:00:24 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc:     alsa-devel@alsa-project.org, Rob Herring <robh+dt@kernel.org>,
        linux-gpio@vger.kernel.org, tiwai@suse.de,
        DigitalDreamtime <clive.messer@digitaldreamtime.co.uk>,
        Linus Walleij <linus.walleij@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Daniel Matuschek <daniel@hifiberry.com>,
        Hui Wang <hui.wang@canonical.com>,
        Matthias Reichl <hias@horus.com>, broonie@kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
Subject: Re: [RFC PATCH 07/16] clk: hifiberry-dacpro: initial import
Message-ID: <20200415100024.GQ34613@smile.fi.intel.com>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
 <20200409195841.18901-8-pierre-louis.bossart@linux.intel.com>
 <20200414173110.GG34613@smile.fi.intel.com>
 <1483c322-66b9-d68e-c8e9-81f826b01108@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1483c322-66b9-d68e-c8e9-81f826b01108@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 14, 2020 at 01:09:28PM -0500, Pierre-Louis Bossart wrote:
> On 4/14/20 12:31 PM, Andy Shevchenko wrote:
> > On Thu, Apr 09, 2020 at 02:58:32PM -0500, Pierre-Louis Bossart wrote:
> > > From: Daniel Matuschek <daniel@hifiberry.com>
> > > 
> > > This patch imports the clock code from the Raspberry v5.5-y tree. The
> > > ASoC machine driver initially present in this patch was dropped. The
> > > comments are also dropped but all sign-offs are kept below. The patch
> > > authorship was modified with explicit permission from Daniel Matuschek
> > > to make sure it matches the Signed-off tag.
> > > 
> > > This patch generates a lot of checkpatch.pl warnings that are
> > > corrected in follow-up patches.
> > 
> > I guess it will be waste of time to review this part without squashing it first.
> 
> I wasn't sure if squashing was desired, so kept all my changes separate.

At the end, yes. It's a new contribution that can be at least cleaned before
hands to more-or-less acceptable point. With so many subtle issues it's not
good that we dump an ugly code outside of drivers/staging.

> There are some changes from the legacy clk to the clk_hw parts plus
> introduction of ACPI support that are easier to review if kept separate.

Yes, for review purposes it's okay.

You always can put your name as a SoB + Co-developed-by tag or give credits to
other people in the commit message differently (depending to amount of work
they do vs. yours).

> Maybe I should have squashed the cosmetic parts in patch8, and kept the
> functional changes as separate patches.

Use a common sense, you know your work better than me :-)
Just explain this in cover letter (like you do for this version).

-- 
With Best Regards,
Andy Shevchenko


