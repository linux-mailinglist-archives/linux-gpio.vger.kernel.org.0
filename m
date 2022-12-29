Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07F6F658E12
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Dec 2022 15:52:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233621AbiL2OwA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Dec 2022 09:52:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233620AbiL2Ov3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Dec 2022 09:51:29 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 298B914034
        for <linux-gpio@vger.kernel.org>; Thu, 29 Dec 2022 06:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672325475; x=1703861475;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=03Aa0fSOW+rLdHc+biddOI5rGYwq/TRZBsW37W7vNNQ=;
  b=HVJn1QnNtwxFJxdISQVdXNEFMvZevzI1wsObZ+dRwq1IKYvGdmcZv0Uc
   y2NbrotJp2Q5fqJ1DkD4KDQcpwGwSlw5U7M7KQl/9jN5siZ/XBTZXREo9
   k04W4qQwyH5RmqevJYhoy/VaNMvtw26j66H2KuxrEz3plnLxXcCS+KV/w
   OZ2JsUgfNMS7zyjKaWqLSJ2B9QIqaS2Wc2R2cWkoSsRpvE5lOOIJf+U7U
   HdWT9/1B2aiW8gKCHIl0UpSIcgZzLZAtq+wRFuksiSizl/8Tdsz+5GzXk
   ag/2xoh/i/L06oQtOkZJqHyAg1QFknm2PuwkpJ5+ZomhaMeOG12HKvuTp
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10575"; a="322291117"
X-IronPort-AV: E=Sophos;i="5.96,284,1665471600"; 
   d="scan'208";a="322291117"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2022 06:51:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10575"; a="653626722"
X-IronPort-AV: E=Sophos;i="5.96,284,1665471600"; 
   d="scan'208";a="653626722"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 29 Dec 2022 06:51:11 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pAuFT-000GkW-0i;
        Thu, 29 Dec 2022 14:51:11 +0000
Date:   Thu, 29 Dec 2022 22:50:21 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 889e564f9e5970c2311cadc6597e92205ee751b9
Message-ID: <63ada92d.qVO/Ojn5HnTcnpdK%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 889e564f9e5970c2311cadc6597e92205ee751b9  Merge branch 'devel' into for-next

elapsed time: 725m

configs tested: 85
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
alpha                            allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
um                             i386_defconfig
um                           x86_64_defconfig
i386                                defconfig
arm                                 defconfig
i386                             allyesconfig
arm64                            allyesconfig
x86_64                              defconfig
arc                                 defconfig
x86_64                               rhel-8.3
s390                             allmodconfig
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
arm                              allyesconfig
alpha                               defconfig
x86_64                           rhel-8.3-bpf
s390                                defconfig
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
s390                             allyesconfig
ia64                             allmodconfig
x86_64               randconfig-a014-20221226
x86_64                           allyesconfig
x86_64               randconfig-a013-20221226
x86_64               randconfig-a011-20221226
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arm                  randconfig-r046-20221225
arc                  randconfig-r043-20221225
x86_64               randconfig-a012-20221226
x86_64               randconfig-a016-20221226
arc                  randconfig-r043-20221227
x86_64               randconfig-a015-20221226
arm                  randconfig-r046-20221227
arc                  randconfig-r043-20221226
riscv                randconfig-r042-20221226
s390                 randconfig-r044-20221226
i386                          randconfig-a001
i386                          randconfig-a003
x86_64                            allnoconfig
i386                          randconfig-a005
powerpc                           allnoconfig
sh                               allmodconfig
powerpc                          allmodconfig
mips                             allyesconfig
i386                             alldefconfig
powerpc                         wii_defconfig
arm                        keystone_defconfig
sh                          rsk7201_defconfig
sh                     sh7710voipgw_defconfig
m68k                        m5307c3_defconfig
arm                             pxa_defconfig
m68k                        m5407c3_defconfig
sh                        dreamcast_defconfig
nios2                         3c120_defconfig
i386                          randconfig-c001

clang tested configs:
x86_64               randconfig-a002-20221226
x86_64               randconfig-a003-20221226
x86_64               randconfig-a001-20221226
x86_64               randconfig-a004-20221226
x86_64               randconfig-a006-20221226
x86_64               randconfig-a005-20221226
x86_64                          rhel-8.3-rust
i386                          randconfig-a013
i386                          randconfig-a011
hexagon              randconfig-r045-20221225
i386                          randconfig-a015
riscv                randconfig-r042-20221227
hexagon              randconfig-r041-20221225
hexagon              randconfig-r041-20221227
hexagon              randconfig-r041-20221226
arm                  randconfig-r046-20221226
s390                 randconfig-r044-20221225
hexagon              randconfig-r045-20221226
riscv                randconfig-r042-20221225
hexagon              randconfig-r045-20221227
s390                 randconfig-r044-20221227
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
