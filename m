Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B830448CD60
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jan 2022 22:03:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230516AbiALVDJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Jan 2022 16:03:09 -0500
Received: from mga05.intel.com ([192.55.52.43]:50713 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230364AbiALVDD (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 12 Jan 2022 16:03:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642021383; x=1673557383;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pjqS3uuWhWt0A1PNtjU+y7sXNGqRZX0oSt6X+hFs+JY=;
  b=U1jRxQB8ccBZNTTCUyX5mtJEFu5gXwwJte38PXFcL2Yz1VL9fRtOmEo5
   g38kGYxS/pORWfxPOHbdvR3FMyjcnBo6KsiPZnChLby6fC/gIkBAFv0xQ
   sX6dFI9+ZT2NGqYu3STsPotAnrISnjpqWJvB6qPVHdSkxX655fheLiWvJ
   67UDI570oMmkuLPDslb4yKhLdV0iwWOiqscRbe8OcCMhNI7yyWUhbgDFY
   cMSa2/XDbv3lvV5ubHeZs4NIzfmiyDuB3l0XTjD0pGfer3k4f63KfQ5jK
   NWcXcnQdjsyklVarw+2GcfiOZ5WqdJybBGUTJgCnP7nQ4jFIHl+wYON8l
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10225"; a="330200930"
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; 
   d="scan'208";a="330200930"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2022 13:03:01 -0800
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; 
   d="scan'208";a="472977444"
Received: from smile.fi.intel.com ([10.237.72.61])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2022 13:02:59 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1n7kkb-009vXt-GL;
        Wed, 12 Jan 2022 23:01:45 +0200
Date:   Wed, 12 Jan 2022 23:01:45 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     kernel test robot <lkp@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>, llvm@lists.linux.dev,
        kbuild-all@lists.01.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3] pinctrl: baytrail: Clear direct_irq_en flag on broken
 configs
Message-ID: <Yd9BuYQw8nhx+Dal@smile.fi.intel.com>
References: <20220107234456.148389-1-hdegoede@redhat.com>
 <202201090203.kgCw6bSd-lkp@intel.com>
 <eb4ef470-cfaf-13be-cb66-ca38c1a85a23@redhat.com>
 <Yd89sQz8L/KJ4BXA@smile.fi.intel.com>
 <1fb6eb89-7c87-b30e-0ebe-911ce7dcf881@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1fb6eb89-7c87-b30e-0ebe-911ce7dcf881@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 12, 2022 at 09:50:47PM +0100, Hans de Goede wrote:
> On 1/12/22 21:44, Andy Shevchenko wrote:

...

> I think you will find v4 interesting because I've done a detailed
> analysis of how the pinctrl conf0 pad register trigger bits and the IO-APIC
> trigger bits work together, which is quite enlightening to how this all
> works (and AFAICT not documented).

With excitement looking forward to it!

-- 
With Best Regards,
Andy Shevchenko


