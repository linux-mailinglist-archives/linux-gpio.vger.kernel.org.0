Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C9D833BD6B
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Mar 2021 15:37:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236381AbhCOOfT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Mar 2021 10:35:19 -0400
Received: from mga11.intel.com ([192.55.52.93]:43311 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236206AbhCOOev (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 Mar 2021 10:34:51 -0400
IronPort-SDR: g7IVeUrWhZIslGevpZRSnYlT5A+7xEPohitVdDp8StW7HKvMnIMthQ7vfm7/zkeZCxNh4mRcai
 5xXs2DMejg3g==
X-IronPort-AV: E=McAfee;i="6000,8403,9923"; a="185737379"
X-IronPort-AV: E=Sophos;i="5.81,249,1610438400"; 
   d="scan'208";a="185737379"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2021 07:34:49 -0700
IronPort-SDR: lhYcnUSY8vMDAX/iSTPuMCxtIWdiqW1SNi23o6Kk6P4T56JL+65+nAkyfj+NMAVbA6yOUvLmeG
 7Lk/4M2nRHKg==
X-IronPort-AV: E=Sophos;i="5.81,249,1610438400"; 
   d="scan'208";a="449383288"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2021 07:34:47 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lLoIu-00Chac-SN; Mon, 15 Mar 2021 16:34:44 +0200
Date:   Mon, 15 Mar 2021 16:34:44 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Marek Vasut <marex@denx.de>,
        Roman Guskov <rguskov@dh-electronics.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Read "gpio-line-names" from a firmware
 node
Message-ID: <YE9whHhaa2XavKfj@smile.fi.intel.com>
References: <20210305120240.42830-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=Mfye=O4mMiK01Q6Ok+ztSfMwMcrfaZSs+LhRxi=AM+C2w@mail.gmail.com>
 <YE8z+ohM9abBs9SD@smile.fi.intel.com>
 <YE9YGGB+k7CsCNDI@smile.fi.intel.com>
 <CAMRc=McLsamBwe8hSob11ustk2GUzOfYh7CcqNtxsM+6vgPENw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=McLsamBwe8hSob11ustk2GUzOfYh7CcqNtxsM+6vgPENw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 15, 2021 at 03:04:37PM +0100, Bartosz Golaszewski wrote:
> On Mon, Mar 15, 2021 at 1:50 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Mon, Mar 15, 2021 at 12:16:26PM +0200, Andy Shevchenko wrote:
> > > On Mon, Mar 15, 2021 at 10:01:47AM +0100, Bartosz Golaszewski wrote:
> > > > On Fri, Mar 5, 2021 at 1:03 PM Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > > Unfortunately while this may fix the particular use-case on STM32, it
> > > > breaks all other users as the 'gpio-line-names' property doesn't live
> > > > on dev_fwnode(&gdev->dev) but on dev_fwnode(chip->parent).
> > > >
> > > > How about we first look for this property on the latter and only if
> > > > it's not present descend down to the former fwnode?
> > >
> > > Oops, I have tested on x86 and it worked the same way.
> > >
> > > Lemme check this, but I think the issue rather in ordering when we apply fwnode
> > > to the newly created device and when we actually retrieve gpio-line-names
> > > property.
> >
> > Hmm... I can't see how it's possible can be. Can you provide a platform name
> > and pointers to the DTS that has been broken by the change?
> >
> 
> I noticed it with gpio-mockup (libgpiod tests failed on v5.12-rc3) and
> the WiP gpio-sim - but it's the same on most DT platforms. The node
> that contains the `gpio-line-names` is the one associated with the
> platform device passed to the GPIO driver. The gpiolib then creates
> another struct device that becomes the child of that node but it
> doesn't copy the parent's properties to it (nor should it).
> 
> Every driver that reads device properties does it from the parent
> device, not the one in gdev - whether it uses of_, fwnode_ or generic
> device_ properties.

What you are telling contradicts with the idea of copying parent's fwnode
(or OF node) in the current code.

Basically to access the properties we have to use either what specific driver
supplied (by setting gpiochip->of_node or by leaving it NULL and in this case
gpiochip_add_data_with_key() will copy it from the parent.

That said, we shouldn't care about parent vs. GPIO device fwnode when reading
properties. So, bug is somewhere else.

In any case, I will test with the gpio-mockup, thanks!

-- 
With Best Regards,
Andy Shevchenko


