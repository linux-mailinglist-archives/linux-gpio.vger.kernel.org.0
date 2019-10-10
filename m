Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D305D21B2
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Oct 2019 09:38:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732671AbfJJHiI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Oct 2019 03:38:08 -0400
Received: from mga03.intel.com ([134.134.136.65]:41920 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732947AbfJJHXH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 10 Oct 2019 03:23:07 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Oct 2019 00:23:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,279,1566889200"; 
   d="scan'208";a="187869642"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 10 Oct 2019 00:23:05 -0700
Received: from andy by smile with local (Exim 4.92.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iISmu-0001um-GO; Thu, 10 Oct 2019 10:23:04 +0300
Date:   Thu, 10 Oct 2019 10:23:04 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Linux GPIO <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH 2/5] gpiolib: Initialize the hardware with a callback
Message-ID: <20191010072304.GL32742@smile.fi.intel.com>
References: <20191009165056.76580-1-andriy.shevchenko@linux.intel.com>
 <20191009165056.76580-3-andriy.shevchenko@linux.intel.com>
 <44c7e540-5390-78df-26db-7251866ac6ad@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <44c7e540-5390-78df-26db-7251866ac6ad@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 09, 2019 at 09:44:31PM +0200, Hans de Goede wrote:
> On 09-10-2019 18:50, Andy Shevchenko wrote:
> > After changing the drivers to use GPIO core to add an IRQ chip
> > it appears that some of them requires a hardware initialization
> > before adding the IRQ chip.
> > 
> > Add an optional callback ->init_hw() to allow that drivers
> > to initialize hardware if needed.
> > 
> > This change is a part of the fix NULL pointer dereference
> > brought to the several drivers recently.
> > 
> > Cc: Hans de Goede <hdegoede@redhat.com>
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Hmm, IIRC Linus Walleij already added a callback for initializing the
> mask before the irchip gets initialized which is basically intended for
> what you want this callback for I think ?

This is not about the mask, it's about hardware to be prepared before enabling.
Also init_valid_mask() will allocate memory which won't be needed.

-- 
With Best Regards,
Andy Shevchenko


