Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC48F108D4C
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Nov 2019 12:53:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727110AbfKYLx2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Nov 2019 06:53:28 -0500
Received: from mga01.intel.com ([192.55.52.88]:30544 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725828AbfKYLx2 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 25 Nov 2019 06:53:28 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Nov 2019 03:53:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,241,1571727600"; 
   d="scan'208";a="408284863"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga005.fm.intel.com with ESMTP; 25 Nov 2019 03:53:27 -0800
Received: from andy by smile with local (Exim 4.93-RC1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iZCvn-0002Ak-7F; Mon, 25 Nov 2019 13:53:27 +0200
Date:   Mon, 25 Nov 2019 13:53:27 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v1] gpio: lynxpoint: Setup correct IRQ handlers
Message-ID: <20191125115327.GA32742@smile.fi.intel.com>
References: <20191118180251.31439-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdYUxwhf_qNpDTyhdy9_A119yE3NaKshwg_eJhJ41M_dTg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdYUxwhf_qNpDTyhdy9_A119yE3NaKshwg_eJhJ41M_dTg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 21, 2019 at 03:02:44PM +0100, Linus Walleij wrote:
> On Mon, Nov 18, 2019 at 7:02 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > When commit 75e99bf5ed8f ("gpio: lynxpoint: set default handler to be
> > handle_bad_irq()") switched default handler to be handle_bad_irq() the
> > lp_irq_type() function remained untouched. It means that even request_irq()
> > can't change the handler and we are not able to handle IRQs properly anymore.
> > Fix it by setting correct handlers in the lp_irq_type() callback.
> >
> > Fixes: 75e99bf5ed8f ("gpio: lynxpoint: set default handler to be handle_bad_irq()")
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Patch applied!
> This close to the merge window it is better if I just apply stuff
> I think.

Thank you! Works for me.

> 
> Thanks for your hard work on this!

-- 
With Best Regards,
Andy Shevchenko


