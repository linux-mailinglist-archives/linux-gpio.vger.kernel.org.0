Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36CF24FBE63
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Apr 2022 16:10:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344226AbiDKOM4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Apr 2022 10:12:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346954AbiDKOMx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Apr 2022 10:12:53 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECC9E20BD2
        for <linux-gpio@vger.kernel.org>; Mon, 11 Apr 2022 07:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649686239; x=1681222239;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oKV2VyjB4bleBNjYSx628qwMhcfrX/5hJVSNPJiw3dE=;
  b=IkZTV/xerS2hXJdJeromh0khK/9VagCxl0YxJpi/wAhvpLwC/CTrMLZK
   sV6hRh5opUqtjuf2mQ2J7fIC7/if1CeN/uAJwJ76uUoCozWuwpYKudLYO
   yqWdXupH3/QLA3N2kvwuoK9vqtgdyXParyDxLfd5Ejf4tHZUTh6kvk5N5
   PQf8YvhK6kekfxHircIx+IaOWDn221U7hvU1Ix0zi2PuwcxMCeXoGWA9V
   cJDjoOm4P5Y+bCIhxuD62wEa4mEmo3aDMHHzH7PfjJ07X0msrbAiSNYXZ
   of+TBI7l/QTyIt3h8t417zKD8NjE3sHl15U1chjOQBHMi1SqX8qhLVcbW
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="259719898"
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; 
   d="scan'208";a="259719898"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2022 07:10:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; 
   d="scan'208";a="660062542"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 11 Apr 2022 07:10:06 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 228F918E; Mon, 11 Apr 2022 17:10:06 +0300 (EEST)
Date:   Mon, 11 Apr 2022 17:10:06 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linux pin control <linux-gpio@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-pinctrl for 5.18-2
Message-ID: <YlQ2vsWcV8MIUZ3X@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linux pin control  maintainers,

Single fix for recently submitted driver. No conflicts or regression reports.
Please, pull

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git@gitolite.kernel.org:pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v5.18-2

for you to fetch changes up to 0be0b70df6611205ac392d0e21f7e077f3230ee6:

  pinctrl: alderlake: Fix register offsets for ADL-N variant (2022-04-06 12:54:43 +0300)

----------------------------------------------------------------
intel-pinctrl for v5.18-2

* Fix the register offsets for Alder Lake-N

The following is an automated git shortlog grouped by driver:

alderlake:
 -  Fix register offsets for ADL-N variant

----------------------------------------------------------------
Andy Shevchenko (1):
      pinctrl: alderlake: Fix register offsets for ADL-N variant

 drivers/pinctrl/intel/pinctrl-alderlake.c | 60 ++++++++++++++++++++-----------
 1 file changed, 40 insertions(+), 20 deletions(-)

-- 
With Best Regards,
Andy Shevchenko


