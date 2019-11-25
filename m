Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43970108D7A
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Nov 2019 13:02:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726980AbfKYMCh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Nov 2019 07:02:37 -0500
Received: from mga06.intel.com ([134.134.136.31]:48778 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725868AbfKYMCh (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 25 Nov 2019 07:02:37 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Nov 2019 04:02:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,241,1571727600"; 
   d="scan'208";a="358825784"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004.jf.intel.com with ESMTP; 25 Nov 2019 04:02:35 -0800
Received: from andy by smile with local (Exim 4.93-RC1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iZD4d-0002Ht-CW; Mon, 25 Nov 2019 14:02:35 +0200
Date:   Mon, 25 Nov 2019 14:02:35 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v1 0/8] pinctrl: intel: Move Lynxpoint to pin control
 umbrella
Message-ID: <20191125120235.GC32742@smile.fi.intel.com>
References: <20191106144829.32275-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdZ39j=Ld4WW0JRv0XCdNqXVD+Mgo4RJKgykAN0Z7H8V1w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZ39j=Ld4WW0JRv0XCdNqXVD+Mgo4RJKgykAN0Z7H8V1w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 13, 2019 at 10:54:36AM +0100, Linus Walleij wrote:
> On Wed, Nov 6, 2019 at 3:48 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > Intel Lynxpoint GPIO is actually half way to the Chassis specification that has
> > been established starting from Intel Skylake. It has some pin control
> > properties we may utilize. To achieve this, move the driver under pin control
> > umbrella and do a bunch of clean ups.
> >
> > This is the first step. Next step will be to convert it to the actual pin
> > control driver.
> >
> > The series has been tested on Harrisbeach Ultrabook where Lynxpoint GPIO is
> > exposed to the OS.
> >
> > Andy Shevchenko (8):
> >   pinctrl: lynxpoint: Move GPIO driver to pin controller folder
> >   pinctrl: lynxpoint: Use raw_spinlock for locking
> >   pinctrl: lynxpoint: Correct amount of pins
> >   pinctrl: lynxpoint: Keep pointer to struct device instead of its
> >     container
> >   pinctrl: lynxpoint: Use %pR to print IO resource
> >   pinctrl: lynxpoint: Switch to memory mapped IO accessors
> >   pinctrl: lynxpoint: Convert unsigned to unsigned int
> >   pinctrl: lynxpoint: Move ->remove closer to ->probe()
> 
> I'm a big fan of this refactoring.

Glad we are on the same page about it!

> Can you send this series as a separate pull request that I can pull into
> the GPIO tree rather than pin control, or maybe both, once you're
> pleased with it?

I have done more and it still requires some work. I will send v2 after merge
window being closed.

-- 
With Best Regards,
Andy Shevchenko


