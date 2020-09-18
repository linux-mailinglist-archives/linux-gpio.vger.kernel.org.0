Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B629A270033
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Sep 2020 16:50:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726518AbgIROuv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Sep 2020 10:50:51 -0400
Received: from mga12.intel.com ([192.55.52.136]:27938 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726461AbgIROuu (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 18 Sep 2020 10:50:50 -0400
IronPort-SDR: Z+sVFEZhxvJ9dNd2MiUVYT2cAP5wuhg4iC3032uQtPq6TqwgnBQVagc7JPdRBZDZvjj2DafwhS
 kEILKKz2JFHA==
X-IronPort-AV: E=McAfee;i="6000,8403,9747"; a="139444836"
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; 
   d="scan'208";a="139444836"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2020 07:50:49 -0700
IronPort-SDR: RmzUjEG7zaE+9mKQDxN9S3x54bLXYBZkXuVfOsw5CYqp4fBioZQpzVhUYVImDlQQw2t3bPdmil
 zZ7wY5ej+esQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; 
   d="scan'208";a="380923859"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 18 Sep 2020 07:50:48 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 32D12165; Fri, 18 Sep 2020 17:50:47 +0300 (EEST)
Date:   Fri, 18 Sep 2020 17:50:47 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-pinctrl for 5.10-1
Message-ID: <20200918145047.GA71533@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

Regular bunch of cleanups and fixes of Intel pin control drivers for v5.10.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v5.10-1

for you to fetch changes up to a0bf06dc51dbbc5ad182b1bcf4d879db8d297c5e:

  pinctrl: cherryview: Preserve CHV_PADCTRL1_INVRXTX_TXDATA flag on GPIOs (2020-09-07 11:57:19 +0300)

----------------------------------------------------------------
intel-pinctrl for v5.10-1

* Add last part of cleanup Cherryview driver to align with other drivers
* Due to above clean up Cherryview and Baytrail drivers to use common API

The following is an automated git shortlog grouped by driver:

baytrail:
 -  Switch to use intel_pinctrl_get_soc_data()

cherryview:
 -  Preserve CHV_PADCTRL1_INVRXTX_TXDATA flag on GPIOs
 -  Switch to use intel_pinctrl_get_soc_data()
 -  Utilize temporary variable to hold device pointer
 -  Switch to use struct intel_pinctrl
 -  Move custom community members to separate data struct
 -  Drop stale comment

intel:
 -  Update header block to reflect direct dependencies
 -  Extract intel_pinctrl_get_soc_data() helper for wider use

----------------------------------------------------------------
Andy Shevchenko (8):
      pinctrl: cherryview: Drop stale comment
      pinctrl: cherryview: Move custom community members to separate data struct
      pinctrl: cherryview: Switch to use struct intel_pinctrl
      pinctrl: cherryview: Utilize temporary variable to hold device pointer
      pinctrl: intel: Extract intel_pinctrl_get_soc_data() helper for wider use
      pinctrl: baytrail: Switch to use intel_pinctrl_get_soc_data()
      pinctrl: cherryview: Switch to use intel_pinctrl_get_soc_data()
      pinctrl: intel: Update header block to reflect direct dependencies

Hans de Goede (1):
      pinctrl: cherryview: Preserve CHV_PADCTRL1_INVRXTX_TXDATA flag on GPIOs

 drivers/pinctrl/intel/Kconfig              |  12 +-
 drivers/pinctrl/intel/pinctrl-baytrail.c   |  24 +---
 drivers/pinctrl/intel/pinctrl-cherryview.c | 184 ++++++++++++++---------------
 drivers/pinctrl/intel/pinctrl-intel.c      |  24 +++-
 drivers/pinctrl/intel/pinctrl-intel.h      |   7 +-
 5 files changed, 117 insertions(+), 134 deletions(-)

-- 
With Best Regards,
Andy Shevchenko


