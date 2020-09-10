Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68F4D26549D
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Sep 2020 23:59:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725833AbgIJV7N (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Sep 2020 17:59:13 -0400
Received: from mga14.intel.com ([192.55.52.115]:18184 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730668AbgIJLKa (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 10 Sep 2020 07:10:30 -0400
IronPort-SDR: H4cSjfvoeqxq8R1PNVJauz376Xa843CnFVvVZIlsFJP6rTkJPRR/VzMTnPU3Veeh4+At/g/LDL
 PT1ieuJF6VWw==
X-IronPort-AV: E=McAfee;i="6000,8403,9739"; a="157790726"
X-IronPort-AV: E=Sophos;i="5.76,412,1592895600"; 
   d="scan'208";a="157790726"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2020 04:10:21 -0700
IronPort-SDR: Rf6AqbrvlPtt/XYMILfRvF4fyk8hmsstyZFoh95B7GC8FZsKavm0GCaZhQla7+fQEY46quKLGb
 0tqvM3wufowQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,412,1592895600"; 
   d="scan'208";a="334143904"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 10 Sep 2020 04:10:19 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kGKT3-00FfiW-6k; Thu, 10 Sep 2020 14:10:17 +0300
Date:   Thu, 10 Sep 2020 14:10:17 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v5 00/20] gpio: cdev: add uAPI v2
Message-ID: <20200910111017.GT1891694@smile.fi.intel.com>
References: <20200827140020.159627-1-warthog618@gmail.com>
 <CACRpkdZZMbfpKy4gcfAzNq53LkYLcL9wm3Qtzyj_K8vkUW9RfQ@mail.gmail.com>
 <CAMpxmJXRY2wqqN3SzfJN+QTWAHYSYz4vEjLKWU82Y=PAmcm=5w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMpxmJXRY2wqqN3SzfJN+QTWAHYSYz4vEjLKWU82Y=PAmcm=5w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 27, 2020 at 06:02:03PM +0200, Bartosz Golaszewski wrote:
> On Thu, Aug 27, 2020 at 5:53 PM Linus Walleij <linus.walleij@linaro.org> wrote:

> please hold it maybe for one more week - I'd love to have some more
> people take a look at the user facing header at least. Andy is usually
> very thorough in his reviews so I'm Ccing him here.
> 
> I'll too skim through the series one more time.

Thank you, Bart.

I think you, guys know how to do that best. Unfortunately I was almost squeezed
under pile of several tasks and didn't find time for this.

Meanwhile I have sent an updated fix for v1 as suggested by Arnd. It works for
me.

-- 
With Best Regards,
Andy Shevchenko


