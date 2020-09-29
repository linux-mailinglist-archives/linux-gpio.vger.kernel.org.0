Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E792827BFFF
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Sep 2020 10:49:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727416AbgI2ItW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Sep 2020 04:49:22 -0400
Received: from mga18.intel.com ([134.134.136.126]:43003 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725774AbgI2ItV (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 29 Sep 2020 04:49:21 -0400
IronPort-SDR: GCJylJLB8KVgguHwEc52N22iDLoQ2y5Xl1OrSjqhhWnSmoQF/QyyAX3ysBrXec0/PH2jpavlVj
 wtPoiTcK8lPQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9758"; a="149922095"
X-IronPort-AV: E=Sophos;i="5.77,317,1596524400"; 
   d="scan'208";a="149922095"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2020 01:49:20 -0700
IronPort-SDR: OuWf3/4RT4QtyKwW74QYQmXVHxdWamI3BZFe0bYncUkOB2ZTACf9Nfx4JUc8mfxHznWE2VsFuo
 E+9tjrqrOeLw==
X-IronPort-AV: E=Sophos;i="5.77,317,1596524400"; 
   d="scan'208";a="350150422"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2020 01:49:18 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kNBJw-002kS2-GC; Tue, 29 Sep 2020 11:49:12 +0300
Date:   Tue, 29 Sep 2020 11:49:12 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     David Laight <David.Laight@aculab.com>
Cc:     'Joe Perches' <joe@perches.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Kent Gibson <warthog618@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v2 1/9] lib: string_helpers: provide kfree_strarray()
Message-ID: <20200929084912.GZ3956970@smile.fi.intel.com>
References: <20200928104155.7385-1-brgl@bgdev.pl>
 <20200928104155.7385-2-brgl@bgdev.pl>
 <2fcfd81f62ec87d9b75cca32468d8b9583faec47.camel@perches.com>
 <CAMRc=Mds0ccYBhRJnCQ0NEPkUpWRGtyX4FKj4+4rxN27_gfobA@mail.gmail.com>
 <12317bbc7712d96be8f52a3bf574e47628830191.camel@perches.com>
 <3ba6779e11684ec8bc32638aa67ab952@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ba6779e11684ec8bc32638aa67ab952@AcuMS.aculab.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 29, 2020 at 08:10:10AM +0000, David Laight wrote:
> From: Joe Perches
> > Sent: 28 September 2020 17:07
> > 
> > On Mon, 2020-09-28 at 18:02 +0200, Bartosz Golaszewski wrote:
> > > On Mon, Sep 28, 2020 at 5:59 PM Joe Perches <joe@perches.com> wrote:
> > > > On Mon, 2020-09-28 at 12:41 +0200, Bartosz Golaszewski wrote:
> > > > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > > >
> > > > > There's a common pattern of dynamically allocating an array of char
> > > > > pointers and then also dynamically allocating each string in this
> > > > > array. Provide a helper for freeing such a string array with one call.
> > > >
> > > > Isn't this also common for things like ring buffers?
> > > > Why limit this to char *[]?
> > > >
> > >
> > > I don't want to add APIs nobody is using. What do you suggest?
> > 
> > Change the argument to void** and call it
> > 
> > void kfree_array(void **array, int count);
> 
> Does help, void doesn't work that way.

Actually good catch. void * and void ** have a big difference in the implicit
casting behaviour. I was stumbled over this while playing with some
experimental stuff locally.

-- 
With Best Regards,
Andy Shevchenko


