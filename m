Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0ADF3F2CE7
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Aug 2021 15:12:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240704AbhHTNMr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Aug 2021 09:12:47 -0400
Received: from mga17.intel.com ([192.55.52.151]:41095 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240614AbhHTNMm (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 20 Aug 2021 09:12:42 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10081"; a="197026692"
X-IronPort-AV: E=Sophos;i="5.84,337,1620716400"; 
   d="scan'208";a="197026692"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2021 06:12:04 -0700
X-IronPort-AV: E=Sophos;i="5.84,337,1620716400"; 
   d="scan'208";a="680087567"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2021 06:12:03 -0700
Received: from andy by smile with local (Exim 4.94.2)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1mH4JQ-00BpSE-RY; Fri, 20 Aug 2021 16:11:56 +0300
Date:   Fri, 20 Aug 2021 16:11:56 +0300
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH] pinctrl: baytrail: Pick first supported debounce value
 larger then the requested value
Message-ID: <YR+qHHVgALcpQ6k+@smile.fi.intel.com>
References: <20210819203952.785132-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210819203952.785132-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 19, 2021 at 10:39:52PM +0200, Hans de Goede wrote:
> Bay Trail pin control only supports a couple of discrete debounce timeout
> values. Instead of returning -EINVAL for other values, pick the first
> supported debounce timeout value larger then the requested timeout.
> 
> E.g. on a HP ElitePad 1000 G2, where the ACPI tables specify a timeout of
> 20 ms for various _AIE ACPI event sources, this will result in a timeout
> of 24 ms instead of returning -EINVAL to the caller.

I would prefer to see case 1...375: case 376...750: It makes it more explicit
what we choose. Also it will be in align with debounce getter switch-case.
Nevertheless, there is the bigger problem here, which is that the debounce
setting is global per community and neither current nor new code addresses.

What we need is to have a bitmap of size 3-bit * N_pins (per community) to save
settings and each time we try to adjust them, we have to go through that bitmap
and check actual users and see if we have conflicting requests.

You may ask why we have to keep the actual debounce value and not the biggest
one. The reason why is simple, if the following flow of requests comes we will
have better setting at the end:

1) A asks for debounce of 1ms (we set to 1.5ms)
2) B asks for 10ms (we set likely to 12ms *)
3) B gone (we should return to 1.5ms)
4) C asks for 400us (*)

*) TBH I have no idea what to do with these cases, i.e. when better to satisfy
   the bigger, when issue warning, when just print a debug message. I admit
   that debounce on BYT has been not thought through on HW level.

-- 
With Best Regards,
Andy Shevchenko


