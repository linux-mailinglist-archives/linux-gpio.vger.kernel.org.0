Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1EF53ECC98
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Aug 2021 04:16:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231390AbhHPCQg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 15 Aug 2021 22:16:36 -0400
Received: from mga05.intel.com ([192.55.52.43]:33209 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229816AbhHPCQg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 15 Aug 2021 22:16:36 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10077"; a="301367213"
X-IronPort-AV: E=Sophos;i="5.84,324,1620716400"; 
   d="gz'50?scan'50,208,50";a="301367213"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2021 19:16:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,324,1620716400"; 
   d="gz'50?scan'50,208,50";a="509472810"
Received: from lkp-server01.sh.intel.com (HELO d053b881505b) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 15 Aug 2021 19:16:03 -0700
Received: from kbuild by d053b881505b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mFSAU-000QJ3-Bg; Mon, 16 Aug 2021 02:16:02 +0000
Date:   Mon, 16 Aug 2021 10:15:05 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     kbuild-all@lists.01.org, linux-gpio@vger.kernel.org
Subject: [gpio:gpiochip-no-driver-h 2/2] include/linux/gpio/driver.h:704:19:
 error: conflicting types for 'gpiod_to_chip'; have 'struct gpio_chip *(const
 struct gpio_desc *)'
Message-ID: <202108161000.8tMhP8zb-lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="opJtzjQTFsWo+cga"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--opJtzjQTFsWo+cga
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git gpiochip-no-driver-h
head:   3357a6b5d4c178fcbe95eb72c4e653b3a5b41569
commit: 3357a6b5d4c178fcbe95eb72c4e653b3a5b41569 [2/2] See what explodes if we apply this patch
config: mips-capcella_defconfig (attached as .config)
compiler: mipsel-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git/commit/?id=3357a6b5d4c178fcbe95eb72c4e653b3a5b41569
        git remote add gpio https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
        git fetch --no-tags gpio gpiochip-no-driver-h
        git checkout 3357a6b5d4c178fcbe95eb72c4e653b3a5b41569
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross ARCH=mips 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/linux/gpio.h:62,
                    from drivers/gpio/gpiolib.c:14:
   include/asm-generic/gpio.h: In function 'gpio_to_chip':
   include/asm-generic/gpio.h:58:16: error: implicit declaration of function 'gpiod_to_chip'; did you mean 'gpio_to_chip'? [-Werror=implicit-function-declaration]
      58 |         return gpiod_to_chip(gpio_to_desc(gpio));
         |                ^~~~~~~~~~~~~
         |                gpio_to_chip
   include/asm-generic/gpio.h:58:16: warning: returning 'int' from a function with return type 'struct gpio_chip *' makes pointer from integer without a cast [-Wint-conversion]
      58 |         return gpiod_to_chip(gpio_to_desc(gpio));
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpio/gpiolib.c:18:
   include/linux/gpio/driver.h: At top level:
>> include/linux/gpio/driver.h:704:19: error: conflicting types for 'gpiod_to_chip'; have 'struct gpio_chip *(const struct gpio_desc *)'
     704 | struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc);
         |                   ^~~~~~~~~~~~~
   In file included from include/linux/gpio.h:62,
                    from drivers/gpio/gpiolib.c:14:
   include/asm-generic/gpio.h:58:16: note: previous implicit declaration of 'gpiod_to_chip' with type 'int()'
      58 |         return gpiod_to_chip(gpio_to_desc(gpio));
         |                ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +704 include/linux/gpio/driver.h

c7663fa2a6631e YueHaibing      2019-08-22  702  
9091373ab7ea27 Masahiro Yamada 2019-07-30  703  
9091373ab7ea27 Masahiro Yamada 2019-07-30 @704  struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc);
9091373ab7ea27 Masahiro Yamada 2019-07-30  705  

:::::: The code at line 704 was first introduced by commit
:::::: 9091373ab7ea27cad381ce71aa37de6b9e687e81 gpio: remove less important #ifdef around declarations

:::::: TO: Masahiro Yamada <yamada.masahiro@socionext.com>
:::::: CC: Bartosz Golaszewski <bgolaszewski@baylibre.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--opJtzjQTFsWo+cga
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
TRErR7wyYxRGbR0n/wEUkw0CpuIAAA==

--opJtzjQTFsWo+cga--
