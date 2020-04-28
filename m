Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 672A21BB387
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2020 03:42:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726335AbgD1Bmi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Apr 2020 21:42:38 -0400
Received: from mga03.intel.com ([134.134.136.65]:57706 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726233AbgD1Bmh (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 27 Apr 2020 21:42:37 -0400
IronPort-SDR: jxaxRLu3ixZ7zKRr/XrgmHS4AAOFDTcrEjVJnXbK0O5cucvjKvcRSMBZdx85vGgnA71d8XMCGf
 Nx0OlxmZdx6w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2020 18:42:37 -0700
IronPort-SDR: jn1D6iq8F5mz1mLTds+sdIp7tINSGh5x8Ij+JJyia6owDohAM9DKNBy0anSgto3PNrJBH2qeCr
 NePpoCGaskLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,325,1583222400"; 
   d="scan'208";a="292701662"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 27 Apr 2020 18:42:33 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jTFGa-000Ciw-Sl; Tue, 28 Apr 2020 09:42:32 +0800
Date:   Tue, 28 Apr 2020 09:41:35 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Syed Nayyar Waris <syednwaris@gmail.com>, akpm@linux-foundation.org
Cc:     kbuild-all@lists.01.org, andriy.shevchenko@linux.intel.com,
        vilhelm.gray@gmail.com, rrichter@marvell.com,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/6] gpio: thunderx: Utilize for_each_set_clump macro
Message-ID: <202004280926.S92wb0O8%lkp@intel.com>
References: <9c5e25b982728467c5c681876d0e60e49dedb5fb.1587840670.git.syednwaris@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c5e25b982728467c5c681876d0e60e49dedb5fb.1587840670.git.syednwaris@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Syed,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on gpio/for-next]
[also build test WARNING on linus/master asm-generic/master v5.7-rc3 next-20200424]
[cannot apply to xlnx/master]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Syed-Nayyar-Waris/Introduce-the-for_each_set_clump-macro/20200427-184103
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git for-next
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-191-gc51a0382-dirty
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/gpio/gpio-thunderx.c:284:9: sparse: sparse: incorrect type in argument 1 (different type sizes) @@    expected unsigned long *clump @@    got unsigunsigned long *clump @@
>> drivers/gpio/gpio-thunderx.c:284:9: sparse:    expected unsigned long *clump
>> drivers/gpio/gpio-thunderx.c:284:9: sparse:    got unsigned long long *
>> drivers/gpio/gpio-thunderx.c:284:9: sparse: sparse: incorrect type in argument 1 (different type sizes) @@    expected unsigned long *clump @@    got unsigunsigned long *clump @@
>> drivers/gpio/gpio-thunderx.c:284:9: sparse:    expected unsigned long *clump
>> drivers/gpio/gpio-thunderx.c:284:9: sparse:    got unsigned long long *

vim +284 drivers/gpio/gpio-thunderx.c

   272	
   273	static void thunderx_gpio_set_multiple(struct gpio_chip *chip,
   274					       unsigned long *mask,
   275					       unsigned long *bits)
   276	{
   277		int bank;
   278		u64 set_bits, clear_bits, gpio_mask;
   279		const unsigned long bank_size = 64;
   280		unsigned long offset;
   281	
   282		struct thunderx_gpio *txgpio = gpiochip_get_data(chip);
   283	
 > 284		for_each_set_clump(offset, gpio_mask, mask, chip->ngpio, bank_size) {
   285			bank = offset / bank_size;
   286			set_bits = bits[bank] & gpio_mask;
   287			clear_bits = ~bits[bank] & gpio_mask;
   288			writeq(set_bits, txgpio->register_base + (bank * GPIO_2ND_BANK) + GPIO_TX_SET);
   289			writeq(clear_bits, txgpio->register_base + (bank * GPIO_2ND_BANK) + GPIO_TX_CLR);
   290		}
   291	}
   292	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
