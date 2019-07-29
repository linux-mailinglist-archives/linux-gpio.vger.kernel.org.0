Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01DD078892
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2019 11:37:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727852AbfG2Jht (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Jul 2019 05:37:49 -0400
Received: from mga12.intel.com ([192.55.52.136]:41148 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727499AbfG2Jht (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 29 Jul 2019 05:37:49 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 Jul 2019 02:37:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,322,1559545200"; 
   d="scan'208";a="370976775"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by fmsmga006.fm.intel.com with ESMTP; 29 Jul 2019 02:37:45 -0700
Received: from andy by smile with local (Exim 4.92)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1hs26B-00059s-Te; Mon, 29 Jul 2019 12:37:43 +0300
Date:   Mon, 29 Jul 2019 12:37:43 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v1 1/4] pinctrl: baytrail: Use
 devm_platform_ioremap_resource()
Message-ID: <20190729093743.GG9224@smile.fi.intel.com>
References: <20190703145615.74768-1-andriy.shevchenko@linux.intel.com>
 <20190703163630.GY2640@lahna.fi.intel.com>
 <20190723155132.GO9224@smile.fi.intel.com>
 <CACRpkdbb+efsEZeOViKyr+a-NXzJ1vBXx9dEnFzpeK3g9Qz+BQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdbb+efsEZeOViKyr+a-NXzJ1vBXx9dEnFzpeK3g9Qz+BQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 29, 2019 at 12:06:52AM +0200, Linus Walleij wrote:
> On Tue, Jul 23, 2019 at 5:51 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > Pushed to my review and testing queue, thanks!
> 
> I take it I can get a pull request with all the Intel pinctrl changes?
> They all look good to me.

Yes, we are collecting them, and GPIO as well.


-- 
With Best Regards,
Andy Shevchenko


