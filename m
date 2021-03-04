Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78C4B32D183
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 12:04:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239322AbhCDLC4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 06:02:56 -0500
Received: from mga05.intel.com ([192.55.52.43]:23347 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239447AbhCDLCw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 4 Mar 2021 06:02:52 -0500
IronPort-SDR: 3WY3geOhmu0RPuNqHH3PvZIvU+KZfyn8vLnmZn7ySND9DQjK24DjWHQXQ9Qu7wvBvjo+NnyWJI
 ZhQMrni3V5+Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9912"; a="272394963"
X-IronPort-AV: E=Sophos;i="5.81,222,1610438400"; 
   d="scan'208";a="272394963"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 03:01:01 -0800
IronPort-SDR: QAaNw3sAUc4uuFNY+Kb9FsFTvB7VQsi9Sa8HNVjmxBcshTnsWd4RehhQLwqf3KniuNkrSmtuyi
 9yxViYyZn/sA==
X-IronPort-AV: E=Sophos;i="5.81,222,1610438400"; 
   d="scan'208";a="436285496"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 03:00:00 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lHlhp-009rQk-6E; Thu, 04 Mar 2021 12:59:45 +0200
Date:   Thu, 4 Mar 2021 12:59:45 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v1 1/2] lib/cmdline: Export next_arg() for being used in
 modules
Message-ID: <YEC9oQENLVmVNzXz@smile.fi.intel.com>
References: <20210301165932.62352-1-andriy.shevchenko@linux.intel.com>
 <CAMuHMdWLCE=qrpzDpZQAxCeCc6nxq74g_Q5hNs8ZG+_0p89kMw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWLCE=qrpzDpZQAxCeCc6nxq74g_Q5hNs8ZG+_0p89kMw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 04, 2021 at 09:53:28AM +0100, Geert Uytterhoeven wrote:
> On Mon, Mar 1, 2021 at 6:00 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > At least one module will benefit from using next_arg() helper.
> > Let's export it for that module and others if they consider it
> > helpful.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks Geert and Linus!

Bart, do you want me to add it to my usual PR or you want to take it yourself
(I have no dependencies in my tree on this anyway)?

-- 
With Best Regards,
Andy Shevchenko


