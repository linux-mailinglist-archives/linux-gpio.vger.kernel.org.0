Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A2AA45AB7B
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Nov 2021 19:48:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239820AbhKWSvK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Nov 2021 13:51:10 -0500
Received: from mga02.intel.com ([134.134.136.20]:33871 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239667AbhKWSvJ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 23 Nov 2021 13:51:09 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10177"; a="222324576"
X-IronPort-AV: E=Sophos;i="5.87,258,1631602800"; 
   d="scan'208";a="222324576"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2021 10:48:01 -0800
X-IronPort-AV: E=Sophos;i="5.87,258,1631602800"; 
   d="scan'208";a="674591554"
Received: from smile.fi.intel.com ([10.237.72.184])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2021 10:47:59 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mpapf-009s2Y-D4;
        Tue, 23 Nov 2021 20:47:55 +0200
Date:   Tue, 23 Nov 2021 20:47:55 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 1/1] gpio: add sloppy logic analyzer using polling
Message-ID: <YZ03W6UeSGxkn+Au@smile.fi.intel.com>
References: <20211123164902.35370-1-wsa+renesas@sang-engineering.com>
 <20211123164902.35370-2-wsa+renesas@sang-engineering.com>
 <YZ024q/r7Hc3TpMt@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YZ024q/r7Hc3TpMt@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 23, 2021 at 08:45:55PM +0200, Andy Shevchenko wrote:
> On Tue, Nov 23, 2021 at 05:49:02PM +0100, Wolfram Sang wrote:

> > +			# Check if we could parse something and the channel number fits
> 
> > +			[ "$chan" != "$elem" ] && [ "$chan" -le $max_chans ] || fail "Trigger syntax error: $elem"
> 
> No need to execute `test` twice:
> 
> 			[ "$chan" != "$elem" -a "$chan" -le $max_chans ] || fail "Trigger syntax error: $elem"

On the second thought this might be a different logic...

-- 
With Best Regards,
Andy Shevchenko


