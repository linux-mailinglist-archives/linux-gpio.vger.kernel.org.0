Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1BB95E6D61
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Sep 2022 22:50:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230021AbiIVUup (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Sep 2022 16:50:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbiIVUuo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 22 Sep 2022 16:50:44 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 392CC10951D
        for <linux-gpio@vger.kernel.org>; Thu, 22 Sep 2022 13:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663879843; x=1695415843;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=90/m2HnU4wZARYPN00Q5RP68pycDbJ9een2YWU2dYNQ=;
  b=i47TSjx4qMSwYHJwpNlH9mf09TFXT65Wp6nzoalFAzVzVIN+/10SC9dR
   QOwnyQvW4cnxLhYBkVPQ88kUIDiXsZ83fPuUFpAk/N/8O3S2h8Dmzuqub
   O6sySMQoTwBDUIhzcByajc5SyFrnasGSjq24wDPmaD/l2bXXYYp3uZJw+
   AXF3MN2Ayc1qWQMs+gAZlSYFJR7F5eInDVNDwzXeievfYgQyep+DC3rqR
   +GkAKgKkLD9ZgrJ0UEl1UwQSLgKWCvMFy5O5m4CT0hI4grq1S+S1xWr1d
   AUR8RjMmD4Kugmfqkal+5rqk1hC11D6tVyoEsLMv8NwpL40KkB8JuSkSg
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="280152702"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="280152702"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2022 13:50:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="653142919"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 22 Sep 2022 13:50:41 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1obT9c-0004xC-2a;
        Thu, 22 Sep 2022 20:50:40 +0000
Date:   Fri, 23 Sep 2022 04:50:37 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 792f494e4a00de57e4ee0647d490ec1aac2dae23
Message-ID: <632cca9d.LohIBkRzNj70oZE5%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 792f494e4a00de57e4ee0647d490ec1aac2dae23  dt-binding: gpio: publish binding IDs under dual license

elapsed time: 720m

configs tested: 72
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
s390                                defconfig
x86_64                        randconfig-a002
s390                             allyesconfig
x86_64                        randconfig-a004
arc                  randconfig-r043-20220921
i386                                defconfig
riscv                randconfig-r042-20220921
x86_64                        randconfig-a006
i386                          randconfig-a001
arm                                 defconfig
i386                          randconfig-a003
s390                 randconfig-r044-20220921
x86_64                              defconfig
i386                          randconfig-a005
x86_64                        randconfig-a013
arm                              allyesconfig
alpha                            allyesconfig
x86_64                        randconfig-a011
x86_64                               rhel-8.3
x86_64                           allyesconfig
arm64                            allyesconfig
arc                              allyesconfig
x86_64                           rhel-8.3-syz
i386                          randconfig-a016
powerpc                           allnoconfig
x86_64                         rhel-8.3-kunit
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
x86_64                           rhel-8.3-kvm
m68k                             allyesconfig
x86_64                    rhel-8.3-kselftests
m68k                             allmodconfig
i386                             allyesconfig
x86_64                          rhel-8.3-func
ia64                             allmodconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
powerpc                 mpc837x_mds_defconfig
xtensa                          iss_defconfig
nios2                            alldefconfig
m68k                            mac_defconfig
sh                        edosk7705_defconfig
xtensa                    smp_lx200_defconfig
csky                             alldefconfig
sh                           se7705_defconfig
powerpc                      tqm8xx_defconfig

clang tested configs:
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
hexagon              randconfig-r041-20220921
hexagon              randconfig-r045-20220921
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a016
x86_64                        randconfig-a012
hexagon              randconfig-r041-20220922
hexagon              randconfig-r045-20220922
riscv                randconfig-r042-20220922
s390                 randconfig-r044-20220922
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
x86_64                        randconfig-a014

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
