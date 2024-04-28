Return-Path: <linux-gpio+bounces-5921-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FEA8B4A82
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Apr 2024 09:35:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 34E94B21163
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Apr 2024 07:35:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 629B550A6D;
	Sun, 28 Apr 2024 07:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="euPcGjhK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1722AE95
	for <linux-gpio@vger.kernel.org>; Sun, 28 Apr 2024 07:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714289723; cv=none; b=SiBvojKOzwEqE+A7bU1V9Z5ILoNvW9ZW0X+p72ei/7YwR6NK8K/bUZMRszTD1+R+5BE5/z3hN1QbdntH/yI/CfUZ74vl16qVk6s7GYLgUUKOuQYv3vUGcrzjH3TEbxAAZtJAyOHcgu7PzjmDZbzPUPz+BEgNRloVRMApP0UGKtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714289723; c=relaxed/simple;
	bh=JEAGslmRpPNmj8VFaV2pga/EQ6hYflqk+2sNK1+XWDo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nKyZyIOxCe5sP6DwvYzGiq3GqZOiEExz/AP/5tLaqpVHVCtHmuvZ7IOoNwqI+o90CdTBnDtj+Zhrzvnzybs/SfYbuBO1mNLSTdWVfiUTzh+5MF6U+wXsPRX3F+/f/sbOXsM1FcScXzaAAk1QraSraOQkkp+Spmg5Kp+fqu1QNLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=euPcGjhK; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714289722; x=1745825722;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JEAGslmRpPNmj8VFaV2pga/EQ6hYflqk+2sNK1+XWDo=;
  b=euPcGjhKSUfdTx65bO+rbviv0nBzDmKAqIg9jI0Y/YmkV57ibWk1paQ4
   pfJE2+xXICXwJmylIN/khZk/QI8fc5Ol796cNtDmnXoT5vI5Z+iPf2s04
   2V+H3MKI287w+POvl4eY4z5ss5ucz9YLm/GWRMKIBML4C2b+rTRDVKyLq
   PaCUpwvAVoo6FmbL/Eh08cRqBVQom9Vl/+vgn0w2UUXJBncU43r7atFe6
   CWZoujepofOEmEF2f1YlFpMLbyelX4w1FpK1dBwskLfUYyODH7pPJHKPy
   EIC2O7Mc/v2ZdH/yZWcGo3yCQxfxoJ7AfAvOxwSkCFkCBSiZV46D19HXM
   w==;
X-CSE-ConnectionGUID: LjRYosVxQXKy77Qy6fcTmA==
X-CSE-MsgGUID: E2h/4lp7SvKq/vXaDAwNKA==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="10190670"
X-IronPort-AV: E=Sophos;i="6.07,237,1708416000"; 
   d="scan'208";a="10190670"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 00:35:21 -0700
X-CSE-ConnectionGUID: uuutTXgERnKf68QLsuWXyA==
X-CSE-MsgGUID: /Emj/o2LSHuKaLl1+ayOVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,237,1708416000"; 
   d="scan'208";a="49048113"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 28 Apr 2024 00:35:20 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0z49-0005yA-1f;
	Sun, 28 Apr 2024 07:35:17 +0000
Date: Sun, 28 Apr 2024 15:34:44 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org
Subject: [linusw-gpio:b4/spitz 4/4] include/linux/spi/pxa2xx_spi.h:53:52:
 warning: declaration of 'struct property_entry' will not be visible outside
 of this function
Message-ID: <202404281554.eIxXrnLs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git b4/spitz
head:   40c9c2538a37054ef2a1c56f3a41e64ba82cd6aa
commit: 40c9c2538a37054ef2a1c56f3a41e64ba82cd6aa [4/4] ARM: spitz: Use software nodes for the ADS7846 touchscreen
config: arm-randconfig-003-20240428 (https://download.01.org/0day-ci/archive/20240428/202404281554.eIxXrnLs-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240428/202404281554.eIxXrnLs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404281554.eIxXrnLs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/spi/spi-pxa2xx-dma.c:10:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/spi/spi-pxa2xx-dma.c:15:
>> include/linux/spi/pxa2xx_spi.h:53:52: warning: declaration of 'struct property_entry' will not be visible outside of this function [-Wvisibility]
      53 | void pxa2xx_set_spi_node(unsigned id, const struct property_entry *props);
         |                                                    ^
   2 warnings generated.


vim +53 include/linux/spi/pxa2xx_spi.h

    51	
    52	extern void pxa2xx_set_spi_info(unsigned id, struct pxa2xx_spi_controller *info);
  > 53	void pxa2xx_set_spi_node(unsigned id, const struct property_entry *props);
    54	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

