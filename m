Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D309B108D4D
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Nov 2019 12:54:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725868AbfKYLyD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Nov 2019 06:54:03 -0500
Received: from mga05.intel.com ([192.55.52.43]:61760 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725828AbfKYLyD (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 25 Nov 2019 06:54:03 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Nov 2019 03:54:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,241,1571727600"; 
   d="scan'208";a="260377407"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by FMSMGA003.fm.intel.com with ESMTP; 25 Nov 2019 03:54:01 -0800
Received: from andy by smile with local (Exim 4.93-RC1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iZCwL-0002B6-MU; Mon, 25 Nov 2019 13:54:01 +0200
Date:   Mon, 25 Nov 2019 13:54:01 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v1] gpio: lynxpoint: Setup correct IRQ handlers
Message-ID: <20191125115401.GB32742@smile.fi.intel.com>
References: <20191118180251.31439-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdYUxwhf_qNpDTyhdy9_A119yE3NaKshwg_eJhJ41M_dTg@mail.gmail.com>
 <20191125115327.GA32742@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191125115327.GA32742@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 25, 2019 at 01:53:27PM +0200, Andy Shevchenko wrote:
> On Thu, Nov 21, 2019 at 03:02:44PM +0100, Linus Walleij wrote:
> > On Mon, Nov 18, 2019 at 7:02 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:

> > This close to the merge window it is better if I just apply stuff
> > I think.
> 
> Thank you! Works for me.

Ditto for the rest (to avoid repeating this).

-- 
With Best Regards,
Andy Shevchenko


