Return-Path: <linux-gpio+bounces-19029-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A43A922DF
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 18:40:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F44619E61D5
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 16:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B346254AF4;
	Thu, 17 Apr 2025 16:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rr105DES"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D09254850;
	Thu, 17 Apr 2025 16:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744908011; cv=none; b=UQlX6RgNjEBLZPk3Fa8QsE9ITfBjnykgFF1dW/pn0QoM+7np+QyKrddky234nC3+T2L1mERnoB23aevlp5oNoa2YJSt8OBG4Jg/Dwo6PgqmQJGhvDOiikcJ1kxZqoEYwFJRS9COVVVoSl4gVvKJs2w/WoSiPl5uvbloAj7x2yho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744908011; c=relaxed/simple;
	bh=HK9dWcEeQyiylAW4hxiD6pm/era2bq2i0I+BKeTiuvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BBryFK6Oeh883MG+QxPL/1+vLdR/yMfVMWzBsFZPNXhTadd9IaA1X8DPRCHqM3PeyjJjDr0HlvJ+WAy3nQQ3de/OT56aIhSM/MKAtuY3e9QfgcDn7jAkTBDd3acKQSyu1zydSOHzNya10+r4CK4SIYP8tE5AGnTJrguYgN+GIFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rr105DES; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744908007; x=1776444007;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HK9dWcEeQyiylAW4hxiD6pm/era2bq2i0I+BKeTiuvU=;
  b=Rr105DESawI/XxHbTgZNxI8MAKg1qYEjNXUTeiUtSPvDhcR0elzzhaZz
   /GYVYMd4ZdP/N5DndTv/xoyYqBydJLScYEKjrTy/fkUHWluGYTovWIt9k
   wD6DAyLxBZGTQ4GMKVd5lQ/145h6Fk9e0VXui391BFZC443ys+8+UtV4x
   6kJgaTzGiXIyIrU4VlynlKA3J8nsskELw1eT+ULICQlKjuxexqgTvH7w6
   ei9iLPQ04daEkxFg1Taeoy1oITAj/bQPbGU+gXeIPoGH2CaZn9sy/f3Ka
   2fg99u/1uY/B37QATMgXyv2cc7ISVfXidTUUJp3GdqHrt1OaEMr5cwqrp
   A==;
X-CSE-ConnectionGUID: lqibRWkITl+Y2l990RI+vA==
X-CSE-MsgGUID: LpmM/M27R/aOsfZLcvQj7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="57501116"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="57501116"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 09:40:06 -0700
X-CSE-ConnectionGUID: 1SP4gisRRQG24N8DK3MwRw==
X-CSE-MsgGUID: BiPzncNrRsq3BqfVeXHhMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="130789569"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 Apr 2025 09:40:03 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5SHQ-0000W7-1g;
	Thu, 17 Apr 2025 16:40:00 +0000
Date: Fri, 18 Apr 2025 00:39:39 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Richard <thomas.richard@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
	DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw,
	Thomas Richard <thomas.richard@bootlin.com>
Subject: Re: [PATCH v3 02/10] pinctrl: core: add
 devm_pinctrl_register_mappings()
Message-ID: <202504180047.vMkMYzD4-lkp@intel.com>
References: <20250416-aaeon-up-board-pinctrl-support-v3-2-f40776bd06ee@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416-aaeon-up-board-pinctrl-support-v3-2-f40776bd06ee@bootlin.com>

Hi Thomas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8a834b0ac9ceb354a6e0b8cf5b363edca8221bdd]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Richard/gpiolib-add-support-to-register-sparse-pin-range/20250416-221852
base:   8a834b0ac9ceb354a6e0b8cf5b363edca8221bdd
patch link:    https://lore.kernel.org/r/20250416-aaeon-up-board-pinctrl-support-v3-2-f40776bd06ee%40bootlin.com
patch subject: [PATCH v3 02/10] pinctrl: core: add devm_pinctrl_register_mappings()
config: i386-buildonly-randconfig-003-20250417 (https://download.01.org/0day-ci/archive/20250418/202504180047.vMkMYzD4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250418/202504180047.vMkMYzD4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504180047.vMkMYzD4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/pinctrl/pinconf-generic.h:16,
                    from drivers/pinctrl/renesas/sh_pfc.h:12,
                    from drivers/pinctrl/renesas/pfc-r8a77965.c:18:
>> include/linux/pinctrl/machine.h:158:50: warning: 'struct device' declared inside parameter list will not be visible outside of this definition or declaration
     158 | extern int devm_pinctrl_register_mappings(struct device *dev,
         |                                                  ^~~~~~


vim +158 include/linux/pinctrl/machine.h

   155	
   156	extern int pinctrl_register_mappings(const struct pinctrl_map *map,
   157					     unsigned int num_maps);
 > 158	extern int devm_pinctrl_register_mappings(struct device *dev,
   159						  const struct pinctrl_map *map,
   160						  unsigned int num_maps);
   161	extern void pinctrl_unregister_mappings(const struct pinctrl_map *map);
   162	extern void pinctrl_provide_dummies(void);
   163	#else
   164	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

