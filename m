Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED72C1D83DC
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2020 20:08:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729916AbgERSIK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 May 2020 14:08:10 -0400
Received: from mga04.intel.com ([192.55.52.120]:52238 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387476AbgERSIG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 18 May 2020 14:08:06 -0400
IronPort-SDR: hQHbOb/DZPGZdebzS3UG19w42BzD+mKIbMt0VDx7je8lwQEjXz0K+2qU+v6ioPdFN85dYH3NOi
 1+LHN3Q4P1Zg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2020 11:08:05 -0700
IronPort-SDR: 0dxA0UFvx+Pb/ojvB39UQ7fqxhU6WCZl/m+Mehkl0pgpkUwr4kyVL7U5kDAPffCMRmpYb7xXpb
 22bfwgRXV67w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,407,1583222400"; 
   d="scan'208";a="411348411"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004.jf.intel.com with ESMTP; 18 May 2020 11:08:03 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jakBK-007U6m-Ov; Mon, 18 May 2020 21:08:06 +0300
Date:   Mon, 18 May 2020 21:08:06 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 4/4] gpio: dwapb: Remove unneeded has_irq member in
 struct dwapb_port_property
Message-ID: <20200518180806.GQ1634618@smile.fi.intel.com>
References: <20200518174138.19367-1-andriy.shevchenko@linux.intel.com>
 <20200518174138.19367-4-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200518174138.19367-4-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 18, 2020 at 08:41:38PM +0300, Andy Shevchenko wrote:
> has_irq member of struct dwapb_port_property is used only in one place,
> so, make it local test instead and remove from the structure.
> This local test is using memchr_inv() which is quite effective in comparison
> to the original loop and possible little overhead can be neglected.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Serge Semin <fancer.lancer@gmail.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> ---
> v2:
>  - fixed compilation error (kbuild bot)

>  - added Lee into Cc

Lee, JFYI, you have not been forgotten in the v1, this is due to missed change
in the MFD driver in v1 and since kbuild bot reported it this is the first
version which includes MFD changes.

>  - moved memchr_inv() here (Serge)

-- 
With Best Regards,
Andy Shevchenko


