Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B258019931B
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2020 12:08:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730076AbgCaKH7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 Mar 2020 06:07:59 -0400
Received: from mga02.intel.com ([134.134.136.20]:43586 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729997AbgCaKH7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 31 Mar 2020 06:07:59 -0400
IronPort-SDR: QNJqo8mXsa5F3bKj6Md8843muAh55DQR+iNSIRlcIFiY+Ey/RBXn2U+8nDfevuJC5LAhV9/TeQ
 L93YCIViNJKQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2020 03:07:59 -0700
IronPort-SDR: 6abuxtKewVH+pqm49LyFu6YsCmb/LjZoWadIeQjNYe2JxTw86Xo4T/gz3UI/80h9LMMb2baRE/
 p1GFp7cwpRCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,327,1580803200"; 
   d="scan'208";a="448614928"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga005.fm.intel.com with ESMTP; 31 Mar 2020 03:07:57 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jJDoN-00ESB0-GY; Tue, 31 Mar 2020 13:07:59 +0300
Date:   Tue, 31 Mar 2020 13:07:59 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Marek Vasut <marek.vasut@gmail.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Mark Brown <broonie@kernel.org>, kernel@pengutronix.de,
        linux-gpio@vger.kernel.org, Marcel Gudert <m.gudert@eckelmann.de>
Subject: Re: [PATCH v2 1/2] gpio: pca953x: fix handling of automatic address
 incrementing
Message-ID: <20200331100759.GE1922688@smile.fi.intel.com>
References: <20200330195018.27494-1-u.kleine-koenig@pengutronix.de>
 <20200330195018.27494-2-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200330195018.27494-2-u.kleine-koenig@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 30, 2020 at 09:50:17PM +0200, Uwe Kleine-König wrote:

...

> The history of this bug is a bit complicated. Commit b32cecb46bdc
> ("gpio: pca953x: Extract the register address mangling to single
> function") changed which chips and functions are affected. Commit
> 3b00691cc46a ("gpio: pca953x: hack to fix 24 bit gpio expanders") used
> some duct tape to make the driver at least appear to work. Commit
> 49427232764d ("gpio: pca953x: Perform basic regmap conversion")
> introduced the caching. Commit b4818afeacbd ("gpio: pca953x: Add
> set_multiple to allow multiple bits to be set in one write.") introduced
> the .set_multiple() callback which didn't work for chips that need the
> AI bit which was fixed later for some chips in 8958262af3fb ("gpio:
> pca953x: Repair multi-byte IO address increment on PCA9575"). So I'm
> sorry, I don't know which commit I should pick for a Fixes: line.

It's allowed to put more, but I rather utilize Depends-on for that.

So, something like

Fixes: b4818afeacbd ...
Depends-on: 8958262af3fb ...

-- 
With Best Regards,
Andy Shevchenko


