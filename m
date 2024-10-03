Return-Path: <linux-gpio+bounces-10761-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9627198E7EF
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 02:49:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 32E9BB23FE8
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 00:49:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 959DFBE46;
	Thu,  3 Oct 2024 00:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PA/5ivBN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1F015E86
	for <linux-gpio@vger.kernel.org>; Thu,  3 Oct 2024 00:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727916554; cv=none; b=jmOdwagIb1NQWRPkjTnryvfvh9au8z6DyvV+kDCfgF7eZbpLtCMMS4XsvxTSgUOFitRU+/DJmiybpTru+roLdepriX8MG3ySEQBAHfP2GjljT739fEc05gaj3ibGCOiekFFTI82CM172NQh9F92EHjZ7ZU+RKl8c13/m6mnMm20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727916554; c=relaxed/simple;
	bh=Ss1or0kCoS8rWoRZAAwQ7Mkz2zHi0iOk0riXYF+O4JM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ElCVAW0ZRMcBI+6GlGGFLkvQFUB1yD3PFFMIYcfzOafZJeZBYGH79SWmqPqiFGmqIW3IEkWoLiWQLJ2h+zw15TTNoY/yyIJJp8v/mUxTrj0rP+jlEIQFpo6hM/5zZoe6i6hX4GpX9J/GNgObDZZ7o3WiXH4dE5PLFLCKL565eJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PA/5ivBN; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727916553; x=1759452553;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ss1or0kCoS8rWoRZAAwQ7Mkz2zHi0iOk0riXYF+O4JM=;
  b=PA/5ivBNLH+MfruydMSrFCcpSjQStsUTvrO0Y4XSs5/bNXIPhtvk2DMP
   ci8fICbP1mohILuJZSGXIEbFdi80VcI6pJUm+wTSi0ZebQSDOk/VUTFNh
   87WgFu7BbekSATVld1MWX/2v5kqLOrxZB/wtbg2xda5GdFiiCLlvEJ7nO
   FudcRVywt75tZ9WiuUFegkaQAxYTLZ9ZFlFznHHZUyFIVEK9/pY7mPHw4
   HZM5F1YKZBbUC42ShTM1ic2Whr9k8JGNx3xubiQqdNYX+GFq1o4tz2ZN4
   AC0t1zbYOoU0BbNO0e7KW/PAghDXnRSV8lIOeYQoZplFWzUbXUG74iTT7
   w==;
X-CSE-ConnectionGUID: pSHl7rW2QoC43k7ra9Lj8w==
X-CSE-MsgGUID: LNKlepbKSaucQP06KozlEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="30896018"
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; 
   d="scan'208";a="30896018"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 17:49:12 -0700
X-CSE-ConnectionGUID: Cr2gGiEdQ7epTfLxD1iVmw==
X-CSE-MsgGUID: MR3UXBoZQ4KcM6InBvYA8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; 
   d="scan'208";a="74605866"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 02 Oct 2024 17:49:01 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swA1M-000Ukp-22;
	Thu, 03 Oct 2024 00:48:44 +0000
Date: Thu, 3 Oct 2024 08:47:51 +0800
From: kernel test robot <lkp@intel.com>
To: Esben Haabendal <esben@geanix.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [linusw-pinctrl:devel 8/23] kismet: WARNING: unmet direct
 dependencies detected for PINCTRL_IMX_SCU when selected by PINCTRL_IMX8DXL
Message-ID: <202410030852.q0Hukplf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
head:   06783dc52057045edd9cfcdd8f90899d04bc8678
commit: a55222b7a1327fabad71e1e61661077ab66bb98d [8/23] pinctrl: freescale: enable use with COMPILE_TEST
config: x86_64-kismet-CONFIG_PINCTRL_IMX_SCU-CONFIG_PINCTRL_IMX8DXL-0-0 (https://download.01.org/0day-ci/archive/20241003/202410030852.q0Hukplf-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241003/202410030852.q0Hukplf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410030852.q0Hukplf-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PINCTRL_IMX_SCU when selected by PINCTRL_IMX8DXL
   WARNING: unmet direct dependencies detected for PINCTRL_IMX_SCU
     Depends on [n]: PINCTRL [=y] && IMX_SCU [=n]
     Selected by [y]:
     - PINCTRL_IMX8DXL [=y] && PINCTRL [=y] && OF [=y] && (IMX_SCU [=n] && ARCH_MXC && ARM64 || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

