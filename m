Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 736D057E787
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Jul 2022 21:38:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231630AbiGVTij (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Jul 2022 15:38:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236500AbiGVTih (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Jul 2022 15:38:37 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B57C558E4
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jul 2022 12:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658518717; x=1690054717;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=mgHLAH8Be0h/glLuGbGjsfLgzQ6rOlQ4q+p23UTe0sE=;
  b=UFs7NkcaSqAlw+jtFd3qo1tVQeG1BNr2UXqyVD2ypsPVu08tCJXrVCxw
   nAI5mPsyECw5R7zJoRid0jEMSna7qNVXfN6zqNSCQ9l4Z8GXezlSGzcIf
   P23YAgz8F1wfdoK50jQowwOJqiyzElu7eiSZYYfJIanRLXIIeyq44GvL7
   n/uAzTFctvSMCMhnrjjHvVzhf29udLiieRDSdKaDrej0mXhiCj7qzi8Aq
   rJETXBL9Zlzb9OKqL0gIvK4r7h35aCAqVi3FIVZg++V98xBUYkwIOys6z
   4AKhbtaFLNWWOWLnAoqQipv87xnU/Ij+Sfi4Fy4LTllZSrK3WF9ZG89zC
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10416"; a="267165797"
X-IronPort-AV: E=Sophos;i="5.93,186,1654585200"; 
   d="scan'208";a="267165797"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2022 12:38:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,186,1654585200"; 
   d="scan'208";a="775335933"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 22 Jul 2022 12:38:35 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oEyTr-0001lF-0S;
        Fri, 22 Jul 2022 19:38:35 +0000
Date:   Sat, 23 Jul 2022 03:37:38 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 32c094a09d5829ad9b02cdf667569aefa8de0ea6
Message-ID: <62dafc82.VVh8TCVFoU73XLrN%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 32c094a09d5829ad9b02cdf667569aefa8de0ea6  gpio: gpio-xilinx: Fix integer overflow

elapsed time: 724m

configs tested: 52
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig
ia64                             allmodconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
mips                             allyesconfig
sh                               allmodconfig
i386                                defconfig
i386                             allyesconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a015
x86_64                        randconfig-a013
x86_64                        randconfig-a011
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20220721
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig

clang tested configs:
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a014
x86_64                        randconfig-a012
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r041-20220721
hexagon              randconfig-r045-20220721
riscv                randconfig-r042-20220721
s390                 randconfig-r044-20220721

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
