Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 106F0268ECF
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Sep 2020 17:03:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726046AbgINPCE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Sep 2020 11:02:04 -0400
Received: from mga04.intel.com ([192.55.52.120]:49260 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725967AbgINPBg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 14 Sep 2020 11:01:36 -0400
IronPort-SDR: BcuBzZTJxIjfG3FtDMngD/iEV3pw2bLEQ/CrzuZzQH7HuzuO5Ht5RBuBJZB+cVIT0KQcor4Afx
 1vq7HBGxrEug==
X-IronPort-AV: E=McAfee;i="6000,8403,9744"; a="156483482"
X-IronPort-AV: E=Sophos;i="5.76,426,1592895600"; 
   d="scan'208";a="156483482"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2020 08:01:30 -0700
IronPort-SDR: rOSgQ4g1YqSkNXQkuKUS4Rl7OON1iIYZ4e05jgdB18/cP/VZ1is0FVOKJ3p41LbAeZCBZSlgFJ
 CxDd6u+i3z2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,426,1592895600"; 
   d="scan'208";a="335309231"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 14 Sep 2020 08:01:29 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kHpyv-00Gcpg-TS; Mon, 14 Sep 2020 18:01:25 +0300
Date:   Mon, 14 Sep 2020 18:01:25 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Kent Gibson <warthog618@gmail.com>,
        Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v2] gpiolib: Fix line event handling in syscall
 compatible mode
Message-ID: <20200914150125.GH3956970@smile.fi.intel.com>
References: <20200914143743.39871-1-andriy.shevchenko@linux.intel.com>
 <CAK8P3a1Eh=UuGZSEduHvutK8VYyWJcovheoWYXykwRoQuWAqtQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a1Eh=UuGZSEduHvutK8VYyWJcovheoWYXykwRoQuWAqtQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 14, 2020 at 04:55:31PM +0200, Arnd Bergmann wrote:
> On Mon, Sep 14, 2020 at 4:37 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > The introduced line even handling ABI in the commit
> >
> >   61f922db7221 ("gpio: userspace ABI for reading GPIO line events")
> >
> > missed the fact that 64-bit kernel may serve for 32-bit applications.
> > In such case the very first check in the lineevent_read() will fail
> > due to alignment differences.
> >
> > To workaround this introduce lineeven_to_user() helper which returns actual
> > size of the structure and copies its content to user if asked.
> >
> > Fixes: 61f922db7221 ("gpio: userspace ABI for reading GPIO line events")
> > Suggested-by: Arnd Bergmann <arnd@arndb.de>
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Acked-by: Arnd Bergmann <arnd@arndb.de>

Thanks!

> > diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> > index e6c9b78adfc2..95af4a470f1e 100644
> > --- a/drivers/gpio/gpiolib-cdev.c
> > +++ b/drivers/gpio/gpiolib-cdev.c
> > @@ -423,6 +423,21 @@ static __poll_t lineevent_poll(struct file *file,
> >         return events;
> >  }
> >
> > +static ssize_t lineevent_get_size(void)
> > +{
> > +#ifdef __x86_64__
> > +       /* i386 has no padding after 'id' */
> > +       if (in_ia32_syscall()) {
> 
> Christoph Hellwig has recently suggested adding a new macro for this
> that would be always available and just evaluate to false on other
> architectures.
> 
> I'd just merge your version for now and backport to to stable kernels,
> but change this instance and a couple of others to use the new
> macro in mainline afterwards.
> 
> Incidentally that would also address CONFIG_OABI_COMPAT
> mode, if anyone cares.

Good to know (for both items).

-- 
With Best Regards,
Andy Shevchenko


