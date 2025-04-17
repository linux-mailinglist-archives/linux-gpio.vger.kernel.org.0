Return-Path: <linux-gpio+bounces-19030-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A12D5A92304
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 18:50:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF299464CED
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 16:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B87F4252292;
	Thu, 17 Apr 2025 16:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZFoHP6pJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B52190462
	for <linux-gpio@vger.kernel.org>; Thu, 17 Apr 2025 16:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744908610; cv=none; b=nsU2FdulSxfKkBDkaz0jqn5mXCqYOTUR1tsb8+UzFG+xXngr9vBaC3GlyUMoWpBMXRuUFerMbtrFjLrNt+egHwtWix533ns1cIcDiqFQ0qXR6xkS1n2r0xl1O+L8NCUUgWS/78dq7z8VpQ5ZCxxv2y0ovLQVoWNWN3Yi/kokQRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744908610; c=relaxed/simple;
	bh=lPfv0ocsz/XePRzqKl7ggZtRlHQV6xDoOKASVJytMbw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YEXm9O4oX8LeJh464spdcHY2AMKSw+YfL6jy3zhSpJttkneKpPmOKjzFiyEmV2ccKNzm8RW5yFMPmerDNRuEjVPR7pXjA+KjRIi5/EHCh0KXJ788g/1Y4eI0oyi82f+LvCbQjJG3dTtJ2CAJOyEDm+1nstFKdDM8hJ3SbNEMg0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZFoHP6pJ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744908607; x=1776444607;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lPfv0ocsz/XePRzqKl7ggZtRlHQV6xDoOKASVJytMbw=;
  b=ZFoHP6pJ7NcJKSuTdcHf+ZkuLQkm4ccCzpXf+3Q5pmQStxLj+VVYD4DH
   lrLJj06l9els80jD0chRndrG31tXzvYad3O6u1jZBMI4qgqRguXa8+7vn
   qHYnbVovCOKYw2HBbxsetOhC8F3gj3P2IDEQqlqqfir/KpTKBdJuj9o4B
   UuImFRt9vKwQsLW1P9bAs2i/0SNWZ+hkQGcNVKLJP2ZRs6kRGfudFY6fh
   AaWUVB82r3wca3iIsOPlu73Y0h4dk/pku8tfCiki6pWdTGKiHNzIjSHDy
   d8I6kmS+oX9xyfdaqiq/2twN0pYX9t65Yho7k4jAl0HUUqAmvjX5hgfN3
   A==;
X-CSE-ConnectionGUID: TOL+CzW1QYCnqCnzpm+iTA==
X-CSE-MsgGUID: 8Zn9+OM3Rj20VEm6gVal0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="57504926"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="57504926"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 09:50:06 -0700
X-CSE-ConnectionGUID: upnzOCXqQ+WgMCl3v7KGiw==
X-CSE-MsgGUID: liCKcVFjTVKWQY6nj13yKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="130794184"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 Apr 2025 09:50:04 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5SR7-0000WX-1A;
	Thu, 17 Apr 2025 16:50:01 +0000
Date: Fri, 18 Apr 2025 00:49:51 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [linusw-pinctrl:b4/abx500-pinctrl 15/33] loongarch64-linux-ld:
 pinctrl-sx150x.c:undefined reference to `i2c_smbus_write_byte_data'
Message-ID: <202504180045.r5xtbS4v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git b4/abx500-pinctrl
head:   4fff328b120e7e541076abb58810bb845722e6d0
commit: c4d1b2ee4407b0b12e0dade40361eb86c1c710ed [15/33] pinctrl: sx150x: enable building modules with COMPILE_TEST=y
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250418/202504180045.r5xtbS4v-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250418/202504180045.r5xtbS4v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504180045.r5xtbS4v-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/pinctrl/pinctrl-sx150x.o: in function `sx150x_regmap_reg_read':
   pinctrl-sx150x.c:(.text+0xb3c): undefined reference to `i2c_smbus_read_byte_data'
   loongarch64-linux-ld: drivers/pinctrl/pinctrl-sx150x.o: in function `sx150x_probe':
   pinctrl-sx150x.c:(.text+0xd98): undefined reference to `i2c_get_match_data'
>> loongarch64-linux-ld: pinctrl-sx150x.c:(.text+0xf44): undefined reference to `i2c_smbus_write_byte_data'
   loongarch64-linux-ld: pinctrl-sx150x.c:(.text+0xf90): undefined reference to `i2c_smbus_write_byte_data'
   loongarch64-linux-ld: drivers/pinctrl/pinctrl-sx150x.o: in function `sx150x_regmap_reg_write':
   pinctrl-sx150x.c:(.text+0x19b4): undefined reference to `i2c_smbus_write_byte_data'
   loongarch64-linux-ld: drivers/pinctrl/pinctrl-sx150x.o: in function `sx150x_init':
   pinctrl-sx150x.c:(.init.text+0x28): undefined reference to `i2c_register_driver'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

