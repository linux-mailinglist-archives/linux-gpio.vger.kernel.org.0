Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD8D411CAA7
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2019 11:26:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728348AbfLLK0K (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Dec 2019 05:26:10 -0500
Received: from mga11.intel.com ([192.55.52.93]:2192 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728410AbfLLK0K (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Dec 2019 05:26:10 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Dec 2019 02:26:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,305,1571727600"; 
   d="scan'208";a="211074510"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 12 Dec 2019 02:26:06 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 388E012A; Thu, 12 Dec 2019 12:26:04 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        hdegoede@redhat.com
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 0/5] pinctrl: baytrail: Clean up (part 3)
Date:   Thu, 12 Dec 2019 12:25:52 +0200
Message-Id: <20191212102557.87754-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This is a part 3 of clean up pin control driver for Intel Baytrail.
After this applied the driver will use all available data structures
from pinctrl-intel.h header.

Note, that patch which exposes common pin control data structrure for drivers
will be used by Lynxpoint as well.

This has been tested on the tablet with SD card detection and buttons pressed.

Based on our pinctrl/intel for-next branch.

Andy Shevchenko (5):
  pinctrl: baytrail: Move IRQ valid mask initialization to a dedicated
    callback
  pinctrl: intel: Share struct intel_pinctrl for wider use
  pinctrl: baytrail: Keep pointer to struct device instead of its
    container
  pinctrl: baytrail: Use local variable to keep device pointer
  pinctrl: baytrail: Reuse struct intel_pinctrl in the driver

 drivers/pinctrl/intel/pinctrl-baytrail.c | 272 +++++++++++------------
 drivers/pinctrl/intel/pinctrl-intel.c    |  35 +--
 drivers/pinctrl/intel/pinctrl-intel.h    |  44 ++++
 3 files changed, 173 insertions(+), 178 deletions(-)


base-commit: ab68b220e81fd03383c0d9e1a87b51f9bbe4db77

-- 
2.24.0

