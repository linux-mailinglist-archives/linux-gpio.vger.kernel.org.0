Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1830960E673
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Oct 2022 19:29:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234005AbiJZR3C (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Oct 2022 13:29:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231696AbiJZR24 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Oct 2022 13:28:56 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DD2B1011A1
        for <linux-gpio@vger.kernel.org>; Wed, 26 Oct 2022 10:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666805336; x=1698341336;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=tHTJ/bDJJbqusp9ZAJIHM4l7DQaX3to1JDcZuYTzItQ=;
  b=TXlwiwNbcpv4TfbJdNQTLx/FjIGjwNx9wNnAqR+HdfKTB5vjUTtVHnEB
   cnWlXhviQyPl6RSBUtJbllaSsGj+VTp28+dQNW5eilq9diRo36X4QCZJV
   Cx6fj4AZ0CCWKCVS3JU9ZTKRk4/sqyo3akMbFdmUniikkDcC+6Zcs3Wtj
   iKE4m1Cf77kO4/6b7vgNRMcc1bRlQOAckHlKeWnQ9HSIBbWoaaIJhDsrU
   u57rRKnMU4sccez5teJAl3WaR9Myb3gfeFnYf1HHcZqAq/NvgujBfOgSy
   GflckaFUEarh5l1ufp3yA0WgzqfTFDDueEVP9FwKcbQMNjftEjUiwlkJP
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="372223529"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; 
   d="scan'208";a="372223529"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2022 10:28:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="583242891"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; 
   d="scan'208";a="583242891"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 26 Oct 2022 10:28:53 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1onkCw-002luS-3A;
        Wed, 26 Oct 2022 20:28:50 +0300
Date:   Wed, 26 Oct 2022 20:28:50 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Levente =?iso-8859-1?B?Uul26XN6?= <levente.revesz@eilabs.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Martyn Welch <martyn.welch@collabora.com>,
        Haibo Chen <haibo.chen@nxp.com>, Puyou Lu <puyou.lu@gmail.com>,
        Justin Chen <justinpopo6@gmail.com>,
        Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
        Nate Drude <nate.d@variscite.com>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 2/6] gpio: pca953x: Add PCAL953X as a separate chip
 type
Message-ID: <Y1luUgS25ddeSCT9@smile.fi.intel.com>
References: <cc987520-d95b-01b9-5b65-53442ce122f6@eilabs.com>
 <9bdc962c-1cfe-8240-963c-491f3992b2cb@eilabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9bdc962c-1cfe-8240-963c-491f3992b2cb@eilabs.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 26, 2022 at 01:21:23PM +0200, Levente Révész wrote:

...

> -#define PCA_PCAL		BIT(9)
> -#define PCA_LATCH_INT		(PCA_PCAL | PCA_INT)

Looking at this again, why not to make PCAL bit as a part of the type, so you
will have the check below much easier, like masking for PCAL bit and that's it.

-- 
With Best Regards,
Andy Shevchenko


