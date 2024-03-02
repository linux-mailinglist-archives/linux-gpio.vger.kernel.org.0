Return-Path: <linux-gpio+bounces-4063-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E57086F0BC
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Mar 2024 16:01:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 62BA6B21C06
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Mar 2024 15:01:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA71617BD3;
	Sat,  2 Mar 2024 15:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tha7k2B6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112FA1754F
	for <linux-gpio@vger.kernel.org>; Sat,  2 Mar 2024 15:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709391655; cv=none; b=uE0yDrXi7Na+/iRsjcMAilpn+B4NdJPknsKxNt7vxf37LfB2H7pLGeq20qMw3imH3VsMiu48ERIozCHGajpKIhIeYvAQN1F237clGJqiSfQZFYM21gNKtJwLKXWNhLmAIEzAIPab1pqe1B0jQ82trXGe6UmVkbBWlAbs2jg29hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709391655; c=relaxed/simple;
	bh=eA1kHRfO6z7ClMVS2v6m9LQHnLosiYCi9uDcESMKg/8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iTXnOJRVhDB1eah7MTT6OGiQVV7rc0MzMvy5U7X4B08S0iooKpycLWLHgMjel+zJgi5C+4Wc8Ff2xVa7KMvUtShsZBRp5wwkDaLD4hL1UHge5AZxNQCQfX4/RVPmJKFQjMlWiDnkyUXKfYXBjReLf45GdYogDH8+T4pHhBbsvkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tha7k2B6; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709391653; x=1740927653;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eA1kHRfO6z7ClMVS2v6m9LQHnLosiYCi9uDcESMKg/8=;
  b=Tha7k2B6XRVYuJyM3n3lcsvlZdHsRTc3kLkVDGVPdc2MAmzbJCL0mY7o
   DVPbcbUGO0eCOZcRTZVBRRS/g1P8cAqO6IWZez16eNarIkUcxaTxJVFN3
   dEL+dYh2cPcIsMp1L0cqzc0lhtovLbNPfmIxKuLLyRdTj3gZFng/co/uP
   OYP5XMNzLORrZucHG8q3V1da4ntuKWrlBjnCtQ3awA+Lx7cP8dlOXD0QO
   TEuzBoemu1PEv8XBmvnWU0nFwMp1nkbCATptLiuPzhrWQRjGpEfA60hyu
   nit+1lIPinov2sRI5X+0+3+/IBsrwvxI6Rp5J9fTuiY4gYLu2vABZIn07
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11001"; a="7744946"
X-IronPort-AV: E=Sophos;i="6.06,199,1705392000"; 
   d="scan'208";a="7744946"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2024 07:00:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,199,1705392000"; 
   d="scan'208";a="8881586"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 02 Mar 2024 07:00:52 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgQr2-00003w-2C;
	Sat, 02 Mar 2024 15:00:48 +0000
Date: Sat, 2 Mar 2024 23:00:12 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [linusw-pinctrl:ib-nomadik-gpio 27/27]
 include/linux/property.h:39:9: error: initialization of 'struct device_node
 *' from incompatible pointer type 'struct fwnode_handle *'
