Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C746632E28
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Nov 2022 21:47:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229698AbiKUUrj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Nov 2022 15:47:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230261AbiKUUrh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Nov 2022 15:47:37 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A812FF592
        for <linux-gpio@vger.kernel.org>; Mon, 21 Nov 2022 12:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669063656; x=1700599656;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=bMNZFTby8hCSDAETnPpPPZ2OOOflcgwPEfwpbWV6GXQ=;
  b=nkCGONu3QDauVtubVBOOfUOkycO9Ck0jFrEFPp0a/vsIcW5lLVVDyAYz
   faPjWVnVjYwNesGvjLHzSvC4XzGoUXVrKdjK5gHPUSTQdYCZfEVPEOrdY
   Hz3lg26qGwZr1u9Vlj5WDB8S54XbmBCg9FSioZmT35If8bwatuqXujggD
   Qhd75WJrREJS109DScpq/bgKmTIJpn6sceGcCRZMpJs02LtJE+pR0kGlE
   jWtXfpAQa/v6F5yoXPG4g+yt+2+BUaZZ8yRsB+0NHjjkvSutVrHIOypTc
   pdh0N4JFkGcvea4CA4h86B8/HJzSzNjUS8Lk5s0Y7jPmdAfdKLA1dqYGS
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="314808205"
X-IronPort-AV: E=Sophos;i="5.96,182,1665471600"; 
   d="scan'208";a="314808205"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2022 12:47:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="672230635"
X-IronPort-AV: E=Sophos;i="5.96,182,1665471600"; 
   d="scan'208";a="672230635"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 21 Nov 2022 12:47:35 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oxDhW-0000jf-24;
        Mon, 21 Nov 2022 20:47:34 +0000
Date:   Tue, 22 Nov 2022 04:47:06 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 d53f77d77f08321b2c7e405fdb310c59e906098e
Message-ID: <637be3ca.l6LtO+zFSgJCVQOP%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: d53f77d77f08321b2c7e405fdb310c59e906098e  Merge tag 'renesas-pinctrl-for-v6.2-tag1' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers into devel

elapsed time: 1303m

configs tested: 28
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
arc                                 defconfig
mips                             allyesconfig
s390                             allmodconfig
powerpc                          allmodconfig
alpha                               defconfig
s390                                defconfig
sh                               allmodconfig
um                             i386_defconfig
um                           x86_64_defconfig
s390                             allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
i386                                defconfig
i386                             allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
x86_64                           rhel-8.3-kvm
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-syz
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
