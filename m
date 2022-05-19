Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FE1952CFCF
	for <lists+linux-gpio@lfdr.de>; Thu, 19 May 2022 11:54:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231520AbiESJyt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 May 2022 05:54:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231411AbiESJys (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 May 2022 05:54:48 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 482B27DE13
        for <linux-gpio@vger.kernel.org>; Thu, 19 May 2022 02:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652954087; x=1684490087;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ianvgrjB2LA6T5h0+CpKIBJrfBMf6ztwJ6Wy3WIhev4=;
  b=cgwmvPD2WfMhjIFhtOCoh6WvFTDuJasxYcvyzDZAujOScnuSwqS4Zs0i
   ki5GfTmNvccXRtD086d6v4TtClAMT/+oITutGz4aVaiFSFXRuM5hq4sbW
   /DfvYHHUsnmCXQJSsn6a7dbY1gYiNJO4arMk4tywZWBwkksSy1K5uq59P
   VQ5tk6TQza+1CgG9DZxaZNutoKL0uh3lvz0blwWxF0OSYnnBSlmXqAxVu
   69awQxV3wvuFzrozHQSFJkubXmMMX5FNq122NEJ/RbIaLLTdrl6+qBXn5
   mmGxbpluw9hDAiaVKAHOv4xlXSN8R4ttJeSgzhzR5Fgcma+Qg1OT0wX3B
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10351"; a="271822901"
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; 
   d="scan'208";a="271822901"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2022 02:54:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; 
   d="scan'208";a="524012201"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 19 May 2022 02:54:44 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nrcrj-0003Nh-Fx;
        Thu, 19 May 2022 09:54:43 +0000
Date:   Thu, 19 May 2022 17:53:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        Marc Zyngier <maz@kernel.org>
Cc:     kbuild-all@lists.01.org, linux-gpio@vger.kernel.org,
        linux-riscv@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] gpio: sifive: Make the irqchip immutable
Message-ID: <202205191755.tvTer2iD-lkp@intel.com>
References: <73c75a67d1c87b049d633057c0e765e708ee02a2.1652884788.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73c75a67d1c87b049d633057c0e765e708ee02a2.1652884788.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Geert,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on linusw-gpio/for-next v5.18-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Geert-Uytterhoeven/gpio-sifive-Make-the-irqchip-immutable/20220518-224530
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 210e04ff768142b96452030c4c2627512b30ad95
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20220519/202205191755.tvTer2iD-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/3db66356e9f7309998a9172feeb84d8b226ad539
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Geert-Uytterhoeven/gpio-sifive-Make-the-irqchip-immutable/20220518-224530
        git checkout 3db66356e9f7309998a9172feeb84d8b226ad539
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpio/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/gpio/gpio-sifive.c:151:27: error: 'IRQCHIP_IMMUTABLE' undeclared here (not in a function); did you mean 'IS_IMMUTABLE'?
     151 |         .flags          = IRQCHIP_IMMUTABLE,
         |                           ^~~~~~~~~~~~~~~~~
         |                           IS_IMMUTABLE
   drivers/gpio/gpio-sifive.c:152:9: error: 'GPIOCHIP_IRQ_RESOURCE_HELPERS' undeclared here (not in a function)
     152 |         GPIOCHIP_IRQ_RESOURCE_HELPERS,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpio/gpio-sifive.c:152:9: warning: excess elements in struct initializer
   drivers/gpio/gpio-sifive.c:152:9: note: (near initialization for 'sifive_gpio_irqchip')
   drivers/gpio/gpio-sifive.c: In function 'sifive_gpio_probe':
   drivers/gpio/gpio-sifive.c:249:9: error: implicit declaration of function 'gpio_irq_chip_set_chip' [-Werror=implicit-function-declaration]
     249 |         gpio_irq_chip_set_chip(girq, &sifive_gpio_irqchip);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +152 drivers/gpio/gpio-sifive.c

   141	
   142	static const struct irq_chip sifive_gpio_irqchip = {
   143		.name		= "sifive-gpio",
   144		.irq_set_type	= sifive_gpio_irq_set_type,
   145		.irq_mask	= irq_chip_mask_parent,
   146		.irq_unmask	= irq_chip_unmask_parent,
   147		.irq_enable	= sifive_gpio_irq_enable,
   148		.irq_disable	= sifive_gpio_irq_disable,
   149		.irq_eoi	= sifive_gpio_irq_eoi,
   150		.irq_set_affinity = sifive_gpio_irq_set_affinity,
   151		.flags		= IRQCHIP_IMMUTABLE,
 > 152		GPIOCHIP_IRQ_RESOURCE_HELPERS,
   153	};
   154	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
