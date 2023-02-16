Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEF4F6993E7
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Feb 2023 13:08:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229768AbjBPMIp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Feb 2023 07:08:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229593AbjBPMIo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Feb 2023 07:08:44 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21A6455E4E
        for <linux-gpio@vger.kernel.org>; Thu, 16 Feb 2023 04:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676549324; x=1708085324;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tj8voV6fZuhZzz+3XZk5V8mkpf9X9ETHPoz+1IFQo9U=;
  b=I8QPqlYLG4FCxBYGEBBJZoG4AfMDSYnBir7CNruzmfFH+NmufO9Vq5ee
   4G0bdQLeMOF9lLRrLFbjctb02RaUcgUudMIzr8uJL5Pif8yVDTZdE6JF8
   kko3s88LQ+DiDpLRC7H5yO+6tDKzvC3Ro5jlCWWpqZbTOEXQsknqlSQsm
   oQotrXMFUFI3XyONVWWxvEwg3eBiKLl0OOrpLfApjLzwMEixzEQCfL+6h
   rvnCIfz5Dyyvu+rd8rrzMhjgda//zb1FVJWzsAIPuPwsLdnMEA8m8vaDK
   V1dY4+taHB8dcH+lcn2vQ+dRZ3zWMldQW+DzBa/dkOVEb5yeKasUbTj+I
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="333869696"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; 
   d="scan'208";a="333869696"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 04:08:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="733848683"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; 
   d="scan'208";a="733848683"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 16 Feb 2023 04:08:42 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 371421A6; Thu, 16 Feb 2023 14:09:22 +0200 (EET)
Date:   Thu, 16 Feb 2023 14:09:22 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linux GPIO <linux-gpio@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-gpio for 6.2-2
Message-ID: <Y+4c8k/+CXha53Le@black.fi.intel.com>
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

A couple of patches against GPIO ACPI library for the v6.2 cycle. Were a bit in
the mailing list and Linux Next without any problems reported. Please, pull.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit ceaa837f96adb69c0df0397937cd74991d5d821a:

  Linux 6.2-rc8 (2023-02-12 14:10:17 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git tags/intel-gpio-v6.2-2

for you to fetch changes up to a69982c37cd0586e6832268155349301b87f2e35:

  gpiolib: acpi: Add a ignore wakeup quirk for Clevo NH5xAx (2023-02-15 16:58:45 +0200)

----------------------------------------------------------------
intel-gpio for v6.2-2

* Ignore spurious wakeup by touchpad on Clevo NH5xAx
* Miscellaneous fix(es)

The following is an automated git shortlog grouped by driver:

gpiolib:
 -  acpi: Add a ignore wakeup quirk for Clevo NH5xAx
 -  acpi: remove redundant declaration

----------------------------------------------------------------
Raag Jadav (1):
      gpiolib: acpi: remove redundant declaration

Werner Sembach (1):
      gpiolib: acpi: Add a ignore wakeup quirk for Clevo NH5xAx

 drivers/gpio/gpiolib-acpi.c | 12 ++++++++++++
 drivers/gpio/gpiolib-acpi.h |  1 -
 2 files changed, 12 insertions(+), 1 deletion(-)

-- 
With Best Regards,
Andy Shevchenko


