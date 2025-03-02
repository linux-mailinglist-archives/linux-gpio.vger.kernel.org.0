Return-Path: <linux-gpio+bounces-16879-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 701ACA4AF25
	for <lists+linux-gpio@lfdr.de>; Sun,  2 Mar 2025 04:44:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9DDBC7A7F21
	for <lists+linux-gpio@lfdr.de>; Sun,  2 Mar 2025 03:43:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D3CD155C96;
	Sun,  2 Mar 2025 03:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hY8T9ApX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594F62B2D7;
	Sun,  2 Mar 2025 03:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740887061; cv=none; b=kBJc2ue46cRdPwcbP15sxW2vrDXRNpa3yizOlAg5I3+/AoZ7oh4i6WhDOLRz7aUqwc5fEyVN+Cqpq15RdwDdLfVy9xaOaS4qKL8Ex7nnzgYkFnDdzap7kPzckADPereOS+/8czc26E9VvvqhyQhm0sgmLP9qRwrcb6/Cifern1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740887061; c=relaxed/simple;
	bh=m3N4VQ/oe6q2C/cxszgUZu9Og5nAv5g4t/VlK/KxkVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jbq253OW6sWbnrTNQCVLCZjdW3ovSVsKluMcZ0Iw8yFBC452A1ixLUzX7h555eQp9pWfh4vMFGm3vfZNbXMm53SnP8551qctqhTU1jSDtxxhgDyb6Ke8lP0kmotyW/9V1C4768WZ2uzwZSiboxuaxUDgY7ImIppbeMHLD1YbkAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hY8T9ApX; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740887059; x=1772423059;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=m3N4VQ/oe6q2C/cxszgUZu9Og5nAv5g4t/VlK/KxkVI=;
  b=hY8T9ApXGsQafUP6wOMdO2jH29agq74h7F9KcVPAVt0j4/5R3i9uxYKh
   b6xpPsD7/T+SuGcMRYIEIsunMWrVYB8xAzpQx7YGYoHnTCCnMyHnTgnB1
   wtOo/dRUCNDSgcf2aFKay6AbOhidfZ/yrs+m7/qEzFlWNVbFuD1Kj3uD2
   zvnOMzxWwTLxdGnMcTgchdVzY1exp44jx4ftr6Yyh4j35kG5ITPygu7J2
   s6hwk4aOHmjSicxE8iOLCS19dz+TDfZ54G6j8wN6XpsEFtNA1XrVhvkNP
   SrpXgt3ABYA/eTxLwxznQ4OHWe34cQ+qmsVxSqLsVuqhPgI6sPJZSAOmx
   w==;
X-CSE-ConnectionGUID: UBpKiwJKTmipPfzZHeNIZw==
X-CSE-MsgGUID: RqKUJ26KRryq2x2I7Air2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="41905486"
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="41905486"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 19:44:18 -0800
X-CSE-ConnectionGUID: HXhVAiSRSJqyyC01ZRIg1A==
X-CSE-MsgGUID: wEDPsAapQt+6rQTrafEGGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="118371674"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 01 Mar 2025 19:44:14 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toaFA-000H0c-0N;
	Sun, 02 Mar 2025 03:44:03 +0000
Date: Sun, 2 Mar 2025 11:42:56 +0800
From: kernel test robot <lkp@intel.com>
To: Pratap Nirujogi <pratap.nirujogi@amd.com>, linus.walleij@linaro.org
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, benjamin.chan@amd.com,
	Pratap Nirujogi <pratap.nirujogi@amd.com>
Subject: Re: [PATCH] pinctrl: amd: isp411: Add amdisp GPIO pinctrl
Message-ID: <202503021137.LAkq3bMU-lkp@intel.com>
References: <20250228165749.3476210-1-pratap.nirujogi@amd.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228165749.3476210-1-pratap.nirujogi@amd.com>

Hi Pratap,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linusw-pinctrl/devel]
[also build test WARNING on linusw-pinctrl/for-next linus/master v6.14-rc4 next-20250228]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pratap-Nirujogi/pinctrl-amd-isp411-Add-amdisp-GPIO-pinctrl/20250301-011050
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20250228165749.3476210-1-pratap.nirujogi%40amd.com
patch subject: [PATCH] pinctrl: amd: isp411: Add amdisp GPIO pinctrl
config: um-randconfig-r112-20250302 (https://download.01.org/0day-ci/archive/20250302/202503021137.LAkq3bMU-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 14170b16028c087ca154878f5ed93d3089a965c6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250302/202503021137.LAkq3bMU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503021137.LAkq3bMU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pinctrl/pinctrl-amdisp.c:113:26: sparse: sparse: symbol 'amdisp_pinctrl_ops' was not declared. Should it be static?

vim +/amdisp_pinctrl_ops +113 drivers/pinctrl/pinctrl-amdisp.c

   112	
 > 113	const struct pinctrl_ops amdisp_pinctrl_ops = {
   114		.get_groups_count	= amdisp_get_groups_count,
   115		.get_group_name		= amdisp_get_group_name,
   116		.get_group_pins		= amdisp_get_group_pins,
   117	};
   118	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

