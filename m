Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11DBF68187E
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jan 2023 19:17:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234038AbjA3SRG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Jan 2023 13:17:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230088AbjA3SRG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Jan 2023 13:17:06 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 001822BEC5
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jan 2023 10:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675102624; x=1706638624;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EgV9+i26XOuuU0Ld2zamPXgtSMabYzvBRjHZVsYD8dM=;
  b=G8jRw/+nG4746RVOgUlTAGWVk709VMxliaE+Oz3I80GQlfcjTyr6W0l2
   A2hVPt0eYGZp6Nk2wQDy3OLCkUu92HJZ5kTcVQsLrKlsgZlJKumYr8mSQ
   +xcfmrhnCF+PtpHS4co/0Dq+D+uetGFAUVOnenJZvgkf/x6tddeUjndIp
   ui1PKrKUDQ81Mki9D2KRDvsWu+o34BW2wfNOXpVFvfrB2bK8qmX8Gl5ly
   sQb+IY/PKXI2BadeNXLMWnnmm2hHlR2u4iVohIOm6mBGBjmwc1J6E4XZg
   DXPx7ldFeRTqOXGNUOMXL1cxznbCM86I/nbsAQ97t11vte91rujrsHGNb
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="392180796"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; 
   d="scan'208";a="392180796"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 10:17:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="788116987"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; 
   d="scan'208";a="788116987"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 30 Jan 2023 10:17:02 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 1C85F152; Mon, 30 Jan 2023 20:17:39 +0200 (EET)
Date:   Mon, 30 Jan 2023 20:17:39 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linux pin control <linux-gpio@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-pinctrl for 6.3-1
Message-ID: <Y9gJw0zLe3g10WYl@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linux pin control  maintainers,

Here is the bunch of refactoring and cleanups for Intel pin control drivers for
v6.3 cycle. Has been for a few weeks in Linux Next without any issue reported.
Please pull for next.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v6.3-1

for you to fetch changes up to 88f8ac47bddc1674b2840c733f1120a548037199:

  pinctrl: Proofreading and updating the documentation (part 2) (2023-01-17 17:42:29 +0200)

----------------------------------------------------------------
intel-pinctrl for v6.3-1

* Add ~4kOhm bias support to Intel pin control drivers
* Convert Intel pin control drivers to use INTEL_COMMUNITY_*()
* Add struct pinfunction and use it in Intel pin control drivers
* Make pin control documentation up to date
* Miscellaneous cleanups

The following is an automated git shortlog grouped by driver:

pinctrl:
 - Proofreading and updating the documentation accordingly
 - Proofreading and updating the documentation (part 2)

alderlake:
 -  Replace ADL_COMMUNITY() by INTEL_COMMUNITY_GPPS()

baytrail:
 -  Convert to use new memeber in struct intel_function

broxton:
 -  Replace BXT_COMMUNITY() by INTEL_COMMUNITY_SIZE()

cannonlake:
 -  Replace CNL_COMMUNITY() by INTEL_COMMUNITY_GPPS()

cedarfork:
 -  Replace CDF_COMMUNITY() by INTEL_COMMUNITY_GPPS()

cherryview:
 -  Convert to use new memeber in struct intel_function

denverton:
 -  Replace DNV_COMMUNITY() by INTEL_COMMUNITY_GPPS()

elkhartlake:
 -  Replace EHL_COMMUNITY() by INTEL_COMMUNITY_GPPS()

emmitsburg:
 -  Replace EBG_COMMUNITY() by INTEL_COMMUNITY_GPPS()

geminilake:
 -  Replace GLK_COMMUNITY() by INTEL_COMMUNITY_SIZE()

icelake:
 -  Replace ICL_COMMUNITY() by INTEL_COMMUNITY_GPPS()

intel:
 -  Get rid of unused members in struct intel_function
 -  Make use of struct pinfunction and PINCTRL_PINFUNCTION()
 -  Define maximum pad number in the group
 -  Use same order of bit fields for PADCFG2
 -  Add ~4k bias support
 -  Add definitions to all possible biases
 -  Deduplicate some code in intel_config_set_pull()
 -  Add default case to intel_config_set_pull()
 -  Convert to generic_handle_domain_irq()
 -  Always use gpp_num_padown_regs in the main driver
 -  Introduce INTEL_COMMUNITY_*() to unify community macros

Introduce struct pinfunction and PINCTRL_PINFUNCTION() macro:
 - Introduce struct pinfunction and PINCTRL_PINFUNCTION() macro

jasperlake:
 -  Replace JSL_COMMUNITY() by INTEL_COMMUNITY_GPPS()

lakefield:
 -  Replace LKF_COMMUNITY() by INTEL_COMMUNITY_GPPS()

lewisburg:
 -  Replace LBG_COMMUNITY() by INTEL_COMMUNITY_SIZE()

lynxpoint:
 -  Convert to use new memeber in struct intel_function

merrifield:
 -  Convert to use new memeber in struct intel_function

meteorlake:
 -  Replace MTL_COMMUNITY() by INTEL_COMMUNITY_GPPS()

moorefield:
 -  Convert to use new memeber in struct intel_function

sunrisepoint:
 -  Replace SPT_COMMUNITY() by INTEL_COMMUNITY_*()

tigerlake:
 -  Replace TGL_COMMUNITY() by INTEL_COMMUNITY_GPPS()

