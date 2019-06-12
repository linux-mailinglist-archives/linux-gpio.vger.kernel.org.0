Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7B7542A4C
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2019 17:07:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436498AbfFLPG4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Jun 2019 11:06:56 -0400
Received: from mga01.intel.com ([192.55.52.88]:12397 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728939AbfFLPGz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 12 Jun 2019 11:06:55 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Jun 2019 08:06:54 -0700
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 12 Jun 2019 08:06:53 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1hb4pw-00026D-Lb; Wed, 12 Jun 2019 23:06:52 +0800
Date:   Wed, 12 Jun 2019 23:06:23 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     kbuild-all@01.org, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [pinctrl:devel 49/52] include/linux/gpio/driver.h:602:11: warning:
 'struct pinctrl_dev' declared inside parameter list will not be visible
 outside of this definition or declaration
Message-ID: <201906122320.fFrRV8t0%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="PEIAKu/WMn1b1Hv9"
Content-Disposition: inline
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
head:   2e80e10f2d71f42c6c8f82fc173b21be856acc0f
commit: 78b99577b3934e3e787fe0c52aa1b59442c8bbb5 [49/52] pinctrl: remove unused pin_is_valid()
config: nios2-10m50_defconfig (attached as .config)
compiler: nios2-linux-gcc (GCC) 7.4.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout 78b99577b3934e3e787fe0c52aa1b59442c8bbb5
        # save the attached .config to linux build tree
        GCC_VERSION=7.4.0 make.cross ARCH=nios2 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/gpio.h:13:0,
                    from include/linux/gpio.h:62,
                    from drivers/gpio/gpiolib.c:13:
>> include/linux/gpio/driver.h:602:11: warning: 'struct pinctrl_dev' declared inside parameter list will not be visible outside of this definition or declaration
       struct pinctrl_dev *pctldev,
              ^~~~~~~~~~~

vim +602 include/linux/gpio/driver.h

964cb341 Linus Walleij 2015-03-18  592  
964cb341 Linus Walleij 2015-03-18  593  static inline int
964cb341 Linus Walleij 2015-03-18  594  gpiochip_add_pin_range(struct gpio_chip *chip, const char *pinctl_name,
964cb341 Linus Walleij 2015-03-18  595  		       unsigned int gpio_offset, unsigned int pin_offset,
964cb341 Linus Walleij 2015-03-18  596  		       unsigned int npins)
964cb341 Linus Walleij 2015-03-18  597  {
964cb341 Linus Walleij 2015-03-18  598  	return 0;
964cb341 Linus Walleij 2015-03-18  599  }
964cb341 Linus Walleij 2015-03-18  600  static inline int
964cb341 Linus Walleij 2015-03-18  601  gpiochip_add_pingroup_range(struct gpio_chip *chip,
964cb341 Linus Walleij 2015-03-18 @602  			struct pinctrl_dev *pctldev,
964cb341 Linus Walleij 2015-03-18  603  			unsigned int gpio_offset, const char *pin_group)
964cb341 Linus Walleij 2015-03-18  604  {
964cb341 Linus Walleij 2015-03-18  605  	return 0;
964cb341 Linus Walleij 2015-03-18  606  }
964cb341 Linus Walleij 2015-03-18  607  

:::::: The code at line 602 was first introduced by commit
:::::: 964cb341882f920a1a1043864178f22def3193e4 gpio: move pincontrol calls to <linux/gpio/driver.h>

:::::: TO: Linus Walleij <linus.walleij@linaro.org>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--PEIAKu/WMn1b1Hv9
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
tGpOo31XmcEh/H/4GbffvqMAAA==

--PEIAKu/WMn1b1Hv9--
