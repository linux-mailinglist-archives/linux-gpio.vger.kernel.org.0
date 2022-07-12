Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CD7F571124
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Jul 2022 06:16:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230091AbiGLEP7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Jul 2022 00:15:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbiGLEP6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Jul 2022 00:15:58 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E94DF2F008
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jul 2022 21:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657599357; x=1689135357;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=flL0AspN+pbPha2NHPMib9NQBo1QuQq8HtL04ga9X08=;
  b=DL7iHk+j45VntM06cF9bfSW+hcFeDWeGGDhmP+wGM4oE2GtFYawb6MvB
   n4JJrdekGtdvUhDFu+lYgOvG1a+uQSM9TaXoyNLmgwQYiiJSsI6SnBzlk
   3HghU1KGcEso8RD8H6kgTrYpTN5zu7gcRB+juDZmlPGM70t45ryEZnlmB
   a4JKEY+YXDhG3waF14UPSwx/DvndXk/V2bcRgbmoY0boMj/AXQr3gBbgU
   vGILTCaI8lW8q46isgh/Xhi4E2BC7Np8e6rhyxzQAmoB+C0U9OFc6fC3A
   bmS1kFV63d7Tnnlp+UFrGUluh9fmkvf1BwiuV90Ca8YNpGZ1hLfuGbMAP
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10405"; a="267872008"
X-IronPort-AV: E=Sophos;i="5.92,264,1650956400"; 
   d="scan'208";a="267872008"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2022 21:15:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,264,1650956400"; 
   d="scan'208";a="662805829"
Received: from lkp-server02.sh.intel.com (HELO 8708c84be1ad) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 11 Jul 2022 21:15:56 -0700
Received: from kbuild by 8708c84be1ad with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1oB7JT-0001f1-LI;
        Tue, 12 Jul 2022 04:15:55 +0000
Date:   Tue, 12 Jul 2022 12:15:50 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 a9ab5bf33ce9883fbf5c2fc8f4eada00c46dc089
Message-ID: <62ccf576.MKzJeYo6zIRAqiuG%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: a9ab5bf33ce9883fbf5c2fc8f4eada00c46dc089  MAINTAINERS: Update freescale pin controllers maintainer

elapsed time: 863m

configs tested: 13
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
alpha                            allyesconfig
arc                              allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
