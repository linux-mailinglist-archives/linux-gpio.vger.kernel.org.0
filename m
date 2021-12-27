Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1059480179
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Dec 2021 17:16:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231774AbhL0QQd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Dec 2021 11:16:33 -0500
Received: from mga14.intel.com ([192.55.52.115]:54424 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232525AbhL0QQd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 27 Dec 2021 11:16:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640621793; x=1672157793;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BSDqVuSIFYDIk5tliu/YGKfCAxw8HvtD1Jo1sDA/1yI=;
  b=VXChE0AvEa/fnpQe9AP/0CkyMoK+T58AGkEfO8QOAYBUCpaGp9nBjSnB
   inXatWfp8Rh3Q30L6h7NBTYZASa5gy5rERkh4gNeVTctFTnZgr+n2rsCI
   phqx5UaPthpq0XNUVBVqM9exo0yvO9RxeNnopS5ECvCiW3CC8wTdq6fWJ
   O7ESJ8JiqqcR0bKqL9MZz1MZnlQ0pvHK+mTuupZADLiB0rYbZnIoYltlg
   czT1Z54KBQGnATDvQliq855SnAcjHy2lHeIbCnDHtb996GHVj7zktuAqn
   voRrVcWhjdae9KeXbx4/IvNPIzoXKQxq2YRZMipnrlfWIkDgepZBWo5w6
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10209"; a="241445431"
X-IronPort-AV: E=Sophos;i="5.88,239,1635231600"; 
   d="scan'208";a="241445431"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2021 08:16:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,239,1635231600"; 
   d="scan'208";a="467890042"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 27 Dec 2021 08:16:29 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1n1sfl-0006ZE-20; Mon, 27 Dec 2021 16:16:29 +0000
Date:   Tue, 28 Dec 2021 00:16:12 +0800
From:   kernel test robot <lkp@intel.com>
To:     Qianggui Song <qianggui.song@amlogic.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        Qianggui Song <qianggui.song@amlogic.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/2] pinctrl: meson: add pinctrl driver support for
 Meson-S4 Soc
Message-ID: <202112280001.MfQS59Vr-lkp@intel.com>
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
config: arm64-randconfig-r002-20211227 (https://download.01.org/0day-ci/archive/20211228/202112280001.MfQS59Vr-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 511726c64d3b6cca66f7c54d457d586aa3129f67)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/0day-ci/linux/commit/43334d14477ef1b54fe7c261204f68c77230a18b
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Qianggui-Song/pinctrl-meson-s4-add-pinctrl-driver/20211227-160714
        git checkout 43334d14477ef1b54fe7c261204f68c77230a18b
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/pinctrl/meson/pinctrl-meson-s4.c:9:10: fatal error: 'dt-bindings/gpio/meson-s4-gpio.h' file not found
   #include <dt-bindings/gpio/meson-s4-gpio.h>
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +9 drivers/pinctrl/meson/pinctrl-meson-s4.c

   > 9	#include <dt-bindings/gpio/meson-s4-gpio.h>
    10	#include "pinctrl-meson.h"
    11	#include "pinctrl-meson-axg-pmx.h"
    12	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
