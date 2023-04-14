Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 718AB6E29DA
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Apr 2023 20:12:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbjDNSM0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 Apr 2023 14:12:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229893AbjDNSMY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Apr 2023 14:12:24 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEC2FB466
        for <linux-gpio@vger.kernel.org>; Fri, 14 Apr 2023 11:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681495943; x=1713031943;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=4mf8EGcANOVd4+wl0ai2e0QkSbkxe7I58BiDP2CrQoE=;
  b=lSCY4ktXsX3SFH1fKygS48yBnYpqI60BDSRScqynacKDWjlTgo+H2iDZ
   0xtgKDdDMrQ/vdN4oqzs6Slm2LhUwdbUn51CIszhCaaHyw+5sF9tbkLTa
   uqR6mrQrSFYBKQJsROO2Qx0Jz+T0lY2j+K3Nn12ceEYZzmib/wlNZNNBE
   kJ232FB7oWeFJMt+khWNbqh0OPfPS5jbtNodYgNf5nmzZo66Cq57om/qI
   UzguVba/Nj6daoLxA7jnYdxPIPBirv4X21v1vFvhhwuEqu/XHigfOHAzJ
   Sq/jkbl7Jww9/mo/aOZyFTEeMr5NyNj8WEMVn/27wH9f4tD4B9maH1Ob+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="344533261"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; 
   d="scan'208";a="344533261"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 11:10:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="801289504"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; 
   d="scan'208";a="801289504"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 14 Apr 2023 11:10:41 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pnNse-000Zm7-1z;
        Fri, 14 Apr 2023 18:10:40 +0000
Date:   Sat, 15 Apr 2023 02:10:36 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 b67b3813ab0e7b010fbcf9c3f95131fa6a373c92
Message-ID: <6439971c.hB9YlFiFRMNe2SKZ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: b67b3813ab0e7b010fbcf9c3f95131fa6a373c92  Merge tag 'qcom-pinctrl-6.4' of https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt into devel

elapsed time: 1284m

configs tested: 42
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
nios2                               defconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
sh                               allmodconfig   gcc  
sparc                               defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
