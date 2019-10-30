Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF8E6EA177
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2019 17:11:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726800AbfJ3QKq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Oct 2019 12:10:46 -0400
Received: from mga03.intel.com ([134.134.136.65]:47204 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726175AbfJ3QKq (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 30 Oct 2019 12:10:46 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Oct 2019 09:10:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,247,1569308400"; 
   d="scan'208";a="211356119"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
  by fmsmga001.fm.intel.com with SMTP; 30 Oct 2019 09:10:42 -0700
Received: by lahna (sSMTP sendmail emulation); Wed, 30 Oct 2019 18:10:41 +0200
Date:   Wed, 30 Oct 2019 18:10:41 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH] gpio/pinctrl: Add pin ranges before gpiochip
Message-ID: <20191030161041.GI2593@lahna.fi.intel.com>
References: <20191030144940.21133-1-linus.walleij@linaro.org>
 <0e8c15d9-c805-c1ee-f8f0-528866c7ac1c@redhat.com>
 <9d21b3fe-852b-a430-4e71-af0742edcd9b@redhat.com>
 <CACRpkdb851eSyqkz5nDB6affd4_JO5fhWHkmve1QoMGxpYswCA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdb851eSyqkz5nDB6affd4_JO5fhWHkmve1QoMGxpYswCA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 30, 2019 at 05:04:21PM +0100, Linus Walleij wrote:
> On Wed, Oct 30, 2019 at 5:01 PM Hans de Goede <hdegoede@redhat.com> wrote:
> 
> > For 5.4 we should probably revert
> > "gpio: merrifield: Pass irqchip when adding gpiochip"
> > and the fixes added on top of it, since AFAICT _AEI handling
> > will be broken on merrifield after this change too.
> >
> > So I suggest that we revert the following commits (in revert order):
> >
> > 4c87540940cbc7ddbe9674087919c605fd5c2ef1 "gpio: merrifield: Move hardware initialization to callback"
> > 6658f87f219427ee776c498e07c878eb5cad1be2 "gpio: merrifield: Restore use of irq_base"
> > 8f86a5b4ad679e4836733b47414226074eee4e4d "gpio: merrifield: Pass irqchip when adding gpiochip"
> >
> > That seems like the safest thing to do at this point in the cycle.
> 
> OK are the Intel people OK with this?

I'm fine but I'll leave this to Andy since that's his stuff.

> If so I'll go and revert them.
> 
> Mika: will any of the pin control fixes you sent collide with
> this? (I guess not...)

No they should not, they don't touch the merrifield driver.
