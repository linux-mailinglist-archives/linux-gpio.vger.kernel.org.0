Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBA15333BDB
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Mar 2021 12:57:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231430AbhCJL4h (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Mar 2021 06:56:37 -0500
Received: from mga05.intel.com ([192.55.52.43]:15457 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231382AbhCJL4a (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 10 Mar 2021 06:56:30 -0500
IronPort-SDR: 2Cq114r3kZG8z+AzTc8PE+NenJBwN6HHDo/1SxBTcGdyxQPHhCwWm6Qb6adJw3t0cA+XLurOcs
 WtwRkCH+pr9g==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="273486300"
X-IronPort-AV: E=Sophos;i="5.81,237,1610438400"; 
   d="scan'208";a="273486300"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2021 03:56:29 -0800
IronPort-SDR: d8oFsFOFvUVWTxDS+XsWeW4qkSwqkuFzLLpfTerzivp5tZZXgsAu3r9hWkNOuOVw0d61GrTZ4u
 GxVHy67502cQ==
X-IronPort-AV: E=Sophos;i="5.81,237,1610438400"; 
   d="scan'208";a="437922503"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2021 03:56:28 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lJxRx-00BJYs-Ec; Wed, 10 Mar 2021 13:56:25 +0200
Date:   Wed, 10 Mar 2021 13:56:25 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] gpio: fixes for v5.12-rc3
Message-ID: <YEiz6fJt9SUBBmJ4@smile.fi.intel.com>
References: <20210309153443.16647-1-brgl@bgdev.pl>
 <CAMRc=MfO7J1z8oGy+OiRR000dJAYg1LTynz33Kh6BMb1hUrg5g@mail.gmail.com>
 <CAHk-=wiiuSPZGh1ai_NuV8BHgXO36H_aQ28Bx1u82gE23S1u0g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wiiuSPZGh1ai_NuV8BHgXO36H_aQ28Bx1u82gE23S1u0g@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 09, 2021 at 12:04:58PM -0800, Linus Torvalds wrote:
> On Tue, Mar 9, 2021 at 7:43 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > I realized only after I sent out this PR that I had rebased the branch
> > on top of v5.12-rc2 (because of the v5.12-rc1 situation) without
> > --rebase-merges and this caused git to drop the merge commit for
> > Andy's pull-request. Please let me know if you can pull this as is or
> > if I should rebuild my branch and resend.
> 
> This is fine - it's small, it's a one-time pain, and there's that reason for it.
> 
> So as long as Andy is aware of how his patches got rebased and don't
> match his branch any more, I think it's not a big deal, and I've
> pulled it as-is.

Thanks! It's not big deal, but a good learning anyway how to communicate and
proceed with the git in such (rare I suppose) situations.

-- 
With Best Regards,
Andy Shevchenko


