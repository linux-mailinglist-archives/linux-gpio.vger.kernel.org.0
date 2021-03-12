Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E2B7338AEF
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Mar 2021 12:05:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233898AbhCLLEa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Mar 2021 06:04:30 -0500
Received: from mga02.intel.com ([134.134.136.20]:5499 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233554AbhCLLEA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 12 Mar 2021 06:04:00 -0500
IronPort-SDR: Mz/uavYLg1nriw4SDf7sOW10LDGJs9/+ZuAZT6qKGKbt6WBOEuWtTXOMEAKRfqZvh92rdtbeIY
 ZnKIoa24iBOQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9920"; a="175939530"
X-IronPort-AV: E=Sophos;i="5.81,243,1610438400"; 
   d="scan'208";a="175939530"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2021 03:03:58 -0800
IronPort-SDR: /6TpBsSEM7T8QD3s4i9cejjiudGvvwuwTdPHMSBWm5BAzAXBnCnAaOftdYr8trlo9hlgCVfEBG
 uvC4xBrDbpzQ==
X-IronPort-AV: E=Sophos;i="5.81,243,1610438400"; 
   d="scan'208";a="521392591"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2021 03:03:55 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lKfaB-00BpeO-JN; Fri, 12 Mar 2021 13:03:51 +0200
Date:   Fri, 12 Mar 2021 13:03:51 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>,
        Shuah Khan <shuah@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kent Gibson <warthog618@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v3 08/11] gpio: sim: new testing module
Message-ID: <YEtKlyV13h2fbwJR@smile.fi.intel.com>
References: <20210309205921.15992-1-brgl@bgdev.pl>
 <20210309205921.15992-9-brgl@bgdev.pl>
 <YEi7fth6sZWgKd+q@smile.fi.intel.com>
 <CAMRc=MfeCWNnXwqBBu3CcdHXQ5QnNPBh8EJRTCtyZau+RqE-0w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MfeCWNnXwqBBu3CcdHXQ5QnNPBh8EJRTCtyZau+RqE-0w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 12, 2021 at 09:54:58AM +0100, Bartosz Golaszewski wrote:
> On Wed, Mar 10, 2021 at 1:28 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:

...

> > > +             ret = sprintf(page, "n/a\n");
> >
> > I dunno '/' (slash) is a good character to be handled in a shell.
> > I would prefer 'none' or 'not available' (I think space is easier,
> > because the rules to escape much simpler: need just to take it into
> > quotes, while / needs to be escaped separately).
> >
> 
> My test cases work fine with 'n/a' but I can change it to 'none' if
> it's less controversial.


% git grep -n -w '"none"' -- drivers/ arch/ | wc -l
371

% git grep -n -w '"n/a"' -- drivers/ arch/ | wc -l
15

% git grep -n -w '"not available"' -- drivers/ arch/ | wc -l
5

...

> But I would be creating empty properties for nothing. Better to just
> not have them at all.

Up to you.

-- 
With Best Regards,
Andy Shevchenko


