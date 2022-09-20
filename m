Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CB0C5BE702
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Sep 2022 15:26:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229907AbiITN0c (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Sep 2022 09:26:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229785AbiITN0b (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Sep 2022 09:26:31 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC3E6272
        for <linux-gpio@vger.kernel.org>; Tue, 20 Sep 2022 06:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663680390; x=1695216390;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YmmpYVGnim7w6UooSPi023lt/oovAdSTMiOav9Ujq30=;
  b=PJ0UYFhmZBLZGa3AV8eGYYkcuIT0QvOy6BBzd02AaI5dw4+siO177SXh
   CopDnvTud1rARSyGiALbKaTmFYcTFKrxasp2ftwilr3J3DMi60UzXNRxs
   CWEuy+kZND4hMLmZmLVpoMQNCll3LehSo8xCblnP0RMMHFhk5uic95Y33
   RckNrE+hwxOZ1L4ltpBsZGvKO+sPePMEyw8Cj2OgI0poBDG7UKmP4GlM7
   8Io682gLsgDHz7Y/WyRTH/vbU7S7GSYrGLFlcdi5L0ptO5PXuXc5V4Fcd
   xsYMtf8hm+nOSENcI5fzJDXpVZ7dE3HQExGA7HUkmkjY0ZskuwWPL+cUQ
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="363650465"
X-IronPort-AV: E=Sophos;i="5.93,330,1654585200"; 
   d="scan'208";a="363650465"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2022 06:26:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,330,1654585200"; 
   d="scan'208";a="652092480"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 20 Sep 2022 06:26:21 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 797A5238; Tue, 20 Sep 2022 16:26:39 +0300 (EEST)
Date:   Tue, 20 Sep 2022 16:26:39 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linux GPIO <linux-gpio@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-gpio for 6.1-1
Message-ID: <Yym/j+Y9MBOIhWtK@black.fi.intel.com>
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

Hi Linux GPIO  maintainers,

A small quirk for GPIO ACPI library. Was a few weeks in Linux Next, shouldn't
be any conflicts with anything. Please pull for v6.1.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  git@gitolite.kernel.org:pub/scm/linux/kernel/git/andy/linux-gpio-intel.git tags/intel-gpio-v6.1-1

for you to fetch changes up to 0ea76c401f9245ac209f1b1ce03a7e1fb9de36e5:

  gpiolib: acpi: Add a quirk for Asus UM325UAZ (2022-09-05 13:15:56 +0300)

----------------------------------------------------------------
intel-gpio for v6.1-1

* Add a quirk for Asus UM325UAZ to make GPIO interrupts working

The following is an automated git shortlog grouped by driver:

gpiolib:
 -  acpi: Add a quirk for Asus UM325UAZ
 -  acpi: Add support to ignore programming an interrupt

----------------------------------------------------------------
Mario Limonciello (2):
      gpiolib: acpi: Add support to ignore programming an interrupt
      gpiolib: acpi: Add a quirk for Asus UM325UAZ

 drivers/gpio/gpiolib-acpi.c | 38 ++++++++++++++++++++++++++++++++++----
 1 file changed, 34 insertions(+), 4 deletions(-)

-- 
With Best Regards,
Andy Shevchenko


