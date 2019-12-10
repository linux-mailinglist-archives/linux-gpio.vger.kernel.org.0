Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51070118A17
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2019 14:44:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727131AbfLJNog (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Dec 2019 08:44:36 -0500
Received: from mga01.intel.com ([192.55.52.88]:17284 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727061AbfLJNog (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 10 Dec 2019 08:44:36 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Dec 2019 05:44:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,299,1571727600"; 
   d="scan'208";a="225152211"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002.jf.intel.com with ESMTP; 10 Dec 2019 05:44:34 -0800
Received: from andy by smile with local (Exim 4.93-RC7)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iefoY-00039Y-6r; Tue, 10 Dec 2019 15:44:34 +0200
Date:   Tue, 10 Dec 2019 15:44:34 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v1 1/2] gpiolib: Fix line event handling in compatible
 mode
Message-ID: <20191210134434.GU32742@smile.fi.intel.com>
References: <20191204194229.64251-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=Mc88eiLtu7_0y51nGDzM0nRmwaOurLx9isf=qRB0uj7KA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mc88eiLtu7_0y51nGDzM0nRmwaOurLx9isf=qRB0uj7KA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 10, 2019 at 10:06:04AM +0100, Bartosz Golaszewski wrote:
> śr., 4 gru 2019 o 20:42 Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> napisał(a):
> >
> > The introduced line even handling ABI in the commit
> >
> >   61f922db7221 ("gpio: userspace ABI for reading GPIO line events")
> >
> > missed the fact that 64-bit kernel may serve for 32-bit applications.
> > In such case the very first check in the lineevent_read() will fail
> > due to alignment differences.
> >
> > To workaround this we do several things here:
> > - put warning comment to UAPI header near to the structure description
> > - derive the size of the structure in the compatible mode from its members
> > - check for the size of this structure in the ->read() callback
> > - return only one event in the compatible mode at a time
> >
> > Above mitigation will work at least with libgpiod which does one event
> > at a time.
> >
> > Since the bug hasn't been reported earlier we assume that there is close
> > to zero actual users of the compatible mode to monitor GPIO events and thus
> > we might consider to rework this ABI in the future.
> >
> 
> How come this only affects the read operation but not the structures
> passed as arguments to ioctl() calls?

On x86 the rest of the structures is naturally aligned by 8 bytes.

But you are right, the ABI is broken more widely than simple ->read().

-- 
With Best Regards,
Andy Shevchenko


