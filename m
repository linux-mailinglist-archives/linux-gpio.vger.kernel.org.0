Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 777337A8784
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Sep 2023 16:48:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235229AbjITOsI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Sep 2023 10:48:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234330AbjITOry (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Sep 2023 10:47:54 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 973521B5;
        Wed, 20 Sep 2023 07:47:22 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="384082608"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="384082608"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 07:47:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="870403133"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="870403133"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 07:47:17 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC0)
        (envelope-from <andy@kernel.org>)
        id 1qiyTw-0000000G0eB-3vo6;
        Wed, 20 Sep 2023 17:47:12 +0300
Date:   Wed, 20 Sep 2023 17:47:12 +0300
From:   Andy Shevchenko <andy@kernel.org>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc:     Gregory CLEMENT <gregory.clement@bootlin.com>,
        Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-gpio@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v2 2/7] platform: cznic: Add preliminary support for
 Turris Omnia MCU
Message-ID: <ZQsF8FWwfAuT26yE@smile.fi.intel.com>
References: <20230919103815.16818-1-kabel@kernel.org>
 <20230919103815.16818-3-kabel@kernel.org>
 <ZQmUFPvIx91+ps6k@smile.fi.intel.com>
 <20230919171638.19bc1619@dellmb>
 <ZQnn+Gi0xVlsGCYA@smile.fi.intel.com>
 <20230920161953.6d952392@dellmb>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230920161953.6d952392@dellmb>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_SOFTFAIL autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 20, 2023 at 04:19:53PM +0200, Marek Behún wrote:
> On Tue, 19 Sep 2023 21:27:04 +0300
> Andy Shevchenko <andy@kernel.org> wrote:
> > On Tue, Sep 19, 2023 at 05:16:38PM +0200, Marek Behún wrote:
> > > On Tue, 19 Sep 2023 15:29:08 +0300
> > > Andy Shevchenko <andy@kernel.org> wrote:  
> > > > On Tue, Sep 19, 2023 at 12:38:10PM +0200, Marek Behún wrote:  

...

> > > > > +	if (likely(ret == ARRAY_SIZE(msgs)))    
> > > > 
> > > > Why likely()? Please, justify.  
> > > 
> > > Becuase it is unlikely the I2C transaction will fail. In most cases, it
> > > does not.  
> > 
> > Yes, but why likely() is needed? So, i.o.w. what's the benefit in _this_ case?
> 
> Compiler optimization (one branch avoided). But I guess this isn't a
> hot path, since I2C is insanely slow anyway. OK, I shall remove the
> likely() usage.

Have you seen the difference in the generated code, btw?

I don't think it will get you one independently on the hot/slow
path.

-- 
With Best Regards,
Andy Shevchenko


