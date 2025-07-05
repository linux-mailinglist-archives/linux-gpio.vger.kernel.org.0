Return-Path: <linux-gpio+bounces-22816-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DD3AF9E5A
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Jul 2025 07:08:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 83BE07B0DC0
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Jul 2025 05:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87554263F5B;
	Sat,  5 Jul 2025 05:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ln99sg0M"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B72718FDD2;
	Sat,  5 Jul 2025 05:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751692107; cv=none; b=dYkVMOCd+V833jinrKH/17vkm6ss/qU0j8ASDhgh4sOhxs91VCDNVihl64iX3uy89VofpmxkJcvaSaqS3CS0/bm50RSBJBwdb3u4+5CegelYOE/FnP3cBV2Wu8UX5JfNVNKs5uTL0mQBoZu4ENlvUf7JiiK9SwqwWhT25eruBEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751692107; c=relaxed/simple;
	bh=y4YbVKjIpJUvJyG6P+uiV9yZeiRLnh3BlJE9dI35KLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N+UPI9bQf2eFKPT+LRvvjTDB9jPuti9HZvLhrRN5ea6qihWFjVC4N0dSFVbYqeTkH61i41FgI/NQ3mJ8Datn8CEqkYWRBX5EeGe8VZnZVqudSE7R79/VhTywtaXCCoX6q4MyBoyamu17QVF/XazSxgJrX0o122Jm2fUOnO1+AqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ln99sg0M; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751692105; x=1783228105;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=y4YbVKjIpJUvJyG6P+uiV9yZeiRLnh3BlJE9dI35KLo=;
  b=Ln99sg0M2VHTs68nEXUishPTw6uj86Wt6X0jERgFdSPNaaUT1+onKPTY
   c6AuHmELRckFCUZELX4556gcNE0TiJIMjmj8Q9OBhhBE+We5TtHcvZzCA
   tslZV0OTRMs9pR8kFh7sjFF0OLNE1enrtuR0OBHHxTJfd6Fx0DGb0R9Fd
   fx+C9laohUdGdai4+L+nCRFHQBvCUIrhsEWiWiSrSMpBhiJn88gKKWd0M
   00fLQ4tTqCM+SlXRJMkB2xEpZh3SPPaNSixlvf3TzDn9ag7NwZ022UKqb
   ev0nC8tyy4jplOcHohy0SpwOJyWHPI4Sa7NgKj4uen9n9mcF5e79WX+j7
   Q==;
X-CSE-ConnectionGUID: y5SBai1/TIuWM7jACK94sg==
X-CSE-MsgGUID: 5vXN95XUQhqTcBo0U8ACLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="79443469"
X-IronPort-AV: E=Sophos;i="6.16,289,1744095600"; 
   d="scan'208";a="79443469"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 22:08:24 -0700
X-CSE-ConnectionGUID: I8XUcSjlT9S3JX+2sWvfGw==
X-CSE-MsgGUID: R0W+LATIQlKLp+hRX+hGKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,289,1744095600"; 
   d="scan'208";a="160440705"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 Jul 2025 22:08:22 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXv8M-0004Ih-2g;
	Sat, 05 Jul 2025 05:08:18 +0000
Date: Sat, 5 Jul 2025 13:07:20 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Griffin <peter.griffin@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>
Subject: Re: [PATCH] pinctrl: samsung: Fix gs101 irq chip
Message-ID: <202507051248.6qkGauvn-lkp@intel.com>
References: <20250702-fix-gs101-irqchip-v1-1-ccc84b44ad72@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702-fix-gs101-irqchip-v1-1-ccc84b44ad72@linaro.org>

Hi Peter,

kernel test robot noticed the following build errors:

[auto build test ERROR on 2aeda9592360c200085898a258c4754bfe879921]

url:    https://github.com/intel-lab-lkp/linux/commits/Peter-Griffin/pinctrl-samsung-Fix-gs101-irq-chip/20250702-201914
base:   2aeda9592360c200085898a258c4754bfe879921
patch link:    https://lore.kernel.org/r/20250702-fix-gs101-irqchip-v1-1-ccc84b44ad72%40linaro.org
patch subject: [PATCH] pinctrl: samsung: Fix gs101 irq chip
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250705/202507051248.6qkGauvn-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250705/202507051248.6qkGauvn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507051248.6qkGauvn-lkp@intel.com/

