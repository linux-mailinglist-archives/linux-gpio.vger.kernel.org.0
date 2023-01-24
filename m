Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17A80678D78
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jan 2023 02:33:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232083AbjAXBdf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Jan 2023 20:33:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231544AbjAXBde (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Jan 2023 20:33:34 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4BF911EBD
        for <linux-gpio@vger.kernel.org>; Mon, 23 Jan 2023 17:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674524013; x=1706060013;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=TSQKcB3B/h6HWGGoWdu/7Ts/di3/i8HnVFUkH06f/Hw=;
  b=VDMrystOqN+zTFNqFafiGwAexGVbCfCfa5n0h9TIMDNEthcAcQoC2oud
   pfdgajg7HgizpxEjwf+6zzKJfEmaw9yVYcdJThfw3XkuvcfFkCTyfoYEJ
   1jysAA1lMzIoqomg5FPOIQ7cb/r5aWDwoRjrZX/anfiVupx/s0s/HpYr8
   tKAqa8mbdA7CscExfo0ejtxBWwqZkQKazr5SaeAmQwwy6wqKiZS/LKgE2
   FmETLyEKJ9qB5UDA1hU6clgYAMkeYVnef0h2lqcoqgG5bjo9XGzSEDMLS
   jVoTxvWq0/hMRBice+iRp9gtk5BWvW1gOmRiT2oyJG6vkjb2/Iq3XnWiw
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="390716277"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="390716277"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 17:33:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="725295488"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="725295488"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 23 Jan 2023 17:33:31 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pK8Bm-00061P-2K;
        Tue, 24 Jan 2023 01:33:30 +0000
Date:   Tue, 24 Jan 2023 09:32:34 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-gpio:gpiochip-no-driver-h] BUILD SUCCESS
 df771cce328bbd37333797d0df3471c2e03ecb03
Message-ID: <63cf3532.Ms9Qe+zNhN1feg6t%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git gpiochip-no-driver-h
branch HEAD: df771cce328bbd37333797d0df3471c2e03ecb03  gpio: Make the legacy <linux/gpio.h> consumer-only

elapsed time: 726m

configs tested: 55
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
x86_64                            allnoconfig
s390                                defconfig
m68k                             allmodconfig
arc                              allyesconfig
um                           x86_64_defconfig
um                             i386_defconfig
s390                             allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
sh                               allmodconfig
powerpc                          allmodconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
ia64                             allmodconfig
i386                                defconfig
arc                  randconfig-r043-20230123
arm                  randconfig-r046-20230123
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-bpf
i386                 randconfig-a003-20230123
i386                 randconfig-a002-20230123
i386                 randconfig-a001-20230123
i386                 randconfig-a005-20230123
i386                 randconfig-a006-20230123
i386                             allyesconfig
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig

clang tested configs:
x86_64                          rhel-8.3-rust
hexagon              randconfig-r041-20230123
hexagon              randconfig-r045-20230123
s390                 randconfig-r044-20230123
riscv                randconfig-r042-20230123
i386                 randconfig-a012-20230123
i386                 randconfig-a013-20230123
i386                 randconfig-a011-20230123
i386                 randconfig-a014-20230123
i386                 randconfig-a016-20230123
i386                 randconfig-a015-20230123
x86_64               randconfig-a013-20230123
x86_64               randconfig-a011-20230123
x86_64               randconfig-a012-20230123
x86_64               randconfig-a014-20230123
x86_64               randconfig-a016-20230123
x86_64               randconfig-a015-20230123

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
