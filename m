Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1164360B179
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Oct 2022 18:25:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233932AbiJXQZr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Oct 2022 12:25:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235258AbiJXQZL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Oct 2022 12:25:11 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3AFB158181
        for <linux-gpio@vger.kernel.org>; Mon, 24 Oct 2022 08:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666624318; x=1698160318;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XUdEZsZnv3WYeOxP8dyx9oN3W31Uv8OJUsvCmASdtP4=;
  b=KvvgtTzGAJ+rJQNhBRXBa/s1KaT9pDrHEqeU81s9UQOlZrzNjYZBM5ZQ
   RGowXFq8gpcnJOToZkU/8jTmXuSeW5GzHQjD+shIL6BMDldmWRfdixElI
   5Q9FepPJPX7SIpxL+3FyYzk6F0YDP4Y/k1iDbPEBZ7eg8OPCD7X/Lp2cb
   R4usRiNUhVA6cHBkL1qBgGefeTtdFh/S6ChpmFVtvR3ILpJx2BwayiQfp
   Qu4dqqPR8C+j4+/4r8y9AqoIwSmDWjOwKTHDNcYGNXQ41QAuUpq2bVNHD
   SEb/wMxEvkQPV7ZkqS98W/1bGbq+upu4Z4MxvO4FxXgzPoQW8vBzYs9aa
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="334029540"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; 
   d="scan'208";a="334029540"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2022 08:06:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="756601564"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; 
   d="scan'208";a="756601564"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004.jf.intel.com with ESMTP; 24 Oct 2022 08:06:54 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1omz2S-001VKt-1i;
        Mon, 24 Oct 2022 18:06:52 +0300
Date:   Mon, 24 Oct 2022 18:06:52 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [GIT PULL] intel-pinctrl for 6.1-1
Message-ID: <Y1aqDPIGwYwoH+B2@smile.fi.intel.com>
References: <Y1FgAAHJu/cVNAIC@black.fi.intel.com>
 <CAMRc=Medt_M0h+1TdtRnu=7v1NmGePqfFBS02+zceXGLQ4OV3w@mail.gmail.com>
 <Y1GItraKIaDqFMjG@smile.fi.intel.com>
 <Y1GJFakunT78fXmE@smile.fi.intel.com>
 <CACRpkdbSLbsxyCQUPaW2=W3A-0NxsGz9TFdhqExe=7RwcbNFLA@mail.gmail.com>
 <Y1WeMf+JQVoY2AAM@smile.fi.intel.com>
 <CACRpkdZfubwBDBrfRZV+QEU4j=1rgKu4O-QEEkMXoPZ=Y1z85Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZfubwBDBrfRZV+QEU4j=1rgKu4O-QEEkMXoPZ=Y1z85Q@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 24, 2022 at 09:16:28AM +0200, Linus Walleij wrote:
> On Sun, Oct 23, 2022 at 10:04 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Fri, Oct 21, 2022 at 10:02:35AM +0200, Linus Walleij wrote:
> 
> > > Bart are you fine with pulling this as-is? (I am.)
> >
> > Hold on a bit, I have to rebuild a whole kernel to test if I missed something
> > (it's already clear I missed lantiq patch, now in my branch, but obviously not
> >  in that tag, since I called it immutable).
> 
> OK I hold my horses waiting for your confirmation, I expect to
> pull the immutable branch once it is confirmed stable.

I hope I found all places under drivers/pinctrl to fix, but let's wait
a couple of days so Linux Next and CIs may have a chance to exercise it
a bit.

-- 
With Best Regards,
Andy Shevchenko


