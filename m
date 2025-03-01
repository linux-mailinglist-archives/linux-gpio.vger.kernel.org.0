Return-Path: <linux-gpio+bounces-16872-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CA3A4AE23
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Mar 2025 23:40:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E5F0C1892B24
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Mar 2025 22:40:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 353541DED79;
	Sat,  1 Mar 2025 22:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P4yaNff9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AFD51C3BF9
	for <linux-gpio@vger.kernel.org>; Sat,  1 Mar 2025 22:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740868810; cv=none; b=bB6MDJEqC7A5BqPtEsiMEvWeSmfX/dshfdDJ1SRcdtEleXaDQKMzxd1KVo4/dOvmGKnTgrf65xfmLE6zz6a4z0WnPUAskoCoYdok89R17fjwOXFCMZi588qE0+lb+9tIs2OX9hJvhXpk0dgjAs6G2ACs0xKoXolEc7gnQul8LLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740868810; c=relaxed/simple;
	bh=y0F8MI/v8YlG9W2t12I2GwuvK0EPiEmfFG5Th2Yxkc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xg6/6Qon2FM9iE/ythYTLbwmv8ZuJ1KTKeosRS4nhJlkDBnNipGKn0w8smNzha9FKm0DdwQnTwm13aaP/K2SSMLoKGXCjui0Dqw8b5TtfytKRBYU3iyr+zE45c4Ds4fOJdnpCLU6DO83gwfdim7MpeaTbpk2IzP0sMpKHAttAMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P4yaNff9; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740868807; x=1772404807;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=y0F8MI/v8YlG9W2t12I2GwuvK0EPiEmfFG5Th2Yxkc8=;
  b=P4yaNff9O05mrKFyqc9gr51hCV8ZwK/NWh3riLfPwL34pWGFtK8XTe/W
   PTlh86xNBqNvTqP03kZ29RwJGkhpalC94JfKO776by7JlbBMFrLAdwQ5X
   J+t4DwNKIKyndl1igNG04PU5+fySCRFu9IdoUOhkVUg36mpUcb0R+oOK2
   6nOLp4ixL3wFYVUpUHMWaF5nXFXx6ZaK2bUD6TC/75FlwikcNrGZYRr09
   96Mg03zHihDBJgl7+w6/bn5d7okfRGYI8l9dfIzEX+Iy8YoarnPo2hnKq
   GTXs9cD1rEPMmrq9zLMXDCt5MfCuQyGHeM2BXGawRzBD/GlZTxc5ek0n9
   Q==;
X-CSE-ConnectionGUID: AuJeRFh8Tna4wwRBOByiZg==
X-CSE-MsgGUID: YrPYnItnSQub6aMrmnipRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="51975891"
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="51975891"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 14:40:06 -0800
X-CSE-ConnectionGUID: GK7pxahfSKW7YLVUgunXMA==
X-CSE-MsgGUID: Opy6ub6oRVOWyEmF7f9nHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="148567097"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 01 Mar 2025 14:40:04 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toVV4-000Gmw-17;
	Sat, 01 Mar 2025 22:40:02 +0000
Date: Sun, 2 Mar 2025 06:39:03 +0800
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <superm1@kernel.org>, mario.limonciello@amd.com,
	Basavaraj.Natikar@amd.com, Shyam-sundar.S-k@amd.com,
	linus.walleij@linaro.org
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 2/2] pinctrl: amd: Add an LPS0 check() callback
Message-ID: <202503020616.j6juZTqH-lkp@intel.com>
References: <20250227205049.765309-3-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227205049.765309-3-superm1@kernel.org>

Hi Mario,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linusw-pinctrl/devel]
[also build test WARNING on linusw-pinctrl/for-next rafael-pm/linux-next rafael-pm/bleeding-edge linus/master v6.14-rc4 next-20250228]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mario-Limonciello/ACPI-Add-missing-prototype-for-non-CONFIG_SUSPEND-CONFIG_X86-case/20250228-045242
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20250227205049.765309-3-superm1%40kernel.org
patch subject: [PATCH v3 2/2] pinctrl: amd: Add an LPS0 check() callback
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20250302/202503020616.j6juZTqH-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250302/202503020616.j6juZTqH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503020616.j6juZTqH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pinctrl/pinctrl-amd.c:933:15: error: variable 'pinctrl_amd_s2idle_dev_ops' has initializer but incomplete type
     933 | static struct acpi_s2idle_dev_ops pinctrl_amd_s2idle_dev_ops = {
         |               ^~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-amd.c:934:10: error: 'struct acpi_s2idle_dev_ops' has no member named 'check'
     934 |         .check = amd_gpio_check_pending,
         |          ^~~~~
>> drivers/pinctrl/pinctrl-amd.c:934:18: warning: excess elements in struct initializer
     934 |         .check = amd_gpio_check_pending,
         |                  ^~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-amd.c:934:18: note: (near initialization for 'pinctrl_amd_s2idle_dev_ops')
   drivers/pinctrl/pinctrl-amd.c: In function 'amd_gpio_probe':
   drivers/pinctrl/pinctrl-amd.c:1210:9: error: implicit declaration of function 'acpi_register_lps0_dev' [-Wimplicit-function-declaration]
    1210 |         acpi_register_lps0_dev(&pinctrl_amd_s2idle_dev_ops);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-amd.c: In function 'amd_gpio_remove':
   drivers/pinctrl/pinctrl-amd.c:1229:9: error: implicit declaration of function 'acpi_unregister_lps0_dev' [-Wimplicit-function-declaration]
    1229 |         acpi_unregister_lps0_dev(&pinctrl_amd_s2idle_dev_ops);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-amd.c: At top level:
   drivers/pinctrl/pinctrl-amd.c:933:35: error: storage size of 'pinctrl_amd_s2idle_dev_ops' isn't known
     933 | static struct acpi_s2idle_dev_ops pinctrl_amd_s2idle_dev_ops = {
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +934 drivers/pinctrl/pinctrl-amd.c

   932	
   933	static struct acpi_s2idle_dev_ops pinctrl_amd_s2idle_dev_ops = {
 > 934		.check = amd_gpio_check_pending,
   935	};
   936	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

