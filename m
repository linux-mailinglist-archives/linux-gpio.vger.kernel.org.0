Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C5E7641A08
	for <lists+linux-gpio@lfdr.de>; Sun,  4 Dec 2022 00:55:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229472AbiLCXy7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 3 Dec 2022 18:54:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbiLCXy6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 3 Dec 2022 18:54:58 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 433F31B9D5
        for <linux-gpio@vger.kernel.org>; Sat,  3 Dec 2022 15:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670111697; x=1701647697;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=6D/sWqmixFN6ZyfeLype9jdzmF/JV/egbwxHeJdCxLU=;
  b=If3k5R9CHEYC20TA6/MFvri/Vf2ppjbpl4oQN21wIYNUU5njVyDyqvxm
   ujdHJOMhshZqH3uM5/7kg5j1Yax1PuzZovzpdFMZ+cD4Tjn5J6CUOtlv1
   U/aAoJkpVTmSbVT06fXG9SQdgErlp0fuyz51G5t8q2K3nZdk8jo0UDnEk
   sR3c14k7EkwJUWgSrGmQ8idKyIm3O+2RbTJspGmwTETiHDxJIMjTVInSK
   0AHtlmPoh8GkhJZ8fjV9gZbsFumaI0vCY08hBcKAlu8CvbL5E+bCZffXM
   KS6f9pKOKyjTuGkUq5j7BAZlIm5WRzA4AIPl8REpCIqV9zv6CbzO5llXs
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10550"; a="295849568"
X-IronPort-AV: E=Sophos;i="5.96,216,1665471600"; 
   d="scan'208";a="295849568"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2022 15:54:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10550"; a="645404718"
X-IronPort-AV: E=Sophos;i="5.96,216,1665471600"; 
   d="scan'208";a="645404718"
Received: from lkp-server01.sh.intel.com (HELO 4d912534d779) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 03 Dec 2022 15:54:55 -0800
Received: from kbuild by 4d912534d779 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1p1cLO-0000Qd-38;
        Sat, 03 Dec 2022 23:54:54 +0000
Date:   Sun, 04 Dec 2022 07:54:48 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 e8aa47b23fb8983ee8224251e6def4d07683ac6f
Message-ID: <638be1c8.winRFFusoorGEchu%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: e8aa47b23fb8983ee8224251e6def4d07683ac6f  Merge branch 'devel' into for-next

elapsed time: 834m

configs tested: 59
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
s390                             allmodconfig
s390                                defconfig
um                           x86_64_defconfig
um                             i386_defconfig
powerpc                           allnoconfig
x86_64                              defconfig
s390                             allyesconfig
x86_64                    rhel-8.3-kselftests
ia64                             allmodconfig
x86_64                          rhel-8.3-func
x86_64                        randconfig-a004
x86_64                               rhel-8.3
arc                  randconfig-r043-20221201
s390                 randconfig-r044-20221201
i386                                defconfig
x86_64                           allyesconfig
x86_64                        randconfig-a002
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a006
sh                               allmodconfig
arm                                 defconfig
x86_64                        randconfig-a015
mips                             allyesconfig
riscv                randconfig-r042-20221201
powerpc                          allmodconfig
i386                             allyesconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a014
i386                          randconfig-a012
x86_64                           rhel-8.3-syz
arm64                            allyesconfig
x86_64                         rhel-8.3-kunit
arm                              allyesconfig
x86_64                           rhel-8.3-kvm
i386                          randconfig-a016
i386                          randconfig-a005
m68k                             allyesconfig
alpha                            allyesconfig
arc                              allyesconfig
x86_64                            allnoconfig
m68k                             allmodconfig

clang tested configs:
x86_64                        randconfig-a014
hexagon              randconfig-r045-20221201
x86_64                        randconfig-a001
hexagon              randconfig-r041-20221201
x86_64                        randconfig-a016
x86_64                        randconfig-a003
x86_64                        randconfig-a012
x86_64                        randconfig-a005
i386                          randconfig-a013
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a011
i386                          randconfig-a015
i386                          randconfig-a006

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
