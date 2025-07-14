Return-Path: <linux-gpio+bounces-23249-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FDBB049CA
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 23:57:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A30F43B8E8A
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 21:57:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 976CF265CD0;
	Mon, 14 Jul 2025 21:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NxcSBAez"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D286B2367DF
	for <linux-gpio@vger.kernel.org>; Mon, 14 Jul 2025 21:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752530245; cv=none; b=keDXf5SshivAMtfB+VT815xe6UHygOeAIPF3hzGqXCVArWjN4eo88QhclIrXTCd40KrFrEiz+apiuR3hwhLutZereYQ2YOVJcBAnp2Kctyfj7KGwRthL7zwkboJn7/wJSAllZKbuL5+/y/zs2Dvgs41ONSoIuTIY2GctxUwnPMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752530245; c=relaxed/simple;
	bh=sibXfpJqisAOk08oPxjnKGs1rYDnWjX8lMUuy5TF1sM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HD57F11qRy0tK0wQesfIj37IDMDT0ipQ7l3lDyTHhrG55S1QmLqXCGlIDthC6ETo5lzhNksW045ZIzVDAGhqAQWnexrisqE7W50ZvZ5aerAQUW71rgvBA2HyCqp69uAVMTM0Osb9SLRj2wiYMkPCR2KPinIvfc2Y5Ls6buig3pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NxcSBAez; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752530243; x=1784066243;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sibXfpJqisAOk08oPxjnKGs1rYDnWjX8lMUuy5TF1sM=;
  b=NxcSBAezbzVZZ4QeRh0v/E/c8CZvfUMPa08SUzOEQjL+fWGj4CgLAbtJ
   XKMHGKYX7VVvOGRydPGDBNLibaJ0eQJtF5+g1saUFKmPRuyoehHwWdjHc
   GpPGlhLG+6dAuqO1vr/tbMHtWDYpS65yV/i+OIz4pxXe/pEZpAEOifYN2
   EMuC6vlM/+1DdccsqpKLxv2Gk/SLnvopI+cQmFUhmQEkqHe9Uj7sHO8qc
   g8083wZIzmtjTHTn65PFYZWojwivSEocrA3sK/w+kIm9CugeHpywyGRnF
   sFbqNJIGFyENx3cpUK1fvWtu+j2K1A/OgbLBICjlOg+7HZiUIShsrUBmI
   A==;
X-CSE-ConnectionGUID: 17AyKADQRhKe6ZxyECBejQ==
X-CSE-MsgGUID: t7JdSlIQQjyhy1Zxoht/3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="53844475"
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="53844475"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 14:57:23 -0700
X-CSE-ConnectionGUID: IbkmvqnURxmN6WdXhBS2bg==
X-CSE-MsgGUID: FkrJiHkeQBeO0aWxXb9wHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="157388414"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Jul 2025 14:57:22 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubRAm-0009Nf-0d;
	Mon, 14 Jul 2025 21:57:20 +0000
Date: Tue, 15 Jul 2025 05:56:47 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [linusw-pinctrl:devel 14/81] drivers/pinctrl/pinctrl-tb10x.c:815:34:
 warning: 'tb10x_pinctrl_dt_ids' defined but not used
Message-ID: <202507150541.0WfZDWlE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Krzysztof,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
head:   2427d69c3dba3f9bce73d36c2c0adf37b5aee5d9
commit: 1982621decaf788d0611fc291fe89b297b6e5510 [14/81] pinctrl: Allow compile testing for K210, TB10X and ZYNQ
config: x86_64-buildonly-randconfig-006-20250715 (https://download.01.org/0day-ci/archive/20250715/202507150541.0WfZDWlE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250715/202507150541.0WfZDWlE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507150541.0WfZDWlE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/pinctrl-tb10x.c:815:34: warning: 'tb10x_pinctrl_dt_ids' defined but not used [-Wunused-const-variable=]
     815 | static const struct of_device_id tb10x_pinctrl_dt_ids[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~


vim +/tb10x_pinctrl_dt_ids +815 drivers/pinctrl/pinctrl-tb10x.c

5aad0db1c1ebb0f Christian Ruppert 2013-10-15  813  
5aad0db1c1ebb0f Christian Ruppert 2013-10-15  814  
5aad0db1c1ebb0f Christian Ruppert 2013-10-15 @815  static const struct of_device_id tb10x_pinctrl_dt_ids[] = {
5aad0db1c1ebb0f Christian Ruppert 2013-10-15  816  	{ .compatible = "abilis,tb10x-iomux" },
5aad0db1c1ebb0f Christian Ruppert 2013-10-15  817  	{ }
5aad0db1c1ebb0f Christian Ruppert 2013-10-15  818  };
5aad0db1c1ebb0f Christian Ruppert 2013-10-15  819  MODULE_DEVICE_TABLE(of, tb10x_pinctrl_dt_ids);
5aad0db1c1ebb0f Christian Ruppert 2013-10-15  820  

:::::: The code at line 815 was first introduced by commit
:::::: 5aad0db1c1ebb0f5be79f0adbecc16a2f0259b21 pinctrl: add TB10x pin control driver

:::::: TO: Christian Ruppert <christian.ruppert@abilis.com>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

