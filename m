Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37373664E24
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jan 2023 22:39:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232382AbjAJVj4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Jan 2023 16:39:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231874AbjAJVjz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Jan 2023 16:39:55 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1753B51
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jan 2023 13:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673386793; x=1704922793;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=mqZapuz+UTQZ1FywaebolErAHYRyMcVvudn6MHDCOGg=;
  b=hxCzkNHwZeWEurFdNaxVHRiM25kSX0zPG/W9ZqAAUYbU6CSBEG3Yvk7S
   h5zWPpcWL2Y8HYmQBroALEWEt+XWSZ+tSuQe1P/3WtL4pmymKmYV45OCd
   ChCTLBkcRZx8EoiED9SPtZe8a+IEyBDBRQ1hzcY70hKVPo44s+/ZpU3Uf
   cHBAVlkPw6KGTNWk92oSGDccJEmCn3vq9AufJqWB1YqfvV70yEEwvnAyR
   ZkDIHzXh1dUbdPpfmbnVfaqvg8TkvrbobHF8LIZkYVuHYWpJduZhNKQ7l
   vFBa90jMcYy5sPUUJDDIc3iMPof5FXv4h+Q75oLxFvTfnmbbdGaA07bhr
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="387724023"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; 
   d="scan'208";a="387724023"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2023 13:39:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="634726653"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; 
   d="scan'208";a="634726653"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 10 Jan 2023 13:39:51 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pFMLW-0008OC-1H;
        Tue, 10 Jan 2023 21:39:50 +0000
Date:   Wed, 11 Jan 2023 05:38:55 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 8f18c3f3e3ac73659929225820b2994af6cad17d
Message-ID: <63bddaef.awY4tEB+thf5tTwo%lkp@intel.com>
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
branch HEAD: 8f18c3f3e3ac73659929225820b2994af6cad17d  Merge branch 'devel' into for-next

elapsed time: 721m

configs tested: 68
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
x86_64                            allnoconfig
alpha                               defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
um                             i386_defconfig
s390                                defconfig
s390                             allmodconfig
sh                               allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a011-20230109
x86_64               randconfig-a013-20230109
x86_64               randconfig-a012-20230109
x86_64               randconfig-a014-20230109
s390                             allyesconfig
m68k                             allyesconfig
x86_64               randconfig-a016-20230109
m68k                             allmodconfig
x86_64               randconfig-a015-20230109
arc                              allyesconfig
alpha                            allyesconfig
ia64                             allmodconfig
i386                             allyesconfig
i386                                defconfig
i386                 randconfig-a015-20230109
i386                 randconfig-a011-20230109
i386                 randconfig-a013-20230109
i386                 randconfig-a014-20230109
i386                 randconfig-a016-20230109
i386                 randconfig-a012-20230109
x86_64                              defconfig
x86_64                           rhel-8.3-bpf
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
arm                                 defconfig
x86_64                           allyesconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
arm64                            allyesconfig
arm                              allyesconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func

clang tested configs:
x86_64                        randconfig-k001
x86_64               randconfig-a001-20230109
x86_64               randconfig-a002-20230109
x86_64               randconfig-a004-20230109
x86_64               randconfig-a003-20230109
x86_64               randconfig-a006-20230109
x86_64               randconfig-a005-20230109
x86_64                          rhel-8.3-rust
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
riscv                          rv32_defconfig
powerpc                      ppc64e_defconfig
powerpc                      ppc44x_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
