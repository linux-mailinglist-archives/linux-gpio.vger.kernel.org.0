Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7520240562
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Aug 2020 13:33:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726379AbgHJLdW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Aug 2020 07:33:22 -0400
Received: from mga18.intel.com ([134.134.136.126]:10394 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726330AbgHJLdW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 10 Aug 2020 07:33:22 -0400
IronPort-SDR: nD5Y6+JuvY5h8lI3IjxTut4IGbvsPr9Tju0Il2mB9mtOwJQ/8iyJMBsp3NENAJEw1ZVr9mC6nW
 zk7fxePtdM8A==
X-IronPort-AV: E=McAfee;i="6000,8403,9708"; a="141122168"
X-IronPort-AV: E=Sophos;i="5.75,457,1589266800"; 
   d="scan'208";a="141122168"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2020 04:33:21 -0700
IronPort-SDR: 0n4QkhfNXU1lYEubDVdtHGJDczh/nRNsQqYEFly8zTCXdDyD0ZQ/8qrjJR7BWetnrQS8nIYKVU
 lpleHfgUoIUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,457,1589266800"; 
   d="scan'208";a="324412953"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 10 Aug 2020 04:33:20 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1k55gb-007bfH-Vn; Mon, 10 Aug 2020 14:09:49 +0300
Date:   Mon, 10 Aug 2020 14:09:49 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v1 1/3] gpio: aggregator: Refactor ->{get,set}_multiple()
 to make Sparse happy
Message-ID: <20200810110949.GQ3703480@smile.fi.intel.com>
References: <20200718212608.65328-1-andriy.shevchenko@linux.intel.com>
 <20200718212608.65328-2-andriy.shevchenko@linux.intel.com>
 <CAMuHMdV3vK3C-pTDDYx9YOUi1fQBdC75R0D3rrytPkE6S2DChQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdV3vK3C-pTDDYx9YOUi1fQBdC75R0D3rrytPkE6S2DChQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 05, 2020 at 04:56:06PM +0200, Geert Uytterhoeven wrote:
> On Sat, Jul 18, 2020 at 11:26 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:

...

> ERROR: code indent should use tabs where possible

...

> ERROR: code indent should use tabs where possible

> With the above checkpatch errors fixed:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, I'll send it separately, patch 2 needs to be thought thru a bit more.

-- 
With Best Regards,
Andy Shevchenko


