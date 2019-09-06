Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24A5BABE29
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2019 18:59:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388169AbfIFQ7g (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Sep 2019 12:59:36 -0400
Received: from mga18.intel.com ([134.134.136.126]:59966 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727816AbfIFQ7g (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 6 Sep 2019 12:59:36 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Sep 2019 09:59:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,473,1559545200"; 
   d="scan'208";a="183187904"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008.fm.intel.com with ESMTP; 06 Sep 2019 09:59:33 -0700
Received: from andy by smile with local (Exim 4.92.1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1i6Ha8-0002Nu-BV; Fri, 06 Sep 2019 19:59:32 +0300
Date:   Fri, 6 Sep 2019 19:59:32 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Chris Chiu <chiu@endlessm.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: intel: hide unused intel_pin_to_gpio
Message-ID: <20190906165932.GX2680@smile.fi.intel.com>
References: <20190906152609.1603386-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190906152609.1603386-1-arnd@arndb.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 06, 2019 at 05:26:01PM +0200, Arnd Bergmann wrote:
> The intel_pin_to_gpio() function is only called by the
> PM support functions and causes a warning when those are disabled:
> 
> drivers/pinctrl/intel/pinctrl-intel.c:841:12: error: unused function 'intel_pin_to_gpio' [-Werror,-Wunused-function]
> 
> As we cannot change the PM functions themselves to use __maybe_unused,
> add another #ifdef here for consistency.

It's not adding another #ifdef here...

Nevertheless, I'm afraid that in the future we might need this in other
place(s). Can we add __maybe_unused to this function exclusively?

-- 
With Best Regards,
Andy Shevchenko


