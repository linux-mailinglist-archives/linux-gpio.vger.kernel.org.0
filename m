Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D0431F1A4B
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2020 15:43:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729847AbgFHNnj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Jun 2020 09:43:39 -0400
Received: from mga12.intel.com ([192.55.52.136]:64831 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729771AbgFHNnH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 8 Jun 2020 09:43:07 -0400
IronPort-SDR: t0vfmladt18rNYMXJo3mFqiApKHpuoSA3hWqDDWIvUkm74j0/H/VvWiRVzC+hnbVa/adWS+reX
 0BoGVa/aD3Ig==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2020 06:43:05 -0700
IronPort-SDR: WPzLS4OGCEoAHXiAfcZlqvNbpEe5Stdk9xmOLHVDQ9jp67ZJJjUYoV5DHk9hwEde+OpbFouzZ5
 snfGgo71QgRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,487,1583222400"; 
   d="scan'208";a="379426397"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 08 Jun 2020 06:43:03 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id ADADC180; Mon,  8 Jun 2020 16:43:02 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Serge Semin <fancer.lancer@gmail.com>, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 0/6] mfd: Make use of software nodes
Date:   Mon,  8 Jun 2020 16:42:54 +0300
Message-Id: <20200608134300.76091-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Some devices would need to have a hierarchy of properties and
child nodes passed to the child or children of MFD. For such case
we may utilize software nodes, which is superior on device properties.

Add support of software nodes to MFD core and convert one driver
to show how it looks like. This allows to get rid of legacy platform
data.

The change has been tested on Intel Galileo Gen 2.

Andy Shevchenko (5):
  gpio: dwapb: Replace irq_shared flag with fwnode type check
  gpio: dwapb: Read GPIO base from snps,gpio-base property
  mfd: intel_quark_i2c_gpio: Convert to use software nodes
  gpio: dwapb: Get rid of legacy platform data
  gpio: dwapb: Define magic number for IRQ and GPIO lines

Heikki Krogerus (1):
  mfd: core: Propagate software node group to the sub devices

 drivers/gpio/gpio-dwapb.c                | 44 +++++++++-------
 drivers/mfd/intel_quark_i2c_gpio.c       | 64 +++++++++++-------------
 drivers/mfd/mfd-core.c                   | 31 ++++++++++--
 include/linux/mfd/core.h                 |  3 ++
 include/linux/platform_data/gpio-dwapb.h | 23 ---------
 5 files changed, 85 insertions(+), 80 deletions(-)
 delete mode 100644 include/linux/platform_data/gpio-dwapb.h

-- 
2.27.0.rc2

