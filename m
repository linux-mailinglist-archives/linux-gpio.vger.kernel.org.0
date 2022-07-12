Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D97DE571209
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Jul 2022 07:58:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229572AbiGLF6J (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Jul 2022 01:58:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbiGLF6E (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Jul 2022 01:58:04 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3D403134F
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jul 2022 22:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657605483; x=1689141483;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=baK0zE5zN1ddcBSomBSx/BeT4/yreJanNvM9SFnf8+A=;
  b=oFxPsAcBWhbF+ZWpIuaclSHn6uSUHPt2veMP63DnQ7rcV5KVR4O6L/WP
   XD5DRsdSqkQ/aTfhW6QqI8v/2Ndc8nqkW37idfon3yj4KQEbnGPWJtB4W
   XI0dYUXR/hUGcrCOxITh+ADFPpcV1VYe1TpFSFcWDeSh1wlroZRBHVa8p
   rn+TrP89Sl3ut52UOjIxjqwvuyi8K0Np72IqYX+t9CpJh9bzbLqurXq2e
   /bAiUgjxSHToyw9fTvejQeKzXUbFSosonbLxdG7x01TX/glXqgp16Zx/b
   R5D4Rk1j7CtlLEcLLevZDgdNF4RSNX2GdO5r7ebDBCr6iVeRjG9W8H/Ev
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10405"; a="282397825"
X-IronPort-AV: E=Sophos;i="5.92,264,1650956400"; 
   d="scan'208";a="282397825"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2022 22:58:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,264,1650956400"; 
   d="scan'208";a="922071726"
Received: from lkp-server02.sh.intel.com (HELO 8708c84be1ad) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 11 Jul 2022 22:58:01 -0700
Received: from kbuild by 8708c84be1ad with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1oB8uH-0001mn-3t;
        Tue, 12 Jul 2022 05:58:01 +0000
Date:   Tue, 12 Jul 2022 13:57:18 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 1bc08c9bbf3e3aeea449bd93604f3b3fc8b9e9d2
Message-ID: <62cd0d3e.RO4fo3/D+1WapNqS%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 1bc08c9bbf3e3aeea449bd93604f3b3fc8b9e9d2  Merge branch 'devel' into for-next

elapsed time: 964m

configs tested: 13
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
alpha                            allyesconfig
arc                              allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
