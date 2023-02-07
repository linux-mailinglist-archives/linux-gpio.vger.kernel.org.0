Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF01468E319
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Feb 2023 22:44:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229483AbjBGVoj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Feb 2023 16:44:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbjBGVoi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Feb 2023 16:44:38 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 069BB305EE
        for <linux-gpio@vger.kernel.org>; Tue,  7 Feb 2023 13:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675806278; x=1707342278;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=4EirSlm3KzqnmptlID0jTiPRjEtHqHYcgqAMI6rYK5Q=;
  b=d78M49+zuWl1HiGbhjGMI9DDeAJoHYCW7875sO7e/5uP2mQjhAKekOJf
   Bu8A4iGYs5HTq8oregO8sPpawMmZ2PtJKB8VFtMkAUiSEGsBOn84fj+9t
   QhGpZTSYBXYtlyCIe8vCfNFbVsyKs3MuX/uKthQZRjn07H/iGTBdOfyOR
   LrYPjsTZ069Qfw2PSBlAIJgalvXSNylmCMgPPdWLHAMDXrW3AXFEn52uk
   uefa74K+MFEVfy3u/WVtplswb5EO/VTujnGBClFcauKTzZT2d56lwB9Pj
   0/8fU/lNhGzDNA20dY7pD21xrivvJBcoTHKct+Dge+0F6msZ/rf7Eay19
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="328284524"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="328284524"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 13:44:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="775733456"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="775733456"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 07 Feb 2023 13:44:36 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pPVlT-0003uo-33;
        Tue, 07 Feb 2023 21:44:35 +0000
Date:   Wed, 08 Feb 2023 05:44:28 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 a8520be3ffef3d25b53bf171a7ebe17ee0154175
Message-ID: <63e2c63c.jON20K6cJC5/803/%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: a8520be3ffef3d25b53bf171a7ebe17ee0154175  pinctrl: intel: Restore the pins that used to be in Direct IRQ mode

elapsed time: 721m

configs tested: 67
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
x86_64                            allnoconfig
s390                                defconfig
s390                             allyesconfig
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
sh                               allmodconfig
mips                             allyesconfig
i386                                defconfig
x86_64                           rhel-8.3-bpf
x86_64               randconfig-a013-20230206
x86_64               randconfig-a011-20230206
powerpc                          allmodconfig
x86_64               randconfig-a012-20230206
x86_64                         rhel-8.3-kunit
x86_64               randconfig-a014-20230206
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
x86_64               randconfig-a015-20230206
x86_64               randconfig-a016-20230206
ia64                             allmodconfig
arm                                 defconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
i386                             allyesconfig
x86_64                              defconfig
arm64                            allyesconfig
arm                              allyesconfig
x86_64                               rhel-8.3
i386                 randconfig-a011-20230206
i386                 randconfig-a014-20230206
i386                 randconfig-a012-20230206
i386                 randconfig-a013-20230206
i386                 randconfig-a015-20230206
i386                 randconfig-a016-20230206
x86_64                           allyesconfig
arc                  randconfig-r043-20230205
arm                  randconfig-r046-20230205
arc                  randconfig-r043-20230206
riscv                randconfig-r042-20230206
s390                 randconfig-r044-20230206

clang tested configs:
x86_64                          rhel-8.3-rust
x86_64               randconfig-a002-20230206
x86_64               randconfig-a004-20230206
x86_64               randconfig-a003-20230206
x86_64               randconfig-a001-20230206
x86_64               randconfig-a005-20230206
i386                 randconfig-a002-20230206
i386                 randconfig-a005-20230206
i386                 randconfig-a004-20230206
i386                 randconfig-a003-20230206
i386                 randconfig-a001-20230206
x86_64               randconfig-a006-20230206
i386                 randconfig-a006-20230206
riscv                randconfig-r042-20230205
hexagon              randconfig-r045-20230206
hexagon              randconfig-r041-20230206
arm                  randconfig-r046-20230206
hexagon              randconfig-r045-20230205
s390                 randconfig-r044-20230205

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
