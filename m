Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4AA3C5B91A5
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Sep 2022 02:31:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbiIOAbH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Sep 2022 20:31:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229935AbiIOAbF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Sep 2022 20:31:05 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A44EF8990C
        for <linux-gpio@vger.kernel.org>; Wed, 14 Sep 2022 17:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663201863; x=1694737863;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=qzBzzh6oQDXpx5Am5c2sDbKZkN7IefE0m4C4RNIeaXE=;
  b=gWzvcaGn3EUdIiJJG/vcGSne5xcOZbZkIqhMFTenDuH6n6uysNRmWaez
   917P73j5mMXVQYSKKdno9JSmIx5LjnC5JlMWh5TLXiHLOEMs3Bk6zAy/r
   LkzROAcmnIpfPhQtjUvGQenu7FGanC79qq0IViSp8qk6Ho6i/UmSVQF0v
   Sx0rYRBwJhvgYaL4KqgezpKRXCY9NpWlS1Vubapo5fGosfFCOZf1BXe3A
   yLHLzraFVxhvH3q/muVE5999oLxwaeahXeMXaYUnw2In5QdaE6jsm05Ua
   Br1vKQHWqTbMFzLRAzP4sQM3H6s3RwsFO2VtWixNzWWN3xT4k++MyJ2z6
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10470"; a="285617256"
X-IronPort-AV: E=Sophos;i="5.93,316,1654585200"; 
   d="scan'208";a="285617256"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2022 17:31:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,316,1654585200"; 
   d="scan'208";a="568214452"
Received: from lkp-server01.sh.intel.com (HELO d6e6b7c4e5a2) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 14 Sep 2022 17:31:01 -0700
Received: from kbuild by d6e6b7c4e5a2 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oYcmS-0000il-2p;
        Thu, 15 Sep 2022 00:31:00 +0000
Date:   Thu, 15 Sep 2022 08:30:11 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 09eed5a1ed3c752892663976837eb4244c2f1984
Message-ID: <63227213.zlC1t2y9G9IwX+1s%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 09eed5a1ed3c752892663976837eb4244c2f1984  gpio: mt7621: Make the irqchip immutable

elapsed time: 726m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
x86_64                              defconfig
x86_64                               rhel-8.3
i386                          randconfig-a001
i386                          randconfig-a003
x86_64                           rhel-8.3-kvm
x86_64                        randconfig-a004
x86_64                    rhel-8.3-kselftests
x86_64                           allyesconfig
x86_64                           rhel-8.3-syz
i386                                defconfig
x86_64                          rhel-8.3-func
arc                                 defconfig
i386                          randconfig-a005
x86_64                        randconfig-a002
i386                          randconfig-a014
x86_64                         rhel-8.3-kunit
x86_64                        randconfig-a006
i386                          randconfig-a012
sh                               allmodconfig
arm                                 defconfig
s390                             allmodconfig
arc                  randconfig-r043-20220914
i386                          randconfig-a016
mips                             allyesconfig
alpha                               defconfig
powerpc                          allmodconfig
m68k                             allmodconfig
s390                             allyesconfig
alpha                            allyesconfig
x86_64                        randconfig-a013
s390                                defconfig
arc                              allyesconfig
i386                             allyesconfig
x86_64                        randconfig-a011
x86_64                        randconfig-a015
arm64                            allyesconfig
arm                              allyesconfig
m68k                             allyesconfig
ia64                             allmodconfig

clang tested configs:
i386                          randconfig-a002
i386                          randconfig-a013
i386                          randconfig-a015
x86_64                        randconfig-a005
i386                          randconfig-a006
hexagon              randconfig-r041-20220914
i386                          randconfig-a004
x86_64                        randconfig-a001
i386                          randconfig-a011
x86_64                        randconfig-a003
riscv                randconfig-r042-20220914
s390                 randconfig-r044-20220914
x86_64                        randconfig-a014
hexagon              randconfig-r045-20220914
x86_64                        randconfig-a016
x86_64                        randconfig-a012

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
