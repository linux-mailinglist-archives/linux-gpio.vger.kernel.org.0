Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECDB7647D0B
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Dec 2022 05:48:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229469AbiLIEsJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Dec 2022 23:48:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbiLIEsG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Dec 2022 23:48:06 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B14843A2E9
        for <linux-gpio@vger.kernel.org>; Thu,  8 Dec 2022 20:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670561285; x=1702097285;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Z7l4ybYc48FbVB+hhuUjo9cb9cVZzoG+H0RXgO6Uwrc=;
  b=NBgEtjdOSvtb6++VOiNgWHqopsvf49djeQJ6r0/QBkAirona52XfQ622
   R0SSqdTeGYpFtJR90wJf040p1jL6d6RP4wtAuMxlAu4C3+sxEehmE3Im7
   U3cLB6YBa24X7bkqtl6+624kVz68C2eyjCDdLn5mIfTfWOBj7MoMgsZg7
   SvrM3GvncIfckfJEdMsiB5Qj0HUsZ/G3Hbpcnrycq9p/ak5Go7NMskW81
   avM9gmebZ1agrAJ/D9MdrYLEXYa4VsAVYr1cbxyaVrenMc38f7M5f+YHj
   HJgNq+vRsZ3BbUIwinZMPjVtyB+Oxwwz8KhHoaIIExWx3X1dUrFzkz63q
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="319240504"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; 
   d="scan'208";a="319240504"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2022 20:48:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="771745755"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; 
   d="scan'208";a="771745755"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 08 Dec 2022 20:48:03 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1p3VIo-0001cx-2L;
        Fri, 09 Dec 2022 04:48:02 +0000
Date:   Fri, 09 Dec 2022 12:47:05 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 6c19feafb377abf412b89c0c4586f9e4b9f69857
Message-ID: <6392bdc9./tiQSMmNrBLRVZ09%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 6c19feafb377abf412b89c0c4586f9e4b9f69857  Merge branch 'devel' into for-next

elapsed time: 728m

configs tested: 65
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
powerpc                           allnoconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
s390                             allyesconfig
um                           x86_64_defconfig
um                             i386_defconfig
sh                               allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
x86_64                              defconfig
x86_64                           rhel-8.3-syz
arm                  randconfig-r046-20221208
x86_64                         rhel-8.3-kunit
arc                  randconfig-r043-20221208
x86_64                           rhel-8.3-kvm
x86_64                               rhel-8.3
x86_64                           allyesconfig
i386                                defconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                          rhel-8.3-rust
x86_64                    rhel-8.3-kselftests
x86_64                        randconfig-a015
x86_64                          rhel-8.3-func
arm                                 defconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
x86_64                        randconfig-a004
x86_64                        randconfig-a002
ia64                             allmodconfig
arc                  randconfig-r043-20221207
riscv                randconfig-r042-20221207
s390                 randconfig-r044-20221207
x86_64                        randconfig-a006
arm                              allyesconfig
arm64                            allyesconfig
i386                             allyesconfig
x86_64                            allnoconfig

clang tested configs:
hexagon              randconfig-r045-20221208
riscv                randconfig-r042-20221208
hexagon              randconfig-r041-20221208
s390                 randconfig-r044-20221208
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
i386                          randconfig-a006
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
