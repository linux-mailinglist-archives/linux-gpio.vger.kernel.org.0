Return-Path: <linux-gpio+bounces-27530-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A425C01224
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 14:29:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1EE44543FE0
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 12:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1BD030EF84;
	Thu, 23 Oct 2025 12:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XwyNGdj1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200483009C1
	for <linux-gpio@vger.kernel.org>; Thu, 23 Oct 2025 12:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761222461; cv=none; b=MVFW6eRbQ65y6tNH44L3X2k0hiilftUnmli0sXYcYq5UVAXtbzw+mC3Q5BcdVMo02USTh+Ttkj0PfY75zovFjBRZYl3R1QPsAbXea13SO8ZOZvN76R/OOqWMR81KiMXJaB8jNH5RbAHv1WJYp+ZIUfxPq96qSX1dJfoOy+rUWRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761222461; c=relaxed/simple;
	bh=ObNHrIX28wo1bGKUr3dtuwFtHur4dA6nLToeSsDfBA8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LKnIKxv+bxlIX8SyZEjxxsFqUpfPeqRHDiNO4DNG1yeZLcmSjEKPXbH3W2Kxq+aivC7Z+TraQjIyRoZnt83qknZ5g8dT777N+FY59QGwoVlad0UltGJTcU0q9pyVYIEp4RHFP63q8Xi7HY3OWimN4W3/77a8WiSPPGCMj4NtMws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XwyNGdj1; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761222460; x=1792758460;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ObNHrIX28wo1bGKUr3dtuwFtHur4dA6nLToeSsDfBA8=;
  b=XwyNGdj1VoqzTav77ubE1d0jMI/9lsYA31mvPaLqAMBUjZlHZFOpV4xP
   Dw7MhCHFIX1EaSlfIEME/DxbUbKjYCDQx9GfYGesYDuAvK+4AZrUnAHLT
   7EnSWgLnlujkF/1rxq/RTSrWUor2ALoFsnDw859gGMPdCXMhTxMTe4FTW
   auEMs0Aon5TqA1JoaztB/5DVpQ/K9qt40vfgn8KXrk6qdD+bZf9MzE6oh
   g1LgxFCp65JM2AMKvK6fvK6ErIQ7TXjF07BRjk0unJH+K4O/TDwNLHHHE
   eVvY08yEgmg/fQBanO3eM5j0zqlclrvTnE5CRX7Ve5fe1LqotxG8+FZWl
   w==;
X-CSE-ConnectionGUID: s3G0HnqBQDiYMcEEC1F3Vg==
X-CSE-MsgGUID: CI6vu2clTLasJws+1gYj7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63537390"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="63537390"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 05:27:39 -0700
X-CSE-ConnectionGUID: AM/KTNvrTlWCaQXqNUTSzQ==
X-CSE-MsgGUID: S81wb57FSeW6vgFaPgIsQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="214802729"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 23 Oct 2025 05:27:39 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBuPo-000DUH-01;
	Thu, 23 Oct 2025 12:27:36 +0000
Date: Thu, 23 Oct 2025 20:27:01 +0800
From: kernel test robot <lkp@intel.com>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [brgl:gpio/for-current 6/6] drivers/gpio/gpio-ljca.c:289:9: warning:
 unused variable 'irq'
Message-ID: <202510232205.La2t2fR7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
head:   7d168362aedeca451ac22724f90040296dccca14
commit: 7d168362aedeca451ac22724f90040296dccca14 [6/6] gpio: ljca: Fix duplicated IRQ mapping
config: x86_64-buildonly-randconfig-005-20251023 (https://download.01.org/0day-ci/archive/20251023/202510232205.La2t2fR7-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510232205.La2t2fR7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510232205.La2t2fR7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpio/gpio-ljca.c:289:9: warning: unused variable 'irq' [-Wunused-variable]
     289 |         int i, irq;
         |                ^~~
   1 warning generated.


vim +/irq +289 drivers/gpio/gpio-ljca.c

c5a4b6fd31e8cb Ye Xiang      2023-02-25  283  
1034cc423f1b4a Wentong Wu    2023-10-09  284  static void ljca_gpio_event_cb(void *context, u8 cmd, const void *evt_data,
1034cc423f1b4a Wentong Wu    2023-10-09  285  			       int len)
c5a4b6fd31e8cb Ye Xiang      2023-02-25  286  {
1034cc423f1b4a Wentong Wu    2023-10-09  287  	const struct ljca_gpio_packet *packet = evt_data;
c5a4b6fd31e8cb Ye Xiang      2023-02-25  288  	struct ljca_gpio_dev *ljca_gpio = context;
1034cc423f1b4a Wentong Wu    2023-10-09 @289  	int i, irq;
c5a4b6fd31e8cb Ye Xiang      2023-02-25  290  
c5a4b6fd31e8cb Ye Xiang      2023-02-25  291  	if (cmd != LJCA_GPIO_INT_EVENT)
c5a4b6fd31e8cb Ye Xiang      2023-02-25  292  		return;
c5a4b6fd31e8cb Ye Xiang      2023-02-25  293  
c5a4b6fd31e8cb Ye Xiang      2023-02-25  294  	for (i = 0; i < packet->num; i++) {
7d168362aedeca Haotian Zhang 2025-10-23  295  		generic_handle_domain_irq(ljca_gpio->gc.irq.domain,
1034cc423f1b4a Wentong Wu    2023-10-09  296  					packet->item[i].index);
c5a4b6fd31e8cb Ye Xiang      2023-02-25  297  		set_bit(packet->item[i].index, ljca_gpio->reenable_irqs);
c5a4b6fd31e8cb Ye Xiang      2023-02-25  298  	}
c5a4b6fd31e8cb Ye Xiang      2023-02-25  299  
c5a4b6fd31e8cb Ye Xiang      2023-02-25  300  	schedule_work(&ljca_gpio->work);
c5a4b6fd31e8cb Ye Xiang      2023-02-25  301  }
c5a4b6fd31e8cb Ye Xiang      2023-02-25  302  

:::::: The code at line 289 was first introduced by commit
:::::: 1034cc423f1b4a7a9a56d310ca980fcd2753e11d gpio: update Intel LJCA USB GPIO driver

:::::: TO: Wentong Wu <wentong.wu@intel.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

