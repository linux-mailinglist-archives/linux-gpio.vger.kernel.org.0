Return-Path: <linux-gpio+bounces-14923-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E24BEA15832
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 20:34:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42F9D3A3700
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 19:34:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D8CA1AB537;
	Fri, 17 Jan 2025 19:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fMd5poya"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5321AAA0F;
	Fri, 17 Jan 2025 19:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737142471; cv=none; b=rGEoTwF5VLbWe3t6in1PUM9ebDuD3fdn02M51//io2PNkSUxv52PPEwxT3V/GM13oqaP4KUrzQYoXr8cPEQlV8iqXBBahhYViLCnV60aFHHG2MDSPWRroT5M+L0b3tsas5SFX1sVwznr8ExJ1I/pqxL0UPnH7T21PyzuFWCYlFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737142471; c=relaxed/simple;
	bh=n+/OHPmRLN21PihqBJ+hUFaJAnWXHROp8BjPm/D69iM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tDdhn1A1fEfhksxs+TKv7IiAqT6Dobu1QlIFe0wKimeZu2k7WDyXRPQPtJy7sa65hqmDmH5boiMmFt7BzhpJ+U/8OQJncRKH14FysMTeV5JL6WQsGhmYbmsSVpC2x381WSYeAyOD4ZkcZ7DgfgtDuq0CqFAc6hAU67AJN+JaKus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fMd5poya; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737142470; x=1768678470;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n+/OHPmRLN21PihqBJ+hUFaJAnWXHROp8BjPm/D69iM=;
  b=fMd5poyaNIEluWuIiRp48dY6NX0NDsd4x3aLl1+AV5OTr9HxaijGXFUu
   ABaPLTM2vPW+YP/pSHHsvt+G+xiAuDrGU4GhkXLFrAaXzuaYDvNw7jqHn
   z6etx/K6UFms6OLIDIM+ShOAfFHVX12/6CfWMfBpMnZTOxJk/zHTu+qpf
   XlY/23t8O+hfQpmV0yYzKSbvqqVXK8eLzyHdQJUUKtrTPWNG4b8kc6Uov
   Ed4CExTACHpDxRu6Coc5BF2A6uH6dfFPN3JiOzpq+eDs/dU37vfpTS13P
   X9u0UHO/hmX//xSGVx9REvTojM2CDrsp1Al930pyWZoMK9jfZyPhgSQUd
   A==;
X-CSE-ConnectionGUID: R8kYT6sgTQOAw94UedtKjg==
X-CSE-MsgGUID: N2NYKagRT9C9X1cCHza/Mg==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="41353047"
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; 
   d="scan'208";a="41353047"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 11:34:29 -0800
X-CSE-ConnectionGUID: sjWWNsuLSrGGNs6u0AvOFQ==
X-CSE-MsgGUID: CRGtKOHtSMOukZSu7eNUZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106777938"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 17 Jan 2025 11:34:26 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYs6p-000TdT-24;
	Fri, 17 Jan 2025 19:34:23 +0000
Date: Sat, 18 Jan 2025 03:33:45 +0800
From: kernel test robot <lkp@intel.com>
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>, aaro.koskinen@iki.fi,
	andreas@kemnade.info, khilman@baylibre.com, rogerq@kernel.org,
	tony@atomide.com, linus.walleij@linaro.org, brgl@bgdev.pl,
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, m-leonard@ti.com, praneeth@ti.com,
	christophe.jaillet@wanadoo.fr
Subject: Re: [PATCH v3 1/3] gpio: tps65215: Add TPS65215 to
 platform_device_id table
Message-ID: <202501180342.Bi6C2Axf-lkp@intel.com>
References: <20250113225530.124213-2-s-ramamoorthy@ti.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113225530.124213-2-s-ramamoorthy@ti.com>

Hi Shree,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20250113]
[also build test ERROR on linus/master v6.13-rc7]
[cannot apply to tmlind-omap/for-next v6.13-rc7 v6.13-rc6 v6.13-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shree-Ramamoorthy/gpio-tps65215-Add-TPS65215-to-platform_device_id-table/20250114-065813
base:   next-20250113
patch link:    https://lore.kernel.org/r/20250113225530.124213-2-s-ramamoorthy%40ti.com
patch subject: [PATCH v3 1/3] gpio: tps65215: Add TPS65215 to platform_device_id table
config: i386-randconfig-003-20250117 (https://download.01.org/0day-ci/archive/20250118/202501180342.Bi6C2Axf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250118/202501180342.Bi6C2Axf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501180342.Bi6C2Axf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpio/gpio-tps65219.c:173:28: error: 'TPS65215' undeclared here (not in a function); did you mean 'TPS65219'?
     173 |         { "tps65215-gpio", TPS65215 },
         |                            ^~~~~~~~
         |                            TPS65219


vim +173 drivers/gpio/gpio-tps65219.c

   171	
   172	static const struct platform_device_id tps6521x_gpio_id_table[] = {
 > 173		{ "tps65215-gpio", TPS65215 },
   174		{ "tps65219-gpio", TPS65219 },
   175		{ }
   176	};
   177	MODULE_DEVICE_TABLE(platform, tps6521x_gpio_id_table);
   178	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

