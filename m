Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B661E1D0F9C
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2020 12:22:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732579AbgEMKWq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 May 2020 06:22:46 -0400
Received: from mga05.intel.com ([192.55.52.43]:61004 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732472AbgEMKWq (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 13 May 2020 06:22:46 -0400
IronPort-SDR: 3KWemxj/kN/XaGj8eqI4pgpdXf1A9xSo2loksTBDxKnpo+t1C1YN/hj/QA3E6ZQjaFO6sBtN+o
 EbWI75Ar+3Bw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2020 03:22:45 -0700
IronPort-SDR: 6+Rw5lLxqdA9uScyogmeQV5iOUc2WT5NFeSreF85uIusSJr4GHOVlMHTkkXkgB25Cl2FkYlB6C
 wHvbJFvw3cvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,387,1583222400"; 
   d="scan'208";a="464083641"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga006.fm.intel.com with ESMTP; 13 May 2020 03:22:43 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jYoXG-006POZ-NZ; Wed, 13 May 2020 13:22:46 +0300
Date:   Wed, 13 May 2020 13:22:46 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     kbuild test robot <lkp@intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, kbuild-all@lists.01.org,
        clang-built-linux@googlegroups.com,
        Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [PATCH v1 4/4] gpio: dwapb: Remove unneeded has_irq member in
 struct dwapb_port_property
Message-ID: <20200513102246.GL185537@smile.fi.intel.com>
References: <20200512184513.86883-4-andriy.shevchenko@linux.intel.com>
 <202005130651.mJCyUboB%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202005130651.mJCyUboB%lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 13, 2020 at 06:53:09AM +0800, kbuild test robot wrote:
> Hi Andy,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on gpio/for-next]
> [also build test ERROR on next-20200512]
> [cannot apply to linus/master v5.7-rc5]
> [if your patch is applied to the wrong git tree, please drop us a note to help
> improve the system. BTW, we also suggest to use '--base' option to specify the
> base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
> 
> url:    https://github.com/0day-ci/linux/commits/Andy-Shevchenko/gpio-dwapb-avoid-error-message-for-optional-IRQ/20200513-025227
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git for-next
> config: x86_64-randconfig-a003-20200512 (attached as .config)
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install x86_64 cross compiling tool for clang build
>         # apt-get install binutils-x86-64-linux-gnu
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=x86_64 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
> drivers/mfd/intel_quark_i2c_gpio.c: In function 'intel_quark_gpio_setup':
> >> drivers/mfd/intel_quark_i2c_gpio.c:219:19: error: 'struct dwapb_port_property' has no member named 'has_irq'
> pdata->properties->has_irq = true;
> ^~

Indeed. I have that removed by other WIP patch in my tree.
Thanks!

-- 
With Best Regards,
Andy Shevchenko


