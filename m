Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A773A26A1D5
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Sep 2020 11:14:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726142AbgIOJON (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Sep 2020 05:14:13 -0400
Received: from mga04.intel.com ([192.55.52.120]:30666 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726119AbgIOJOK (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 15 Sep 2020 05:14:10 -0400
IronPort-SDR: mn6nXbLyXQ1p8rUwimZqG5Jf+EOa7Xut7vnMcOjs2SZExSDJc7YY5bydO/WoKx4NE455Y0Nxl6
 NKKFmsgVX0sw==
X-IronPort-AV: E=McAfee;i="6000,8403,9744"; a="156617382"
X-IronPort-AV: E=Sophos;i="5.76,429,1592895600"; 
   d="scan'208";a="156617382"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2020 02:14:10 -0700
IronPort-SDR: V2JuXbcRv57bfIYOHy6F6L5IzojZb5Wec8d2LnWQ/N1CUoWb0Dlkg2KId/Aq5h2PGb4LBigLN9
 MeokBGHFkKMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,429,1592895600"; 
   d="scan'208";a="335579181"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 15 Sep 2020 02:14:08 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kI70F-00Gnjb-24; Tue, 15 Sep 2020 12:11:55 +0300
Date:   Tue, 15 Sep 2020 12:11:55 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2] gpiolib: Fix line event handling in syscall
 compatible mode
Message-ID: <20200915091155.GQ3956970@smile.fi.intel.com>
References: <20200914143743.39871-1-andriy.shevchenko@linux.intel.com>
 <20200914230526.GA4138@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200914230526.GA4138@sol>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 15, 2020 at 07:05:26AM +0800, Kent Gibson wrote:

Thanks for your review. Before I'm going on it, can you confirm that these are
the only issues with the patch and after addressing them you will be okay with
the patch?

-- 
With Best Regards,
Andy Shevchenko


