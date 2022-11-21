Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31DF8632C2C
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Nov 2022 19:36:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229960AbiKUSgg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Nov 2022 13:36:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229814AbiKUSgf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Nov 2022 13:36:35 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C930D08BA
        for <linux-gpio@vger.kernel.org>; Mon, 21 Nov 2022 10:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669055794; x=1700591794;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=6uC6PdF7mb3/PYubFLpstgfcct9NA9l/uOD5gpmbPmg=;
  b=CE0JEqDVdNOjZWQ080AYUGl/jwGzBKXjGX+7SwnBs36DsT8cAuqEwcku
   QVnuU8l9wNlUCdQyjXmIT93PMOhdkwie4vaHqPcBjwr3RAlG8gFW2+ivQ
   ow8KhmoNm+M4UBMv6jgbcUyce9u+pj2atB3DtQey5rYO29IblzQipuAjU
   OneG/BToqfOBxePTESDpICAq7RHLjKl+YUVdqW72gx40DIjjpJVN2FkhS
   eZ54gINWKSNTzSbtIQr+2ysn2rYFmFq7iN9XXmGlJsOfIQB0dVgZOxxYq
   1MVxPnT3WmrSoyCJ144yAsrgN/1OsG6gD0HlhdVX7/OS6IyuXL/RLo85Z
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="314782669"
X-IronPort-AV: E=Sophos;i="5.96,182,1665471600"; 
   d="scan'208";a="314782669"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2022 10:36:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="886222913"
X-IronPort-AV: E=Sophos;i="5.96,182,1665471600"; 
   d="scan'208";a="886222913"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 21 Nov 2022 10:36:32 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oxBei-0000g3-0j;
        Mon, 21 Nov 2022 18:36:32 +0000
Date:   Tue, 22 Nov 2022 02:35:42 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 b6b904083dfcffadc06928b46f7a6416beba0031
Message-ID: <637bc4fe.qDXzq4xfjItV6lQm%lkp@intel.com>
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
branch HEAD: b6b904083dfcffadc06928b46f7a6416beba0031  Merge branch 'devel' into for-next

elapsed time: 1171m

configs tested: 28
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
s390                             allyesconfig
um                           x86_64_defconfig
um                             i386_defconfig
powerpc                          allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
sh                               allmodconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
i386                                defconfig
i386                             allyesconfig
x86_64                              defconfig
arm                              allyesconfig
arm                                 defconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
arm64                            allyesconfig
x86_64                               rhel-8.3
alpha                            allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
x86_64                           allyesconfig
m68k                             allyesconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
