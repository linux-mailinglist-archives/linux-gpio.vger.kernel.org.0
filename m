Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 869BF71C36
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jul 2019 17:51:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730008AbfGWPvz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Jul 2019 11:51:55 -0400
Received: from mga04.intel.com ([192.55.52.120]:3966 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728497AbfGWPvz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 23 Jul 2019 11:51:55 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Jul 2019 08:51:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,299,1559545200"; 
   d="scan'208";a="193107686"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by fmsmga004.fm.intel.com with ESMTP; 23 Jul 2019 08:51:53 -0700
Received: from andy by smile with local (Exim 4.92)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1hpx4y-0004aq-8g; Tue, 23 Jul 2019 18:51:52 +0300
Date:   Tue, 23 Jul 2019 18:51:52 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1] pinctrl: intel: Drop double check for data in
 intel_pinctrl_probe_by_uid()
Message-ID: <20190723155152.GP9224@smile.fi.intel.com>
References: <20190704130239.24111-1-andriy.shevchenko@linux.intel.com>
 <20190704131321.GK2640@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190704131321.GK2640@lahna.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 04, 2019 at 04:13:21PM +0300, Mika Westerberg wrote:
> On Thu, Jul 04, 2019 at 04:02:39PM +0300, Andy Shevchenko wrote:
> > There is no need to duplicate the check which is done in the common
> > intel_pinctrl_probe().
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko


