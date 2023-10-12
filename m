Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8638B7C761F
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Oct 2023 20:47:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1441868AbjJLSrJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Oct 2023 14:47:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1441845AbjJLSrI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Oct 2023 14:47:08 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E61D83
        for <linux-gpio@vger.kernel.org>; Thu, 12 Oct 2023 11:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697136426; x=1728672426;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S0vcJunblg8chrFSr4FPWATXO9SRLsZ573hecPRvr1o=;
  b=PBAPByqY29AEmd6aayBvdFcsRAYVTV39Z0oJ9uYpuvjAjliyBsX/fEQq
   hYQnyKEQIs31RozpD4BEefjNn6FKCrVXQWoSSQrVbhHJvnDLkFnz8Fpb1
   o+kGx3Kzvz7cFi/dUvZIngQz2D50K87SLJT/NkXTepfl5MUlrd3DbvnrL
   yxWeM2O2T2+JYaSZtG2ajd+drHPUJMlWxl8CxGOQCnVieInwvyCAI7rC0
   rj7jEG9e7lhdGSa7MHOemXgybYfHTJQ7bpBOk9AOyjamV3oqDsq3lSAA5
   7WABvhb7Wex9JxFo2jSrbt98bfPPSSDL/NuA+W5gShIJQEgGtBrTesb8U
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="370084481"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="370084481"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 11:47:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="748003256"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="748003256"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 12 Oct 2023 11:47:04 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qr0i6-0003kf-1L;
        Thu, 12 Oct 2023 18:47:02 +0000
Date:   Fri, 13 Oct 2023 02:46:23 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: [brgl:gpio/devel 36/62] include/linux/pinctrl/consumer.h:76:1:
 error: conflicting types for 'pinctrl_gpio_can_use_line'; have 'bool(struct
 gpio_chip *, unsigned int)' {aka '_Bool(struct gpio_chip *, unsigned int)'}
Message-ID: <202310130237.2NLTLV30-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bartosz,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/devel
head:   f45ee006d473c033a7d0152b182f9ba12cf52ce5
commit: c193f038b53221830113a2ef53a30f12d22e31e8 [36/62] treewide: rename pinctrl_gpio_can_use_line_new()
config: s390-randconfig-001-20231013 (https://download.01.org/0day-ci/archive/20231013/202310130237.2NLTLV30-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310130237.2NLTLV30-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310130237.2NLTLV30-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/i2c/i2c-core-base.c:36:
>> include/linux/pinctrl/consumer.h:76:1: error: conflicting types for 'pinctrl_gpio_can_use_line'; have 'bool(struct gpio_chip *, unsigned int)' {aka '_Bool(struct gpio_chip *, unsigned int)'}
      76 | pinctrl_gpio_can_use_line(struct gpio_chip *gc, unsigned int offset)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pinctrl/consumer.h:70:20: note: previous definition of 'pinctrl_gpio_can_use_line' with type 'bool(unsigned int)' {aka '_Bool(unsigned int)'}
      70 | static inline bool pinctrl_gpio_can_use_line(unsigned gpio)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +76 include/linux/pinctrl/consumer.h

    74	
    75	static inline bool
  > 76	pinctrl_gpio_can_use_line(struct gpio_chip *gc, unsigned int offset)
    77	{
    78		return true;
    79	}
    80	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
