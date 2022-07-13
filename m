Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98691572ED0
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Jul 2022 09:10:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234512AbiGMHJ7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Jul 2022 03:09:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234689AbiGMHJp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Jul 2022 03:09:45 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4B52E4749
        for <linux-gpio@vger.kernel.org>; Wed, 13 Jul 2022 00:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657696149; x=1689232149;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=xHTvuY+P4V/wGypo+Pd1X+BbhaQJs+b9nN5KmfYp9Bg=;
  b=dbJZ2ejSw5EatUaNqkzwcvxuAoypJ6EQYT+O6Ac+vUImU4svbauNJFH1
   09FEwma/2RHvkQwBHW4EWa+i72XC95J6RW2sWCbbcYTfq1bvT24HuqNvn
   /1O96p86tNfvtX+QjEKCkR9r/P9tELwtQEJQW5Xg9V+FsJpRn+ZlCs2Gh
   y0znWr2A/J2YgbUsvq7GEd6IjuXPXfE7sntDUZgFuHclu2s3y6NvWeD/l
   hDPgdQcIVTHaEzsLhFXgrKNkgDiiC7YZmUra7vRuYMp9ijWrawe8n4a+Z
   qRxgyF8p1r2nWykFV8I4ZGTCzmytM/1F4tkfieqiQM77knLrGhZudMTnr
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10406"; a="285876453"
X-IronPort-AV: E=Sophos;i="5.92,267,1650956400"; 
   d="scan'208";a="285876453"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2022 00:08:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,267,1650956400"; 
   d="scan'208";a="622825551"
Received: from lkp-server02.sh.intel.com (HELO 8708c84be1ad) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 13 Jul 2022 00:08:52 -0700
Received: from kbuild by 8708c84be1ad with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1oBWUN-0003FT-2v;
        Wed, 13 Jul 2022 07:08:51 +0000
Date:   Wed, 13 Jul 2022 15:08:49 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 2ec1aa95dafb97290d1623ba0646e31b5dbe9e6a
Message-ID: <62ce6f81.3Jg5EKwoxsNaX+jU%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 2ec1aa95dafb97290d1623ba0646e31b5dbe9e6a  Merge branch 'devel' into for-next

elapsed time: 1355m

configs tested: 13
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
