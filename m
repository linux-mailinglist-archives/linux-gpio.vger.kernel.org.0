Return-Path: <linux-gpio+bounces-16251-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF185A3CEFC
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 03:07:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF68B189A0CF
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 02:07:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39DCB1CEAC3;
	Thu, 20 Feb 2025 02:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TT+FQHpi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3264E156885
	for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2025 02:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740017233; cv=none; b=iVEzHMNGrlmAbNebTv2Nf/qqMMx5iBW27uOX2wvFBTgnQD2RPkJq+RPP3puSCyV2qJ67lBf5Ytr3+vPiitsxB0fmtAbzPyEs/UpP1rYs1De7Bd1KnSM7+70Bp0kWeHBXttnKZWz7wdojUlKeSz1fpGV0vLe3g3r6YGBs5c+OwPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740017233; c=relaxed/simple;
	bh=sUxJyyGQTD649mYZdhH5BNtLW0oF8BWCYDuCafHJEzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AZKDSoz1X2ycN2YQ7S3GuXFdmjcfLb/IvaEy3Cg+0q/RqoXsqNv6SRtxMHScIJ6VfoPU2+0rKaMNdkjL55rpe+/Cpv6oDx31Qx1Mwe8zsc9B09PSSqz2X98QDNJIFS+Uu3lwHzNoGGQZoDmTXRyhLFu8QvDcwk7pCNigNY1xhOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TT+FQHpi; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740017231; x=1771553231;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sUxJyyGQTD649mYZdhH5BNtLW0oF8BWCYDuCafHJEzM=;
  b=TT+FQHpiC15BlIre+pLhHYqld1e8vHMRBBTr0bbS9YEhNny6AwkYAXH/
   pqOiBB0NucGQc06DM8vqTfa0yKNtKtY0ntske6j5V7x+9VCDDrE97uOJW
   qqOYZubEJ6ut2v9NRS5fVgw16+mYB+aFDKa+tAtE0AA2DwA/p5AivUbDo
   qdqWPevo7Dz8S4cKOJtZ3hbfaloZaRZzcRRHS6Eq8aAc6dprRA+iaB8i7
   YGS5biASwEnwRjyoNB5fHXIgoj4ekII1Ib6B3BFUhbJg/VC0Hp0ea8HIK
   5OdwD6NJHE1O92KtBqMVZARwwzWgM3KLWWcxb5qbCAbDRO0p9h/4deL/T
   g==;
X-CSE-ConnectionGUID: kK/Py5NeQuCroW8hKOcnHg==
X-CSE-MsgGUID: dhnZ+paFSaKW+gju8Hf+/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="44698828"
X-IronPort-AV: E=Sophos;i="6.13,300,1732608000"; 
   d="scan'208";a="44698828"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 18:07:10 -0800
X-CSE-ConnectionGUID: qLvVhYURSvmHQ/+seutbcw==
X-CSE-MsgGUID: ufW7Ilw2Rtyj/EPQGb8Qjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,300,1732608000"; 
   d="scan'208";a="119521566"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 19 Feb 2025 18:07:08 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkvxx-0003kx-36;
	Thu, 20 Feb 2025 02:07:05 +0000
Date: Thu, 20 Feb 2025 10:06:17 +0800
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <superm1@kernel.org>, mario.limonciello@amd.com,
	Basavaraj.Natikar@amd.com, Shyam-sundar.S-k@amd.com,
	linus.walleij@linaro.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] pinctrl: amd: Add an LPS0 check() callback
Message-ID: <202502200938.Vy5sx0uN-lkp@intel.com>
References: <20250218024702.2139216-1-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218024702.2139216-1-superm1@kernel.org>

Hi Mario,

kernel test robot noticed the following build errors:

[auto build test ERROR on linusw-pinctrl/devel]
[also build test ERROR on linusw-pinctrl/for-next linus/master v6.14-rc3 next-20250219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mario-Limonciello/pinctrl-amd-Add-an-LPS0-check-callback/20250218-104906
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20250218024702.2139216-1-superm1%40kernel.org
patch subject: [PATCH] pinctrl: amd: Add an LPS0 check() callback
config: x86_64-buildonly-randconfig-004-20250219 (https://download.01.org/0day-ci/archive/20250220/202502200938.Vy5sx0uN-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250220/202502200938.Vy5sx0uN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502200938.Vy5sx0uN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pinctrl/pinctrl-amd.c:933:35: error: variable has incomplete type 'struct acpi_s2idle_dev_ops'
     933 | static struct acpi_s2idle_dev_ops pinctrl_amd_s2idle_dev_ops = {
         |                                   ^
   drivers/pinctrl/pinctrl-amd.c:933:15: note: forward declaration of 'struct acpi_s2idle_dev_ops'
     933 | static struct acpi_s2idle_dev_ops pinctrl_amd_s2idle_dev_ops = {
         |               ^
>> drivers/pinctrl/pinctrl-amd.c:1211:8: error: call to undeclared function 'acpi_register_lps0_dev'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1211 |         ret = acpi_register_lps0_dev(&pinctrl_amd_s2idle_dev_ops);
         |               ^
>> drivers/pinctrl/pinctrl-amd.c:1232:2: error: call to undeclared function 'acpi_unregister_lps0_dev'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1232 |         acpi_unregister_lps0_dev(&pinctrl_amd_s2idle_dev_ops);
         |         ^
   3 errors generated.


vim +933 drivers/pinctrl/pinctrl-amd.c

   932	
 > 933	static struct acpi_s2idle_dev_ops pinctrl_amd_s2idle_dev_ops = {
   934		.check = amd_gpio_check_pending,
   935	};
   936	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

