Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 468A247FBEB
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Dec 2021 11:48:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234320AbhL0KsW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Dec 2021 05:48:22 -0500
Received: from mga04.intel.com ([192.55.52.120]:7787 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232921AbhL0KsV (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 27 Dec 2021 05:48:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640602101; x=1672138101;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NU0eRBSXTaWpoF2JuBAnW1U3U+69iNSJX8M17iIxGn0=;
  b=XsoA4uEhAQm4odUMBGzWXz9rT8eofxnUtCZXgb6nkKQ+ISJdD7Hk2NTc
   9CSqglepKJF0Gs20MfM5R+NL8CsfRINbVzXepVNO3Fgs2EdzzeKxWGUmt
   aXM8ZZacVWYHmg3oSxhs0FwnOPx3ZSx/nT5NU/YVyA6ajz3IWvwRGTNcq
   SoMzQPwHTc1phDgcqC/DjR5kdnoXh7R81RHJrbMqWm/rCsWtKn6Yzz+VE
   w7kvKmBXmk8AG0VcMtvzcvV3MDrBNoPdnHxtOM8yG01cmoysxQa0mkYrd
   l8NDDoGtJ9pXPMPJHBffca5gmKY8riwKRfo+7gAfECxmBJWSpit73HpEK
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10209"; a="239977085"
X-IronPort-AV: E=Sophos;i="5.88,239,1635231600"; 
   d="scan'208";a="239977085"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2021 02:48:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,239,1635231600"; 
   d="scan'208";a="553751029"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 27 Dec 2021 02:48:18 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1n1nY9-0006Dl-Pw; Mon, 27 Dec 2021 10:48:17 +0000
Date:   Mon, 27 Dec 2021 18:47:25 +0800
From:   kernel test robot <lkp@intel.com>
To:     Qianggui Song <qianggui.song@amlogic.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Cc:     kbuild-all@lists.01.org, Qianggui Song <qianggui.song@amlogic.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/2] pinctrl: meson: add pinctrl driver support for
 Meson-S4 Soc
Message-ID: <202112271815.ZjrVGzl5-lkp@intel.com>
References: <20211227080649.32275-3-qianggui.song@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211227080649.32275-3-qianggui.song@amlogic.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Qianggui,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linusw-pinctrl/devel]
[also build test ERROR on robh/for-next v5.16-rc7 next-20211224]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Qianggui-Song/pinctrl-meson-s4-add-pinctrl-driver/20211227-160714
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20211227/202112271815.ZjrVGzl5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/43334d14477ef1b54fe7c261204f68c77230a18b
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Qianggui-Song/pinctrl-meson-s4-add-pinctrl-driver/20211227-160714
        git checkout 43334d14477ef1b54fe7c261204f68c77230a18b
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/pinctrl/meson/pinctrl-meson-s4.c:9:10: fatal error: dt-bindings/gpio/meson-s4-gpio.h: No such file or directory
       9 | #include <dt-bindings/gpio/meson-s4-gpio.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +9 drivers/pinctrl/meson/pinctrl-meson-s4.c

   > 9	#include <dt-bindings/gpio/meson-s4-gpio.h>
    10	#include "pinctrl-meson.h"
    11	#include "pinctrl-meson-axg-pmx.h"
    12	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
