Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B07845AC7F9
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Sep 2022 00:25:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232091AbiIDWZ5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 4 Sep 2022 18:25:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231998AbiIDWZ4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 4 Sep 2022 18:25:56 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6C1022289
        for <linux-gpio@vger.kernel.org>; Sun,  4 Sep 2022 15:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662330350; x=1693866350;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JIWC14BKQrX4Dvb2lCHgEPsr8jxmC6rpvuwSvpFvHVo=;
  b=LE1DKeV8bfMqeWWVg/ZGZyHghgHI0lxROSw5dv+crnraoviDxwKti5Rj
   jxmWWd741HFpVTRghl+hIGpT+FLqV39h2WRtIEd19jTgi/HMkq/PyBKJP
   Z+DFDG2tYvl6Xi18pI2eRSWW7NL3OuAFrqHNlKT85hJiLil5kI2g2jMKP
   Q1YriAQNJk+Cr6R3ldKdHmO+P39pswwqHinVbKjr9hXfprp/J+6Cj7SP/
   isAQJ1JFHTX6SvRDGqtZf7cOL1ugROzY106fqRrebjBEMGWYTQiipsV+Q
   asfTtdZDxyr4TOmpNjLmO/vMJWKw+cLsisg00D1+1/k2E0/GX2X27wQbu
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10460"; a="276668829"
X-IronPort-AV: E=Sophos;i="5.93,290,1654585200"; 
   d="scan'208";a="276668829"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2022 15:25:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,290,1654585200"; 
   d="scan'208";a="643580430"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 04 Sep 2022 15:25:47 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oUy3m-0003RR-34;
        Sun, 04 Sep 2022 22:25:46 +0000
Date:   Mon, 5 Sep 2022 06:25:15 +0800
From:   kernel test robot <lkp@intel.com>
To:     Francesco Dolcini <francesco.dolcini@toradex.com>
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Fabio Estevam <festevam@gmail.com>
Subject: [linusw-pinctrl:devel 26/32]
 drivers/pinctrl/freescale/pinctrl-imx.c:260:9: error: call to undeclared
 function 'pinmux_generic_get_function'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202209050605.fezJUgFH-lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="SzSsESMIxQXg3A71"
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,UPPERCASE_50_75
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--SzSsESMIxQXg3A71
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Francesco,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
head:   1074e1d23a5c201b6558878a09f1d2b7c9506835
commit: 87c2a29a6bf1a078d82427d42a2480a61814f8e3 [26/32] pinctrl: imx8m: kconfig: Depends on SOC_IMX8M
config: s390-buildonly-randconfig-r001-20220905
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project c55b41d5199d2394dd6cdb8f52180d8b81d809d4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/commit/?id=87c2a29a6bf1a078d82427d42a2480a61814f8e3
        git remote add linusw-pinctrl https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
        git fetch --no-tags linusw-pinctrl devel
        git checkout 87c2a29a6bf1a078d82427d42a2480a61814f8e3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/pinctrl/freescale/pinctrl-imx.c:12:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from drivers/pinctrl/freescale/pinctrl-imx.c:12:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from drivers/pinctrl/freescale/pinctrl-imx.c:12:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
>> drivers/pinctrl/freescale/pinctrl-imx.c:260:9: error: call to undeclared function 'pinmux_generic_get_function'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           func = pinmux_generic_get_function(pctldev, selector);
                  ^
   drivers/pinctrl/freescale/pinctrl-imx.c:260:9: note: did you mean 'pinmux_generic_free_functions'?
   drivers/pinctrl/freescale/../pinmux.h:164:20: note: 'pinmux_generic_free_functions' declared here
   static inline void pinmux_generic_free_functions(struct pinctrl_dev *pctldev)
                      ^
>> drivers/pinctrl/freescale/pinctrl-imx.c:260:7: error: incompatible integer to pointer conversion assigning to 'struct function_desc *' from 'int' [-Wint-conversion]
           func = pinmux_generic_get_function(pctldev, selector);
                ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/freescale/pinctrl-imx.c:267:7: error: incomplete definition of type 'struct function_desc'
                   func->name, grp->name);
                   ~~~~^
   include/linux/dev_printk.h:158:46: note: expanded from macro 'dev_dbg'
           dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                       ^~~~~~~~~~~
   include/linux/dev_printk.h:129:34: note: expanded from macro 'dev_printk'
                   _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
                                                  ^~~~~~~~~~~
   drivers/pinctrl/freescale/pinctrl-imx.c:246:9: note: forward declaration of 'struct function_desc'
           struct function_desc *func;
                  ^
>> drivers/pinctrl/freescale/pinctrl-imx.c:287:25: error: use of undeclared identifier 'pinmux_generic_get_function_count'; did you mean 'pinmux_generic_free_functions'?
           .get_functions_count = pinmux_generic_get_function_count,
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                  pinmux_generic_free_functions
   drivers/pinctrl/freescale/../pinmux.h:164:20: note: 'pinmux_generic_free_functions' declared here
   static inline void pinmux_generic_free_functions(struct pinctrl_dev *pctldev)
                      ^
>> drivers/pinctrl/freescale/pinctrl-imx.c:288:23: error: use of undeclared identifier 'pinmux_generic_get_function_name'; did you mean 'pinmux_generic_free_functions'?
           .get_function_name = pinmux_generic_get_function_name,
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                pinmux_generic_free_functions
   drivers/pinctrl/freescale/../pinmux.h:164:20: note: 'pinmux_generic_free_functions' declared here
   static inline void pinmux_generic_free_functions(struct pinctrl_dev *pctldev)
                      ^
>> drivers/pinctrl/freescale/pinctrl-imx.c:289:25: error: use of undeclared identifier 'pinmux_generic_get_function_groups'; did you mean 'pinmux_generic_free_functions'?
           .get_function_groups = pinmux_generic_get_function_groups,
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                  pinmux_generic_free_functions
   drivers/pinctrl/freescale/../pinmux.h:164:20: note: 'pinmux_generic_free_functions' declared here
   static inline void pinmux_generic_free_functions(struct pinctrl_dev *pctldev)
                      ^
>> drivers/pinctrl/freescale/pinctrl-imx.c:287:25: error: incompatible function pointer types initializing 'int (*)(struct pinctrl_dev *)' with an expression of type 'void (struct pinctrl_dev *)' [-Wincompatible-function-pointer-types]
           .get_functions_count = pinmux_generic_get_function_count,
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/freescale/pinctrl-imx.c:288:23: error: incompatible function pointer types initializing 'const char *(*)(struct pinctrl_dev *, unsigned int)' with an expression of type 'void (struct pinctrl_dev *)' [-Wincompatible-function-pointer-types]
           .get_function_name = pinmux_generic_get_function_name,
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/freescale/pinctrl-imx.c:289:25: error: incompatible function pointer types initializing 'int (*)(struct pinctrl_dev *, unsigned int, const char *const **, unsigned int *)' with an expression of type 'void (struct pinctrl_dev *)' [-Wincompatible-function-pointer-types]
           .get_function_groups = pinmux_generic_get_function_groups,
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/freescale/pinctrl-imx.c:341:8: error: call to undeclared function 'pinconf_generic_parse_dt_config'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           ret = pinconf_generic_parse_dt_config(np, pctl, &configs,
                 ^
   drivers/pinctrl/freescale/pinctrl-imx.c:341:8: note: did you mean 'pinconf_generic_dump_config'?
   drivers/pinctrl/freescale/../pinconf.h:107:6: note: 'pinconf_generic_dump_config' declared here
   void pinconf_generic_dump_config(struct pinctrl_dev *pctldev,
        ^
   drivers/pinctrl/freescale/pinctrl-imx.c:656:9: error: call to undeclared function 'pinmux_generic_get_function'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           func = pinmux_generic_get_function(pctl, index);
                  ^
   drivers/pinctrl/freescale/pinctrl-imx.c:656:7: error: incompatible integer to pointer conversion assigning to 'struct function_desc *' from 'int' [-Wint-conversion]
           func = pinmux_generic_get_function(pctl, index);
                ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/freescale/pinctrl-imx.c:661:6: error: incomplete definition of type 'struct function_desc'
           func->name = np->name;
           ~~~~^
   drivers/pinctrl/freescale/pinctrl-imx.c:649:9: note: forward declaration of 'struct function_desc'
           struct function_desc *func;
                  ^
   drivers/pinctrl/freescale/pinctrl-imx.c:662:6: error: incomplete definition of type 'struct function_desc'
           func->num_group_names = of_get_child_count(np);
           ~~~~^
   drivers/pinctrl/freescale/pinctrl-imx.c:649:9: note: forward declaration of 'struct function_desc'
           struct function_desc *func;
                  ^
   drivers/pinctrl/freescale/pinctrl-imx.c:663:10: error: incomplete definition of type 'struct function_desc'
           if (func->num_group_names == 0) {
               ~~~~^
   drivers/pinctrl/freescale/pinctrl-imx.c:649:9: note: forward declaration of 'struct function_desc'
           struct function_desc *func;
                  ^
   drivers/pinctrl/freescale/pinctrl-imx.c:668:45: error: incomplete definition of type 'struct function_desc'
           group_names = devm_kcalloc(ipctl->dev, func->num_group_names,
                                                  ~~~~^
   drivers/pinctrl/freescale/pinctrl-imx.c:649:9: note: forward declaration of 'struct function_desc'
           struct function_desc *func;
                  ^
   drivers/pinctrl/freescale/pinctrl-imx.c:675:6: error: incomplete definition of type 'struct function_desc'
           func->group_names = group_names;
           ~~~~^
   drivers/pinctrl/freescale/pinctrl-imx.c:649:9: note: forward declaration of 'struct function_desc'
           struct function_desc *func;
                  ^
>> drivers/pinctrl/freescale/pinctrl-imx.c:752:45: error: invalid application of 'sizeof' to an incomplete type 'struct function_desc'
                   function = devm_kzalloc(&pdev->dev, sizeof(*function),
                                                             ^~~~~~~~~~~
   drivers/pinctrl/freescale/pinctrl-imx.c:750:10: note: forward declaration of 'struct function_desc'
                   struct function_desc *function;
                          ^
>> drivers/pinctrl/freescale/pinctrl-imx.c:758:28: error: no member named 'pin_function_tree' in 'struct pinctrl_dev'
                   radix_tree_insert(&pctl->pin_function_tree, i, function);
                                      ~~~~  ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   12 warnings and 20 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PINCTRL_IMX
   Depends on [n]: PINCTRL [=y] && OF [=n]
   Selected by [y]:
   - PINCTRL_IMX8MN [=y] && PINCTRL [=y] && SOC_IMX8M [=y]
   - PINCTRL_IMX8MQ [=y] && PINCTRL [=y] && SOC_IMX8M [=y]
   Selected by [m]:
   - PINCTRL_IMX8MP [=m] && PINCTRL [=y] && SOC_IMX8M [=y]


vim +/pinmux_generic_get_function +260 drivers/pinctrl/freescale/pinctrl-imx.c

b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-10-30  240  
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-10-30  241  static int imx_pmx_set(struct pinctrl_dev *pctldev, unsigned selector,
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-10-30  242  		       unsigned group)
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-10-30  243  {
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-10-30  244  	struct imx_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-10-30  245  	const struct imx_pinctrl_soc_info *info = ipctl->info;
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-10-30 @246  	struct function_desc *func;
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-10-30  247  	struct group_desc *grp;
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-10-30  248  	struct imx_pin *pin;
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-10-30  249  	unsigned int npins;
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-10-30  250  	int i, err;
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-10-30  251  
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-10-30  252  	/*
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-10-30  253  	 * Configure the mux mode for each pin in the group for a specific
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-10-30  254  	 * function.
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-10-30  255  	 */
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-10-30  256  	grp = pinctrl_generic_get_group(pctldev, group);
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-10-30  257  	if (!grp)
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-10-30  258  		return -EINVAL;
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-10-30  259  
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-10-30 @260  	func = pinmux_generic_get_function(pctldev, selector);
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-10-30  261  	if (!func)
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-10-30  262  		return -EINVAL;
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-10-30  263  
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-10-30  264  	npins = grp->num_pins;
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-10-30  265  
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-10-30  266  	dev_dbg(ipctl->dev, "enable function %s group %s\n",
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-10-30 @267  		func->name, grp->name);
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-10-30  268  
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-10-30  269  	for (i = 0; i < npins; i++) {
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-10-30  270  		/*
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-10-30  271  		 * For IMX_USE_SCU case, we postpone the mux setting
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-10-30  272  		 * until config is set as we can set them together
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-10-30  273  		 * in one IPC call
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-10-30  274  		 */
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-10-30  275  		pin = &((struct imx_pin *)(grp->data))[i];
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-10-30  276  		if (!(info->flags & IMX_USE_SCU)) {
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-10-30  277  			err = imx_pmx_set_one_pin_mmio(ipctl, pin);
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-10-30  278  			if (err)
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-10-30  279  				return err;
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng  2012-04-27  280  		}
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng  2012-04-27  281  	}
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng  2012-04-27  282  
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng  2012-04-27  283  	return 0;
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng  2012-04-27  284  }
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng  2012-04-27  285  
3be6f65102a859 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-07-25  286  struct pinmux_ops imx_pmx_ops = {
3fd6d6ad73af90 drivers/pinctrl/freescale/pinctrl-imx.c Gary Bisson   2017-01-02 @287  	.get_functions_count = pinmux_generic_get_function_count,
3fd6d6ad73af90 drivers/pinctrl/freescale/pinctrl-imx.c Gary Bisson   2017-01-02 @288  	.get_function_name = pinmux_generic_get_function_name,
3fd6d6ad73af90 drivers/pinctrl/freescale/pinctrl-imx.c Gary Bisson   2017-01-02 @289  	.get_function_groups = pinmux_generic_get_function_groups,
03e9f0cac5da6a drivers/pinctrl/pinctrl-imx.c           Linus Walleij 2014-09-03  290  	.set_mux = imx_pmx_set,
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng  2012-04-27  291  };
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng  2012-04-27  292  
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-05-19  293  /* decode generic config into raw register values */
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-05-19  294  static u32 imx_pinconf_decode_generic_config(struct imx_pinctrl *ipctl,
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-05-19  295  					      unsigned long *configs,
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-05-19  296  					      unsigned int num_configs)
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-05-19  297  {
f5843492ecefcf drivers/pinctrl/freescale/pinctrl-imx.c Stefan Agner  2018-01-06  298  	const struct imx_pinctrl_soc_info *info = ipctl->info;
d6093367bc743b drivers/pinctrl/freescale/pinctrl-imx.c Stefan Agner  2018-01-06  299  	const struct imx_cfg_params_decode *decode;
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-05-19  300  	enum pin_config_param param;
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-05-19  301  	u32 raw_config = 0;
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-05-19  302  	u32 param_val;
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-05-19  303  	int i, j;
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-05-19  304  
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-05-19  305  	WARN_ON(num_configs > info->num_decodes);
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-05-19  306  
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-05-19  307  	for (i = 0; i < num_configs; i++) {
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-05-19  308  		param = pinconf_to_config_param(configs[i]);
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-05-19  309  		param_val = pinconf_to_config_argument(configs[i]);
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-05-19  310  		decode = info->decodes;
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-05-19  311  		for (j = 0; j < info->num_decodes; j++) {
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-05-19  312  			if (param == decode->param) {
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-05-19  313  				if (decode->invert)
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-05-19  314  					param_val = !param_val;
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-05-19  315  				raw_config |= (param_val << decode->shift)
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-05-19  316  					      & decode->mask;
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-05-19  317  				break;
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-05-19  318  			}
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-05-19  319  			decode++;
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-05-19  320  		}
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-05-19  321  	}
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-05-19  322  
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-05-19  323  	if (info->fixup)
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-05-19  324  		info->fixup(configs, num_configs, &raw_config);
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-05-19  325  
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-05-19  326  	return raw_config;
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-05-19  327  }
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-05-19  328  
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-05-19  329  static u32 imx_pinconf_parse_generic_config(struct device_node *np,
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-05-19  330  					    struct imx_pinctrl *ipctl)
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-05-19  331  {
f5843492ecefcf drivers/pinctrl/freescale/pinctrl-imx.c Stefan Agner  2018-01-06  332  	const struct imx_pinctrl_soc_info *info = ipctl->info;
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-05-19  333  	struct pinctrl_dev *pctl = ipctl->pctl;
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-05-19  334  	unsigned int num_configs;
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-05-19  335  	unsigned long *configs;
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-05-19  336  	int ret;
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-05-19  337  
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-05-19  338  	if (!info->generic_pinconf)
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-05-19  339  		return 0;
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-05-19  340  
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-05-19 @341  	ret = pinconf_generic_parse_dt_config(np, pctl, &configs,
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-05-19  342  					      &num_configs);
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-05-19  343  	if (ret)
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-05-19  344  		return 0;
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-05-19  345  
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-05-19  346  	return imx_pinconf_decode_generic_config(ipctl, configs, num_configs);
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-05-19  347  }
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-05-19  348  

:::::: The code at line 260 was first introduced by commit
:::::: b96eea718bf697e4a490c2fabfb89995b9193c21 pinctrl: fsl: add scu based pinctrl support

:::::: TO: A.s. Dong <aisheng.dong@nxp.com>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

--SzSsESMIxQXg3A71
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=config

#
# Automatically generated file; DO NOT EDIT.
# Linux/s390 6.0.0-rc1 Kernel Configuration
#
CONFIG_CC_VERSION_TEXT="clang version 16.0.0 (git://gitmirror/llvm_project c55b41d5199d2394dd6cdb8f52180d8b81d809d4)"
CONFIG_GCC_VERSION=0
CONFIG_CC_IS_CLANG=y
CONFIG_CLANG_VERSION=160000
CONFIG_AS_IS_LLVM=y
CONFIG_AS_VERSION=160000
CONFIG_LD_IS_BFD=y
CONFIG_LD_VERSION=23800
CONFIG_LLD_VERSION=0
CONFIG_CC_HAS_ASM_GOTO=y
CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y
CONFIG_CC_HAS_ASM_INLINE=y
CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=y
CONFIG_PAHOLE_VERSION=123
CONFIG_IRQ_WORK=y
CONFIG_BUILDTIME_TABLE_SORT=y
CONFIG_THREAD_INFO_IN_TASK=y

#
# General setup
#
CONFIG_INIT_ENV_ARG_LIMIT=32
CONFIG_COMPILE_TEST=y
# CONFIG_WERROR is not set
CONFIG_LOCALVERSION=""
CONFIG_BUILD_SALT=""
CONFIG_HAVE_KERNEL_GZIP=y
CONFIG_HAVE_KERNEL_BZIP2=y
CONFIG_HAVE_KERNEL_LZMA=y
CONFIG_HAVE_KERNEL_XZ=y
CONFIG_HAVE_KERNEL_LZO=y
CONFIG_HAVE_KERNEL_LZ4=y
CONFIG_HAVE_KERNEL_ZSTD=y
CONFIG_HAVE_KERNEL_UNCOMPRESSED=y
# CONFIG_KERNEL_GZIP is not set
# CONFIG_KERNEL_BZIP2 is not set
CONFIG_KERNEL_LZMA=y
# CONFIG_KERNEL_XZ is not set
# CONFIG_KERNEL_LZO is not set
# CONFIG_KERNEL_LZ4 is not set
# CONFIG_KERNEL_ZSTD is not set
# CONFIG_KERNEL_UNCOMPRESSED is not set
CONFIG_DEFAULT_INIT=""
CONFIG_DEFAULT_HOSTNAME="(none)"
# CONFIG_SYSVIPC is not set
# CONFIG_POSIX_MQUEUE is not set
# CONFIG_WATCH_QUEUE is not set
CONFIG_CROSS_MEMORY_ATTACH=y
# CONFIG_USELIB is not set
CONFIG_AUDIT=y
CONFIG_HAVE_ARCH_AUDITSYSCALL=y
CONFIG_AUDITSYSCALL=y

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_CHIP=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_SIM=y
CONFIG_IRQ_DOMAIN_HIERARCHY=y
CONFIG_IRQ_FASTEOI_HIERARCHY_HANDLERS=y
CONFIG_GENERIC_MSI_IRQ=y
CONFIG_GENERIC_MSI_IRQ_DOMAIN=y
CONFIG_SPARSE_IRQ=y
# CONFIG_GENERIC_IRQ_DEBUGFS is not set
# end of IRQ subsystem

CONFIG_GENERIC_TIME_VSYSCALL=y
CONFIG_GENERIC_CLOCKEVENTS=y
CONFIG_CONTEXT_TRACKING=y
CONFIG_CONTEXT_TRACKING_IDLE=y

#
# Timers subsystem
#
CONFIG_TICK_ONESHOT=y
CONFIG_NO_HZ_COMMON=y
# CONFIG_HZ_PERIODIC is not set
CONFIG_NO_HZ_IDLE=y
CONFIG_NO_HZ=y
# CONFIG_HIGH_RES_TIMERS is not set
# end of Timers subsystem

CONFIG_BPF=y
CONFIG_HAVE_EBPF_JIT=y
CONFIG_ARCH_WANT_DEFAULT_BPF_JIT=y

#
# BPF subsystem
#
CONFIG_BPF_SYSCALL=y
# CONFIG_BPF_JIT is not set
# CONFIG_BPF_UNPRIV_DEFAULT_OFF is not set
CONFIG_USERMODE_DRIVER=y
# end of BPF subsystem

CONFIG_PREEMPT_VOLUNTARY_BUILD=y
# CONFIG_PREEMPT_NONE is not set
CONFIG_PREEMPT_VOLUNTARY=y
# CONFIG_PREEMPT is not set
CONFIG_PREEMPT_COUNT=y
# CONFIG_SCHED_CORE is not set

#
# CPU/Task time and stats accounting
#
CONFIG_VIRT_CPU_ACCOUNTING=y
CONFIG_VIRT_CPU_ACCOUNTING_NATIVE=y
# CONFIG_PSI is not set
# end of CPU/Task time and stats accounting

CONFIG_CPU_ISOLATION=y

#
# RCU Subsystem
#
CONFIG_TREE_RCU=y
CONFIG_RCU_EXPERT=y
CONFIG_SRCU=y
CONFIG_TREE_SRCU=y
CONFIG_TASKS_RCU_GENERIC=y
# CONFIG_FORCE_TASKS_RCU is not set
# CONFIG_FORCE_TASKS_RUDE_RCU is not set
CONFIG_TASKS_RUDE_RCU=y
CONFIG_FORCE_TASKS_TRACE_RCU=y
CONFIG_TASKS_TRACE_RCU=y
CONFIG_RCU_STALL_COMMON=y
CONFIG_RCU_NEED_SEGCBLIST=y
CONFIG_RCU_FANOUT=64
CONFIG_RCU_FANOUT_LEAF=16
# CONFIG_RCU_NOCB_CPU is not set
CONFIG_TASKS_TRACE_RCU_READ_MB=y
# end of RCU Subsystem

# CONFIG_IKCONFIG is not set
# CONFIG_IKHEADERS is not set

#
# Scheduler features
#
# end of Scheduler features

CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=y
CONFIG_CC_HAS_INT128=y
CONFIG_CC_IMPLICIT_FALLTHROUGH="-Wimplicit-fallthrough"
CONFIG_GCC12_NO_ARRAY_BOUNDS=y
# CONFIG_NUMA_BALANCING is not set
# CONFIG_CGROUPS is not set
CONFIG_CHECKPOINT_RESTORE=y
# CONFIG_SCHED_AUTOGROUP is not set
CONFIG_SYSFS_DEPRECATED=y
CONFIG_SYSFS_DEPRECATED_V2=y
# CONFIG_RELAY is not set
CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE=""
# CONFIG_RD_GZIP is not set
CONFIG_RD_BZIP2=y
# CONFIG_RD_LZMA is not set
CONFIG_RD_XZ=y
# CONFIG_RD_LZO is not set
# CONFIG_RD_LZ4 is not set
CONFIG_RD_ZSTD=y
CONFIG_BOOT_CONFIG=y
CONFIG_BOOT_CONFIG_EMBED=y
CONFIG_BOOT_CONFIG_EMBED_FILE=""
CONFIG_INITRAMFS_PRESERVE_MTIME=y
CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=y
# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
CONFIG_SYSCTL=y
CONFIG_SYSCTL_EXCEPTION_TRACE=y
CONFIG_EXPERT=y
# CONFIG_MULTIUSER is not set
# CONFIG_SGETMASK_SYSCALL is not set
# CONFIG_SYSFS_SYSCALL is not set
# CONFIG_FHANDLE is not set
# CONFIG_POSIX_TIMERS is not set
# CONFIG_PRINTK is not set
CONFIG_BUG=y
CONFIG_BASE_FULL=y
# CONFIG_FUTEX is not set
# CONFIG_EPOLL is not set
# CONFIG_SIGNALFD is not set
CONFIG_TIMERFD=y
CONFIG_EVENTFD=y
CONFIG_SHMEM=y
# CONFIG_AIO is not set
CONFIG_IO_URING=y
# CONFIG_ADVISE_SYSCALLS is not set
CONFIG_MEMBARRIER=y
CONFIG_KALLSYMS=y
CONFIG_KALLSYMS_ALL=y
CONFIG_KALLSYMS_BASE_RELATIVE=y
CONFIG_KCMP=y
CONFIG_RSEQ=y
# CONFIG_DEBUG_RSEQ is not set
CONFIG_EMBEDDED=y
CONFIG_HAVE_PERF_EVENTS=y
# CONFIG_PC104 is not set

#
# Kernel Performance Events And Counters
#
# CONFIG_PERF_EVENTS is not set
# end of Kernel Performance Events And Counters

CONFIG_SYSTEM_DATA_VERIFICATION=y
CONFIG_PROFILING=y
CONFIG_TRACEPOINTS=y
# end of General setup

CONFIG_MMU=y
CONFIG_CPU_BIG_ENDIAN=y
CONFIG_LOCKDEP_SUPPORT=y
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_GENERIC_HWEIGHT=y
CONFIG_GENERIC_BUG=y
CONFIG_GENERIC_BUG_RELATIVE_POINTERS=y
CONFIG_PGSTE=y
CONFIG_AUDIT_ARCH=y
CONFIG_NO_IOPORT_MAP=y
CONFIG_PCI_QUIRKS=y
CONFIG_ARCH_SUPPORTS_UPROBES=y
CONFIG_S390=y
CONFIG_SCHED_OMIT_FRAME_POINTER=y
CONFIG_PGTABLE_LEVELS=5
CONFIG_HAVE_LIVEPATCH=y
# CONFIG_LIVEPATCH is not set

#
# Processor type and features
#
CONFIG_HAVE_MARCH_Z10_FEATURES=y
CONFIG_HAVE_MARCH_Z196_FEATURES=y
CONFIG_HAVE_MARCH_ZEC12_FEATURES=y
CONFIG_HAVE_MARCH_Z13_FEATURES=y
CONFIG_HAVE_MARCH_Z14_FEATURES=y
# CONFIG_MARCH_Z10 is not set
# CONFIG_MARCH_Z196 is not set
# CONFIG_MARCH_ZEC12 is not set
# CONFIG_MARCH_Z13 is not set
CONFIG_MARCH_Z14=y
# CONFIG_MARCH_Z15 is not set
# CONFIG_MARCH_Z16 is not set
CONFIG_MARCH_Z13_TUNE=y
# CONFIG_TUNE_DEFAULT is not set
# CONFIG_TUNE_Z10 is not set
# CONFIG_TUNE_Z196 is not set
# CONFIG_TUNE_ZEC12 is not set
CONFIG_TUNE_Z13=y
# CONFIG_TUNE_Z14 is not set
# CONFIG_TUNE_Z15 is not set
# CONFIG_TUNE_Z16 is not set
CONFIG_64BIT=y
CONFIG_COMMAND_LINE_SIZE=4096
CONFIG_SMP=y
CONFIG_NR_CPUS=64
CONFIG_HOTPLUG_CPU=y
CONFIG_NUMA=y
CONFIG_NODES_SHIFT=1
CONFIG_SCHED_SMT=y
CONFIG_SCHED_MC=y
CONFIG_SCHED_BOOK=y
CONFIG_SCHED_DRAWER=y
CONFIG_SCHED_TOPOLOGY=y
# CONFIG_HZ_100 is not set
# CONFIG_HZ_250 is not set
CONFIG_HZ_300=y
# CONFIG_HZ_1000 is not set
CONFIG_HZ=300
CONFIG_KEXEC=y
CONFIG_KERNEL_NOBP=y
CONFIG_RELOCATABLE=y
# CONFIG_RANDOMIZE_BASE is not set
# end of Processor type and features

#
# Memory setup
#
CONFIG_ARCH_SPARSEMEM_ENABLE=y
CONFIG_ARCH_SPARSEMEM_DEFAULT=y
CONFIG_MAX_PHYSMEM_BITS=46
# end of Memory setup

#
# I/O subsystem
#
CONFIG_QDIO=y
CONFIG_PCI_NR_FUNCTIONS=512
CONFIG_HAS_IOMEM=y
# CONFIG_CHSC_SCH is not set
CONFIG_SCM_BUS=y
# CONFIG_EADM_SCH is not set
# end of I/O subsystem

#
# Dump support
#
CONFIG_CRASH_DUMP=y
# end of Dump support

CONFIG_CCW=y
CONFIG_HAVE_PNETID=y

#
# Virtualization
#
# CONFIG_PROTECTED_VIRTUALIZATION_GUEST is not set
# CONFIG_PFAULT is not set
# CONFIG_CMM is not set
CONFIG_APPLDATA_BASE=y
CONFIG_APPLDATA_OS=m
CONFIG_APPLDATA_NET_SUM=y
CONFIG_S390_HYPFS_FS=y
CONFIG_HAVE_KVM=y
CONFIG_HAVE_KVM_IRQCHIP=y
CONFIG_HAVE_KVM_IRQFD=y
CONFIG_HAVE_KVM_IRQ_ROUTING=y
CONFIG_HAVE_KVM_EVENTFD=y
CONFIG_KVM_ASYNC_PF=y
CONFIG_KVM_ASYNC_PF_SYNC=y
CONFIG_HAVE_KVM_CPU_RELAX_INTERCEPT=y
CONFIG_KVM_VFIO=y
CONFIG_HAVE_KVM_INVALID_WAKEUPS=y
CONFIG_HAVE_KVM_VCPU_ASYNC_IOCTL=y
CONFIG_HAVE_KVM_NO_POLL=y
CONFIG_VIRTUALIZATION=y
CONFIG_KVM=y
CONFIG_KVM_S390_UCONTROL=y
CONFIG_S390_GUEST=y
# end of Virtualization

#
# Selftests
#
# end of Selftests

#
# General architecture-dependent options
#
CONFIG_CRASH_CORE=y
CONFIG_KEXEC_CORE=y
CONFIG_GENERIC_ENTRY=y
# CONFIG_KPROBES is not set
CONFIG_JUMP_LABEL=y
# CONFIG_STATIC_KEYS_SELFTEST is not set
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
CONFIG_ARCH_USE_BUILTIN_BSWAP=y
CONFIG_HAVE_IOREMAP_PROT=y
CONFIG_HAVE_KPROBES=y
CONFIG_HAVE_KRETPROBES=y
CONFIG_HAVE_KPROBES_ON_FTRACE=y
CONFIG_ARCH_CORRECT_STACKTRACE_ON_KRETPROBE=y
CONFIG_HAVE_FUNCTION_ERROR_INJECTION=y
CONFIG_HAVE_NMI=y
CONFIG_TRACE_IRQFLAGS_SUPPORT=y
CONFIG_HAVE_ARCH_TRACEHOOK=y
CONFIG_HAVE_DMA_CONTIGUOUS=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_ARCH_HAS_FORTIFY_SOURCE=y
CONFIG_ARCH_HAS_SET_MEMORY=y
CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=y
CONFIG_ARCH_WANTS_NO_INSTR=y
CONFIG_ARCH_32BIT_USTAT_F_TINODE=y
CONFIG_HAVE_ASM_MODVERSIONS=y
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
CONFIG_HAVE_RSEQ=y
CONFIG_HAVE_FUNCTION_ARG_ACCESS_API=y
CONFIG_HAVE_PERF_REGS=y
CONFIG_HAVE_PERF_USER_STACK_DUMP=y
CONFIG_HAVE_ARCH_JUMP_LABEL=y
CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=y
CONFIG_MMU_GATHER_TABLE_FREE=y
CONFIG_MMU_GATHER_RCU_TABLE_FREE=y
CONFIG_MMU_GATHER_MERGE_VMAS=y
CONFIG_MMU_GATHER_NO_GATHER=y
CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
CONFIG_HAVE_CMPXCHG_LOCAL=y
CONFIG_HAVE_CMPXCHG_DOUBLE=y
CONFIG_ARCH_WANT_IPC_PARSE_VERSION=y
CONFIG_HAVE_ARCH_SECCOMP=y
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
# CONFIG_SECCOMP is not set
CONFIG_LTO_NONE=y
CONFIG_HAVE_VIRT_CPU_ACCOUNTING=y
CONFIG_HAVE_VIRT_CPU_ACCOUNTING_IDLE=y
CONFIG_ARCH_HAS_SCALED_CPUTIME=y
CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
CONFIG_HAVE_ARCH_SOFT_DIRTY=y
CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
CONFIG_MODULES_USE_ELF_RELA=y
CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK=y
CONFIG_ALTERNATE_USER_ADDRESS_SPACE=y
CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
CONFIG_PAGE_SIZE_LESS_THAN_64KB=y
CONFIG_PAGE_SIZE_LESS_THAN_256KB=y
CONFIG_HAVE_RELIABLE_STACKTRACE=y
CONFIG_ISA_BUS_API=y
CONFIG_CLONE_BACKWARDS2=y
CONFIG_OLD_SIGSUSPEND3=y
CONFIG_OLD_SIGACTION=y
# CONFIG_COMPAT_32BIT_TIME is not set
CONFIG_HAVE_ARCH_VMAP_STACK=y
CONFIG_VMAP_STACK=y
CONFIG_HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET=y
# CONFIG_RANDOMIZE_KSTACK_OFFSET is not set
CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
CONFIG_STRICT_KERNEL_RWX=y
CONFIG_ARCH_HAS_STRICT_MODULE_RWX=y
CONFIG_STRICT_MODULE_RWX=y
# CONFIG_LOCK_EVENT_COUNTS is not set
CONFIG_ARCH_HAS_MEM_ENCRYPT=y
CONFIG_ARCH_HAS_VDSO_DATA=y
CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y

#
# GCOV-based kernel profiling
#
# CONFIG_GCOV_KERNEL is not set
CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
# end of GCOV-based kernel profiling

CONFIG_HAVE_GCC_PLUGINS=y
# end of General architecture-dependent options

CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=0
CONFIG_MODULE_SIG_FORMAT=y
CONFIG_MODULES=y
# CONFIG_MODULE_FORCE_LOAD is not set
CONFIG_MODULE_UNLOAD=y
# CONFIG_MODULE_FORCE_UNLOAD is not set
CONFIG_MODULE_UNLOAD_TAINT_TRACKING=y
CONFIG_MODVERSIONS=y
CONFIG_ASM_MODVERSIONS=y
# CONFIG_MODULE_SRCVERSION_ALL is not set
CONFIG_MODULE_SIG=y
# CONFIG_MODULE_SIG_FORCE is not set
# CONFIG_MODULE_SIG_ALL is not set
# CONFIG_MODULE_SIG_SHA1 is not set
# CONFIG_MODULE_SIG_SHA224 is not set
# CONFIG_MODULE_SIG_SHA256 is not set
CONFIG_MODULE_SIG_SHA384=y
# CONFIG_MODULE_SIG_SHA512 is not set
CONFIG_MODULE_SIG_HASH="sha384"
# CONFIG_MODULE_COMPRESS_NONE is not set
CONFIG_MODULE_COMPRESS_GZIP=y
# CONFIG_MODULE_COMPRESS_XZ is not set
# CONFIG_MODULE_COMPRESS_ZSTD is not set
# CONFIG_MODULE_DECOMPRESS is not set
# CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not set
CONFIG_MODPROBE_PATH="/sbin/modprobe"
CONFIG_MODULES_TREE_LOOKUP=y
CONFIG_BLOCK=y
# CONFIG_BLOCK_LEGACY_AUTOLOAD is not set
CONFIG_BLK_DEV_BSG_COMMON=y
CONFIG_BLK_DEV_BSGLIB=y
CONFIG_BLK_DEV_INTEGRITY=y
CONFIG_BLK_DEV_INTEGRITY_T10=y
# CONFIG_BLK_DEV_ZONED is not set
# CONFIG_BLK_WBT is not set
# CONFIG_BLK_DEBUG_FS is not set
# CONFIG_BLK_SED_OPAL is not set
CONFIG_BLK_INLINE_ENCRYPTION=y
CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK=y

#
# Partition Types
#
CONFIG_PARTITION_ADVANCED=y
CONFIG_ACORN_PARTITION=y
CONFIG_ACORN_PARTITION_CUMANA=y
# CONFIG_ACORN_PARTITION_EESOX is not set
CONFIG_ACORN_PARTITION_ICS=y
# CONFIG_ACORN_PARTITION_ADFS is not set
# CONFIG_ACORN_PARTITION_POWERTEC is not set
# CONFIG_ACORN_PARTITION_RISCIX is not set
CONFIG_AIX_PARTITION=y
CONFIG_OSF_PARTITION=y
CONFIG_AMIGA_PARTITION=y
CONFIG_ATARI_PARTITION=y
# CONFIG_IBM_PARTITION is not set
# CONFIG_MAC_PARTITION is not set
# CONFIG_MSDOS_PARTITION is not set
# CONFIG_LDM_PARTITION is not set
# CONFIG_SGI_PARTITION is not set
# CONFIG_ULTRIX_PARTITION is not set
# CONFIG_SUN_PARTITION is not set
# CONFIG_KARMA_PARTITION is not set
# CONFIG_EFI_PARTITION is not set
CONFIG_SYSV68_PARTITION=y
# CONFIG_CMDLINE_PARTITION is not set
# end of Partition Types

CONFIG_BLK_MQ_PCI=y
CONFIG_BLK_MQ_VIRTIO=y
CONFIG_BLK_MQ_RDMA=y
CONFIG_BLOCK_HOLDER_DEPRECATED=y
CONFIG_BLK_MQ_STACKING=y

#
# IO Schedulers
#
CONFIG_MQ_IOSCHED_DEADLINE=m
CONFIG_MQ_IOSCHED_KYBER=y
# CONFIG_IOSCHED_BFQ is not set
# end of IO Schedulers

CONFIG_PREEMPT_NOTIFIERS=y
CONFIG_PADATA=y
CONFIG_ASN1=y
CONFIG_ARCH_INLINE_SPIN_TRYLOCK=y
CONFIG_ARCH_INLINE_SPIN_TRYLOCK_BH=y
CONFIG_ARCH_INLINE_SPIN_LOCK=y
CONFIG_ARCH_INLINE_SPIN_LOCK_BH=y
CONFIG_ARCH_INLINE_SPIN_LOCK_IRQ=y
CONFIG_ARCH_INLINE_SPIN_LOCK_IRQSAVE=y
CONFIG_ARCH_INLINE_SPIN_UNLOCK=y
CONFIG_ARCH_INLINE_SPIN_UNLOCK_BH=y
CONFIG_ARCH_INLINE_SPIN_UNLOCK_IRQ=y
CONFIG_ARCH_INLINE_SPIN_UNLOCK_IRQRESTORE=y
CONFIG_ARCH_INLINE_READ_TRYLOCK=y
CONFIG_ARCH_INLINE_READ_LOCK=y
CONFIG_ARCH_INLINE_READ_LOCK_BH=y
CONFIG_ARCH_INLINE_READ_LOCK_IRQ=y
CONFIG_ARCH_INLINE_READ_LOCK_IRQSAVE=y
CONFIG_ARCH_INLINE_READ_UNLOCK=y
CONFIG_ARCH_INLINE_READ_UNLOCK_BH=y
CONFIG_ARCH_INLINE_READ_UNLOCK_IRQ=y
CONFIG_ARCH_INLINE_READ_UNLOCK_IRQRESTORE=y
CONFIG_ARCH_INLINE_WRITE_TRYLOCK=y
CONFIG_ARCH_INLINE_WRITE_LOCK=y
CONFIG_ARCH_INLINE_WRITE_LOCK_BH=y
CONFIG_ARCH_INLINE_WRITE_LOCK_IRQ=y
CONFIG_ARCH_INLINE_WRITE_LOCK_IRQSAVE=y
CONFIG_ARCH_INLINE_WRITE_UNLOCK=y
CONFIG_ARCH_INLINE_WRITE_UNLOCK_BH=y
CONFIG_ARCH_INLINE_WRITE_UNLOCK_IRQ=y
CONFIG_ARCH_INLINE_WRITE_UNLOCK_IRQRESTORE=y
CONFIG_UNINLINE_SPIN_UNLOCK=y
CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
CONFIG_MUTEX_SPIN_ON_OWNER=y
CONFIG_RWSEM_SPIN_ON_OWNER=y
CONFIG_LOCK_SPIN_ON_OWNER=y
CONFIG_ARCH_HAS_SYSCALL_WRAPPER=y

#
# Executable file formats
#
# CONFIG_BINFMT_ELF is not set
CONFIG_ARCH_BINFMT_ELF_STATE=y
# CONFIG_BINFMT_SCRIPT is not set
CONFIG_BINFMT_MISC=y
# CONFIG_COREDUMP is not set
# end of Executable file formats

#
# Memory Management options
#
CONFIG_SWAP=y
# CONFIG_ZSWAP is not set

#
# SLAB allocator options
#
CONFIG_SLAB=y
# CONFIG_SLUB is not set
# CONFIG_SLOB is not set
CONFIG_SLAB_MERGE_DEFAULT=y
CONFIG_SLAB_FREELIST_RANDOM=y
CONFIG_SLAB_FREELIST_HARDENED=y
# end of SLAB allocator options

CONFIG_SHUFFLE_PAGE_ALLOCATOR=y
CONFIG_COMPAT_BRK=y
CONFIG_SPARSEMEM=y
CONFIG_SPARSEMEM_EXTREME=y
CONFIG_SPARSEMEM_VMEMMAP_ENABLE=y
CONFIG_SPARSEMEM_VMEMMAP=y
CONFIG_HAVE_MEMBLOCK_PHYS_MAP=y
CONFIG_HAVE_FAST_GUP=y
CONFIG_MEMORY_ISOLATION=y
CONFIG_EXCLUSIVE_SYSTEM_RAM=y
CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=y
CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=y
# CONFIG_MEMORY_HOTPLUG is not set
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=y
CONFIG_MEMORY_BALLOON=y
CONFIG_BALLOON_COMPACTION=y
CONFIG_COMPACTION=y
CONFIG_PAGE_REPORTING=y
CONFIG_MIGRATION=y
CONFIG_CONTIG_ALLOC=y
CONFIG_PHYS_ADDR_T_64BIT=y
CONFIG_MMU_NOTIFIER=y
CONFIG_KSM=y
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
# CONFIG_TRANSPARENT_HUGEPAGE is not set
CONFIG_CMA=y
CONFIG_CMA_DEBUG=y
# CONFIG_CMA_DEBUGFS is not set
CONFIG_CMA_SYSFS=y
CONFIG_CMA_AREAS=19
CONFIG_MEM_SOFT_DIRTY=y
# CONFIG_DEFERRED_STRUCT_PAGE_INIT is not set
CONFIG_PAGE_IDLE_FLAG=y
CONFIG_IDLE_PAGE_TRACKING=y
CONFIG_ARCH_HAS_CURRENT_STACK_POINTER=y
CONFIG_ZONE_DMA=y
# CONFIG_VM_EVENT_COUNTERS is not set
# CONFIG_PERCPU_STATS is not set
# CONFIG_GUP_TEST is not set
CONFIG_ARCH_HAS_PTE_SPECIAL=y
CONFIG_USERFAULTFD=y

#
# Data Access Monitoring
#
# CONFIG_DAMON is not set
# end of Data Access Monitoring
# end of Memory Management options

CONFIG_NET=y
CONFIG_NET_EGRESS=y
CONFIG_SKB_EXTENSIONS=y

#
# Networking options
#
CONFIG_PACKET=y
# CONFIG_PACKET_DIAG is not set
CONFIG_UNIX=y
CONFIG_UNIX_SCM=y
CONFIG_AF_UNIX_OOB=y
CONFIG_UNIX_DIAG=y
# CONFIG_TLS is not set
CONFIG_XFRM=y
CONFIG_XFRM_OFFLOAD=y
CONFIG_XFRM_ALGO=m
CONFIG_XFRM_USER=m
CONFIG_XFRM_INTERFACE=m
CONFIG_XFRM_SUB_POLICY=y
CONFIG_XFRM_MIGRATE=y
CONFIG_XFRM_STATISTICS=y
CONFIG_XFRM_AH=m
CONFIG_XFRM_ESP=m
CONFIG_XFRM_IPCOMP=m
CONFIG_NET_KEY=m
CONFIG_NET_KEY_MIGRATE=y
CONFIG_XFRM_ESPINTCP=y
CONFIG_IUCV=y
# CONFIG_AFIUCV is not set
# CONFIG_SMC is not set
# CONFIG_XDP_SOCKETS is not set
CONFIG_INET=y
# CONFIG_IP_MULTICAST is not set
# CONFIG_IP_ADVANCED_ROUTER is not set
# CONFIG_IP_PNP is not set
# CONFIG_NET_IPIP is not set
CONFIG_NET_IPGRE_DEMUX=y
CONFIG_NET_IP_TUNNEL=m
# CONFIG_NET_IPGRE is not set
CONFIG_IP_MROUTE_COMMON=y
CONFIG_SYN_COOKIES=y
CONFIG_NET_IPVTI=m
CONFIG_NET_UDP_TUNNEL=m
CONFIG_NET_FOU=m
CONFIG_NET_FOU_IP_TUNNELS=y
# CONFIG_INET_AH is not set
CONFIG_INET_ESP=m
CONFIG_INET_ESP_OFFLOAD=m
# CONFIG_INET_ESPINTCP is not set
# CONFIG_INET_IPCOMP is not set
CONFIG_INET_TUNNEL=m
CONFIG_INET_DIAG=y
CONFIG_INET_TCP_DIAG=y
CONFIG_INET_UDP_DIAG=m
# CONFIG_INET_RAW_DIAG is not set
CONFIG_INET_DIAG_DESTROY=y
CONFIG_TCP_CONG_ADVANCED=y
CONFIG_TCP_CONG_BIC=m
# CONFIG_TCP_CONG_CUBIC is not set
CONFIG_TCP_CONG_WESTWOOD=m
CONFIG_TCP_CONG_HTCP=m
CONFIG_TCP_CONG_HSTCP=y
# CONFIG_TCP_CONG_HYBLA is not set
CONFIG_TCP_CONG_VEGAS=m
CONFIG_TCP_CONG_NV=m
CONFIG_TCP_CONG_SCALABLE=m
# CONFIG_TCP_CONG_LP is not set
CONFIG_TCP_CONG_VENO=m
CONFIG_TCP_CONG_YEAH=m
CONFIG_TCP_CONG_ILLINOIS=m
CONFIG_TCP_CONG_DCTCP=y
CONFIG_TCP_CONG_CDG=m
CONFIG_TCP_CONG_BBR=y
CONFIG_DEFAULT_DCTCP=y
# CONFIG_DEFAULT_BBR is not set
# CONFIG_DEFAULT_RENO is not set
CONFIG_DEFAULT_TCP_CONG="dctcp"
# CONFIG_TCP_MD5SIG is not set
CONFIG_IPV6=m
# CONFIG_IPV6_ROUTER_PREF is not set
# CONFIG_IPV6_OPTIMISTIC_DAD is not set
CONFIG_INET6_AH=m
CONFIG_INET6_ESP=m
CONFIG_INET6_ESP_OFFLOAD=m
CONFIG_INET6_ESPINTCP=y
CONFIG_INET6_IPCOMP=m
CONFIG_IPV6_MIP6=m
# CONFIG_IPV6_ILA is not set
CONFIG_INET6_XFRM_TUNNEL=m
CONFIG_INET6_TUNNEL=m
CONFIG_IPV6_VTI=m
CONFIG_IPV6_SIT=m
# CONFIG_IPV6_SIT_6RD is not set
CONFIG_IPV6_NDISC_NODETYPE=y
CONFIG_IPV6_TUNNEL=m
CONFIG_IPV6_GRE=m
CONFIG_IPV6_FOU=m
CONFIG_IPV6_FOU_TUNNEL=m
CONFIG_IPV6_MULTIPLE_TABLES=y
# CONFIG_IPV6_SUBTREES is not set
CONFIG_IPV6_MROUTE=y
# CONFIG_IPV6_MROUTE_MULTIPLE_TABLES is not set
# CONFIG_IPV6_PIMSM_V2 is not set
CONFIG_IPV6_SEG6_LWTUNNEL=y
# CONFIG_IPV6_SEG6_HMAC is not set
# CONFIG_IPV6_RPL_LWTUNNEL is not set
CONFIG_IPV6_IOAM6_LWTUNNEL=y
# CONFIG_MPTCP is not set
CONFIG_NETWORK_SECMARK=y
CONFIG_NET_PTP_CLASSIFY=y
CONFIG_NETWORK_PHY_TIMESTAMPING=y
CONFIG_NETFILTER=y
# CONFIG_NETFILTER_ADVANCED is not set

#
# Core Netfilter Configuration
#
# CONFIG_NETFILTER_INGRESS is not set
CONFIG_NETFILTER_EGRESS=y
CONFIG_NETFILTER_NETLINK=y
CONFIG_NETFILTER_NETLINK_LOG=y
CONFIG_NF_CONNTRACK=m
CONFIG_NF_LOG_SYSLOG=y
# CONFIG_NF_CONNTRACK_SECMARK is not set
# CONFIG_NF_CONNTRACK_PROCFS is not set
# CONFIG_NF_CONNTRACK_LABELS is not set
CONFIG_NF_CONNTRACK_FTP=m
CONFIG_NF_CONNTRACK_IRC=m
# CONFIG_NF_CONNTRACK_NETBIOS_NS is not set
# CONFIG_NF_CONNTRACK_SIP is not set
CONFIG_NF_CT_NETLINK=m
# CONFIG_NETFILTER_NETLINK_GLUE_CT is not set
CONFIG_NF_NAT=m
CONFIG_NF_NAT_FTP=m
CONFIG_NF_NAT_IRC=m
CONFIG_NF_NAT_MASQUERADE=y
# CONFIG_NF_TABLES is not set
CONFIG_NETFILTER_XTABLES=y

#
# Xtables combined modules
#
CONFIG_NETFILTER_XT_MARK=m

#
# Xtables targets
#
CONFIG_NETFILTER_XT_TARGET_LOG=y
CONFIG_NETFILTER_XT_NAT=m
# CONFIG_NETFILTER_XT_TARGET_NETMAP is not set
CONFIG_NETFILTER_XT_TARGET_NFLOG=y
# CONFIG_NETFILTER_XT_TARGET_REDIRECT is not set
CONFIG_NETFILTER_XT_TARGET_MASQUERADE=m
CONFIG_NETFILTER_XT_TARGET_SECMARK=m
# CONFIG_NETFILTER_XT_TARGET_TCPMSS is not set

#
# Xtables matches
#
CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=m
# CONFIG_NETFILTER_XT_MATCH_CONNTRACK is not set
CONFIG_NETFILTER_XT_MATCH_POLICY=m
CONFIG_NETFILTER_XT_MATCH_STATE=m
# end of Core Netfilter Configuration

# CONFIG_IP_SET is not set
CONFIG_IP_VS=m
CONFIG_IP_VS_IPV6=y
# CONFIG_IP_VS_DEBUG is not set
CONFIG_IP_VS_TAB_BITS=12

#
# IPVS transport protocol load balancing support
#
CONFIG_IP_VS_PROTO_TCP=y
CONFIG_IP_VS_PROTO_UDP=y
# CONFIG_IP_VS_PROTO_ESP is not set
# CONFIG_IP_VS_PROTO_AH is not set
CONFIG_IP_VS_PROTO_SCTP=y

#
# IPVS scheduler
#
# CONFIG_IP_VS_RR is not set
CONFIG_IP_VS_WRR=m
# CONFIG_IP_VS_LC is not set
CONFIG_IP_VS_WLC=m
CONFIG_IP_VS_FO=m
# CONFIG_IP_VS_OVF is not set
CONFIG_IP_VS_LBLC=m
CONFIG_IP_VS_LBLCR=m
CONFIG_IP_VS_DH=m
CONFIG_IP_VS_SH=m
CONFIG_IP_VS_MH=m
# CONFIG_IP_VS_SED is not set
CONFIG_IP_VS_NQ=m
CONFIG_IP_VS_TWOS=m

#
# IPVS SH scheduler
#
CONFIG_IP_VS_SH_TAB_BITS=8

#
# IPVS MH scheduler
#
CONFIG_IP_VS_MH_TAB_INDEX=12

#
# IPVS application helper
#
CONFIG_IP_VS_FTP=m
CONFIG_IP_VS_NFCT=y

#
# IP: Netfilter Configuration
#
CONFIG_NF_DEFRAG_IPV4=m
CONFIG_NF_SOCKET_IPV4=y
# CONFIG_NF_TPROXY_IPV4 is not set
CONFIG_NF_DUP_IPV4=m
CONFIG_NF_LOG_ARP=m
# CONFIG_NF_LOG_IPV4 is not set
CONFIG_NF_REJECT_IPV4=y
CONFIG_IP_NF_IPTABLES=m
CONFIG_IP_NF_FILTER=m
# CONFIG_IP_NF_TARGET_REJECT is not set
CONFIG_IP_NF_NAT=m
# CONFIG_IP_NF_TARGET_MASQUERADE is not set
# CONFIG_IP_NF_MANGLE is not set
# CONFIG_IP_NF_RAW is not set
# end of IP: Netfilter Configuration

#
# IPv6: Netfilter Configuration
#
CONFIG_NF_SOCKET_IPV6=m
CONFIG_NF_TPROXY_IPV6=m
CONFIG_NF_DUP_IPV6=m
CONFIG_NF_REJECT_IPV6=m
CONFIG_NF_LOG_IPV6=m
CONFIG_IP6_NF_IPTABLES=m
CONFIG_IP6_NF_MATCH_IPV6HEADER=m
CONFIG_IP6_NF_FILTER=m
CONFIG_IP6_NF_TARGET_REJECT=m
CONFIG_IP6_NF_MANGLE=m
# CONFIG_IP6_NF_RAW is not set
# end of IPv6: Netfilter Configuration

CONFIG_NF_DEFRAG_IPV6=m
CONFIG_NF_CONNTRACK_BRIDGE=m
CONFIG_BPFILTER=y
CONFIG_IP_DCCP=y
CONFIG_INET_DCCP_DIAG=y

#
# DCCP CCIDs Configuration
#
CONFIG_IP_DCCP_CCID2_DEBUG=y
# CONFIG_IP_DCCP_CCID3 is not set
# end of DCCP CCIDs Configuration

#
# DCCP Kernel Hacking
#
CONFIG_IP_DCCP_DEBUG=y
# end of DCCP Kernel Hacking

CONFIG_IP_SCTP=m
# CONFIG_SCTP_DBG_OBJCNT is not set
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_MD5 is not set
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_SHA1 is not set
CONFIG_SCTP_DEFAULT_COOKIE_HMAC_NONE=y
# CONFIG_SCTP_COOKIE_HMAC_MD5 is not set
CONFIG_SCTP_COOKIE_HMAC_SHA1=y
CONFIG_INET_SCTP_DIAG=m
CONFIG_RDS=y
# CONFIG_RDS_TCP is not set
# CONFIG_RDS_DEBUG is not set
CONFIG_TIPC=m
# CONFIG_TIPC_MEDIA_IB is not set
# CONFIG_TIPC_MEDIA_UDP is not set
CONFIG_TIPC_CRYPTO=y
CONFIG_TIPC_DIAG=m
# CONFIG_ATM is not set
CONFIG_L2TP=m
CONFIG_L2TP_DEBUGFS=m
# CONFIG_L2TP_V3 is not set
# CONFIG_BRIDGE is not set
CONFIG_NET_DSA=m
# CONFIG_NET_DSA_TAG_AR9331 is not set
CONFIG_NET_DSA_TAG_BRCM_COMMON=m
CONFIG_NET_DSA_TAG_BRCM=m
CONFIG_NET_DSA_TAG_BRCM_LEGACY=m
CONFIG_NET_DSA_TAG_BRCM_PREPEND=m
CONFIG_NET_DSA_TAG_HELLCREEK=m
CONFIG_NET_DSA_TAG_GSWIP=m
CONFIG_NET_DSA_TAG_DSA_COMMON=m
CONFIG_NET_DSA_TAG_DSA=m
CONFIG_NET_DSA_TAG_EDSA=m
CONFIG_NET_DSA_TAG_MTK=m
# CONFIG_NET_DSA_TAG_KSZ is not set
CONFIG_NET_DSA_TAG_OCELOT=m
CONFIG_NET_DSA_TAG_OCELOT_8021Q=m
CONFIG_NET_DSA_TAG_QCA=m
CONFIG_NET_DSA_TAG_RTL4_A=m
CONFIG_NET_DSA_TAG_RTL8_4=m
CONFIG_NET_DSA_TAG_RZN1_A5PSW=m
CONFIG_NET_DSA_TAG_LAN9303=m
CONFIG_NET_DSA_TAG_SJA1105=m
CONFIG_NET_DSA_TAG_TRAILER=m
CONFIG_NET_DSA_TAG_XRS700X=m
# CONFIG_VLAN_8021Q is not set
CONFIG_DECNET=y
# CONFIG_DECNET_ROUTER is not set
# CONFIG_LLC2 is not set
# CONFIG_ATALK is not set
CONFIG_X25=y
# CONFIG_LAPB is not set
CONFIG_PHONET=m
CONFIG_6LOWPAN=m
# CONFIG_6LOWPAN_DEBUGFS is not set
CONFIG_6LOWPAN_NHC=m
# CONFIG_6LOWPAN_NHC_DEST is not set
# CONFIG_6LOWPAN_NHC_FRAGMENT is not set
CONFIG_6LOWPAN_NHC_HOP=m
# CONFIG_6LOWPAN_NHC_IPV6 is not set
CONFIG_6LOWPAN_NHC_MOBILITY=m
CONFIG_6LOWPAN_NHC_ROUTING=m
# CONFIG_6LOWPAN_NHC_UDP is not set
# CONFIG_6LOWPAN_GHC_EXT_HDR_HOP is not set
# CONFIG_6LOWPAN_GHC_UDP is not set
# CONFIG_6LOWPAN_GHC_ICMPV6 is not set
# CONFIG_6LOWPAN_GHC_EXT_HDR_DEST is not set
CONFIG_6LOWPAN_GHC_EXT_HDR_FRAG=m
# CONFIG_6LOWPAN_GHC_EXT_HDR_ROUTE is not set
# CONFIG_IEEE802154 is not set
# CONFIG_NET_SCHED is not set
# CONFIG_DCB is not set
# CONFIG_DNS_RESOLVER is not set
CONFIG_BATMAN_ADV=y
CONFIG_BATMAN_ADV_BATMAN_V=y
CONFIG_BATMAN_ADV_BLA=y
CONFIG_BATMAN_ADV_DAT=y
# CONFIG_BATMAN_ADV_NC is not set
# CONFIG_BATMAN_ADV_MCAST is not set
# CONFIG_BATMAN_ADV_DEBUG is not set
CONFIG_BATMAN_ADV_TRACING=y
# CONFIG_OPENVSWITCH is not set
# CONFIG_VSOCKETS is not set
# CONFIG_NETLINK_DIAG is not set
CONFIG_MPLS=y
CONFIG_NET_MPLS_GSO=m
CONFIG_MPLS_ROUTING=m
CONFIG_MPLS_IPTUNNEL=m
CONFIG_NET_NSH=m
CONFIG_HSR=m
CONFIG_NET_SWITCHDEV=y
CONFIG_NET_L3_MASTER_DEV=y
CONFIG_QRTR=m
CONFIG_QRTR_SMD=m
# CONFIG_QRTR_TUN is not set
CONFIG_NET_NCSI=y
CONFIG_NCSI_OEM_CMD_GET_MAC=y
CONFIG_NCSI_OEM_CMD_KEEP_PHY=y
CONFIG_PCPU_DEV_REFCNT=y
CONFIG_RPS=y
CONFIG_RFS_ACCEL=y
CONFIG_SOCK_RX_QUEUE_MAPPING=y
CONFIG_XPS=y
CONFIG_NET_RX_BUSY_POLL=y
CONFIG_BQL=y
CONFIG_NET_FLOW_LIMIT=y

#
# Network testing
#
# CONFIG_NET_PKTGEN is not set
CONFIG_NET_DROP_MONITOR=m
# end of Network testing
# end of Networking options

CONFIG_CAN=m
CONFIG_CAN_RAW=m
# CONFIG_CAN_BCM is not set
# CONFIG_CAN_GW is not set
CONFIG_CAN_J1939=m
CONFIG_CAN_ISOTP=m
CONFIG_AF_RXRPC=m
# CONFIG_AF_RXRPC_IPV6 is not set
# CONFIG_AF_RXRPC_INJECT_LOSS is not set
CONFIG_AF_RXRPC_DEBUG=y
# CONFIG_RXKAD is not set
# CONFIG_AF_KCM is not set
CONFIG_STREAM_PARSER=y
# CONFIG_MCTP is not set
CONFIG_FIB_RULES=y
CONFIG_RFKILL=m
CONFIG_RFKILL_LEDS=y
# CONFIG_RFKILL_INPUT is not set
CONFIG_RFKILL_GPIO=m
# CONFIG_NET_9P is not set
CONFIG_CAIF=m
CONFIG_CAIF_DEBUG=y
# CONFIG_CAIF_NETDEV is not set
# CONFIG_CAIF_USB is not set
CONFIG_CEPH_LIB=m
CONFIG_CEPH_LIB_PRETTYDEBUG=y
# CONFIG_CEPH_LIB_USE_DNS_RESOLVER is not set
# CONFIG_NFC is not set
CONFIG_PSAMPLE=m
CONFIG_NET_IFE=y
CONFIG_LWTUNNEL=y
CONFIG_LWTUNNEL_BPF=y
CONFIG_DST_CACHE=y
CONFIG_GRO_CELLS=y
CONFIG_NET_SELFTESTS=y
CONFIG_NET_SOCK_MSG=y
CONFIG_NET_DEVLINK=y
CONFIG_PAGE_POOL=y
CONFIG_PAGE_POOL_STATS=y
CONFIG_FAILOVER=y
CONFIG_ETHTOOL_NETLINK=y

#
# Device Drivers
#
CONFIG_HAVE_PCI=y
CONFIG_PCI=y
CONFIG_PCI_DOMAINS=y
CONFIG_PCIEPORTBUS=y
# CONFIG_PCIEAER is not set
# CONFIG_PCIEASPM is not set
# CONFIG_PCIE_PTM is not set
CONFIG_PCI_MSI=y
CONFIG_PCI_MSI_IRQ_DOMAIN=y
CONFIG_PCI_MSI_ARCH_FALLBACKS=y
CONFIG_PCI_DEBUG=y
CONFIG_PCI_REALLOC_ENABLE_AUTO=y
CONFIG_PCI_STUB=m
CONFIG_PCI_PF_STUB=y
CONFIG_PCI_ATS=y
CONFIG_PCI_ECAM=y
CONFIG_PCI_IOV=y
CONFIG_PCI_PRI=y
# CONFIG_PCI_PASID is not set
# CONFIG_PCIE_BUS_TUNE_OFF is not set
# CONFIG_PCIE_BUS_DEFAULT is not set
CONFIG_PCIE_BUS_SAFE=y
# CONFIG_PCIE_BUS_PERFORMANCE is not set
# CONFIG_PCIE_BUS_PEER2PEER is not set
# CONFIG_HOTPLUG_PCI is not set

#
# PCI controller drivers
#
# CONFIG_PCIE_XILINX_NWL is not set
CONFIG_PCI_TEGRA=y
CONFIG_PCIE_RCAR_HOST=y
# CONFIG_PCIE_RCAR_EP is not set
CONFIG_PCI_HOST_COMMON=y
# CONFIG_PCIE_XILINX is not set
CONFIG_PCIE_XILINX_CPM=y
# CONFIG_PCI_VERSATILE is not set
CONFIG_PCIE_ALTERA=m
CONFIG_PCIE_ALTERA_MSI=m
CONFIG_PCIE_MEDIATEK_GEN3=m
CONFIG_PCIE_MT7621=m

#
# DesignWare PCI Core Support
#
CONFIG_PCIE_DW=y
CONFIG_PCIE_DW_HOST=y
CONFIG_PCIE_DW_EP=y
# CONFIG_PCIE_DW_PLAT_HOST is not set
# CONFIG_PCIE_DW_PLAT_EP is not set
CONFIG_PCI_EXYNOS=m
CONFIG_PCI_IMX6=y
CONFIG_PCIE_SPEAR13XX=y
CONFIG_PCI_KEYSTONE=y
# CONFIG_PCI_KEYSTONE_HOST is not set
CONFIG_PCI_KEYSTONE_EP=y
CONFIG_PCIE_ARMADA_8K=y
CONFIG_PCIE_ARTPEC6=y
# CONFIG_PCIE_ARTPEC6_HOST is not set
CONFIG_PCIE_ARTPEC6_EP=y
CONFIG_PCIE_KEEMBAY=y
CONFIG_PCIE_KEEMBAY_HOST=y
# CONFIG_PCIE_KEEMBAY_EP is not set
CONFIG_PCIE_HISI_STB=y
CONFIG_PCI_MESON=y
CONFIG_PCIE_TEGRA194=y
CONFIG_PCIE_TEGRA194_HOST=y
# CONFIG_PCIE_TEGRA194_EP is not set
CONFIG_PCIE_VISCONTI_HOST=y
# CONFIG_PCIE_FU740 is not set
# end of DesignWare PCI Core Support

#
# Mobiveil PCIe Core Support
#
# CONFIG_PCIE_LAYERSCAPE_GEN4 is not set
# end of Mobiveil PCIe Core Support

#
# Cadence PCIe controllers support
#
# end of Cadence PCIe controllers support
# end of PCI controller drivers

#
# PCI Endpoint
#
CONFIG_PCI_ENDPOINT=y
CONFIG_PCI_ENDPOINT_CONFIGFS=y
# CONFIG_PCI_EPF_TEST is not set
CONFIG_PCI_EPF_NTB=m
# CONFIG_PCI_EPF_VNTB is not set
# end of PCI Endpoint

#
# PCI switch controller drivers
#
CONFIG_PCI_SW_SWITCHTEC=m
# end of PCI switch controller drivers

# CONFIG_CXL_BUS is not set
CONFIG_PCCARD=y
CONFIG_PCMCIA=m
CONFIG_PCMCIA_LOAD_CIS=y
# CONFIG_CARDBUS is not set

#
# PC-card bridges
#
CONFIG_YENTA=m
# CONFIG_YENTA_O2 is not set
CONFIG_YENTA_RICOH=y
# CONFIG_YENTA_TI is not set
# CONFIG_YENTA_TOSHIBA is not set
CONFIG_PD6729=m
CONFIG_I82092=m
CONFIG_PCCARD_NONSTATIC=y
CONFIG_RAPIDIO=m
CONFIG_RAPIDIO_TSI721=m
CONFIG_RAPIDIO_DISC_TIMEOUT=30
CONFIG_RAPIDIO_ENABLE_RX_TX_PORTS=y
CONFIG_RAPIDIO_DEBUG=y
CONFIG_RAPIDIO_ENUM_BASIC=m
CONFIG_RAPIDIO_CHMAN=m
CONFIG_RAPIDIO_MPORT_CDEV=m

#
# RapidIO Switch drivers
#
CONFIG_RAPIDIO_CPS_XX=m
CONFIG_RAPIDIO_CPS_GEN2=m
CONFIG_RAPIDIO_RXS_GEN3=m
# end of RapidIO Switch drivers

#
# Generic Driver Options
#
CONFIG_AUXILIARY_BUS=y
CONFIG_UEVENT_HELPER=y
CONFIG_UEVENT_HELPER_PATH=""
CONFIG_DEVTMPFS=y
CONFIG_DEVTMPFS_MOUNT=y
CONFIG_DEVTMPFS_SAFE=y
CONFIG_STANDALONE=y
# CONFIG_PREVENT_FIRMWARE_BUILD is not set

#
# Firmware loader
#
CONFIG_FW_LOADER=y
CONFIG_FW_LOADER_PAGED_BUF=y
CONFIG_FW_LOADER_SYSFS=y
CONFIG_EXTRA_FIRMWARE=""
# CONFIG_FW_LOADER_USER_HELPER is not set
# CONFIG_FW_LOADER_COMPRESS is not set
CONFIG_FW_UPLOAD=y
# end of Firmware loader

CONFIG_WANT_DEV_COREDUMP=y
CONFIG_ALLOW_DEV_COREDUMP=y
CONFIG_DEV_COREDUMP=y
# CONFIG_DEBUG_DRIVER is not set
# CONFIG_DEBUG_DEVRES is not set
CONFIG_DEBUG_TEST_DRIVER_REMOVE=y
CONFIG_TEST_ASYNC_DRIVER_PROBE=m
CONFIG_SYS_HYPERVISOR=y
CONFIG_GENERIC_CPU_AUTOPROBE=y
CONFIG_GENERIC_CPU_VULNERABILITIES=y
CONFIG_SOC_BUS=y
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=y
CONFIG_REGMAP_SLIMBUS=y
CONFIG_REGMAP_SPI=y
CONFIG_REGMAP_SPMI=m
CONFIG_REGMAP_MMIO=y
CONFIG_REGMAP_IRQ=y
CONFIG_DMA_SHARED_BUFFER=y
CONFIG_DMA_FENCE_TRACE=y
# end of Generic Driver Options

#
# Bus devices
#
# CONFIG_ARM_INTEGRATOR_LM is not set
# CONFIG_BT1_APB is not set
# CONFIG_BT1_AXI is not set
CONFIG_HISILICON_LPC=y
CONFIG_INTEL_IXP4XX_EB=y
CONFIG_QCOM_EBI2=y
# CONFIG_MHI_BUS is not set
# CONFIG_MHI_BUS_EP is not set
# end of Bus devices

CONFIG_CONNECTOR=m

#
# Firmware Drivers
#

#
# ARM System Control and Management Interface Protocol
#
# CONFIG_ARM_SCMI_PROTOCOL is not set
# end of ARM System Control and Management Interface Protocol

CONFIG_ARM_SCPI_PROTOCOL=m
CONFIG_ARM_SCPI_POWER_DOMAIN=m
# CONFIG_FIRMWARE_MEMMAP is not set
CONFIG_MTK_ADSP_IPC=m
CONFIG_QCOM_SCM=y
CONFIG_QCOM_SCM_DOWNLOAD_MODE_DEFAULT=y
CONFIG_BCM47XX_NVRAM=y
CONFIG_BCM47XX_SPROM=y
CONFIG_TEE_BNXT_FW=y
# CONFIG_GOOGLE_FIRMWARE is not set
CONFIG_IMX_DSP=m
CONFIG_IMX_SCU=y
CONFIG_IMX_SCU_PD=y

#
# Tegra firmware driver
#
# end of Tegra firmware driver
# end of Firmware Drivers

CONFIG_GNSS=m
# CONFIG_GNSS_MTK_SERIAL is not set
# CONFIG_GNSS_SIRF_SERIAL is not set
# CONFIG_GNSS_UBX_SERIAL is not set
CONFIG_MTD=m
CONFIG_MTD_TESTS=m

#
# Partition parsers
#
# CONFIG_MTD_AR7_PARTS is not set
CONFIG_MTD_BCM63XX_PARTS=y
CONFIG_MTD_CMDLINE_PARTS=m
CONFIG_MTD_PARSER_IMAGETAG=m
CONFIG_MTD_PARSER_TRX=m
CONFIG_MTD_SHARPSL_PARTS=m
CONFIG_MTD_REDBOOT_PARTS=m
CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=-1
# CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED is not set
# CONFIG_MTD_REDBOOT_PARTS_READONLY is not set
# end of Partition parsers

#
# User Modules And Translation Layers
#
CONFIG_MTD_BLKDEVS=m
CONFIG_MTD_BLOCK=m
CONFIG_MTD_BLOCK_RO=m

#
# Note that in some cases UBI block is preferred. See MTD_UBI_BLOCK.
#
CONFIG_FTL=m
CONFIG_NFTL=m
# CONFIG_NFTL_RW is not set
CONFIG_INFTL=m
# CONFIG_RFD_FTL is not set
CONFIG_SSFDC=m
CONFIG_SM_FTL=m
CONFIG_MTD_OOPS=m
CONFIG_MTD_SWAP=m
CONFIG_MTD_PARTITIONED_MASTER=y

#
# RAM/ROM/Flash chip drivers
#
CONFIG_MTD_CFI=m
CONFIG_MTD_JEDECPROBE=m
CONFIG_MTD_GEN_PROBE=m
CONFIG_MTD_CFI_ADV_OPTIONS=y
# CONFIG_MTD_CFI_NOSWAP is not set
# CONFIG_MTD_CFI_BE_BYTE_SWAP is not set
CONFIG_MTD_CFI_LE_BYTE_SWAP=y
# CONFIG_MTD_CFI_GEOMETRY is not set
CONFIG_MTD_MAP_BANK_WIDTH_1=y
CONFIG_MTD_MAP_BANK_WIDTH_2=y
CONFIG_MTD_MAP_BANK_WIDTH_4=y
CONFIG_MTD_CFI_I1=y
CONFIG_MTD_CFI_I2=y
# CONFIG_MTD_OTP is not set
CONFIG_MTD_CFI_INTELEXT=m
CONFIG_MTD_CFI_AMDSTD=m
CONFIG_MTD_CFI_STAA=m
CONFIG_MTD_CFI_UTIL=m
CONFIG_MTD_RAM=m
# CONFIG_MTD_ROM is not set
CONFIG_MTD_ABSENT=m
# end of RAM/ROM/Flash chip drivers

#
# Mapping drivers for chip access
#
# CONFIG_MTD_COMPLEX_MAPPINGS is not set
CONFIG_MTD_PHYSMAP=m
CONFIG_MTD_PHYSMAP_COMPAT=y
CONFIG_MTD_PHYSMAP_START=0x8000000
CONFIG_MTD_PHYSMAP_LEN=0
CONFIG_MTD_PHYSMAP_BANKWIDTH=2
CONFIG_MTD_SC520CDP=m
CONFIG_MTD_NETSC520=m
CONFIG_MTD_TS5500=m
CONFIG_MTD_INTEL_VR_NOR=m
CONFIG_MTD_PLATRAM=m
# end of Mapping drivers for chip access

#
# Self-contained MTD device drivers
#
CONFIG_MTD_PMC551=m
# CONFIG_MTD_PMC551_BUGFIX is not set
# CONFIG_MTD_PMC551_DEBUG is not set
CONFIG_MTD_DATAFLASH=m
# CONFIG_MTD_DATAFLASH_WRITE_VERIFY is not set
CONFIG_MTD_DATAFLASH_OTP=y
CONFIG_MTD_MCHP23K256=m
CONFIG_MTD_MCHP48L640=m
# CONFIG_MTD_SPEAR_SMI is not set
CONFIG_MTD_SST25L=m
CONFIG_MTD_SLRAM=m
CONFIG_MTD_PHRAM=m
CONFIG_MTD_MTDRAM=m
CONFIG_MTDRAM_TOTAL_SIZE=4096
CONFIG_MTDRAM_ERASE_SIZE=128
# CONFIG_MTD_BLOCK2MTD is not set

#
# Disk-On-Chip Device Drivers
#
CONFIG_MTD_DOCG3=m
CONFIG_BCH_CONST_M=14
CONFIG_BCH_CONST_T=4
# end of Self-contained MTD device drivers

#
# NAND
#
CONFIG_MTD_NAND_CORE=m
# CONFIG_MTD_ONENAND is not set
CONFIG_MTD_RAW_NAND=m

#
# Raw/parallel NAND flash controllers
#
CONFIG_MTD_NAND_DENALI=m
CONFIG_MTD_NAND_DENALI_PCI=m
CONFIG_MTD_NAND_AMS_DELTA=m
# CONFIG_MTD_NAND_SHARPSL is not set
CONFIG_MTD_NAND_CAFE=m
CONFIG_MTD_NAND_ATMEL=m
CONFIG_MTD_NAND_MARVELL=m
# CONFIG_MTD_NAND_SLC_LPC32XX is not set
# CONFIG_MTD_NAND_MLC_LPC32XX is not set
CONFIG_MTD_NAND_BRCMNAND=m
# CONFIG_MTD_NAND_OXNAS is not set
# CONFIG_MTD_NAND_FSL_IFC is not set
CONFIG_MTD_NAND_VF610_NFC=m
CONFIG_MTD_NAND_SH_FLCTL=m
CONFIG_MTD_NAND_DAVINCI=m
CONFIG_MTD_NAND_TXX9NDFMC=m
# CONFIG_MTD_NAND_SUNXI is not set
# CONFIG_MTD_NAND_HISI504 is not set
CONFIG_MTD_NAND_QCOM=m
# CONFIG_MTD_NAND_MTK is not set
CONFIG_MTD_NAND_MXIC=m
CONFIG_MTD_NAND_TEGRA=m
CONFIG_MTD_NAND_STM32_FMC2=m
CONFIG_MTD_NAND_MESON=m
CONFIG_MTD_NAND_GPIO=m
# CONFIG_MTD_NAND_PLATFORM is not set
# CONFIG_MTD_NAND_CADENCE is not set
# CONFIG_MTD_NAND_ARASAN is not set
# CONFIG_MTD_NAND_INTEL_LGM is not set
# CONFIG_MTD_NAND_RENESAS is not set

#
# Misc
#
CONFIG_MTD_NAND_NANDSIM=m
# CONFIG_MTD_NAND_RICOH is not set
CONFIG_MTD_NAND_DISKONCHIP=m
CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADVANCED=y
CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADDRESS=0
CONFIG_MTD_NAND_DISKONCHIP_PROBE_HIGH=y
CONFIG_MTD_NAND_DISKONCHIP_BBTWRITE=y
CONFIG_MTD_SPI_NAND=m

#
# ECC engine support
#
CONFIG_MTD_NAND_ECC=y
CONFIG_MTD_NAND_ECC_SW_HAMMING=y
# CONFIG_MTD_NAND_ECC_SW_HAMMING_SMC is not set
CONFIG_MTD_NAND_ECC_SW_BCH=y
CONFIG_MTD_NAND_ECC_MXIC=y
CONFIG_MTD_NAND_ECC_MEDIATEK=m
# end of ECC engine support
# end of NAND

#
# LPDDR & LPDDR2 PCM memory drivers
#
CONFIG_MTD_LPDDR=m
CONFIG_MTD_QINFO_PROBE=m
# end of LPDDR & LPDDR2 PCM memory drivers

CONFIG_MTD_SPI_NOR=m
# CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is not set
# CONFIG_MTD_SPI_NOR_SWP_DISABLE is not set
CONFIG_MTD_SPI_NOR_SWP_DISABLE_ON_VOLATILE=y
# CONFIG_MTD_SPI_NOR_SWP_KEEP is not set
# CONFIG_SPI_HISI_SFC is not set
# CONFIG_MTD_UBI is not set
# CONFIG_MTD_HYPERBUS is not set
# CONFIG_OF is not set
CONFIG_PARPORT=y
CONFIG_PARPORT_AX88796=m
CONFIG_PARPORT_1284=y
CONFIG_PARPORT_NOT_PC=y
CONFIG_BLK_DEV=y
CONFIG_BLK_DEV_NULL_BLK=m
CONFIG_CDROM=m
# CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
# CONFIG_ZRAM is not set
CONFIG_BLK_DEV_LOOP=m
CONFIG_BLK_DEV_LOOP_MIN_COUNT=8
CONFIG_BLK_DEV_DRBD=m
CONFIG_DRBD_FAULT_INJECTION=y
CONFIG_BLK_DEV_NBD=y
CONFIG_BLK_DEV_RAM=y
CONFIG_BLK_DEV_RAM_COUNT=16
CONFIG_BLK_DEV_RAM_SIZE=4096
# CONFIG_CDROM_PKTCDVD is not set
# CONFIG_ATA_OVER_ETH is not set

#
# S/390 block device drivers
#
# CONFIG_DCSSBLK is not set
CONFIG_DASD=y
# CONFIG_DASD_PROFILE is not set
CONFIG_DASD_ECKD=y
CONFIG_DASD_FBA=m
# CONFIG_DASD_DIAG is not set
# CONFIG_DASD_EER is not set
CONFIG_VIRTIO_BLK=y
# CONFIG_BLK_DEV_RBD is not set
CONFIG_BLK_DEV_UBLK=y

#
# NVME Support
#
CONFIG_NVME_CORE=m
# CONFIG_BLK_DEV_NVME is not set
CONFIG_NVME_MULTIPATH=y
CONFIG_NVME_VERBOSE_ERRORS=y
CONFIG_NVME_HWMON=y
CONFIG_NVME_FABRICS=m
# CONFIG_NVME_FC is not set
CONFIG_NVME_TCP=m
# CONFIG_NVME_AUTH is not set
# CONFIG_NVME_TARGET is not set
# end of NVME Support

#
# Misc devices
#
CONFIG_SENSORS_LIS3LV02D=m
CONFIG_AD525X_DPOT=y
CONFIG_AD525X_DPOT_I2C=y
CONFIG_AD525X_DPOT_SPI=m
CONFIG_DUMMY_IRQ=m
CONFIG_PHANTOM=y
CONFIG_TIFM_CORE=m
CONFIG_TIFM_7XX1=m
# CONFIG_ICS932S401 is not set
CONFIG_ATMEL_SSC=y
# CONFIG_ENCLOSURE_SERVICES is not set
CONFIG_GEHC_ACHC=m
CONFIG_HP_ILO=m
# CONFIG_QCOM_COINCELL is not set
# CONFIG_QCOM_FASTRPC is not set
CONFIG_APDS9802ALS=y
CONFIG_ISL29003=y
CONFIG_ISL29020=m
# CONFIG_SENSORS_TSL2550 is not set
# CONFIG_SENSORS_BH1770 is not set
CONFIG_SENSORS_APDS990X=y
# CONFIG_HMC6352 is not set
# CONFIG_DS1682 is not set
CONFIG_PCH_PHUB=m
CONFIG_LATTICE_ECP3_CONFIG=y
CONFIG_SRAM=y
# CONFIG_DW_XDATA_PCIE is not set
# CONFIG_PCI_ENDPOINT_TEST is not set
# CONFIG_XILINX_SDFEC is not set
# CONFIG_C2PORT is not set

#
# EEPROM support
#
# CONFIG_EEPROM_AT24 is not set
CONFIG_EEPROM_AT25=m
CONFIG_EEPROM_LEGACY=m
CONFIG_EEPROM_MAX6875=m
CONFIG_EEPROM_93CX6=m
CONFIG_EEPROM_93XX46=m
CONFIG_EEPROM_IDT_89HPESX=y
CONFIG_EEPROM_EE1004=y
# end of EEPROM support

CONFIG_CB710_CORE=y
CONFIG_CB710_DEBUG=y
CONFIG_CB710_DEBUG_ASSUMPTIONS=y

#
# Texas Instruments shared transport line discipline
#
CONFIG_TI_ST=y
# end of Texas Instruments shared transport line discipline

CONFIG_SENSORS_LIS3_SPI=m
CONFIG_SENSORS_LIS3_I2C=m
CONFIG_ALTERA_STAPL=m
CONFIG_GENWQE=y
CONFIG_GENWQE_PLATFORM_ERROR_RECOVERY=0
# CONFIG_ECHO is not set
# CONFIG_BCM_VK is not set
# CONFIG_MISC_ALCOR_PCI is not set
# CONFIG_MISC_RTSX_PCI is not set
CONFIG_HABANA_AI=m
CONFIG_UACCE=m
CONFIG_PVPANIC=y
CONFIG_PVPANIC_PCI=m
# end of Misc devices

#
# SCSI device support
#
CONFIG_SCSI_MOD=y
CONFIG_RAID_ATTRS=y
CONFIG_SCSI_COMMON=y
CONFIG_SCSI=y
CONFIG_SCSI_DMA=y
CONFIG_SCSI_NETLINK=y
CONFIG_SCSI_PROC_FS=y

#
# SCSI support type (disk, tape, CD-ROM)
#
CONFIG_BLK_DEV_SD=y
# CONFIG_CHR_DEV_ST is not set
CONFIG_BLK_DEV_SR=m
CONFIG_CHR_DEV_SG=m
# CONFIG_BLK_DEV_BSG is not set
# CONFIG_CHR_DEV_SCH is not set
CONFIG_SCSI_CONSTANTS=y
# CONFIG_SCSI_LOGGING is not set
# CONFIG_SCSI_SCAN_ASYNC is not set

#
# SCSI Transports
#
CONFIG_SCSI_SPI_ATTRS=m
CONFIG_SCSI_FC_ATTRS=m
CONFIG_SCSI_ISCSI_ATTRS=m
CONFIG_SCSI_SAS_ATTRS=y
CONFIG_SCSI_SAS_LIBSAS=y
CONFIG_SCSI_SAS_HOST_SMP=y
CONFIG_SCSI_SRP_ATTRS=m
# end of SCSI Transports

CONFIG_SCSI_LOWLEVEL=y
CONFIG_ISCSI_TCP=m
# CONFIG_ISCSI_BOOT_SYSFS is not set
CONFIG_SCSI_CXGB3_ISCSI=m
CONFIG_SCSI_CXGB4_ISCSI=m
CONFIG_SCSI_BNX2_ISCSI=m
# CONFIG_BE2ISCSI is not set
# CONFIG_BLK_DEV_3W_XXXX_RAID is not set
CONFIG_SCSI_HPSA=m
# CONFIG_SCSI_3W_9XXX is not set
# CONFIG_SCSI_3W_SAS is not set
CONFIG_SCSI_ACARD=y
CONFIG_SCSI_AACRAID=y
CONFIG_SCSI_AIC7XXX=m
CONFIG_AIC7XXX_CMDS_PER_DEVICE=32
CONFIG_AIC7XXX_RESET_DELAY_MS=5000
# CONFIG_AIC7XXX_BUILD_FIRMWARE is not set
# CONFIG_AIC7XXX_DEBUG_ENABLE is not set
CONFIG_AIC7XXX_DEBUG_MASK=0
CONFIG_AIC7XXX_REG_PRETTY_PRINT=y
# CONFIG_SCSI_AIC79XX is not set
CONFIG_SCSI_AIC94XX=y
CONFIG_AIC94XX_DEBUG=y
# CONFIG_SCSI_HISI_SAS is not set
CONFIG_SCSI_MVSAS=m
CONFIG_SCSI_MVSAS_DEBUG=y
# CONFIG_SCSI_MVSAS_TASKLET is not set
CONFIG_SCSI_MVUMI=y
# CONFIG_SCSI_ADVANSYS is not set
CONFIG_SCSI_ARCMSR=m
# CONFIG_SCSI_ESAS2R is not set
CONFIG_MEGARAID_NEWGEN=y
CONFIG_MEGARAID_MM=y
CONFIG_MEGARAID_MAILBOX=y
CONFIG_MEGARAID_LEGACY=m
CONFIG_MEGARAID_SAS=m
CONFIG_SCSI_MPT3SAS=m
CONFIG_SCSI_MPT2SAS_MAX_SGE=128
CONFIG_SCSI_MPT3SAS_MAX_SGE=128
CONFIG_SCSI_MPT2SAS=m
CONFIG_SCSI_MPI3MR=y
# CONFIG_SCSI_HPTIOP is not set
# CONFIG_SCSI_BUSLOGIC is not set
CONFIG_SCSI_MYRB=y
# CONFIG_SCSI_MYRS is not set
# CONFIG_LIBFC is not set
# CONFIG_SCSI_SNIC is not set
CONFIG_SCSI_DMX3191D=m
# CONFIG_SCSI_FDOMAIN_PCI is not set
CONFIG_SCSI_IPS=y
# CONFIG_SCSI_INITIO is not set
# CONFIG_SCSI_INIA100 is not set
# CONFIG_SCSI_STEX is not set
CONFIG_SCSI_SYM53C8XX_2=m
CONFIG_SCSI_SYM53C8XX_DMA_ADDRESSING_MODE=1
CONFIG_SCSI_SYM53C8XX_DEFAULT_TAGS=16
CONFIG_SCSI_SYM53C8XX_MAX_TAGS=64
# CONFIG_SCSI_SYM53C8XX_MMIO is not set
# CONFIG_SCSI_IPR is not set
CONFIG_SCSI_QLOGIC_1280=m
# CONFIG_SCSI_QLA_FC is not set
# CONFIG_SCSI_QLA_ISCSI is not set
CONFIG_SCSI_EFCT=m
CONFIG_SCSI_DC395x=m
CONFIG_SCSI_AM53C974=m
CONFIG_SCSI_WD719X=m
CONFIG_SCSI_DEBUG=m
CONFIG_ZFCP=m
# CONFIG_SCSI_PMCRAID is not set
CONFIG_SCSI_PM8001=y
CONFIG_SCSI_BFA_FC=m
# CONFIG_SCSI_VIRTIO is not set
CONFIG_SCSI_CHELSIO_FCOE=m
# CONFIG_SCSI_LOWLEVEL_PCMCIA is not set
# CONFIG_SCSI_DH is not set
# end of SCSI device support

CONFIG_ATA=m
CONFIG_SATA_HOST=y
# CONFIG_ATA_VERBOSE_ERROR is not set
CONFIG_ATA_FORCE=y
CONFIG_SATA_PMP=y

#
# Controllers with non-SFF native interface
#
CONFIG_SATA_AHCI=m
CONFIG_SATA_MOBILE_LPM_POLICY=0
CONFIG_SATA_AHCI_PLATFORM=m
CONFIG_AHCI_BRCM=m
# CONFIG_AHCI_DA850 is not set
# CONFIG_AHCI_DM816 is not set
CONFIG_AHCI_IMX=m
CONFIG_AHCI_MTK=m
CONFIG_AHCI_MVEBU=m
CONFIG_AHCI_SUNXI=m
CONFIG_AHCI_TEGRA=m
CONFIG_AHCI_XGENE=m
CONFIG_SATA_FSL=m
CONFIG_SATA_AHCI_SEATTLE=m
# CONFIG_SATA_INIC162X is not set
CONFIG_SATA_ACARD_AHCI=m
# CONFIG_SATA_SIL24 is not set
# CONFIG_ATA_SFF is not set
CONFIG_MD=y
CONFIG_BLK_DEV_MD=y
# CONFIG_MD_AUTODETECT is not set
CONFIG_MD_LINEAR=y
CONFIG_MD_RAID0=y
CONFIG_MD_RAID1=y
CONFIG_MD_RAID10=m
CONFIG_MD_RAID456=y
# CONFIG_MD_MULTIPATH is not set
CONFIG_MD_FAULTY=m
CONFIG_MD_CLUSTER=m
CONFIG_BCACHE=y
# CONFIG_BCACHE_DEBUG is not set
CONFIG_BCACHE_CLOSURES_DEBUG=y
CONFIG_BCACHE_ASYNC_REGISTRATION=y
CONFIG_BLK_DEV_DM_BUILTIN=y
CONFIG_BLK_DEV_DM=m
CONFIG_DM_DEBUG=y
CONFIG_DM_BUFIO=m
CONFIG_DM_DEBUG_BLOCK_MANAGER_LOCKING=y
CONFIG_DM_DEBUG_BLOCK_STACK_TRACING=y
CONFIG_DM_BIO_PRISON=m
CONFIG_DM_PERSISTENT_DATA=m
CONFIG_DM_UNSTRIPED=m
CONFIG_DM_CRYPT=m
# CONFIG_DM_SNAPSHOT is not set
CONFIG_DM_THIN_PROVISIONING=m
CONFIG_DM_CACHE=m
# CONFIG_DM_CACHE_SMQ is not set
CONFIG_DM_WRITECACHE=m
CONFIG_DM_EBS=m
# CONFIG_DM_ERA is not set
# CONFIG_DM_CLONE is not set
CONFIG_DM_MIRROR=m
# CONFIG_DM_LOG_USERSPACE is not set
CONFIG_DM_RAID=m
CONFIG_DM_ZERO=m
CONFIG_DM_MULTIPATH=m
CONFIG_DM_MULTIPATH_QL=m
# CONFIG_DM_MULTIPATH_ST is not set
CONFIG_DM_MULTIPATH_HST=m
CONFIG_DM_MULTIPATH_IOA=m
CONFIG_DM_DELAY=m
CONFIG_DM_DUST=m
CONFIG_DM_UEVENT=y
# CONFIG_DM_FLAKEY is not set
# CONFIG_DM_VERITY is not set
CONFIG_DM_SWITCH=m
CONFIG_DM_LOG_WRITES=m
# CONFIG_DM_INTEGRITY is not set
CONFIG_DM_AUDIT=y
CONFIG_TARGET_CORE=m
CONFIG_TCM_IBLOCK=m
CONFIG_TCM_FILEIO=m
CONFIG_TCM_PSCSI=m
CONFIG_TCM_USER2=m
CONFIG_LOOPBACK_TARGET=m
CONFIG_ISCSI_TARGET=m
CONFIG_ISCSI_TARGET_CXGB4=m
# CONFIG_SBP_TARGET is not set
# CONFIG_FUSION is not set

#
# IEEE 1394 (FireWire) support
#
CONFIG_FIREWIRE=m
CONFIG_FIREWIRE_OHCI=m
CONFIG_FIREWIRE_SBP2=m
CONFIG_FIREWIRE_NET=m
CONFIG_FIREWIRE_NOSY=m
# end of IEEE 1394 (FireWire) support

CONFIG_NETDEVICES=y
CONFIG_MII=y
# CONFIG_NET_CORE is not set
# CONFIG_ARCNET is not set
# CONFIG_CAIF_DRIVERS is not set

#
# Distributed Switch Architecture drivers
#
CONFIG_B53=m
CONFIG_B53_SPI_DRIVER=m
# CONFIG_B53_MDIO_DRIVER is not set
CONFIG_B53_MMAP_DRIVER=m
CONFIG_B53_SRAB_DRIVER=m
CONFIG_B53_SERDES=m
CONFIG_NET_DSA_BCM_SF2=m
CONFIG_NET_DSA_LOOP=m
CONFIG_NET_DSA_LANTIQ_GSWIP=m
CONFIG_NET_DSA_MT7530=m
CONFIG_NET_DSA_MV88E6060=m
# CONFIG_NET_DSA_MICROCHIP_KSZ_COMMON is not set
CONFIG_NET_DSA_MV88E6XXX=m
# CONFIG_NET_DSA_MSCC_SEVILLE is not set
# CONFIG_NET_DSA_AR9331 is not set
CONFIG_NET_DSA_QCA8K=m
CONFIG_NET_DSA_SJA1105=m
CONFIG_NET_DSA_XRS700X=m
CONFIG_NET_DSA_XRS700X_I2C=m
# CONFIG_NET_DSA_XRS700X_MDIO is not set
CONFIG_NET_DSA_REALTEK=m
# CONFIG_NET_DSA_REALTEK_MDIO is not set
# CONFIG_NET_DSA_REALTEK_SMI is not set
# CONFIG_NET_DSA_REALTEK_RTL8365MB is not set
CONFIG_NET_DSA_REALTEK_RTL8366RB=m
CONFIG_NET_DSA_SMSC_LAN9303=m
# CONFIG_NET_DSA_SMSC_LAN9303_I2C is not set
CONFIG_NET_DSA_SMSC_LAN9303_MDIO=m
CONFIG_NET_DSA_VITESSE_VSC73XX=m
CONFIG_NET_DSA_VITESSE_VSC73XX_SPI=m
# CONFIG_NET_DSA_VITESSE_VSC73XX_PLATFORM is not set
# end of Distributed Switch Architecture drivers

CONFIG_ETHERNET=y
CONFIG_MDIO=y
CONFIG_NET_VENDOR_3COM=y
CONFIG_PCMCIA_3C574=m
# CONFIG_PCMCIA_3C589 is not set
CONFIG_TYPHOON=m
# CONFIG_NET_VENDOR_ACTIONS is not set
CONFIG_NET_VENDOR_ADAPTEC=y
CONFIG_ADAPTEC_STARFIRE=m
# CONFIG_NET_VENDOR_AGERE is not set
# CONFIG_NET_VENDOR_ALACRITECH is not set
# CONFIG_NET_VENDOR_ALTEON is not set
# CONFIG_ALTERA_TSE is not set
# CONFIG_NET_VENDOR_AMAZON is not set
# CONFIG_NET_VENDOR_AMD is not set
CONFIG_NET_XGENE=y
# CONFIG_NET_XGENE_V2 is not set
# CONFIG_NET_VENDOR_AQUANTIA is not set
CONFIG_NET_VENDOR_ARC=y
CONFIG_NET_VENDOR_ASIX=y
CONFIG_SPI_AX88796C=m
CONFIG_SPI_AX88796C_COMPRESSION=y
# CONFIG_NET_VENDOR_ATHEROS is not set
# CONFIG_CX_ECAT is not set
CONFIG_NET_VENDOR_BROADCOM=y
# CONFIG_B44 is not set
# CONFIG_BCM4908_ENET is not set
CONFIG_BCMGENET=y
CONFIG_BNX2=y
CONFIG_CNIC=m
CONFIG_TIGON3=y
CONFIG_BNX2X=y
CONFIG_BNX2X_SRIOV=y
CONFIG_BGMAC=y
CONFIG_BGMAC_PLATFORM=y
CONFIG_SYSTEMPORT=m
# CONFIG_BNXT is not set
CONFIG_NET_VENDOR_CADENCE=y
CONFIG_MACB=y
CONFIG_MACB_PCI=y
# CONFIG_NET_CALXEDA_XGMAC is not set
CONFIG_NET_VENDOR_CAVIUM=y
CONFIG_THUNDER_NIC_PF=m
CONFIG_THUNDER_NIC_VF=y
CONFIG_THUNDER_NIC_BGX=m
CONFIG_THUNDER_NIC_RGX=m
# CONFIG_CAVIUM_PTP is not set
CONFIG_LIQUIDIO=y
CONFIG_LIQUIDIO_VF=m
CONFIG_NET_VENDOR_CHELSIO=y
# CONFIG_CHELSIO_T1 is not set
CONFIG_CHELSIO_T3=y
CONFIG_CHELSIO_T4=m
CONFIG_CHELSIO_T4VF=m
CONFIG_CHELSIO_LIB=m
CONFIG_CHELSIO_INLINE_CRYPTO=y
# CONFIG_CHELSIO_IPSEC_INLINE is not set
CONFIG_NET_VENDOR_CIRRUS=y
CONFIG_CS89x0=m
CONFIG_CS89x0_PLATFORM=m
CONFIG_EP93XX_ETH=m
CONFIG_NET_VENDOR_CISCO=y
CONFIG_ENIC=y
# CONFIG_NET_VENDOR_CORTINA is not set
CONFIG_NET_VENDOR_DAVICOM=y
CONFIG_DM9000=y
CONFIG_DM9000_FORCE_SIMPLE_PHY_POLL=y
CONFIG_DM9051=m
CONFIG_DNET=y
CONFIG_NET_VENDOR_DEC=y
CONFIG_NET_TULIP=y
# CONFIG_DE2104X is not set
# CONFIG_TULIP is not set
CONFIG_WINBOND_840=m
CONFIG_DM9102=y
CONFIG_ULI526X=y
CONFIG_NET_VENDOR_DLINK=y
CONFIG_DL2K=y
CONFIG_SUNDANCE=m
CONFIG_SUNDANCE_MMIO=y
CONFIG_NET_VENDOR_EMULEX=y
CONFIG_BE2NET=m
# CONFIG_BE2NET_HWMON is not set
CONFIG_BE2NET_BE2=y
# CONFIG_BE2NET_BE3 is not set
CONFIG_BE2NET_LANCER=y
CONFIG_BE2NET_SKYHAWK=y
CONFIG_NET_VENDOR_ENGLEDER=y
CONFIG_TSNEP=y
CONFIG_TSNEP_SELFTESTS=y
CONFIG_NET_VENDOR_EZCHIP=y
# CONFIG_NET_VENDOR_FARADAY is not set
# CONFIG_NET_VENDOR_FREESCALE is not set
CONFIG_NET_VENDOR_FUJITSU=y
CONFIG_PCMCIA_FMVJ18X=m
# CONFIG_NET_VENDOR_FUNGIBLE is not set
CONFIG_NET_VENDOR_GOOGLE=y
# CONFIG_NET_VENDOR_HUAWEI is not set
CONFIG_NET_VENDOR_I825XX=y
CONFIG_NET_VENDOR_INTEL=y
# CONFIG_E100 is not set
CONFIG_E1000=y
CONFIG_E1000E=m
# CONFIG_IGB is not set
# CONFIG_IGBVF is not set
CONFIG_IXGB=m
CONFIG_IXGBE=m
CONFIG_IXGBE_HWMON=y
# CONFIG_IXGBE_IPSEC is not set
CONFIG_IXGBEVF=m
# CONFIG_IXGBEVF_IPSEC is not set
# CONFIG_I40E is not set
# CONFIG_I40EVF is not set
CONFIG_ICE=y
# CONFIG_ICE_SWITCHDEV is not set
# CONFIG_FM10K is not set
CONFIG_IGC=m
CONFIG_NET_VENDOR_WANGXUN=y
CONFIG_TXGBE=m
# CONFIG_JME is not set
# CONFIG_KORINA is not set
CONFIG_NET_VENDOR_LITEX=y
# CONFIG_NET_VENDOR_MARVELL is not set
# CONFIG_NET_VENDOR_MEDIATEK is not set
CONFIG_NET_VENDOR_MELLANOX=y
CONFIG_MLX4_EN=y
CONFIG_MLX4_CORE=y
# CONFIG_MLX4_DEBUG is not set
# CONFIG_MLX4_CORE_GEN2 is not set
CONFIG_MLX5_CORE=m
CONFIG_MLX5_FPGA=y
CONFIG_MLX5_CORE_EN=y
CONFIG_MLX5_EN_ARFS=y
# CONFIG_MLX5_EN_RXNFC is not set
CONFIG_MLX5_MPFS=y
# CONFIG_MLX5_ESWITCH is not set
# CONFIG_MLX5_CORE_IPOIB is not set
CONFIG_MLX5_EN_IPSEC=y
# CONFIG_MLX5_SF is not set
CONFIG_MLXSW_CORE=y
# CONFIG_MLXSW_PCI is not set
CONFIG_MLXSW_I2C=m
CONFIG_MLXSW_MINIMAL=m
CONFIG_MLXFW=y
# CONFIG_MLXBF_GIGE is not set
CONFIG_NET_VENDOR_MICREL=y
CONFIG_KS8851=m
CONFIG_KS8851_MLL=m
# CONFIG_KSZ884X_PCI is not set
CONFIG_NET_VENDOR_MICROCHIP=y
# CONFIG_ENC28J60 is not set
# CONFIG_ENCX24J600 is not set
# CONFIG_LAN743X is not set
CONFIG_NET_VENDOR_MICROSEMI=y
# CONFIG_NET_VENDOR_MICROSOFT is not set
CONFIG_NET_VENDOR_MYRI=y
CONFIG_MYRI10GE=m
CONFIG_FEALNX=m
CONFIG_NET_VENDOR_NI=y
CONFIG_NI_XGE_MANAGEMENT_ENET=m
# CONFIG_NET_VENDOR_NATSEMI is not set
CONFIG_NET_VENDOR_NETERION=y
# CONFIG_S2IO is not set
# CONFIG_NET_VENDOR_NETRONOME is not set
CONFIG_NET_VENDOR_NVIDIA=y
CONFIG_FORCEDETH=y
# CONFIG_LPC_ENET is not set
# CONFIG_NET_VENDOR_OKI is not set
CONFIG_ETHOC=m
# CONFIG_NET_VENDOR_PACKET_ENGINES is not set
# CONFIG_NET_VENDOR_PENSANDO is not set
CONFIG_NET_VENDOR_QLOGIC=y
# CONFIG_QLA3XXX is not set
CONFIG_QLCNIC=m
# CONFIG_QLCNIC_SRIOV is not set
# CONFIG_QLCNIC_HWMON is not set
CONFIG_NETXEN_NIC=y
# CONFIG_QED is not set
# CONFIG_NET_VENDOR_BROCADE is not set
# CONFIG_NET_VENDOR_QUALCOMM is not set
CONFIG_NET_VENDOR_RDC=y
# CONFIG_R6040 is not set
# CONFIG_NET_VENDOR_REALTEK is not set
# CONFIG_NET_VENDOR_RENESAS is not set
# CONFIG_NET_VENDOR_ROCKER is not set
# CONFIG_NET_VENDOR_SAMSUNG is not set
# CONFIG_NET_VENDOR_SEEQ is not set
CONFIG_NET_VENDOR_SILAN=y
CONFIG_SC92031=m
# CONFIG_NET_VENDOR_SIS is not set
# CONFIG_NET_VENDOR_SOLARFLARE is not set
CONFIG_NET_VENDOR_SMSC=y
CONFIG_SMC91X=y
# CONFIG_PCMCIA_SMC91C92 is not set
CONFIG_EPIC100=y
CONFIG_SMC911X=m
CONFIG_SMSC911X=m
# CONFIG_SMSC9420 is not set
CONFIG_NET_VENDOR_SOCIONEXT=y
CONFIG_NET_VENDOR_STMICRO=y
CONFIG_STMMAC_ETH=m
# CONFIG_STMMAC_SELFTESTS is not set
CONFIG_STMMAC_PLATFORM=m
CONFIG_DWMAC_GENERIC=m
CONFIG_DWMAC_LOONGSON=m
# CONFIG_STMMAC_PCI is not set
# CONFIG_NET_VENDOR_SUN is not set
CONFIG_NET_VENDOR_SUNPLUS=y
CONFIG_SP7021_EMAC=m
CONFIG_NET_VENDOR_SYNOPSYS=y
CONFIG_DWC_XLGMAC=y
# CONFIG_DWC_XLGMAC_PCI is not set
# CONFIG_NET_VENDOR_TEHUTI is not set
# CONFIG_NET_VENDOR_TI is not set
CONFIG_NET_VENDOR_VERTEXCOM=y
CONFIG_MSE102X=m
CONFIG_NET_VENDOR_VIA=y
CONFIG_VIA_RHINE=y
CONFIG_VIA_RHINE_MMIO=y
CONFIG_VIA_VELOCITY=y
CONFIG_NET_VENDOR_WIZNET=y
# CONFIG_WIZNET_W5100 is not set
# CONFIG_WIZNET_W5300 is not set
# CONFIG_NET_VENDOR_XILINX is not set
CONFIG_NET_VENDOR_XIRCOM=y
CONFIG_PCMCIA_XIRC2PS=m
# CONFIG_FDDI is not set
CONFIG_HIPPI=y
CONFIG_ROADRUNNER=y
CONFIG_ROADRUNNER_LARGE_RINGS=y
CONFIG_PHYLINK=y
CONFIG_PHYLIB=y
CONFIG_SWPHY=y
CONFIG_LED_TRIGGER_PHY=y
CONFIG_FIXED_PHY=y
CONFIG_SFP=m

#
# MII PHY device drivers
#
CONFIG_AMD_PHY=m
# CONFIG_MESON_GXL_PHY is not set
CONFIG_ADIN_PHY=y
CONFIG_ADIN1100_PHY=y
CONFIG_AQUANTIA_PHY=m
CONFIG_AX88796B_PHY=m
# CONFIG_BROADCOM_PHY is not set
CONFIG_BCM54140_PHY=m
CONFIG_BCM63XX_PHY=m
CONFIG_BCM7XXX_PHY=y
# CONFIG_BCM84881_PHY is not set
CONFIG_BCM87XX_PHY=m
CONFIG_BCM_NET_PHYLIB=y
CONFIG_CICADA_PHY=y
CONFIG_CORTINA_PHY=m
CONFIG_DAVICOM_PHY=m
CONFIG_ICPLUS_PHY=y
CONFIG_LXT_PHY=m
CONFIG_INTEL_XWAY_PHY=y
CONFIG_LSI_ET1011C_PHY=y
# CONFIG_MARVELL_PHY is not set
CONFIG_MARVELL_10G_PHY=m
# CONFIG_MARVELL_88X2222_PHY is not set
CONFIG_MAXLINEAR_GPHY=m
CONFIG_MEDIATEK_GE_PHY=m
CONFIG_MICREL_PHY=y
CONFIG_MICROCHIP_PHY=m
CONFIG_MICROCHIP_T1_PHY=m
# CONFIG_MICROSEMI_PHY is not set
# CONFIG_MOTORCOMM_PHY is not set
CONFIG_NATIONAL_PHY=m
CONFIG_NXP_C45_TJA11XX_PHY=m
CONFIG_NXP_TJA11XX_PHY=m
CONFIG_AT803X_PHY=y
CONFIG_QSEMI_PHY=m
CONFIG_REALTEK_PHY=m
CONFIG_RENESAS_PHY=m
CONFIG_ROCKCHIP_PHY=m
CONFIG_SMSC_PHY=y
CONFIG_STE10XP=y
CONFIG_TERANETICS_PHY=y
# CONFIG_DP83822_PHY is not set
CONFIG_DP83TC811_PHY=m
# CONFIG_DP83848_PHY is not set
CONFIG_DP83867_PHY=y
# CONFIG_DP83869_PHY is not set
CONFIG_DP83TD510_PHY=m
CONFIG_VITESSE_PHY=m
# CONFIG_XILINX_GMII2RGMII is not set
CONFIG_MICREL_KS8995MA=m
# CONFIG_CAN_DEV is not set
CONFIG_MDIO_DEVICE=y
CONFIG_MDIO_BUS=y
CONFIG_FWNODE_MDIO=y
CONFIG_MDIO_DEVRES=y
CONFIG_MDIO_SUN4I=m
CONFIG_MDIO_XGENE=y
CONFIG_MDIO_BITBANG=m
CONFIG_MDIO_BCM_UNIMAC=y
CONFIG_MDIO_CAVIUM=m
# CONFIG_MDIO_GPIO is not set
CONFIG_MDIO_I2C=m
# CONFIG_MDIO_MSCC_MIIM is not set
CONFIG_MDIO_MOXART=y
# CONFIG_MDIO_OCTEON is not set
CONFIG_MDIO_THUNDER=m

#
# MDIO Multiplexers
#

#
# PCS device drivers
#
CONFIG_PCS_XPCS=m
# end of PCS device drivers

CONFIG_PLIP=m
# CONFIG_PPP is not set
# CONFIG_SLIP is not set

#
# S/390 network device drivers
#
# CONFIG_LCS is not set
CONFIG_CTCM=y
CONFIG_NETIUCV=m
CONFIG_SMSGIUCV=y
# CONFIG_SMSGIUCV_EVENT is not set
CONFIG_CCWGROUP=y
# end of S/390 network device drivers

#
# Host-side USB support is needed for USB Network Adapter support
#
CONFIG_WAN=y
# CONFIG_HDLC is not set
CONFIG_SLIC_DS26522=m

#
# Wireless WAN
#
CONFIG_WWAN=y
# CONFIG_WWAN_DEBUGFS is not set
# CONFIG_WWAN_HWSIM is not set
CONFIG_QCOM_BAM_DMUX=y
CONFIG_RPMSG_WWAN_CTRL=y
CONFIG_MTK_T7XX=m
# end of Wireless WAN

# CONFIG_VMXNET3 is not set
CONFIG_USB4_NET=y
CONFIG_NETDEVSIM=m
CONFIG_NET_FAILOVER=y

#
# Input device support
#
CONFIG_INPUT=m
# CONFIG_INPUT_LEDS is not set
CONFIG_INPUT_FF_MEMLESS=m
CONFIG_INPUT_SPARSEKMAP=m
CONFIG_INPUT_MATRIXKMAP=m
CONFIG_INPUT_VIVALDIFMAP=m

#
# Userland interfaces
#
CONFIG_INPUT_MOUSEDEV=m
CONFIG_INPUT_MOUSEDEV_PSAUX=y
CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
CONFIG_INPUT_JOYDEV=m
CONFIG_INPUT_EVDEV=m
# CONFIG_INPUT_EVBUG is not set

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=y
# CONFIG_KEYBOARD_ADC is not set
# CONFIG_KEYBOARD_ADP5520 is not set
CONFIG_KEYBOARD_ADP5588=m
# CONFIG_KEYBOARD_ADP5589 is not set
CONFIG_KEYBOARD_ATKBD=m
# CONFIG_KEYBOARD_QT1050 is not set
CONFIG_KEYBOARD_QT1070=m
CONFIG_KEYBOARD_QT2160=m
CONFIG_KEYBOARD_DLINK_DIR685=m
CONFIG_KEYBOARD_LKKBD=m
# CONFIG_KEYBOARD_EP93XX is not set
# CONFIG_KEYBOARD_GPIO is not set
# CONFIG_KEYBOARD_GPIO_POLLED is not set
CONFIG_KEYBOARD_TCA6416=m
# CONFIG_KEYBOARD_TCA8418 is not set
CONFIG_KEYBOARD_MATRIX=m
CONFIG_KEYBOARD_LM8323=m
CONFIG_KEYBOARD_LM8333=m
# CONFIG_KEYBOARD_MAX7359 is not set
# CONFIG_KEYBOARD_MCS is not set
CONFIG_KEYBOARD_MPR121=m
CONFIG_KEYBOARD_IMX=m
CONFIG_KEYBOARD_IMX_SC_KEY=m
CONFIG_KEYBOARD_NEWTON=m
CONFIG_KEYBOARD_OPENCORES=m
# CONFIG_KEYBOARD_PMIC8XXX is not set
CONFIG_KEYBOARD_SAMSUNG=m
CONFIG_KEYBOARD_GOLDFISH_EVENTS=m
# CONFIG_KEYBOARD_STOWAWAY is not set
# CONFIG_KEYBOARD_ST_KEYSCAN is not set
CONFIG_KEYBOARD_SUNKBD=m
CONFIG_KEYBOARD_SH_KEYSC=m
CONFIG_KEYBOARD_IQS62X=m
# CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
CONFIG_KEYBOARD_TWL4030=m
# CONFIG_KEYBOARD_XTKBD is not set
CONFIG_KEYBOARD_MT6779=m
# CONFIG_KEYBOARD_MTK_PMIC is not set
# CONFIG_KEYBOARD_CYPRESS_SF is not set
CONFIG_INPUT_MOUSE=y
# CONFIG_MOUSE_PS2 is not set
CONFIG_MOUSE_SERIAL=m
CONFIG_MOUSE_CYAPA=m
CONFIG_MOUSE_ELAN_I2C=m
CONFIG_MOUSE_ELAN_I2C_I2C=y
# CONFIG_MOUSE_ELAN_I2C_SMBUS is not set
CONFIG_MOUSE_VSXXXAA=m
CONFIG_MOUSE_GPIO=m
# CONFIG_MOUSE_SYNAPTICS_I2C is not set
# CONFIG_INPUT_JOYSTICK is not set
# CONFIG_INPUT_TABLET is not set
CONFIG_INPUT_TOUCHSCREEN=y
# CONFIG_TOUCHSCREEN_ADS7846 is not set
# CONFIG_TOUCHSCREEN_AD7877 is not set
CONFIG_TOUCHSCREEN_AD7879=m
CONFIG_TOUCHSCREEN_AD7879_I2C=m
# CONFIG_TOUCHSCREEN_AD7879_SPI is not set
CONFIG_TOUCHSCREEN_ADC=m
CONFIG_TOUCHSCREEN_ATMEL_MXT=m
# CONFIG_TOUCHSCREEN_AUO_PIXCIR is not set
CONFIG_TOUCHSCREEN_BU21013=m
# CONFIG_TOUCHSCREEN_BU21029 is not set
# CONFIG_TOUCHSCREEN_CY8CTMA140 is not set
# CONFIG_TOUCHSCREEN_CY8CTMG110 is not set
CONFIG_TOUCHSCREEN_CYTTSP_CORE=m
# CONFIG_TOUCHSCREEN_CYTTSP_I2C is not set
CONFIG_TOUCHSCREEN_CYTTSP_SPI=m
CONFIG_TOUCHSCREEN_CYTTSP4_CORE=m
CONFIG_TOUCHSCREEN_CYTTSP4_I2C=m
CONFIG_TOUCHSCREEN_CYTTSP4_SPI=m
CONFIG_TOUCHSCREEN_DA9052=m
# CONFIG_TOUCHSCREEN_DYNAPRO is not set
CONFIG_TOUCHSCREEN_HAMPSHIRE=m
# CONFIG_TOUCHSCREEN_EETI is not set
# CONFIG_TOUCHSCREEN_EGALAX_SERIAL is not set
# CONFIG_TOUCHSCREEN_EXC3000 is not set
CONFIG_TOUCHSCREEN_FUJITSU=m
# CONFIG_TOUCHSCREEN_GOODIX is not set
CONFIG_TOUCHSCREEN_HIDEEP=m
CONFIG_TOUCHSCREEN_HYCON_HY46XX=m
CONFIG_TOUCHSCREEN_ILI210X=m
CONFIG_TOUCHSCREEN_ILITEK=m
CONFIG_TOUCHSCREEN_IPROC=m
CONFIG_TOUCHSCREEN_S6SY761=m
CONFIG_TOUCHSCREEN_GUNZE=m
CONFIG_TOUCHSCREEN_EKTF2127=m
CONFIG_TOUCHSCREEN_ELAN=m
CONFIG_TOUCHSCREEN_ELO=m
# CONFIG_TOUCHSCREEN_WACOM_W8001 is not set
CONFIG_TOUCHSCREEN_WACOM_I2C=m
CONFIG_TOUCHSCREEN_MAX11801=m
CONFIG_TOUCHSCREEN_MCS5000=m
CONFIG_TOUCHSCREEN_MMS114=m
# CONFIG_TOUCHSCREEN_MELFAS_MIP4 is not set
CONFIG_TOUCHSCREEN_MSG2638=m
# CONFIG_TOUCHSCREEN_MTOUCH is not set
CONFIG_TOUCHSCREEN_IMAGIS=m
CONFIG_TOUCHSCREEN_IMX6UL_TSC=m
CONFIG_TOUCHSCREEN_INEXIO=m
CONFIG_TOUCHSCREEN_MK712=m
# CONFIG_TOUCHSCREEN_PENMOUNT is not set
CONFIG_TOUCHSCREEN_EDT_FT5X06=m
CONFIG_TOUCHSCREEN_RASPBERRYPI_FW=m
CONFIG_TOUCHSCREEN_MIGOR=m
# CONFIG_TOUCHSCREEN_TOUCHRIGHT is not set
# CONFIG_TOUCHSCREEN_TOUCHWIN is not set
CONFIG_TOUCHSCREEN_PIXCIR=m
# CONFIG_TOUCHSCREEN_WDT87XX_I2C is not set
CONFIG_TOUCHSCREEN_WM831X=m
CONFIG_TOUCHSCREEN_MXS_LRADC=m
# CONFIG_TOUCHSCREEN_MC13783 is not set
CONFIG_TOUCHSCREEN_TOUCHIT213=m
CONFIG_TOUCHSCREEN_TSC_SERIO=m
CONFIG_TOUCHSCREEN_TSC200X_CORE=m
# CONFIG_TOUCHSCREEN_TSC2004 is not set
CONFIG_TOUCHSCREEN_TSC2005=m
# CONFIG_TOUCHSCREEN_TSC2007 is not set
# CONFIG_TOUCHSCREEN_RM_TS is not set
# CONFIG_TOUCHSCREEN_SILEAD is not set
CONFIG_TOUCHSCREEN_SIS_I2C=m
# CONFIG_TOUCHSCREEN_ST1232 is not set
CONFIG_TOUCHSCREEN_STMFTS=m
CONFIG_TOUCHSCREEN_SUN4I=m
# CONFIG_TOUCHSCREEN_SURFACE3_SPI is not set
CONFIG_TOUCHSCREEN_SX8654=m
CONFIG_TOUCHSCREEN_TPS6507X=m
# CONFIG_TOUCHSCREEN_ZET6223 is not set
CONFIG_TOUCHSCREEN_ZFORCE=m
CONFIG_TOUCHSCREEN_COLIBRI_VF50=m
CONFIG_TOUCHSCREEN_ROHM_BU21023=m
CONFIG_TOUCHSCREEN_IQS5XX=m
CONFIG_TOUCHSCREEN_ZINITIX=m
# CONFIG_INPUT_MISC is not set
CONFIG_RMI4_CORE=m
CONFIG_RMI4_I2C=m
CONFIG_RMI4_SPI=m
CONFIG_RMI4_SMB=m
CONFIG_RMI4_F03=y
CONFIG_RMI4_F03_SERIO=m
CONFIG_RMI4_2D_SENSOR=y
CONFIG_RMI4_F11=y
CONFIG_RMI4_F12=y
CONFIG_RMI4_F30=y
CONFIG_RMI4_F34=y
CONFIG_RMI4_F3A=y
# CONFIG_RMI4_F55 is not set

#
# Hardware I/O ports
#
CONFIG_SERIO=m
CONFIG_SERIO_SERPORT=m
# CONFIG_SERIO_PARKBD is not set
CONFIG_SERIO_PCIPS2=m
CONFIG_SERIO_LIBPS2=m
CONFIG_SERIO_RAW=m
# CONFIG_SERIO_ALTERA_PS2 is not set
CONFIG_SERIO_PS2MULT=m
CONFIG_SERIO_ARC_PS2=m
CONFIG_SERIO_OLPC_APSP=m
CONFIG_SERIO_SUN4I_PS2=m
CONFIG_SERIO_GPIO_PS2=m
# CONFIG_USERIO is not set
CONFIG_GAMEPORT=y
CONFIG_GAMEPORT_NS558=y
# CONFIG_GAMEPORT_L4 is not set
CONFIG_GAMEPORT_EMU10K1=y
# CONFIG_GAMEPORT_FM801 is not set
# end of Hardware I/O ports
# end of Input device support

#
# Character devices
#
CONFIG_TTY=y
# CONFIG_VT is not set
CONFIG_UNIX98_PTYS=y
# CONFIG_LEGACY_PTYS is not set
# CONFIG_LDISC_AUTOLOAD is not set

#
# Serial drivers
#
CONFIG_SERIAL_EARLYCON=y

#
# Non-8250 serial port support
#
# CONFIG_SERIAL_AMBA_PL010 is not set
CONFIG_SERIAL_ATMEL=y
# CONFIG_SERIAL_ATMEL_CONSOLE is not set
# CONFIG_SERIAL_ATMEL_PDC is not set
# CONFIG_SERIAL_ATMEL_TTYAT is not set
# CONFIG_SERIAL_MESON is not set
CONFIG_SERIAL_CLPS711X=m
# CONFIG_SERIAL_SAMSUNG is not set
CONFIG_SERIAL_TEGRA=m
CONFIG_SERIAL_TEGRA_TCU=y
# CONFIG_SERIAL_TEGRA_TCU_CONSOLE is not set
# CONFIG_SERIAL_MAX3100 is not set
CONFIG_SERIAL_MAX310X=y
# CONFIG_SERIAL_IMX is not set
CONFIG_SERIAL_UARTLITE=m
CONFIG_SERIAL_UARTLITE_NR_UARTS=1
CONFIG_SERIAL_SH_SCI=y
CONFIG_SERIAL_SH_SCI_NR_UARTS=2
CONFIG_SERIAL_SH_SCI_CONSOLE=y
CONFIG_SERIAL_SH_SCI_EARLYCON=y
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
CONFIG_SERIAL_ICOM=m
CONFIG_SERIAL_JSM=y
CONFIG_SERIAL_MSM=y
CONFIG_SERIAL_MSM_CONSOLE=y
CONFIG_SERIAL_VT8500=y
# CONFIG_SERIAL_VT8500_CONSOLE is not set
# CONFIG_SERIAL_OMAP is not set
# CONFIG_SERIAL_LANTIQ is not set
# CONFIG_SERIAL_SCCNXP is not set
CONFIG_SERIAL_SC16IS7XX_CORE=y
CONFIG_SERIAL_SC16IS7XX=y
CONFIG_SERIAL_SC16IS7XX_I2C=y
# CONFIG_SERIAL_SC16IS7XX_SPI is not set
CONFIG_SERIAL_TIMBERDALE=m
CONFIG_SERIAL_BCM63XX=y
CONFIG_SERIAL_BCM63XX_CONSOLE=y
CONFIG_SERIAL_ALTERA_JTAGUART=y
# CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE is not set
# CONFIG_SERIAL_ALTERA_UART is not set
CONFIG_SERIAL_PCH_UART=y
CONFIG_SERIAL_PCH_UART_CONSOLE=y
# CONFIG_SERIAL_MXS_AUART is not set
# CONFIG_SERIAL_MPS2_UART is not set
# CONFIG_SERIAL_ARC is not set
# CONFIG_SERIAL_RP2 is not set
# CONFIG_SERIAL_FSL_LPUART is not set
CONFIG_SERIAL_ST_ASC=y
CONFIG_SERIAL_ST_ASC_CONSOLE=y
# CONFIG_SERIAL_SPRD is not set
# CONFIG_SERIAL_STM32 is not set
CONFIG_SERIAL_MVEBU_UART=y
CONFIG_SERIAL_MVEBU_CONSOLE=y
CONFIG_SERIAL_OWL=y
CONFIG_SERIAL_OWL_CONSOLE=y
CONFIG_SERIAL_RDA=y
# CONFIG_SERIAL_RDA_CONSOLE is not set
CONFIG_SERIAL_LITEUART=m
CONFIG_SERIAL_LITEUART_MAX_PORTS=1
CONFIG_SERIAL_SUNPLUS=y
CONFIG_SERIAL_SUNPLUS_CONSOLE=y
# end of Serial drivers

CONFIG_SERIAL_MCTRL_GPIO=y
CONFIG_SERIAL_NONSTANDARD=y
CONFIG_MOXA_INTELLIO=m
CONFIG_MOXA_SMARTIO=y
CONFIG_SYNCLINK_GT=y
CONFIG_N_HDLC=m
CONFIG_GOLDFISH_TTY=y
CONFIG_GOLDFISH_TTY_EARLY_CONSOLE=y
CONFIG_N_GSM=m
CONFIG_NOZOMI=m
CONFIG_NULL_TTY=y
CONFIG_HVC_DRIVER=y
CONFIG_HVC_IUCV=y
CONFIG_RPMSG_TTY=y
CONFIG_SERIAL_DEV_BUS=y
# CONFIG_SERIAL_DEV_CTRL_TTYPORT is not set
# CONFIG_TTY_PRINTK is not set
# CONFIG_PRINTER is not set
CONFIG_PPDEV=y
CONFIG_VIRTIO_CONSOLE=m
CONFIG_IPMI_HANDLER=m
CONFIG_IPMI_PLAT_DATA=y
CONFIG_IPMI_PANIC_EVENT=y
# CONFIG_IPMI_PANIC_STRING is not set
# CONFIG_IPMI_DEVICE_INTERFACE is not set
CONFIG_IPMI_SI=m
CONFIG_IPMI_SSIF=m
CONFIG_IPMI_IPMB=m
CONFIG_IPMI_WATCHDOG=m
# CONFIG_IPMI_POWEROFF is not set
CONFIG_IPMI_KCS_BMC=y
CONFIG_ASPEED_KCS_IPMI_BMC=y
CONFIG_NPCM7XX_KCS_IPMI_BMC=y
# CONFIG_IPMI_KCS_BMC_CDEV_IPMI is not set
CONFIG_IPMI_KCS_BMC_SERIO=m
# CONFIG_ASPEED_BT_IPMI_BMC is not set
CONFIG_IPMB_DEVICE_INTERFACE=m
CONFIG_HW_RANDOM=y
CONFIG_HW_RANDOM_TIMERIOMEM=y
CONFIG_HW_RANDOM_BA431=y
CONFIG_HW_RANDOM_BCM2835=y
# CONFIG_HW_RANDOM_IPROC_RNG200 is not set
CONFIG_HW_RANDOM_IXP4XX=m
CONFIG_HW_RANDOM_OMAP=y
# CONFIG_HW_RANDOM_OMAP3_ROM is not set
# CONFIG_HW_RANDOM_VIRTIO is not set
# CONFIG_HW_RANDOM_IMX_RNGC is not set
CONFIG_HW_RANDOM_NOMADIK=m
CONFIG_HW_RANDOM_STM32=m
CONFIG_HW_RANDOM_POLARFIRE_SOC=y
CONFIG_HW_RANDOM_MESON=m
CONFIG_HW_RANDOM_MTK=y
# CONFIG_HW_RANDOM_S390 is not set
# CONFIG_HW_RANDOM_EXYNOS is not set
# CONFIG_HW_RANDOM_NPCM is not set
CONFIG_HW_RANDOM_XIPHERA=y
CONFIG_HW_RANDOM_CN10K=m
CONFIG_APPLICOM=m

#
# PCMCIA character devices
#
CONFIG_SYNCLINK_CS=m
CONFIG_CARDMAN_4000=m
CONFIG_CARDMAN_4040=m
# CONFIG_SCR24X is not set
# CONFIG_IPWIRELESS is not set
# end of PCMCIA character devices

# CONFIG_DEVMEM is not set
# CONFIG_DEVPORT is not set
CONFIG_HANGCHECK_TIMER=y
CONFIG_TCG_TPM=y
# CONFIG_HW_RANDOM_TPM is not set
CONFIG_TCG_TIS_CORE=y
CONFIG_TCG_TIS_SPI=y
# CONFIG_TCG_TIS_SPI_CR50 is not set
CONFIG_TCG_TIS_I2C=m
CONFIG_TCG_TIS_SYNQUACER=m
CONFIG_TCG_TIS_I2C_CR50=m
CONFIG_TCG_TIS_I2C_ATMEL=y
CONFIG_TCG_TIS_I2C_INFINEON=y
CONFIG_TCG_TIS_I2C_NUVOTON=m
CONFIG_TCG_VTPM_PROXY=y
CONFIG_TCG_TIS_ST33ZP24=m
# CONFIG_TCG_TIS_ST33ZP24_I2C is not set
CONFIG_TCG_TIS_ST33ZP24_SPI=m

#
# S/390 character device drivers
#
CONFIG_TN3270=y
CONFIG_TN3270_TTY=m
# CONFIG_TN3270_FS is not set
CONFIG_TN3215=y
CONFIG_TN3215_CONSOLE=y
CONFIG_CCW_CONSOLE=y
CONFIG_SCLP_TTY=y
CONFIG_SCLP_CONSOLE=y
# CONFIG_SCLP_VT220_TTY is not set
CONFIG_HMC_DRV=m
# CONFIG_SCLP_OFB is not set
CONFIG_S390_UV_UAPI=y
CONFIG_S390_TAPE=y

#
# S/390 tape hardware support
#
CONFIG_S390_TAPE_34XX=m
CONFIG_S390_TAPE_3590=y
CONFIG_VMLOGRDR=m
# CONFIG_VMCP is not set
# CONFIG_MONREADER is not set
CONFIG_MONWRITER=y
CONFIG_S390_VMUR=m
# CONFIG_XILLYBUS is not set
# CONFIG_RANDOM_TRUST_CPU is not set
CONFIG_RANDOM_TRUST_BOOTLOADER=y
# end of Character devices

#
# I2C support
#
CONFIG_I2C=y
CONFIG_I2C_BOARDINFO=y
CONFIG_I2C_COMPAT=y
# CONFIG_I2C_CHARDEV is not set
CONFIG_I2C_MUX=y

#
# Multiplexer I2C Chip support
#
CONFIG_I2C_ARB_GPIO_CHALLENGE=m
# CONFIG_I2C_MUX_GPIO is not set
CONFIG_I2C_MUX_GPMUX=m
# CONFIG_I2C_MUX_LTC4306 is not set
CONFIG_I2C_MUX_PCA9541=y
CONFIG_I2C_MUX_PCA954x=y
CONFIG_I2C_MUX_PINCTRL=y
CONFIG_I2C_MUX_REG=m
# CONFIG_I2C_MUX_MLXCPLD is not set
# end of Multiplexer I2C Chip support

# CONFIG_I2C_HELPER_AUTO is not set
CONFIG_I2C_SMBUS=y

#
# I2C Algorithms
#
CONFIG_I2C_ALGOBIT=y
CONFIG_I2C_ALGOPCF=m
CONFIG_I2C_ALGOPCA=m
# end of I2C Algorithms

#
# I2C Hardware Bus support
#

#
# PC SMBus host controller drivers
#
CONFIG_I2C_CCGX_UCSI=y
# CONFIG_I2C_ALI1535 is not set
# CONFIG_I2C_ALI1563 is not set
CONFIG_I2C_ALI15X3=m
CONFIG_I2C_AMD756=y
CONFIG_I2C_AMD8111=m
CONFIG_I2C_HIX5HD2=y
# CONFIG_I2C_I801 is not set
# CONFIG_I2C_ISCH is not set
# CONFIG_I2C_PIIX4 is not set
# CONFIG_I2C_NFORCE2 is not set
CONFIG_I2C_NVIDIA_GPU=y
CONFIG_I2C_SIS5595=m
CONFIG_I2C_SIS630=y
CONFIG_I2C_SIS96X=y
# CONFIG_I2C_VIA is not set
# CONFIG_I2C_VIAPRO is not set

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
CONFIG_I2C_ASPEED=m
# CONFIG_I2C_AT91 is not set
# CONFIG_I2C_AXXIA is not set
CONFIG_I2C_BCM2835=y
CONFIG_I2C_BCM_IPROC=m
CONFIG_I2C_BCM_KONA=m
CONFIG_I2C_BRCMSTB=m
CONFIG_I2C_CADENCE=y
CONFIG_I2C_CBUS_GPIO=m
# CONFIG_I2C_DAVINCI is not set
CONFIG_I2C_DESIGNWARE_CORE=m
CONFIG_I2C_DESIGNWARE_SLAVE=y
CONFIG_I2C_DESIGNWARE_PLATFORM=m
# CONFIG_I2C_DESIGNWARE_PCI is not set
CONFIG_I2C_DIGICOLOR=y
CONFIG_I2C_EG20T=y
# CONFIG_I2C_EMEV2 is not set
CONFIG_I2C_GPIO=m
CONFIG_I2C_GPIO_FAULT_INJECTOR=y
# CONFIG_I2C_HIGHLANDER is not set
CONFIG_I2C_HISI=m
CONFIG_I2C_IMG=m
# CONFIG_I2C_IMX is not set
CONFIG_I2C_IMX_LPI2C=y
CONFIG_I2C_IOP3XX=y
CONFIG_I2C_JZ4780=m
CONFIG_I2C_KEMPLD=m
# CONFIG_I2C_MESON is not set
CONFIG_I2C_MT65XX=m
# CONFIG_I2C_MT7621 is not set
CONFIG_I2C_MV64XXX=y
# CONFIG_I2C_MXS is not set
# CONFIG_I2C_NPCM is not set
CONFIG_I2C_OCORES=y
CONFIG_I2C_OMAP=m
CONFIG_I2C_OWL=m
CONFIG_I2C_APPLE=y
CONFIG_I2C_PCA_PLATFORM=m
# CONFIG_I2C_PNX is not set
# CONFIG_I2C_PXA is not set
CONFIG_I2C_QCOM_CCI=m
CONFIG_I2C_QUP=m
CONFIG_I2C_RIIC=m
CONFIG_I2C_RZV2M=y
# CONFIG_I2C_S3C2410 is not set
CONFIG_I2C_SH_MOBILE=y
CONFIG_I2C_SIMTEC=y
CONFIG_I2C_SPRD=m
CONFIG_I2C_ST=m
CONFIG_I2C_STM32F4=y
# CONFIG_I2C_STM32F7 is not set
CONFIG_I2C_SUN6I_P2WI=y
CONFIG_I2C_SYNQUACER=m
CONFIG_I2C_TEGRA_BPMP=m
# CONFIG_I2C_UNIPHIER is not set
CONFIG_I2C_UNIPHIER_F=y
CONFIG_I2C_VERSATILE=m
CONFIG_I2C_WMT=y
# CONFIG_I2C_THUNDERX is not set
# CONFIG_I2C_XILINX is not set
# CONFIG_I2C_XLP9XX is not set
# CONFIG_I2C_RCAR is not set

#
# External I2C/SMBus adapter drivers
#
# CONFIG_I2C_PARPORT is not set
CONFIG_I2C_TAOS_EVM=m

#
# Other I2C/SMBus bus drivers
#
CONFIG_I2C_MLXCPLD=y
# CONFIG_I2C_VIRTIO is not set
# end of I2C Hardware Bus support

CONFIG_I2C_STUB=m
CONFIG_I2C_SLAVE=y
CONFIG_I2C_SLAVE_EEPROM=m
# CONFIG_I2C_SLAVE_TESTUNIT is not set
CONFIG_I2C_DEBUG_CORE=y
# CONFIG_I2C_DEBUG_ALGO is not set
# CONFIG_I2C_DEBUG_BUS is not set
# end of I2C support

# CONFIG_I3C is not set
CONFIG_SPI=y
# CONFIG_SPI_DEBUG is not set
CONFIG_SPI_MASTER=y
CONFIG_SPI_MEM=y

#
# SPI Master Controller Drivers
#
CONFIG_SPI_ALTERA=y
CONFIG_SPI_ALTERA_CORE=y
CONFIG_SPI_ALTERA_DFL=m
CONFIG_SPI_AR934X=m
CONFIG_SPI_ATH79=m
CONFIG_SPI_ARMADA_3700=y
# CONFIG_SPI_AT91_USART is not set
CONFIG_SPI_AXI_SPI_ENGINE=m
CONFIG_SPI_BCM2835=m
CONFIG_SPI_BCM2835AUX=y
CONFIG_SPI_BCM63XX=y
# CONFIG_SPI_BCM63XX_HSSPI is not set
# CONFIG_SPI_BCM_QSPI is not set
CONFIG_SPI_BITBANG=y
CONFIG_SPI_BUTTERFLY=m
# CONFIG_SPI_CADENCE is not set
CONFIG_SPI_CADENCE_XSPI=m
CONFIG_SPI_CLPS711X=m
CONFIG_SPI_DESIGNWARE=m
CONFIG_SPI_DW_DMA=y
CONFIG_SPI_DW_PCI=m
# CONFIG_SPI_DW_MMIO is not set
# CONFIG_SPI_DW_BT1 is not set
# CONFIG_SPI_EP93XX is not set
# CONFIG_SPI_FSL_LPSPI is not set
CONFIG_SPI_FSL_QUADSPI=y
CONFIG_SPI_GXP=y
CONFIG_SPI_HISI_KUNPENG=m
CONFIG_SPI_HISI_SFC_V3XX=m
CONFIG_SPI_NXP_FLEXSPI=m
CONFIG_SPI_GPIO=y
CONFIG_SPI_IMG_SPFI=y
# CONFIG_SPI_IMX is not set
# CONFIG_SPI_INGENIC is not set
CONFIG_SPI_INTEL=y
CONFIG_SPI_INTEL_PCI=m
CONFIG_SPI_INTEL_PLATFORM=y
CONFIG_SPI_LM70_LLP=m
CONFIG_SPI_LP8841_RTC=m
# CONFIG_SPI_FSL_DSPI is not set
CONFIG_SPI_MESON_SPICC=m
CONFIG_SPI_MESON_SPIFC=m
CONFIG_SPI_MICROCHIP_CORE=y
CONFIG_SPI_MT65XX=y
# CONFIG_SPI_MT7621 is not set
CONFIG_SPI_MTK_NOR=y
# CONFIG_SPI_MTK_SNFI is not set
# CONFIG_SPI_NPCM_PSPI is not set
# CONFIG_SPI_LANTIQ_SSC is not set
CONFIG_SPI_OC_TINY=m
CONFIG_SPI_OMAP24XX=y
CONFIG_SPI_TI_QSPI=m
# CONFIG_SPI_OMAP_100K is not set
# CONFIG_SPI_ORION is not set
CONFIG_SPI_PIC32=y
CONFIG_SPI_PIC32_SQI=y
CONFIG_SPI_PXA2XX=y
CONFIG_SPI_PXA2XX_PCI=y
CONFIG_SPI_ROCKCHIP=m
# CONFIG_SPI_ROCKCHIP_SFC is not set
CONFIG_SPI_RPCIF=m
# CONFIG_SPI_RSPI is not set
CONFIG_SPI_QUP=y
# CONFIG_SPI_S3C64XX is not set
# CONFIG_SPI_SC18IS602 is not set
CONFIG_SPI_SH_MSIOF=y
CONFIG_SPI_SH=m
CONFIG_SPI_SH_HSPI=m
CONFIG_SPI_SIFIVE=y
CONFIG_SPI_SLAVE_MT27XX=m
# CONFIG_SPI_SPRD is not set
# CONFIG_SPI_SPRD_ADI is not set
CONFIG_SPI_STM32=m
# CONFIG_SPI_ST_SSC4 is not set
CONFIG_SPI_SUN4I=y
CONFIG_SPI_SUN6I=m
# CONFIG_SPI_SUNPLUS_SP7021 is not set
CONFIG_SPI_SYNQUACER=m
# CONFIG_SPI_MXIC is not set
# CONFIG_SPI_TEGRA210_QUAD is not set
# CONFIG_SPI_TEGRA114 is not set
CONFIG_SPI_TEGRA20_SFLASH=y
CONFIG_SPI_TEGRA20_SLINK=y
# CONFIG_SPI_THUNDERX is not set
CONFIG_SPI_TOPCLIFF_PCH=m
# CONFIG_SPI_XCOMM is not set
# CONFIG_SPI_XILINX is not set
CONFIG_SPI_XLP=y
CONFIG_SPI_XTENSA_XTFPGA=m
# CONFIG_SPI_ZYNQ_QSPI is not set
CONFIG_SPI_ZYNQMP_GQSPI=y
CONFIG_SPI_AMD=y

#
# SPI Multiplexer support
#
CONFIG_SPI_MUX=y

#
# SPI Protocol Masters
#
CONFIG_SPI_SPIDEV=m
# CONFIG_SPI_LOOPBACK_TEST is not set
CONFIG_SPI_TLE62X0=y
CONFIG_SPI_SLAVE=y
CONFIG_SPI_SLAVE_TIME=m
# CONFIG_SPI_SLAVE_SYSTEM_CONTROL is not set
CONFIG_SPI_DYNAMIC=y
CONFIG_SPMI=y
CONFIG_SPMI_HISI3670=y
CONFIG_SPMI_MSM_PMIC_ARB=m
CONFIG_SPMI_MTK_PMIF=m
# CONFIG_HSI is not set
CONFIG_PPS=m
CONFIG_PPS_DEBUG=y

#
# PPS clients support
#
# CONFIG_PPS_CLIENT_KTIMER is not set
CONFIG_PPS_CLIENT_LDISC=m
CONFIG_PPS_CLIENT_PARPORT=m
CONFIG_PPS_CLIENT_GPIO=m

#
# PPS generators support
#

#
# PTP clock support
#
CONFIG_PTP_1588_CLOCK_OPTIONAL=y
# end of PTP clock support

CONFIG_PINCTRL=y
CONFIG_GENERIC_PINCTRL_GROUPS=y
CONFIG_PINMUX=y
CONFIG_PINCONF=y
CONFIG_GENERIC_PINCONF=y
CONFIG_DEBUG_PINCTRL=y
# CONFIG_PINCTRL_AMD is not set
# CONFIG_PINCTRL_DA9062 is not set
# CONFIG_PINCTRL_MCP23S08 is not set
# CONFIG_PINCTRL_SX150X is not set
CONFIG_PINCTRL_IMX=y
# CONFIG_PINCTRL_IMX8MM is not set
CONFIG_PINCTRL_IMX8MN=y
CONFIG_PINCTRL_IMX8MP=m
CONFIG_PINCTRL_IMX8MQ=y

#
# Intel pinctrl drivers
#
# end of Intel pinctrl drivers

#
# MediaTek pinctrl drivers
#
CONFIG_EINT_MTK=y
# end of MediaTek pinctrl drivers

CONFIG_PINCTRL_PXA=y
CONFIG_PINCTRL_PXA25X=y
CONFIG_PINCTRL_PXA27X=y
CONFIG_PINCTRL_MSM=y
CONFIG_PINCTRL_SC7280_LPASS_LPI=m
# CONFIG_PINCTRL_SM8250_LPASS_LPI is not set
CONFIG_PINCTRL_SM8350=m
CONFIG_PINCTRL_SM8450_LPASS_LPI=m
CONFIG_PINCTRL_SC8280XP_LPASS_LPI=m
CONFIG_PINCTRL_LPASS_LPI=m

#
# Renesas pinctrl drivers
#
CONFIG_PINCTRL_RENESAS=y
CONFIG_PINCTRL_SH_PFC=y
CONFIG_PINCTRL_SH_PFC_GPIO=y
CONFIG_PINCTRL_SH_FUNC_GPIO=y
CONFIG_PINCTRL_PFC_EMEV2=y
CONFIG_PINCTRL_PFC_R8A77995=y
CONFIG_PINCTRL_PFC_R8A7794=y
# CONFIG_PINCTRL_PFC_R8A77990 is not set
CONFIG_PINCTRL_PFC_R8A7779=y
# CONFIG_PINCTRL_PFC_R8A7790 is not set
CONFIG_PINCTRL_PFC_R8A77950=y
# CONFIG_PINCTRL_PFC_R8A77951 is not set
CONFIG_PINCTRL_PFC_R8A7778=y
CONFIG_PINCTRL_PFC_R8A7793=y
CONFIG_PINCTRL_PFC_R8A7791=y
CONFIG_PINCTRL_PFC_R8A77965=y
# CONFIG_PINCTRL_PFC_R8A77960 is not set
# CONFIG_PINCTRL_PFC_R8A77961 is not set
# CONFIG_PINCTRL_PFC_R8A779F0 is not set
CONFIG_PINCTRL_PFC_R8A7792=y
# CONFIG_PINCTRL_PFC_R8A77980 is not set
# CONFIG_PINCTRL_PFC_R8A77970 is not set
# CONFIG_PINCTRL_PFC_R8A779A0 is not set
CONFIG_PINCTRL_PFC_R8A779G0=y
# CONFIG_PINCTRL_PFC_R8A7740 is not set
CONFIG_PINCTRL_PFC_R8A73A4=y
CONFIG_PINCTRL_PFC_R8A77470=y
# CONFIG_PINCTRL_PFC_R8A7745 is not set
CONFIG_PINCTRL_PFC_R8A7742=y
# CONFIG_PINCTRL_PFC_R8A7743 is not set
CONFIG_PINCTRL_PFC_R8A7744=y
CONFIG_PINCTRL_PFC_R8A774C0=y
# CONFIG_PINCTRL_PFC_R8A774E1 is not set
CONFIG_PINCTRL_PFC_R8A774A1=y
CONFIG_PINCTRL_PFC_R8A774B1=y
# CONFIG_PINCTRL_PFC_SH7203 is not set
# CONFIG_PINCTRL_PFC_SH7264 is not set
CONFIG_PINCTRL_PFC_SH7269=y
# CONFIG_PINCTRL_PFC_SH7720 is not set
CONFIG_PINCTRL_PFC_SH7722=y
CONFIG_PINCTRL_PFC_SH7734=y
CONFIG_PINCTRL_PFC_SH7757=y
# CONFIG_PINCTRL_PFC_SH7785 is not set
# CONFIG_PINCTRL_PFC_SH7786 is not set
CONFIG_PINCTRL_PFC_SH73A0=y
# CONFIG_PINCTRL_PFC_SH7723 is not set
# CONFIG_PINCTRL_PFC_SH7724 is not set
CONFIG_PINCTRL_PFC_SHX3=y
# end of Renesas pinctrl drivers

CONFIG_GPIOLIB=y
CONFIG_GPIOLIB_FASTPATH_LIMIT=512
CONFIG_GPIOLIB_IRQCHIP=y
# CONFIG_DEBUG_GPIO is not set
CONFIG_GPIO_SYSFS=y
CONFIG_GPIO_CDEV=y
# CONFIG_GPIO_CDEV_V1 is not set
CONFIG_GPIO_GENERIC=y
CONFIG_GPIO_REGMAP=y
CONFIG_GPIO_MAX730X=m

#
# Memory mapped GPIO drivers
#
CONFIG_GPIO_ATH79=m
CONFIG_GPIO_CLPS711X=m
CONFIG_GPIO_DWAPB=y
# CONFIG_GPIO_GENERIC_PLATFORM is not set
# CONFIG_GPIO_HISI is not set
# CONFIG_GPIO_IOP is not set
CONFIG_GPIO_MB86S7X=m
CONFIG_GPIO_MPC8XXX=y
CONFIG_GPIO_MXC=y
# CONFIG_GPIO_MXS is not set
# CONFIG_GPIO_PXA is not set
CONFIG_GPIO_RCAR=m
CONFIG_GPIO_ROCKCHIP=m
CONFIG_GPIO_THUNDERX=y
# CONFIG_GPIO_VX855 is not set
CONFIG_GPIO_XGENE_SB=m
CONFIG_GPIO_XLP=m
CONFIG_GPIO_AMD_FCH=y
# CONFIG_GPIO_IDT3243X is not set
# end of Memory mapped GPIO drivers

#
# I2C GPIO expanders
#
# CONFIG_GPIO_ADP5588 is not set
# CONFIG_GPIO_MAX7300 is not set
CONFIG_GPIO_MAX732X=y
CONFIG_GPIO_MAX732X_IRQ=y
# CONFIG_GPIO_PCA953X is not set
CONFIG_GPIO_PCA9570=y
CONFIG_GPIO_PCF857X=y
CONFIG_GPIO_TPIC2810=m
# CONFIG_GPIO_TS4900 is not set
# end of I2C GPIO expanders

#
# MFD GPIO expanders
#
CONFIG_GPIO_ADP5520=m
CONFIG_GPIO_ARIZONA=y
CONFIG_GPIO_BD9571MWV=m
CONFIG_GPIO_DA9052=y
# CONFIG_GPIO_KEMPLD is not set
CONFIG_GPIO_LP3943=m
CONFIG_GPIO_LP873X=m
# CONFIG_GPIO_MAX77620 is not set
# CONFIG_GPIO_MAX77650 is not set
# CONFIG_GPIO_PALMAS is not set
CONFIG_GPIO_RC5T583=y
CONFIG_GPIO_SL28CPLD=y
# CONFIG_GPIO_TIMBERDALE is not set
# CONFIG_GPIO_TPS6586X is not set
CONFIG_GPIO_TPS65912=m
# CONFIG_GPIO_TWL4030 is not set
CONFIG_GPIO_TWL6040=m
# CONFIG_GPIO_WM831X is not set
CONFIG_GPIO_WM8350=y
# CONFIG_GPIO_WM8994 is not set
# end of MFD GPIO expanders

#
# PCI GPIO expanders
#
# CONFIG_GPIO_BT8XX is not set
CONFIG_GPIO_MLXBF=m
CONFIG_GPIO_MLXBF2=m
# CONFIG_GPIO_ML_IOH is not set
CONFIG_GPIO_PCH=y
# CONFIG_GPIO_PCI_IDIO_16 is not set
CONFIG_GPIO_PCIE_IDIO_24=y
CONFIG_GPIO_RDC321X=m
# end of PCI GPIO expanders

#
# SPI GPIO expanders
#
CONFIG_GPIO_MAX3191X=m
CONFIG_GPIO_MAX7301=m
# CONFIG_GPIO_MC33880 is not set
CONFIG_GPIO_PISOSR=y
CONFIG_GPIO_XRA1403=m
# end of SPI GPIO expanders

#
# Virtual GPIO drivers
#
CONFIG_GPIO_AGGREGATOR=m
CONFIG_GPIO_MOCKUP=m
CONFIG_GPIO_VIRTIO=m
CONFIG_GPIO_SIM=y
# end of Virtual GPIO drivers

CONFIG_W1=m
CONFIG_W1_CON=y

#
# 1-wire Bus Masters
#
# CONFIG_W1_MASTER_MATROX is not set
CONFIG_W1_MASTER_DS2482=m
CONFIG_W1_MASTER_MXC=m
CONFIG_W1_MASTER_DS1WM=m
# CONFIG_W1_MASTER_GPIO is not set
# CONFIG_W1_MASTER_SGI is not set
# end of 1-wire Bus Masters

#
# 1-wire Slaves
#
CONFIG_W1_SLAVE_THERM=m
CONFIG_W1_SLAVE_SMEM=m
CONFIG_W1_SLAVE_DS2405=m
# CONFIG_W1_SLAVE_DS2408 is not set
CONFIG_W1_SLAVE_DS2413=m
# CONFIG_W1_SLAVE_DS2406 is not set
# CONFIG_W1_SLAVE_DS2423 is not set
CONFIG_W1_SLAVE_DS2805=m
CONFIG_W1_SLAVE_DS2430=m
# CONFIG_W1_SLAVE_DS2431 is not set
CONFIG_W1_SLAVE_DS2433=m
# CONFIG_W1_SLAVE_DS2433_CRC is not set
CONFIG_W1_SLAVE_DS2438=m
CONFIG_W1_SLAVE_DS250X=m
CONFIG_W1_SLAVE_DS2780=m
CONFIG_W1_SLAVE_DS2781=m
CONFIG_W1_SLAVE_DS28E04=m
# CONFIG_W1_SLAVE_DS28E17 is not set
# end of 1-wire Slaves

# CONFIG_POWER_RESET is not set
CONFIG_POWER_SUPPLY=y
# CONFIG_POWER_SUPPLY_DEBUG is not set
CONFIG_GENERIC_ADC_BATTERY=m
CONFIG_IP5XXX_POWER=m
CONFIG_MAX8925_POWER=y
CONFIG_WM831X_BACKUP=m
# CONFIG_WM831X_POWER is not set
CONFIG_WM8350_POWER=y
CONFIG_TEST_POWER=m
CONFIG_CHARGER_ADP5061=y
CONFIG_BATTERY_ACT8945A=y
CONFIG_BATTERY_CPCAP=m
CONFIG_BATTERY_CW2015=y
CONFIG_BATTERY_DS2760=m
# CONFIG_BATTERY_DS2780 is not set
CONFIG_BATTERY_DS2781=m
CONFIG_BATTERY_DS2782=y
CONFIG_BATTERY_SAMSUNG_SDI=y
CONFIG_BATTERY_SBS=m
CONFIG_CHARGER_SBS=m
# CONFIG_MANAGER_SBS is not set
CONFIG_BATTERY_BQ27XXX=y
CONFIG_BATTERY_BQ27XXX_I2C=m
CONFIG_BATTERY_BQ27XXX_HDQ=m
CONFIG_BATTERY_BQ27XXX_DT_UPDATES_NVM=y
CONFIG_BATTERY_DA9052=y
CONFIG_BATTERY_MAX17040=m
CONFIG_BATTERY_MAX17042=y
# CONFIG_BATTERY_MAX1721X is not set
CONFIG_BATTERY_TWL4030_MADC=m
# CONFIG_CHARGER_PCF50633 is not set
# CONFIG_BATTERY_RX51 is not set
# CONFIG_CHARGER_CPCAP is not set
CONFIG_CHARGER_MAX8903=y
# CONFIG_CHARGER_TWL4030 is not set
# CONFIG_CHARGER_LP8727 is not set
# CONFIG_CHARGER_LP8788 is not set
CONFIG_CHARGER_GPIO=m
CONFIG_CHARGER_MANAGER=m
CONFIG_CHARGER_LT3651=m
# CONFIG_CHARGER_LTC4162L is not set
CONFIG_CHARGER_MAX14577=m
CONFIG_CHARGER_MAX77650=m
CONFIG_CHARGER_MAX77693=m
# CONFIG_CHARGER_MAX77976 is not set
# CONFIG_CHARGER_MT6360 is not set
# CONFIG_CHARGER_BQ2415X is not set
# CONFIG_CHARGER_BQ24190 is not set
CONFIG_CHARGER_BQ24257=m
CONFIG_CHARGER_BQ24735=m
CONFIG_CHARGER_BQ2515X=m
# CONFIG_CHARGER_BQ25890 is not set
CONFIG_CHARGER_BQ25980=y
CONFIG_CHARGER_BQ256XX=y
CONFIG_CHARGER_SMB347=y
# CONFIG_BATTERY_GAUGE_LTC2941 is not set
CONFIG_BATTERY_GOLDFISH=m
CONFIG_BATTERY_RT5033=m
# CONFIG_CHARGER_RT9455 is not set
CONFIG_CHARGER_SC2731=y
CONFIG_FUEL_GAUGE_SC27XX=m
# CONFIG_CHARGER_BD99954 is not set
# CONFIG_BATTERY_ACER_A500 is not set
# CONFIG_BATTERY_UG3105 is not set
CONFIG_HWMON=m
CONFIG_HWMON_VID=m
# CONFIG_HWMON_DEBUG_CHIP is not set

#
# Native drivers
#
CONFIG_SENSORS_AD7314=m
CONFIG_SENSORS_AD7414=m
CONFIG_SENSORS_AD7418=m
CONFIG_SENSORS_ADM1025=m
CONFIG_SENSORS_ADM1026=m
CONFIG_SENSORS_ADM1029=m
CONFIG_SENSORS_ADM1031=m
# CONFIG_SENSORS_ADM1177 is not set
# CONFIG_SENSORS_ADM9240 is not set
CONFIG_SENSORS_ADT7X10=m
CONFIG_SENSORS_ADT7310=m
CONFIG_SENSORS_ADT7410=m
CONFIG_SENSORS_ADT7411=m
CONFIG_SENSORS_ADT7462=m
CONFIG_SENSORS_ADT7470=m
CONFIG_SENSORS_ADT7475=m
# CONFIG_SENSORS_AHT10 is not set
# CONFIG_SENSORS_AS370 is not set
# CONFIG_SENSORS_ASC7621 is not set
CONFIG_SENSORS_AXI_FAN_CONTROL=m
CONFIG_SENSORS_ARM_SCPI=m
CONFIG_SENSORS_ASB100=m
CONFIG_SENSORS_ASPEED=m
CONFIG_SENSORS_ATXP1=m
# CONFIG_SENSORS_BT1_PVT is not set
CONFIG_SENSORS_CORSAIR_CPRO=m
# CONFIG_SENSORS_CORSAIR_PSU is not set
CONFIG_SENSORS_DRIVETEMP=m
# CONFIG_SENSORS_DS620 is not set
CONFIG_SENSORS_DS1621=m
# CONFIG_SENSORS_DA9052_ADC is not set
CONFIG_SENSORS_I5K_AMB=m
CONFIG_SENSORS_SPARX5=m
CONFIG_SENSORS_F71805F=m
CONFIG_SENSORS_F71882FG=m
# CONFIG_SENSORS_F75375S is not set
# CONFIG_SENSORS_MC13783_ADC is not set
# CONFIG_SENSORS_FSCHMD is not set
CONFIG_SENSORS_GL518SM=m
# CONFIG_SENSORS_GL520SM is not set
# CONFIG_SENSORS_G760A is not set
# CONFIG_SENSORS_G762 is not set
CONFIG_SENSORS_HIH6130=m
CONFIG_SENSORS_IBMAEM=m
# CONFIG_SENSORS_IBMPEX is not set
CONFIG_SENSORS_IIO_HWMON=m
# CONFIG_SENSORS_IT87 is not set
# CONFIG_SENSORS_JC42 is not set
# CONFIG_SENSORS_POWR1220 is not set
CONFIG_SENSORS_LAN966X=m
# CONFIG_SENSORS_LINEAGE is not set
# CONFIG_SENSORS_LTC2945 is not set
CONFIG_SENSORS_LTC2947=m
CONFIG_SENSORS_LTC2947_I2C=m
# CONFIG_SENSORS_LTC2947_SPI is not set
# CONFIG_SENSORS_LTC2990 is not set
CONFIG_SENSORS_LTC2992=m
# CONFIG_SENSORS_LTC4151 is not set
# CONFIG_SENSORS_LTC4215 is not set
# CONFIG_SENSORS_LTC4222 is not set
CONFIG_SENSORS_LTC4245=m
# CONFIG_SENSORS_LTC4260 is not set
CONFIG_SENSORS_LTC4261=m
CONFIG_SENSORS_MAX1111=m
CONFIG_SENSORS_MAX127=m
CONFIG_SENSORS_MAX16065=m
CONFIG_SENSORS_MAX1619=m
# CONFIG_SENSORS_MAX1668 is not set
# CONFIG_SENSORS_MAX197 is not set
# CONFIG_SENSORS_MAX31722 is not set
# CONFIG_SENSORS_MAX31730 is not set
CONFIG_SENSORS_MAX6620=m
CONFIG_SENSORS_MAX6621=m
# CONFIG_SENSORS_MAX6639 is not set
CONFIG_SENSORS_MAX6650=m
# CONFIG_SENSORS_MAX6697 is not set
# CONFIG_SENSORS_MAX31790 is not set
# CONFIG_SENSORS_MCP3021 is not set
# CONFIG_SENSORS_MLXREG_FAN is not set
CONFIG_SENSORS_TC654=m
CONFIG_SENSORS_TPS23861=m
# CONFIG_SENSORS_MENF21BMC_HWMON is not set
CONFIG_SENSORS_MR75203=m
# CONFIG_SENSORS_ADCXX is not set
CONFIG_SENSORS_LM63=m
# CONFIG_SENSORS_LM70 is not set
CONFIG_SENSORS_LM73=m
CONFIG_SENSORS_LM75=m
CONFIG_SENSORS_LM77=m
CONFIG_SENSORS_LM78=m
CONFIG_SENSORS_LM80=m
# CONFIG_SENSORS_LM83 is not set
CONFIG_SENSORS_LM85=m
CONFIG_SENSORS_LM87=m
CONFIG_SENSORS_LM90=m
# CONFIG_SENSORS_LM92 is not set
CONFIG_SENSORS_LM93=m
CONFIG_SENSORS_LM95234=m
# CONFIG_SENSORS_LM95241 is not set
# CONFIG_SENSORS_LM95245 is not set
CONFIG_SENSORS_PC87360=m
CONFIG_SENSORS_PC87427=m
CONFIG_SENSORS_NTC_THERMISTOR=m
CONFIG_SENSORS_NCT6683=m
CONFIG_SENSORS_NCT6775_CORE=m
# CONFIG_SENSORS_NCT6775 is not set
CONFIG_SENSORS_NCT6775_I2C=m
CONFIG_SENSORS_NCT7802=m
CONFIG_SENSORS_NPCM7XX=m
# CONFIG_SENSORS_OCC_P8_I2C is not set
CONFIG_SENSORS_PCF8591=m
CONFIG_SENSORS_PECI_CPUTEMP=m
CONFIG_SENSORS_PECI_DIMMTEMP=m
CONFIG_SENSORS_PECI=m
CONFIG_PMBUS=m
# CONFIG_SENSORS_PMBUS is not set
CONFIG_SENSORS_ADM1266=m
# CONFIG_SENSORS_ADM1275 is not set
# CONFIG_SENSORS_BEL_PFE is not set
# CONFIG_SENSORS_BPA_RS600 is not set
# CONFIG_SENSORS_DELTA_AHE50DC_FAN is not set
CONFIG_SENSORS_FSP_3Y=m
# CONFIG_SENSORS_IBM_CFFPS is not set
CONFIG_SENSORS_DPS920AB=m
CONFIG_SENSORS_INSPUR_IPSPS=m
CONFIG_SENSORS_IR35221=m
CONFIG_SENSORS_IR36021=m
CONFIG_SENSORS_IR38064=m
# CONFIG_SENSORS_IR38064_REGULATOR is not set
CONFIG_SENSORS_IRPS5401=m
# CONFIG_SENSORS_ISL68137 is not set
CONFIG_SENSORS_LM25066=m
# CONFIG_SENSORS_LM25066_REGULATOR is not set
# CONFIG_SENSORS_LT7182S is not set
CONFIG_SENSORS_LTC2978=m
CONFIG_SENSORS_LTC2978_REGULATOR=y
CONFIG_SENSORS_LTC3815=m
# CONFIG_SENSORS_MAX15301 is not set
# CONFIG_SENSORS_MAX16064 is not set
# CONFIG_SENSORS_MAX16601 is not set
# CONFIG_SENSORS_MAX20730 is not set
CONFIG_SENSORS_MAX20751=m
# CONFIG_SENSORS_MAX31785 is not set
# CONFIG_SENSORS_MAX34440 is not set
CONFIG_SENSORS_MAX8688=m
# CONFIG_SENSORS_MP2888 is not set
# CONFIG_SENSORS_MP2975 is not set
# CONFIG_SENSORS_MP5023 is not set
# CONFIG_SENSORS_PIM4328 is not set
CONFIG_SENSORS_PLI1209BC=m
# CONFIG_SENSORS_PLI1209BC_REGULATOR is not set
# CONFIG_SENSORS_PM6764TR is not set
# CONFIG_SENSORS_PXE1610 is not set
# CONFIG_SENSORS_Q54SJ108A2 is not set
# CONFIG_SENSORS_STPDDC60 is not set
CONFIG_SENSORS_TPS40422=m
CONFIG_SENSORS_TPS53679=m
# CONFIG_SENSORS_UCD9000 is not set
CONFIG_SENSORS_UCD9200=m
CONFIG_SENSORS_XDPE152=m
# CONFIG_SENSORS_XDPE122 is not set
# CONFIG_SENSORS_ZL6100 is not set
CONFIG_SENSORS_PWM_FAN=m
# CONFIG_SENSORS_RASPBERRYPI_HWMON is not set
CONFIG_SENSORS_SL28CPLD=m
# CONFIG_SENSORS_SBTSI is not set
CONFIG_SENSORS_SBRMI=m
CONFIG_SENSORS_SHT15=m
CONFIG_SENSORS_SHT21=m
CONFIG_SENSORS_SHT3x=m
CONFIG_SENSORS_SHT4x=m
CONFIG_SENSORS_SHTC1=m
# CONFIG_SENSORS_SIS5595 is not set
CONFIG_SENSORS_SY7636A=m
CONFIG_SENSORS_DME1737=m
CONFIG_SENSORS_EMC1403=m
CONFIG_SENSORS_EMC2103=m
CONFIG_SENSORS_EMC6W201=m
# CONFIG_SENSORS_SMSC47M1 is not set
CONFIG_SENSORS_SMSC47M192=m
# CONFIG_SENSORS_SMSC47B397 is not set
# CONFIG_SENSORS_STTS751 is not set
CONFIG_SENSORS_SMM665=m
CONFIG_SENSORS_ADC128D818=m
CONFIG_SENSORS_ADS7828=m
CONFIG_SENSORS_ADS7871=m
# CONFIG_SENSORS_AMC6821 is not set
CONFIG_SENSORS_INA209=m
CONFIG_SENSORS_INA2XX=m
# CONFIG_SENSORS_INA238 is not set
# CONFIG_SENSORS_INA3221 is not set
CONFIG_SENSORS_TC74=m
# CONFIG_SENSORS_THMC50 is not set
CONFIG_SENSORS_TMP102=m
# CONFIG_SENSORS_TMP103 is not set
# CONFIG_SENSORS_TMP108 is not set
# CONFIG_SENSORS_TMP401 is not set
# CONFIG_SENSORS_TMP421 is not set
CONFIG_SENSORS_TMP464=m
CONFIG_SENSORS_TMP513=m
# CONFIG_SENSORS_VIA686A is not set
# CONFIG_SENSORS_VT1211 is not set
# CONFIG_SENSORS_VT8231 is not set
CONFIG_SENSORS_W83773G=m
# CONFIG_SENSORS_W83781D is not set
# CONFIG_SENSORS_W83791D is not set
# CONFIG_SENSORS_W83792D is not set
CONFIG_SENSORS_W83793=m
CONFIG_SENSORS_W83795=m
CONFIG_SENSORS_W83795_FANCTRL=y
CONFIG_SENSORS_W83L785TS=m
# CONFIG_SENSORS_W83L786NG is not set
CONFIG_SENSORS_W83627HF=m
CONFIG_SENSORS_W83627EHF=m
# CONFIG_SENSORS_WM831X is not set
CONFIG_SENSORS_WM8350=m
# CONFIG_THERMAL is not set
# CONFIG_WATCHDOG is not set
CONFIG_SSB_POSSIBLE=y
CONFIG_SSB=m
CONFIG_SSB_SPROM=y
CONFIG_SSB_PCIHOST_POSSIBLE=y
CONFIG_SSB_PCIHOST=y
CONFIG_SSB_PCMCIAHOST_POSSIBLE=y
CONFIG_SSB_PCMCIAHOST=y
CONFIG_SSB_SDIOHOST_POSSIBLE=y
# CONFIG_SSB_SDIOHOST is not set
CONFIG_SSB_HOST_SOC=y
CONFIG_SSB_DRIVER_PCICORE_POSSIBLE=y
CONFIG_SSB_DRIVER_PCICORE=y
# CONFIG_SSB_DRIVER_GPIO is not set
CONFIG_BCMA_POSSIBLE=y
CONFIG_BCMA=m
CONFIG_BCMA_HOST_PCI_POSSIBLE=y
# CONFIG_BCMA_HOST_PCI is not set
# CONFIG_BCMA_HOST_SOC is not set
CONFIG_BCMA_DRIVER_PCI=y
# CONFIG_BCMA_DRIVER_MIPS is not set
CONFIG_BCMA_DRIVER_GMAC_CMN=y
CONFIG_BCMA_DRIVER_GPIO=y
CONFIG_BCMA_DEBUG=y

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
CONFIG_MFD_SUN4I_GPADC=m
CONFIG_MFD_AS3711=y
CONFIG_PMIC_ADP5520=y
CONFIG_MFD_AAT2870_CORE=y
CONFIG_MFD_AT91_USART=y
CONFIG_MFD_ATMEL_SMC=y
CONFIG_MFD_BCM590XX=m
CONFIG_MFD_BD9571MWV=y
# CONFIG_MFD_AXP20X_I2C is not set
# CONFIG_MFD_MADERA is not set
CONFIG_MFD_ASIC3=y
# CONFIG_PMIC_DA903X is not set
CONFIG_PMIC_DA9052=y
# CONFIG_MFD_DA9052_SPI is not set
CONFIG_MFD_DA9052_I2C=y
# CONFIG_MFD_DA9055 is not set
CONFIG_MFD_DA9062=m
# CONFIG_MFD_DA9063 is not set
# CONFIG_MFD_DA9150 is not set
# CONFIG_MFD_ENE_KB3930 is not set
CONFIG_MFD_EXYNOS_LPASS=m
CONFIG_MFD_MC13XXX=m
# CONFIG_MFD_MC13XXX_SPI is not set
CONFIG_MFD_MC13XXX_I2C=m
CONFIG_MFD_MP2629=m
CONFIG_MFD_MXS_LRADC=y
# CONFIG_MFD_MX25_TSADC is not set
CONFIG_HTC_PASIC3=y
# CONFIG_HTC_I2CPLD is not set
CONFIG_LPC_ICH=m
CONFIG_LPC_SCH=y
CONFIG_MFD_IQS62X=m
# CONFIG_MFD_JANZ_CMODIO is not set
CONFIG_MFD_KEMPLD=m
# CONFIG_MFD_88PM800 is not set
CONFIG_MFD_88PM805=y
# CONFIG_MFD_88PM860X is not set
CONFIG_MFD_MAX14577=m
CONFIG_MFD_MAX77620=y
CONFIG_MFD_MAX77650=m
CONFIG_MFD_MAX77686=y
CONFIG_MFD_MAX77693=m
CONFIG_MFD_MAX77714=y
CONFIG_MFD_MAX77843=y
# CONFIG_MFD_MAX8907 is not set
CONFIG_MFD_MAX8925=y
# CONFIG_MFD_MAX8997 is not set
# CONFIG_MFD_MAX8998 is not set
CONFIG_MFD_MT6360=m
CONFIG_MFD_MT6397=m
CONFIG_MFD_MENF21BMC=y
# CONFIG_EZX_PCAP is not set
CONFIG_MFD_CPCAP=m
# CONFIG_MFD_NTXEC is not set
CONFIG_MFD_RETU=m
CONFIG_MFD_PCF50633=m
CONFIG_PCF50633_ADC=m
CONFIG_PCF50633_GPIO=m
CONFIG_MFD_PM8XXX=y
CONFIG_MFD_RDC321X=m
# CONFIG_MFD_RT4831 is not set
# CONFIG_MFD_RT5033 is not set
CONFIG_MFD_RC5T583=y
# CONFIG_MFD_SEC_CORE is not set
CONFIG_MFD_SI476X_CORE=m
CONFIG_MFD_SIMPLE_MFD_I2C=m
# CONFIG_MFD_SL28CPLD is not set
# CONFIG_MFD_SM501 is not set
CONFIG_MFD_SKY81452=y
# CONFIG_MFD_SC27XX_PMIC is not set
CONFIG_ABX500_CORE=y
# CONFIG_MFD_SUN6I_PRCM is not set
CONFIG_MFD_SYSCON=y
# CONFIG_MFD_TI_AM335X_TSCADC is not set
CONFIG_MFD_LP3943=y
CONFIG_MFD_LP8788=y
CONFIG_MFD_TI_LMU=m
CONFIG_MFD_PALMAS=y
# CONFIG_TPS6105X is not set
CONFIG_TPS65010=y
# CONFIG_TPS6507X is not set
# CONFIG_MFD_TPS65086 is not set
# CONFIG_MFD_TPS65090 is not set
CONFIG_MFD_TI_LP873X=y
CONFIG_MFD_TPS6586X=y
# CONFIG_MFD_TPS65910 is not set
CONFIG_MFD_TPS65912=m
# CONFIG_MFD_TPS65912_I2C is not set
CONFIG_MFD_TPS65912_SPI=m
CONFIG_TWL4030_CORE=y
CONFIG_MFD_TWL4030_AUDIO=y
CONFIG_TWL6040_CORE=y
CONFIG_MFD_WL1273_CORE=y
CONFIG_MFD_LM3533=y
CONFIG_MFD_TIMBERDALE=y
# CONFIG_MFD_TQMX86 is not set
CONFIG_MFD_VX855=y
CONFIG_MFD_ARIZONA=y
# CONFIG_MFD_ARIZONA_I2C is not set
CONFIG_MFD_ARIZONA_SPI=y
CONFIG_MFD_CS47L24=y
CONFIG_MFD_WM5102=y
CONFIG_MFD_WM5110=y
# CONFIG_MFD_WM8997 is not set
CONFIG_MFD_WM8998=y
# CONFIG_MFD_WM8400 is not set
CONFIG_MFD_WM831X=y
CONFIG_MFD_WM831X_I2C=y
CONFIG_MFD_WM831X_SPI=y
CONFIG_MFD_WM8350=y
CONFIG_MFD_WM8350_I2C=y
CONFIG_MFD_WM8994=m
CONFIG_MFD_STW481X=y
CONFIG_MFD_STM32_LPTIMER=y
CONFIG_MFD_STM32_TIMERS=y
# CONFIG_MFD_STMFX is not set
CONFIG_MFD_WCD934X=y
CONFIG_MFD_ATC260X=y
CONFIG_MFD_ATC260X_I2C=y
# CONFIG_MFD_KHADAS_MCU is not set
CONFIG_MFD_ACER_A500_EC=m
CONFIG_RAVE_SP_CORE=m
# CONFIG_MFD_INTEL_M10_BMC is not set
# end of Multifunction device drivers

CONFIG_REGULATOR=y
# CONFIG_REGULATOR_DEBUG is not set
CONFIG_REGULATOR_FIXED_VOLTAGE=m
CONFIG_REGULATOR_VIRTUAL_CONSUMER=m
# CONFIG_REGULATOR_USERSPACE_CONSUMER is not set
CONFIG_REGULATOR_88PG86X=m
# CONFIG_REGULATOR_ACT8865 is not set
CONFIG_REGULATOR_AD5398=y
# CONFIG_REGULATOR_ANATOP is not set
CONFIG_REGULATOR_AAT2870=m
CONFIG_REGULATOR_AS3711=m
CONFIG_REGULATOR_ATC260X=m
CONFIG_REGULATOR_BCM590XX=m
CONFIG_REGULATOR_BD9571MWV=y
# CONFIG_REGULATOR_CPCAP is not set
CONFIG_REGULATOR_DA9052=m
CONFIG_REGULATOR_DA9062=m
# CONFIG_REGULATOR_DA9210 is not set
CONFIG_REGULATOR_DA9211=y
CONFIG_REGULATOR_FAN53555=y
CONFIG_REGULATOR_FAN53880=y
CONFIG_REGULATOR_GPIO=y
# CONFIG_REGULATOR_ISL9305 is not set
CONFIG_REGULATOR_ISL6271A=y
CONFIG_REGULATOR_LM363X=m
CONFIG_REGULATOR_LP3971=m
# CONFIG_REGULATOR_LP3972 is not set
CONFIG_REGULATOR_LP872X=m
# CONFIG_REGULATOR_LP8755 is not set
CONFIG_REGULATOR_LP8788=m
# CONFIG_REGULATOR_LTC3589 is not set
CONFIG_REGULATOR_LTC3676=y
CONFIG_REGULATOR_MAX14577=m
CONFIG_REGULATOR_MAX1586=y
CONFIG_REGULATOR_MAX77620=m
# CONFIG_REGULATOR_MAX77650 is not set
CONFIG_REGULATOR_MAX8649=m
# CONFIG_REGULATOR_MAX8660 is not set
# CONFIG_REGULATOR_MAX8893 is not set
# CONFIG_REGULATOR_MAX8907 is not set
# CONFIG_REGULATOR_MAX8925 is not set
CONFIG_REGULATOR_MAX8952=m
# CONFIG_REGULATOR_MAX20086 is not set
CONFIG_REGULATOR_MAX77686=m
CONFIG_REGULATOR_MAX77693=y
# CONFIG_REGULATOR_MAX77802 is not set
CONFIG_REGULATOR_MAX77826=m
CONFIG_REGULATOR_MC13XXX_CORE=m
CONFIG_REGULATOR_MC13783=m
# CONFIG_REGULATOR_MC13892 is not set
CONFIG_REGULATOR_MP8859=y
CONFIG_REGULATOR_MP886X=m
CONFIG_REGULATOR_MT6311=y
CONFIG_REGULATOR_MT6315=m
# CONFIG_REGULATOR_MT6323 is not set
# CONFIG_REGULATOR_MT6358 is not set
CONFIG_REGULATOR_MT6359=m
# CONFIG_REGULATOR_MT6360 is not set
CONFIG_REGULATOR_MT6397=m
CONFIG_REGULATOR_PALMAS=m
# CONFIG_REGULATOR_PBIAS is not set
CONFIG_REGULATOR_PCA9450=m
CONFIG_REGULATOR_PCF50633=m
CONFIG_REGULATOR_PV88060=y
# CONFIG_REGULATOR_PV88080 is not set
CONFIG_REGULATOR_PV88090=y
CONFIG_REGULATOR_PWM=y
CONFIG_REGULATOR_QCOM_RPMH=m
CONFIG_REGULATOR_QCOM_SMD_RPM=y
CONFIG_REGULATOR_QCOM_SPMI=m
CONFIG_REGULATOR_QCOM_USB_VBUS=m
CONFIG_REGULATOR_RC5T583=y
CONFIG_REGULATOR_RT4801=m
CONFIG_REGULATOR_RT5190A=m
CONFIG_REGULATOR_RT5759=m
CONFIG_REGULATOR_RT6160=m
CONFIG_REGULATOR_RT6245=m
CONFIG_REGULATOR_RTQ2134=y
# CONFIG_REGULATOR_RTMV20 is not set
CONFIG_REGULATOR_RTQ6752=y
# CONFIG_REGULATOR_S2MPA01 is not set
CONFIG_REGULATOR_S2MPS11=m
CONFIG_REGULATOR_S5M8767=y
CONFIG_REGULATOR_SC2731=y
CONFIG_REGULATOR_SKY81452=m
CONFIG_REGULATOR_SLG51000=y
# CONFIG_REGULATOR_STM32_BOOSTER is not set
# CONFIG_REGULATOR_STM32_VREFBUF is not set
CONFIG_REGULATOR_STM32_PWR=y
CONFIG_REGULATOR_TI_ABB=y
CONFIG_REGULATOR_STW481X_VMMC=y
# CONFIG_REGULATOR_SY7636A is not set
CONFIG_REGULATOR_SY8106A=m
CONFIG_REGULATOR_SY8824X=m
CONFIG_REGULATOR_SY8827N=m
CONFIG_REGULATOR_TPS51632=m
CONFIG_REGULATOR_TPS62360=y
# CONFIG_REGULATOR_TPS65023 is not set
CONFIG_REGULATOR_TPS6507X=m
CONFIG_REGULATOR_TPS65132=y
CONFIG_REGULATOR_TPS6524X=y
CONFIG_REGULATOR_TPS6586X=m
CONFIG_REGULATOR_TPS65912=m
CONFIG_REGULATOR_TPS68470=m
CONFIG_REGULATOR_TWL4030=y
CONFIG_REGULATOR_WM831X=y
CONFIG_REGULATOR_WM8350=y
# CONFIG_REGULATOR_WM8994 is not set
CONFIG_REGULATOR_QCOM_LABIBB=y
# CONFIG_RC_CORE is not set
CONFIG_CEC_CORE=y
CONFIG_CEC_NOTIFIER=y

#
# CEC support
#
CONFIG_MEDIA_CEC_SUPPORT=y
# CONFIG_CEC_CH7322 is not set
CONFIG_CEC_MESON_AO=y
# CONFIG_CEC_GPIO is not set
CONFIG_CEC_SAMSUNG_S5P=m
# CONFIG_CEC_STI is not set
# CONFIG_CEC_STM32 is not set
CONFIG_CEC_TEGRA=m
# end of CEC support

# CONFIG_MEDIA_SUPPORT is not set

#
# Graphics support
#
CONFIG_APERTURE_HELPERS=y
# CONFIG_IMX_IPUV3_CORE is not set
CONFIG_DRM=y
CONFIG_DRM_MIPI_DBI=y
CONFIG_DRM_MIPI_DSI=y
# CONFIG_DRM_DEBUG_MM is not set
CONFIG_DRM_DEBUG_SELFTEST=m
CONFIG_DRM_KMS_HELPER=y
# CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS is not set
# CONFIG_DRM_DEBUG_MODESET_LOCK is not set
CONFIG_DRM_LOAD_EDID_FIRMWARE=y
CONFIG_DRM_DP_AUX_BUS=m
CONFIG_DRM_DISPLAY_HELPER=y
CONFIG_DRM_DISPLAY_DP_HELPER=y
CONFIG_DRM_DISPLAY_HDMI_HELPER=y
CONFIG_DRM_DP_AUX_CHARDEV=y
CONFIG_DRM_DP_CEC=y
CONFIG_DRM_TTM=y
CONFIG_DRM_BUDDY=m
CONFIG_DRM_VRAM_HELPER=y
CONFIG_DRM_TTM_HELPER=y
CONFIG_DRM_GEM_CMA_HELPER=y
CONFIG_DRM_GEM_SHMEM_HELPER=y
CONFIG_DRM_SCHED=y

#
# I2C encoder or helper chips
#
# CONFIG_DRM_I2C_CH7006 is not set
CONFIG_DRM_I2C_SIL164=m
CONFIG_DRM_I2C_NXP_TDA998X=m
# CONFIG_DRM_I2C_NXP_TDA9950 is not set
# end of I2C encoder or helper chips

#
# ARM devices
#
# end of ARM devices

CONFIG_DRM_RADEON=m
# CONFIG_DRM_RADEON_USERPTR is not set
CONFIG_DRM_AMDGPU=m
# CONFIG_DRM_AMDGPU_SI is not set
CONFIG_DRM_AMDGPU_CIK=y
# CONFIG_DRM_AMDGPU_USERPTR is not set

#
# ACP (Audio CoProcessor) Configuration
#
# CONFIG_DRM_AMD_ACP is not set
# end of ACP (Audio CoProcessor) Configuration

#
# Display Engine Configuration
#
# CONFIG_DRM_AMD_DC is not set
# end of Display Engine Configuration

CONFIG_DRM_NOUVEAU=y
# CONFIG_NOUVEAU_LEGACY_CTX_SUPPORT is not set
CONFIG_NOUVEAU_DEBUG=5
CONFIG_NOUVEAU_DEBUG_DEFAULT=3
CONFIG_NOUVEAU_DEBUG_MMU=y
CONFIG_NOUVEAU_DEBUG_PUSH=y
# CONFIG_DRM_NOUVEAU_BACKLIGHT is not set
CONFIG_DRM_KMB_DISPLAY=m
# CONFIG_DRM_VGEM is not set
CONFIG_DRM_VKMS=m
# CONFIG_DRM_AST is not set
CONFIG_DRM_MGAG200=m
CONFIG_DRM_SUN4I=y
# CONFIG_DRM_SUN4I_HDMI is not set
# CONFIG_DRM_SUN4I_BACKEND is not set
# CONFIG_DRM_SUN6I_DSI is not set
# CONFIG_DRM_SUN8I_DW_HDMI is not set
CONFIG_DRM_SUN8I_MIXER=y
CONFIG_DRM_SUN8I_TCON_TOP=y
CONFIG_DRM_QXL=y
# CONFIG_DRM_VIRTIO_GPU is not set
CONFIG_DRM_MSM=m
CONFIG_DRM_MSM_GPU_STATE=y
# CONFIG_DRM_MSM_GPU_SUDO is not set
CONFIG_DRM_MSM_MDSS=y
CONFIG_DRM_MSM_MDP4=y
# CONFIG_DRM_MSM_MDP5 is not set
CONFIG_DRM_MSM_DPU=y
# CONFIG_DRM_MSM_DP is not set
CONFIG_DRM_MSM_DSI=y
# CONFIG_DRM_MSM_DSI_28NM_PHY is not set
CONFIG_DRM_MSM_DSI_20NM_PHY=y
# CONFIG_DRM_MSM_DSI_28NM_8960_PHY is not set
# CONFIG_DRM_MSM_DSI_14NM_PHY is not set
# CONFIG_DRM_MSM_DSI_10NM_PHY is not set
CONFIG_DRM_MSM_DSI_7NM_PHY=y
# CONFIG_DRM_MSM_HDMI is not set
CONFIG_DRM_PANEL=y

#
# Display Panels
#
CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN=y
CONFIG_DRM_PANEL_WIDECHIPS_WS2401=y
# end of Display Panels

CONFIG_DRM_BRIDGE=y
CONFIG_DRM_PANEL_BRIDGE=y

#
# Display Interface Bridges
#
CONFIG_DRM_ANALOGIX_ANX78XX=y
CONFIG_DRM_ANALOGIX_DP=y
# end of Display Interface Bridges

CONFIG_DRM_V3D=m
CONFIG_DRM_ETNAVIV=y
# CONFIG_DRM_ETNAVIV_THERMAL is not set
CONFIG_DRM_HISI_HIBMC=y
CONFIG_DRM_LOGICVC=m
# CONFIG_DRM_BOCHS is not set
CONFIG_DRM_CIRRUS_QEMU=y
CONFIG_DRM_PANEL_MIPI_DBI=y
CONFIG_DRM_SIMPLEDRM=m
CONFIG_TINYDRM_HX8357D=y
CONFIG_TINYDRM_ILI9163=m
CONFIG_TINYDRM_ILI9225=y
CONFIG_TINYDRM_ILI9341=m
# CONFIG_TINYDRM_ILI9486 is not set
CONFIG_TINYDRM_MI0283QT=m
CONFIG_TINYDRM_REPAPER=y
CONFIG_TINYDRM_ST7586=m
CONFIG_TINYDRM_ST7735R=m
# CONFIG_DRM_PL111 is not set
# CONFIG_DRM_PANFROST is not set
# CONFIG_DRM_SSD130X is not set
# CONFIG_DRM_LEGACY is not set
CONFIG_DRM_EXPORT_FOR_TESTS=y
CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=y
CONFIG_DRM_NOMODESET=y
CONFIG_DRM_LIB_RANDOM=y

#
# Frame buffer Devices
#
CONFIG_FB_CMDLINE=y
CONFIG_FB_NOTIFY=y
CONFIG_FB=m
CONFIG_FIRMWARE_EDID=y
CONFIG_FB_DDC=m
CONFIG_FB_CFB_FILLRECT=m
CONFIG_FB_CFB_COPYAREA=m
CONFIG_FB_CFB_IMAGEBLIT=m
CONFIG_FB_CFB_REV_PIXELS_IN_BYTE=y
CONFIG_FB_SYS_FILLRECT=m
CONFIG_FB_SYS_COPYAREA=m
CONFIG_FB_SYS_IMAGEBLIT=m
CONFIG_FB_FOREIGN_ENDIAN=y
CONFIG_FB_BOTH_ENDIAN=y
# CONFIG_FB_BIG_ENDIAN is not set
# CONFIG_FB_LITTLE_ENDIAN is not set
CONFIG_FB_SYS_FOPS=m
CONFIG_FB_DEFERRED_IO=y
CONFIG_FB_SVGALIB=m
CONFIG_FB_BACKLIGHT=m
CONFIG_FB_MODE_HELPERS=y
CONFIG_FB_TILEBLITTING=y

#
# Frame buffer hardware drivers
#
CONFIG_FB_CIRRUS=m
CONFIG_FB_PM2=m
# CONFIG_FB_PM2_FIFO_DISCONNECT is not set
# CONFIG_FB_CLPS711X is not set
CONFIG_FB_IMX=m
CONFIG_FB_CYBER2000=m
# CONFIG_FB_CYBER2000_DDC is not set
CONFIG_FB_ARC=m
CONFIG_FB_UVESA=m
CONFIG_FB_PVR2=m
CONFIG_FB_OPENCORES=m
CONFIG_FB_S1D13XXX=m
# CONFIG_FB_NVIDIA is not set
# CONFIG_FB_RIVA is not set
CONFIG_FB_I740=m
CONFIG_FB_MATROX=m
# CONFIG_FB_MATROX_MILLENIUM is not set
CONFIG_FB_MATROX_MYSTIQUE=y
CONFIG_FB_MATROX_G=y
# CONFIG_FB_MATROX_I2C is not set
CONFIG_FB_RADEON=m
# CONFIG_FB_RADEON_I2C is not set
# CONFIG_FB_RADEON_BACKLIGHT is not set
# CONFIG_FB_RADEON_DEBUG is not set
CONFIG_FB_ATY128=m
# CONFIG_FB_ATY128_BACKLIGHT is not set
CONFIG_FB_ATY=m
CONFIG_FB_ATY_CT=y
CONFIG_FB_ATY_GENERIC_LCD=y
CONFIG_FB_ATY_GX=y
# CONFIG_FB_ATY_BACKLIGHT is not set
CONFIG_FB_S3=m
# CONFIG_FB_S3_DDC is not set
# CONFIG_FB_SAVAGE is not set
CONFIG_FB_SIS=m
CONFIG_FB_SIS_300=y
# CONFIG_FB_SIS_315 is not set
CONFIG_FB_VIA=m
# CONFIG_FB_VIA_DIRECT_PROCFS is not set
# CONFIG_FB_VIA_X_COMPATIBILITY is not set
# CONFIG_FB_NEOMAGIC is not set
CONFIG_FB_KYRO=m
# CONFIG_FB_3DFX is not set
CONFIG_FB_VOODOO1=m
# CONFIG_FB_VT8623 is not set
CONFIG_FB_TRIDENT=m
CONFIG_FB_ARK=m
CONFIG_FB_PM3=m
# CONFIG_FB_CARMINE is not set
# CONFIG_FB_PXA168 is not set
CONFIG_FB_W100=m
CONFIG_FB_SH_MOBILE_LCDC=m
CONFIG_FB_TMIO=m
# CONFIG_FB_TMIO_ACCELL is not set
CONFIG_FB_S3C=m
# CONFIG_FB_S3C_DEBUG_REGWRITE is not set
# CONFIG_FB_IBM_GXT4500 is not set
CONFIG_FB_GOLDFISH=m
CONFIG_FB_DA8XX=m
# CONFIG_FB_VIRTUAL is not set
CONFIG_FB_METRONOME=m
# CONFIG_FB_MB862XX is not set
# CONFIG_FB_BROADSHEET is not set
# CONFIG_FB_SIMPLE is not set
CONFIG_FB_SSD1307=m
CONFIG_FB_SM712=m
CONFIG_FB_OMAP_LCD_H3=y
CONFIG_MMP_DISP=y
# CONFIG_MMP_DISP_CONTROLLER is not set
# CONFIG_MMP_PANEL_TPOHVGA is not set
CONFIG_MMP_FB=m
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
CONFIG_LCD_CLASS_DEVICE=m
# CONFIG_LCD_L4F00242T03 is not set
# CONFIG_LCD_LMS283GF05 is not set
CONFIG_LCD_LTV350QV=m
CONFIG_LCD_ILI922X=m
CONFIG_LCD_ILI9320=m
CONFIG_LCD_TDO24M=m
CONFIG_LCD_VGG2432A4=m
# CONFIG_LCD_PLATFORM is not set
# CONFIG_LCD_AMS369FG06 is not set
CONFIG_LCD_LMS501KF03=m
# CONFIG_LCD_HX8357 is not set
CONFIG_LCD_OTM3225A=m
CONFIG_BACKLIGHT_CLASS_DEVICE=y
CONFIG_BACKLIGHT_KTD253=y
# CONFIG_BACKLIGHT_LM3533 is not set
CONFIG_BACKLIGHT_OMAP1=m
# CONFIG_BACKLIGHT_PWM is not set
# CONFIG_BACKLIGHT_DA9052 is not set
CONFIG_BACKLIGHT_MAX8925=m
# CONFIG_BACKLIGHT_QCOM_WLED is not set
# CONFIG_BACKLIGHT_WM831X is not set
CONFIG_BACKLIGHT_ADP5520=m
# CONFIG_BACKLIGHT_ADP8860 is not set
CONFIG_BACKLIGHT_ADP8870=y
CONFIG_BACKLIGHT_PCF50633=m
CONFIG_BACKLIGHT_AAT2870=y
# CONFIG_BACKLIGHT_LM3630A is not set
CONFIG_BACKLIGHT_LM3639=y
CONFIG_BACKLIGHT_LP855X=m
# CONFIG_BACKLIGHT_LP8788 is not set
# CONFIG_BACKLIGHT_PANDORA is not set
CONFIG_BACKLIGHT_SKY81452=y
# CONFIG_BACKLIGHT_AS3711 is not set
CONFIG_BACKLIGHT_GPIO=y
# CONFIG_BACKLIGHT_LV5207LP is not set
# CONFIG_BACKLIGHT_BD6107 is not set
CONFIG_BACKLIGHT_ARCXCNN=y
CONFIG_BACKLIGHT_RAVE_SP=m
# end of Backlight & LCD device support

CONFIG_VGASTATE=m
CONFIG_VIDEOMODE_HELPERS=y
CONFIG_HDMI=y
CONFIG_LOGO=y
# CONFIG_LOGO_LINUX_MONO is not set
# CONFIG_LOGO_LINUX_VGA16 is not set
CONFIG_LOGO_LINUX_CLUT224=y
# end of Graphics support

# CONFIG_SOUND is not set

#
# HID support
#
CONFIG_HID=m
CONFIG_HID_BATTERY_STRENGTH=y
CONFIG_HIDRAW=y
CONFIG_UHID=m
CONFIG_HID_GENERIC=m

#
# Special HID drivers
#
CONFIG_HID_A4TECH=m
CONFIG_HID_ACRUX=m
CONFIG_HID_ACRUX_FF=y
CONFIG_HID_APPLE=m
# CONFIG_HID_AUREAL is not set
CONFIG_HID_BELKIN=m
CONFIG_HID_CHERRY=m
# CONFIG_HID_COUGAR is not set
# CONFIG_HID_MACALLY is not set
CONFIG_HID_CMEDIA=m
CONFIG_HID_CYPRESS=m
# CONFIG_HID_DRAGONRISE is not set
CONFIG_HID_EMS_FF=m
CONFIG_HID_ELECOM=m
# CONFIG_HID_EZKEY is not set
# CONFIG_HID_GEMBIRD is not set
# CONFIG_HID_GFRM is not set
# CONFIG_HID_GLORIOUS is not set
CONFIG_HID_VIVALDI_COMMON=m
CONFIG_HID_VIVALDI=m
CONFIG_HID_KEYTOUCH=m
# CONFIG_HID_KYE is not set
CONFIG_HID_WALTOP=m
CONFIG_HID_VIEWSONIC=m
CONFIG_HID_XIAOMI=m
# CONFIG_HID_GYRATION is not set
# CONFIG_HID_ICADE is not set
CONFIG_HID_ITE=m
# CONFIG_HID_JABRA is not set
CONFIG_HID_TWINHAN=m
CONFIG_HID_KENSINGTON=m
CONFIG_HID_LCPOWER=m
CONFIG_HID_LED=m
CONFIG_HID_LENOVO=m
CONFIG_HID_MAGICMOUSE=m
CONFIG_HID_MALTRON=m
# CONFIG_HID_MAYFLASH is not set
CONFIG_HID_REDRAGON=m
CONFIG_HID_MICROSOFT=m
CONFIG_HID_MONTEREY=m
CONFIG_HID_MULTITOUCH=m
CONFIG_HID_NINTENDO=m
# CONFIG_NINTENDO_FF is not set
CONFIG_HID_NTI=m
CONFIG_HID_ORTEK=m
CONFIG_HID_PANTHERLORD=m
# CONFIG_PANTHERLORD_FF is not set
CONFIG_HID_PETALYNX=m
CONFIG_HID_PICOLCD=m
# CONFIG_HID_PICOLCD_FB is not set
CONFIG_HID_PICOLCD_BACKLIGHT=y
CONFIG_HID_PICOLCD_LCD=y
CONFIG_HID_PICOLCD_LEDS=y
# CONFIG_HID_PLANTRONICS is not set
CONFIG_HID_RAZER=m
# CONFIG_HID_PRIMAX is not set
CONFIG_HID_SAITEK=m
CONFIG_HID_SEMITEK=m
# CONFIG_HID_SPEEDLINK is not set
# CONFIG_HID_STEAM is not set
CONFIG_HID_STEELSERIES=m
# CONFIG_HID_SUNPLUS is not set
CONFIG_HID_RMI=m
CONFIG_HID_GREENASIA=m
# CONFIG_GREENASIA_FF is not set
CONFIG_HID_SMARTJOYPLUS=m
CONFIG_SMARTJOYPLUS_FF=y
CONFIG_HID_TIVO=m
CONFIG_HID_TOPSEED=m
# CONFIG_HID_THINGM is not set
# CONFIG_HID_UDRAW_PS3 is not set
CONFIG_HID_WIIMOTE=m
CONFIG_HID_XINMO=m
CONFIG_HID_ZEROPLUS=m
# CONFIG_ZEROPLUS_FF is not set
# CONFIG_HID_ZYDACRON is not set
# CONFIG_HID_SENSOR_HUB is not set
# CONFIG_HID_ALPS is not set
# end of Special HID drivers

#
# I2C HID support
#
# end of I2C HID support

#
# Intel ISH HID support
#
# end of Intel ISH HID support

#
# AMD SFH HID Support
#
# CONFIG_AMD_SFH_HID is not set
# end of AMD SFH HID Support
# end of HID support

CONFIG_USB_OHCI_LITTLE_ENDIAN=y
# CONFIG_USB_SUPPORT is not set
CONFIG_MMC=m
CONFIG_MMC_BLOCK=m
CONFIG_MMC_BLOCK_MINORS=8
# CONFIG_SDIO_UART is not set
CONFIG_MMC_TEST=m
CONFIG_MMC_CRYPTO=y

#
# MMC/SD/SDIO Host Controller Drivers
#
CONFIG_MMC_DEBUG=y
# CONFIG_MMC_SDHCI is not set
# CONFIG_MMC_MESON_GX is not set
CONFIG_MMC_MOXART=m
# CONFIG_MMC_OMAP_HS is not set
CONFIG_MMC_TIFM_SD=m
CONFIG_MMC_DAVINCI=m
# CONFIG_MMC_SPI is not set
# CONFIG_MMC_S3C is not set
# CONFIG_MMC_SDRICOH_CS is not set
# CONFIG_MMC_TMIO is not set
# CONFIG_MMC_SDHI is not set
CONFIG_MMC_CB710=m
CONFIG_MMC_VIA_SDMMC=m
CONFIG_MMC_DW=m
CONFIG_MMC_DW_PLTFM=m
CONFIG_MMC_DW_BLUEFIELD=m
CONFIG_MMC_DW_EXYNOS=m
# CONFIG_MMC_DW_HI3798CV200 is not set
CONFIG_MMC_DW_K3=m
CONFIG_MMC_DW_PCI=m
CONFIG_MMC_SH_MMCIF=m
CONFIG_MMC_USDHI6ROL0=m
# CONFIG_MMC_SUNXI is not set
# CONFIG_MMC_CQHCI is not set
CONFIG_MMC_HSQ=m
# CONFIG_MMC_TOSHIBA_PCI is not set
CONFIG_MMC_BCM2835=m
# CONFIG_MMC_MTK is not set
# CONFIG_MMC_OWL is not set
# CONFIG_MMC_LITEX is not set
# CONFIG_SCSI_UFSHCD is not set
CONFIG_MEMSTICK=y
# CONFIG_MEMSTICK_DEBUG is not set

#
# MemoryStick drivers
#
# CONFIG_MEMSTICK_UNSAFE_RESUME is not set
CONFIG_MSPRO_BLOCK=m
CONFIG_MS_BLOCK=y

#
# MemoryStick Host Controller Drivers
#
CONFIG_MEMSTICK_TIFM_MS=m
CONFIG_MEMSTICK_JMICRON_38X=m
CONFIG_MEMSTICK_R592=m
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
CONFIG_LEDS_CLASS_FLASH=y
# CONFIG_LEDS_CLASS_MULTICOLOR is not set
CONFIG_LEDS_BRIGHTNESS_HW_CHANGED=y

#
# LED drivers
#
CONFIG_LEDS_ARIEL=m
# CONFIG_LEDS_LM3530 is not set
CONFIG_LEDS_LM3532=y
CONFIG_LEDS_LM3533=y
CONFIG_LEDS_LM3642=y
CONFIG_LEDS_MT6323=m
CONFIG_LEDS_S3C24XX=y
CONFIG_LEDS_COBALT_QUBE=y
CONFIG_LEDS_COBALT_RAQ=y
CONFIG_LEDS_PCA9532=m
CONFIG_LEDS_PCA9532_GPIO=y
# CONFIG_LEDS_GPIO is not set
CONFIG_LEDS_LP3944=m
# CONFIG_LEDS_LP3952 is not set
CONFIG_LEDS_LP50XX=m
# CONFIG_LEDS_LP8788 is not set
CONFIG_LEDS_PCA955X=m
# CONFIG_LEDS_PCA955X_GPIO is not set
# CONFIG_LEDS_PCA963X is not set
CONFIG_LEDS_WM831X_STATUS=m
CONFIG_LEDS_WM8350=m
# CONFIG_LEDS_DA9052 is not set
CONFIG_LEDS_DAC124S085=y
# CONFIG_LEDS_PWM is not set
CONFIG_LEDS_REGULATOR=y
CONFIG_LEDS_BD2802=m
CONFIG_LEDS_LT3593=y
# CONFIG_LEDS_ADP5520 is not set
CONFIG_LEDS_MC13783=m
CONFIG_LEDS_NS2=y
CONFIG_LEDS_ASIC3=y
CONFIG_LEDS_TCA6507=y
CONFIG_LEDS_TLC591XX=m
CONFIG_LEDS_MAX77650=m
CONFIG_LEDS_LM355x=y
# CONFIG_LEDS_OT200 is not set
CONFIG_LEDS_MENF21BMC=m
CONFIG_LEDS_IS31FL319X=m

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
# CONFIG_LEDS_BLINKM is not set
CONFIG_LEDS_PM8058=m
CONFIG_LEDS_MLXREG=m
# CONFIG_LEDS_USER is not set
CONFIG_LEDS_TI_LMU_COMMON=y
CONFIG_LEDS_LM36274=m
CONFIG_LEDS_IP30=y
# CONFIG_LEDS_ACER_A500 is not set

#
# Flash and Torch LED drivers
#
CONFIG_LEDS_AS3645A=y
CONFIG_LEDS_LM3601X=m
CONFIG_LEDS_RT8515=m
CONFIG_LEDS_SGM3140=y

#
# RGB LED drivers
#

#
# LED Triggers
#
CONFIG_LEDS_TRIGGERS=y
# CONFIG_LEDS_TRIGGER_TIMER is not set
CONFIG_LEDS_TRIGGER_ONESHOT=m
CONFIG_LEDS_TRIGGER_DISK=y
# CONFIG_LEDS_TRIGGER_MTD is not set
CONFIG_LEDS_TRIGGER_HEARTBEAT=m
CONFIG_LEDS_TRIGGER_BACKLIGHT=y
CONFIG_LEDS_TRIGGER_CPU=y
CONFIG_LEDS_TRIGGER_ACTIVITY=m
CONFIG_LEDS_TRIGGER_GPIO=m
CONFIG_LEDS_TRIGGER_DEFAULT_ON=m

#
# iptables trigger is under Netfilter config (LED target)
#
# CONFIG_LEDS_TRIGGER_TRANSIENT is not set
# CONFIG_LEDS_TRIGGER_CAMERA is not set
# CONFIG_LEDS_TRIGGER_PANIC is not set
CONFIG_LEDS_TRIGGER_NETDEV=y
# CONFIG_LEDS_TRIGGER_PATTERN is not set
# CONFIG_LEDS_TRIGGER_AUDIO is not set
CONFIG_LEDS_TRIGGER_TTY=m

#
# Simple LED drivers
#
# CONFIG_ACCESSIBILITY is not set
CONFIG_INFINIBAND=m
CONFIG_INFINIBAND_USER_MAD=m
# CONFIG_INFINIBAND_USER_ACCESS is not set
# CONFIG_INFINIBAND_ADDR_TRANS is not set
CONFIG_INFINIBAND_VIRT_DMA=y
CONFIG_MLX4_INFINIBAND=m
CONFIG_MLX5_INFINIBAND=m
CONFIG_INFINIBAND_MTHCA=m
# CONFIG_INFINIBAND_MTHCA_DEBUG is not set
CONFIG_INFINIBAND_OCRDMA=m
# CONFIG_RDMA_RXE is not set
CONFIG_RDMA_SIW=m
CONFIG_INFINIBAND_IPOIB=m
CONFIG_INFINIBAND_IPOIB_CM=y
# CONFIG_INFINIBAND_IPOIB_DEBUG is not set
# CONFIG_DMADEVICES is not set

#
# DMABUF options
#
CONFIG_SYNC_FILE=y
CONFIG_SW_SYNC=y
CONFIG_UDMABUF=y
# CONFIG_DMABUF_MOVE_NOTIFY is not set
# CONFIG_DMABUF_DEBUG is not set
CONFIG_DMABUF_SELFTESTS=m
CONFIG_DMABUF_HEAPS=y
CONFIG_DMABUF_SYSFS_STATS=y
CONFIG_DMABUF_HEAPS_SYSTEM=y
CONFIG_DMABUF_HEAPS_CMA=y
# end of DMABUF options

# CONFIG_AUXDISPLAY is not set
# CONFIG_PANEL is not set
CONFIG_UIO=m
# CONFIG_UIO_CIF is not set
CONFIG_UIO_PDRV_GENIRQ=m
CONFIG_UIO_DMEM_GENIRQ=m
CONFIG_UIO_AEC=m
CONFIG_UIO_SERCOS3=m
# CONFIG_UIO_PCI_GENERIC is not set
CONFIG_UIO_NETX=m
CONFIG_UIO_PRUSS=m
# CONFIG_UIO_MF624 is not set
CONFIG_UIO_DFL=m
CONFIG_VFIO=y
CONFIG_VFIO_IOMMU_TYPE1=y
# CONFIG_VFIO_NOIOMMU is not set
# CONFIG_VFIO_PCI is not set
CONFIG_VFIO_PCI_ZDEV_KVM=y
# CONFIG_VFIO_PLATFORM is not set
# CONFIG_VFIO_MDEV is not set
CONFIG_VIRT_DRIVERS=y
CONFIG_VIRTIO_ANCHOR=y
CONFIG_VIRTIO=y
CONFIG_VIRTIO_PCI_LIB=y
CONFIG_VIRTIO_PCI_LIB_LEGACY=y
CONFIG_VIRTIO_MENU=y
CONFIG_VIRTIO_PCI=y
CONFIG_VIRTIO_PCI_LEGACY=y
# CONFIG_VIRTIO_PMEM is not set
CONFIG_VIRTIO_BALLOON=y
CONFIG_VIRTIO_INPUT=m
# CONFIG_VIRTIO_MMIO is not set
# CONFIG_VDPA is not set
CONFIG_VHOST_IOTLB=m
CONFIG_VHOST=m
CONFIG_VHOST_MENU=y
# CONFIG_VHOST_NET is not set
CONFIG_VHOST_SCSI=m
# CONFIG_VHOST_CROSS_ENDIAN_LEGACY is not set

#
# Microsoft Hyper-V guest support
#
# end of Microsoft Hyper-V guest support

CONFIG_GREYBUS=m
CONFIG_COMEDI=m
CONFIG_COMEDI_DEBUG=y
CONFIG_COMEDI_DEFAULT_BUF_SIZE_KB=2048
CONFIG_COMEDI_DEFAULT_BUF_MAXSIZE_KB=20480
# CONFIG_COMEDI_MISC_DRIVERS is not set
# CONFIG_COMEDI_ISA_DRIVERS is not set
CONFIG_COMEDI_PCI_DRIVERS=m
# CONFIG_COMEDI_8255_PCI is not set
CONFIG_COMEDI_ADDI_WATCHDOG=m
CONFIG_COMEDI_ADDI_APCI_1032=m
CONFIG_COMEDI_ADDI_APCI_1500=m
# CONFIG_COMEDI_ADDI_APCI_1516 is not set
CONFIG_COMEDI_ADDI_APCI_1564=m
# CONFIG_COMEDI_ADDI_APCI_16XX is not set
CONFIG_COMEDI_ADDI_APCI_2032=m
# CONFIG_COMEDI_ADDI_APCI_2200 is not set
# CONFIG_COMEDI_ADDI_APCI_3120 is not set
CONFIG_COMEDI_ADDI_APCI_3501=m
CONFIG_COMEDI_ADDI_APCI_3XXX=m
CONFIG_COMEDI_ADL_PCI6208=m
CONFIG_COMEDI_ADL_PCI7X3X=m
# CONFIG_COMEDI_ADL_PCI8164 is not set
CONFIG_COMEDI_ADL_PCI9111=m
# CONFIG_COMEDI_ADL_PCI9118 is not set
# CONFIG_COMEDI_ADV_PCI1710 is not set
CONFIG_COMEDI_ADV_PCI1720=m
CONFIG_COMEDI_ADV_PCI1723=m
CONFIG_COMEDI_ADV_PCI1724=m
# CONFIG_COMEDI_ADV_PCI1760 is not set
CONFIG_COMEDI_ADV_PCI_DIO=m
CONFIG_COMEDI_AMPLC_DIO200_PCI=m
CONFIG_COMEDI_AMPLC_PC236_PCI=m
CONFIG_COMEDI_AMPLC_PC263_PCI=m
# CONFIG_COMEDI_AMPLC_PCI224 is not set
CONFIG_COMEDI_AMPLC_PCI230=m
CONFIG_COMEDI_CONTEC_PCI_DIO=m
# CONFIG_COMEDI_DAS08_PCI is not set
CONFIG_COMEDI_DT3000=m
# CONFIG_COMEDI_DYNA_PCI10XX is not set
# CONFIG_COMEDI_GSC_HPDI is not set
CONFIG_COMEDI_MF6X4=m
CONFIG_COMEDI_ICP_MULTI=m
CONFIG_COMEDI_DAQBOARD2000=m
# CONFIG_COMEDI_JR3_PCI is not set
CONFIG_COMEDI_KE_COUNTER=m
# CONFIG_COMEDI_CB_PCIDAS64 is not set
# CONFIG_COMEDI_CB_PCIDAS is not set
CONFIG_COMEDI_CB_PCIDDA=m
CONFIG_COMEDI_CB_PCIMDAS=m
CONFIG_COMEDI_CB_PCIMDDA=m
CONFIG_COMEDI_ME4000=m
CONFIG_COMEDI_ME_DAQ=m
CONFIG_COMEDI_NI_6527=m
CONFIG_COMEDI_NI_65XX=m
# CONFIG_COMEDI_NI_660X is not set
CONFIG_COMEDI_NI_670X=m
# CONFIG_COMEDI_NI_LABPC_PCI is not set
CONFIG_COMEDI_NI_PCIDIO=m
# CONFIG_COMEDI_NI_PCIMIO is not set
CONFIG_COMEDI_RTD520=m
CONFIG_COMEDI_S626=m
CONFIG_COMEDI_MITE=m
CONFIG_COMEDI_PCMCIA_DRIVERS=m
# CONFIG_COMEDI_CB_DAS16_CS is not set
# CONFIG_COMEDI_DAS08_CS is not set
CONFIG_COMEDI_NI_DAQ_700_CS=m
CONFIG_COMEDI_NI_DAQ_DIO24_CS=m
CONFIG_COMEDI_NI_LABPC_CS=m
CONFIG_COMEDI_NI_MIO_CS=m
CONFIG_COMEDI_QUATECH_DAQP_CS=m
CONFIG_COMEDI_8254=m
CONFIG_COMEDI_8255=m
# CONFIG_COMEDI_8255_SA is not set
# CONFIG_COMEDI_KCOMEDILIB is not set
CONFIG_COMEDI_AMPLC_DIO200=m
CONFIG_COMEDI_AMPLC_PC236=m
CONFIG_COMEDI_NI_LABPC=m
CONFIG_COMEDI_NI_TIO=m
CONFIG_COMEDI_NI_ROUTING=m
# CONFIG_COMEDI_TESTS is not set
# CONFIG_STAGING is not set
CONFIG_GOLDFISH=y
CONFIG_GOLDFISH_PIPE=m
# CONFIG_CHROME_PLATFORMS is not set
CONFIG_MELLANOX_PLATFORM=y
CONFIG_MLXREG_HOTPLUG=m
CONFIG_MLXREG_IO=m
CONFIG_MLXREG_LC=m
CONFIG_NVSW_SN2201=m
# CONFIG_OLPC_XO175 is not set
# CONFIG_SURFACE_PLATFORMS is not set
CONFIG_HAVE_CLK=y
CONFIG_HAVE_CLK_PREPARE=y
CONFIG_COMMON_CLK=y
CONFIG_COMMON_CLK_WM831X=y

#
# Clock driver for ARM Reference designs
#
CONFIG_CLK_ICST=y
# CONFIG_CLK_SP810 is not set
# end of Clock driver for ARM Reference designs

CONFIG_CLK_HSDK=y
CONFIG_LMK04832=y
CONFIG_COMMON_CLK_APPLE_NCO=y
CONFIG_COMMON_CLK_MAX77686=m
# CONFIG_COMMON_CLK_MAX9485 is not set
CONFIG_COMMON_CLK_HI655X=m
# CONFIG_COMMON_CLK_SCMI is not set
# CONFIG_COMMON_CLK_SCPI is not set
CONFIG_COMMON_CLK_SI5341=y
# CONFIG_COMMON_CLK_SI5351 is not set
CONFIG_COMMON_CLK_SI544=m
CONFIG_COMMON_CLK_BM1880=y
# CONFIG_COMMON_CLK_CDCE706 is not set
CONFIG_COMMON_CLK_TPS68470=y
CONFIG_COMMON_CLK_CS2000_CP=y
# CONFIG_COMMON_CLK_FSL_FLEXSPI is not set
# CONFIG_COMMON_CLK_FSL_SAI is not set
# CONFIG_COMMON_CLK_GEMINI is not set
CONFIG_COMMON_CLK_ASPEED=y
# CONFIG_COMMON_CLK_S2MPS11 is not set
CONFIG_CLK_TWL6040=y
# CONFIG_CLK_LS1028A_PLLDIG is not set
# CONFIG_COMMON_CLK_XGENE is not set
# CONFIG_COMMON_CLK_PALMAS is not set
# CONFIG_COMMON_CLK_PWM is not set
CONFIG_COMMON_CLK_OXNAS=y
CONFIG_COMMON_CLK_MMP2_AUDIO=m
CONFIG_CLK_ACTIONS=y
# CONFIG_CLK_OWL_S500 is not set
CONFIG_CLK_OWL_S700=y
CONFIG_CLK_OWL_S900=y
CONFIG_CLK_ANALOGBITS_WRPLL_CLN28HPC=y
# CONFIG_CLK_BAIKAL_T1 is not set
# CONFIG_CLK_BCM2711_DVP is not set
# CONFIG_CLK_BCM2835 is not set
# CONFIG_CLK_BCM_63XX is not set
# CONFIG_CLK_BCM_63XX_GATE is not set
CONFIG_CLK_BCM_KONA=y
CONFIG_COMMON_CLK_IPROC=y
CONFIG_CLK_BCM_CYGNUS=y
# CONFIG_CLK_BCM_HR2 is not set
CONFIG_CLK_BCM_NSP=y
# CONFIG_CLK_BCM_NS2 is not set
CONFIG_CLK_BCM_SR=y
CONFIG_CLK_RASPBERRYPI=y
CONFIG_COMMON_CLK_HI3516CV300=y
CONFIG_COMMON_CLK_HI3519=m
# CONFIG_COMMON_CLK_HI3559A is not set
# CONFIG_COMMON_CLK_HI3660 is not set
CONFIG_COMMON_CLK_HI3670=y
# CONFIG_COMMON_CLK_HI3798CV200 is not set
CONFIG_COMMON_CLK_HI6220=y
CONFIG_RESET_HISI=y
CONFIG_STUB_CLK_HI6220=y
CONFIG_STUB_CLK_HI3660=y
CONFIG_COMMON_CLK_BOSTON=y
CONFIG_MXC_CLK=y
CONFIG_CLK_IMX8MM=y
CONFIG_CLK_IMX8MN=y
# CONFIG_CLK_IMX8MP is not set
# CONFIG_CLK_IMX8MQ is not set
# CONFIG_CLK_IMX8ULP is not set
CONFIG_CLK_IMX93=m

#
# Ingenic SoCs drivers
#
CONFIG_INGENIC_CGU_COMMON=y
# CONFIG_INGENIC_CGU_JZ4740 is not set
# CONFIG_INGENIC_CGU_JZ4725B is not set
CONFIG_INGENIC_CGU_JZ4760=y
# CONFIG_INGENIC_CGU_JZ4770 is not set
CONFIG_INGENIC_CGU_JZ4780=y
CONFIG_INGENIC_CGU_X1000=y
# CONFIG_INGENIC_CGU_X1830 is not set
# CONFIG_INGENIC_TCU_CLK is not set
# end of Ingenic SoCs drivers

CONFIG_TI_SYSCON_CLK=y

#
# Clock driver for MediaTek SoC
#
CONFIG_COMMON_CLK_MEDIATEK=y
# CONFIG_COMMON_CLK_MT2701 is not set
# CONFIG_COMMON_CLK_MT2712 is not set
# CONFIG_COMMON_CLK_MT6765 is not set
CONFIG_COMMON_CLK_MT6779=m
CONFIG_COMMON_CLK_MT6779_MMSYS=m
# CONFIG_COMMON_CLK_MT6779_IMGSYS is not set
CONFIG_COMMON_CLK_MT6779_IPESYS=m
CONFIG_COMMON_CLK_MT6779_CAMSYS=m
# CONFIG_COMMON_CLK_MT6779_VDECSYS is not set
CONFIG_COMMON_CLK_MT6779_VENCSYS=m
# CONFIG_COMMON_CLK_MT6779_MFGCFG is not set
# CONFIG_COMMON_CLK_MT6779_AUDSYS is not set
CONFIG_COMMON_CLK_MT6797=y
CONFIG_COMMON_CLK_MT6797_MMSYS=y
# CONFIG_COMMON_CLK_MT6797_IMGSYS is not set
# CONFIG_COMMON_CLK_MT6797_VDECSYS is not set
# CONFIG_COMMON_CLK_MT6797_VENCSYS is not set
# CONFIG_COMMON_CLK_MT7622 is not set
CONFIG_COMMON_CLK_MT7629=y
# CONFIG_COMMON_CLK_MT7629_ETHSYS is not set
CONFIG_COMMON_CLK_MT7629_HIFSYS=y
CONFIG_COMMON_CLK_MT7986=y
CONFIG_COMMON_CLK_MT7986_ETHSYS=y
# CONFIG_COMMON_CLK_MT8135 is not set
CONFIG_COMMON_CLK_MT8167=y
CONFIG_COMMON_CLK_MT8167_AUDSYS=y
# CONFIG_COMMON_CLK_MT8167_IMGSYS is not set
# CONFIG_COMMON_CLK_MT8167_MFGCFG is not set
# CONFIG_COMMON_CLK_MT8167_MMSYS is not set
CONFIG_COMMON_CLK_MT8167_VDECSYS=y
CONFIG_COMMON_CLK_MT8173=y
# CONFIG_COMMON_CLK_MT8173_MMSYS is not set
# CONFIG_COMMON_CLK_MT8183 is not set
# CONFIG_COMMON_CLK_MT8186 is not set
CONFIG_COMMON_CLK_MT8192=y
# CONFIG_COMMON_CLK_MT8192_AUDSYS is not set
CONFIG_COMMON_CLK_MT8192_CAMSYS=y
# CONFIG_COMMON_CLK_MT8192_IMGSYS is not set
# CONFIG_COMMON_CLK_MT8192_IMP_IIC_WRAP is not set
CONFIG_COMMON_CLK_MT8192_IPESYS=y
CONFIG_COMMON_CLK_MT8192_MDPSYS=y
CONFIG_COMMON_CLK_MT8192_MFGCFG=y
# CONFIG_COMMON_CLK_MT8192_MMSYS is not set
# CONFIG_COMMON_CLK_MT8192_MSDC is not set
CONFIG_COMMON_CLK_MT8192_SCP_ADSP=y
# CONFIG_COMMON_CLK_MT8192_VDECSYS is not set
CONFIG_COMMON_CLK_MT8192_VENCSYS=y
CONFIG_COMMON_CLK_MT8195=y
CONFIG_COMMON_CLK_MT8516=y
CONFIG_COMMON_CLK_MT8516_AUDSYS=y
# end of Clock driver for MediaTek SoC

#
# Clock support for Amlogic platforms
#
# end of Clock support for Amlogic platforms

CONFIG_MSTAR_MSC313_MPLL=y
CONFIG_MCHP_CLK_MPFS=y
CONFIG_COMMON_CLK_PISTACHIO=y
# CONFIG_CLK_MT7621 is not set
# CONFIG_CLK_RENESAS is not set
CONFIG_COMMON_CLK_SAMSUNG=y
# CONFIG_S3C64XX_COMMON_CLK is not set
CONFIG_S5PV210_COMMON_CLK=y
# CONFIG_EXYNOS_3250_COMMON_CLK is not set
# CONFIG_EXYNOS_4_COMMON_CLK is not set
# CONFIG_EXYNOS_5250_COMMON_CLK is not set
CONFIG_EXYNOS_5260_COMMON_CLK=y
# CONFIG_EXYNOS_5410_COMMON_CLK is not set
CONFIG_EXYNOS_5420_COMMON_CLK=y
# CONFIG_EXYNOS_ARM64_COMMON_CLK is not set
CONFIG_EXYNOS_AUDSS_CLK_CON=m
# CONFIG_EXYNOS_CLKOUT is not set
# CONFIG_S3C2410_COMMON_CLK is not set
CONFIG_S3C2412_COMMON_CLK=y
CONFIG_S3C2443_COMMON_CLK=y
CONFIG_CLK_SIFIVE=y
CONFIG_CLK_SIFIVE_PRCI=y
CONFIG_CLK_INTEL_SOCFPGA=y
CONFIG_CLK_INTEL_SOCFPGA32=y
CONFIG_CLK_INTEL_SOCFPGA64=y
CONFIG_SPRD_COMMON_CLK=m
CONFIG_SPRD_SC9860_CLK=m
# CONFIG_SPRD_SC9863A_CLK is not set
# CONFIG_CLK_STARFIVE_JH7100 is not set
# CONFIG_CLK_SUNXI is not set
CONFIG_SUNXI_CCU=m
# CONFIG_SUNIV_F1C100S_CCU is not set
CONFIG_SUN20I_D1_CCU=m
CONFIG_SUN20I_D1_R_CCU=m
# CONFIG_SUN50I_A64_CCU is not set
# CONFIG_SUN50I_A100_CCU is not set
CONFIG_SUN50I_A100_R_CCU=m
CONFIG_SUN50I_H6_CCU=m
CONFIG_SUN50I_H616_CCU=m
CONFIG_SUN50I_H6_R_CCU=m
CONFIG_SUN4I_A10_CCU=m
CONFIG_SUN6I_A31_CCU=m
CONFIG_SUN6I_RTC_CCU=m
CONFIG_SUN8I_A23_CCU=m
CONFIG_SUN8I_A33_CCU=m
CONFIG_SUN8I_A83T_CCU=m
CONFIG_SUN8I_H3_CCU=m
# CONFIG_SUN8I_V3S_CCU is not set
CONFIG_SUN8I_DE2_CCU=m
CONFIG_SUN8I_R40_CCU=m
CONFIG_SUN9I_A80_CCU=m
CONFIG_SUN8I_R_CCU=m
CONFIG_COMMON_CLK_TI_ADPLL=y
CONFIG_COMMON_CLK_VISCONTI=y
CONFIG_XILINX_VCU=m
CONFIG_COMMON_CLK_ZYNQMP=y
CONFIG_HWSPINLOCK=y
# CONFIG_HWSPINLOCK_OMAP is not set
# CONFIG_HWSPINLOCK_QCOM is not set
CONFIG_HWSPINLOCK_SPRD=y
CONFIG_HWSPINLOCK_STM32=y
# CONFIG_HWSPINLOCK_SUN6I is not set
# CONFIG_HSEM_U8500 is not set

#
# Clock Source drivers
#
CONFIG_TIMER_OF=y
CONFIG_TIMER_PROBE=y
CONFIG_CLKSRC_MMIO=y
CONFIG_BCM2835_TIMER=y
# CONFIG_BCM_KONA_TIMER is not set
CONFIG_DAVINCI_TIMER=y
CONFIG_DIGICOLOR_TIMER=y
CONFIG_OMAP_DM_TIMER=y
CONFIG_DW_APB_TIMER=y
# CONFIG_FTTMR010_TIMER is not set
# CONFIG_IXP4XX_TIMER is not set
# CONFIG_MESON6_TIMER is not set
# CONFIG_OWL_TIMER is not set
CONFIG_RDA_TIMER=y
# CONFIG_SUN4I_TIMER is not set
# CONFIG_SUN5I_HSTIMER is not set
CONFIG_TEGRA_TIMER=y
CONFIG_VT8500_TIMER=y
CONFIG_NPCM7XX_TIMER=y
CONFIG_CADENCE_TTC_TIMER=y
# CONFIG_ASM9260_TIMER is not set
# CONFIG_CLKSRC_DBX500_PRCMU is not set
# CONFIG_CLPS711X_TIMER is not set
# CONFIG_MXS_TIMER is not set
# CONFIG_NSPIRE_TIMER is not set
CONFIG_INTEGRATOR_AP_TIMER=y
CONFIG_CLKSRC_PISTACHIO=y
# CONFIG_CLKSRC_STM32_LP is not set
# CONFIG_ARMV7M_SYSTICK is not set
# CONFIG_ATMEL_PIT is not set
# CONFIG_ATMEL_ST is not set
CONFIG_CLKSRC_SAMSUNG_PWM=y
CONFIG_FSL_FTM_TIMER=y
# CONFIG_OXNAS_RPS_TIMER is not set
# CONFIG_MTK_TIMER is not set
CONFIG_SPRD_TIMER=y
CONFIG_SH_TIMER_CMT=y
# CONFIG_SH_TIMER_MTU2 is not set
# CONFIG_RENESAS_OSTM is not set
# CONFIG_SH_TIMER_TMU is not set
CONFIG_EM_TIMER_STI=y
CONFIG_CLKSRC_PXA=y
CONFIG_TIMER_IMX_SYS_CTR=y
# CONFIG_CLKSRC_ST_LPC is not set
# CONFIG_GXP_TIMER is not set
CONFIG_MSC313E_TIMER=y
CONFIG_INGENIC_TIMER=y
# CONFIG_INGENIC_SYSOST is not set
CONFIG_INGENIC_OST=y
CONFIG_MICROCHIP_PIT64B=y
# end of Clock Source drivers

CONFIG_MAILBOX=y
CONFIG_IMX_MBOX=m
# CONFIG_ROCKCHIP_MBOX is not set
# CONFIG_ALTERA_MBOX is not set
CONFIG_POLARFIRE_SOC_MAILBOX=y
CONFIG_QCOM_APCS_IPC=m
# CONFIG_BCM_PDC_MBOX is not set
CONFIG_STM32_IPCC=m
CONFIG_MTK_ADSP_MBOX=m
CONFIG_MTK_CMDQ_MBOX=m
CONFIG_SUN6I_MSGBOX=y
# CONFIG_SPRD_MBOX is not set
CONFIG_QCOM_IPCC=y
CONFIG_IOMMU_API=y
CONFIG_IOMMU_SUPPORT=y

#
# Generic IOMMU Pagetable Support
#
CONFIG_IOMMU_IO_PGTABLE=y
CONFIG_IOMMU_IO_PGTABLE_LPAE=y
CONFIG_IOMMU_IO_PGTABLE_LPAE_SELFTEST=y
CONFIG_IOMMU_IO_PGTABLE_ARMV7S=y
# CONFIG_IOMMU_IO_PGTABLE_ARMV7S_SELFTEST is not set
# end of Generic IOMMU Pagetable Support

# CONFIG_IOMMU_DEBUGFS is not set
CONFIG_IOMMU_DEFAULT_DMA_STRICT=y
# CONFIG_IOMMU_DEFAULT_DMA_LAZY is not set
# CONFIG_IOMMU_DEFAULT_PASSTHROUGH is not set
# CONFIG_OMAP_IOMMU is not set
# CONFIG_ROCKCHIP_IOMMU is not set
CONFIG_SUN50I_IOMMU=y
# CONFIG_IPMMU_VMSA is not set
# CONFIG_APPLE_DART is not set
CONFIG_ARM_SMMU=m
CONFIG_ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT=y
CONFIG_S390_IOMMU=y
CONFIG_S390_CCW_IOMMU=y
# CONFIG_S390_AP_IOMMU is not set
CONFIG_MTK_IOMMU=y
CONFIG_QCOM_IOMMU=y
CONFIG_SPRD_IOMMU=m

#
# Remoteproc drivers
#
CONFIG_REMOTEPROC=y
# CONFIG_REMOTEPROC_CDEV is not set
CONFIG_INGENIC_VPU_RPROC=m
CONFIG_MTK_SCP=y
CONFIG_MESON_MX_AO_ARC_REMOTEPROC=y
CONFIG_RCAR_REMOTEPROC=y
# end of Remoteproc drivers

#
# Rpmsg drivers
#
CONFIG_RPMSG=y
# CONFIG_RPMSG_CHAR is not set
# CONFIG_RPMSG_CTRL is not set
CONFIG_RPMSG_NS=y
CONFIG_RPMSG_MTK_SCP=y
CONFIG_RPMSG_QCOM_GLINK=m
CONFIG_RPMSG_QCOM_GLINK_RPM=m
CONFIG_RPMSG_VIRTIO=m
# end of Rpmsg drivers

#
# SOC (System On Chip) specific Drivers
#

#
# Amlogic SoC drivers
#
CONFIG_MESON_CANVAS=y
# CONFIG_MESON_CLK_MEASURE is not set
# CONFIG_MESON_GX_SOCINFO is not set
CONFIG_MESON_MX_SOCINFO=y
# end of Amlogic SoC drivers

#
# Apple SoC drivers
#
# CONFIG_APPLE_RTKIT is not set
# CONFIG_APPLE_SART is not set
# end of Apple SoC drivers

#
# ASPEED SoC drivers
#
CONFIG_ASPEED_LPC_CTRL=y
CONFIG_ASPEED_LPC_SNOOP=y
CONFIG_ASPEED_UART_ROUTING=m
CONFIG_ASPEED_P2A_CTRL=m
CONFIG_ASPEED_SOCINFO=y
# end of ASPEED SoC drivers

CONFIG_AT91_SOC_ID=y
CONFIG_AT91_SOC_SFR=y

#
# Broadcom SoC drivers
#
# CONFIG_SOC_BCM63XX is not set
CONFIG_SOC_BRCMSTB=y
# end of Broadcom SoC drivers

#
# NXP/Freescale QorIQ SoC drivers
#
# end of NXP/Freescale QorIQ SoC drivers

#
# fujitsu SoC drivers
#
# end of fujitsu SoC drivers

#
# i.MX SoC drivers
#
CONFIG_SOC_IMX8M=y
# end of i.MX SoC drivers

#
# IXP4xx SoC drivers
#
CONFIG_IXP4XX_QMGR=y
CONFIG_IXP4XX_NPE=y
# end of IXP4xx SoC drivers

#
# Enable LiteX SoC Builder specific drivers
#
# CONFIG_LITEX_SOC_CONTROLLER is not set
# end of Enable LiteX SoC Builder specific drivers

#
# MediaTek SoC drivers
#
CONFIG_MTK_CMDQ=m
CONFIG_MTK_DEVAPC=y
CONFIG_MTK_INFRACFG=y
# CONFIG_MTK_PMIC_WRAP is not set
# CONFIG_MTK_SCPSYS is not set
CONFIG_MTK_MMSYS=y
CONFIG_MTK_SVS=m
# end of MediaTek SoC drivers

CONFIG_POLARFIRE_SOC_SYS_CTRL=y

#
# Qualcomm SoC drivers
#
# CONFIG_QCOM_GENI_SE is not set
# CONFIG_QCOM_GSBI is not set
CONFIG_QCOM_LLCC=m
CONFIG_QCOM_RPMH=y
# CONFIG_QCOM_SMEM is not set
CONFIG_QCOM_SMD_RPM=y
# CONFIG_QCOM_SPM is not set
# CONFIG_QCOM_WCNSS_CTRL is not set
# CONFIG_QCOM_APR is not set
# CONFIG_QCOM_ICC_BWMON is not set
# end of Qualcomm SoC drivers

CONFIG_SOC_RENESAS=y
# CONFIG_RST_RCAR is not set
CONFIG_SYSC_RCAR=y
CONFIG_SYSC_RCAR_GEN4=y
CONFIG_SYSC_R8A77995=y
CONFIG_SYSC_R8A7794=y
# CONFIG_SYSC_R8A77990 is not set
# CONFIG_SYSC_R8A7779 is not set
CONFIG_SYSC_R8A7790=y
# CONFIG_SYSC_R8A7795 is not set
CONFIG_SYSC_R8A7791=y
# CONFIG_SYSC_R8A77965 is not set
CONFIG_SYSC_R8A77960=y
CONFIG_SYSC_R8A77961=y
CONFIG_SYSC_R8A779F0=y
CONFIG_SYSC_R8A7792=y
# CONFIG_SYSC_R8A77980 is not set
# CONFIG_SYSC_R8A77970 is not set
# CONFIG_SYSC_R8A779A0 is not set
CONFIG_SYSC_R8A779G0=y
CONFIG_SYSC_RMOBILE=y
CONFIG_SYSC_R8A77470=y
CONFIG_SYSC_R8A7745=y
CONFIG_SYSC_R8A7742=y
CONFIG_SYSC_R8A7743=y
# CONFIG_SYSC_R8A774C0 is not set
# CONFIG_SYSC_R8A774E1 is not set
# CONFIG_SYSC_R8A774A1 is not set
# CONFIG_SYSC_R8A774B1 is not set
CONFIG_ROCKCHIP_GRF=y
CONFIG_SOC_SAMSUNG=y
# CONFIG_EXYNOS_CHIPID is not set
CONFIG_EXYNOS_USI=y
# CONFIG_EXYNOS_PM_DOMAINS is not set
CONFIG_EXYNOS_REGULATOR_COUPLER=y
# CONFIG_SOC_TEGRA20_VOLTAGE_COUPLER is not set
# CONFIG_SOC_TEGRA30_VOLTAGE_COUPLER is not set
# CONFIG_SOC_TI is not set
CONFIG_UX500_SOC_ID=y

#
# Xilinx SoC drivers
#
# end of Xilinx SoC drivers
# end of SOC (System On Chip) specific Drivers

CONFIG_PM_DEVFREQ=y

#
# DEVFREQ Governors
#
CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=y
CONFIG_DEVFREQ_GOV_PERFORMANCE=m
CONFIG_DEVFREQ_GOV_POWERSAVE=m
CONFIG_DEVFREQ_GOV_USERSPACE=y
CONFIG_DEVFREQ_GOV_PASSIVE=y

#
# DEVFREQ Drivers
#
CONFIG_ARM_EXYNOS_BUS_DEVFREQ=y
CONFIG_ARM_IMX_BUS_DEVFREQ=y
CONFIG_ARM_TEGRA_DEVFREQ=m
# CONFIG_ARM_MEDIATEK_CCI_DEVFREQ is not set
# CONFIG_ARM_SUN8I_A33_MBUS_DEVFREQ is not set
CONFIG_PM_DEVFREQ_EVENT=y
CONFIG_DEVFREQ_EVENT_EXYNOS_NOCP=y
CONFIG_DEVFREQ_EVENT_EXYNOS_PPMU=y
CONFIG_DEVFREQ_EVENT_ROCKCHIP_DFI=m
CONFIG_EXTCON=m

#
# Extcon Device Drivers
#
CONFIG_EXTCON_ADC_JACK=m
CONFIG_EXTCON_FSA9480=m
# CONFIG_EXTCON_GPIO is not set
CONFIG_EXTCON_MAX14577=m
CONFIG_EXTCON_MAX3355=m
CONFIG_EXTCON_MAX77693=m
CONFIG_EXTCON_MAX77843=m
CONFIG_EXTCON_PALMAS=m
CONFIG_EXTCON_PTN5150=m
# CONFIG_EXTCON_QCOM_SPMI_MISC is not set
CONFIG_EXTCON_RT8973A=m
CONFIG_EXTCON_SM5502=m
CONFIG_EXTCON_USB_GPIO=m
# CONFIG_EXTCON_USBC_TUSB320 is not set
CONFIG_MEMORY=y
CONFIG_DDR=y
CONFIG_BRCMSTB_DPFE=m
# CONFIG_BT1_L2_CTL is not set
# CONFIG_TI_EMIF is not set
CONFIG_FPGA_DFL_EMIF=m
# CONFIG_FSL_CORENET_CF is not set
# CONFIG_FSL_IFC is not set
CONFIG_MTK_SMI=y
# CONFIG_DA8XX_DDRCTL is not set
CONFIG_RENESAS_RPCIF=m
# CONFIG_STM32_FMC2_EBI is not set
CONFIG_SAMSUNG_MC=y
# CONFIG_EXYNOS5422_DMC is not set
# CONFIG_EXYNOS_SROM is not set
CONFIG_TEGRA_MC=y
CONFIG_TEGRA20_EMC=m
CONFIG_TEGRA30_EMC=m
# CONFIG_TEGRA124_EMC is not set
CONFIG_TEGRA210_EMC_TABLE=y
CONFIG_TEGRA210_EMC=y
CONFIG_IIO=m
CONFIG_IIO_BUFFER=y
CONFIG_IIO_BUFFER_CB=m
CONFIG_IIO_BUFFER_DMA=m
# CONFIG_IIO_BUFFER_DMAENGINE is not set
CONFIG_IIO_BUFFER_HW_CONSUMER=m
CONFIG_IIO_KFIFO_BUF=m
CONFIG_IIO_TRIGGERED_BUFFER=m
CONFIG_IIO_CONFIGFS=m
CONFIG_IIO_TRIGGER=y
CONFIG_IIO_CONSUMERS_PER_TRIGGER=2
# CONFIG_IIO_SW_DEVICE is not set
CONFIG_IIO_SW_TRIGGER=m
CONFIG_IIO_TRIGGERED_EVENT=m

#
# Accelerometers
#
CONFIG_ADIS16201=m
CONFIG_ADIS16209=m
CONFIG_ADXL313=m
CONFIG_ADXL313_I2C=m
CONFIG_ADXL313_SPI=m
CONFIG_ADXL345=m
# CONFIG_ADXL345_I2C is not set
CONFIG_ADXL345_SPI=m
CONFIG_ADXL355=m
CONFIG_ADXL355_I2C=m
# CONFIG_ADXL355_SPI is not set
CONFIG_ADXL367=m
# CONFIG_ADXL367_SPI is not set
CONFIG_ADXL367_I2C=m
CONFIG_ADXL372=m
# CONFIG_ADXL372_SPI is not set
CONFIG_ADXL372_I2C=m
CONFIG_BMA180=m
# CONFIG_BMA220 is not set
CONFIG_BMA400=m
CONFIG_BMA400_I2C=m
CONFIG_BMA400_SPI=m
CONFIG_BMC150_ACCEL=m
CONFIG_BMC150_ACCEL_I2C=m
CONFIG_BMC150_ACCEL_SPI=m
# CONFIG_BMI088_ACCEL is not set
CONFIG_DA280=m
CONFIG_DA311=m
CONFIG_DMARD06=m
# CONFIG_DMARD09 is not set
# CONFIG_DMARD10 is not set
CONFIG_FXLS8962AF=m
CONFIG_FXLS8962AF_I2C=m
CONFIG_FXLS8962AF_SPI=m
CONFIG_IIO_ST_ACCEL_3AXIS=m
CONFIG_IIO_ST_ACCEL_I2C_3AXIS=m
CONFIG_IIO_ST_ACCEL_SPI_3AXIS=m
# CONFIG_KXSD9 is not set
CONFIG_KXCJK1013=m
CONFIG_MC3230=m
CONFIG_MMA7455=m
# CONFIG_MMA7455_I2C is not set
CONFIG_MMA7455_SPI=m
# CONFIG_MMA7660 is not set
# CONFIG_MMA8452 is not set
CONFIG_MMA9551_CORE=m
CONFIG_MMA9551=m
CONFIG_MMA9553=m
CONFIG_MXC4005=m
# CONFIG_MXC6255 is not set
CONFIG_SCA3000=m
# CONFIG_SCA3300 is not set
CONFIG_STK8312=m
CONFIG_STK8BA50=m
# end of Accelerometers

#
# Analog to digital converters
#
CONFIG_AD_SIGMA_DELTA=m
# CONFIG_AD7091R5 is not set
# CONFIG_AD7124 is not set
CONFIG_AD7192=m
# CONFIG_AD7266 is not set
CONFIG_AD7280=m
CONFIG_AD7291=m
# CONFIG_AD7292 is not set
# CONFIG_AD7298 is not set
# CONFIG_AD7476 is not set
CONFIG_AD7606=m
# CONFIG_AD7606_IFACE_PARALLEL is not set
CONFIG_AD7606_IFACE_SPI=m
# CONFIG_AD7766 is not set
CONFIG_AD7768_1=m
CONFIG_AD7780=m
# CONFIG_AD7791 is not set
CONFIG_AD7793=m
CONFIG_AD7887=m
CONFIG_AD7923=m
CONFIG_AD7949=m
CONFIG_AD799X=m
# CONFIG_ASPEED_ADC is not set
# CONFIG_AT91_SAMA5D2_ADC is not set
CONFIG_BCM_IPROC_ADC=m
# CONFIG_BERLIN2_ADC is not set
# CONFIG_CC10001_ADC is not set
CONFIG_CPCAP_ADC=m
CONFIG_ENVELOPE_DETECTOR=m
# CONFIG_MXS_LRADC_ADC is not set
CONFIG_HI8435=m
# CONFIG_HX711 is not set
CONFIG_INA2XX_ADC=m
# CONFIG_INGENIC_ADC is not set
# CONFIG_IMX7D_ADC is not set
CONFIG_IMX8QXP_ADC=m
CONFIG_LP8788_ADC=m
# CONFIG_LPC18XX_ADC is not set
CONFIG_LPC32XX_ADC=m
CONFIG_LTC2471=m
CONFIG_LTC2485=m
CONFIG_LTC2496=m
# CONFIG_LTC2497 is not set
CONFIG_MAX1027=m
# CONFIG_MAX11100 is not set
CONFIG_MAX1118=m
CONFIG_MAX1241=m
CONFIG_MAX1363=m
# CONFIG_MAX9611 is not set
CONFIG_MCP320X=m
CONFIG_MCP3422=m
CONFIG_MCP3911=m
# CONFIG_MEDIATEK_MT6360_ADC is not set
# CONFIG_MEDIATEK_MT6577_AUXADC is not set
# CONFIG_MP2629_ADC is not set
CONFIG_NAU7802=m
# CONFIG_NPCM_ADC is not set
CONFIG_PALMAS_GPADC=m
CONFIG_QCOM_VADC_COMMON=m
CONFIG_QCOM_PM8XXX_XOADC=m
# CONFIG_QCOM_SPMI_IADC is not set
CONFIG_QCOM_SPMI_VADC=m
CONFIG_QCOM_SPMI_ADC5=m
# CONFIG_RCAR_GYRO_ADC is not set
# CONFIG_ROCKCHIP_SARADC is not set
CONFIG_RZG2L_ADC=m
# CONFIG_SC27XX_ADC is not set
CONFIG_SPEAR_ADC=m
CONFIG_SD_ADC_MODULATOR=m
CONFIG_STM32_DFSDM_CORE=m
CONFIG_STM32_DFSDM_ADC=m
CONFIG_SUN4I_GPADC=m
# CONFIG_TI_ADC081C is not set
# CONFIG_TI_ADC0832 is not set
CONFIG_TI_ADC084S021=m
CONFIG_TI_ADC12138=m
CONFIG_TI_ADC108S102=m
# CONFIG_TI_ADC128S052 is not set
CONFIG_TI_ADC161S626=m
CONFIG_TI_ADS1015=m
CONFIG_TI_ADS7950=m
# CONFIG_TI_ADS8344 is not set
# CONFIG_TI_ADS8688 is not set
# CONFIG_TI_ADS124S08 is not set
CONFIG_TI_ADS131E08=m
CONFIG_TI_TLC4541=m
CONFIG_TI_TSC2046=m
CONFIG_TWL4030_MADC=m
CONFIG_TWL6030_GPADC=m
CONFIG_VF610_ADC=m
CONFIG_XILINX_XADC=m
# CONFIG_XILINX_AMS is not set
# end of Analog to digital converters

#
# Analog to digital and digital to analog converters
#
CONFIG_AD74413R=m
# end of Analog to digital and digital to analog converters

#
# Analog Front Ends
#
CONFIG_IIO_RESCALE=m
# end of Analog Front Ends

#
# Amplifiers
#
# CONFIG_AD8366 is not set
CONFIG_ADA4250=m
CONFIG_HMC425=m
# end of Amplifiers

#
# Capacitance to digital converters
#
CONFIG_AD7150=m
# end of Capacitance to digital converters

#
# Chemical Sensors
#
CONFIG_ATLAS_PH_SENSOR=m
CONFIG_ATLAS_EZO_SENSOR=m
CONFIG_BME680=m
CONFIG_BME680_I2C=m
CONFIG_BME680_SPI=m
CONFIG_CCS811=m
# CONFIG_IAQCORE is not set
CONFIG_PMS7003=m
# CONFIG_SCD30_CORE is not set
CONFIG_SCD4X=m
# CONFIG_SENSIRION_SGP30 is not set
# CONFIG_SENSIRION_SGP40 is not set
CONFIG_SPS30=m
CONFIG_SPS30_I2C=m
CONFIG_SPS30_SERIAL=m
CONFIG_SENSEAIR_SUNRISE_CO2=m
CONFIG_VZ89X=m
# end of Chemical Sensors

#
# Hid Sensor IIO Common
#
# end of Hid Sensor IIO Common

CONFIG_IIO_MS_SENSORS_I2C=m

#
# IIO SCMI Sensors
#
# end of IIO SCMI Sensors

#
# SSP Sensor Common
#
CONFIG_IIO_SSP_SENSORS_COMMONS=m
CONFIG_IIO_SSP_SENSORHUB=m
# end of SSP Sensor Common

CONFIG_IIO_ST_SENSORS_I2C=m
CONFIG_IIO_ST_SENSORS_SPI=m
CONFIG_IIO_ST_SENSORS_CORE=m

#
# Digital to analog converters
#
CONFIG_AD3552R=m
CONFIG_AD5064=m
CONFIG_AD5360=m
CONFIG_AD5380=m
CONFIG_AD5421=m
# CONFIG_AD5446 is not set
CONFIG_AD5449=m
CONFIG_AD5592R_BASE=m
# CONFIG_AD5592R is not set
CONFIG_AD5593R=m
CONFIG_AD5504=m
# CONFIG_AD5624R_SPI is not set
CONFIG_LTC2688=m
CONFIG_AD5686=m
CONFIG_AD5686_SPI=m
CONFIG_AD5696_I2C=m
CONFIG_AD5755=m
CONFIG_AD5758=m
CONFIG_AD5761=m
CONFIG_AD5764=m
CONFIG_AD5766=m
# CONFIG_AD5770R is not set
# CONFIG_AD5791 is not set
# CONFIG_AD7293 is not set
CONFIG_AD7303=m
CONFIG_AD8801=m
CONFIG_DPOT_DAC=m
# CONFIG_DS4424 is not set
CONFIG_LPC18XX_DAC=m
CONFIG_LTC1660=m
# CONFIG_LTC2632 is not set
CONFIG_M62332=m
CONFIG_MAX517=m
# CONFIG_MAX5821 is not set
CONFIG_MCP4725=m
CONFIG_MCP4922=m
CONFIG_STM32_DAC=m
CONFIG_STM32_DAC_CORE=m
CONFIG_TI_DAC082S085=m
CONFIG_TI_DAC5571=m
CONFIG_TI_DAC7311=m
CONFIG_TI_DAC7612=m
CONFIG_VF610_DAC=m
# end of Digital to analog converters

#
# IIO dummy driver
#
# end of IIO dummy driver

#
# Filters
#
CONFIG_ADMV8818=m
# end of Filters

#
# Frequency Synthesizers DDS/PLL
#

#
# Clock Generator/Distribution
#
# CONFIG_AD9523 is not set
# end of Clock Generator/Distribution

#
# Phase-Locked Loop (PLL) frequency synthesizers
#
# CONFIG_ADF4350 is not set
# CONFIG_ADF4371 is not set
# CONFIG_ADMV1013 is not set
CONFIG_ADMV1014=m
# CONFIG_ADMV4420 is not set
CONFIG_ADRF6780=m
# end of Phase-Locked Loop (PLL) frequency synthesizers
# end of Frequency Synthesizers DDS/PLL

#
# Digital gyroscope sensors
#
CONFIG_ADIS16080=m
CONFIG_ADIS16130=m
# CONFIG_ADIS16136 is not set
# CONFIG_ADIS16260 is not set
CONFIG_ADXRS290=m
CONFIG_ADXRS450=m
CONFIG_BMG160=m
CONFIG_BMG160_I2C=m
CONFIG_BMG160_SPI=m
CONFIG_FXAS21002C=m
CONFIG_FXAS21002C_I2C=m
CONFIG_FXAS21002C_SPI=m
CONFIG_MPU3050=m
CONFIG_MPU3050_I2C=m
CONFIG_IIO_ST_GYRO_3AXIS=m
CONFIG_IIO_ST_GYRO_I2C_3AXIS=m
CONFIG_IIO_ST_GYRO_SPI_3AXIS=m
# CONFIG_ITG3200 is not set
# end of Digital gyroscope sensors

#
# Health Sensors
#

#
# Heart Rate Monitors
#
CONFIG_AFE4403=m
# CONFIG_AFE4404 is not set
# CONFIG_MAX30100 is not set
CONFIG_MAX30102=m
# end of Heart Rate Monitors
# end of Health Sensors

#
# Humidity sensors
#
# CONFIG_AM2315 is not set
CONFIG_DHT11=m
# CONFIG_HDC100X is not set
# CONFIG_HDC2010 is not set
# CONFIG_HTS221 is not set
CONFIG_HTU21=m
CONFIG_SI7005=m
CONFIG_SI7020=m
# end of Humidity sensors

#
# Inertial measurement units
#
CONFIG_ADIS16400=m
CONFIG_ADIS16460=m
CONFIG_ADIS16475=m
CONFIG_ADIS16480=m
CONFIG_BMI160=m
CONFIG_BMI160_I2C=m
CONFIG_BMI160_SPI=m
# CONFIG_FXOS8700_I2C is not set
# CONFIG_FXOS8700_SPI is not set
CONFIG_KMX61=m
CONFIG_INV_ICM42600=m
# CONFIG_INV_ICM42600_I2C is not set
CONFIG_INV_ICM42600_SPI=m
CONFIG_INV_MPU6050_IIO=m
CONFIG_INV_MPU6050_I2C=m
CONFIG_INV_MPU6050_SPI=m
# CONFIG_IIO_ST_LSM6DSX is not set
CONFIG_IIO_ST_LSM9DS0=m
CONFIG_IIO_ST_LSM9DS0_I2C=m
CONFIG_IIO_ST_LSM9DS0_SPI=m
# end of Inertial measurement units

CONFIG_IIO_ADIS_LIB=m
CONFIG_IIO_ADIS_LIB_BUFFER=y

#
# Light sensors
#
CONFIG_ADJD_S311=m
# CONFIG_ADUX1020 is not set
CONFIG_AL3010=m
CONFIG_AL3320A=m
# CONFIG_APDS9300 is not set
CONFIG_APDS9960=m
CONFIG_AS73211=m
CONFIG_BH1750=m
# CONFIG_BH1780 is not set
# CONFIG_CM32181 is not set
CONFIG_CM3232=m
CONFIG_CM3323=m
CONFIG_CM3605=m
CONFIG_CM36651=m
CONFIG_GP2AP002=m
CONFIG_GP2AP020A00F=m
CONFIG_IQS621_ALS=m
CONFIG_SENSORS_ISL29018=m
CONFIG_SENSORS_ISL29028=m
# CONFIG_ISL29125 is not set
CONFIG_JSA1212=m
# CONFIG_RPR0521 is not set
# CONFIG_SENSORS_LM3533 is not set
CONFIG_LTR501=m
# CONFIG_LV0104CS is not set
CONFIG_MAX44000=m
CONFIG_MAX44009=m
# CONFIG_NOA1305 is not set
# CONFIG_OPT3001 is not set
CONFIG_PA12203001=m
CONFIG_SI1133=m
CONFIG_SI1145=m
CONFIG_STK3310=m
CONFIG_ST_UVIS25=m
CONFIG_ST_UVIS25_I2C=m
CONFIG_ST_UVIS25_SPI=m
CONFIG_TCS3414=m
# CONFIG_TCS3472 is not set
# CONFIG_SENSORS_TSL2563 is not set
CONFIG_TSL2583=m
CONFIG_TSL2591=m
CONFIG_TSL2772=m
CONFIG_TSL4531=m
CONFIG_US5182D=m
CONFIG_VCNL4000=m
# CONFIG_VCNL4035 is not set
# CONFIG_VEML6030 is not set
# CONFIG_VEML6070 is not set
# CONFIG_VL6180 is not set
CONFIG_ZOPT2201=m
# end of Light sensors

#
# Magnetometer sensors
#
# CONFIG_AK8974 is not set
CONFIG_AK8975=m
CONFIG_AK09911=m
CONFIG_BMC150_MAGN=m
CONFIG_BMC150_MAGN_I2C=m
CONFIG_BMC150_MAGN_SPI=m
CONFIG_MAG3110=m
CONFIG_MMC35240=m
CONFIG_IIO_ST_MAGN_3AXIS=m
CONFIG_IIO_ST_MAGN_I2C_3AXIS=m
CONFIG_IIO_ST_MAGN_SPI_3AXIS=m
CONFIG_SENSORS_HMC5843=m
CONFIG_SENSORS_HMC5843_I2C=m
# CONFIG_SENSORS_HMC5843_SPI is not set
CONFIG_SENSORS_RM3100=m
CONFIG_SENSORS_RM3100_I2C=m
CONFIG_SENSORS_RM3100_SPI=m
CONFIG_YAMAHA_YAS530=m
# end of Magnetometer sensors

#
# Multiplexers
#
CONFIG_IIO_MUX=m
# end of Multiplexers

#
# Inclinometer sensors
#
# end of Inclinometer sensors

#
# Triggers - standalone
#
CONFIG_IIO_HRTIMER_TRIGGER=m
CONFIG_IIO_INTERRUPT_TRIGGER=m
# CONFIG_IIO_STM32_LPTIMER_TRIGGER is not set
CONFIG_IIO_STM32_TIMER_TRIGGER=m
# CONFIG_IIO_TIGHTLOOP_TRIGGER is not set
CONFIG_IIO_SYSFS_TRIGGER=m
# end of Triggers - standalone

#
# Linear and angular position sensors
#
CONFIG_IQS624_POS=m
# end of Linear and angular position sensors

#
# Digital potentiometers
#
CONFIG_AD5110=m
CONFIG_AD5272=m
# CONFIG_DS1803 is not set
CONFIG_MAX5432=m
# CONFIG_MAX5481 is not set
# CONFIG_MAX5487 is not set
CONFIG_MCP4018=m
# CONFIG_MCP4131 is not set
CONFIG_MCP4531=m
# CONFIG_MCP41010 is not set
# CONFIG_TPL0102 is not set
# end of Digital potentiometers

#
# Digital potentiostats
#
CONFIG_LMP91000=m
# end of Digital potentiostats

#
# Pressure sensors
#
CONFIG_ABP060MG=m
# CONFIG_BMP280 is not set
CONFIG_DLHL60D=m
# CONFIG_DPS310 is not set
CONFIG_HP03=m
# CONFIG_ICP10100 is not set
CONFIG_MPL115=m
CONFIG_MPL115_I2C=m
# CONFIG_MPL115_SPI is not set
# CONFIG_MPL3115 is not set
CONFIG_MS5611=m
# CONFIG_MS5611_I2C is not set
CONFIG_MS5611_SPI=m
CONFIG_MS5637=m
CONFIG_IIO_ST_PRESS=m
CONFIG_IIO_ST_PRESS_I2C=m
# CONFIG_IIO_ST_PRESS_SPI is not set
CONFIG_T5403=m
CONFIG_HP206C=m
CONFIG_ZPA2326=m
CONFIG_ZPA2326_I2C=m
CONFIG_ZPA2326_SPI=m
# end of Pressure sensors

#
# Lightning sensors
#
CONFIG_AS3935=m
# end of Lightning sensors

#
# Proximity and distance sensors
#
# CONFIG_ISL29501 is not set
# CONFIG_LIDAR_LITE_V2 is not set
CONFIG_MB1232=m
CONFIG_PING=m
# CONFIG_RFD77402 is not set
CONFIG_SRF04=m
# CONFIG_SX9310 is not set
# CONFIG_SX9324 is not set
# CONFIG_SX9360 is not set
# CONFIG_SX9500 is not set
CONFIG_SRF08=m
CONFIG_VCNL3020=m
# CONFIG_VL53L0X_I2C is not set
# end of Proximity and distance sensors

#
# Resolver to digital converters
#
CONFIG_AD2S90=m
CONFIG_AD2S1200=m
# end of Resolver to digital converters

#
# Temperature sensors
#
CONFIG_IQS620AT_TEMP=m
# CONFIG_LTC2983 is not set
CONFIG_MAXIM_THERMOCOUPLE=m
CONFIG_MLX90614=m
# CONFIG_MLX90632 is not set
CONFIG_TMP006=m
CONFIG_TMP007=m
# CONFIG_TMP117 is not set
# CONFIG_TSYS01 is not set
CONFIG_TSYS02D=m
CONFIG_MAX31856=m
CONFIG_MAX31865=m
# end of Temperature sensors

CONFIG_NTB=y
CONFIG_NTB_MSI=y
CONFIG_NTB_IDT=m
CONFIG_NTB_EPF=m
# CONFIG_NTB_SWITCHTEC is not set
# CONFIG_NTB_PINGPONG is not set
CONFIG_NTB_TOOL=y
# CONFIG_NTB_PERF is not set
CONFIG_NTB_MSI_TEST=m
CONFIG_NTB_TRANSPORT=m
CONFIG_PWM=y
CONFIG_PWM_SYSFS=y
CONFIG_PWM_DEBUG=y
CONFIG_PWM_BCM_IPROC=m
CONFIG_PWM_BCM_KONA=y
CONFIG_PWM_BCM2835=y
CONFIG_PWM_BERLIN=m
CONFIG_PWM_BRCMSTB=m
CONFIG_PWM_CLK=m
CONFIG_PWM_CLPS711X=m
# CONFIG_PWM_DWC is not set
CONFIG_PWM_EP93XX=y
CONFIG_PWM_HIBVT=y
CONFIG_PWM_IMG=y
CONFIG_PWM_IMX1=m
CONFIG_PWM_IMX27=m
CONFIG_PWM_IMX_TPM=y
# CONFIG_PWM_INTEL_LGM is not set
CONFIG_PWM_IQS620A=y
# CONFIG_PWM_JZ4740 is not set
CONFIG_PWM_KEEMBAY=y
CONFIG_PWM_LP3943=m
CONFIG_PWM_LPC18XX_SCT=m
CONFIG_PWM_LPC32XX=m
CONFIG_PWM_LPSS=m
CONFIG_PWM_LPSS_PCI=m
CONFIG_PWM_LPSS_PLATFORM=m
CONFIG_PWM_MESON=m
# CONFIG_PWM_MTK_DISP is not set
CONFIG_PWM_MEDIATEK=m
CONFIG_PWM_PCA9685=y
CONFIG_PWM_PXA=y
# CONFIG_PWM_RASPBERRYPI_POE is not set
# CONFIG_PWM_RCAR is not set
# CONFIG_PWM_RENESAS_TPU is not set
CONFIG_PWM_ROCKCHIP=m
# CONFIG_PWM_SAMSUNG is not set
# CONFIG_PWM_SL28CPLD is not set
CONFIG_PWM_SPRD=y
CONFIG_PWM_STM32=y
CONFIG_PWM_STM32_LP=m
CONFIG_PWM_SUN4I=y
# CONFIG_PWM_TEGRA is not set
# CONFIG_PWM_TIECAP is not set
# CONFIG_PWM_TIEHRPWM is not set
# CONFIG_PWM_TWL is not set
# CONFIG_PWM_TWL_LED is not set
CONFIG_PWM_VISCONTI=y
CONFIG_PWM_VT8500=m

#
# IRQ chip support
#
CONFIG_AL_FIC=y
CONFIG_RENESAS_INTC_IRQPIN=y
# CONFIG_RENESAS_IRQC is not set
# CONFIG_RENESAS_RZA1_IRQC is not set
CONFIG_RENESAS_RZG2L_IRQC=y
CONFIG_SL28CPLD_INTC=y
CONFIG_TS4800_IRQ=m
CONFIG_INGENIC_TCU_IRQ=y
CONFIG_IRQ_UNIPHIER_AIDET=y
CONFIG_MESON_IRQ_GPIO=m
CONFIG_IMX_IRQSTEER=y
# CONFIG_IMX_INTMUX is not set
# CONFIG_EXYNOS_IRQ_COMBINER is not set
CONFIG_MST_IRQ=y
# CONFIG_MCHP_EIC is not set
CONFIG_SUNPLUS_SP7021_INTC=y
# end of IRQ chip support

CONFIG_IPACK_BUS=m
CONFIG_BOARD_TPCI200=m
CONFIG_SERIAL_IPOCTAL=m
CONFIG_RESET_CONTROLLER=y
# CONFIG_RESET_A10SR is not set
CONFIG_RESET_ATH79=y
CONFIG_RESET_AXS10X=y
# CONFIG_RESET_BCM6345 is not set
CONFIG_RESET_BERLIN=m
CONFIG_RESET_BRCMSTB=y
CONFIG_RESET_BRCMSTB_RESCAL=y
# CONFIG_RESET_HSDK is not set
# CONFIG_RESET_IMX7 is not set
# CONFIG_RESET_LANTIQ is not set
CONFIG_RESET_LPC18XX=y
CONFIG_RESET_MCHP_SPARX5=y
# CONFIG_RESET_MESON is not set
CONFIG_RESET_MESON_AUDIO_ARB=y
# CONFIG_RESET_NPCM is not set
CONFIG_RESET_PISTACHIO=y
# CONFIG_RESET_QCOM_AOSS is not set
# CONFIG_RESET_QCOM_PDC is not set
CONFIG_RESET_RASPBERRYPI=y
CONFIG_RESET_RZG2L_USBPHY_CTRL=m
CONFIG_RESET_SCMI=m
CONFIG_RESET_SIMPLE=y
# CONFIG_RESET_SOCFPGA is not set
# CONFIG_RESET_STARFIVE_JH7100 is not set
CONFIG_RESET_SUNPLUS=y
# CONFIG_RESET_SUNXI is not set
CONFIG_RESET_TI_SCI=y
# CONFIG_RESET_TI_SYSCON is not set
CONFIG_RESET_TI_TPS380X=m
# CONFIG_RESET_TN48M_CPLD is not set
# CONFIG_RESET_ZYNQ is not set
CONFIG_COMMON_RESET_HI3660=m
CONFIG_COMMON_RESET_HI6220=m

#
# PHY Subsystem
#
CONFIG_GENERIC_PHY=y
CONFIG_GENERIC_PHY_MIPI_DPHY=y
CONFIG_PHY_PISTACHIO_USB=m
CONFIG_PHY_CAN_TRANSCEIVER=y
CONFIG_PHY_SUN6I_MIPI_DPHY=y

#
# PHY drivers for Broadcom platforms
#
CONFIG_PHY_BCM63XX_USBH=y
CONFIG_BCM_KONA_USB2_PHY=m
# CONFIG_PHY_NS2_PCIE is not set
# end of PHY drivers for Broadcom platforms

CONFIG_PHY_HI6220_USB=m
CONFIG_PHY_HI3660_USB=m
CONFIG_PHY_HI3670_USB=y
# CONFIG_PHY_HI3670_PCIE is not set
# CONFIG_PHY_HISTB_COMBPHY is not set
# CONFIG_PHY_HISI_INNO_USB2 is not set
CONFIG_PHY_PXA_28NM_HSIC=y
CONFIG_PHY_PXA_28NM_USB2=y
CONFIG_PHY_PXA_USB=y
CONFIG_PHY_MMP3_USB=y
# CONFIG_PHY_MMP3_HSIC is not set
CONFIG_PHY_MT7621_PCI=m
# CONFIG_PHY_RALINK_USB is not set
# CONFIG_PHY_RCAR_GEN3_USB3 is not set
# CONFIG_PHY_ROCKCHIP_DPHY_RX0 is not set
CONFIG_PHY_ROCKCHIP_PCIE=m
CONFIG_PHY_EXYNOS_MIPI_VIDEO=y
CONFIG_PHY_SAMSUNG_USB2=y
# CONFIG_PHY_S5PV210_USB2 is not set
# CONFIG_PHY_ST_SPEAR1310_MIPHY is not set
CONFIG_PHY_ST_SPEAR1340_MIPHY=m
CONFIG_PHY_STIH407_USB=m
CONFIG_PHY_STM32_USBPHYC=m
CONFIG_PHY_TEGRA194_P2U=y
CONFIG_PHY_DA8XX_USB=y
# CONFIG_PHY_AM654_SERDES is not set
CONFIG_OMAP_CONTROL_PHY=m
CONFIG_TI_PIPE3=m
CONFIG_PHY_INTEL_KEEMBAY_EMMC=m
CONFIG_PHY_INTEL_KEEMBAY_USB=m
# CONFIG_PHY_INTEL_LGM_EMMC is not set
# CONFIG_PHY_XILINX_ZYNQMP is not set
# end of PHY Subsystem

# CONFIG_POWERCAP is not set
# CONFIG_MCB is not set
CONFIG_RAS=y
CONFIG_USB4=y
# CONFIG_USB4_DEBUGFS_WRITE is not set
CONFIG_USB4_DMA_TEST=m

#
# Android
#
# CONFIG_ANDROID_BINDER_IPC is not set
# end of Android

CONFIG_LIBNVDIMM=m
# CONFIG_BLK_DEV_PMEM is not set
CONFIG_ND_CLAIM=y
CONFIG_BTT=y
CONFIG_NVDIMM_KEYS=y
# CONFIG_DAX is not set
CONFIG_NVMEM=y
CONFIG_NVMEM_SYSFS=y
CONFIG_NVMEM_IMX_IIM=m
CONFIG_NVMEM_IMX_OCOTP=y
CONFIG_NVMEM_LPC18XX_EEPROM=m
CONFIG_NVMEM_LPC18XX_OTP=y
CONFIG_NVMEM_MXS_OCOTP=m
CONFIG_MTK_EFUSE=y
CONFIG_MICROCHIP_OTPC=y
CONFIG_NVMEM_NINTENDO_OTP=y
# CONFIG_QCOM_QFPROM is not set
CONFIG_NVMEM_SPMI_SDAM=m
CONFIG_ROCKCHIP_EFUSE=y
CONFIG_ROCKCHIP_OTP=y
CONFIG_NVMEM_BCM_OCOTP=m
CONFIG_NVMEM_STM32_ROMEM=y
CONFIG_UNIPHIER_EFUSE=m
CONFIG_NVMEM_VF610_OCOTP=m
CONFIG_MESON_MX_EFUSE=y
CONFIG_NVMEM_SNVS_LPGPR=y
CONFIG_RAVE_SP_EEPROM=m
CONFIG_SC27XX_EFUSE=m
CONFIG_SPRD_EFUSE=y
# CONFIG_NVMEM_RMEM is not set
CONFIG_NVMEM_BRCM_NVRAM=m
# CONFIG_NVMEM_LAYERSCAPE_SFP is not set
# CONFIG_NVMEM_SUNPLUS_OCOTP is not set
CONFIG_NVMEM_APPLE_EFUSES=m

#
# HW tracing support
#
# CONFIG_STM is not set
# CONFIG_INTEL_TH is not set
# end of HW tracing support

CONFIG_FPGA=y
CONFIG_FPGA_MGR_SOCFPGA=m
# CONFIG_FPGA_MGR_SOCFPGA_A10 is not set
# CONFIG_ALTERA_PR_IP_CORE is not set
# CONFIG_FPGA_MGR_ALTERA_PS_SPI is not set
CONFIG_FPGA_MGR_ALTERA_CVP=y
CONFIG_FPGA_MGR_ZYNQ_FPGA=y
# CONFIG_FPGA_MGR_XILINX_SPI is not set
CONFIG_FPGA_MGR_MACHXO2_SPI=m
CONFIG_FPGA_BRIDGE=m
# CONFIG_ALTERA_FREEZE_BRIDGE is not set
# CONFIG_XILINX_PR_DECOUPLER is not set
CONFIG_FPGA_REGION=m
CONFIG_FPGA_DFL=m
CONFIG_FPGA_DFL_AFU=m
CONFIG_FPGA_DFL_NIOS_INTEL_PAC_N3000=m
# CONFIG_FPGA_DFL_PCI is not set
CONFIG_FPGA_MGR_ZYNQMP_FPGA=y
# CONFIG_FPGA_MGR_VERSAL_FPGA is not set
CONFIG_FPGA_MGR_MICROCHIP_SPI=m
CONFIG_TEE=y
CONFIG_MULTIPLEXER=y

#
# Multiplexer drivers
#
# CONFIG_MUX_ADG792A is not set
# CONFIG_MUX_ADGS1408 is not set
CONFIG_MUX_GPIO=m
CONFIG_MUX_MMIO=y
# end of Multiplexer drivers

CONFIG_PM_OPP=y
# CONFIG_SIOX is not set
CONFIG_SLIMBUS=y
# CONFIG_SLIM_QCOM_CTRL is not set
CONFIG_INTERCONNECT=y
# CONFIG_INTERCONNECT_IMX is not set
# CONFIG_INTERCONNECT_QCOM_OSM_L3 is not set
CONFIG_INTERCONNECT_SAMSUNG=y
# CONFIG_INTERCONNECT_EXYNOS is not set
CONFIG_COUNTER=m
CONFIG_104_QUAD_8=m
# CONFIG_INTERRUPT_CNT is not set
CONFIG_STM32_TIMER_CNT=m
CONFIG_STM32_LPTIMER_CNT=m
CONFIG_TI_EQEP=m
CONFIG_INTEL_QEP=m
# CONFIG_MOST is not set
CONFIG_PECI=m
CONFIG_PECI_CPU=m
CONFIG_HTE=y
# end of Device Drivers

#
# File systems
#
# CONFIG_VALIDATE_FS_PARSER is not set
CONFIG_FS_IOMAP=y
# CONFIG_EXT2_FS is not set
CONFIG_EXT3_FS=y
CONFIG_EXT3_FS_POSIX_ACL=y
CONFIG_EXT3_FS_SECURITY=y
CONFIG_EXT4_FS=y
CONFIG_EXT4_USE_FOR_EXT2=y
CONFIG_EXT4_FS_POSIX_ACL=y
CONFIG_EXT4_FS_SECURITY=y
# CONFIG_EXT4_DEBUG is not set
CONFIG_JBD2=y
CONFIG_JBD2_DEBUG=y
CONFIG_FS_MBCACHE=y
CONFIG_REISERFS_FS=y
# CONFIG_REISERFS_CHECK is not set
CONFIG_REISERFS_PROC_INFO=y
# CONFIG_REISERFS_FS_XATTR is not set
# CONFIG_JFS_FS is not set
# CONFIG_XFS_FS is not set
CONFIG_GFS2_FS=y
CONFIG_OCFS2_FS=y
CONFIG_OCFS2_FS_O2CB=y
CONFIG_OCFS2_FS_USERSPACE_CLUSTER=m
CONFIG_OCFS2_FS_STATS=y
CONFIG_OCFS2_DEBUG_MASKLOG=y
CONFIG_OCFS2_DEBUG_FS=y
CONFIG_BTRFS_FS=m
# CONFIG_BTRFS_FS_POSIX_ACL is not set
# CONFIG_BTRFS_FS_CHECK_INTEGRITY is not set
# CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
# CONFIG_BTRFS_DEBUG is not set
CONFIG_BTRFS_ASSERT=y
CONFIG_BTRFS_FS_REF_VERIFY=y
CONFIG_NILFS2_FS=m
CONFIG_F2FS_FS=m
CONFIG_F2FS_STAT_FS=y
# CONFIG_F2FS_FS_XATTR is not set
CONFIG_F2FS_CHECK_FS=y
# CONFIG_F2FS_FAULT_INJECTION is not set
# CONFIG_F2FS_FS_COMPRESSION is not set
CONFIG_F2FS_IOSTAT=y
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=m
# CONFIG_EXPORTFS_BLOCK_OPS is not set
CONFIG_FILE_LOCKING=y
# CONFIG_FS_ENCRYPTION is not set
# CONFIG_FS_VERITY is not set
CONFIG_FSNOTIFY=y
CONFIG_DNOTIFY=y
# CONFIG_INOTIFY_USER is not set
# CONFIG_FANOTIFY is not set
CONFIG_QUOTA=y
CONFIG_QUOTA_NETLINK_INTERFACE=y
# CONFIG_PRINT_QUOTA_WARNING is not set
# CONFIG_QUOTA_DEBUG is not set
CONFIG_QUOTA_TREE=y
CONFIG_QFMT_V1=m
CONFIG_QFMT_V2=m
CONFIG_QUOTACTL=y
# CONFIG_AUTOFS4_FS is not set
# CONFIG_AUTOFS_FS is not set
CONFIG_FUSE_FS=y
# CONFIG_CUSE is not set
CONFIG_VIRTIO_FS=y
CONFIG_OVERLAY_FS=m
CONFIG_OVERLAY_FS_REDIRECT_DIR=y
CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW=y
# CONFIG_OVERLAY_FS_INDEX is not set
CONFIG_OVERLAY_FS_XINO_AUTO=y
CONFIG_OVERLAY_FS_METACOPY=y

#
# Caches
#
CONFIG_NETFS_SUPPORT=m
CONFIG_NETFS_STATS=y
CONFIG_FSCACHE=m
# CONFIG_FSCACHE_STATS is not set
# CONFIG_FSCACHE_DEBUG is not set
# CONFIG_CACHEFILES is not set
# end of Caches

#
# CD-ROM/DVD Filesystems
#
# CONFIG_ISO9660_FS is not set
# CONFIG_UDF_FS is not set
# end of CD-ROM/DVD Filesystems

#
# DOS/FAT/EXFAT/NT Filesystems
#
# CONFIG_MSDOS_FS is not set
# CONFIG_VFAT_FS is not set
CONFIG_EXFAT_FS=y
CONFIG_EXFAT_DEFAULT_IOCHARSET="utf8"
CONFIG_NTFS_FS=y
# CONFIG_NTFS_DEBUG is not set
CONFIG_NTFS_RW=y
CONFIG_NTFS3_FS=m
# CONFIG_NTFS3_64BIT_CLUSTER is not set
CONFIG_NTFS3_LZX_XPRESS=y
# CONFIG_NTFS3_FS_POSIX_ACL is not set
# end of DOS/FAT/EXFAT/NT Filesystems

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
CONFIG_PROC_KCORE=y
# CONFIG_PROC_VMCORE is not set
CONFIG_PROC_SYSCTL=y
CONFIG_PROC_PAGE_MONITOR=y
CONFIG_PROC_CHILDREN=y
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_TMPFS=y
# CONFIG_TMPFS_POSIX_ACL is not set
CONFIG_TMPFS_XATTR=y
# CONFIG_TMPFS_INODE64 is not set
CONFIG_ARCH_SUPPORTS_HUGETLBFS=y
# CONFIG_HUGETLBFS is not set
CONFIG_MEMFD_CREATE=y
CONFIG_ARCH_HAS_GIGANTIC_PAGE=y
CONFIG_CONFIGFS_FS=y
# end of Pseudo filesystems

CONFIG_MISC_FILESYSTEMS=y
CONFIG_ORANGEFS_FS=y
CONFIG_ADFS_FS=y
# CONFIG_ADFS_FS_RW is not set
CONFIG_AFFS_FS=y
# CONFIG_ECRYPT_FS is not set
CONFIG_HFS_FS=m
CONFIG_HFSPLUS_FS=y
# CONFIG_BEFS_FS is not set
# CONFIG_BFS_FS is not set
CONFIG_EFS_FS=m
CONFIG_JFFS2_FS=m
CONFIG_JFFS2_FS_DEBUG=0
CONFIG_JFFS2_FS_WRITEBUFFER=y
# CONFIG_JFFS2_FS_WBUF_VERIFY is not set
CONFIG_JFFS2_SUMMARY=y
CONFIG_JFFS2_FS_XATTR=y
CONFIG_JFFS2_FS_POSIX_ACL=y
# CONFIG_JFFS2_FS_SECURITY is not set
# CONFIG_JFFS2_COMPRESSION_OPTIONS is not set
CONFIG_JFFS2_ZLIB=y
CONFIG_JFFS2_RTIME=y
# CONFIG_CRAMFS is not set
# CONFIG_SQUASHFS is not set
CONFIG_VXFS_FS=m
CONFIG_MINIX_FS=m
CONFIG_MINIX_FS_NATIVE_ENDIAN=y
CONFIG_OMFS_FS=y
# CONFIG_HPFS_FS is not set
# CONFIG_QNX4FS_FS is not set
# CONFIG_QNX6FS_FS is not set
CONFIG_ROMFS_FS=y
CONFIG_ROMFS_BACKED_BY_BLOCK=y
CONFIG_ROMFS_ON_BLOCK=y
# CONFIG_PSTORE is not set
CONFIG_SYSV_FS=y
CONFIG_UFS_FS=m
CONFIG_UFS_FS_WRITE=y
CONFIG_UFS_DEBUG=y
CONFIG_EROFS_FS=y
# CONFIG_EROFS_FS_DEBUG is not set
# CONFIG_EROFS_FS_XATTR is not set
# CONFIG_EROFS_FS_ZIP is not set
CONFIG_NETWORK_FILESYSTEMS=y
CONFIG_CEPH_FS=m
# CONFIG_CEPH_FSCACHE is not set
CONFIG_CEPH_FS_POSIX_ACL=y
# CONFIG_CIFS is not set
# CONFIG_CODA_FS is not set
# CONFIG_AFS_FS is not set
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="iso8859-1"
# CONFIG_NLS_CODEPAGE_437 is not set
# CONFIG_NLS_CODEPAGE_737 is not set
CONFIG_NLS_CODEPAGE_775=m
CONFIG_NLS_CODEPAGE_850=m
CONFIG_NLS_CODEPAGE_852=y
CONFIG_NLS_CODEPAGE_855=y
CONFIG_NLS_CODEPAGE_857=y
CONFIG_NLS_CODEPAGE_860=m
CONFIG_NLS_CODEPAGE_861=y
CONFIG_NLS_CODEPAGE_862=m
CONFIG_NLS_CODEPAGE_863=y
CONFIG_NLS_CODEPAGE_864=m
CONFIG_NLS_CODEPAGE_865=y
# CONFIG_NLS_CODEPAGE_866 is not set
CONFIG_NLS_CODEPAGE_869=m
CONFIG_NLS_CODEPAGE_936=m
# CONFIG_NLS_CODEPAGE_950 is not set
CONFIG_NLS_CODEPAGE_932=m
CONFIG_NLS_CODEPAGE_949=y
CONFIG_NLS_CODEPAGE_874=y
CONFIG_NLS_ISO8859_8=m
CONFIG_NLS_CODEPAGE_1250=m
# CONFIG_NLS_CODEPAGE_1251 is not set
CONFIG_NLS_ASCII=m
CONFIG_NLS_ISO8859_1=m
CONFIG_NLS_ISO8859_2=y
# CONFIG_NLS_ISO8859_3 is not set
CONFIG_NLS_ISO8859_4=m
CONFIG_NLS_ISO8859_5=m
CONFIG_NLS_ISO8859_6=y
CONFIG_NLS_ISO8859_7=m
CONFIG_NLS_ISO8859_9=y
CONFIG_NLS_ISO8859_13=m
CONFIG_NLS_ISO8859_14=m
CONFIG_NLS_ISO8859_15=m
CONFIG_NLS_KOI8_R=y
CONFIG_NLS_KOI8_U=y
CONFIG_NLS_MAC_ROMAN=m
CONFIG_NLS_MAC_CELTIC=m
# CONFIG_NLS_MAC_CENTEURO is not set
# CONFIG_NLS_MAC_CROATIAN is not set
CONFIG_NLS_MAC_CYRILLIC=m
CONFIG_NLS_MAC_GAELIC=m
CONFIG_NLS_MAC_GREEK=y
# CONFIG_NLS_MAC_ICELAND is not set
CONFIG_NLS_MAC_INUIT=y
CONFIG_NLS_MAC_ROMANIAN=m
CONFIG_NLS_MAC_TURKISH=y
CONFIG_NLS_UTF8=y
CONFIG_DLM=m
# CONFIG_DLM_DEPRECATED_API is not set
# CONFIG_DLM_DEBUG is not set
# CONFIG_UNICODE is not set
CONFIG_IO_WQ=y
# end of File systems

#
# Security options
#
CONFIG_KEYS=y
CONFIG_KEYS_REQUEST_CACHE=y
# CONFIG_PERSISTENT_KEYRINGS is not set
CONFIG_TRUSTED_KEYS=y
CONFIG_TRUSTED_KEYS_TPM=y
# CONFIG_TRUSTED_KEYS_TEE is not set
CONFIG_ENCRYPTED_KEYS=m
# CONFIG_USER_DECRYPTED_DATA is not set
# CONFIG_KEY_DH_OPERATIONS is not set
CONFIG_SECURITY_DMESG_RESTRICT=y
# CONFIG_SECURITYFS is not set
CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
# CONFIG_HARDENED_USERCOPY is not set
# CONFIG_FORTIFY_SOURCE is not set
# CONFIG_STATIC_USERMODEHELPER is not set
# CONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT is not set
CONFIG_DEFAULT_SECURITY_DAC=y
CONFIG_LSM="landlock,lockdown,yama,loadpin,safesetid,integrity,bpf"

#
# Kernel hardening options
#

#
# Memory initialization
#
CONFIG_CC_HAS_AUTO_VAR_INIT_PATTERN=y
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO=y
# CONFIG_INIT_STACK_NONE is not set
CONFIG_INIT_STACK_ALL_PATTERN=y
# CONFIG_INIT_STACK_ALL_ZERO is not set
CONFIG_INIT_ON_ALLOC_DEFAULT_ON=y
# CONFIG_INIT_ON_FREE_DEFAULT_ON is not set
# end of Memory initialization

CONFIG_CC_HAS_RANDSTRUCT=y
CONFIG_RANDSTRUCT_NONE=y
# CONFIG_RANDSTRUCT_FULL is not set
# end of Kernel hardening options
# end of Security options

CONFIG_XOR_BLOCKS=y
CONFIG_ASYNC_CORE=y
CONFIG_ASYNC_MEMCPY=y
CONFIG_ASYNC_XOR=y
CONFIG_ASYNC_PQ=y
CONFIG_ASYNC_RAID6_RECOV=y
CONFIG_CRYPTO=y

#
# Crypto core or helper
#
CONFIG_CRYPTO_ALGAPI=y
CONFIG_CRYPTO_ALGAPI2=y
CONFIG_CRYPTO_AEAD=y
CONFIG_CRYPTO_AEAD2=y
CONFIG_CRYPTO_SKCIPHER=y
CONFIG_CRYPTO_SKCIPHER2=y
CONFIG_CRYPTO_HASH=y
CONFIG_CRYPTO_HASH2=y
CONFIG_CRYPTO_RNG=y
CONFIG_CRYPTO_RNG2=y
CONFIG_CRYPTO_RNG_DEFAULT=y
CONFIG_CRYPTO_AKCIPHER2=y
CONFIG_CRYPTO_AKCIPHER=y
CONFIG_CRYPTO_KPP2=y
CONFIG_CRYPTO_KPP=y
CONFIG_CRYPTO_ACOMP2=y
CONFIG_CRYPTO_MANAGER=y
CONFIG_CRYPTO_MANAGER2=y
# CONFIG_CRYPTO_USER is not set
CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
CONFIG_CRYPTO_GF128MUL=m
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_NULL2=y
CONFIG_CRYPTO_PCRYPT=y
# CONFIG_CRYPTO_CRYPTD is not set
CONFIG_CRYPTO_AUTHENC=y
CONFIG_CRYPTO_TEST=y
CONFIG_CRYPTO_ENGINE=y

#
# Public-key cryptography
#
CONFIG_CRYPTO_RSA=y
CONFIG_CRYPTO_DH=y
CONFIG_CRYPTO_DH_RFC7919_GROUPS=y
CONFIG_CRYPTO_ECC=y
# CONFIG_CRYPTO_ECDH is not set
# CONFIG_CRYPTO_ECDSA is not set
CONFIG_CRYPTO_ECRDSA=y
CONFIG_CRYPTO_SM2=y
CONFIG_CRYPTO_CURVE25519=y

#
# Authenticated Encryption with Associated Data
#
# CONFIG_CRYPTO_CCM is not set
CONFIG_CRYPTO_GCM=m
CONFIG_CRYPTO_CHACHA20POLY1305=m
CONFIG_CRYPTO_AEGIS128=m
CONFIG_CRYPTO_SEQIV=m
CONFIG_CRYPTO_ECHAINIV=y

#
# Block modes
#
CONFIG_CRYPTO_CBC=y
CONFIG_CRYPTO_CFB=m
CONFIG_CRYPTO_CTR=y
CONFIG_CRYPTO_CTS=y
CONFIG_CRYPTO_ECB=y
CONFIG_CRYPTO_LRW=m
CONFIG_CRYPTO_OFB=y
CONFIG_CRYPTO_PCBC=y
CONFIG_CRYPTO_XCTR=m
CONFIG_CRYPTO_XTS=y
CONFIG_CRYPTO_KEYWRAP=y
# CONFIG_CRYPTO_ADIANTUM is not set
CONFIG_CRYPTO_HCTR2=m
CONFIG_CRYPTO_ESSIV=m

#
# Hash modes
#
CONFIG_CRYPTO_CMAC=m
CONFIG_CRYPTO_HMAC=y
CONFIG_CRYPTO_XCBC=y
# CONFIG_CRYPTO_VMAC is not set

#
# Digest
#
CONFIG_CRYPTO_CRC32C=y
CONFIG_CRYPTO_CRC32=m
CONFIG_CRYPTO_CRC32_S390=y
CONFIG_CRYPTO_XXHASH=y
CONFIG_CRYPTO_BLAKE2B=m
CONFIG_CRYPTO_CRCT10DIF=y
CONFIG_CRYPTO_CRC64_ROCKSOFT=y
CONFIG_CRYPTO_GHASH=m
CONFIG_CRYPTO_POLYVAL=m
CONFIG_CRYPTO_POLY1305=m
CONFIG_CRYPTO_MD4=m
CONFIG_CRYPTO_MD5=m
CONFIG_CRYPTO_MICHAEL_MIC=m
CONFIG_CRYPTO_RMD160=m
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA512_S390=m
# CONFIG_CRYPTO_SHA1_S390 is not set
CONFIG_CRYPTO_SHA256=y
# CONFIG_CRYPTO_SHA256_S390 is not set
CONFIG_CRYPTO_SHA512=y
CONFIG_CRYPTO_SHA3=y
CONFIG_CRYPTO_SHA3_256_S390=m
# CONFIG_CRYPTO_SHA3_512_S390 is not set
CONFIG_CRYPTO_SM3=y
CONFIG_CRYPTO_SM3_GENERIC=y
CONFIG_CRYPTO_STREEBOG=y
# CONFIG_CRYPTO_WP512 is not set
CONFIG_CRYPTO_GHASH_S390=m

#
# Ciphers
#
CONFIG_CRYPTO_AES=y
CONFIG_CRYPTO_AES_TI=m
# CONFIG_CRYPTO_AES_S390 is not set
# CONFIG_CRYPTO_BLOWFISH is not set
CONFIG_CRYPTO_CAMELLIA=y
CONFIG_CRYPTO_CAST_COMMON=y
CONFIG_CRYPTO_CAST5=y
# CONFIG_CRYPTO_CAST6 is not set
# CONFIG_CRYPTO_DES is not set
CONFIG_CRYPTO_DES_S390=m
CONFIG_CRYPTO_FCRYPT=y
CONFIG_CRYPTO_CHACHA20=m
CONFIG_CRYPTO_CHACHA_S390=y
# CONFIG_CRYPTO_ARIA is not set
CONFIG_CRYPTO_SERPENT=m
CONFIG_CRYPTO_SM4=y
CONFIG_CRYPTO_SM4_GENERIC=y
CONFIG_CRYPTO_TWOFISH=m
CONFIG_CRYPTO_TWOFISH_COMMON=m

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=m
# CONFIG_CRYPTO_LZO is not set
CONFIG_CRYPTO_842=m
# CONFIG_CRYPTO_LZ4 is not set
# CONFIG_CRYPTO_LZ4HC is not set
CONFIG_CRYPTO_ZSTD=y

#
# Random Number Generation
#
CONFIG_CRYPTO_ANSI_CPRNG=y
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
CONFIG_CRYPTO_DRBG_HASH=y
# CONFIG_CRYPTO_DRBG_CTR is not set
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
CONFIG_CRYPTO_USER_API=y
CONFIG_CRYPTO_USER_API_HASH=y
# CONFIG_CRYPTO_USER_API_SKCIPHER is not set
# CONFIG_CRYPTO_USER_API_RNG is not set
CONFIG_CRYPTO_USER_API_AEAD=m
# CONFIG_CRYPTO_USER_API_ENABLE_OBSOLETE is not set
CONFIG_CRYPTO_HASH_INFO=y
CONFIG_CRYPTO_HW=y
CONFIG_CRYPTO_DEV_ALLWINNER=y
CONFIG_ZCRYPT=y
CONFIG_ZCRYPT_DEBUG=y
# CONFIG_ZCRYPT_MULTIDEVNODES is not set
CONFIG_PKEY=y
CONFIG_CRYPTO_PAES_S390=y
CONFIG_S390_PRNG=y
CONFIG_CRYPTO_DEV_EXYNOS_RNG=m
# CONFIG_CRYPTO_DEV_S5P is not set
# CONFIG_CRYPTO_DEV_ATMEL_AES is not set
CONFIG_CRYPTO_DEV_ATMEL_TDES=m
# CONFIG_CRYPTO_DEV_ATMEL_SHA is not set
# CONFIG_CRYPTO_DEV_ATMEL_ECC is not set
# CONFIG_CRYPTO_DEV_ATMEL_SHA204A is not set
CONFIG_CRYPTO_DEV_QAT=y
# CONFIG_CRYPTO_DEV_QAT_DH895xCC is not set
CONFIG_CRYPTO_DEV_QAT_C3XXX=y
CONFIG_CRYPTO_DEV_QAT_C62X=y
CONFIG_CRYPTO_DEV_QAT_4XXX=m
CONFIG_CRYPTO_DEV_QAT_DH895xCCVF=y
CONFIG_CRYPTO_DEV_QAT_C3XXXVF=m
CONFIG_CRYPTO_DEV_QAT_C62XVF=m
CONFIG_CRYPTO_DEV_CPT=m
CONFIG_CAVIUM_CPT=m
# CONFIG_CRYPTO_DEV_NITROX_CNN55XX is not set
CONFIG_CRYPTO_DEV_MARVELL=y
CONFIG_CRYPTO_DEV_OCTEONTX_CPT=y
CONFIG_CRYPTO_DEV_CAVIUM_ZIP=y
CONFIG_CRYPTO_DEV_QCE=y
CONFIG_CRYPTO_DEV_QCE_SKCIPHER=y
CONFIG_CRYPTO_DEV_QCE_SHA=y
CONFIG_CRYPTO_DEV_QCE_AEAD=y
CONFIG_CRYPTO_DEV_QCE_ENABLE_ALL=y
# CONFIG_CRYPTO_DEV_QCE_ENABLE_SKCIPHER is not set
# CONFIG_CRYPTO_DEV_QCE_ENABLE_SHA is not set
# CONFIG_CRYPTO_DEV_QCE_ENABLE_AEAD is not set
CONFIG_CRYPTO_DEV_QCE_SW_MAX_LEN=512
CONFIG_CRYPTO_DEV_QCOM_RNG=m
CONFIG_CRYPTO_DEV_IMGTEC_HASH=m
CONFIG_CRYPTO_DEV_ZYNQMP_AES=y
CONFIG_CRYPTO_DEV_ZYNQMP_SHA3=y
CONFIG_CRYPTO_DEV_CHELSIO=m
CONFIG_CRYPTO_DEV_VIRTIO=y
CONFIG_CRYPTO_DEV_SAFEXCEL=m
CONFIG_CRYPTO_DEV_HISI_SEC=y
CONFIG_CRYPTO_DEV_AMLOGIC_GXL=y
# CONFIG_CRYPTO_DEV_AMLOGIC_GXL_DEBUG is not set
CONFIG_CRYPTO_DEV_SA2UL=y
CONFIG_CRYPTO_DEV_KEEMBAY_OCS_AES_SM4=m
CONFIG_CRYPTO_DEV_KEEMBAY_OCS_AES_SM4_ECB=y
# CONFIG_CRYPTO_DEV_KEEMBAY_OCS_AES_SM4_CTS is not set
# CONFIG_CRYPTO_DEV_KEEMBAY_OCS_ECC is not set
# CONFIG_CRYPTO_DEV_KEEMBAY_OCS_HCU is not set
CONFIG_ASYMMETRIC_KEY_TYPE=y
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
CONFIG_X509_CERTIFICATE_PARSER=y
CONFIG_PKCS8_PRIVATE_KEY_PARSER=m
CONFIG_PKCS7_MESSAGE_PARSER=y
# CONFIG_PKCS7_TEST_KEY is not set
# CONFIG_SIGNED_PE_FILE_VERIFICATION is not set
# CONFIG_FIPS_SIGNATURE_SELFTEST is not set

#
# Certificates for signature checking
#
CONFIG_MODULE_SIG_KEY="certs/signing_key.pem"
CONFIG_MODULE_SIG_KEY_TYPE_RSA=y
# CONFIG_MODULE_SIG_KEY_TYPE_ECDSA is not set
CONFIG_SYSTEM_TRUSTED_KEYRING=y
CONFIG_SYSTEM_TRUSTED_KEYS=""
# CONFIG_SYSTEM_EXTRA_CERTIFICATE is not set
CONFIG_SECONDARY_TRUSTED_KEYRING=y
CONFIG_SYSTEM_BLACKLIST_KEYRING=y
CONFIG_SYSTEM_BLACKLIST_HASH_LIST=""
CONFIG_SYSTEM_REVOCATION_LIST=y
CONFIG_SYSTEM_REVOCATION_KEYS=""
CONFIG_SYSTEM_BLACKLIST_AUTH_UPDATE=y
# end of Certificates for signature checking

CONFIG_BINARY_PRINTF=y

#
# Library routines
#
CONFIG_RAID6_PQ=y
# CONFIG_RAID6_PQ_BENCHMARK is not set
CONFIG_LINEAR_RANGES=y
CONFIG_PACKING=y
CONFIG_BITREVERSE=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_GENERIC_NET_UTILS=y
# CONFIG_CORDIC is not set
CONFIG_PRIME_NUMBERS=m
CONFIG_RATIONAL=y
CONFIG_STMP_DEVICE=y
CONFIG_ARCH_USE_CMPXCHG_LOCKREF=y

#
# Crypto library routines
#
CONFIG_CRYPTO_LIB_AES=y
CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=y
CONFIG_CRYPTO_ARCH_HAVE_LIB_CHACHA=y
CONFIG_CRYPTO_LIB_CHACHA_GENERIC=y
CONFIG_CRYPTO_LIB_CHACHA=m
CONFIG_CRYPTO_LIB_CURVE25519_GENERIC=y
CONFIG_CRYPTO_LIB_CURVE25519=m
CONFIG_CRYPTO_LIB_DES=y
CONFIG_CRYPTO_LIB_POLY1305_RSIZE=1
CONFIG_CRYPTO_LIB_POLY1305_GENERIC=m
CONFIG_CRYPTO_LIB_POLY1305=m
CONFIG_CRYPTO_LIB_CHACHA20POLY1305=m
CONFIG_CRYPTO_LIB_SHA1=y
CONFIG_CRYPTO_LIB_SHA256=y
# end of Crypto library routines

CONFIG_LIB_MEMNEQ=y
CONFIG_CRC_CCITT=y
CONFIG_CRC16=y
CONFIG_CRC_T10DIF=y
CONFIG_CRC64_ROCKSOFT=y
CONFIG_CRC_ITU_T=y
CONFIG_CRC32=y
# CONFIG_CRC32_SELFTEST is not set
CONFIG_CRC32_SLICEBY8=y
# CONFIG_CRC32_SLICEBY4 is not set
# CONFIG_CRC32_SARWATE is not set
# CONFIG_CRC32_BIT is not set
CONFIG_CRC64=y
CONFIG_CRC4=y
CONFIG_CRC7=m
CONFIG_LIBCRC32C=y
CONFIG_CRC8=y
CONFIG_XXHASH=y
CONFIG_RANDOM32_SELFTEST=y
CONFIG_842_COMPRESS=m
CONFIG_842_DECOMPRESS=m
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=m
CONFIG_ZLIB_DFLTCC=y
CONFIG_LZO_COMPRESS=m
CONFIG_LZO_DECOMPRESS=m
CONFIG_ZSTD_COMPRESS=y
CONFIG_ZSTD_DECOMPRESS=y
CONFIG_XZ_DEC=y
CONFIG_XZ_DEC_X86=y
CONFIG_XZ_DEC_POWERPC=y
# CONFIG_XZ_DEC_IA64 is not set
# CONFIG_XZ_DEC_ARM is not set
CONFIG_XZ_DEC_ARMTHUMB=y
# CONFIG_XZ_DEC_SPARC is not set
# CONFIG_XZ_DEC_MICROLZMA is not set
CONFIG_XZ_DEC_BCJ=y
# CONFIG_XZ_DEC_TEST is not set
CONFIG_DECOMPRESS_BZIP2=y
CONFIG_DECOMPRESS_XZ=y
CONFIG_DECOMPRESS_ZSTD=y
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_REED_SOLOMON=m
CONFIG_REED_SOLOMON_DEC16=y
CONFIG_BCH=m
CONFIG_INTERVAL_TREE=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_DMA=y
CONFIG_DMA_OPS=y
CONFIG_NEED_SG_DMA_LENGTH=y
CONFIG_NEED_DMA_MAP_STATE=y
CONFIG_ARCH_DMA_ADDR_T_64BIT=y
CONFIG_ARCH_HAS_FORCE_DMA_UNENCRYPTED=y
CONFIG_SWIOTLB=y
CONFIG_DMA_CMA=y
# CONFIG_DMA_PERNUMA_CMA is not set

#
# Default contiguous memory area size:
#
CONFIG_CMA_SIZE_PERCENTAGE=10
# CONFIG_CMA_SIZE_SEL_MBYTES is not set
CONFIG_CMA_SIZE_SEL_PERCENTAGE=y
# CONFIG_CMA_SIZE_SEL_MIN is not set
# CONFIG_CMA_SIZE_SEL_MAX is not set
CONFIG_CMA_ALIGNMENT=8
CONFIG_DMA_API_DEBUG=y
CONFIG_DMA_API_DEBUG_SG=y
CONFIG_DMA_MAP_BENCHMARK=y
CONFIG_SGL_ALLOC=y
CONFIG_IOMMU_HELPER=y
CONFIG_CHECK_SIGNATURE=y
CONFIG_CPU_RMAP=y
CONFIG_DQL=y
CONFIG_GLOB=y
# CONFIG_GLOB_SELFTEST is not set
CONFIG_NLATTR=y
CONFIG_LRU_CACHE=m
CONFIG_CLZ_TAB=y
CONFIG_IRQ_POLL=y
CONFIG_MPILIB=y
CONFIG_DIMLIB=y
CONFIG_OID_REGISTRY=y
CONFIG_HAVE_GENERIC_VDSO=y
CONFIG_GENERIC_GETTIMEOFDAY=y
CONFIG_GENERIC_VDSO_TIME_NS=y
CONFIG_SG_SPLIT=y
CONFIG_SG_POOL=y
CONFIG_MEMREGION=y
CONFIG_ARCH_STACKWALK=y
CONFIG_STACKDEPOT=y
CONFIG_REF_TRACKER=y
CONFIG_SBITMAP=y
CONFIG_PARMAN=y
CONFIG_OBJAGG=y
# end of Library routines

CONFIG_PLDMFW=y
CONFIG_ASN1_ENCODER=y
CONFIG_POLYNOMIAL=m

#
# Kernel hacking
#

#
# printk and dmesg options
#
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_CONSOLE_LOGLEVEL_QUIET=4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
CONFIG_SYMBOLIC_ERRNAME=y
# CONFIG_DEBUG_BUGVERBOSE is not set
# end of printk and dmesg options

CONFIG_DEBUG_KERNEL=y
# CONFIG_DEBUG_MISC is not set

#
# Compile-time checks and compiler options
#
CONFIG_DEBUG_INFO=y
# CONFIG_DEBUG_INFO_NONE is not set
CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
# CONFIG_DEBUG_INFO_DWARF4 is not set
# CONFIG_DEBUG_INFO_DWARF5 is not set
CONFIG_DEBUG_INFO_REDUCED=y
CONFIG_DEBUG_INFO_SPLIT=y
CONFIG_PAHOLE_HAS_SPLIT_BTF=y
CONFIG_PAHOLE_HAS_BTF_TAG=y
CONFIG_GDB_SCRIPTS=y
CONFIG_FRAME_WARN=2048
# CONFIG_STRIP_ASM_SYMS is not set
CONFIG_HEADERS_INSTALL=y
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
# CONFIG_VMLINUX_MAP is not set
# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
# end of Compile-time checks and compiler options

#
# Generic Kernel Debugging Instruments
#
CONFIG_MAGIC_SYSRQ=y
CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x1
# CONFIG_MAGIC_SYSRQ_SERIAL is not set
CONFIG_DEBUG_FS=y
# CONFIG_DEBUG_FS_ALLOW_ALL is not set
CONFIG_DEBUG_FS_DISALLOW_MOUNT=y
# CONFIG_DEBUG_FS_ALLOW_NONE is not set
CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=y
CONFIG_UBSAN=y
CONFIG_CC_HAS_UBSAN_BOUNDS=y
CONFIG_CC_HAS_UBSAN_ARRAY_BOUNDS=y
CONFIG_UBSAN_BOUNDS=y
CONFIG_UBSAN_ARRAY_BOUNDS=y
# CONFIG_UBSAN_SHIFT is not set
# CONFIG_UBSAN_UNREACHABLE is not set
CONFIG_UBSAN_BOOL=y
CONFIG_UBSAN_ENUM=y
# CONFIG_UBSAN_SANITIZE_ALL is not set
# CONFIG_TEST_UBSAN is not set
CONFIG_HAVE_ARCH_KCSAN=y
CONFIG_HAVE_KCSAN_COMPILER=y
CONFIG_KCSAN=y
CONFIG_CC_HAS_TSAN_COMPOUND_READ_BEFORE_WRITE=y
# CONFIG_KCSAN_SELFTEST is not set
# CONFIG_KCSAN_EARLY_ENABLE is not set
CONFIG_KCSAN_NUM_WATCHPOINTS=64
CONFIG_KCSAN_UDELAY_TASK=80
CONFIG_KCSAN_UDELAY_INTERRUPT=20
# CONFIG_KCSAN_DELAY_RANDOMIZE is not set
CONFIG_KCSAN_SKIP_WATCH=4000
CONFIG_KCSAN_SKIP_WATCH_RANDOMIZE=y
CONFIG_KCSAN_INTERRUPT_WATCHER=y
CONFIG_KCSAN_REPORT_ONCE_IN_MS=3000
# CONFIG_KCSAN_REPORT_RACE_UNKNOWN_ORIGIN is not set
CONFIG_KCSAN_STRICT=y
CONFIG_KCSAN_WEAK_MEMORY=y
# end of Generic Kernel Debugging Instruments

#
# Networking Debugging
#
# CONFIG_NET_DEV_REFCNT_TRACKER is not set
CONFIG_NET_NS_REFCNT_TRACKER=y
# CONFIG_DEBUG_NET is not set
# end of Networking Debugging

#
# Memory Debugging
#
CONFIG_PAGE_EXTENSION=y
CONFIG_DEBUG_PAGEALLOC=y
# CONFIG_DEBUG_PAGEALLOC_ENABLE_DEFAULT is not set
CONFIG_DEBUG_SLAB=y
# CONFIG_PAGE_OWNER is not set
# CONFIG_PAGE_POISONING is not set
# CONFIG_DEBUG_PAGE_REF is not set
# CONFIG_DEBUG_RODATA_TEST is not set
CONFIG_ARCH_HAS_DEBUG_WX=y
CONFIG_DEBUG_WX=y
CONFIG_GENERIC_PTDUMP=y
CONFIG_PTDUMP_CORE=y
# CONFIG_PTDUMP_DEBUGFS is not set
CONFIG_DEBUG_OBJECTS=y
CONFIG_DEBUG_OBJECTS_SELFTEST=y
CONFIG_DEBUG_OBJECTS_FREE=y
# CONFIG_DEBUG_OBJECTS_TIMERS is not set
# CONFIG_DEBUG_OBJECTS_WORK is not set
CONFIG_DEBUG_OBJECTS_RCU_HEAD=y
CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER=y
CONFIG_DEBUG_OBJECTS_ENABLE_DEFAULT=1
CONFIG_SHRINKER_DEBUG=y
CONFIG_HAVE_DEBUG_KMEMLEAK=y
CONFIG_DEBUG_KMEMLEAK=y
CONFIG_DEBUG_KMEMLEAK_MEM_POOL_SIZE=16000
# CONFIG_DEBUG_KMEMLEAK_TEST is not set
CONFIG_DEBUG_KMEMLEAK_DEFAULT_OFF=y
# CONFIG_DEBUG_KMEMLEAK_AUTO_SCAN is not set
# CONFIG_DEBUG_STACK_USAGE is not set
CONFIG_SCHED_STACK_END_CHECK=y
CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=y
# CONFIG_DEBUG_VM is not set
CONFIG_DEBUG_VM_PGTABLE=y
CONFIG_DEBUG_MEMORY_INIT=y
# CONFIG_DEBUG_PER_CPU_MAPS is not set
CONFIG_HAVE_ARCH_KASAN=y
CONFIG_HAVE_ARCH_KASAN_VMALLOC=y
CONFIG_CC_HAS_KASAN_GENERIC=y
CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
CONFIG_HAVE_ARCH_KFENCE=y
# CONFIG_KFENCE is not set
# end of Memory Debugging

CONFIG_DEBUG_SHIRQ=y

#
# Debug Oops, Lockups and Hangs
#
# CONFIG_PANIC_ON_OOPS is not set
CONFIG_PANIC_ON_OOPS_VALUE=0
CONFIG_PANIC_TIMEOUT=0
# CONFIG_DETECT_HUNG_TASK is not set
# CONFIG_WQ_WATCHDOG is not set
# CONFIG_TEST_LOCKUP is not set
# end of Debug Oops, Lockups and Hangs

#
# Scheduler Debugging
#
CONFIG_SCHED_DEBUG=y
CONFIG_SCHED_INFO=y
CONFIG_SCHEDSTATS=y
# end of Scheduler Debugging

CONFIG_DEBUG_TIMEKEEPING=y

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_LOCK_DEBUGGING_SUPPORT=y
# CONFIG_PROVE_LOCKING is not set
CONFIG_LOCK_STAT=y
CONFIG_DEBUG_RT_MUTEXES=y
CONFIG_DEBUG_SPINLOCK=y
CONFIG_DEBUG_MUTEXES=y
# CONFIG_DEBUG_WW_MUTEX_SLOWPATH is not set
# CONFIG_DEBUG_RWSEMS is not set
CONFIG_DEBUG_LOCK_ALLOC=y
CONFIG_LOCKDEP=y
CONFIG_LOCKDEP_BITS=15
CONFIG_LOCKDEP_CHAINS_BITS=16
CONFIG_LOCKDEP_STACK_TRACE_BITS=19
CONFIG_LOCKDEP_STACK_TRACE_HASH_BITS=14
CONFIG_LOCKDEP_CIRCULAR_QUEUE_BITS=12
# CONFIG_DEBUG_LOCKDEP is not set
CONFIG_DEBUG_ATOMIC_SLEEP=y
# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
CONFIG_LOCK_TORTURE_TEST=m
# CONFIG_WW_MUTEX_SELFTEST is not set
CONFIG_SCF_TORTURE_TEST=m
CONFIG_CSD_LOCK_WAIT_DEBUG=y
# end of Lock Debugging (spinlocks, mutexes, etc...)

CONFIG_TRACE_IRQFLAGS=y
CONFIG_DEBUG_IRQFLAGS=y
CONFIG_STACKTRACE=y
CONFIG_WARN_ALL_UNSEEDED_RANDOM=y
CONFIG_DEBUG_KOBJECT=y

#
# Debug kernel data structures
#
# CONFIG_DEBUG_LIST is not set
CONFIG_DEBUG_PLIST=y
# CONFIG_DEBUG_SG is not set
CONFIG_DEBUG_NOTIFIERS=y
# CONFIG_BUG_ON_DATA_CORRUPTION is not set
# end of Debug kernel data structures

# CONFIG_DEBUG_CREDENTIALS is not set

#
# RCU Debugging
#
CONFIG_TORTURE_TEST=m
CONFIG_RCU_SCALE_TEST=m
CONFIG_RCU_TORTURE_TEST=m
# CONFIG_RCU_REF_SCALE_TEST is not set
CONFIG_RCU_CPU_STALL_TIMEOUT=21
CONFIG_RCU_EXP_CPU_STALL_TIMEOUT=0
CONFIG_RCU_TRACE=y
CONFIG_RCU_EQS_DEBUG=y
# end of RCU Debugging

CONFIG_DEBUG_WQ_FORCE_RR_CPU=y
CONFIG_CPU_HOTPLUG_STATE_CONTROL=y
CONFIG_LATENCYTOP=y
CONFIG_NOP_TRACER=y
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
CONFIG_HAVE_DYNAMIC_FTRACE=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_HAVE_FENTRY=y
CONFIG_HAVE_NOP_MCOUNT=y
CONFIG_TRACER_MAX_TRACE=y
CONFIG_TRACE_CLOCK=y
CONFIG_RING_BUFFER=y
CONFIG_EVENT_TRACING=y
CONFIG_CONTEXT_SWITCH_TRACER=y
CONFIG_RING_BUFFER_ALLOW_SWAP=y
CONFIG_PREEMPTIRQ_TRACEPOINTS=y
CONFIG_TRACING=y
CONFIG_GENERIC_TRACER=y
CONFIG_TRACING_SUPPORT=y
CONFIG_FTRACE=y
CONFIG_BOOTTIME_TRACING=y
CONFIG_FUNCTION_TRACER=y
# CONFIG_FUNCTION_GRAPH_TRACER is not set
CONFIG_DYNAMIC_FTRACE=y
CONFIG_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y
CONFIG_DYNAMIC_FTRACE_WITH_ARGS=y
CONFIG_FUNCTION_PROFILER=y
CONFIG_STACK_TRACER=y
CONFIG_IRQSOFF_TRACER=y
# CONFIG_SCHED_TRACER is not set
CONFIG_HWLAT_TRACER=y
CONFIG_OSNOISE_TRACER=y
CONFIG_TIMERLAT_TRACER=y
# CONFIG_FTRACE_SYSCALLS is not set
CONFIG_TRACER_SNAPSHOT=y
CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP=y
CONFIG_TRACE_BRANCH_PROFILING=y
# CONFIG_BRANCH_PROFILE_NONE is not set
CONFIG_PROFILE_ANNOTATED_BRANCHES=y
# CONFIG_PROFILE_ALL_BRANCHES is not set
# CONFIG_BRANCH_TRACER is not set
# CONFIG_BLK_DEV_IO_TRACE is not set
CONFIG_DYNAMIC_EVENTS=y
CONFIG_FTRACE_MCOUNT_RECORD=y
CONFIG_FTRACE_MCOUNT_USE_CC=y
CONFIG_TRACING_MAP=y
CONFIG_SYNTH_EVENTS=y
# CONFIG_USER_EVENTS is not set
CONFIG_HIST_TRIGGERS=y
CONFIG_TRACE_EVENT_INJECT=y
CONFIG_TRACEPOINT_BENCHMARK=y
# CONFIG_RING_BUFFER_BENCHMARK is not set
# CONFIG_TRACE_EVAL_MAP_FILE is not set
CONFIG_FTRACE_RECORD_RECURSION=y
CONFIG_FTRACE_RECORD_RECURSION_SIZE=128
CONFIG_RING_BUFFER_RECORD_RECURSION=y
CONFIG_FTRACE_SELFTEST=y
CONFIG_FTRACE_STARTUP_TEST=y
CONFIG_EVENT_TRACE_STARTUP_TEST=y
CONFIG_EVENT_TRACE_TEST_SYSCALLS=y
CONFIG_RING_BUFFER_STARTUP_TEST=y
# CONFIG_RING_BUFFER_VALIDATE_TIME_DELTAS is not set
# CONFIG_PREEMPTIRQ_DELAY_TEST is not set
# CONFIG_SYNTH_EVENT_GEN_TEST is not set
CONFIG_HIST_TRIGGERS_DEBUG=y
# CONFIG_RV is not set
# CONFIG_SAMPLES is not set
CONFIG_HAVE_SAMPLE_FTRACE_DIRECT=y
CONFIG_HAVE_SAMPLE_FTRACE_DIRECT_MULTI=y
CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=y

#
# s390 Debugging
#
CONFIG_EARLY_PRINTK=y
CONFIG_DEBUG_ENTRY=y
CONFIG_CIO_INJECT=y
# end of s390 Debugging

#
# Kernel Testing and Coverage
#
# CONFIG_KUNIT is not set
CONFIG_NOTIFIER_ERROR_INJECTION=m
# CONFIG_NETDEV_NOTIFIER_ERROR_INJECT is not set
# CONFIG_FAULT_INJECTION is not set
CONFIG_ARCH_HAS_KCOV=y
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
# CONFIG_KCOV is not set
CONFIG_RUNTIME_TESTING_MENU=y
CONFIG_LKDTM=m
# CONFIG_TEST_MIN_HEAP is not set
# CONFIG_TEST_DIV64 is not set
CONFIG_BACKTRACE_SELF_TEST=y
CONFIG_TEST_REF_TRACKER=m
CONFIG_RBTREE_TEST=m
# CONFIG_REED_SOLOMON_TEST is not set
CONFIG_INTERVAL_TREE_TEST=m
CONFIG_PERCPU_TEST=m
CONFIG_ATOMIC64_SELFTEST=m
CONFIG_ASYNC_RAID6_TEST=y
# CONFIG_TEST_HEXDUMP is not set
CONFIG_STRING_SELFTEST=y
CONFIG_TEST_STRING_HELPERS=y
# CONFIG_TEST_STRSCPY is not set
CONFIG_TEST_KSTRTOX=m
# CONFIG_TEST_PRINTF is not set
CONFIG_TEST_SCANF=y
# CONFIG_TEST_BITMAP is not set
CONFIG_TEST_UUID=y
CONFIG_TEST_XARRAY=y
CONFIG_TEST_RHASHTABLE=m
CONFIG_TEST_SIPHASH=y
# CONFIG_TEST_IDA is not set
CONFIG_TEST_PARMAN=m
CONFIG_TEST_LKM=m
CONFIG_TEST_BITOPS=m
# CONFIG_TEST_VMALLOC is not set
# CONFIG_TEST_USER_COPY is not set
CONFIG_TEST_BPF=m
CONFIG_TEST_BLACKHOLE_DEV=m
CONFIG_FIND_BIT_BENCHMARK=y
CONFIG_TEST_FIRMWARE=m
CONFIG_TEST_SYSCTL=y
# CONFIG_TEST_UDELAY is not set
# CONFIG_TEST_STATIC_KEYS is not set
# CONFIG_TEST_MEMCAT_P is not set
# CONFIG_TEST_OBJAGG is not set
# CONFIG_TEST_MEMINIT is not set
CONFIG_TEST_FREE_PAGES=m
# end of Kernel Testing and Coverage

CONFIG_WARN_MISSING_DOCUMENTS=y
CONFIG_WARN_ABI_ERRORS=y
# end of Kernel hacking

--SzSsESMIxQXg3A71--
