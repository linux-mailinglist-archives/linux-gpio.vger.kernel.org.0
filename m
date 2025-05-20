Return-Path: <linux-gpio+bounces-20375-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3D9ABE6CA
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 00:14:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B5BE7A8189
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 22:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E45025EFB7;
	Tue, 20 May 2025 22:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZFuUGzpT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7FB25D1E7
	for <linux-gpio@vger.kernel.org>; Tue, 20 May 2025 22:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747779283; cv=none; b=FOri9647lZN7o9cddfVTs+TQ442B5jwEkgywsaIeXbMTW/aI+47fbvjoCiA4X+045TI+VnTQLzBwUacngURPeFLH7ldYAWiLoUuIwb3AXTPr7IxQBipll+Q2iBR01K5jNt1/41WjKJWf5zk6UiWuKJ+rqM2imQkphYaRjijR2Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747779283; c=relaxed/simple;
	bh=W4zUQprJscuuWi8UlGi5NrBlSLnYMsLvTG0MhfHU4Q4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ARod4Jrdb+qtHCwcajAVuxXazBchnnS1JhCitI6cySXsAg9CBmTy/7EfHTmBzhCg6lGb3w6YiSodfaA3P1TdruCT4IrT3LhN6qjgx2lV7zp14AOEgUZnv8LkEDdUaCpVC5SY0kLeLL/JUQMxJWItC3T1X96D/J29ak9DTbERSV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZFuUGzpT; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747779282; x=1779315282;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W4zUQprJscuuWi8UlGi5NrBlSLnYMsLvTG0MhfHU4Q4=;
  b=ZFuUGzpTnmWo2oYxCC+zSE7s1pwGGiAbZWzZ6QBms2LG/mFKzT5BUacj
   32cn50s+Vt04deBWDw7ljngVrBPGU7hu74arPMTmLbjTOh8xG4RmCI/yI
   5nl71BifSEc6wjsGR5qER8UgNjT36Mj9K8aqdjFS6sOPz7tg2PjFDSRBz
   +Hy1KFm/QWSUJ4tueMqaQoInfAZ9edeEUvR2qZLqbCsFKy6PJ9bHGxKgK
   HvNor20xrJyn6FR54upZQmY26TJWWjouA9yyizBd32A/3Sa7/RfmGucyl
   Opg+yjUbrbLsdx0D1H6QuKOW1991VsCgx5KONXYBbD27VJ5NYN/xLYIXh
   Q==;
X-CSE-ConnectionGUID: hd9dO9OPSuGodmvHX6ZsNg==
X-CSE-MsgGUID: GkL5JMETQuqynGdAYaW1lQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="48851536"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="48851536"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 15:14:41 -0700
X-CSE-ConnectionGUID: F2M7CPmBT3CWYIyGV65piw==
X-CSE-MsgGUID: gvVk2R1dTQ2dqOh4r03shA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="170698645"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 20 May 2025 15:14:40 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHVEL-000NcW-1h;
	Tue, 20 May 2025 22:14:37 +0000
Date: Wed, 21 May 2025 06:14:33 +0800
From: kernel test robot <lkp@intel.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [brgl:gpio/for-next 93/99] gpio-davinci.c:undefined reference to
 `gpiochip_irq_reqres'
Message-ID: <202505210606.PudPm5pC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
head:   274fd5fe911956cdebeeed65981b7182d57c2773
commit: 3f50bb3124d76653de0bcfe251faa357711e3ae6 [93/99] gpio: davinci: Make irq_chip immutable
config: arm-keystone_defconfig (https://download.01.org/0day-ci/archive/20250521/202505210606.PudPm5pC-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250521/202505210606.PudPm5pC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505210606.PudPm5pC-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/gpio/gpio-davinci.o: in function `.LANCHOR2':
>> gpio-davinci.c:(.rodata+0x54): undefined reference to `gpiochip_irq_reqres'
>> arm-linux-gnueabi-ld: gpio-davinci.c:(.rodata+0x58): undefined reference to `gpiochip_irq_relres'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

