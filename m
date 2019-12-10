Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA21C118E48
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2019 17:55:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727619AbfLJQzv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Dec 2019 11:55:51 -0500
Received: from mga09.intel.com ([134.134.136.24]:35324 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727541AbfLJQzv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 10 Dec 2019 11:55:51 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Dec 2019 08:55:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,300,1571727600"; 
   d="scan'208";a="413181285"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga005.fm.intel.com with ESMTP; 10 Dec 2019 08:55:48 -0800
Received: from andy by smile with local (Exim 4.93-RC7)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1ieinc-0006Af-O1; Tue, 10 Dec 2019 18:55:48 +0200
Date:   Tue, 10 Dec 2019 18:55:48 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v1 1/2] gpiolib: Fix line event handling in compatible
 mode
Message-ID: <20191210165548.GY32742@smile.fi.intel.com>
References: <20191204194229.64251-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=Mc88eiLtu7_0y51nGDzM0nRmwaOurLx9isf=qRB0uj7KA@mail.gmail.com>
 <20191210143902.GA3509@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191210143902.GA3509@sol>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 10, 2019 at 10:39:02PM +0800, Kent Gibson wrote:
> On Tue, Dec 10, 2019 at 10:06:04AM +0100, Bartosz Golaszewski wrote:
> > śr., 4 gru 2019 o 20:42 Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> napisał(a):
> > >
> > > The introduced line even handling ABI in the commit
> > >
> > >   61f922db7221 ("gpio: userspace ABI for reading GPIO line events")
> > >
> > > missed the fact that 64-bit kernel may serve for 32-bit applications.
> > > In such case the very first check in the lineevent_read() will fail
> > > due to alignment differences.
> > >
> > > To workaround this we do several things here:
> > > - put warning comment to UAPI header near to the structure description
> > > - derive the size of the structure in the compatible mode from its members
> > > - check for the size of this structure in the ->read() callback
> > > - return only one event in the compatible mode at a time
> > >
> > > Above mitigation will work at least with libgpiod which does one event
> > > at a time.
> > >
> > > Since the bug hasn't been reported earlier we assume that there is close
> > > to zero actual users of the compatible mode to monitor GPIO events and thus
> > > we might consider to rework this ABI in the future.
> > >
> > 
> > How come this only affects the read operation but not the structures
> > passed as arguments to ioctl() calls?
> > 
> 
> For Go the structs are aligned based on the size of their components so
> that arrays of struct are naturally aligned.  The struct is given a
> hidden trailing pad so that a subsequent struct will be correctly aligned.
> The sizeof the struct includes this hidden pad.
> I'm pretty sure the same is true for gcc.
> 
> The gpioevent_data contains a __u64 which causes the whole struct to be
> 64 bit aligned on 64 bit, so it actually looks like this internally:
> 
> struct gpioevent_data {
> 	__u64 timestamp;
> 	__u32 id;
>     __u32 pad; // hidden
> };
> 
> so 16 bytes.
> 
> On 32 bit the struct is 32 bit aligned and the trailing pad is missing,
> so 12 bytes. This causes grief for the read due to the size mismatch.

Exactly.

> (I'm sorry to say I had to add the pad to my Go gpiod library to get it
> to read event data - but forgot to go back later and work out why -
> until now :-()
> 
> Your new info change struct has the same problem, as it also contains a
> __u64 and ends up with an odd number of __u32s, so gets a trailing pad
> on 64 bit.  Using __packed seems to inhibit the trailing pad.
> Or you could explicitly add the pad so the struct will be 64bit aligned
> even on 32bit.

I spoke to colleague of mine and has been told that best option is to fill all
gaps explicitly to have all members in the struct + 8 bytes alignment at the
end (also with explicit member).

> Neither of those options are available for the
> gpioevent_data, as that would break the ABI.

ABI needs v2 actually.

So, it must be

struct gpioevent_data_v2 {
	__u64 timestamp;
	__u32 id;
	__u32 padding;
};

And so on...

> The ioctl structs only contain __u32s (or smaller) and so get aligned to
> 32 bit boundaries on both 32 and 64 bit. So just lucky.

Right.

> It is also lucky that the event_data happens to have the __u64 at the
> beginning of the struct or there could be padding inserted between
> fields, not just at the end.  Similarly the byte array lengths in the
> ioctl structs are all multiples of 4, so all the components happen to 
> align to 32 bit boundaries.

-- 
With Best Regards,
Andy Shevchenko