Message-ID: <202403022253.zPyD6rUu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git ib-nomadik-gpio
head:   528904342169c582c128c4f83fbc4a7c9611fb0a
commit: 528904342169c582c128c4f83fbc4a7c9611fb0a [27/27] gpio: nomadik: Finish conversion to use firmware node APIs
config: arm-randconfig-003-20240302 (https://download.01.org/0day-ci/archive/20240302/202403022253.zPyD6rUu-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240302/202403022253.zPyD6rUu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403022253.zPyD6rUu-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/of.h:19,
                    from include/linux/irqdomain.h:36,
                    from include/linux/gpio/driver.h:9,
                    from drivers/pinctrl/nomadik/pinctrl-nomadik.c:18:
   drivers/pinctrl/nomadik/pinctrl-nomadik.c: In function 'nmk_pinctrl_probe':
>> include/linux/property.h:39:9: error: initialization of 'struct device_node *' from incompatible pointer type 'struct fwnode_handle *' [-Werror=incompatible-pointer-types]
      39 |         _Generic((dev),                                                 \
         |         ^~~~~~~~
   drivers/pinctrl/nomadik/pinctrl-nomadik.c:1193:38: note: in expansion of macro 'dev_fwnode'
    1193 |         struct device_node *fwnode = dev_fwnode(&pdev->dev);
         |                                      ^~~~~~~~~~
>> drivers/pinctrl/nomadik/pinctrl-nomadik.c:1222:53: error: passing argument 1 of 'fwnode_find_reference' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1222 |                 gpio_fwnode = fwnode_find_reference(fwnode, "nomadik-gpio-chips", i);
         |                                                     ^~~~~~
         |                                                     |
         |                                                     struct device_node *
   include/linux/property.h:144:73: note: expected 'const struct fwnode_handle *' but argument is of type 'struct device_node *'
     144 | struct fwnode_handle *fwnode_find_reference(const struct fwnode_handle *fwnode,
         |                                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   drivers/pinctrl/nomadik/pinctrl-nomadik.c:1236:45: error: passing argument 1 of 'fwnode_find_reference' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1236 |         prcm_fwnode = fwnode_find_reference(fwnode, "prcm", 0);
         |                                             ^~~~~~
         |                                             |
         |                                             struct device_node *
   include/linux/property.h:144:73: note: expected 'const struct fwnode_handle *' but argument is of type 'struct device_node *'
     144 | struct fwnode_handle *fwnode_find_reference(const struct fwnode_handle *fwnode,
         |                                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
>> drivers/pinctrl/nomadik/pinctrl-nomadik.c:1236:21: error: assignment to 'struct device_node *' from incompatible pointer type 'struct fwnode_handle *' [-Werror=incompatible-pointer-types]
    1236 |         prcm_fwnode = fwnode_find_reference(fwnode, "prcm", 0);
         |                     ^
>> drivers/pinctrl/nomadik/pinctrl-nomadik.c:1238:48: error: passing argument 1 of 'fwnode_iomap' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1238 |                 npct->prcm_base = fwnode_iomap(prcm_fwnode, 0);
         |                                                ^~~~~~~~~~~
         |                                                |
         |                                                struct device_node *
   include/linux/property.h:452:50: note: expected 'struct fwnode_handle *' but argument is of type 'struct device_node *'
     452 | void __iomem *fwnode_iomap(struct fwnode_handle *fwnode, int index);
         |                            ~~~~~~~~~~~~~~~~~~~~~~^~~~~~
>> drivers/pinctrl/nomadik/pinctrl-nomadik.c:1239:35: error: passing argument 1 of 'fwnode_handle_put' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1239 |                 fwnode_handle_put(prcm_fwnode);
         |                                   ^~~~~~~~~~~
         |                                   |
         |                                   struct device_node *
   include/linux/property.h:190:46: note: expected 'struct fwnode_handle *' but argument is of type 'struct device_node *'
     190 | void fwnode_handle_put(struct fwnode_handle *fwnode);
         |                        ~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   cc1: some warnings being treated as errors


vim +39 include/linux/property.h

1b9863c6aa56d9 Suthikulpanit, Suravee 2015-10-28  35  
b295d484b97081 Andy Shevchenko        2022-10-04  36  const struct fwnode_handle *__dev_fwnode_const(const struct device *dev);
b295d484b97081 Andy Shevchenko        2022-10-04  37  struct fwnode_handle *__dev_fwnode(struct device *dev);
b295d484b97081 Andy Shevchenko        2022-10-04  38  #define dev_fwnode(dev)							\
b295d484b97081 Andy Shevchenko        2022-10-04 @39  	_Generic((dev),							\
b295d484b97081 Andy Shevchenko        2022-10-04  40  		 const struct device *: __dev_fwnode_const,	\
b295d484b97081 Andy Shevchenko        2022-10-04  41  		 struct device *: __dev_fwnode)(dev)
e44bb0cbdc8868 Sakari Ailus           2017-03-28  42  

:::::: The code at line 39 was first introduced by commit
:::::: b295d484b97081feba72b071ffcb72fb4638ccfd device property: Allow const parameter to dev_fwnode()

:::::: TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

