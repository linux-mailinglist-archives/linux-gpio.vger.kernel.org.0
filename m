Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2105197DDF
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2020 16:07:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727797AbgC3OHq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Mar 2020 10:07:46 -0400
Received: from mga04.intel.com ([192.55.52.120]:18710 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725268AbgC3OHq (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 30 Mar 2020 10:07:46 -0400
IronPort-SDR: 1bSpCVgwKaOvazCkZrWZh04V2ITZRy/0LpXMe89zQ40kWMrhX/RC91kSAtd6NYMUsMPA9GTY2C
 O0mVueUWHDTA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2020 07:07:46 -0700
IronPort-SDR: xJi9K5zCr4XVi9S2QoerQJAloXPt7GNexjX0nofbZYQXvKsTJwHAcOSms/tAFGlYgq+kM2p/HR
 TIhpWW+gJP7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,324,1580803200"; 
   d="scan'208";a="237361571"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga007.jf.intel.com with ESMTP; 30 Mar 2020 07:07:43 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jIv4s-00EDj2-7N; Mon, 30 Mar 2020 17:07:46 +0300
Date:   Mon, 30 Mar 2020 17:07:46 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        Mark Brown <broonie@kernel.org>, kernel@pengutronix.de,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Subject: Re: [PATCH v1 2/2] [RFC] gpio: pca953x: drop unused parameters of
 pca953x_recalc_addr()
Message-ID: <20200330140746.GR1922688@smile.fi.intel.com>
References: <20200327074922.vrxbcjw2xlrv2bkb@pengutronix.de>
 <20200327172244.30816-1-u.kleine-koenig@pengutronix.de>
 <20200327172244.30816-3-u.kleine-koenig@pengutronix.de>
 <DF902AF8-CA86-4F31-9D98-288D40634D69@goldelico.com>
 <20200328092730.rn7drxqtx7g2xsff@pengutronix.de>
 <20200328194123.GB1922688@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200328194123.GB1922688@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Mar 28, 2020 at 09:41:23PM +0200, Andy Shevchenko wrote:
> On Sat, Mar 28, 2020 at 10:27:30AM +0100, Uwe Kleine-König wrote:
> > On Fri, Mar 27, 2020 at 11:06:43PM +0100, H. Nikolaus Schaller wrote:
> 
> > I'm still waiting for more feedback and then will send out a v2.
> 
> From code perspective looks good,
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> If you give me some time (couple of days) I'll test it on PCA9555 (for no
> regression).

No regression found in my case (PCA9555 + IRQ test)
Tested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


