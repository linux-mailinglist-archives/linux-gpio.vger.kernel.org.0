Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9FF0ECE27
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Nov 2019 11:53:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbfKBKxb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 2 Nov 2019 06:53:31 -0400
Received: from mga11.intel.com ([192.55.52.93]:44340 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725268AbfKBKxb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 2 Nov 2019 06:53:31 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 02 Nov 2019 03:53:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,259,1569308400"; 
   d="scan'208";a="191251212"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga007.jf.intel.com with ESMTP; 02 Nov 2019 03:53:27 -0700
Received: from andy by smile with local (Exim 4.92.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iQr27-00008s-7J; Sat, 02 Nov 2019 12:53:27 +0200
Date:   Sat, 2 Nov 2019 12:53:27 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH] gpio/pinctrl: Add pin ranges before gpiochip
Message-ID: <20191102105327.GE32742@smile.fi.intel.com>
References: <20191030144940.21133-1-linus.walleij@linaro.org>
 <0e8c15d9-c805-c1ee-f8f0-528866c7ac1c@redhat.com>
 <9d21b3fe-852b-a430-4e71-af0742edcd9b@redhat.com>
 <CACRpkdb851eSyqkz5nDB6affd4_JO5fhWHkmve1QoMGxpYswCA@mail.gmail.com>
 <20191030161041.GI2593@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191030161041.GI2593@lahna.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 30, 2019 at 06:10:41PM +0200, Mika Westerberg wrote:
> On Wed, Oct 30, 2019 at 05:04:21PM +0100, Linus Walleij wrote:
> > On Wed, Oct 30, 2019 at 5:01 PM Hans de Goede <hdegoede@redhat.com> wrote:
> > 
> > > For 5.4 we should probably revert
> > > "gpio: merrifield: Pass irqchip when adding gpiochip"
> > > and the fixes added on top of it, since AFAICT _AEI handling
> > > will be broken on merrifield after this change too.
> > >
> > > So I suggest that we revert the following commits (in revert order):
> > >
> > > 4c87540940cbc7ddbe9674087919c605fd5c2ef1 "gpio: merrifield: Move hardware initialization to callback"
> > > 6658f87f219427ee776c498e07c878eb5cad1be2 "gpio: merrifield: Restore use of irq_base"
> > > 8f86a5b4ad679e4836733b47414226074eee4e4d "gpio: merrifield: Pass irqchip when adding gpiochip"
> > >
> > > That seems like the safest thing to do at this point in the cycle.
> > 
> > OK are the Intel people OK with this?
> 
> I'm fine but I'll leave this to Andy since that's his stuff.

Ack.

-- 
With Best Regards,
Andy Shevchenko


