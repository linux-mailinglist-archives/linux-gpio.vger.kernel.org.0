Return-Path: <linux-gpio+bounces-16880-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E12DEA4B03E
	for <lists+linux-gpio@lfdr.de>; Sun,  2 Mar 2025 08:24:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7AD9D7AF8DB
	for <lists+linux-gpio@lfdr.de>; Sun,  2 Mar 2025 07:21:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B47E1E51F3;
	Sun,  2 Mar 2025 07:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VM0/zCTm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF521E51F2
	for <linux-gpio@vger.kernel.org>; Sun,  2 Mar 2025 07:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740899913; cv=none; b=pBhMPDxCPLfkOO6YPx8ezsbpM/EQfVPGIQC8wfwTSQZNQoI73kO6vVwaw39KisSLrEusT/+NHkI83C3KN6gE9qmfsqnzekgjcxIXAlvttkvea4zvbq9VsBui4D4EvMmcgqS+tquySDaGZN2dZTb35tbndnJeP8kakQbfVzF3KiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740899913; c=relaxed/simple;
	bh=L+vDpjXvQclL3CYsmA4255gksPu8SdNEWNsgFuTfsqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UHfo1xOKEiYbgyxWLUhZykjCcD4NaUoBKZhAmgEyfuCt2rxTeiBXh3h1V9Duzq82xmeNNV4m9n6CIz2rMmON1fGn3WM7KkrCSGF8ZQvN8KPV42Qfo0HxhKmL0lwBHjqm+idwPgP254jjWHiV+hd8rJNEoFIcsq3Sj0lrKWXvbOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VM0/zCTm; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740899912; x=1772435912;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L+vDpjXvQclL3CYsmA4255gksPu8SdNEWNsgFuTfsqc=;
  b=VM0/zCTmHX0+vpuodeNYe7yDkgPIcLpv+vrmAuBRO2S9Ceko2YvHw/se
   UYyNDtbEz1apRCkLIe5HxuMVJJ321ERIQIuiAEqKxEzH87qAnvG+ouJhS
   CO0u69V55NlYurBjHiLO12mWQXZxuIMMb04yuFHuy6Xq+WFVZlRwMRWrm
   hUm+yhPVCex9hnvPrFNoGDdL6m1r9ybd+ram0EGCx5wc5dyG/arZGps5j
   qk8nk6hHCT+yYn1hIpPhAHynKiGJKjN1h+mMK+haxOHY2NeKQknTybSJk
   i2pKUzxibT79Oqf6+IV1xgNHNYkf0a/1uMoMFPNtDcvTWK29Y1Gi2o/9T
   A==;
X-CSE-ConnectionGUID: O5vFvFYYSE2aOkK90gc5pQ==
X-CSE-MsgGUID: bB7f/cISSHqr122v+v6VTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="40963347"
X-IronPort-AV: E=Sophos;i="6.13,327,1732608000"; 
   d="scan'208";a="40963347"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 23:18:31 -0800
X-CSE-ConnectionGUID: J8hgU2qxTL2jBD4aJTlhig==
X-CSE-MsgGUID: gA/VuyIwTXSrzub3af0WDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="122957653"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 01 Mar 2025 23:18:29 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1todak-000H9q-1f;
	Sun, 02 Mar 2025 07:18:26 +0000
Date: Sun, 2 Mar 2025 15:17:55 +0800
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <superm1@kernel.org>, mario.limonciello@amd.com,
	Basavaraj.Natikar@amd.com, Shyam-sundar.S-k@amd.com,
	linus.walleij@linaro.org
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 2/2] pinctrl: amd: Add an LPS0 check() callback
Message-ID: <202503021444.b3oW30XQ-lkp@intel.com>
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

kernel test robot noticed the following build errors:

[auto build test ERROR on linusw-pinctrl/devel]
[also build test ERROR on linusw-pinctrl/for-next rafael-pm/linux-next rafael-pm/bleeding-edge linus/master v6.14-rc4 next-20250228]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mario-Limonciello/ACPI-Add-missing-prototype-for-non-CONFIG_SUSPEND-CONFIG_X86-case/20250228-045242
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20250227205049.765309-3-superm1%40kernel.org
patch subject: [PATCH v3 2/2] pinctrl: amd: Add an LPS0 check() callback
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20250302/202503021444.b3oW30XQ-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250302/202503021444.b3oW30XQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503021444.b3oW30XQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pinctrl/pinctrl-amd.c:933:15: error: variable 'pinctrl_amd_s2idle_dev_ops' has initializer but incomplete type
     933 | static struct acpi_s2idle_dev_ops pinctrl_amd_s2idle_dev_ops = {
         |               ^~~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/pinctrl-amd.c:934:10: error: 'struct acpi_s2idle_dev_ops' has no member named 'check'
     934 |         .check = amd_gpio_check_pending,
         |          ^~~~~
   drivers/pinctrl/pinctrl-amd.c:934:18: warning: excess elements in struct initializer
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
>> drivers/pinctrl/pinctrl-amd.c:933:35: error: storage size of 'pinctrl_amd_s2idle_dev_ops' isn't known
     933 | static struct acpi_s2idle_dev_ops pinctrl_amd_s2idle_dev_ops = {
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/pinctrl_amd_s2idle_dev_ops +933 drivers/pinctrl/pinctrl-amd.c

   932	
 > 933	static struct acpi_s2idle_dev_ops pinctrl_amd_s2idle_dev_ops = {
 > 934		.check = amd_gpio_check_pending,
   935	};
   936	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

