Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 836E2476A68
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Dec 2021 07:35:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232879AbhLPGer (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Dec 2021 01:34:47 -0500
Received: from mga01.intel.com ([192.55.52.88]:50029 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229738AbhLPGer (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Dec 2021 01:34:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639636487; x=1671172487;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=oomzO9Y09gAVfh4RY5+bUyK3yMG6TKXf6p+NB+a1IDY=;
  b=lcIY9CIXH5FkVBwzoBLidCyQXrztfKzG6u2j4LmdmW+dd4TH9m92CLgN
   Kv8GBvrqrZGi/lmvgGy2gdiyjs1w9eHlHI76jBaEua/tqz4SYXc6fVDG7
   xTrLh7rTXLqYxwDY4VhNCr310D9+ZLBACapuPluzQK7X8pZ3/Jb+zg5/y
   55ZpZgda3cLdbOLEDco30vmuHy+SXU2vfp7ojiIAIR8KgZUdtc+p36/iB
   i3FJcxjF/lzFjFlFZ+ztvJDnfAjUobAFzgLyobDoOJLRFfjuuEtEvesxw
   vcFyb+UppiaCPHolyFD6BK6mV8ESZbMfA7eyghw5jZAefBZTwZn+MlFCn
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="263577170"
X-IronPort-AV: E=Sophos;i="5.88,210,1635231600"; 
   d="scan'208";a="263577170"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2021 22:34:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,210,1635231600"; 
   d="scan'208";a="682812863"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 15 Dec 2021 22:34:43 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mxkLi-0002qm-Km; Thu, 16 Dec 2021 06:34:42 +0000
Date:   Thu, 16 Dec 2021 14:34:31 +0800
From:   kernel test robot <lkp@intel.com>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     kbuild-all@lists.01.org,
        =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH 2/2] pinctrl: bcm: add driver for BCM4908 pinmux
Message-ID: <202112161405.FBvHqiWr-lkp@intel.com>
References: <20211215204753.5956-2-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211215204753.5956-2-zajec5@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi "Rafał,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linusw-pinctrl/devel]
[also build test WARNING on robh/for-next linus/master v5.16-rc5 next-20211215]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Rafa-Mi-ecki/dt-bindings-pinctrl-Add-binding-for-BCM4908-pinctrl/20211216-044855
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20211216/202112161405.FBvHqiWr-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/52ad0e1851a5d242cde2829eca853a7369807c42
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Rafa-Mi-ecki/dt-bindings-pinctrl-Add-binding-for-BCM4908-pinctrl/20211216-044855
        git checkout 52ad0e1851a5d242cde2829eca853a7369807c42
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=riscv SHELL=/bin/bash drivers/pinctrl/bcm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/pinctrl/bcm/pinctrl-bcm4908.c: In function 'bcm4908_pinctrl_probe':
>> drivers/pinctrl/bcm/pinctrl-bcm4908.c:542:53: warning: passing argument 3 of 'pinmux_generic_add_function' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     542 |                                             function->groups,
         |                                             ~~~~~~~~^~~~~~~~
   In file included from drivers/pinctrl/bcm/pinctrl-bcm4908.c:18:
   drivers/pinctrl/bcm/../pinmux.h:153:46: note: expected 'const char **' but argument is of type 'const char * const*'
     153 |                                 const char **groups,
         |                                 ~~~~~~~~~~~~~^~~~~~


vim +542 drivers/pinctrl/bcm/pinctrl-bcm4908.c

   468	
   469	static int bcm4908_pinctrl_probe(struct platform_device *pdev)
   470	{
   471		struct device *dev = &pdev->dev;
   472		struct bcm4908_pinctrl *bcm4908_pinctrl;
   473		struct pinctrl_desc *pctldesc;
   474		struct pinctrl_pin_desc *pins;
   475		int i;
   476	
   477		bcm4908_pinctrl = devm_kzalloc(dev, sizeof(*bcm4908_pinctrl), GFP_KERNEL);
   478		if (!bcm4908_pinctrl)
   479			return -ENOMEM;
   480		pctldesc = &bcm4908_pinctrl->pctldesc;
   481		platform_set_drvdata(pdev, bcm4908_pinctrl);
   482	
   483		/* Set basic properties */
   484	
   485		bcm4908_pinctrl->dev = dev;
   486	
   487		bcm4908_pinctrl->base = devm_platform_ioremap_resource(pdev, 0);
   488		if (IS_ERR(bcm4908_pinctrl->base)) {
   489			dev_err(dev, "Failed to map pinctrl regs\n");
   490			return PTR_ERR(bcm4908_pinctrl->base);
   491		}
   492	
   493		memcpy(pctldesc, &bcm4908_pinctrl_desc, sizeof(*pctldesc));
   494	
   495		/* Set pinctrl properties */
   496	
   497		pins = devm_kcalloc(dev, BCM4908_NUM_PINS,
   498				    sizeof(struct pinctrl_pin_desc), GFP_KERNEL);
   499		if (!pins)
   500			return -ENOMEM;
   501		for (i = 0; i < BCM4908_NUM_PINS; i++) {
   502			pins[i].number = i;
   503			pins[i].name = devm_kasprintf(dev, GFP_KERNEL, "pin%d", i);
   504			if (!pins[i].name)
   505				return -ENOMEM;
   506		}
   507		pctldesc->pins = pins;
   508		pctldesc->npins = BCM4908_NUM_PINS;
   509	
   510		/* Register */
   511	
   512		bcm4908_pinctrl->pctldev = devm_pinctrl_register(dev, pctldesc, bcm4908_pinctrl);
   513		if (IS_ERR(bcm4908_pinctrl->pctldev)) {
   514			dev_err(dev, "Failed to register pinctrl\n");
   515			return PTR_ERR(bcm4908_pinctrl->pctldev);
   516		}
   517	
   518		/* Groups */
   519	
   520		for (i = 0; i < ARRAY_SIZE(bcm4908_pinctrl_grps); i++) {
   521			const struct bcm4908_pinctrl_grp *group = &bcm4908_pinctrl_grps[i];
   522			int *pins;
   523			int j;
   524	
   525			pins = devm_kcalloc(dev, group->num_pins, sizeof(*pins), GFP_KERNEL);
   526			if (!pins)
   527				return -ENOMEM;
   528			for (j = 0; j < group->num_pins; j++)
   529				pins[j] = group->pins[j].number;
   530	
   531			pinctrl_generic_add_group(bcm4908_pinctrl->pctldev, group->name,
   532						  pins, group->num_pins, (void *)group);
   533		}
   534	
   535		/* Functions */
   536	
   537		for (i = 0; i < ARRAY_SIZE(bcm4908_pinctrl_functions); i++) {
   538			const struct bcm4908_pinctrl_function *function = &bcm4908_pinctrl_functions[i];
   539	
   540			pinmux_generic_add_function(bcm4908_pinctrl->pctldev,
   541						    function->name,
 > 542						    function->groups,
   543						    function->num_groups, NULL);
   544		}
   545	
   546		return 0;
   547	}
   548	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
