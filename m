Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B79569143C
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Feb 2023 00:14:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230301AbjBIXOP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Feb 2023 18:14:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbjBIXOO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Feb 2023 18:14:14 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8B8D627AF
        for <linux-gpio@vger.kernel.org>; Thu,  9 Feb 2023 15:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675984453; x=1707520453;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=3sRM68GRjAkFnGHK8zWneDPCYF/QryaQhCLDd9e0Br0=;
  b=YTQH+6/iBr3q29/EYFuUgV267YKsmBenh+sM132NmRErioZ7evDv97r9
   6gFVUX8xRW0kiqxX81gT4VEwhJV0mbPpfhnh6x6T3NAs/Ejq6sPPT8VQ+
   hUGdfV162aDWah3NiCqFkcWh7yWBKjLEFzpgAPfACVrw34GSJr5gLknCr
   WRgGP9G0nZw/vfe1kPEnNmYkQdWU2F1wp2dgQlgcZVZextyipeUdwAEBH
   hxNth+sne5jGws7DGPVmQgwEhwm6Mpr+6HuLQiJGksikoBVXIj3zxON2y
   gACHzrLrCgEM/qzIie+qRkUaw6qZC1Amob5KiLAdtHJIlCo8S9TofY1U3
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="332413653"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; 
   d="scan'208";a="332413653"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 15:14:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="996736709"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; 
   d="scan'208";a="996736709"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 09 Feb 2023 15:14:11 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pQG7G-0005Ms-2k;
        Thu, 09 Feb 2023 23:14:10 +0000
Date:   Fri, 10 Feb 2023 07:13:19 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 1ec033f00ceb9c7ccd6a7f42f6d617021d5c8c5e
Message-ID: <63e57e0f.IxUrfqxO6WC5uGf+%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 1ec033f00ceb9c7ccd6a7f42f6d617021d5c8c5e  Merge tag 'qcom-pinctrl-6.3-2' of https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt into devel

elapsed time: 1909m

configs tested: 72
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
arc                                 defconfig
alpha                               defconfig
x86_64                              defconfig
s390                             allmodconfig
x86_64                           rhel-8.3-bpf
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
um                             i386_defconfig
s390                                defconfig
um                           x86_64_defconfig
x86_64                               rhel-8.3
s390                             allyesconfig
ia64                             allmodconfig
powerpc                           allnoconfig
x86_64                           allyesconfig
arm                                 defconfig
alpha                            allyesconfig
x86_64               randconfig-a014-20230206
m68k                             allyesconfig
x86_64               randconfig-a013-20230206
m68k                             allmodconfig
x86_64               randconfig-a011-20230206
arc                              allyesconfig
x86_64               randconfig-a012-20230206
x86_64               randconfig-a015-20230206
i386                                defconfig
x86_64               randconfig-a016-20230206
i386                 randconfig-a011-20230206
i386                 randconfig-a014-20230206
i386                 randconfig-a012-20230206
riscv                randconfig-r042-20230204
i386                 randconfig-a013-20230206
s390                 randconfig-r044-20230206
x86_64                        randconfig-a004
x86_64                        randconfig-a002
arc                  randconfig-r043-20230209
arm                  randconfig-r046-20230209
i386                          randconfig-a014
x86_64                        randconfig-a006
i386                          randconfig-a012
i386                          randconfig-a016
sh                               allmodconfig
arm64                            allyesconfig
i386                             allyesconfig
arm                              allyesconfig
mips                             allyesconfig
powerpc                          allmodconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests

clang tested configs:
hexagon              randconfig-r045-20230206
hexagon              randconfig-r041-20230206
hexagon              randconfig-r041-20230204
hexagon              randconfig-r045-20230209
x86_64                        randconfig-a001
i386                          randconfig-a013
x86_64                        randconfig-a003
s390                 randconfig-r044-20230209
i386                          randconfig-a011
riscv                randconfig-r042-20230209
hexagon              randconfig-r041-20230209
x86_64                        randconfig-a005
i386                          randconfig-a015
i386                          randconfig-a002
i386                          randconfig-a004
x86_64                        randconfig-k001
x86_64                          rhel-8.3-rust
i386                          randconfig-a006

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
