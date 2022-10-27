Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8541460FE44
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Oct 2022 19:03:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236890AbiJ0RDm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Oct 2022 13:03:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236893AbiJ0RDl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Oct 2022 13:03:41 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A4A6196379
        for <linux-gpio@vger.kernel.org>; Thu, 27 Oct 2022 10:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666890220; x=1698426220;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=/ZdY1xM9lx79qDz7snR9YO+UqOMS2gCTM+WUVrfpqUY=;
  b=fxJ8DuGfHiAH613hch/cCtb87FkDEXb1sYTmgrX/4Fw/H4aB4N5WHosP
   ppweiTWSPm1wkEqmvJ5DVU4BBFuCsdP8BWrIY7QLgtOVLOUtzFZKaS/yl
   F8eX90JYLhyYFeRr6KV5j9G8il4En3cOW1ZnJ1QlSgDzZ/F8VmJKz2nIU
   yR1uHZNn4hahNa+ToGonVA5isRMQ6DkaenzByhUbcP837ZpGJ12rvl4Nz
   +Gj4a7Rea0cZimz1qqGsEmCyvR6gopRcEV7b+YpoZuX8xaBaBZFHzDP+W
   9rvhLA++/XBGLpWYeAd0R1J+wHy0Gv8/TEfLWsFVtyKyx2XnXsN+PyLvO
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="307009129"
X-IronPort-AV: E=Sophos;i="5.95,218,1661842800"; 
   d="scan'208";a="307009129"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2022 10:03:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="961697232"
X-IronPort-AV: E=Sophos;i="5.95,218,1661842800"; 
   d="scan'208";a="961697232"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP; 27 Oct 2022 10:03:24 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1oo6Hq-003Gwm-08;
        Thu, 27 Oct 2022 20:03:22 +0300
Date:   Thu, 27 Oct 2022 20:03:21 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Martyn Welch <martyn.welch@collabora.com>
Cc:     Levente =?iso-8859-1?B?Uul26XN6?= <levente.revesz@eilabs.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Haibo Chen <haibo.chen@nxp.com>, Puyou Lu <puyou.lu@gmail.com>,
        Justin Chen <justinpopo6@gmail.com>,
        Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
        Nate Drude <nate.d@variscite.com>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 2/6] gpio: pca953x: Add PCAL953X as a separate chip
 type
Message-ID: <Y1q52efyv93/z8BC@smile.fi.intel.com>
References: <cc987520-d95b-01b9-5b65-53442ce122f6@eilabs.com>
 <9bdc962c-1cfe-8240-963c-491f3992b2cb@eilabs.com>
 <Y1luUgS25ddeSCT9@smile.fi.intel.com>
 <8b94b5a6-fac8-5087-b4da-ddba098d2265@eilabs.com>
 <ea34ed6788923b8be496317f7a962d7073946ff4.camel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ea34ed6788923b8be496317f7a962d7073946ff4.camel@collabora.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 27, 2022 at 02:54:38PM +0100, Martyn Welch wrote:
> On Thu, 2022-10-27 at 15:36 +0200, Levente Révész wrote:
> > Thank you for your guidance, it is much appreciated.
> > On Wed, 26 Oct, 2022 at 17:29:17 +0000, Andy Shevchenko wrote:
> > On Wed, 26 Oct, 2022 at 17:32:03 +0000, Andy Shevchenko wrote:

...

> > If I understand this correctly, this should be a sufficient solution:
> > 
> >  #define PCA_PCAL               BIT(9)
> >  #define PCA_TYPE_MASK          GENMASK(15, 12)
> > -#define PCA_CHIP_TYPE(x)       ((x) & PCA_TYPE_MASK)
> > +#define PCA_CHIP_TYPE(x)       (((x) & PCA_TYPE_MASK) >> 11 | ((x) &
> > PCA_PCAL) >> 9)
> > +#define PCA_SET_TYPE(x)        ((x) << 11 & PCA_TYPE_MASK | (x) << 9
> > & PCA_PCAL)
> > 
> > Use 5 bits to encode chip type: bit 15..12 and bit 9.

Easier if you move PCA_PCAL to be bit 11 and extend mask by one bit.


> > PCA_SET_TYPE() shifts bits of the TYPE to the correct positions in
> > the id.
> > PCA_CHIP_TYPE() gathers the bits from the ID to form a nice decimal
> > number.
> > 
> > -#define PCA953X_TYPE           BIT(12)
> > -#define PCA957X_TYPE           BIT(13)
> > -#define PCAL653X_TYPE          BIT(14)
> > +#define PCA953X_TYPE           2
> > +#define PCA953XM_TYPE          6
> > +#define PCAL953X_TYPE          3
> > +#define PCAL653X_TYPE          9
> > +#define PCA957X_TYPE           4
> > 
> > Types are decimal numbers. Values are carefully chosen to leave
> > existing
> > IDs unchanged.
> > 
> >     * 2 instead of            BIT(12), ID mask remains
> > 0b0001'0000'0000'0000
> >     * 4 instead of            BIT(13), ID mask remains
> > 0b0010'0000'0000'0000
> >     * 9 instead of BIT(14) | PCA_PCAL, ID mask remains
> > 0b0100'0010'0000'0000
> >     * 3 instead of BIT(12) | PCA_PCAL, ID mask remains
> > 0b0001'0010'0000'0000
> > 
> > PCAL chips have odd IDs, which means the PCA_PCAL bit will be set.
> > 
> > It seems more natural now to have a separate type, PCA953XM_TYPE for
> > pca9505,
> > pca9506 and pca9698 with the [M]ask register. Only PCA953X type chips
> > can have
> > this register anyway.
> > 
> > What do you think?
> > 
> 
> I don't like the idea of encoding whether a device is PCA or PCAL into
> the bit offsets. Primarily because it's massively opaque, making
> successfully adding support for another device that much more prone to
> issues, especially if that person isn't already intimately familiar
> with the driver. I'd also like to point out that not all PCAL can be
> handled the same. The register layout of the PCAL653X_TYPE needs to be
> handled differently from the PCAL953X_TYPE.

PCA_PCAL is about having latched interrupts, it doesn't suggest the layout. So,
somebody needs to take a pen and draw the current list of possible combinations
of the features and layouts and then we can see what can be done as a type and
what's not.

-- 
With Best Regards,
Andy Shevchenko


