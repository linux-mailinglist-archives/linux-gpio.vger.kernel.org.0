Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB1681A7D9B
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2020 15:25:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731801AbgDNNY1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Apr 2020 09:24:27 -0400
Received: from mga12.intel.com ([192.55.52.136]:27958 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2502886AbgDNNQC (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 14 Apr 2020 09:16:02 -0400
IronPort-SDR: 3tpqLDqSbU4PV6NSUDziPC3Rfe4ObGiiWsgP/nleRy4hVkxGjyvavSUrgWGoxQ+B1xFjJuLR2q
 GjUdgyl3pQVg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2020 06:16:02 -0700
IronPort-SDR: 7chLMonp3MiLwS7wKWzh3J/k+8NngcaOFa/FGiQC9KcMDYQA0H8w7jImXNcowSTvb8VlHc4pux
 ppPB9BlGY98w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,382,1580803200"; 
   d="scan'208";a="256506916"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga006.jf.intel.com with ESMTP; 14 Apr 2020 06:15:59 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jOLQ1-000X2W-Ln; Tue, 14 Apr 2020 16:16:01 +0300
Date:   Tue, 14 Apr 2020 16:16:01 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Mark Brown <broonie@kernel.org>, kernel@pengutronix.de,
        linux-gpio@vger.kernel.org, Marcel Gudert <m.gudert@eckelmann.de>
Subject: Re: [PATCH v2 1/2] gpio: pca953x: fix handling of automatic address
 incrementing
Message-ID: <20200414131601.GO34613@smile.fi.intel.com>
References: <20200330195018.27494-1-u.kleine-koenig@pengutronix.de>
 <20200330195018.27494-2-u.kleine-koenig@pengutronix.de>
 <20200331100759.GE1922688@smile.fi.intel.com>
 <20200414101545.2bmzlid7c7aosbs6@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200414101545.2bmzlid7c7aosbs6@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 14, 2020 at 12:15:45PM +0200, Uwe Kleine-König wrote:
> Hello,
> 
> obviously I failed to Cc: the gpio maintainers. Should I resend because
> of that?

I guess it's better to do because of
- this,
- v5.7-rc1 is out, makes sense to rebase.

...

> > So, something like
> > 
> > Fixes: b4818afeacbd ...
> > Depends-on: 8958262af3fb ...
> 
> I don't know what is best here. Using
> 
> Fixes: b4818afeacbd ("gpio: pca953x: Add set_multiple to allow multiple bits to be set in one write.")
> 
> seems sensible. Not sure which commits are sensible to list in
> Depends-on lines. I tend to just don't list any and then backport on
> request of the stable maintainers iff and when application to older
> versions failed.

Depends-on, in my opinion, is good to have to show at least one significant
dependency for the fix.

-- 
With Best Regards,
Andy Shevchenko


