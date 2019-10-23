Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44ECDE1389
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2019 10:01:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390055AbfJWIBO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Oct 2019 04:01:14 -0400
Received: from mga02.intel.com ([134.134.136.20]:2100 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732328AbfJWIBO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 23 Oct 2019 04:01:14 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Oct 2019 01:01:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,220,1569308400"; 
   d="scan'208";a="228034694"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002.fm.intel.com with ESMTP; 23 Oct 2019 01:01:10 -0700
Received: from andy by smile with local (Exim 4.92.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iNBZt-0007Av-8P; Wed, 23 Oct 2019 11:01:09 +0300
Date:   Wed, 23 Oct 2019 11:01:09 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Yury Norov <yury.norov@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        William Breathitt Gray <vilhelm.gray@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>
Subject: Re: [PATCH v2 10/11] gpio: pca953x: Convert to use bitmap API
Message-ID: <20191023080109.GK32742@smile.fi.intel.com>
References: <20191022172922.61232-1-andriy.shevchenko@linux.intel.com>
 <20191022172922.61232-11-andriy.shevchenko@linux.intel.com>
 <CAMuHMdUUvVdg8w0evV4zjrqis9e9Jak_qTnkufYT5wQHUn9j-A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUUvVdg8w0evV4zjrqis9e9Jak_qTnkufYT5wQHUn9j-A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 22, 2019 at 08:03:00PM +0200, Geert Uytterhoeven wrote:
> On Tue, Oct 22, 2019 at 7:29 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > Instead of customized approach convert the driver to use bitmap API.

> >  #define MAX_BANK 5
> >  #define BANK_SZ 8
> > +#define MAX_LINE       (MAX_BANK * BANK_SZ)
> 
> Given (almost) everything is now bitmap (i.e. long [])-based, you might
> as well increase MAX_BANK to a multiple of 4 or 8, e.g. 8.

We can do it any time when we will really need it.

(Yes, I understand that we have no penalty for the change anyway)

-- 
With Best Regards,
Andy Shevchenko


