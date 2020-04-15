Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B9331A9F07
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2020 14:06:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S368404AbgDOMGL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Apr 2020 08:06:11 -0400
Received: from mga04.intel.com ([192.55.52.120]:22134 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S368398AbgDOMGF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 15 Apr 2020 08:06:05 -0400
IronPort-SDR: NQb5MjY3euWEZXBMUnU7RMwVPvhoUkFcUctqsUNvp549liGPupHMoZsWb0drNBXvU0WSHX8m4r
 xClT92TzHung==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2020 05:06:04 -0700
IronPort-SDR: PasCFvWNAGWtAhXJ7f3+RlzMlFghRoQDeIm25pFnOhKUbyTgSfrR2wO8d3AqmJ2Ue6RikQtlR9
 IftrblxcgSPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,386,1580803200"; 
   d="scan'208";a="245674308"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008.fm.intel.com with ESMTP; 15 Apr 2020 05:06:03 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jOgnu-000mFr-1K; Wed, 15 Apr 2020 15:06:06 +0300
Date:   Wed, 15 Apr 2020 15:06:06 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Serge Semin <fancer.lancer@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v1 00/13] gpio: dwapb: Clean up the driver and a fix
Message-ID: <20200415120606.GZ34613@smile.fi.intel.com>
References: <20200409141228.49561-1-andriy.shevchenko@linux.intel.com>
 <20200415115557.jhe5kwezgib7dvyn@mobilestation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200415115557.jhe5kwezgib7dvyn@mobilestation>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 15, 2020 at 02:55:57PM +0300, Serge Semin wrote:
> Hello Andy
> 
> On Thu, Apr 09, 2020 at 05:12:15PM +0300, Andy Shevchenko wrote:
> > It appears that GPIO DW APB driver wasn't touched for a long time. Here is
> > the fix for long standing issue, i.e. missed module alias to make the driver
> > be loaded automatically.
> > 
> > On top of above a lot small clean ups here and there.
> > 
> > The series based on the v3 by Serge Semin which he sent earlier.
> > 
> > Driver has been tested on Intel Galileo Gen2 with AT25 SPI EEPROM using it
> > for a chip select.
> 
> Thanks one more time for the series of nice cleanups. I've successfully
> tested it on our board with Baikal-T1 SoC, which has two DW APB IP-cores
> embedded with Ports A being configured as GPIOx32 and irqless GPIOx3.
> So for the whole series
> Tested-by: Serge Semin <fancer.lancer@gmail.com>

Thank you very much.
I hope Linus will figure out how to proceed with this.

> (Note since until my series is merged in to the kernel technically I'm not
> the driver maintainer so I'll use the reviewers tag for now where it's
> relevant.)

Even if you are not (yet) maintainer, your tags count and be appreciated.

-- 
With Best Regards,
Andy Shevchenko


