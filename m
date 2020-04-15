Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B40D1AA13A
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2020 14:46:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409077AbgDOMfG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Apr 2020 08:35:06 -0400
Received: from mga05.intel.com ([192.55.52.43]:8851 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S369796AbgDOMfB (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 15 Apr 2020 08:35:01 -0400
IronPort-SDR: I7jJX3MxC/axRj56I/CkBWpSBz9LFJWyAg0757jIMsqH7JsVxbXoWIbapI/z7OkiBSLWXtflhZ
 OWhAZvTCZfaw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2020 05:34:59 -0700
IronPort-SDR: 4Uzo0500NbvVEqyy2KsPpUZsFR8IO8xgjeu/TFftf0FwsU6XYqsUwacMVLywaRoEL6xTcHTBPW
 C7M8CuhYYikg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,386,1580803200"; 
   d="scan'208";a="400300373"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004.jf.intel.com with ESMTP; 15 Apr 2020 05:34:58 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jOhFs-000meL-Sr; Wed, 15 Apr 2020 15:35:00 +0300
Date:   Wed, 15 Apr 2020 15:35:00 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Serge Semin <fancer.lancer@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v1 02/13] gpio: dwapb: Refactor IRQ handler
Message-ID: <20200415123500.GD185537@smile.fi.intel.com>
References: <20200409141228.49561-1-andriy.shevchenko@linux.intel.com>
 <20200409141228.49561-3-andriy.shevchenko@linux.intel.com>
 <20200415120449.lzf47ju6s4bpfcvs@mobilestation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200415120449.lzf47ju6s4bpfcvs@mobilestation>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 15, 2020 at 03:04:49PM +0300, Serge Semin wrote:
> On Thu, Apr 09, 2020 at 05:12:17PM +0300, Andy Shevchenko wrote:
> > Refactor IRQ handler in order to:
> > - enter and exit chained IRQ
> > - use for_each_set_bit() helper
> 
> Please split these two changes into the dedicated patches.

Will do in v2. Hope your Tested-by holds.

> After this
> Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

Thanks!

-- 
With Best Regards,
Andy Shevchenko


