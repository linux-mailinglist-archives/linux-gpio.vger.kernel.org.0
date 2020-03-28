Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53E541968FA
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Mar 2020 20:41:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726497AbgC1TlZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 28 Mar 2020 15:41:25 -0400
Received: from mga09.intel.com ([134.134.136.24]:58614 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725807AbgC1TlZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 28 Mar 2020 15:41:25 -0400
IronPort-SDR: zF89kCiz/5VM5glV8ma5KMWxsd9Zrj8a6X7YMPhBbYYdwOjBejJct4IWF+b2WcNSuuANtjlXsH
 JaQgVL0irkfw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2020 12:41:24 -0700
IronPort-SDR: FW9BVVlUZFT3Rioj1U0jCUjzucxB6ztLd0F+WgN6j0Qu1ijV/DEacuz5YGv612fIi4Od7npeHu
 sJFDRkdDnT6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,317,1580803200"; 
   d="scan'208";a="251473896"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga006.jf.intel.com with ESMTP; 28 Mar 2020 12:41:21 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jIHKd-00DlbC-RD; Sat, 28 Mar 2020 21:41:23 +0200
Date:   Sat, 28 Mar 2020 21:41:23 +0200
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
Message-ID: <20200328194123.GB1922688@smile.fi.intel.com>
References: <20200327074922.vrxbcjw2xlrv2bkb@pengutronix.de>
 <20200327172244.30816-1-u.kleine-koenig@pengutronix.de>
 <20200327172244.30816-3-u.kleine-koenig@pengutronix.de>
 <DF902AF8-CA86-4F31-9D98-288D40634D69@goldelico.com>
 <20200328092730.rn7drxqtx7g2xsff@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200328092730.rn7drxqtx7g2xsff@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Mar 28, 2020 at 10:27:30AM +0100, Uwe Kleine-König wrote:
> On Fri, Mar 27, 2020 at 11:06:43PM +0100, H. Nikolaus Schaller wrote:

> I'm still waiting for more feedback and then will send out a v2.

From code perspective looks good,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

If you give me some time (couple of days) I'll test it on PCA9555 (for no
regression).

-- 
With Best Regards,
Andy Shevchenko


