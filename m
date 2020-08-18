Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6896248473
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Aug 2020 14:07:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726422AbgHRMH6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Aug 2020 08:07:58 -0400
Received: from mga05.intel.com ([192.55.52.43]:35039 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726357AbgHRMH4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 18 Aug 2020 08:07:56 -0400
IronPort-SDR: 2byq3qubR99dOmleq4Not2v6gkzDtUuv/JNJ4Xw0VRtVEOzmD8z/OBAJZi77gcjgNuRBpdt1Nt
 5c+MR9vkmYRg==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="239711906"
X-IronPort-AV: E=Sophos;i="5.76,327,1592895600"; 
   d="scan'208";a="239711906"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2020 05:07:56 -0700
IronPort-SDR: nfugsrnhKW7TVLhp00vvo+xNS/8e9BHPJL8I+rP7cf9B/r/UjrBxfD1sCzkWrC0R8MupTLKznb
 cubL08tsuQig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,327,1592895600"; 
   d="scan'208";a="326712522"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 18 Aug 2020 05:07:55 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1k80PC-009doC-00; Tue, 18 Aug 2020 15:07:54 +0300
Date:   Tue, 18 Aug 2020 15:07:53 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/3] pinctrl: cherryview: Drop stale comment
Message-ID: <20200818120753.GJ1891694@smile.fi.intel.com>
References: <20200727161216.67115-1-andriy.shevchenko@linux.intel.com>
 <20200803100258.GF1375436@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200803100258.GF1375436@lahna.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 03, 2020 at 01:02:58PM +0300, Mika Westerberg wrote:
> On Mon, Jul 27, 2020 at 07:12:14PM +0300, Andy Shevchenko wrote:
> > There is no more .groups member in struct chv_pinctrl,
> > drop associated comment because it's not applicable anymore.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> For this and the other patches in this series,
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Applied to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko


