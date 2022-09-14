Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DCF55B7F2F
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Sep 2022 05:06:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229480AbiINDGT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Sep 2022 23:06:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbiINDGQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Sep 2022 23:06:16 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E93046CF5F
        for <linux-gpio@vger.kernel.org>; Tue, 13 Sep 2022 20:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663124775; x=1694660775;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=9TNXrSJ/9w8o5iqGhhDEUfX6AHTqC05/oQQpngwKnzQ=;
  b=f8FTKujoX/38tNaZCRMS4yz1GCMJuiq/G2JqbfnXbfPH0TsHOLzM+lso
   53of9ceCTDPPjx4S5xT1OX0n6Io+VPvKNcwRcmJAtxHm1k/677U2o5E8H
   ew0y3hz/prfjBt+stn//tXtpg2V1TN9FFlG1NuxyMeocVcsjBcldnHfo8
   oMwzIfJR6DbmBDXBDjNWBaEoJQvCIjDxfbdNiiB1t4gd6cjB1QbYTvnYl
   NymTYFmCKArmz60cE/1Vqe3bK4BCQPmyVd1AJ4Xzm7+i9ur1ydA9v7KtR
   5gOcd602nxgpOVRI6AdU/Lcb/+yo/V8ZQRaMpX1ejuI/gFfFl4XzWzpu0
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10469"; a="360061021"
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; 
   d="scan'208";a="360061021"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2022 20:06:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; 
   d="scan'208";a="759054456"
Received: from lkp-server02.sh.intel.com (HELO 4011df4f4fd3) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 13 Sep 2022 20:06:03 -0700
Received: from kbuild by 4011df4f4fd3 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oYIiw-0004IZ-26;
        Wed, 14 Sep 2022 03:06:02 +0000
Date:   Wed, 14 Sep 2022 11:05:47 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 94e9bc73d85aa6ecfe249e985ff57abe0ab35f34
Message-ID: <6321450b.riPf0S1RXEU9mv0f%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 94e9bc73d85aa6ecfe249e985ff57abe0ab35f34  gpio: ixp4xx: Make irqchip immutable

elapsed time: 724m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
i386                                defconfig
x86_64                           rhel-8.3-kvm
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64               randconfig-a001-20220912
x86_64                          rhel-8.3-func
powerpc                           allnoconfig
x86_64                               rhel-8.3
x86_64               randconfig-a002-20220912
x86_64                         rhel-8.3-kunit
x86_64               randconfig-a003-20220912
x86_64                           rhel-8.3-syz
x86_64               randconfig-a004-20220912
riscv                randconfig-r042-20220911
x86_64               randconfig-a005-20220912
arc                  randconfig-r043-20220912
x86_64               randconfig-a006-20220912
i386                 randconfig-a001-20220912
sh                               allmodconfig
i386                 randconfig-a002-20220912
powerpc                          allmodconfig
arm                                 defconfig
i386                 randconfig-a003-20220912
arc                  randconfig-r043-20220911
s390                 randconfig-r044-20220911
i386                 randconfig-a006-20220912
mips                             allyesconfig
i386                 randconfig-a005-20220912
arm                              allyesconfig
i386                 randconfig-a004-20220912
i386                             allyesconfig
arm64                            allyesconfig
ia64                             allmodconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015

clang tested configs:
i386                 randconfig-a014-20220912
i386                 randconfig-a013-20220912
i386                 randconfig-a011-20220912
i386                 randconfig-a012-20220912
i386                 randconfig-a015-20220912
i386                 randconfig-a016-20220912
riscv                randconfig-r042-20220912
hexagon              randconfig-r041-20220912
hexagon              randconfig-r045-20220911
hexagon              randconfig-r041-20220911
hexagon              randconfig-r045-20220912
s390                 randconfig-r044-20220912
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
