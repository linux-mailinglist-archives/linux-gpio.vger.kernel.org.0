Return-Path: <linux-gpio+bounces-4009-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D71A86DB1F
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Mar 2024 06:30:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D08902821A2
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Mar 2024 05:30:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5A7250A60;
	Fri,  1 Mar 2024 05:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fvhv9R6j"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A980A5026E
	for <linux-gpio@vger.kernel.org>; Fri,  1 Mar 2024 05:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709271006; cv=none; b=S6MkbmRc3+sEtdH+P/BjelmqYvrh4/U8z4XjKL/moeRBUl0fHar3qFF+2VwlsZHPGY4CkLLBFieJtvz8pzW1Uehv35uNeRskE7TpOMDJEfFQWVB6gcLOGBp7+z+wYsxraloBt6VjgS8i59q01Qrfk2jLUuRxBSOQRbfGTVfSMKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709271006; c=relaxed/simple;
	bh=8xgGuP44kIabX8GFGlBXpK28zQanDrbiW60sEfY/EOY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GHfhDg7d/CtXE8Tn0bEhZOqY55Q+rR+Hl39dBTn1prndpBL2u+FaM9iMSEg3jSjsyEHbd7nNepxHZo9PeWJPzeBXo6ixv594UNQto8c+yYZgO+ounm2c19kqnE2UodXnIrctdfLtyzr2BcS+QXW0kQPVDU51wtWFqRHhywaI3nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fvhv9R6j; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709271004; x=1740807004;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8xgGuP44kIabX8GFGlBXpK28zQanDrbiW60sEfY/EOY=;
  b=Fvhv9R6jIVuiFHb04KeOc8pMa+/wcJuRT7axk5zoUY8pazTvgUdhsOWF
   0QRxyRBckc+LJDX1F60IfztV1j3VCi4tbdMHPlnA0JWrsGtV3fm4e+ngV
   GcM4JcFSc9CcfBO15iA2yD5SwD8l9zD/Sq9fj88/IgNJ9Y+eX8MTbUD9B
   Jfuc/4y3RYRfhLQJ9g0zHZnyjXpxwzOKHXfwYJm54p8hJTnCM1RGs8SQ7
   6rXLLMJlWMJFCcX24td+b0sFN3SO+uIfO4sBlnP4wH5VRvFxPxREToXqH
   k2O9JX0G6NV8J/JtJ4lTYpWLKoKCUpbvu6b+VJ8bJAK5WDgyw/nPZCZg1
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="15226228"
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; 
   d="scan'208";a="15226228"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 21:30:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; 
   d="scan'208";a="12766603"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 29 Feb 2024 21:29:59 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfvT2-000DZ1-27;
	Fri, 01 Mar 2024 05:29:56 +0000
Date: Fri, 1 Mar 2024 13:29:41 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [linusw-pinctrl:ib-nomadik-gpio 6/25] kismet: WARNING: unmet direct
 dependencies detected for MFD_STMFX when selected by PINCTRL_STMFX
Message-ID: <202403011329.1VnABMRz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git ib-nomadik-gpio
head:   6ad679cfaeea9291e9dce3247e34656080fc1d29
commit: 966942ae493650210b9514f3d4bfc95f78ef0129 [6/25] gpio: nomadik: extract GPIO platform driver from drivers/pinctrl/nomadik/
config: alpha-kismet-CONFIG_MFD_STMFX-CONFIG_PINCTRL_STMFX-0-0 (https://download.01.org/0day-ci/archive/20240301/202403011329.1VnABMRz-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240301/202403011329.1VnABMRz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403011329.1VnABMRz-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for MFD_STMFX when selected by PINCTRL_STMFX
   
   WARNING: unmet direct dependencies detected for OF_GPIO
     Depends on [n]: GPIOLIB [=y] && OF [=n] && HAS_IOMEM [=y]
     Selected by [y]:
     - GPIO_NOMADIK [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && (ARCH_U8500 || ARCH_NOMADIK || COMPILE_TEST [=y])
   
   WARNING: unmet direct dependencies detected for MFD_STMFX
     Depends on [n]: HAS_IOMEM [=y] && I2C [=y] && OF [=n]
     Selected by [y]:
     - PINCTRL_STMFX [=y] && PINCTRL [=y] && I2C [=y] && OF_GPIO [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

