Return-Path: <linux-gpio+bounces-9189-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F39695FBF4
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 23:46:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D5641C22525
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 21:46:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A25C19B3F9;
	Mon, 26 Aug 2024 21:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bWc47J3p"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B52A26AC3
	for <linux-gpio@vger.kernel.org>; Mon, 26 Aug 2024 21:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724708757; cv=none; b=FsNr4o/lU8NkxbvUDgqMRpIIX+z0wvKb/I5HQCLelKmy/Fukvueze2Br8c5tmM1KWOb1oc0jwVgu1SzfD8ViRT89vMjSFhCqnK8zg648vk7I3pAKZ+AcGgO9cKkBv0f2JRTDCOkjgPcu3s3Jtc5iAQypdmVEs8lGgQ+9KlpgZLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724708757; c=relaxed/simple;
	bh=k7DanrG1LSjn3gewaSxd3XhZooQ/OrE4hZyj9PUVK+o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eeJhvS7ztCj8KzRtlFzFqZqtopdHPAHKVZNPTLM5owkb8lmXLjS865L9mxzyZfJzoRKWr/Se9mpYZj83795E/e7sqOt285XdRsqV9HIvHanPkG6YktD/Vu3v6HTWEoh/WqtDq78Gzhpb2veqDS6j9vbTnFGxid5VWS5PdZTa/8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bWc47J3p; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724708755; x=1756244755;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k7DanrG1LSjn3gewaSxd3XhZooQ/OrE4hZyj9PUVK+o=;
  b=bWc47J3pNvOjJc/z9r8zST7VqRW0LBXZM67IbIa5qIyfYsCeKaghCXIG
   CqTn2Sid17qLeiGo8P5tAaNgsASGPvxNAHWJ1Wr8FNx8N5Q/Dx3LbxMMQ
   I8ltRmUq6kH5jt0IBvE6GfaLiM7T2N7FWhphM2tYaY+/uR3DGNNXpLKqw
   T9mWHFp9Ye4VCBWZD2Uef4BSImknVMcxa+dcyNX3QE8B/r8VfqlMUFtaY
   v7/Ko3w/o2NRy2P0hJ4+eUOZc+GHVSkIqZQi33fzXRIpgk9aV5ptKXzUx
   d082f3xp+ySyr5S0656BfWWhfxcaUSBHiiyRpEYyXprjm4Io7ogZxOhq7
   A==;
X-CSE-ConnectionGUID: VgGODv+cR4mfcQHWS8CBOA==
X-CSE-MsgGUID: ydwLwtanSrm4BkiSQOua6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="40627376"
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; 
   d="scan'208";a="40627376"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 14:45:32 -0700
X-CSE-ConnectionGUID: N2wyF9btRp+1Ad/Zl61nYw==
X-CSE-MsgGUID: 1mJB/nviQCKBS9MxD4SLPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; 
   d="scan'208";a="100146015"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 26 Aug 2024 14:45:31 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sihWi-000Hcy-2N;
	Mon, 26 Aug 2024 21:45:28 +0000
Date: Tue, 27 Aug 2024 05:44:46 +0800
From: kernel test robot <lkp@intel.com>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [linusw-pinctrl:ib-sophgo-pintrl 2/5]
 drivers/pinctrl/sophgo/pinctrl-cv18xx.c:544:7: error: use of undeclared
 identifier 'PIN_CONFIG_INPUT_SCHMITT_UV'; did you mean
 'PIN_CONFIG_INPUT_SCHMITT'?
