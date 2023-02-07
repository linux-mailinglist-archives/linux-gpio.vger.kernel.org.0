Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57CE168CCB6
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Feb 2023 03:48:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbjBGCsb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Feb 2023 21:48:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbjBGCsa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Feb 2023 21:48:30 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26F4F23C7A
        for <linux-gpio@vger.kernel.org>; Mon,  6 Feb 2023 18:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675738110; x=1707274110;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=59x8H3s7ri/CDFVkFi0jUugnNzcJWr510as1OvYbmT4=;
  b=NcerhA/p34TXbc+8dWz9co1IA6TrdCu41qHFL/5NHrJZlgzL3Ie7e1zB
   8oiMP2LXGOAoeM68ix/rpMzqqLp4Gp1fprOG24ltzaTX6A5nodmCD7nVZ
   NPJ7NJppzfAcyfQgccdgU8NbIxOaHwYLCUyEvJ+mggFA+hQM6uAzxDeLb
   Q3DJ6qd2QxtLVeNokV3StFpxJKLIKpWS0jnCg71dyh++cXhICGSEoBRBF
   Klw0DtoKDYNbAKerUudLgA34/sN8D2jS5lz7dHbTHmJSvxt+l3c1aKIK0
   ycrebPfvHMgFIhNt3jrUwtMFiukMCrYoIWWpQIZE3Kmr3ikRFRCw35oau
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="330677140"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="330677140"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 18:48:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="755470717"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="755470717"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 06 Feb 2023 18:48:28 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pPE1z-0002yW-2Y;
        Tue, 07 Feb 2023 02:48:27 +0000
Date:   Tue, 07 Feb 2023 10:48:03 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 5921b250f43870e7d8044ca14e402292ceb3e3a8
Message-ID: <63e1bbe3.ZL2whkfzdj9J3NT5%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: 5921b250f43870e7d8044ca14e402292ceb3e3a8  pinctrl: qcom: sm8450-lpass-lpi: correct swr_rx_data group

elapsed time: 855m

configs tested: 38
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
um                           x86_64_defconfig
um                             i386_defconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
powerpc                           allnoconfig
s390                                defconfig
s390                             allyesconfig
x86_64                              defconfig
alpha                            allyesconfig
m68k                             allyesconfig
arc                              allyesconfig
x86_64                               rhel-8.3
i386                 randconfig-a011-20230206
i386                 randconfig-a014-20230206
x86_64                           allyesconfig
i386                 randconfig-a012-20230206
i386                 randconfig-a013-20230206
i386                 randconfig-a015-20230206
i386                 randconfig-a016-20230206
x86_64                           rhel-8.3-bpf
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
sh                               allmodconfig
ia64                             allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
i386                                defconfig
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig
i386                             allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
m68k                             allmodconfig

clang tested configs:
x86_64                          rhel-8.3-rust

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
