Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93DBB56C3F5
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Jul 2022 01:15:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239415AbiGHU4X (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jul 2022 16:56:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238905AbiGHU4X (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jul 2022 16:56:23 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E58519C07
        for <linux-gpio@vger.kernel.org>; Fri,  8 Jul 2022 13:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657313783; x=1688849783;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6nwamYRyCk3byOtmGaUR7laVkS4LX9AQ31jLjN4N6bQ=;
  b=HDRwClM3w6x4ns1cft4GJ0QCdJOxt/GEO8XZE8FQEOP7UJRxOThRLyfT
   e1lM6h+43kMPcYbxowQBcxES6E9EeVSIjULdgNcB6aK3pR+1cVutulaaL
   Ds5LMjofGcE3461L47ECVHSIul5IMqPOr+DBbg9dPsGdm3R2I49wwviKF
   V5sfdRnFBu78QVjQ1sQO/7SOrJv/QR6YmPYI1yiKqGpTdFGORbHIuauO9
   n5dMOT2jsvqH/G2oWVb5ZoHUD3pcQX8tw03SH5Vh4vKIkxyCOGxMJwRVv
   81X1JkZIbCBvZx4RMT6UwnvaIVZxhhtM3+wmUAwG4X+bPmUkknExyLEDB
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10402"; a="285104831"
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; 
   d="scan'208";a="285104831"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2022 13:56:22 -0700
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; 
   d="scan'208";a="544335912"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2022 13:56:21 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1o9v1O-0018mf-0x;
        Fri, 08 Jul 2022 23:56:18 +0300
Date:   Fri, 8 Jul 2022 23:56:17 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linux GPIO <linux-gpio@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-gpio for 5.20-1
Message-ID: <YsiZ8XJAo3UYwtyl@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linux GPIO  maintainers,

For next cycle just a couple of cleanups for gpio-pch, were sitting in Linux
Next for weeks. Please pull.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit b93a8b2c5161696e732185311d309e0aaf0575be:

  gpio: dln2: make irq_chip immutable (2022-06-06 14:09:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git tags/intel-gpio-v5.20-1

for you to fetch changes up to b65bb2c148913c4020d06c9798e5e1bc18105f4f:

  gpio: pch: Change PCI device macros (2022-06-21 18:01:11 +0300)

----------------------------------------------------------------
intel-gpio for v5.20-1

* Clean up the GPIO driver of Intel EG20 PCH

The following is an automated git shortlog grouped by driver:

pch:
 -  Change PCI device macros
 -  Use dev_err_probe()

----------------------------------------------------------------
Andy Shevchenko (2):
      gpio: pch: Use dev_err_probe()
      gpio: pch: Change PCI device macros

 drivers/gpio/gpio-pch.c | 43 ++++++++++++++++++-------------------------
 1 file changed, 18 insertions(+), 25 deletions(-)

-- 
With Best Regards,
Andy Shevchenko


