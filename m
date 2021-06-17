Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 371A13AA936
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Jun 2021 04:56:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229845AbhFQC6N (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Jun 2021 22:58:13 -0400
Received: from mga04.intel.com ([192.55.52.120]:20800 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229456AbhFQC6M (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 16 Jun 2021 22:58:12 -0400
IronPort-SDR: /0TR1BLthf53/+Iqm0PQSyyfPGuttN2SSNfmCsLcgUL1vZ42KrOAnPdjuvRvWDpDgso/geKxBY
 PYPanW6oBPjA==
X-IronPort-AV: E=McAfee;i="6200,9189,10017"; a="204462943"
X-IronPort-AV: E=Sophos;i="5.83,278,1616482800"; 
   d="gz'50?scan'50,208,50";a="204462943"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2021 19:56:04 -0700
IronPort-SDR: yygwpI9zQu1aTxAJIWf9MtQjX5AEBH3Z6/PN/48WJRe/VjaJdMd3Cs4QvNlt1IOphlvGlTGKOC
 XIlYEsPcKnAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,278,1616482800"; 
   d="gz'50?scan'50,208,50";a="479323074"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 16 Jun 2021 19:56:01 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1ltiCG-0001jd-UL; Thu, 17 Jun 2021 02:56:00 +0000
Date:   Thu, 17 Jun 2021 10:55:36 +0800
From:   kernel test robot <lkp@intel.com>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     kbuild-all@lists.01.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-gpio@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 3/3] pinctrl: renesas: Add pins/groups/functions for I2C,
 SCIF and USB supported by RZ/G2L SoC
Message-ID: <202106171038.FguCFVSp-lkp@intel.com>
References: <20210616132641.29087-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="y0ulUmNC+osPPQO6"
Content-Disposition: inline
In-Reply-To: <20210616132641.29087-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--y0ulUmNC+osPPQO6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Lad,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on renesas-drivers/renesas-pinctrl]
[also build test WARNING on robh/for-next pinctrl/devel v5.13-rc6 next-20210616]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Lad-Prabhakar/pinctrl-Add-RZ-G2L-pin-and-gpio-driver/20210616-225928
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-pinctrl
config: parisc-randconfig-s031-20210617 (attached as .config)
compiler: hppa-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-341-g8af24329-dirty
        # https://github.com/0day-ci/linux/commit/0cc4856c569c78a2855607272bccac66fd3d8e9e
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Lad-Prabhakar/pinctrl-Add-RZ-G2L-pin-and-gpio-driver/20210616-225928
        git checkout 0cc4856c569c78a2855607272bccac66fd3d8e9e
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' W=1 ARCH=parisc 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/pinctrl/renesas/pinctrl-rzg2l.c: In function 'rzg2l_pinctrl_set_mux':
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:115:9: error: implicit declaration of function 'pinmux_generic_get_function'; did you mean 'pinmux_generic_free_functions'? [-Werror=implicit-function-declaration]
     115 |  func = pinmux_generic_get_function(pctldev, func_selector);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         pinmux_generic_free_functions
>> drivers/pinctrl/renesas/pinctrl-rzg2l.c:115:7: warning: assignment to 'struct function_desc *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     115 |  func = pinmux_generic_get_function(pctldev, func_selector);
         |       ^
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:118:10: error: implicit declaration of function 'pinctrl_generic_get_group' [-Werror=implicit-function-declaration]
     118 |  group = pinctrl_generic_get_group(pctldev, group_selector);
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/renesas/pinctrl-rzg2l.c:118:8: warning: assignment to 'struct group_desc *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     118 |  group = pinctrl_generic_get_group(pctldev, group_selector);
         |        ^
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:122:14: error: dereferencing pointer to incomplete type 'struct group_desc'
     122 |  pins = group->pins;
         |              ^~
   In file included from include/linux/printk.h:409,
                    from include/linux/kernel.h:17,
                    from include/linux/list.h:9,
                    from include/linux/kobject.h:19,
                    from include/linux/of.h:17,
                    from drivers/pinctrl/renesas/pinctrl-rzg2l.c:8:
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:126:7: error: dereferencing pointer to incomplete type 'struct function_desc'
     126 |   func->name, group->name);
         |       ^~
   include/linux/dynamic_debug.h:129:15: note: in definition of macro '__dynamic_func_call'
     129 |   func(&id, ##__VA_ARGS__);  \
         |               ^~~~~~~~~~~
   include/linux/dynamic_debug.h:161:2: note: in expansion of macro '_dynamic_func_call'
     161 |  _dynamic_func_call(fmt,__dynamic_dev_dbg,   \
         |  ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:123:2: note: in expansion of macro 'dynamic_dev_dbg'
     123 |  dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |  ^~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:125:2: note: in expansion of macro 'dev_dbg'
     125 |  dev_dbg(pctldev->dev, "enable function %s group %s\n",
         |  ^~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c: At top level:
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:135:22: error: 'pinctrl_generic_get_group_count' undeclared here (not in a function)
     135 |  .get_groups_count = pinctrl_generic_get_group_count,
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:136:20: error: 'pinctrl_generic_get_group_name' undeclared here (not in a function)
     136 |  .get_group_name = pinctrl_generic_get_group_name,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:137:20: error: 'pinctrl_generic_get_group_pins' undeclared here (not in a function); did you mean 'pinctrl_get_group_pins'?
     137 |  .get_group_pins = pinctrl_generic_get_group_pins,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                    pinctrl_get_group_pins
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:143:25: error: 'pinmux_generic_get_function_count' undeclared here (not in a function); did you mean 'pinmux_generic_free_functions'?
     143 |  .get_functions_count = pinmux_generic_get_function_count,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                         pinmux_generic_free_functions
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:144:23: error: 'pinmux_generic_get_function_name' undeclared here (not in a function); did you mean 'pinmux_generic_free_functions'?
     144 |  .get_function_name = pinmux_generic_get_function_name,
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                       pinmux_generic_free_functions
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:145:25: error: 'pinmux_generic_get_function_groups' undeclared here (not in a function); did you mean 'pinmux_generic_free_functions'?
     145 |  .get_function_groups = pinmux_generic_get_function_groups,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                         pinmux_generic_free_functions
   drivers/pinctrl/renesas/pinctrl-rzg2l.c: In function 'rzg2l_pinctrl_add_groups':
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:155:56: error: invalid use of undefined type 'struct group_desc'
     155 |   const struct group_desc *group = pctrl->psoc->groups + i;
         |                                                        ^
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:157:9: error: implicit declaration of function 'pinctrl_generic_add_group' [-Werror=implicit-function-declaration]
     157 |   ret = pinctrl_generic_add_group(pctrl->pctrl_dev, group->name,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:157:58: error: dereferencing pointer to incomplete type 'const struct group_desc'
     157 |   ret = pinctrl_generic_add_group(pctrl->pctrl_dev, group->name,
         |                                                          ^~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c: In function 'rzg2l_pinctrl_add_functions':
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:175:57: error: invalid use of undefined type 'struct function_desc'
     175 |   const struct function_desc *func = pctrl->psoc->funcs + i;
         |                                                         ^
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:177:9: error: implicit declaration of function 'pinmux_generic_add_function'; did you mean 'pinmux_generic_free_functions'? [-Werror=implicit-function-declaration]
     177 |   ret = pinmux_generic_add_function(pctrl->pctrl_dev, func->name,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         pinmux_generic_free_functions
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:177:59: error: dereferencing pointer to incomplete type 'const struct function_desc'
     177 |   ret = pinmux_generic_add_function(pctrl->pctrl_dev, func->name,
         |                                                           ^~
   At top level:
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:514:34: warning: 'rzg2l_pinctrl_of_table' defined but not used [-Wunused-const-variable=]
     514 | static const struct of_device_id rzg2l_pinctrl_of_table[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PINCTRL_RZG2L
   Depends on PINCTRL && OF && (ARCH_R9A07G044 || COMPILE_TEST
   Selected by
   - PINCTRL_PFC_R9A07G044 && PINCTRL


vim +115 drivers/pinctrl/renesas/pinctrl-rzg2l.c

64165286d371f1 Lad Prabhakar 2021-06-16  103  
64165286d371f1 Lad Prabhakar 2021-06-16  104  static int rzg2l_pinctrl_set_mux(struct pinctrl_dev *pctldev,
64165286d371f1 Lad Prabhakar 2021-06-16  105  				 unsigned int func_selector,
64165286d371f1 Lad Prabhakar 2021-06-16  106  				 unsigned int group_selector)
64165286d371f1 Lad Prabhakar 2021-06-16  107  {
64165286d371f1 Lad Prabhakar 2021-06-16  108  	struct rzg2l_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
64165286d371f1 Lad Prabhakar 2021-06-16  109  	struct function_desc *func;
64165286d371f1 Lad Prabhakar 2021-06-16  110  	struct group_desc *group;
64165286d371f1 Lad Prabhakar 2021-06-16  111  	unsigned long data;
64165286d371f1 Lad Prabhakar 2021-06-16  112  	int *pins;
64165286d371f1 Lad Prabhakar 2021-06-16  113  	int i;
64165286d371f1 Lad Prabhakar 2021-06-16  114  
64165286d371f1 Lad Prabhakar 2021-06-16 @115  	func = pinmux_generic_get_function(pctldev, func_selector);
64165286d371f1 Lad Prabhakar 2021-06-16  116  	if (!func)
64165286d371f1 Lad Prabhakar 2021-06-16  117  		return -EINVAL;
64165286d371f1 Lad Prabhakar 2021-06-16 @118  	group = pinctrl_generic_get_group(pctldev, group_selector);
64165286d371f1 Lad Prabhakar 2021-06-16  119  	if (!group)
64165286d371f1 Lad Prabhakar 2021-06-16  120  		return -EINVAL;
64165286d371f1 Lad Prabhakar 2021-06-16  121  
64165286d371f1 Lad Prabhakar 2021-06-16  122  	pins = group->pins;
64165286d371f1 Lad Prabhakar 2021-06-16  123  	data = (unsigned long)group->data;
64165286d371f1 Lad Prabhakar 2021-06-16  124  
64165286d371f1 Lad Prabhakar 2021-06-16  125  	dev_dbg(pctldev->dev, "enable function %s group %s\n",
64165286d371f1 Lad Prabhakar 2021-06-16  126  		func->name, group->name);
64165286d371f1 Lad Prabhakar 2021-06-16  127  
64165286d371f1 Lad Prabhakar 2021-06-16  128  	for (i = 0; i < group->num_pins; i++)
64165286d371f1 Lad Prabhakar 2021-06-16  129  		rzg2l_pinctrl_set_pfc_mode(pctrl, *(pins + i), data);
64165286d371f1 Lad Prabhakar 2021-06-16  130  
64165286d371f1 Lad Prabhakar 2021-06-16  131  	return 0;
64165286d371f1 Lad Prabhakar 2021-06-16  132  };
64165286d371f1 Lad Prabhakar 2021-06-16  133  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--y0ulUmNC+osPPQO6
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
Ri9sRitEwYF+fpK8vd5vNmpnRJxepNeOfPinxsGuoO2BPQRKUZJvro6a+C/uClSROFuu1dcK
9GZFklBRjrSiU9vjbp3gDY9LvP2G05tY096rWrg55w4hx7wPTLldR1Hm+BDEP7cKltPZAFG+
HGA4HrZbLXVQeQP8zcYax47egAvewVrhR9hNFlR2TS5Jex1WmV9UO1VjZCBaKdZYLKLYNVw0
GBuThkasjX5qVVxEMhrvjktoP4P7wMc3J/Gd8arSUsGuavGOYaZF3hehN8YcnXVyLR6tc3Mz
tkuDtlpljadj++tYdKEvkN0kdUa3kNBI59beLfrby20Ga9GsHKMFAn283QqNRDc+olpxLMSZ
ecWrRLSpe4Usfzow6LYGEPpRo4uzoe0SgRfjgf/syypmg4VvAwyoLufT3JDtapWsmI2ofbhZ
i0ZH9sehRaG4ifQ0xOe3O4K7gZWh4GtUKbqgO3SOhVFS+8ba7Y5VUu657n1lyvFktXqgTf7A
7V75GBWUZ4nlrS+0rxYr9HL3enm7Z7khjWHVtN6t/tD8VtXb1ue3d2SOUWoKMPL/3bezKl9c
7zPe01KyiKjKzEu5sg09h4w80KLcojYI2Lj05FGsWYuVsFvpEoIhp60YZbzWbqg/ikiB/Hga
VxWWFebBPo0yh4wiWPd1LHrIx0cwlN//D8oa+/C6UAEA

--y0ulUmNC+osPPQO6--
