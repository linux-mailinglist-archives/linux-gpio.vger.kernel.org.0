Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0BC33EA518
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Aug 2021 15:03:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236141AbhHLNEM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Aug 2021 09:04:12 -0400
Received: from mga17.intel.com ([192.55.52.151]:13025 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236042AbhHLNEM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Aug 2021 09:04:12 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10073"; a="195613980"
X-IronPort-AV: E=Sophos;i="5.84,315,1620716400"; 
   d="scan'208";a="195613980"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2021 06:03:43 -0700
X-IronPort-AV: E=Sophos;i="5.84,315,1620716400"; 
   d="scan'208";a="676759385"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2021 06:03:41 -0700
Received: from andy by smile with local (Exim 4.94.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mEAMx-008ajP-Fh; Thu, 12 Aug 2021 16:03:35 +0300
Date:   Thu, 12 Aug 2021 16:03:35 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Ben Hutchings <ben.hutchings@essensium.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod v2.0][PATCH] core: extend config objects
Message-ID: <YRUcJ0kbNRa3ORl4@smile.fi.intel.com>
References: <20210806132810.23556-1-brgl@bgdev.pl>
 <20210807084809.GA17852@sol>
 <CAMRc=McQOcWDexBeWKcA9CosxfG_59quusnVLYN7qu-p86BPag@mail.gmail.com>
 <20210808231012.GA6224@sol>
 <CAMRc=Me5N=gthd4ESrh5ChStEkHQmG1AuzKf6nZNbq2ZXtTrGQ@mail.gmail.com>
 <20210810103113.GA6637@sol>
 <CAMRc=MeKB4wmZw2FS79H0W75394MpzS6sq+2iehD4tXkdDGGzQ@mail.gmail.com>
 <20210812102913.GA21938@sol>
 <CAMRc=MfzGh7ER4VankzR5qStbrW=hCxK-d_1rF+SzD3zik=z2w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MfzGh7ER4VankzR5qStbrW=hCxK-d_1rF+SzD3zik=z2w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 12, 2021 at 02:51:02PM +0200, Bartosz Golaszewski wrote:
> On Thu, Aug 12, 2021 at 12:29 PM Kent Gibson <warthog618@gmail.com> wrote:

> As you said - it's on the heap, so who cares. But this is also an
> internal structure and so we can use bit fields. That should reduce
> the memory footprint significantly as we now don't require more than 3
> bits for any given enum. That would leave us with the debounce period
> and offset as full size variables.

Side note (I believe you know about): bit fields are the beasts when you have
to have a locked access.

-- 
With Best Regards,
Andy Shevchenko


