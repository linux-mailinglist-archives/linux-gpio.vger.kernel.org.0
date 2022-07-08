Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FBB956C47C
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Jul 2022 01:15:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238346AbiGHUmV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jul 2022 16:42:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230366AbiGHUmV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jul 2022 16:42:21 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0931101F7
        for <linux-gpio@vger.kernel.org>; Fri,  8 Jul 2022 13:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657312940; x=1688848940;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2DSu0x9inPqLMMsqXWflzMySJe2WT/wgB4SN/uXMVKA=;
  b=GnOaDG3bQsgTMsNMhgIflEdjf2S8bAzil1uKLoztggEfrrLOzhf/morA
   7FQwPWhQchtXubLh27Rel+53Kq5F6ivhy/Y759Ho8j20IofyLw9PpPkNB
   ALJOeQbl9Dl7FGyCESaL4mWEmAT/VoLdrHmabVBMiwvaNcp3RkuZZBinr
   nGt9QNc5HGCG2eFOE4gORUbEIx1t0V9fA31fIgjYX0GAkV62Lg/BhT8Y1
   O+jxUt24cDk9GV2mXz+pLbPg7gDpHZ3Hn1WoRb02Mtplv/DOM7DwGxZBk
   XKOEwY2gYexIxvP5tLkQqwZ8tU9MFWUi6qRGFXDrRGxT+r0NUH5+tTIB4
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10402"; a="267401816"
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; 
   d="scan'208";a="267401816"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2022 13:42:20 -0700
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; 
   d="scan'208";a="569071806"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2022 13:42:19 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1o9uno-0018Yk-1y;
        Fri, 08 Jul 2022 23:42:16 +0300
Date:   Fri, 8 Jul 2022 23:42:16 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linux pin control <linux-gpio@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-pinctrl for 5.20-1
Message-ID: <YsiWqB1vCr4gdt7Q@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linux pin control  maintainers,

For the v5.20 we have not much stuff that was sitting a few weeks in Linux Next.
Please, pull!

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit ba79c5e45eecb9e009eca7f5da224f6e42bd4fcb:

  MAINTAINERS: Update Intel pin control to Supported (2022-06-06 12:34:54 +0300)

are available in the Git repository at:

  git@gitolite.kernel.org:pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v5.20-1

for you to fetch changes up to 25097de7b2369625994793b788fa6ed4cad664cd:

  pinctrl: intel: Add Intel Meteor Lake pin controller support (2022-06-30 17:09:18 +0300)

----------------------------------------------------------------
intel-pinctrl for v5.20-1

* Update MAINTAINERS to set the Intel pin control status to Supported
* Switch Intel pin control drivers to use struct pingroup

The following is an automated git shortlog grouped by driver:

baytrail:
 -  Switch to to embedded struct pingroup

cherryview:
 -  Switch to to embedded struct pingroup

intel:
 -  Add Intel Meteor Lake pin controller support
 -  Drop no more used members of struct intel_pingroup
 -  Switch to to embedded struct pingroup
 -  Embed struct pingroup into struct intel_pingroup

lynxpoint:
 -  Switch to to embedded struct pingroup

MAINTAINERS:
 -  Update Intel pin control to Supported

Merge branch 'ib-v5.20-amd-pinctrl':
 - Merge branch 'ib-v5.20-amd-pinctrl'

merrifield:
 -  Switch to to embedded struct pingroup

----------------------------------------------------------------
Andy Shevchenko (9):
      Merge branch 'ib-v5.20-amd-pinctrl'
      pinctrl: intel: Embed struct pingroup into struct intel_pingroup
      pinctrl: baytrail: Switch to to embedded struct pingroup
      pinctrl: cherryview: Switch to to embedded struct pingroup
      pinctrl: lynxpoint: Switch to to embedded struct pingroup
      pinctrl: merrifield: Switch to to embedded struct pingroup
      pinctrl: intel: Switch to to embedded struct pingroup
      pinctrl: intel: Drop no more used members of struct intel_pingroup
      pinctrl: intel: Add Intel Meteor Lake pin controller support

Basavaraj Natikar (6):
      pinctrl: Add pingroup and define PINCTRL_PINGROUP
      pinctrl: amd: Remove amd_pingroup and use pingroup
      pinctrl: amd: Use PINCTRL_PINGROUP to manage pingroups
      pinctrl: amd: Define and use AMD_PINS macro
      pinctrl: amd: Add amd_get_iomux_res function
      pinctrl: amd: Implement pinmux functionality

 drivers/pinctrl/intel/Kconfig              |    8 +
 drivers/pinctrl/intel/Makefile             |    1 +
 drivers/pinctrl/intel/pinctrl-baytrail.c   |   18 +-
 drivers/pinctrl/intel/pinctrl-cherryview.c |   16 +-
 drivers/pinctrl/intel/pinctrl-intel.c      |   14 +-
 drivers/pinctrl/intel/pinctrl-intel.h      |   25 +-
 drivers/pinctrl/intel/pinctrl-lynxpoint.c  |   10 +-
 drivers/pinctrl/intel/pinctrl-merrifield.c |   14 +-
 drivers/pinctrl/intel/pinctrl-meteorlake.c |  417 +++++++++
 drivers/pinctrl/pinctrl-amd.c              |  103 +++
 drivers/pinctrl/pinctrl-amd.h              | 1376 +++++++++++++++++++++++++++-
 include/linux/pinctrl/pinctrl.h            |   20 +
 12 files changed, 1925 insertions(+), 97 deletions(-)
 create mode 100644 drivers/pinctrl/intel/pinctrl-meteorlake.c

-- 
With Best Regards,
Andy Shevchenko


