Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBE2342265C
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Oct 2021 14:25:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234700AbhJEM1J (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Oct 2021 08:27:09 -0400
Received: from mga01.intel.com ([192.55.52.88]:53766 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234358AbhJEM1J (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 5 Oct 2021 08:27:09 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10127"; a="248983569"
X-IronPort-AV: E=Sophos;i="5.85,348,1624345200"; 
   d="scan'208";a="248983569"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2021 05:25:18 -0700
X-IronPort-AV: E=Sophos;i="5.85,348,1624345200"; 
   d="scan'208";a="589336018"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2021 05:25:16 -0700
Received: from andy by smile with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mXjVR-008sRw-Lt;
        Tue, 05 Oct 2021 15:25:13 +0300
Date:   Tue, 5 Oct 2021 15:25:13 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Kent Gibson <warthog618@gmail.com>
Subject: Re: [PATCH v2 1/1] gpio: mockup: Convert to use software nodes
Message-ID: <YVxEKdJVvlz2iCCp@smile.fi.intel.com>
References: <20211005093731.62743-1-andriy.shevchenko@linux.intel.com>
 <CAHp75Vey95aSGoWg-XZtpX6UXj54208Vi4=VuiU5s7Z6w-fdtw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vey95aSGoWg-XZtpX6UXj54208Vi4=VuiU5s7Z6w-fdtw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 05, 2021 at 12:43:57PM +0300, Andy Shevchenko wrote:
> On Tue, Oct 5, 2021 at 12:37 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > Reported-tested-by: Kent Gibson <warthog618@gmail.com>
> 
> Oopsista, should be "Reported-and-tested-by:". I hope you can fix it
> when applying, but tell me if I need to send a v3.

Nevermind. just sent a v3 to make everyone's life easier!

-- 
With Best Regards,
Andy Shevchenko


