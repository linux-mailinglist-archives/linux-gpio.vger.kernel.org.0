Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2ED224C6C9B
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Feb 2022 13:33:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233985AbiB1Mdv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Feb 2022 07:33:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232280AbiB1Mdv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Feb 2022 07:33:51 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AA272B27D
        for <linux-gpio@vger.kernel.org>; Mon, 28 Feb 2022 04:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646051592; x=1677587592;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wFXBPfnG5TnVxobiabT9wF3yczpjMygJ2MgOgoyZq9I=;
  b=nnDZ7Zvb+yXuuoXwmhM5CzH3sZpkPKOQR6vPz7Lsbjx2OcG+C2/gbC1H
   LG1xf+a6LfOycquEpcx4MJi1ssChTcl6CiWe4mpYL1wX7OA0qS9h9Gru+
   4Vf00KkwIowR4ghYG0pCC6RiyZdkuC+U09E8rFcsm+5TfwdYj6r3Orqub
   UMGWKTIl459JEeglnRL9JSbbYtL8bwG4OAY0nj7d8RewJbw865Nlxre+C
   sAf/d9wmolFxwNXYaUChFxK6iHYfUTL0I/Vw5k+LWVohPjAZ0pNpGB38q
   kuc3r/uGGqORUSp0PvwhBW5oEqsfivTjr7gCG/tUPOvLfzr/0TxrTklDg
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="252599293"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; 
   d="scan'208";a="252599293"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2022 04:33:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; 
   d="scan'208";a="507405586"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 28 Feb 2022 04:33:10 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 51D45142; Mon, 28 Feb 2022 14:33:25 +0200 (EET)
Date:   Mon, 28 Feb 2022 14:33:25 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linux GPIO <linux-gpio@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-gpio for 5.18-1
Message-ID: <YhzBFbci4OnhfxTJ@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linux GPIO  maintainers,

Set of (almost) Intel GPIO driver updates, which hanging in Linux Next for
a few weeks. No merge conflicts observed. Please, pull for v5.18-rc1.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git@gitolite.kernel.org:pub/scm/linux/kernel/git/andy/linux-gpio-intel.git tags/intel-gpio-v5.18-1

for you to fetch changes up to a1ce76e89907a69713f729ff21db1efa00f3bb47:

  gpio: tps68470: Allow building as module (2022-01-24 17:23:15 +0200)

----------------------------------------------------------------
intel-gpio for v5.18-1

* Set IRQ bus token in gpio-crystalcove to avoid debugfs error
* Check return value of kstrdup() in gpio-merrifield to error out earlier
* Clean up couple of drivers from unneeded of_node usage
* Allow gpio-tps68470 to be built as module to reduce memory foot print

The following is an automated git shortlog grouped by driver:

altera-a10sr:
 -  Switch to use fwnode instead of of_node

crystalcove:
 -  Set IRQ domain bus token to DOMAIN_BUS_WIRED

merrifield:
 -  check the return value of devm_kstrdup()

tegra:
 -  Get rid of duplicate of_node assignment

tps68470:
 -  Allow building as module

----------------------------------------------------------------
Andy Shevchenko (2):
      gpio: altera-a10sr: Switch to use fwnode instead of of_node
      gpio: tegra: Get rid of duplicate of_node assignment

Hans de Goede (2):
      gpio: crystalcove: Set IRQ domain bus token to DOMAIN_BUS_WIRED
      gpio: tps68470: Allow building as module

Xiaoke Wang (1):
      gpio: merrifield: check the return value of devm_kstrdup()

 drivers/gpio/Kconfig             | 6 +-----
 drivers/gpio/gpio-altera-a10sr.c | 3 ++-
 drivers/gpio/gpio-crystalcove.c  | 9 ++++++++-
 drivers/gpio/gpio-merrifield.c   | 3 +++
 drivers/gpio/gpio-tegra.c        | 1 -
 drivers/gpio/gpio-tps68470.c     | 5 ++++-
 6 files changed, 18 insertions(+), 9 deletions(-)

-- 
With Best Regards,
Andy Shevchenko


