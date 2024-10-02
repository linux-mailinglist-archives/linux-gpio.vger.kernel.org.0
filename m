Return-Path: <linux-gpio+bounces-10666-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9951D98CB86
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 05:32:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06BD5285DD9
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 03:32:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9142DDF78;
	Wed,  2 Oct 2024 03:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MyBAjgB7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF45E125D6
	for <linux-gpio@vger.kernel.org>; Wed,  2 Oct 2024 03:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727839969; cv=none; b=goprasn0MbtHWbdF/qPA4urMr9Vwj+5s4dSGHdsX3q/SaubD5LuRH56ZsUCOzNe+S2qX5AjZNH8ym18Wcxirq8SZrc0wBgYcqAFsxEjIzfDvur3UQKOinFNJsT6NYGs8VI7elFIbJNnyIUSb945OHcJBw8b/uQsFKbp/oKAmb9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727839969; c=relaxed/simple;
	bh=NwHzwBOgGB/Rjd8yZLxF1B6Wm+XEjjTbntcz5P8+8zU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kfW/OQcD9hiDIsTph5YuslDRtAM3toseQDapQv0iUg68f0G9CFtZVy0LskjIWXX+9tSH3wSvcL6PCs1zhinhNvoLyPFMl5W3Pa7mBFoRCUgNU3pgJ4JCxoz/xopLNd/p+kjAdSHyjDMNsOfw9H51CwnxtEc+9kuGLdDEkc4TCoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MyBAjgB7; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727839967; x=1759375967;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NwHzwBOgGB/Rjd8yZLxF1B6Wm+XEjjTbntcz5P8+8zU=;
  b=MyBAjgB78VT8FkoYHVFlmp0Pjs/pNfbFJxSnvMny24O/alRZEdp6x31s
   kYrYXils8G3DWoDeZFEnG7n6/O5dGYPVRYdYSkTJpzbOK6uIu2SNqVIxa
   51twHBux5tGZeBbcS5pLOmp+rlIZKaDP2fM6FXFdg3d3aLKE0+j8iC2UU
   KOwY3kZSDI7E+qOwFfzAcYU0I5nSovCxg68M7N4a7VZGROJiIjyibLQk5
   0kJ2A81OuYljQRZ6RC0MPko94y/PydR5utUGRyROZ/IQg3IDILDVZJBcD
   L6E/iLWPGW7OREMVgjyY1eetLzgZQ52QzybuxicghEnW+1DmjeGFVgw0B
   g==;
X-CSE-ConnectionGUID: FHqd3RD/S/2X71fegpy26w==
X-CSE-MsgGUID: GLnQxvXuTTu+dynRt56ZdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="26465223"
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="26465223"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 20:32:47 -0700
X-CSE-ConnectionGUID: az5EUkz0T5SH5tv1u/KwFQ==
X-CSE-MsgGUID: Ij+A/Kn9SHOr7alwaz5eXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="97238225"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 01 Oct 2024 20:32:45 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svq6V-000RVN-0h;
	Wed, 02 Oct 2024 03:32:43 +0000
Date: Wed, 2 Oct 2024 11:32:23 +0800
From: kernel test robot <lkp@intel.com>
To: Ze Huang <18771902331@163.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [linusw-pinctrl:devel 15/20] drivers/pinctrl/pinctrl-k230.c:159:11:
 warning: variable 'mode' set but not used
Message-ID: <202410021136.ie3cFM2w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
head:   d1c7bf9cb31a8e3868c5eaf3ec05b79aba4d2e33
commit: 545887eab6f6776a7477fe7e83860eab57138b03 [15/20] pinctrl: canaan: Add support for k230 SoC
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20241002/202410021136.ie3cFM2w-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410021136.ie3cFM2w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410021136.ie3cFM2w-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/pinctrl-k230.c:159:11: warning: variable 'mode' set but not used [-Wunused-but-set-variable]
     159 |         u32 val, mode, bias, drive, input, output, slew, schmitt, power;
         |                  ^
>> drivers/pinctrl/pinctrl-k230.c:159:37: warning: variable 'output' set but not used [-Wunused-but-set-variable]
     159 |         u32 val, mode, bias, drive, input, output, slew, schmitt, power;
         |                                            ^
   2 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]


vim +/mode +159 drivers/pinctrl/pinctrl-k230.c

   154	
   155	static void k230_pinctrl_pin_dbg_show(struct pinctrl_dev *pctldev,
   156					      struct seq_file *s, unsigned int offset)
   157	{
   158		struct k230_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
 > 159		u32 val, mode, bias, drive, input, output, slew, schmitt, power;
   160		struct k230_pin_group *grp = k230_pins[offset].drv_data;
   161		static const char * const biasing[] = {
   162				"pull none", "pull down", "pull up", "" };
   163		static const char * const enable[] = {
   164				"disable", "enable" };
   165		static const char * const power_source[] = {
   166				"3V3", "1V8" };
   167	
   168		regmap_read(info->regmap_base, offset * 4, &val);
   169	
   170		mode	= (val & K230_PC_SEL) >> K230_SHIFT_SEL;
   171		drive	= (val & K230_PC_DS) >> K230_SHIFT_DS;
   172		bias	= (val & K230_PC_BIAS) >> K230_SHIFT_BIAS;
   173		input	= (val & K230_PC_IE) >> K230_SHIFT_IE;
   174		output	= (val & K230_PC_OE) >> K230_SHIFT_OE;
   175		slew	= (val & K230_PC_SL) >> K230_SHIFT_SL;
   176		schmitt	= (val & K230_PC_ST) >> K230_SHIFT_ST;
   177		power	= (val & K230_PC_MSC) >> K230_SHIFT_MSC;
   178	
   179		seq_printf(s, "%s - strength %d - %s - %s - slewrate %s - schmitt %s - %s",
   180			   grp ? grp->name : "unknown",
   181			   drive,
   182			   biasing[bias],
   183			   input ? "input" : "output",
   184			   enable[slew],
   185			   enable[schmitt],
   186			   power_source[power]);
   187	}
   188	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

