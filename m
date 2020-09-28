Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81ED227B1D1
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Sep 2020 18:26:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726729AbgI1Q0D (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Sep 2020 12:26:03 -0400
Received: from mga02.intel.com ([134.134.136.20]:35109 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726504AbgI1Q0C (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 28 Sep 2020 12:26:02 -0400
IronPort-SDR: Jmjlcl25lrALz2Iz2PDZE0DAaT3cw+XzY3IipqIx0p/Wqdd5yjoaOfLPKx8LIxOJuma3vEmfu1
 EOZFf6FyGlCQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9758"; a="149687502"
X-IronPort-AV: E=Sophos;i="5.77,313,1596524400"; 
   d="scan'208";a="149687502"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2020 09:26:00 -0700
IronPort-SDR: 7WUTEIOsBwl7Mtrc/EUhBU8IQiM/MDuMZzeOLzaftBUODxSD8SKkGFTA1LMpXHKsBIWQTfVIrQ
 +rNf/ibAC4Vw==
X-IronPort-AV: E=Sophos;i="5.77,313,1596524400"; 
   d="scan'208";a="311845174"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2020 09:25:57 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kMvyK-002c4D-G9; Mon, 28 Sep 2020 19:25:52 +0300
Date:   Mon, 28 Sep 2020 19:25:52 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Joe Perches <joe@perches.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Kent Gibson <warthog618@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v2 1/9] lib: string_helpers: provide kfree_strarray()
Message-ID: <20200928162552.GX3956970@smile.fi.intel.com>
References: <20200928104155.7385-1-brgl@bgdev.pl>
 <20200928104155.7385-2-brgl@bgdev.pl>
 <2fcfd81f62ec87d9b75cca32468d8b9583faec47.camel@perches.com>
 <CAMRc=Mds0ccYBhRJnCQ0NEPkUpWRGtyX4FKj4+4rxN27_gfobA@mail.gmail.com>
 <12317bbc7712d96be8f52a3bf574e47628830191.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12317bbc7712d96be8f52a3bf574e47628830191.camel@perches.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 28, 2020 at 09:06:34AM -0700, Joe Perches wrote:
> On Mon, 2020-09-28 at 18:02 +0200, Bartosz Golaszewski wrote:
> > On Mon, Sep 28, 2020 at 5:59 PM Joe Perches <joe@perches.com> wrote:
> > > On Mon, 2020-09-28 at 12:41 +0200, Bartosz Golaszewski wrote:
> > > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > > 
> > > > There's a common pattern of dynamically allocating an array of char
> > > > pointers and then also dynamically allocating each string in this
> > > > array. Provide a helper for freeing such a string array with one call.
> > > 
> > > Isn't this also common for things like ring buffers?
> > > Why limit this to char *[]?
> > > 
> > 
> > I don't want to add APIs nobody is using. What do you suggest?
> 
> Change the argument to void** and call it
> 
> void kfree_array(void **array, int count);

Bart, if you go for this, I'm fine. You may keep my tag.

-- 
With Best Regards,
Andy Shevchenko


