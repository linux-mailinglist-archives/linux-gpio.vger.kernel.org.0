Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3215C4B78C1
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Feb 2022 21:52:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234444AbiBORLK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Feb 2022 12:11:10 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:37282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242367AbiBORKp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Feb 2022 12:10:45 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFA7C11ADC7
        for <linux-gpio@vger.kernel.org>; Tue, 15 Feb 2022 09:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644945036; x=1676481036;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZyynS0l+ukYV5gXihkO4OzTHuWFJnpGx/XF4C3oqYdA=;
  b=a8ZjPDoIlY/2De2hjPhLcD/y2jRDUjheIRv7U7uPjn8FiQBLF3kvqkAb
   F97P4XF/uPT8qKapi8PwKrGr0Nvf4CJhkAjtPkAid6UknmhzqKiUTHuLQ
   4YCa3UJjRmEuemyJCznHfX9bCYnPJ5dPf7sO8BQD51IJBe3brX/cwe7ge
   O4CMAiRT7mYAi6BARh1GdOuDP5It94J7o3xyj6Wq+SLmngseGCtimZEV2
   xz7rbLXMrTrQmRLoe5KGiyicBnEc97aPDdCP5LrJ7bxOaUDoorPp+NnTB
   QGHGdoj7u1Uwsn8W7I0IpTqViMyClb+mYvtVIio3cyczZLaED2hTs5/lx
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="233940420"
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; 
   d="scan'208";a="233940420"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2022 09:07:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; 
   d="scan'208";a="632895514"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 15 Feb 2022 09:07:01 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 75780107; Tue, 15 Feb 2022 19:07:17 +0200 (EET)
Date:   Tue, 15 Feb 2022 19:07:17 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linux pin control <linux-gpio@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-pinctrl for 5.17-5
Message-ID: <YgvdxSwYkHfSuV8a@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linux pin control  maintainers,

Single revert due to possibility of clashing with real hardware (in the nearest
future) that uses ID for different pin layout. That's why for this cycle to avoid
any potential issues or even damages of a brand new hardware.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit 500c77eed0feabddd5b3afb48e32c204614a8eab:

  pinctrl: zynqmp: Revert "Unify pin naming" (2022-01-28 16:52:04 +0200)

are available in the Git repository at:

  git@gitolite.kernel.org:pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v5.17-5

for you to fetch changes up to 6f66db29e2415cbe8759c48584f9cae19b3c2651:

  pinctrl: tigerlake: Revert "Add Alder Lake-M ACPI ID" (2022-02-15 19:02:46 +0200)

----------------------------------------------------------------
intel-pinctrl for v5.17-5

* Revert misplaced ID

The following is an automated git shortlog grouped by driver:

tigerlake:
 -  Revert "Add Alder Lake-M ACPI ID"

----------------------------------------------------------------
Andy Shevchenko (1):
      pinctrl: tigerlake: Revert "Add Alder Lake-M ACPI ID"

 drivers/pinctrl/intel/pinctrl-tigerlake.c | 1 -
 1 file changed, 1 deletion(-)

-- 
With Best Regards,
Andy Shevchenko


