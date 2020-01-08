Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAB8C134A3E
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jan 2020 19:10:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728877AbgAHSKe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jan 2020 13:10:34 -0500
Received: from mga17.intel.com ([192.55.52.151]:20608 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726781AbgAHSKe (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 8 Jan 2020 13:10:34 -0500
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 08 Jan 2020 10:10:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,410,1571727600"; 
   d="scan'208";a="271895825"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by FMSMGA003.fm.intel.com with ESMTP; 08 Jan 2020 10:10:31 -0800
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1ipFmp-0006Ns-GP; Wed, 08 Jan 2020 20:10:31 +0200
Date:   Wed, 8 Jan 2020 20:10:31 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Yury Norov <yury.norov@gmail.com>,
        linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        William Breathitt Gray <vilhelm.gray@gmail.com>,
        Yury Norov <ynorov@marvell.com>
Subject: Re: [PATCH v2 07/11] bitmap: Introduce bitmap_replace() helper
Message-ID: <20200108181031.GH32742@smile.fi.intel.com>
References: <20191022172922.61232-1-andriy.shevchenko@linux.intel.com>
 <20191022172922.61232-8-andriy.shevchenko@linux.intel.com>
 <20191226161559.GA26197@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191226161559.GA26197@roeck-us.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 26, 2019 at 08:15:59AM -0800, Guenter Roeck wrote:
> Hi,
> 
> On Tue, Oct 22, 2019 at 08:29:18PM +0300, Andy Shevchenko wrote:
> > In some drivers we want to have a single operation over bitmap which is
> > an equivalent to:
> > 
> > 	*dst = (*old & ~(*mask)) | (*new & *mask)
> > 
> > Introduce bitmap_replace() helper for this.
> > 
> > Cc: Yury Norov <ynorov@marvell.com>
> > Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> This patch results in the following boot log messages on various architectures.
> I have seen it on arm and mipsel, but others may be affected as well.

Thanks for report. I can reproduce on x86_32, and not on x86_64.
I'll look at it.

> 
> test_bitmap: [lib/test_bitmap.c:282] bitmaps contents differ: expected "0-1,4-5,8,12-13,16,20-21,24,28,32-33,36-37,40-41,44-45,48-49,52-53,56-57,60-61", got "0-2,4-5,8,12-13,16,20-21,24,28,32-33,36-37,40-41,44-45,48-49,52-53,55-57,60-61"
> test_bitmap: [lib/test_bitmap.c:286] bitmaps contents differ: expected "0,4,8-9,12,16-17,20,24-25,28-29,32-34,36-38,40-42,44-46,48-50,52-54,56-58,60-62", got "0,4,6,8-10,12,14,16-18,20,22,24-26,28-30,32-54,56-63"
> test_bitmap: [lib/test_bitmap.c:290] bitmaps contents differ: expected "0-1,4-5,8,12-13,16,20-21,24,28,32-33,36-37,40-41,44-45,48-49,52-53,56-57,60-61", got "0-2,4-5,8,12-13,16,20-21,24,28,32-33,36-37,40-41,44-45,48-49,52-53,55-57,60-61"
> test_bitmap: [lib/test_bitmap.c:294] bitmaps contents differ: expected "0,4,8-9,12,16-17,20,24-25,28-29,32-34,36-38,40-42,44-46,48-50,52-54,56-58,60-62", got "0,4,6,8-10,12,14,16-18,20,22,24-26,28-30,32-54,56-63"
> 
> Guenter

-- 
With Best Regards,
Andy Shevchenko


