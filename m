Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CD0C2B9075
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Nov 2020 11:59:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726474AbgKSK52 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Nov 2020 05:57:28 -0500
Received: from mga14.intel.com ([192.55.52.115]:14807 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726052AbgKSK52 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 19 Nov 2020 05:57:28 -0500
IronPort-SDR: 0Kf8t+AAB+jpypqNgtAo+wqR5z2qTelWGA0Juvtc8Rb5MdKZUEn+3cMAxtJdsPju7ygzRJ/StX
 5+w5P64JUGBQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9809"; a="170488393"
X-IronPort-AV: E=Sophos;i="5.77,490,1596524400"; 
   d="scan'208";a="170488393"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2020 02:57:28 -0800
IronPort-SDR: +eJYnieyUMabaVnnxNdkiEMiNY3PV7LzPcsCE9QE1qIaJQethFR4DL5Z4Me18Ub17vnRuitk0S
 bLcY0eRp1kMw==
X-IronPort-AV: E=Sophos;i="5.77,490,1596524400"; 
   d="scan'208";a="368725738"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2020 02:57:26 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kfhe0-007ud4-T1; Thu, 19 Nov 2020 12:58:28 +0200
Date:   Thu, 19 Nov 2020 12:58:28 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux GPIO <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [GIT PULL] intel-gpio for 5.11-1
Message-ID: <20201119105828.GZ4077@smile.fi.intel.com>
References: <20201116152625.GA20187@black.fi.intel.com>
 <CACRpkdbgO++4scNqX=3D0XKSyUhah67UvMjHDbaT4SyX0ESF-A@mail.gmail.com>
 <20201118141811.GV4077@smile.fi.intel.com>
 <CACRpkdZO+OGvYVF1+ZxgnaMO-HUCCJ2oAJPQgP_zKQwXeOLtCQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZO+OGvYVF1+ZxgnaMO-HUCCJ2oAJPQgP_zKQwXeOLtCQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 19, 2020 at 09:31:03AM +0100, Linus Walleij wrote:
> On Wed, Nov 18, 2020 at 3:17 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Tue, Nov 17, 2020 at 10:24:37PM +0100, Linus Walleij wrote:
> 
> > > Thanks! I merged in v5.10-rc4 to the GPIO devel branch and
> > > pulled in this on top, works like a charm!
> >
> > I'm not sure I understood why you merged v5.10-rc4, but in any case thanks,
> > result is great!
> 
> I merged v5.10-rc4 because the pull request says:
> 
> > The following changes since commit b72de3ff19fdc4bbe4d4bb3f4483c7e46e00bac3:
> >
> >   gpio: sifive: Fix SiFive gpio probe (2020-11-11 09:53:09 +0100)
> 
> And that patch was on my fixes branch, which went into v5.10-rc4,
> so in order to have the base commit in the devel tree I had to merge
> in v5.10-rc4.

I based solely on your gpio/for-next as has been stated in the cover letter.
So, the PR might have been applied on top of your gpio/for-next without any
additional merge required.

I admit that PR automatic text is a bit deviated (it has been taken from wrong
base, note that tag is correct nevertheless). I will look forward to amend my
scripts.

-- 
With Best Regards,
Andy Shevchenko


