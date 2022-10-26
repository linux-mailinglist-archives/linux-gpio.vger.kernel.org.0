Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A411160E657
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Oct 2022 19:22:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233690AbiJZRV7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Oct 2022 13:21:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231926AbiJZRV7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Oct 2022 13:21:59 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16A86981F0
        for <linux-gpio@vger.kernel.org>; Wed, 26 Oct 2022 10:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666804918; x=1698340918;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=9x7qrWyFFGS5aFfOFcHWqFoPZIdaEdBYyS1exqKhPGE=;
  b=kBRoGLpod+CUoMBHSBspUSGRSVOpmIbM5IipYD/afUg/3iZZWUEL/ePP
   5sqsgc4CNWbr6q9l3QfnGeIlRe1w5xnF83PYTcfomO68gtA3TLZ1rV6C8
   y+om405giPO1Mv95tFN+Mtczi1Pb16D3Czhhy626ngvqEwyZa0CPL48D7
   IXgmHA4oE7AB/shu1TgUi8hWKW8jE1lzDTk4Ar3fNNoGJVX9pM4GjvNq2
   amarBySxXrmt3lKZOKuipWM24k5NX/xXeBG7rpvJHlFa1YapiMnCnaiqg
   NBFYLeRhXbfs4EzXrYhdCvSedk4ktAw11TgUCT3mnFDWYGCgHxzDeYJro
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="370078094"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; 
   d="scan'208";a="370078094"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2022 10:21:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="583241164"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; 
   d="scan'208";a="583241164"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 26 Oct 2022 10:21:55 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1onk6C-002ljb-2u;
        Wed, 26 Oct 2022 20:21:52 +0300
Date:   Wed, 26 Oct 2022 20:21:52 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Levente =?iso-8859-1?B?Uul26XN6?= <levente.revesz@eilabs.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Martyn Welch <martyn.welch@collabora.com>,
        Haibo Chen <haibo.chen@nxp.com>, Puyou Lu <puyou.lu@gmail.com>,
        Justin Chen <justinpopo6@gmail.com>,
        Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
        Nate Drude <nate.d@variscite.com>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 1/6] gpio: pca953x: Convert PCA_TYPE from bits to
 number
Message-ID: <Y1lssJMwI+dapk0v@smile.fi.intel.com>
References: <cc987520-d95b-01b9-5b65-53442ce122f6@eilabs.com>
 <0de783a2-d35c-6f20-4c22-86d6cd8dbc41@eilabs.com>
 <Y1lsAZX1vCOZkPCR@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y1lsAZX1vCOZkPCR@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 26, 2022 at 08:18:57PM +0300, Andy Shevchenko wrote:
> On Wed, Oct 26, 2022 at 01:18:57PM +0200, Levente Révész wrote:

...

> > -#define PCA953X_TYPE		BIT(12)
> > -#define PCA957X_TYPE		BIT(13)
> > -#define PCAL653X_TYPE		BIT(14)
> > +#define PCA953X_TYPE		(0x00 << 12)
> > +#define PCAL653X_TYPE		(0x02 << 12)
> > +#define PCA957X_TYPE		(0x03 << 12)
> >  #define PCA_TYPE_MASK		GENMASK(15, 12)
> 
> Please, use decimal numbers and drop the shifts...
> 
> >  #define PCA_CHIP_TYPE(x)	((x) & PCA_TYPE_MASK)
> 
> ...instead add a shift here.

This might require a new macro

#define PCA_SET_TYPE(x)		((x) << 12)

It's just an idea, look at the result and choose one approach,
that looks best.

-- 
With Best Regards,
Andy Shevchenko


