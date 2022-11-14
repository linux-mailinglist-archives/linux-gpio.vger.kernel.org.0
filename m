Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6314B62844A
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Nov 2022 16:47:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237191AbiKNPq5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Nov 2022 10:46:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236881AbiKNPq4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Nov 2022 10:46:56 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FB6210043;
        Mon, 14 Nov 2022 07:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668440816; x=1699976816;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VDaLfJvXwECfuRPSE8pK2QFtlBh89ngfYKiiJvz35CA=;
  b=eFhK5VmdhYLroj66CsmUtyH7aLRRdsycqD8Bp9KMLhnpUtvPlitgw/FU
   L4n35s4BfzmR93rwmQMVBpM7gbbPOCDtr0AS0/g1d8IOrcAq0s+cDiFqx
   195Lc4vIH1NwnVRlnyleM/XbvokQZGahZFODVJsSLjrwPdFAQOhfEzjUn
   y4gOm70n5nC6gefUytHY74PrGL+PM9MaBClh2ak6wDnR/+BRz5zbQzK4N
   LNLk2EyPObo+Go53MGQEvnHuih5jBuGiIJ/mdDON6PoHkyNNYRL4qhpih
   8cftuU0YrJy+h++7ngDvy/C7QgAka+QhpIE9Ecbzd0+UHumsoHrWan5kU
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="312006610"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; 
   d="scan'208";a="312006610"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2022 07:46:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="632849142"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; 
   d="scan'208";a="632849142"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP; 14 Nov 2022 07:46:31 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1oubfI-00CEVn-2n;
        Mon, 14 Nov 2022 17:46:28 +0200
Date:   Mon, 14 Nov 2022 17:46:28 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Petr Mladek <pmladek@suse.com>
Cc:     Russell King <rmk+kernel@armlinux.org.uk>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        asahi@lists.linux.dev, devicetree@vger.kernel.org,
        Hector Martin <marcan@marcan.st>,
        Jonathan Corbet <corbet@lwn.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sven Peter <sven@svenpeter.dev>
Subject: Re: [PATCH v3 2/7] lib/vsprintf: Add support for generic FOURCCs by
 extending %p4cc
Message-ID: <Y3Ji1B+Kar6OSBn3@smile.fi.intel.com>
References: <Y2qEpgIdpRTzTQbN@shell.armlinux.org.uk>
 <E1osRXO-002mvw-Fp@rmk-PC.armlinux.org.uk>
 <Y3Jf7xz2CQjJuEeT@alley>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3Jf7xz2CQjJuEeT@alley>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 14, 2022 at 04:34:07PM +0100, Petr Mladek wrote:
> On Tue 2022-11-08 16:33:22, Russell King wrote:

...

> >  	orig = get_unaligned(fourcc);
> > -	val = orig & ~BIT(31);
> > +	switch (fmt[2]) {
> > +	case 'h':
> > +		val = orig;
> > +		break;
> > +	case 'r':
> > +		val = orig = swab32(orig);
> 
> I do not like much these multi assignments. I think that the result
> was not even defined in some older C standards. Though, I can't find
> it now. And even make W=3 does not warn about it.
> 
> > +		break;
> > +	case 'l':
> > +		val = orig = le32_to_cpu(orig);
> > +		break;
> > +	case 'b':
> > +		val = orig = be32_to_cpu(orig);
> > +		break;

Isn't easy to fix? Something like below?

	switch (fmt[2]) {
	case 'h':
		break;
	case 'r':
		orig = swab32(orig);
		break;
	case 'l':
		orig = le32_to_cpu(orig);
		break;
	case 'b':
		orig = be32_to_cpu(orig);
		break;

		...
	}
	val = orig;


-- 
With Best Regards,
Andy Shevchenko


