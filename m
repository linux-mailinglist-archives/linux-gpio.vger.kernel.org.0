Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F09AF1427AF
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jan 2020 10:54:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726075AbgATJya (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Jan 2020 04:54:30 -0500
Received: from mga11.intel.com ([192.55.52.93]:60863 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726039AbgATJy3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 20 Jan 2020 04:54:29 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 20 Jan 2020 01:54:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,341,1574150400"; 
   d="scan'208";a="274969721"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by FMSMGA003.fm.intel.com with ESMTP; 20 Jan 2020 01:54:26 -0800
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1itTlL-0008P3-Qm; Mon, 20 Jan 2020 11:54:27 +0200
Date:   Mon, 20 Jan 2020 11:54:27 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v4 02/13] gpiolib: have a single place of calling
 set_config()
Message-ID: <20200120095427.GE32742@smile.fi.intel.com>
References: <20191224120709.18247-1-brgl@bgdev.pl>
 <20191224120709.18247-3-brgl@bgdev.pl>
 <CAMuHMdWigj9_CDdDD49qU-y7r+he53v1NEKE9_0RBQCFUrY-Qw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWigj9_CDdDD49qU-y7r+he53v1NEKE9_0RBQCFUrY-Qw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 20, 2020 at 09:44:43AM +0100, Geert Uytterhoeven wrote:
> On Tue, Dec 24, 2019 at 1:08 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > Instead of calling the gpiochip's set_config() callback directly and
> > checking its existence every time - just add a new routine that performs
> > this check internally. Call it in gpio_set_config() and
> > gpiod_set_transitory(). Also call it in gpiod_set_debounce() and drop
> > the check for chip->set() as it's irrelevant to this config option.

...

> >         config = PIN_CONF_PACKED(mode, arg);
> > -       return gc->set_config ? gc->set_config(gc, offset, config) : -ENOTSUPP;
> > +       return gpio_do_set_config(gc, offset, mode);
> 
> These two lines are not equivalent: the new code no longer uses the
> packed value of mode and arg!

Good catch!
It's a regression (pin control drivers expects arg to be 1 in case it has been
called thru GPIO framework to set "default" values in terms of certain driver)
and below mentioned commits must be reverted. This one seems has a typo which
must be fixed.

> Hence this leads to subsequent cleanups in commits e5e42ad224a040f9
> ("gpiolib: remove set but not used variable 'config'") and d18fddff061d2796
> ("gpiolib: Remove duplicated function gpio_do_set_config()").

> However, what was the purpose of the PIN_CONF_PACKED() translation?
> Why is it no longer needed?

-- 
With Best Regards,
Andy Shevchenko