All errors (new ones prefixed by >>):

   include/linux/lockdep.h:279:7: note: expanded from macro 'lockdep_assert'
     279 |         do { WARN_ON(debug_locks && !(cond)); } while (0)
         |              ^
   include/asm-generic/bug.h:132:3: note: expanded from macro 'WARN_ON'
     132 |                 __WARN();                                               \
         |                 ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/stringify.h:10:27: note: expanded from macro '__stringify'
      10 | #define __stringify(x...)       __stringify_1(x)
         |                                 ^
   include/linux/stringify.h:9:29: note: expanded from macro '__stringify_1'
       9 | #define __stringify_1(x...)     #x
         |                                 ^
   <scratch space>:15:1: note: expanded from here
      15 | ".pushsection __bug_table, \"aw\"; .align 2; 10000: .long 10001f - .; .pushsection .rodata.str, \"aMS\", @progbits, 1; 10002: .string \"\" \"drivers/net/wireless/realtek/rtw88/hci.h\"; .popsection; .long 10002b - .; .short 197; .short (1 << 0)|(((9) << 8)); .popsection; 10001: break 1;"
         | ^
   <inline asm>:1:134: note: instantiated into assembly here
       1 |         .pushsection __bug_table, "aw"; .align 2; 10000: .long 10001f - .; .pushsection .rodata.str, "aMS", @progbits, 1; 10002: .string "" "drivers/net/wireless/realtek/rtw88/hci.h"; .popsection; .long 10002b - .; .short 197; .short (1 << 0)|(((9) << 8)); .popsection; 10001: break 1;
         |                                                                                                                                             ^
   In file included from drivers/net/wireless/realtek/rtw88/rtw8822c.c:6:
   In file included from drivers/net/wireless/realtek/rtw88/main.h:2136:
   drivers/net/wireless/realtek/rtw88/hci.h:197:2: error: unexpected token
     197 |         lockdep_assert_held(&rtwdev->mutex);
         |         ^
   include/linux/lockdep.h:285:2: note: expanded from macro 'lockdep_assert_held'
     285 |         lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
         |         ^
   include/linux/lockdep.h:279:7: note: expanded from macro 'lockdep_assert'
     279 |         do { WARN_ON(debug_locks && !(cond)); } while (0)
         |              ^
   include/asm-generic/bug.h:132:3: note: expanded from macro 'WARN_ON'
     132 |                 __WARN();                                               \
         |                 ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/stringify.h:10:27: note: expanded from macro '__stringify'
      10 | #define __stringify(x...)       __stringify_1(x)
         |                                 ^
   include/linux/stringify.h:9:29: note: expanded from macro '__stringify_1'
       9 | #define __stringify_1(x...)     #x
         |                                 ^
   <scratch space>:15:1: note: expanded from here
      15 | ".pushsection __bug_table, \"aw\"; .align 2; 10000: .long 10001f - .; .pushsection .rodata.str, \"aMS\", @progbits, 1; 10002: .string \"\" \"drivers/net/wireless/realtek/rtw88/hci.h\"; .popsection; .long 10002b - .; .short 197; .short (1 << 0)|(((9) << 8)); .popsection; 10001: break 1;"
         | ^
   <inline asm>:1:134: note: instantiated into assembly here
       1 |         .pushsection __bug_table, "aw"; .align 2; 10000: .long 10001f - .; .pushsection .rodata.str, "aMS", @progbits, 1; 10002: .string "" "drivers/net/wireless/realtek/rtw88/hci.h"; .popsection; .long 10002b - .; .short 197; .short (1 << 0)|(((9) << 8)); .popsection; 10001: break 1;
         |                                                                                                                                             ^
   In file included from drivers/net/wireless/realtek/rtw88/rtw8822c.c:6:
   In file included from drivers/net/wireless/realtek/rtw88/main.h:2136:
   drivers/net/wireless/realtek/rtw88/hci.h:186:2: error: unexpected token
     186 |         lockdep_assert_held(&rtwdev->mutex);
         |         ^
   include/linux/lockdep.h:285:2: note: expanded from macro 'lockdep_assert_held'
     285 |         lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
         |         ^
   include/linux/lockdep.h:279:7: note: expanded from macro 'lockdep_assert'
     279 |         do { WARN_ON(debug_locks && !(cond)); } while (0)
         |              ^
   include/asm-generic/bug.h:132:3: note: expanded from macro 'WARN_ON'
     132 |                 __WARN();                                               \
         |                 ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/stringify.h:10:27: note: expanded from macro '__stringify'
      10 | #define __stringify(x...)       __stringify_1(x)
         |                                 ^
   include/linux/stringify.h:9:29: note: expanded from macro '__stringify_1'
       9 | #define __stringify_1(x...)     #x
         |                                 ^
   <scratch space>:12:1: note: expanded from here
      12 | ".pushsection __bug_table, \"aw\"; .align 2; 10000: .long 10001f - .; .pushsection .rodata.str, \"aMS\", @progbits, 1; 10002: .string \"\" \"drivers/net/wireless/realtek/rtw88/hci.h\"; .popsection; .long 10002b - .; .short 186; .short (1 << 0)|(((9) << 8)); .popsection; 10001: break 1;"
         | ^
   <inline asm>:1:134: note: instantiated into assembly here
       1 |         .pushsection __bug_table, "aw"; .align 2; 10000: .long 10001f - .; .pushsection .rodata.str, "aMS", @progbits, 1; 10002: .string "" "drivers/net/wireless/realtek/rtw88/hci.h"; .popsection; .long 10002b - .; .short 186; .short (1 << 0)|(((9) << 8)); .popsection; 10001: break 1;
         |                                                                                                                                             ^
   In file included from drivers/net/wireless/realtek/rtw88/rtw8822c.c:6:
   In file included from drivers/net/wireless/realtek/rtw88/main.h:2136:
   drivers/net/wireless/realtek/rtw88/hci.h:186:2: error: unexpected token
     186 |         lockdep_assert_held(&rtwdev->mutex);
         |         ^
   include/linux/lockdep.h:285:2: note: expanded from macro 'lockdep_assert_held'
     285 |         lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
         |         ^
   include/linux/lockdep.h:279:7: note: expanded from macro 'lockdep_assert'
     279 |         do { WARN_ON(debug_locks && !(cond)); } while (0)
         |              ^
   include/asm-generic/bug.h:132:3: note: expanded from macro 'WARN_ON'
     132 |                 __WARN();                                               \
         |                 ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/stringify.h:10:27: note: expanded from macro '__stringify'
      10 | #define __stringify(x...)       __stringify_1(x)
         |                                 ^
   include/linux/stringify.h:9:29: note: expanded from macro '__stringify_1'
       9 | #define __stringify_1(x...)     #x
         |                                 ^
   <scratch space>:12:1: note: expanded from here
      12 | ".pushsection __bug_table, \"aw\"; .align 2; 10000: .long 10001f - .; .pushsection .rodata.str, \"aMS\", @progbits, 1; 10002: .string \"\" \"drivers/net/wireless/realtek/rtw88/hci.h\"; .popsection; .long 10002b - .; .short 186; .short (1 << 0)|(((9) << 8)); .popsection; 10001: break 1;"
         | ^
   <inline asm>:1:134: note: instantiated into assembly here
       1 |         .pushsection __bug_table, "aw"; .align 2; 10000: .long 10001f - .; .pushsection .rodata.str, "aMS", @progbits, 1; 10002: .string "" "drivers/net/wireless/realtek/rtw88/hci.h"; .popsection; .long 10002b - .; .short 186; .short (1 << 0)|(((9) << 8)); .popsection; 10001: break 1;
         |                                                                                                                                             ^
