Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C65D233138D
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Mar 2021 17:38:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229757AbhCHQhg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Mar 2021 11:37:36 -0500
Received: from mga11.intel.com ([192.55.52.93]:52471 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229646AbhCHQhK (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 8 Mar 2021 11:37:10 -0500
IronPort-SDR: h0vZCl+gdVjDMNfpS3e9MG2KOSmjF0Luu476VlQ9alTvQ+OHP32nT4TK0MGP06K4CaHsrM81q3
 3B4IBWNG5FsQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="184699090"
X-IronPort-AV: E=Sophos;i="5.81,232,1610438400"; 
   d="scan'208";a="184699090"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2021 08:36:51 -0800
IronPort-SDR: zuu7RLRnWeShU6YgZLS7N7aCT41SnIEE+rSI69LKSW5QN5DKw30a771IiIFXUJKYxE82GyZTFT
 laf8pKA8MdFQ==
X-IronPort-AV: E=Sophos;i="5.81,232,1610438400"; 
   d="scan'208";a="508980132"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2021 08:36:49 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lJIsB-00ArEv-3g; Mon, 08 Mar 2021 18:36:47 +0200
Date:   Mon, 8 Mar 2021 18:36:47 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/2] lib/cmdline: Export next_arg() for being used in
 modules
Message-ID: <YEZSn7VwhGEa4a6I@smile.fi.intel.com>
References: <20210301165932.62352-1-andriy.shevchenko@linux.intel.com>
 <CAMuHMdWLCE=qrpzDpZQAxCeCc6nxq74g_Q5hNs8ZG+_0p89kMw@mail.gmail.com>
 <YEC9oQENLVmVNzXz@smile.fi.intel.com>
 <CAMpxmJWz+iEqC77ORCQ-tHHc0SiHCPoOR0VR=Te4LXBfMoCPng@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMpxmJWz+iEqC77ORCQ-tHHc0SiHCPoOR0VR=Te4LXBfMoCPng@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 08, 2021 at 04:38:42PM +0100, Bartosz Golaszewski wrote:
> On Thu, Mar 4, 2021 at 12:01 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Thu, Mar 04, 2021 at 09:53:28AM +0100, Geert Uytterhoeven wrote:
> > > On Mon, Mar 1, 2021 at 6:00 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > At least one module will benefit from using next_arg() helper.
> > > > Let's export it for that module and others if they consider it
> > > > helpful.
> > > >
> > > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > >
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > Thanks Geert and Linus!
> >
> > Bart, do you want me to add it to my usual PR or you want to take it yourself
> > (I have no dependencies in my tree on this anyway)?
> 
> Please send it with your PR.

Will do, thanks!

-- 
With Best Regards,
Andy Shevchenko


