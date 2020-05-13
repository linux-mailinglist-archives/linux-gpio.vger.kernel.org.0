Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEB0E1D17D7
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2020 16:43:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388777AbgEMOns (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 May 2020 10:43:48 -0400
Received: from mga04.intel.com ([192.55.52.120]:15596 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728345AbgEMOnr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 13 May 2020 10:43:47 -0400
IronPort-SDR: Z615RnsSO4i9/AptJKOEr/g3EXKk10p3b9dVqfqn+cI39F35iV9Xzpb0xFUytmV4EuVfQw1dYk
 bTl7XS6FVWtg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2020 07:43:47 -0700
IronPort-SDR: Fjqgo5sjFuD0Q5yjSzzIM3sWy1am4JZ68BW1mSPJLfB4CTVd21wW+Slt4hb6SzR/J9dVeHnkVn
 CYyLjUn61U6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,388,1583222400"; 
   d="scan'208";a="251272479"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga007.jf.intel.com with ESMTP; 13 May 2020 07:43:45 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jYsbt-006RVG-36; Wed, 13 May 2020 17:43:49 +0300
Date:   Wed, 13 May 2020 17:43:49 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [PATCH v1 1/4] gpio: dwapb: avoid error message for optional IRQ
Message-ID: <20200513144349.GP185537@smile.fi.intel.com>
References: <20200512184513.86883-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200512184513.86883-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 12, 2020 at 09:45:10PM +0300, Andy Shevchenko wrote:
> platform_get_irq() will generate an error message if the requested IRQ
> is not present. Use platform_get_irq_optional() to avoid the error message
> being generated.

I will wait for Serge and others to comment before I'll send v2 with a fix to
the last patch.

-- 
With Best Regards,
Andy Shevchenko


