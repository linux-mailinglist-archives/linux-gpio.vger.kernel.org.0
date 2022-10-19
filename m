Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FD366043F9
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Oct 2022 13:55:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229866AbiJSLzB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Oct 2022 07:55:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231990AbiJSLyi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Oct 2022 07:54:38 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99E9425294;
        Wed, 19 Oct 2022 04:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666179215; x=1697715215;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CaxojcYcAZw4upBW1HT4c5H++7CWh87JUubekKn7h3k=;
  b=O4T1E3THyNWOlT3xQCY7iU4pIXac0srkxNTZgw9y8In9J6mCiomRhNlJ
   AevalKocmVck3Z+DvXnhFTulL8btGU8PsL8SLkNWX8nGHSYYnFYrtWBat
   b+nOeyUzZYMeZYT4XouRnIKHw00gyDUWcmp/XYfBh6P/E4XeNBym6BHWC
   4n/sLMM/gIvQDZ812FsSgbDHtWefQpqywjkV5JUAgjn9opqiwPf+wpVpH
   S7Ai9qSwXrzFWhdHwoYk1CCqA9c3z/ZYp4B0p2oKxnwbhMfKudQpqs9RD
   olEU6LABdNPwhGPybMnrgbcu3abJPCxnhDOl0DFVEgKdCt6L4GGvl56CU
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="307488813"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; 
   d="scan'208";a="307488813"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2022 04:20:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="874385927"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; 
   d="scan'208";a="874385927"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga006.fm.intel.com with ESMTP; 19 Oct 2022 04:20:28 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1ol77a-009pMs-09;
        Wed, 19 Oct 2022 14:20:26 +0300
Date:   Wed, 19 Oct 2022 14:20:25 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Petr Mladek <pmladek@suse.com>
Cc:     Russell King <rmk+kernel@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        devicetree@vger.kernel.org, Hector Martin <marcan@marcan.st>,
        Jonathan Corbet <corbet@lwn.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Rob Herring <robh+dt@kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sven Peter <sven@svenpeter.dev>
Subject: Re: [PATCH 4/7] lib/vsprintf: Add support for generic FOURCCs by
 extending %p4cc
Message-ID: <Y0/deTV0iH8xqmaZ@smile.fi.intel.com>
References: <YxdInl2qzQWM+3bs@shell.armlinux.org.uk>
 <E1oVYUS-005CmS-IA@rmk-PC.armlinux.org.uk>
 <Y0/Kt9CW5vYcxHhK@alley>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y0/Kt9CW5vYcxHhK@alley>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 19, 2022 at 12:00:23PM +0200, Petr Mladek wrote:
> On Tue 2022-09-06 14:19:44, Russell King wrote:
> > From: Hector Martin <marcan@marcan.st>

...

> >  	for (i = 0; i < sizeof(u32); i++) {
> > -		unsigned char c = val >> (i * 8);
> > +		unsigned char c = val >> ((3 - i) * 8);
> 
> This hardcodes '3' but the for-cycle uses i < sizeof(u32).
> We should be consistent.
> 
> A solution would be:
> 
> 	int i;
> 
> 	for (i = sizeof(u32); --i >= 0;) {
> 		unsigned char c = val >> (i * 8);


With while-loop it might be more readable:

	unsigned int i = sizeof(u32);

	while (i--) {
		...
	}

> >  		/* Print non-control ASCII characters as-is, dot otherwise */
> >  		*p++ = isascii(c) && isprint(c) ? c : '.';
> >  	}

-- 
With Best Regards,
Andy Shevchenko


