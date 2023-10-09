Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1DA87BDB74
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Oct 2023 14:20:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346737AbjJIMUV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Oct 2023 08:20:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346631AbjJIMUI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Oct 2023 08:20:08 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 062E6D7D;
        Mon,  9 Oct 2023 05:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696853939; x=1728389939;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LlRgBXgL24TjcIq4xQAsOhKIwL+juOrusjjjJXgQjD4=;
  b=Gk1y5wp3ddcUSgMeprv7uonqTIQzooy61a+SOTCTNKqP+URIcRTnvq7I
   XxrAmB5jFu3WQBezyc3B6C7xa6zGQibNkziZHGM5asnaie9sDQVGJOxrb
   v2h+ogZn9fSVqmcKjWbhVC+qz+WourZG/0tYsSKfy2227x/dkpySskYuN
   bKfmfOpIPhhNTAFaA20tN1tqDwASreLUfjcHI3oK8tiBl5RScdA4uVWDP
   +ZZoc38BErXhrHG+/Px87HIst3uW4Q2icJjppgbHuQ+sJ2dbFbpgg/odn
   gHSlcvAmaTSLx/uy1CL3fM33hPU5kQAzQ7TiGe/ynYZZrMYoIqfYUlITt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="387992138"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="387992138"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 05:18:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="756693153"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="756693153"
Received: from lshebash-mobl3.ccr.corp.intel.com ([10.252.57.254])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 05:18:56 -0700
Date:   Mon, 9 Oct 2023 15:18:54 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
cc:     Hans de Goede <hdegoede@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-acpi@vger.kernel.org
Subject: [GIT PULL] Immutable branch between pdx86 int3472 branch and GPIO
 due for the v6.7 merge window.
Message-ID: <8bbffb51-96bc-c4b-8d13-f3bbf9a72c2@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bart, Linus, et. al.,

Here's a pull-req for merging into the GPIO tree.
This removes the users for acpi_get_and_request_gpiod() so it
can be removed.

 - i.


The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-ib-int3472-v6.7

for you to fetch changes up to 5ccf9873ab2bcb7c480bc2ccea55ec235d9db175:

  platform/x86: int3472: Switch to devm_get_gpiod() (2023-10-06 13:34:58 +0300)

----------------------------------------------------------------
Immutable branch between pdx86 int3472 branch and GPIO due for the v6.7 merge window.

platform-drivers-x86-ib-int3472-v6.7: v6.6-rc1 + platform-drivers-x86-int3472
for merging into the GPIO subsystem for v6.7.

----------------------------------------------------------------
Bartosz Golaszewski (1):
      platform/x86: int3472: Add new skl_int3472_gpiod_get_from_temp_lookup() helper

Hans de Goede (3):
      platform/x86: int3472: Add new skl_int3472_fill_gpiod_lookup() helper
      platform/x86: int3472: Stop using gpiod_toggle_active_low()
      platform/x86: int3472: Switch to devm_get_gpiod()

 .../platform/x86/intel/int3472/clk_and_regulator.c |  54 ++---------
 drivers/platform/x86/intel/int3472/common.h        |   7 +-
 drivers/platform/x86/intel/int3472/discrete.c      | 103 ++++++++++++++++-----
 drivers/platform/x86/intel/int3472/led.c           |  24 +----
 4 files changed, 94 insertions(+), 94 deletions(-)
