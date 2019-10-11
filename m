Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07997D3B45
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2019 10:36:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726703AbfJKIf7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Oct 2019 04:35:59 -0400
Received: from mga11.intel.com ([192.55.52.93]:4854 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726603AbfJKIf7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 11 Oct 2019 04:35:59 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Oct 2019 01:35:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,283,1566889200"; 
   d="scan'208";a="395682718"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga006.fm.intel.com with ESMTP; 11 Oct 2019 01:35:56 -0700
Received: from andy by smile with local (Exim 4.92.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iIqOy-0003NI-Bs; Fri, 11 Oct 2019 11:35:56 +0300
Date:   Fri, 11 Oct 2019 11:35:56 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux GPIO <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [GIT PULL] intel-gpio for 5.4-2
Message-ID: <20191011083556.GA32742@smile.fi.intel.com>
References: <20191009165056.76580-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdb7ZvENhOetUCRwkC0uChhpg--DefcLVic3pQ5qR3zfDQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdb7ZvENhOetUCRwkC0uChhpg--DefcLVic3pQ5qR3zfDQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 11, 2019 at 01:22:06AM +0200, Linus Walleij wrote:
> On Wed, Oct 9, 2019 at 6:51 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > Small set of urgent fixes against Intel GPIO drivers that have been recently
> > converted to use GPIO core for instantiation of IRQ chip. No conflicts observed
> > with fixes branch of GPIO tree as of today.
> 
> Thanks Andy, I pulled this in so hopefully -next works, I will have
> to rebase on v5.4-rc2 next week before sending this so will re-sign-off
> at that point.

Thank you, Linus!

I guess you meant v5.4-rc3?

-- 
With Best Regards,
Andy Shevchenko


