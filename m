Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFA751A6551
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2020 12:46:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727782AbgDMKqQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Apr 2020 06:46:16 -0400
Received: from mga11.intel.com ([192.55.52.93]:32272 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727776AbgDMKqP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 13 Apr 2020 06:46:15 -0400
IronPort-SDR: QA9gdgYUTLL7RyYX7NExihlAqUW5tyUT6sKc5TNtU1/1kBkDczpgIKDs30P5eRAgfzrqZBPlYU
 +4PlisExMyvg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2020 03:46:15 -0700
IronPort-SDR: 542N4fSbJoAbeRYSCXDHHh+037dWBj4+gqCUE0IghUh+ea7+ns/EYQgrLtdKk/u25K1ye4Bt8P
 OJ+Az74zGhkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,378,1580803200"; 
   d="scan'208";a="454174442"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga006.fm.intel.com with ESMTP; 13 Apr 2020 03:46:14 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jNwbY-000GvS-TB; Mon, 13 Apr 2020 13:46:16 +0300
Date:   Mon, 13 Apr 2020 13:46:16 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v1] pinctrl: baytrail: Enable pin configuration setting
 for GPIO chip
Message-ID: <20200413104616.GB34613@smile.fi.intel.com>
References: <20200331152428.33951-1-andriy.shevchenko@linux.intel.com>
 <20200401094620.GQ2564@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200401094620.GQ2564@lahna.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 01, 2020 at 12:46:20PM +0300, Mika Westerberg wrote:
> On Tue, Mar 31, 2020 at 06:24:28PM +0300, Andy Shevchenko wrote:
> > It appears that pin configuration for GPIO chip hasn't been enabled yet
> > due to absence of ->set_config() callback.
> > 
> > Enable it here for Intel Baytrail.
> > 
> > Fixes: c501d0b149de ("pinctrl: baytrail: Add pin control operations")
> > Depends-on: 2956b5d94a76 ("pinctrl / gpio: Introduce .set_config() callback for GPIO chips")
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Pushed to fixes, thanks!

-- 
With Best Regards,
Andy Shevchenko


