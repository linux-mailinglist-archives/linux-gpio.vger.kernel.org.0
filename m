Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C15A13F6310
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Aug 2021 18:48:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230460AbhHXQsu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Aug 2021 12:48:50 -0400
Received: from mga02.intel.com ([134.134.136.20]:10207 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229896AbhHXQsu (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 24 Aug 2021 12:48:50 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="204550626"
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="204550626"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:48:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="684036618"
Received: from inlubt0177.iind.intel.com ([10.223.67.91])
  by fmsmga006.fm.intel.com with ESMTP; 24 Aug 2021 09:48:01 -0700
From:   lakshmi.sowjanya.d@intel.com
To:     linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        linux-kernel@vger.kernel.org, mgross@linux.intel.com,
        andriy.shevchenko@linux.intel.com, tamal.saha@intel.com,
        bala.senthil@intel.com, lakshmi.sowjanya.d@intel.com
Subject: [RFC PATCH v1 00/20] Review Request: Add support for Intel PMC
Date:   Tue, 24 Aug 2021 22:17:41 +0530
Message-Id: <20210824164801.28896-1-lakshmi.sowjanya.d@intel.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>

Starting with Intel(R) Tiger Lake and Elkhart Lake platforms the PMC
hardware adds the Timed I/O hardware interface.

The Timed I/O hardware implements some functionality similar to GPIO
with added timing logic that is driven by the Always Running Timer
(ART).

The Timed I/O Hardware implement 3 basic functions:
  * Input Timestamping
  * Single Shot Timed Output
  * Periodic Timed Output

 Please help to review the changes.

Thanks in advance,
Sowjanya 

Christopher Hall (9):
  gpio: Add basic GPIO driver for Intel PMC Timed I/O device
  arch: x86: Add ART support function to tsc code
  gpio: Add input code to Intel PMC Timed I/O Driver
  tools: gpio: Add additional polling support to gpio-event-mon
  kernel: time: Add system time to system counter translation
  tools: gpio: Add GPIO output generation user application
  arch/x86: Add ART nanosecond to ART conversion
  pwm: Add capability for PWM Driver managed state
  tools: gpio: Add PWM monitor application

Lakshmi Sowjanya D (11):
  gpio: Add GPIO polling interface to GPIO lib
  gpio: Add set_input and polling interface to GPIO lib code
  gpio: Add output event generation method to GPIOLIB and PMC Driver
  arch: x86: Add TSC to ART translation
  gpio: Add event count interface to gpiolib
  gpio: Add event count to Intel(R) PMC Timed I/O driver
  tools: gpio: Add event count capability to event monitor application
  gpio: Add PWM capabilities to Intel(R) PMC TIO driver
  pwm: Add second alignment to the core PWM interface
  gpio: Add PWM alignment support to the Intel(R) PMC Timed I/O driver
  gpio: Add GPIO monitor line to Intel(R) Timed I/O Driver

 MAINTAINERS                       |   7 +
 arch/x86/include/asm/tsc.h        |   5 +
 arch/x86/kernel/tsc.c             |  73 +++
 drivers/gpio/Kconfig              |  11 +
 drivers/gpio/Makefile             |   1 +
 drivers/gpio/gpio-intel-tio-pmc.c | 834 ++++++++++++++++++++++++++++++
 drivers/gpio/gpiolib-cdev.c       | 145 +++++-
 drivers/pwm/core.c                |  10 +-
 drivers/pwm/sysfs.c               |  37 ++
 include/linux/gpio/driver.h       |  29 ++
 include/linux/pwm.h               |   3 +
 include/linux/timekeeping.h       |   3 +
 include/uapi/linux/gpio.h         |  21 +
 kernel/time/timekeeping.c         |  63 +++
 tools/gpio/.gitignore             |   1 +
 tools/gpio/Build                  |   2 +
 tools/gpio/Makefile               |  21 +-
 tools/gpio/gpio-event-gen.c       | 191 +++++++
 tools/gpio/gpio-event-mon.c       |  58 ++-
 tools/gpio/gpio-pwm-mon.c         | 431 +++++++++++++++
 20 files changed, 1916 insertions(+), 30 deletions(-)
 create mode 100644 drivers/gpio/gpio-intel-tio-pmc.c
 create mode 100644 tools/gpio/gpio-event-gen.c
 create mode 100644 tools/gpio/gpio-pwm-mon.c

-- 
2.17.1

