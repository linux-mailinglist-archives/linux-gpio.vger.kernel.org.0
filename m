Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFCB74FBEF0
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Apr 2022 16:21:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347275AbiDKOXU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Apr 2022 10:23:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347282AbiDKOWO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Apr 2022 10:22:14 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA16224F0B
        for <linux-gpio@vger.kernel.org>; Mon, 11 Apr 2022 07:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649686793; x=1681222793;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YvzBEyoi4tiz8azXvBDVBWNfe3LZv8dvOeCt3CeVM+w=;
  b=BkvIy9temFqeR4a1HWj/xqV9BkmWthRKPm//8KQVP/arwei3vMzyVPw8
   B4B85iwyMy/rQy9CiDrd9S8QQ3JXYXWyN8PgN6QgLdLRbEDJ0gJyqYv9B
   ZrGX0nyA4OirBfrqoD0PD5b2akwVSRooEcLrA9Kv4PUeOY6N9aE36uUOZ
   R4BY7RU/10fqbW3DtxJDO7q1DrIrGlCUvIQSFP1oDCnDzRd0IWsZrYov7
   WFPEJEusQmjolJ24bth2gGejvtFhsIc1ZxvwnAfreiCX2xDFfjVNHA6QT
   brNPhuxYfiFQJqSQpms5uEHJkZQ7zJuw9+XWDpCjEnL1H6O7ga9h7gPiz
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="242714437"
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; 
   d="scan'208";a="242714437"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2022 07:19:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; 
   d="scan'208";a="654638915"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 11 Apr 2022 07:19:52 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id B367B144; Mon, 11 Apr 2022 17:19:51 +0300 (EEST)
Date:   Mon, 11 Apr 2022 17:19:51 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linux GPIO <linux-gpio@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-gpio for 5.18-2
Message-ID: <YlQ5B6+iE0o2xe0e@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linux GPIO  maintainers,

Couple of fixes related to GPIO ACPI library. Second one is not a fix per se,
but coupled together, so we won't have other issues WRT unsignedness of the
pin from ACPI tables. Please, pull.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git@gitolite.kernel.org:pub/scm/linux/kernel/git/andy/linux-gpio-intel.git tags/intel-gpio-v5.18-2

for you to fetch changes up to 0c2cae09a765b1c1d842eb9328982976ec735926:

  gpiolib: acpi: Convert type for pin to be unsigned (2022-04-08 15:13:22 +0300)

----------------------------------------------------------------
intel-gpio for v5.18-2

* Couple of fixes related to handling unsigned value of the pin from ACPI

The following is an automated git shortlog grouped by driver:

gpiolib:
 -  acpi: Convert type for pin to be unsigned
 -  acpi: use correct format characters

----------------------------------------------------------------
Andy Shevchenko (1):
      gpiolib: acpi: Convert type for pin to be unsigned

Linus Torvalds (1):
      gpiolib: acpi: use correct format characters

 drivers/gpio/gpiolib-acpi.c   | 22 ++++++++++++----------
 include/linux/gpio/consumer.h |  8 +++++++-
 2 files changed, 19 insertions(+), 11 deletions(-)

-- 
With Best Regards,
Andy Shevchenko


