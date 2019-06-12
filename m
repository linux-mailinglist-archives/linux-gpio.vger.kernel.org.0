Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EF6842A4B
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2019 17:07:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728990AbfFLPGz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Jun 2019 11:06:55 -0400
Received: from mga11.intel.com ([192.55.52.93]:35440 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726776AbfFLPGy (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 12 Jun 2019 11:06:54 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Jun 2019 08:06:54 -0700
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 12 Jun 2019 08:06:53 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1hb4pw-00026f-Mp; Wed, 12 Jun 2019 23:06:52 +0800
Date:   Wed, 12 Jun 2019 23:05:55 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     kbuild-all@01.org, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [pinctrl:devel 49/52] include/linux/gpio.h:254:11: warning: 'struct
 pinctrl_dev' declared inside parameter list will not be visible outside of
 this definition or declaration
Message-ID: <201906122348.9dYIBDHB%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="ZGiS0Q5IWpPtfppv"
Content-Disposition: inline
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
head:   2e80e10f2d71f42c6c8f82fc173b21be856acc0f
commit: 78b99577b3934e3e787fe0c52aa1b59442c8bbb5 [49/52] pinctrl: remove unused pin_is_valid()
config: h8300-h8300h-sim_defconfig (attached as .config)
compiler: h8300-linux-gcc (GCC) 7.4.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout 78b99577b3934e3e787fe0c52aa1b59442c8bbb5
        # save the attached .config to linux build tree
        GCC_VERSION=7.4.0 make.cross ARCH=h8300 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/tty/serial/sh-sci.h:5:0,
                    from drivers/tty/serial/sh-sci.c:60:
>> include/linux/gpio.h:254:11: warning: 'struct pinctrl_dev' declared inside parameter list will not be visible outside of this definition or declaration
       struct pinctrl_dev *pctldev,
              ^~~~~~~~~~~

vim +254 include/linux/gpio.h

165adc9c Linus Walleij     2012-11-06  251  
586a87e6 Christian Ruppert 2013-10-15  252  static inline int
586a87e6 Christian Ruppert 2013-10-15  253  gpiochip_add_pingroup_range(struct gpio_chip *chip,
586a87e6 Christian Ruppert 2013-10-15 @254  			struct pinctrl_dev *pctldev,
586a87e6 Christian Ruppert 2013-10-15  255  			unsigned int gpio_offset, const char *pin_group)
586a87e6 Christian Ruppert 2013-10-15  256  {
586a87e6 Christian Ruppert 2013-10-15  257  	WARN_ON(1);
586a87e6 Christian Ruppert 2013-10-15  258  	return -EINVAL;
586a87e6 Christian Ruppert 2013-10-15  259  }
586a87e6 Christian Ruppert 2013-10-15  260  

:::::: The code at line 254 was first introduced by commit
:::::: 586a87e6edc936d6d3c3585af504b33b9c3f0a06 pinctrl/gpio: non-linear GPIO ranges accesible from gpiolib

:::::: TO: Christian Ruppert <christian.ruppert@abilis.com>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--ZGiS0Q5IWpPtfppv
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--ZGiS0Q5IWpPtfppv--
