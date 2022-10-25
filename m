Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F07BC60CD99
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Oct 2022 15:35:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232897AbiJYNfJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Oct 2022 09:35:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232875AbiJYNfI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Oct 2022 09:35:08 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7A72108DD3
        for <linux-gpio@vger.kernel.org>; Tue, 25 Oct 2022 06:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666704907; x=1698240907;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jYNNblmmEdUtvpRaTp6byuwPnm4td70UypQkTQ3DsCE=;
  b=DgppIAowL9JUE+68gH9yfxZtkx7a7YBNiK9LTOpxqM/njSdNPVJczKvg
   TeU9zBisKl38vpE2LEJq3TAC+IEMeN0laYO1lHJACUiwKE9xFT/h1XG8y
   v/8mZNYt8fgZUzIIbAnr7SgEKhKQtKyuFfWs3WVzAjqal1JDpC7xiaE5o
   B4YKuQYE81QPTRWFhxbRztR2T/OgnQsy7F8orEZbZ0fkcAS1TsZ7fJ1jU
   0IRHo5aEdGPCGBrCfqkjU/7KHXzP/0xjr2kM++avvY+sDYJEQEapmqp/w
   oHpaQve4JmkfM8jIIoX9KzXSlVboLFfTV2s+rBToZMoIlNADJn0LW+hDH
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="290975400"
X-IronPort-AV: E=Sophos;i="5.95,212,1661842800"; 
   d="scan'208";a="290975400"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2022 06:34:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="736824881"
X-IronPort-AV: E=Sophos;i="5.95,212,1661842800"; 
   d="scan'208";a="736824881"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP; 25 Oct 2022 06:34:55 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1onK50-0021RN-1c;
        Tue, 25 Oct 2022 16:34:54 +0300
Date:   Tue, 25 Oct 2022 16:34:54 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [GIT PULL] intel-pinctrl for 6.1-1
Message-ID: <Y1fl/g9ACUwTdOCu@smile.fi.intel.com>
References: <Y1FgAAHJu/cVNAIC@black.fi.intel.com>
 <CAMRc=Medt_M0h+1TdtRnu=7v1NmGePqfFBS02+zceXGLQ4OV3w@mail.gmail.com>
 <Y1GItraKIaDqFMjG@smile.fi.intel.com>
 <Y1GJFakunT78fXmE@smile.fi.intel.com>
 <CACRpkdbSLbsxyCQUPaW2=W3A-0NxsGz9TFdhqExe=7RwcbNFLA@mail.gmail.com>
 <Y1WeMf+JQVoY2AAM@smile.fi.intel.com>
 <CACRpkdZfubwBDBrfRZV+QEU4j=1rgKu4O-QEEkMXoPZ=Y1z85Q@mail.gmail.com>
 <Y1aqDPIGwYwoH+B2@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1aqDPIGwYwoH+B2@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 24, 2022 at 06:06:52PM +0300, Andy Shevchenko wrote:
> On Mon, Oct 24, 2022 at 09:16:28AM +0200, Linus Walleij wrote:
> > On Sun, Oct 23, 2022 at 10:04 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Fri, Oct 21, 2022 at 10:02:35AM +0200, Linus Walleij wrote:

...

> > > > Bart are you fine with pulling this as-is? (I am.)
> > >
> > > Hold on a bit, I have to rebuild a whole kernel to test if I missed something
> > > (it's already clear I missed lantiq patch, now in my branch, but obviously not
> > >  in that tag, since I called it immutable).
> > 
> > OK I hold my horses waiting for your confirmation, I expect to
> > pull the immutable branch once it is confirmed stable.
> 
> I hope I found all places under drivers/pinctrl to fix, but let's wait
> a couple of days so Linux Next and CIs may have a chance to exercise it
> a bit.

New PR has been sent.

-- 
With Best Regards,
Andy Shevchenko