>> drivers/net/wireless/realtek/rtw88/rtw8822c.c:4364:6: error: unexpected token
    4364 |         if (WARN_ON(bw > RTW_CHANNEL_WIDTH_40 || nrx >= RTW_RF_PATH_MAX))
         |             ^
   include/asm-generic/bug.h:132:3: note: expanded from macro 'WARN_ON'
     132 |                 __WARN();                                               \
         |                 ^
   include/asm-generic/bug.h:109:19: note: expanded from macro '__WARN'
     109 | #define __WARN()                __WARN_FLAGS("", BUGFLAG_TAINT(TAINT_WARN))
         |                                 ^
   arch/loongarch/include/asm/bug.h:47:2: note: expanded from macro '__WARN_FLAGS'
      47 |         __BUG_FLAGS(cond_str, BUGFLAG_WARNING|(flags), ANNOTATE_REACHABLE(10001b));\
         |         ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/stringify.h:10:27: note: expanded from macro '__stringify'
      10 | #define __stringify(x...)       __stringify_1(x)
         |                                 ^
   include/linux/stringify.h:9:29: note: expanded from macro '__stringify_1'
       9 | #define __stringify_1(x...)     #x
         |                                 ^
   <scratch space>:42:1: note: expanded from here
      42 | ".pushsection __bug_table, \"aw\"; .align 2; 10000: .long 10001f - .; .pushsection .rodata.str, \"aMS\", @progbits, 1; 10002: .string \"\" \"drivers/net/wireless/realtek/rtw88/rtw8822c.c\"; .popsection; .long 10002b - .; .short 4364; .short (1 << 0)|(((9) << 8)); .popsection; 10001: break 1;"
         | ^
   <inline asm>:1:134: note: instantiated into assembly here
       1 |         .pushsection __bug_table, "aw"; .align 2; 10000: .long 10001f - .; .pushsection .rodata.str, "aMS", @progbits, 1; 10002: .string "" "drivers/net/wireless/realtek/rtw88/rtw8822c.c"; .popsection; .long 10002b - .; .short 4364; .short (1 << 0)|(((9) << 8)); .popsection; 10001: break 1;
         |                                                                                                                                             ^
   In file included from drivers/net/wireless/realtek/rtw88/rtw8822c.c:6:
   In file included from drivers/net/wireless/realtek/rtw88/main.h:2136:
   drivers/net/wireless/realtek/rtw88/hci.h:248:2: error: unexpected token
     248 |         WARN(addr & 0x3, "should be 4-byte aligned, addr = 0x%08x\n", addr);
         |         ^
   include/asm-generic/bug.h:141:3: note: expanded from macro 'WARN'
     141 |                 __WARN_printf(TAINT_WARN, format);                      \
         |                 ^
   include/asm-generic/bug.h:113:3: note: expanded from macro '__WARN_printf'
     113 |                 __WARN_FLAGS("", BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint));\
         |                 ^
   arch/loongarch/include/asm/bug.h:47:2: note: expanded from macro '__WARN_FLAGS'
      47 |         __BUG_FLAGS(cond_str, BUGFLAG_WARNING|(flags), ANNOTATE_REACHABLE(10001b));\
         |         ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/stringify.h:10:27: note: expanded from macro '__stringify'
      10 | #define __stringify(x...)       __stringify_1(x)
         |                                 ^
   include/linux/stringify.h:9:29: note: expanded from macro '__stringify_1'
       9 | #define __stringify_1(x...)     #x
         |                                 ^
   <scratch space>:18:1: note: expanded from here
      18 | ".pushsection __bug_table, \"aw\"; .align 2; 10000: .long 10001f - .; .pushsection .rodata.str, \"aMS\", @progbits, 1; 10002: .string \"\" \"drivers/net/wireless/realtek/rtw88/hci.h\"; .popsection; .long 10002b - .; .short 248; .short (1 << 0)|((1 << 3) | ((9) << 8)); .popsection; 10001: break 1;"
         | ^
   <inline asm>:1:134: note: instantiated into assembly here
       1 |         .pushsection __bug_table, "aw"; .align 2; 10000: .long 10001f - .; .pushsection .rodata.str, "aMS", @progbits, 1; 10002: .string "" "drivers/net/wireless/realtek/rtw88/hci.h"; .popsection; .long 10002b - .; .short 248; .short (1 << 0)|((1 << 3) | ((9) << 8)); .popsection; 10001: break 1;
         |                                                                                                                                             ^
   In file included from drivers/net/wireless/realtek/rtw88/rtw8822c.c:6:
   In file included from drivers/net/wireless/realtek/rtw88/main.h:2136:
   drivers/net/wireless/realtek/rtw88/hci.h:248:2: error: unexpected token
     248 |         WARN(addr & 0x3, "should be 4-byte aligned, addr = 0x%08x\n", addr);
         |         ^
   include/asm-generic/bug.h:141:3: note: expanded from macro 'WARN'
     141 |                 __WARN_printf(TAINT_WARN, format);                      \
         |                 ^
   include/asm-generic/bug.h:113:3: note: expanded from macro '__WARN_printf'
     113 |                 __WARN_FLAGS("", BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint));\
         |                 ^
   arch/loongarch/include/asm/bug.h:47:2: note: expanded from macro '__WARN_FLAGS'
      47 |         __BUG_FLAGS(cond_str, BUGFLAG_WARNING|(flags), ANNOTATE_REACHABLE(10001b));\
         |         ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/stringify.h:10:27: note: expanded from macro '__stringify'
      10 | #define __stringify(x...)       __stringify_1(x)
         |                                 ^
   include/linux/stringify.h:9:29: note: expanded from macro '__stringify_1'
       9 | #define __stringify_1(x...)     #x
         |                                 ^
   <scratch space>:18:1: note: expanded from here
      18 | ".pushsection __bug_table, \"aw\"; .align 2; 10000: .long 10001f - .; .pushsection .rodata.str, \"aMS\", @progbits, 1; 10002: .string \"\" \"drivers/net/wireless/realtek/rtw88/hci.h\"; .popsection; .long 10002b - .; .short 248; .short (1 << 0)|((1 << 3) | ((9) << 8)); .popsection; 10001: break 1;"
         | ^
   <inline asm>:1:134: note: instantiated into assembly here
       1 |         .pushsection __bug_table, "aw"; .align 2; 10000: .long 10001f - .; .pushsection .rodata.str, "aMS", @progbits, 1; 10002: .string "" "drivers/net/wireless/realtek/rtw88/hci.h"; .popsection; .long 10002b - .; .short 248; .short (1 << 0)|((1 << 3) | ((9) << 8)); .popsection; 10001: break 1;
         |                                                                                                                                             ^
   In file included from drivers/net/wireless/realtek/rtw88/rtw8822c.c:6:
   In file included from drivers/net/wireless/realtek/rtw88/main.h:2136:
   drivers/net/wireless/realtek/rtw88/hci.h:197:2: error: unexpected token
     197 |         lockdep_assert_held(&rtwdev->mutex);
         |         ^
   include/linux/lockdep.h:285:2: note: expanded from macro 'lockdep_assert_held'
     285 |         lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
         |         ^
   include/linux/lockdep.h:279:7: note: expanded from macro 'lockdep_assert'
     279 |         do { WARN_ON(debug_locks && !(cond)); } while (0)
         |              ^
   include/asm-generic/bug.h:132:3: note: expanded from macro 'WARN_ON'
     132 |                 __WARN();                                               \
         |                 ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/stringify.h:10:27: note: expanded from macro '__stringify'
      10 | #define __stringify(x...)       __stringify_1(x)
         |                                 ^
   include/linux/stringify.h:9:29: note: expanded from macro '__stringify_1'
       9 | #define __stringify_1(x...)     #x
         |                                 ^
   <scratch space>:15:1: note: expanded from here


