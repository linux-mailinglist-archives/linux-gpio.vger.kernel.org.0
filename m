Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9711B60EA43
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Oct 2022 22:29:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234300AbiJZU3R (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Oct 2022 16:29:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234258AbiJZU3Q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Oct 2022 16:29:16 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D099A23F4
        for <linux-gpio@vger.kernel.org>; Wed, 26 Oct 2022 13:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666816156; x=1698352156;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=QToFn/yGbic6YUEtqmLxmyuvhbwVx1KKOijICF1WQyw=;
  b=L4B6Z8OPOpeWgT37YLhYQXPAUwAZ/11JfQzbq7CAdL6VOQ/+ud/Y+YJj
   EcFcfxJyYtv1oM6SkEdWqtXeSQOoktDD3tgnALP1cgaFL3Wx9oTBx32po
   BGPl8uxzRnyii38HkfgwVWNFRfPrvtz/5IQ/Zq71b9B7O4uFmpfhE0FXi
   JJcZWB+19N2a9duPDHDXKeT9vJAvV3MgFSvFXaVevm9b0rX4M2DgqF98W
   XVBQoUrAORftCe2qIxJiQocq+alepUW3VBkOzA1DDC725MVhDx5PlTsnJ
   TDN9rrV8pD2235nfeJNryWEmWS3DWJwCvJyCTOhkrSTstAV92aG4EXXY9
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="334676182"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; 
   d="scan'208";a="334676182"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2022 13:29:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="807197216"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; 
   d="scan'208";a="807197216"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 26 Oct 2022 13:29:11 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1onn1S-0007p6-2j;
        Wed, 26 Oct 2022 20:29:10 +0000
Date:   Thu, 27 Oct 2022 04:28:39 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 bfe66c8bb35c9307bada60f9563c37fff5ca5d16
Message-ID: <63599877.is84g48rb3uKYJqG%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: bfe66c8bb35c9307bada60f9563c37fff5ca5d16  Merge branch 'devel' into for-next

elapsed time: 723m

configs tested: 108
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
um                             i386_defconfig
x86_64                              defconfig
um                           x86_64_defconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
powerpc                           allnoconfig
x86_64                               rhel-8.3
mips                             allyesconfig
powerpc                          allmodconfig
x86_64                           allyesconfig
ia64                             allmodconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
sh                               allmodconfig
x86_64                           rhel-8.3-kvm
i386                          randconfig-a001
arc                              allyesconfig
i386                          randconfig-a003
i386                                defconfig
s390                                defconfig
x86_64               randconfig-a014-20221024
x86_64               randconfig-a013-20221024
arm                                 defconfig
s390                             allmodconfig
x86_64               randconfig-a012-20221024
m68k                             allmodconfig
x86_64               randconfig-a016-20221024
x86_64               randconfig-a011-20221024
m68k                             allyesconfig
i386                          randconfig-a005
i386                          randconfig-a014
x86_64               randconfig-a015-20221024
arc                  randconfig-r043-20221024
riscv                randconfig-r042-20221024
arc                  randconfig-r043-20221023
s390                 randconfig-r044-20221024
i386                             allyesconfig
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20221026
s390                 randconfig-r044-20221026
riscv                randconfig-r042-20221026
xtensa                         virt_defconfig
arm                          exynos_defconfig
arm                            qcom_defconfig
powerpc                       ppc64_defconfig
ia64                                defconfig
m68k                           virt_defconfig
mips                            gpr_defconfig
alpha                            allyesconfig
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
s390                             allyesconfig
m68k                       m5475evb_defconfig
powerpc                 mpc837x_mds_defconfig
sh                 kfr2r09-romimage_defconfig
sh                          sdk7780_defconfig
arm                              allyesconfig
arm64                            allyesconfig
sparc                               defconfig
arc                              alldefconfig
arm                            pleb_defconfig
mips                      maltasmvp_defconfig
powerpc                    amigaone_defconfig
sh                           se7724_defconfig
sh                          rsk7201_defconfig
i386                          randconfig-c001
mips                 randconfig-c004-20221026
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
powerpc                         wii_defconfig
arm                        multi_v7_defconfig
arc                           tb10x_defconfig
m68k                          sun3x_defconfig
powerpc                      ppc6xx_defconfig
arm                        keystone_defconfig
powerpc                     stx_gp3_defconfig
arm                         axm55xx_defconfig
powerpc                     redwood_defconfig
sh                      rts7751r2d1_defconfig
mips                        vocore2_defconfig

clang tested configs:
i386                          randconfig-a002
i386                          randconfig-a004
hexagon              randconfig-r045-20221023
i386                          randconfig-a013
x86_64               randconfig-a001-20221024
x86_64               randconfig-a005-20221024
i386                          randconfig-a015
x86_64               randconfig-a003-20221024
hexagon              randconfig-r041-20221024
x86_64               randconfig-a002-20221024
riscv                randconfig-r042-20221023
x86_64               randconfig-a006-20221024
i386                          randconfig-a006
hexagon              randconfig-r045-20221024
x86_64               randconfig-a004-20221024
s390                 randconfig-r044-20221023
hexagon              randconfig-r041-20221023
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
