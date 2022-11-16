Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB0B962B5E3
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Nov 2022 10:03:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231221AbiKPJD2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Nov 2022 04:03:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229862AbiKPJDM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Nov 2022 04:03:12 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36017F014
        for <linux-gpio@vger.kernel.org>; Wed, 16 Nov 2022 01:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668589350; x=1700125350;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b4SJRR2GkwSipqtLqaujFhcFXWBPNvednbRpCEHf9Jc=;
  b=H0EPuaR2xCIfNDxWTm2I+5cxq1nRm7LEpceonAD2NwLfw6j8X4Uvd60d
   UYldf93/9rGxLnQUfsFyDSZXhrzkquTXyPfnObeS9PIReLypUeeaypfPB
   lC10eQ51Jn+qIHA2Q3Czv1M8XBOL4aEoEyJFDDHQuXi1Zf4YX0Csydl09
   fHQIbsP1+z2cvXN+y8jQT79XOoqQFIpoebhc9w/UxV3QRqErHVSGftQ+j
   f0EAsrPEy4ssIpumqPJqX6Kk8sPn5abGKmXnmNKNoIfLwrlARl+y3vxYc
   9mYrsd/Ze6MpeO53Z+scYPRzthWiQBb5PARYVyH8qTLQjnxy/5gFlcD0c
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="339303876"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="339303876"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2022 01:02:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="672324268"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="672324268"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 16 Nov 2022 01:02:28 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 271F62F3; Wed, 16 Nov 2022 11:02:53 +0200 (EET)
Date:   Wed, 16 Nov 2022 11:02:53 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linux GPIO <linux-gpio@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-gpio for 6.2-1
Message-ID: <Y3SnPaO3yhAs96tn@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linux GPIO  maintainers,

Rather quite small GPIO updates from me for the v6.2 cycle.
Was a few weeks in Linux Next without any problems reported.
Please pull!

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git tags/intel-gpio-v6.2-1

for you to fetch changes up to 8d259847243d1e21a866e828c4ce90d759f3d17b:

  gpiolib: cdev: Fix typo in kernel doc for struct line (2022-10-25 19:48:55 +0300)

----------------------------------------------------------------
intel-gpio for v6.2-1

* Miscellaneous updates to the core (cdev, acpi) and Intel Merrifield driver

The following is an automated git shortlog grouped by driver:

gpiolib:
 -  cdev: Fix typo in kernel doc for struct line
 -  acpi: Use METHOD_NAME__AEI macro for acpi_walk_resources

merrifield:
 -  Use str_enable_disable() helper

----------------------------------------------------------------
Andy Shevchenko (2):
      gpio: merrifield: Use str_enable_disable() helper
      gpiolib: cdev: Fix typo in kernel doc for struct line

Xiang Yang (1):
      gpiolib: acpi: Use METHOD_NAME__AEI macro for acpi_walk_resources

 drivers/gpio/gpio-merrifield.c | 3 ++-
 drivers/gpio/gpiolib-acpi.c    | 2 +-
 drivers/gpio/gpiolib-cdev.c    | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

-- 
With Best Regards,
Andy Shevchenko


