Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 568E47C5A10
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 19:11:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232844AbjJKRLY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 13:11:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230158AbjJKRLY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 13:11:24 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 727BB8F
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 10:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697044282; x=1728580282;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4LxYg9Eoe46IDthQuoAE8WN/ptDOClwAByDKm96rT8k=;
  b=ZKBUPHox0qYZL1zp9h1Y4u/mWJeaXzWZYAxiOxmMVaJkTWt8kMAV+W+/
   vp05jXJLf+eGEmJIVII6c442iAlV7ezuECBNoCZQmoNuMpFQ7Qf9fmhiv
   muUZpX+xgap6Oc/MT9ROFo6CRoT761od7bTTuRPe5FdaYfKJHRByUpd4C
   r+T/KfFI3Hn2ao9aKabx8NtV3ZBZtHgYytPQ+OhDatZnR9z4n8NRuoYMQ
   56N/qP4tdg7C83WuME7+0ytT0sQGWdt2a7OPbvFoaWPjeR+gfCSDLcq8r
   3JB7JbPotn4gyp6biXwH0k3H6Qq78GWEW8fItk1XW2zx0VriUBrWQ2DoH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="6277892"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; 
   d="scan'208";a="6277892"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 10:11:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="897707562"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; 
   d="scan'208";a="897707562"
Received: from unknown (HELO smile.fi.intel.com) ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 10:09:34 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qqcjt-00000004nDD-2IOJ;
        Wed, 11 Oct 2023 20:11:17 +0300
Date:   Wed, 11 Oct 2023 20:11:17 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Phil Howard <phil@gadgetoid.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][PATCH 1/3] bindings: python: optionally include
 module in sdist
Message-ID: <ZSbXNQ1sx+lDl7JV@smile.fi.intel.com>
References: <20231011121246.9467-1-phil@gadgetoid.com>
 <20231011121246.9467-2-phil@gadgetoid.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231011121246.9467-2-phil@gadgetoid.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 11, 2023 at 01:12:44PM +0100, Phil Howard wrote:
> Build gpiod into Python module.
> 
> Optional environment var USE_SYSTEM_GPIO=1 to
> generate a module that depends upon system gpiod.

...

> --- /dev/null
> +++ b/bindings/python/include
> @@ -0,0 +1 @@
> +../../include

> \ No newline at end of file

These lines are bothering me, why the new line can't be added to all affected files?

-- 
With Best Regards,
Andy Shevchenko