vim +4364 drivers/net/wireless/realtek/rtw88/rtw8822c.c

479c4ee931a677c Tzu-En Huang 2019-09-09  4353  
479c4ee931a677c Tzu-En Huang 2019-09-09  4354  #define RTW_CCK_PD_MAX 255
479c4ee931a677c Tzu-En Huang 2019-09-09  4355  #define RTW_CCK_CS_MAX 31
479c4ee931a677c Tzu-En Huang 2019-09-09  4356  #define RTW_CCK_CS_ERR1 27
479c4ee931a677c Tzu-En Huang 2019-09-09  4357  #define RTW_CCK_CS_ERR2 29
479c4ee931a677c Tzu-En Huang 2019-09-09  4358  static void
479c4ee931a677c Tzu-En Huang 2019-09-09  4359  rtw8822c_phy_cck_pd_set_reg(struct rtw_dev *rtwdev,
479c4ee931a677c Tzu-En Huang 2019-09-09  4360  			    s8 pd_diff, s8 cs_diff, u8 bw, u8 nrx)
479c4ee931a677c Tzu-En Huang 2019-09-09  4361  {
479c4ee931a677c Tzu-En Huang 2019-09-09  4362  	u32 pd, cs;
479c4ee931a677c Tzu-En Huang 2019-09-09  4363  
479c4ee931a677c Tzu-En Huang 2019-09-09 @4364  	if (WARN_ON(bw > RTW_CHANNEL_WIDTH_40 || nrx >= RTW_RF_PATH_MAX))
479c4ee931a677c Tzu-En Huang 2019-09-09  4365  		return;
479c4ee931a677c Tzu-En Huang 2019-09-09  4366  
479c4ee931a677c Tzu-En Huang 2019-09-09  4367  	pd = rtw_read32_mask(rtwdev,
479c4ee931a677c Tzu-En Huang 2019-09-09  4368  			     rtw8822c_cck_pd_reg[bw][nrx].reg_pd,
479c4ee931a677c Tzu-En Huang 2019-09-09  4369  			     rtw8822c_cck_pd_reg[bw][nrx].mask_pd);
479c4ee931a677c Tzu-En Huang 2019-09-09  4370  	cs = rtw_read32_mask(rtwdev,
479c4ee931a677c Tzu-En Huang 2019-09-09  4371  			     rtw8822c_cck_pd_reg[bw][nrx].reg_cs,
479c4ee931a677c Tzu-En Huang 2019-09-09  4372  			     rtw8822c_cck_pd_reg[bw][nrx].mask_cs);
479c4ee931a677c Tzu-En Huang 2019-09-09  4373  	pd += pd_diff;
479c4ee931a677c Tzu-En Huang 2019-09-09  4374  	cs += cs_diff;
479c4ee931a677c Tzu-En Huang 2019-09-09  4375  	if (pd > RTW_CCK_PD_MAX)
479c4ee931a677c Tzu-En Huang 2019-09-09  4376  		pd = RTW_CCK_PD_MAX;
479c4ee931a677c Tzu-En Huang 2019-09-09  4377  	if (cs == RTW_CCK_CS_ERR1 || cs == RTW_CCK_CS_ERR2)
479c4ee931a677c Tzu-En Huang 2019-09-09  4378  		cs++;
479c4ee931a677c Tzu-En Huang 2019-09-09  4379  	else if (cs > RTW_CCK_CS_MAX)
479c4ee931a677c Tzu-En Huang 2019-09-09  4380  		cs = RTW_CCK_CS_MAX;
479c4ee931a677c Tzu-En Huang 2019-09-09  4381  	rtw_write32_mask(rtwdev,
479c4ee931a677c Tzu-En Huang 2019-09-09  4382  			 rtw8822c_cck_pd_reg[bw][nrx].reg_pd,
479c4ee931a677c Tzu-En Huang 2019-09-09  4383  			 rtw8822c_cck_pd_reg[bw][nrx].mask_pd,
479c4ee931a677c Tzu-En Huang 2019-09-09  4384  			 pd);
479c4ee931a677c Tzu-En Huang 2019-09-09  4385  	rtw_write32_mask(rtwdev,
479c4ee931a677c Tzu-En Huang 2019-09-09  4386  			 rtw8822c_cck_pd_reg[bw][nrx].reg_cs,
479c4ee931a677c Tzu-En Huang 2019-09-09  4387  			 rtw8822c_cck_pd_reg[bw][nrx].mask_cs,
479c4ee931a677c Tzu-En Huang 2019-09-09  4388  			 cs);
760bb2abfef252a Ping-Ke Shih 2020-11-09  4389  
760bb2abfef252a Ping-Ke Shih 2020-11-09  4390  	rtw_dbg(rtwdev, RTW_DBG_PHY,
760bb2abfef252a Ping-Ke Shih 2020-11-09  4391  		"is_linked=%d, bw=%d, nrx=%d, cs_ratio=0x%x, pd_th=0x%x\n",
760bb2abfef252a Ping-Ke Shih 2020-11-09  4392  		rtw_is_assoc(rtwdev), bw, nrx, cs, pd);
479c4ee931a677c Tzu-En Huang 2019-09-09  4393  }
479c4ee931a677c Tzu-En Huang 2019-09-09  4394  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

