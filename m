Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4026C477473
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Dec 2021 15:27:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237969AbhLPO1L (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Dec 2021 09:27:11 -0500
Received: from mga14.intel.com ([192.55.52.115]:14042 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232544AbhLPO1K (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Dec 2021 09:27:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639664830; x=1671200830;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=vHBn3hJcNDa3c/jQRAUPEfwjeSlg6EkckBzQxR0cd5o=;
  b=TjvaGGYpSbHOFQuqMseKKv7R1uZYk38iEwhg3EgQEqDpihYGddiIfov8
   XkBsR/vBobe2COR69ZtQLU0Yx/+LC91zaebq/syfs5BSO82THZQCOKDM9
   zbG3ivZ8WLuMf3Z7taPO7GHvAXOTaQLFA0XOrSdwzTeje5c3esL413aGK
   Ijzzf6satpKDps5m6AnI4M18vkmhZ0xuBMHEZGfxxGPff+pVMXyGkrSa/
   lMAkaASd9m6yByXqDrQIByZ5hf22sACPI1wO7+zYU4x+Zbez8cYkDahfo
   z8XaATOGnI3TdIjfK/WH0zfpCK5dcZHkD6ZD37J6SFlLtwvJCAhm4ch76
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="239724762"
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; 
   d="scan'208";a="239724762"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2021 06:27:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; 
   d="scan'208";a="755925183"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 16 Dec 2021 06:27:07 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mxrit-0003KQ-4S; Thu, 16 Dec 2021 14:27:07 +0000
Date:   Thu, 16 Dec 2021 22:26:11 +0800
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
Message-ID: <202112162229.R65wpBRJ-lkp@intel.com>
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
config: alpha-randconfig-s031-20211216 (https://download.01.org/0day-ci/archive/20211216/202112162229.R65wpBRJ-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/0day-ci/linux/commit/52ad0e1851a5d242cde2829eca853a7369807c42
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Rafa-Mi-ecki/dt-bindings-pinctrl-Add-binding-for-BCM4908-pinctrl/20211216-044855
        git checkout 52ad0e1851a5d242cde2829eca853a7369807c42
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=alpha SHELL=/bin/bash drivers/perf/ drivers/pinctrl/bcm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/pinctrl/bcm/pinctrl-bcm4908.c:542:53: sparse: sparse: incorrect type in argument 3 (different modifiers) @@     expected char const **groups @@     got char const *const *const groups @@
   drivers/pinctrl/bcm/pinctrl-bcm4908.c:542:53: sparse:     expected char const **groups
   drivers/pinctrl/bcm/pinctrl-bcm4908.c:542:53: sparse:     got char const *const *const groups

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
