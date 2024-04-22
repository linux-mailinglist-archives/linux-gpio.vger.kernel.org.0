Return-Path: <linux-gpio+bounces-5714-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE5D8AD140
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Apr 2024 17:49:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FB381C2222C
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Apr 2024 15:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA17A1534EE;
	Mon, 22 Apr 2024 15:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SInF0Jpd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83671534E7
	for <linux-gpio@vger.kernel.org>; Mon, 22 Apr 2024 15:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713800978; cv=none; b=IcaPjV5f1rtDT/7Oh5nKSwi80XGnHpJ0Re7l4g8KtmlcYCiCj6vz1cVvkFLhenG3+yV2B2+gGUAv4oVpgZOBr0+f9JneC5QEll6pFoWFu2U/sfOUqwnFY57wnPgNgHp5fgW6P+21nFrIK/+tJMNHy7+SNr32iNuaaYuGA59nbxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713800978; c=relaxed/simple;
	bh=UGdP9yndDLWJNFgF05GdlJ2zTrNSFuS74Jdf85FQw48=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BYj1u1/5t9xd4nmwPCOmFELvESro9gzQRpzeihcPU7iM2XjbWCt72BtrkkRuLzHBHBxLT3MMasPZ1yWGQtyW0K64v2y3MZ7RUVj9aBVe3NUvlbn0ji22v/+qHS9LQSSQYZ8NpQ8+eIvj7OxunXeZ6kQ2bqTjzFp+Q/99B2twP1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SInF0Jpd; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713800975; x=1745336975;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UGdP9yndDLWJNFgF05GdlJ2zTrNSFuS74Jdf85FQw48=;
  b=SInF0JpdVEN6JKKLIWenYRxwj4WopTpYkzb2IJlGbAyvcAAkIGgdS4gE
   e6Gqhy36Rt3C4UqeVo3UNsuj0JBLnpcns4DpC0mrWk+edG3y4ZnQuG6I3
   fzXUDlyiZ8zbFBElQVtCSyYGpKuksXjkB0hXQNrNrlyrDn2+J/zfBRUn5
   KYyKLkOnHn1DUpIO5udDDcuMlVIX1t0WUidHFbyrKg3R2tj8M8DF6J/ll
   4UgbGg+I0HuMR+FNz5AVRp136cQWcyydJszpoFQ+fb3O8jMr6tKwugUOu
   Qyr8cddith2wlXhIW8PahQUmsxRQqJW3A3kfUg3yH2XtKVFDQQJyhGC6k
   Q==;
X-CSE-ConnectionGUID: LNkRZqOGQW6XOaraV1twRA==
X-CSE-MsgGUID: M/s7iuUjSKmQCgUsV1i3Dw==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="13131457"
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; 
   d="scan'208";a="13131457"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 08:49:34 -0700
X-CSE-ConnectionGUID: /Pk0u4omQo62QIvNvtouPA==
X-CSE-MsgGUID: gUdl5ZV+Smu+aXp6rTDk1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; 
   d="scan'208";a="23934047"
Received: from lkp-server01.sh.intel.com (HELO 01437695816f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 22 Apr 2024 08:49:33 -0700
Received: from kbuild by 01437695816f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ryvv8-00004i-2O;
	Mon, 22 Apr 2024 15:49:30 +0000
Date: Mon, 22 Apr 2024 23:49:13 +0800
From: kernel test robot <lkp@intel.com>
To: Prathamesh Shete <pshete@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [brgl:gpio/for-current 1/1] drivers/gpio/gpio-tegra186.c:189:14:
 warning: 'or' of unmatched not-equal tests is always 1
Message-ID: <202404222357.2CCvEJdY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
head:   62326f7cefc21b4a7e8a1b413bf1e8bc07df1115
commit: 62326f7cefc21b4a7e8a1b413bf1e8bc07df1115 [1/1] gpio: tegra186: Fix tegra186_gpio_is_accessible() check
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240422/202404222357.2CCvEJdY-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240422/202404222357.2CCvEJdY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404222357.2CCvEJdY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpio/gpio-tegra186.c: In function 'tegra186_gpio_is_accessible':
>> drivers/gpio/gpio-tegra186.c:189:14: warning: 'or' of unmatched not-equal tests is always 1
     189 |              (value & TEGRA186_GPIO_WRITE_ACCESS)))
         |              ^
>> drivers/gpio/gpio-tegra186.c:189:14: warning: 'or' of unmatched not-equal tests is always 1


vim +/or +189 drivers/gpio/gpio-tegra186.c

   162	
   163	static inline bool tegra186_gpio_is_accessible(struct tegra_gpio *gpio, unsigned int pin)
   164	{
   165		void __iomem *secure;
   166		u32 value;
   167	
   168		secure = tegra186_gpio_get_secure_base(gpio, pin);
   169	
   170		if (gpio->soc->has_vm_support) {
   171			value = readl(secure + TEGRA186_GPIO_VM);
   172			if ((value & TEGRA186_GPIO_VM_RW_MASK) != TEGRA186_GPIO_VM_RW_MASK)
   173				return false;
   174		}
   175	
   176		value = __raw_readl(secure + TEGRA186_GPIO_SCR);
   177	
   178		/*
   179		 * When SCR_SEC_[R|W]EN is unset, then we have full read/write access to all the
   180		 * registers for given GPIO pin.
   181		 * When SCR_SEC[R|W]EN is set, then there is need to further check the accompanying
   182		 * SCR_SEC_G1[R|W] bit to determine read/write access to all the registers for given
   183		 * GPIO pin.
   184		 */
   185	
   186		if (((value & TEGRA186_GPIO_SCR_SEC_REN) == 0 ||
   187		     (value & TEGRA186_GPIO_READ_ACCESS)) &&
   188		    ((value & TEGRA186_GPIO_SCR_SEC_WEN) == 0 ||
 > 189		     (value & TEGRA186_GPIO_WRITE_ACCESS)))
   190			return true;
   191	
   192		return false;
   193	}
   194	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

