Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD926378C0F
	for <lists+linux-gpio@lfdr.de>; Mon, 10 May 2021 14:23:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232906AbhEJMX0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 May 2021 08:23:26 -0400
Received: from mga17.intel.com ([192.55.52.151]:61489 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232963AbhEJLmp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 10 May 2021 07:42:45 -0400
IronPort-SDR: +Dlmg2nO2oGtVzc12S7huKkcr/sium3IlBBJhPtcow91felFSa7aOYKsdoIS++J4YwJZoy75QC
 EvMI1yPxQM8w==
X-IronPort-AV: E=McAfee;i="6200,9189,9979"; a="179437058"
X-IronPort-AV: E=Sophos;i="5.82,287,1613462400"; 
   d="scan'208";a="179437058"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2021 04:41:31 -0700
IronPort-SDR: tKjJSy1dxkwBuZiaBhrEkYJzafCby4NctDWZ2T2FDg6VyyYnVbn/PgUEhIW1c3bu6yr5y8KaG7
 BjbzMAouXG3w==
X-IronPort-AV: E=Sophos;i="5.82,287,1613462400"; 
   d="scan'208";a="541176921"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2021 04:41:29 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lg4Hu-00B9oP-GR; Mon, 10 May 2021 14:41:26 +0300
Date:   Mon, 10 May 2021 14:41:26 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Russell King <linux@armlinux.org.uk>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v1] ARM: Drop ARCH_NR_GPIOS definition
Message-ID: <YJkb5unmBKSgbaye@smile.fi.intel.com>
References: <20201012154709.68521-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdZCrEpXq1DrWJ7Qq4P3xbOAcQQ3qUe0k0J8_FQv2vpZSg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZCrEpXq1DrWJ7Qq4P3xbOAcQQ3qUe0k0J8_FQv2vpZSg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 02, 2021 at 04:51:37PM +0100, Linus Walleij wrote:
> Hi Andy,
> 
> On Mon, Oct 12, 2020 at 5:47 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > The conditional by the generic header is the same,
> > hence drop unnecessary duplication.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> sorry for extremely slow reply.
> 
> I think we could merge this into the GPIO tree if Russell is OK with it,
> alternatively put it in Russell's patch tracker. It looks absolutely correct.

I have sent a v2 (same patch, just in case somebody lost this thread).

-- 
With Best Regards,
Andy Shevchenko