Message-ID: <202408270540.4jPYshgO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git ib-sophgo-pintrl
head:   e7a4141f4420879720f9d2c99974e269044c7597
commit: a29d8e93e710e97863d5bb4e4b6079d6c7daab81 [2/5] pinctrl: sophgo: add support for CV1800B SoC
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240827/202408270540.4jPYshgO-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 08e5a1de8227512d4774a534b91cb2353cef6284)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240827/202408270540.4jPYshgO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408270540.4jPYshgO-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/pinctrl/sophgo/pinctrl-cv18xx.c:11:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/pinctrl/sophgo/pinctrl-cv18xx.c:11:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/pinctrl/sophgo/pinctrl-cv18xx.c:11:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   In file included from drivers/pinctrl/sophgo/pinctrl-cv18xx.c:13:
   In file included from include/linux/platform_device.h:13:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/sophgo/pinctrl-cv18xx.c:544:7: error: use of undeclared identifier 'PIN_CONFIG_INPUT_SCHMITT_UV'; did you mean 'PIN_CONFIG_INPUT_SCHMITT'?
     544 |         case PIN_CONFIG_INPUT_SCHMITT_UV:
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |              PIN_CONFIG_INPUT_SCHMITT
   include/linux/pinctrl/pinconf-generic.h:133:2: note: 'PIN_CONFIG_INPUT_SCHMITT' declared here
     133 |         PIN_CONFIG_INPUT_SCHMITT,
         |         ^
   drivers/pinctrl/sophgo/pinctrl-cv18xx.c:611:8: error: use of undeclared identifier 'PIN_CONFIG_INPUT_SCHMITT_UV'; did you mean 'PIN_CONFIG_INPUT_SCHMITT'?
     611 |                 case PIN_CONFIG_INPUT_SCHMITT_UV:
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                      PIN_CONFIG_INPUT_SCHMITT
   include/linux/pinctrl/pinconf-generic.h:133:2: note: 'PIN_CONFIG_INPUT_SCHMITT' declared here
     133 |         PIN_CONFIG_INPUT_SCHMITT,
         |         ^
   17 warnings and 2 errors generated.


vim +544 drivers/pinctrl/sophgo/pinctrl-cv18xx.c

   505	
   506	static int cv1800_pconf_get(struct pinctrl_dev *pctldev,
   507				    unsigned int pin_id, unsigned long *config)
   508	{
   509		struct cv1800_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
   510		int param = pinconf_to_config_param(*config);
   511		struct cv1800_pin *pin = cv1800_get_pin(pctrl, pin_id);
   512		enum cv1800_pin_io_type type;
   513		u32 value;
   514		u32 arg;
   515		bool enabled;
   516		int ret;
   517	
   518		if (!pin)
   519			return -EINVAL;
   520	
   521		type = cv1800_pin_io_type(pin);
   522		if (type == IO_TYPE_ETH || type == IO_TYPE_AUDIO)
   523			return -ENOTSUPP;
   524	
   525		value = readl(cv1800_pinctrl_get_component_addr(pctrl, &pin->conf));
   526	
   527		switch (param) {
   528		case PIN_CONFIG_BIAS_PULL_DOWN:
   529			enabled = FIELD_GET(PIN_IO_PULLDOWN, value);
   530			arg = cv1800_pull_down_typical_resistor(pctrl, pin);
   531			break;
   532		case PIN_CONFIG_BIAS_PULL_UP:
   533			enabled = FIELD_GET(PIN_IO_PULLUP, value);
   534			arg = cv1800_pull_up_typical_resistor(pctrl, pin);
   535			break;
   536		case PIN_CONFIG_DRIVE_STRENGTH_UA:
   537			enabled = true;
   538			arg = FIELD_GET(PIN_IO_DRIVE, value);
   539			ret = cv1800_pinctrl_reg2oc(pctrl, pin, arg);
   540			if (ret < 0)
   541				return ret;
   542			arg = ret;
   543			break;
 > 544		case PIN_CONFIG_INPUT_SCHMITT_UV:
   545			arg = FIELD_GET(PIN_IO_SCHMITT, value);
   546			ret = cv1800_pinctrl_reg2schmitt(pctrl, pin, arg);
   547			if (ret < 0)
   548				return ret;
   549			arg = ret;
   550			enabled = arg != 0;
   551			break;
   552		case PIN_CONFIG_POWER_SOURCE:
   553			enabled = true;
   554			arg = cv1800_get_power_cfg(pctrl, pin->power_domain);
   555			break;
   556		case PIN_CONFIG_SLEW_RATE:
   557			enabled = true;
   558			arg = FIELD_GET(PIN_IO_OUT_FAST_SLEW, value);
   559			break;
   560		case PIN_CONFIG_BIAS_BUS_HOLD:
   561			arg = FIELD_GET(PIN_IO_BUS_HOLD, value);
   562			enabled = arg != 0;
   563			break;
   564		default:
   565			return -ENOTSUPP;
   566		}
   567	
   568		*config = pinconf_to_config_packed(param, arg);
   569	
   570		return enabled ? 0 : -EINVAL;
   571	}
   572	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

