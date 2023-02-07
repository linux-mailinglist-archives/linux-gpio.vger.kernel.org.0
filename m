Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F6F068CB38
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Feb 2023 01:34:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229447AbjBGAeb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Feb 2023 19:34:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229630AbjBGAe2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Feb 2023 19:34:28 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 455609ED5
        for <linux-gpio@vger.kernel.org>; Mon,  6 Feb 2023 16:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675730068; x=1707266068;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=qu+OTEbisF7xWX1TsM90TkydERwOfLXazqjrH6g8P+U=;
  b=Rva1I7hnvFRyZ8cBCN+wgzwND9cIe6D9BIC2SKxt+3ksNeXqO3B342KA
   x3i9inO3D9fKF447dPcKjbRBCKUw/HUcC6VYr1hkaeGKOu6zPI8cvhvrv
   3mX36KviKwKT/a7AXugnvf936claC53JWHMte+lP1AHf9bIx4K9dMct60
   4yvsN48IWqt+0/RuSRF4fW1Lsa1vwqcHfeKPBgKS33ppkh3im5d53PKlz
   fmNCgq7Kl9Iywka0iLWW+qOSfoc6p+zdO8rF1IwB9L6GlTjbxrQoGz9xY
   0g+O08KYN6/WvF6wO+Du1E6IejPyQ4hkZQGBe/FJ/ZYWkNMRRxw1NX3sJ
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="309693374"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="309693374"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 16:34:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="790605154"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="790605154"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 06 Feb 2023 16:34:25 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pPBwH-0002u2-0A;
        Tue, 07 Feb 2023 00:34:25 +0000
Date:   Tue, 07 Feb 2023 08:33:51 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 ff51053424ec6dcaae95e02ce900cc8cbe1c3ed6
Message-ID: <63e19c6f.O2oQl8qbQXwH22pm%lkp@intel.com>
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
branch HEAD: ff51053424ec6dcaae95e02ce900cc8cbe1c3ed6  dt-bindings: pinctrl: rockchip,pinctrl: mark gpio sub nodes of pinctrl as deprecated

elapsed time: 721m

configs tested: 50
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
powerpc                           allnoconfig
sh                               allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
um                             i386_defconfig
um                           x86_64_defconfig
m68k                             allyesconfig
m68k                             allmodconfig
alpha                            allyesconfig
arc                                 defconfig
arc                              allyesconfig
alpha                               defconfig
x86_64                           rhel-8.3-bpf
s390                             allmodconfig
x86_64                              defconfig
s390                                defconfig
x86_64                           rhel-8.3-syz
x86_64                               rhel-8.3
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           allyesconfig
s390                             allyesconfig
ia64                             allmodconfig
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20230205
arm                  randconfig-r046-20230205
arc                  randconfig-r043-20230206
riscv                randconfig-r042-20230206
s390                 randconfig-r044-20230206
i386                                defconfig
arm                                 defconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
i386                             allyesconfig
arm64                            allyesconfig
arm                              allyesconfig

clang tested configs:
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r041-20230205
riscv                randconfig-r042-20230205
hexagon              randconfig-r045-20230206
hexagon              randconfig-r041-20230206
arm                  randconfig-r046-20230206
hexagon              randconfig-r045-20230205
s390                 randconfig-r044-20230205
x86_64                          rhel-8.3-rust

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
