Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26E486095F5
	for <lists+linux-gpio@lfdr.de>; Sun, 23 Oct 2022 22:04:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230377AbiJWUEH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 23 Oct 2022 16:04:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230235AbiJWUEG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 23 Oct 2022 16:04:06 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 668EE6D869
        for <linux-gpio@vger.kernel.org>; Sun, 23 Oct 2022 13:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666555445; x=1698091445;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ix2petLJGIC9gujUzZFXts8bnk6sIVu+sipjRv8K3Ww=;
  b=BgwsNPuIW4b6jEQOQhxCjS9lnwFcTNvD+aC+SFuju4p+v4P2wDzeYRFZ
   NmCd3yvoINTZaYATYEuFQ4x3pEv0KrwTXXph8OEzLYKbfcZ/I7pgMXJm9
   W040kOyhMULu+INPItObA1unOL8mgxwfkD9rcrhadKPpoKE8bBvKZ/FK5
   yVHaERYdcaypqeo70JBLboHFoKp7MCc9+fxYSHd2bUTEFkDHWoxkz+9no
   BtaZM9jHmTLPeQIkbs24+4LLzHsO5m3S5MPjY9XyVIkwEs+Fca00vG5u5
   vGGIaaxaHB4h32eBgE/MAR8xGrxENMjxDgWPNMYCCjb8m7Et8KlPsGi2C
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10509"; a="308981303"
X-IronPort-AV: E=Sophos;i="5.95,207,1661842800"; 
   d="scan'208";a="308981303"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2022 13:04:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10509"; a="720286376"
X-IronPort-AV: E=Sophos;i="5.95,207,1661842800"; 
   d="scan'208";a="720286376"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP; 23 Oct 2022 13:04:03 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1omhCT-001780-2f;
        Sun, 23 Oct 2022 23:04:01 +0300
Date:   Sun, 23 Oct 2022 23:04:01 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [GIT PULL] intel-pinctrl for 6.1-1
Message-ID: <Y1WeMf+JQVoY2AAM@smile.fi.intel.com>
References: <Y1FgAAHJu/cVNAIC@black.fi.intel.com>
 <CAMRc=Medt_M0h+1TdtRnu=7v1NmGePqfFBS02+zceXGLQ4OV3w@mail.gmail.com>
 <Y1GItraKIaDqFMjG@smile.fi.intel.com>
 <Y1GJFakunT78fXmE@smile.fi.intel.com>
 <CACRpkdbSLbsxyCQUPaW2=W3A-0NxsGz9TFdhqExe=7RwcbNFLA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdbSLbsxyCQUPaW2=W3A-0NxsGz9TFdhqExe=7RwcbNFLA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 21, 2022 at 10:02:35AM +0200, Linus Walleij wrote:
> On Thu, Oct 20, 2022 at 7:44 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Thu, Oct 20, 2022 at 08:43:18PM +0300, Andy Shevchenko wrote:
> > > On Thu, Oct 20, 2022 at 07:31:23PM +0200, Bartosz Golaszewski wrote:
> > > > On Thu, Oct 20, 2022 at 4:58 PM Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:

...

> > > > Can you send the GPIO changes separately? This way I don't need to
> > > > pull all those pinctrl patches into the GPIO PR for the next merge
> > > > window.
> > >
> > > Some of them, but not all, if that what you wish.
> > > I.o.w. a couple of the GPIO changes must be part of pin control series.
> >
> > And I just realized that if any of new GPIO code will appear with the wrong
> > headers, there will be an inconsistent state. That said, I prefer this PR is
> > go as is.
> 
> Bart are you fine with pulling this as-is? (I am.)

Hold on a bit, I have to rebuild a whole kernel to test if I missed something
(it's already clear I missed lantiq patch, now in my branch, but obviously not
 in that tag, since I called it immutable).

> Last merge window I pulled in a big I2C cleanup (remove to return void on
> 6 million drivers) and it was fine, my diffstat looked horrible but Torvalds
> accepted it anyway I just mentioned it to him.
> 
> I think there is a way to shave off the irrelevant stuff from the diffstat,
> and I think Andy even told me how to do this but can't find/remember the
> git method used.

IIRC when you create a pull request, do it from the certain base, like
origin/master..HEAD~0 and it will drop the applied changes automatically.
But I don't remember this by heart, so need to refresh my memories as well.

-- 
With Best Regards,
Andy Shevchenko


