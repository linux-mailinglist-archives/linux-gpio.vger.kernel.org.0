Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5266B791102
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Sep 2023 07:44:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352272AbjIDFoh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Sep 2023 01:44:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352268AbjIDFog (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Sep 2023 01:44:36 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1E11130;
        Sun,  3 Sep 2023 22:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693806269; x=1725342269;
  h=from:to:cc:subject:date:message-id;
  bh=UxnEqFl3RYyjtglaDuEg0yroBTWEQOMW0BwCNFAD4tI=;
  b=iJ4MTe3ahp0iMnM7CHcrKRaveJITA7RiJcUoIL3gRsDylUt6DuZG6+80
   1tyghb06QIM9Hij3IVy0A6SGmp3B9EqTfRRJCLy6fxJ2kZYdDmAmHeUYV
   BA8l39XlmAkOYJqgAPIyuXWEnAoc/pO2HwEOSNy8qr9f9dPyhstWqSsf0
   bXcC8fXCSb0i+T57Y/1cRZjiTdXG3p9kBhDfcD/UrUU0jCMAiRJdZFmNg
   ibiAQR4NxE3J2kROX2XKi7oEpKhtLxUrbRXwXJWNKq1HgiL6SKOd7sMw/
   1NkgKJ6M8dgoUUXrvFTkqwhU6LsFYLK9y1XyfFESYmcYePhO/gODHKrDy
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="361541796"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000"; 
   d="scan'208";a="361541796"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2023 22:44:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="855482757"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000"; 
   d="scan'208";a="855482757"
Received: from shsensorbuild2.sh.intel.com ([10.239.134.197])
  by fmsmga002.fm.intel.com with ESMTP; 03 Sep 2023 22:44:23 -0700
From:   Wentong Wu <wentong.wu@intel.com>
To:     gregkh@linuxfoundation.org, arnd@arndb.de, mka@chromium.org,
        oneukum@suse.com, lee@kernel.org, wsa@kernel.org,
        kfting@nuvoton.com, broonie@kernel.org, linus.walleij@linaro.org,
        hdegoede@redhat.com, maz@kernel.org, brgl@bgdev.pl,
        linux-usb@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org,
        andriy.shevchenko@linux.intel.com, heikki.krogerus@linux.intel.com,
        andi.shyti@linux.intel.com, sakari.ailus@linux.intel.com,
        bartosz.golaszewski@linaro.org, srinivas.pandruvada@intel.com
Cc:     zhifeng.wang@intel.com, Wentong Wu <wentong.wu@intel.com>
Subject: [PATCH v14 0/4] Add Intel LJCA device driver
Date:   Mon,  4 Sep 2023 13:44:17 +0800
Message-Id: <1693806261-12958-1-git-send-email-wentong.wu@intel.com>
X-Mailer: git-send-email 2.7.4
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add driver for Intel La Jolla Cove Adapter (LJCA) device. This
IO-expander expands additional functions to the host system
such as GPIO, I2C and SPI with USB host interface. We add 4
drivers to support this device: a USB driver, a GPIO chip driver,
a I2C controller driver and a SPI controller driver.

---
v14:
 - fix build error: implicit declaration of function 'acpi_dev_clear_dependencies'

v13:
 - make ljca-usb more robust with the help of Hans de Goede
 - call acpi_dev_clear_dependencies() to mark _DEP ACPI dependencies on the I2C controller as satisfied, and patch is from Hans de Goede

v12:
 - switch dev_err to dev_dbg for i2c-ljca driver
 - avoid err printing because of calling usb_kill_urb when attempts to resubmit the rx urb

v11:
 - switch dev_err to dev_dbg for i2c-ljca driver
 - remove message length check because of defined quirk structure
 - remove I2C_FUNC_SMBUS_EMUL support

v10:
 - remove ljca_i2c_format_slave_addr
 - remove memset before write write w_packet
 - make ljca_i2c_stop void and print err message in case failure
 - use dev_err_probe in ljca_i2c_probe function

v9:
 - overhaul usb-ljca driver to make it more structured and easy understand
 - fix memory leak issue for usb-ljca driver
 - add spinlock to protect tx_buf and ex_buf
 - change exported APIs for usb-ljca driver
 - unify prefix for structures and functions for i2c-ljca driver
 - unify prefix for structures and functions for spi-ljca driver
 - unify prefix for structures and functions for gpio-ljca driver
 - update gpio-ljca, i2c-ljca and spi-ljca drivers according to usb-ljca's changes

Wentong Wu (4):
  usb: Add support for Intel LJCA device
  i2c: Add support for Intel LJCA USB I2C driver
  spi: Add support for Intel LJCA USB SPI driver
  gpio: update Intel LJCA USB GPIO driver

 drivers/gpio/Kconfig          |   4 +-
 drivers/gpio/gpio-ljca.c      | 246 +++++++------
 drivers/i2c/busses/Kconfig    |  11 +
 drivers/i2c/busses/Makefile   |   1 +
 drivers/i2c/busses/i2c-ljca.c | 334 +++++++++++++++++
 drivers/spi/Kconfig           |  11 +
 drivers/spi/Makefile          |   1 +
 drivers/spi/spi-ljca.c        | 297 +++++++++++++++
 drivers/usb/misc/Kconfig      |  14 +
 drivers/usb/misc/Makefile     |   1 +
 drivers/usb/misc/usb-ljca.c   | 834 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/usb/ljca.h      | 113 ++++++
 12 files changed, 1762 insertions(+), 105 deletions(-)
 create mode 100644 drivers/i2c/busses/i2c-ljca.c
 create mode 100644 drivers/spi/spi-ljca.c
 create mode 100644 drivers/usb/misc/usb-ljca.c
 create mode 100644 include/linux/usb/ljca.h

-- 
2.7.4