----------------------------------------------------------------
Andy Shevchenko (33):
      pinctrl: intel: Introduce INTEL_COMMUNITY_*() to unify community macros
      pinctrl: alderlake: Replace ADL_COMMUNITY() by INTEL_COMMUNITY_GPPS()
      pinctrl: broxton: Replace BXT_COMMUNITY() by INTEL_COMMUNITY_SIZE()
      pinctrl: cannonlake: Replace CNL_COMMUNITY() by INTEL_COMMUNITY_GPPS()
      pinctrl: cedarfork: Replace CDF_COMMUNITY() by INTEL_COMMUNITY_GPPS()
      pinctrl: denverton: Replace DNV_COMMUNITY() by INTEL_COMMUNITY_GPPS()
      pinctrl: elkhartlake: Replace EHL_COMMUNITY() by INTEL_COMMUNITY_GPPS()
      pinctrl: emmitsburg: Replace EBG_COMMUNITY() by INTEL_COMMUNITY_GPPS()
      pinctrl: geminilake: Replace GLK_COMMUNITY() by INTEL_COMMUNITY_SIZE()
      pinctrl: icelake: Replace ICL_COMMUNITY() by INTEL_COMMUNITY_GPPS()
      pinctrl: jasperlake: Replace JSL_COMMUNITY() by INTEL_COMMUNITY_GPPS()
      pinctrl: lakefield: Replace LKF_COMMUNITY() by INTEL_COMMUNITY_GPPS()
      pinctrl: lewisburg: Replace LBG_COMMUNITY() by INTEL_COMMUNITY_SIZE()
      pinctrl: meteorlake: Replace MTL_COMMUNITY() by INTEL_COMMUNITY_GPPS()
      pinctrl: tigerlake: Replace TGL_COMMUNITY() by INTEL_COMMUNITY_GPPS()
      pinctrl: sunrisepoint: Replace SPT_COMMUNITY() by INTEL_COMMUNITY_*()
      pinctrl: intel: Always use gpp_num_padown_regs in the main driver
      pinctrl: intel: Convert to generic_handle_domain_irq()
      pinctrl: intel: Add default case to intel_config_set_pull()
      pinctrl: intel: Deduplicate some code in intel_config_set_pull()
      pinctrl: intel: Add definitions to all possible biases
      pinctrl: intel: Add ~4k bias support
      pinctrl: intel: Use same order of bit fields for PADCFG2
      pinctrl: intel: Define maximum pad number in the group
      pinctrl: Introduce struct pinfunction and PINCTRL_PINFUNCTION() macro
      pinctrl: intel: Make use of struct pinfunction and PINCTRL_PINFUNCTION()
      pinctrl: baytrail: Convert to use new memeber in struct intel_function
      pinctrl: cherryview: Convert to use new memeber in struct intel_function
      pinctrl: lynxpoint: Convert to use new memeber in struct intel_function
      pinctrl: merrifield: Convert to use new memeber in struct intel_function
      pinctrl: moorefield: Convert to use new memeber in struct intel_function
      pinctrl: intel: Get rid of unused members in struct intel_function
      pinctrl: Proofreading and updating the documentation accordingly

Bagas Sanjaya (1):
      pinctrl: Proofreading and updating the documentation (part 2)

 Documentation/driver-api/pin-control.rst     | 498 +++++++++++++--------------
 drivers/pinctrl/intel/pinctrl-alderlake.c    |  18 +-
 drivers/pinctrl/intel/pinctrl-baytrail.c     |  10 +-
 drivers/pinctrl/intel/pinctrl-broxton.c      |  31 +-
 drivers/pinctrl/intel/pinctrl-cannonlake.c   |  31 +-
 drivers/pinctrl/intel/pinctrl-cedarfork.c    |  13 +-
 drivers/pinctrl/intel/pinctrl-cherryview.c   |   6 +-
 drivers/pinctrl/intel/pinctrl-denverton.c    |  13 +-
 drivers/pinctrl/intel/pinctrl-elkhartlake.c  |  24 +-
 drivers/pinctrl/intel/pinctrl-emmitsburg.c   |  13 +-
 drivers/pinctrl/intel/pinctrl-geminilake.c   |  21 +-
 drivers/pinctrl/intel/pinctrl-icelake.c      |  35 +-
 drivers/pinctrl/intel/pinctrl-intel.c        |  74 ++--
 drivers/pinctrl/intel/pinctrl-intel.h        |  55 ++-
 drivers/pinctrl/intel/pinctrl-jasperlake.c   |  13 +-
 drivers/pinctrl/intel/pinctrl-lakefield.c    |  13 +-
 drivers/pinctrl/intel/pinctrl-lewisburg.c    |  12 +-
 drivers/pinctrl/intel/pinctrl-lynxpoint.c    |   8 +-
 drivers/pinctrl/intel/pinctrl-merrifield.c   |   6 +-
 drivers/pinctrl/intel/pinctrl-meteorlake.c   |  23 +-
 drivers/pinctrl/intel/pinctrl-moorefield.c   |   6 +-
 drivers/pinctrl/intel/pinctrl-sunrisepoint.c |  37 +-
 drivers/pinctrl/intel/pinctrl-tigerlake.c    |  30 +-
 include/linux/pinctrl/pinctrl.h              |  20 ++
 24 files changed, 440 insertions(+), 570 deletions(-)

-- 
With Best Regards,
Andy Shevchenko


