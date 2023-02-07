Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59C0768CB39
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Feb 2023 01:34:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbjBGAeb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Feb 2023 19:34:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbjBGAe2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Feb 2023 19:34:28 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A6379032
        for <linux-gpio@vger.kernel.org>; Mon,  6 Feb 2023 16:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675730067; x=1707266067;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=DGFS34+9TgduiIP91+UUkZLoos8XpVGwafWoP4KBb9s=;
  b=XIOeNVC2sVFLh2puFX1+nOVUvd8SNn+qasYDmPd6vls+kN99i6ELsd94
   MCf9PdedMCxLSfhKexISgmi5hr7R5rpc5kD5iMN7t45NCNWd/+GaDEyEs
   dSbM7BQ5IDzxEMUrqrT8ugdYHf7GE+AQZ+Ac0GR/CYMTl8JYR70HMxo0X
   JQ/VGTRITsKQoTuhNDf5EI1gmm1LzV4ApL5LA+fFpe5mEDTRcJVdZs5ss
   rSD27PIuYqM63kdn1w7a0T5Y/NsK1QeUlny3SQOI2k+GEIYxkNQPwRJ5d
   +S7w3o81kvLJOP3Ys3xmpnAdniY4Tln7wHjrXdbmOULCLGSUAKELNhvYL
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="309693371"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="309693371"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 16:34:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="790605152"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="790605152"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 06 Feb 2023 16:34:25 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pPBwH-0002u0-07;
        Tue, 07 Feb 2023 00:34:25 +0000
Date:   Tue, 07 Feb 2023 08:33:49 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 58378dd700d48851bad511a765e112d055962f7d
Message-ID: <63e19c6d.E6PCg3O/r32WTPhT%lkp@intel.com>
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
branch HEAD: 58378dd700d48851bad511a765e112d055962f7d  Merge branch 'devel' into for-next

elapsed time: 720m

configs tested: 38
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                            allnoconfig
powerpc                           allnoconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
sh                               allmodconfig
s390                             allyesconfig
x86_64                              defconfig
m68k                             allmodconfig
alpha                            allyesconfig
mips                             allyesconfig
m68k                             allyesconfig
x86_64                               rhel-8.3
x86_64                           rhel-8.3-syz
powerpc                          allmodconfig
i386                 randconfig-a011-20230206
arc                              allyesconfig
x86_64                         rhel-8.3-kunit
i386                 randconfig-a014-20230206
ia64                             allmodconfig
x86_64                           rhel-8.3-kvm
i386                 randconfig-a012-20230206
x86_64                           rhel-8.3-bpf
i386                 randconfig-a013-20230206
i386                 randconfig-a015-20230206
i386                 randconfig-a016-20230206
x86_64                           allyesconfig
arm                                 defconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
arm64                            allyesconfig
i386                                defconfig
arm                              allyesconfig
i386                             allyesconfig

clang tested configs:
x86_64                          rhel-8.3-rust

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
