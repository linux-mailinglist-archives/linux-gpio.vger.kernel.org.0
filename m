Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39895FB17B
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2019 14:40:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726521AbfKMNkC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Nov 2019 08:40:02 -0500
Received: from mga17.intel.com ([192.55.52.151]:14325 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726434AbfKMNkC (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 13 Nov 2019 08:40:02 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Nov 2019 05:40:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,300,1569308400"; 
   d="scan'208";a="202745748"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008.fm.intel.com with ESMTP; 13 Nov 2019 05:40:00 -0800
Received: from andy by smile with local (Exim 4.93-RC1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iUssK-0003ol-9u; Wed, 13 Nov 2019 15:40:00 +0200
Date:   Wed, 13 Nov 2019 15:40:00 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v1 1/8] pinctrl: lynxpoint: Move GPIO driver to pin
 controller folder
Message-ID: <20191113134000.GH32742@smile.fi.intel.com>
References: <20191106144829.32275-1-andriy.shevchenko@linux.intel.com>
 <20191106144829.32275-2-andriy.shevchenko@linux.intel.com>
 <CACRpkdYGBk_S4kF2DfZ9abMOj5oH=1rRQ_VBuO3pK_PPbxCUSg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdYGBk_S4kF2DfZ9abMOj5oH=1rRQ_VBuO3pK_PPbxCUSg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 13, 2019 at 10:54:28AM +0100, Linus Walleij wrote:
> On Wed, Nov 6, 2019 at 3:48 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> This Kconfig symbol goes away:
> 
> > -config GPIO_LYNXPOINT
> 
> This one appears:
> 
> > +config PINCTRL_LYNXPOINT
> 
> As long as you're certain this will not cause any problems it's
> fine by me (thinking people who have old configs etc).

No. it's not a problem as long as people run `make oldconfig`.
We assume that distros do that way and carefully check each new option.
So, we consider no problem is here.

-- 
With Best Regards,
Andy Shevchenko


