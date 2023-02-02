Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B9DA687F08
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Feb 2023 14:44:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231237AbjBBNoh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Feb 2023 08:44:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231768AbjBBNog (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Feb 2023 08:44:36 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32C4479234
        for <linux-gpio@vger.kernel.org>; Thu,  2 Feb 2023 05:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675345476; x=1706881476;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=UX4XIuzISU5jH1R7VkRRYBuEliWruy6UKIXuo95VjRE=;
  b=fHHdAVLtMjHt2PThgnwQXgk/Owdq8zAfrhK/6haHpeFTp5tKz0kHLpq6
   +1NjbmNqC+EID0IovQ9gVCX/Uxy/S4kSypgipK3Ywwodwas1lucx3SvAn
   6zZdJb4tB45O6huCtxOH3dls+iaMSTnBpIA0U16x8j7DfBewWDMuReaBv
   yWkru9s0jt3Nq5FLmlj/z7HoHBerSdgSORnxCPqZEZf8gzy+HztZjc2cW
   wFMfNwPCSry4NwJrYwGx1AdZl9PuhwuALF9YYC4defECsZZZYVAQGZ7sK
   MvcC+xj8y4t90A+4HboCUp3PdzkG7iSW8IUuRid4uwwW3fu9Tq+Yva8Vn
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="316444036"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="316444036"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 05:44:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="773885362"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="773885362"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 02 Feb 2023 05:44:33 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pNZtA-0006YY-2n;
        Thu, 02 Feb 2023 13:44:32 +0000
Date:   Thu, 02 Feb 2023 21:43:59 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 1b56e1d64807eb06ad901abe5e8de6e3b3b07f36
Message-ID: <63dbbe1f.S/t8z8pSV34RvZwL%lkp@intel.com>
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
branch HEAD: 1b56e1d64807eb06ad901abe5e8de6e3b3b07f36  Merge branch 'devel' into for-next

elapsed time: 863m

configs tested: 64
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
um                             i386_defconfig
um                           x86_64_defconfig
x86_64               randconfig-a001-20230130
x86_64               randconfig-a003-20230130
m68k                             allmodconfig
x86_64               randconfig-a004-20230130
arc                                 defconfig
x86_64               randconfig-a002-20230130
alpha                            allyesconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20230130
s390                             allmodconfig
powerpc                          allmodconfig
m68k                             allyesconfig
x86_64               randconfig-a005-20230130
alpha                               defconfig
i386                 randconfig-a002-20230130
arc                              allyesconfig
i386                 randconfig-a001-20230130
s390                                defconfig
mips                             allyesconfig
i386                 randconfig-a005-20230130
i386                 randconfig-a004-20230130
sh                               allmodconfig
i386                 randconfig-a003-20230130
i386                 randconfig-a006-20230130
s390                             allyesconfig
ia64                             allmodconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-bpf
i386                             allyesconfig
i386                                defconfig
i386                          randconfig-c001
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig

clang tested configs:
x86_64                          rhel-8.3-rust
x86_64               randconfig-a014-20230130
x86_64               randconfig-a012-20230130
x86_64               randconfig-a013-20230130
x86_64               randconfig-a011-20230130
x86_64               randconfig-a015-20230130
x86_64               randconfig-a016-20230130
x86_64                        randconfig-k001
i386                 randconfig-a014-20230130
i386                 randconfig-a013-20230130
i386                 randconfig-a015-20230130
i386                 randconfig-a016-20230130
i386                 randconfig-a012-20230130
i386                 randconfig-a011-20230130

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
