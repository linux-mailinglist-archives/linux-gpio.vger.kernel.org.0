Return-Path: <linux-gpio+bounces-4007-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 278DA86D919
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Mar 2024 02:43:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5ECA286EB2
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Mar 2024 01:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3527376FE;
	Fri,  1 Mar 2024 01:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rl0L0rjc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3422E40E
	for <linux-gpio@vger.kernel.org>; Fri,  1 Mar 2024 01:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709257360; cv=none; b=PzbB6FAk+6phe6R9yYyE+ZGGQ9OCZJ/fNBJuWti0pLGnLhbgsTF7/AxMhSGCdCDm3iLIoMk2GSH8aFNOJMYlTdbM5hwhRgrSycGYb49L5Y3rJTu6LbRT6A42j2kQjWNYGPTkMBoFnKCJ+RuxOwFC3n6gecOEA5xkTlYjEQ3TBM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709257360; c=relaxed/simple;
	bh=1KbdRL2WXdTJTyY1S+KqMtAfKq8kJioaxA3f0dfO1XI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AdCHWxuVQnsNuyeOv8Vl/JJ7VLdfgFYgXg1njGriPzUGmxEi5OA2zdQn0+5Po2+UNStBQ1ksAM7Oq8d+0OctLAu295NI0PLRJeQlAJTn2ZvuRZJ2uqMPROTZyb/RSzudWDosdcaY/0HNRCgYuLU+DPUV1wZya0Dg65jMRxI+JBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rl0L0rjc; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709257359; x=1740793359;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1KbdRL2WXdTJTyY1S+KqMtAfKq8kJioaxA3f0dfO1XI=;
  b=Rl0L0rjcnDx6YpKl+oDZJQ1Zjwm3SJ8FTB4ZYcvV0iGWgVz7qun5YHy3
   y9dZqf8FTU+OU4qVfR53KQRoHmS7q71tXoV38+dIhl3Ov63zIH7PIuN8t
   ahPXgVpLFr7YZCm6UN94utxLIqxvD1Rn3mxlTHyRbMJ173VlFIFMTC2AN
   g+v45dEVTIgkUJ9dPzygfOayCRvlwL6DLSszZ5Avom5iUgY86cP20wRAR
   HX1NWiaxwA5pTr5AgIXLyWM48toLp7Oj+yeF34CcfT4jbFsXf4UXzAj/9
   Hl0r2KBSD/FHrObN5NT11tgI4+f9Pkh9vSzEv4NGAO9MSPRKy03bp3UUs
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3631994"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3631994"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 17:42:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="8585187"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 29 Feb 2024 17:42:36 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfrux-000DRW-1I;
	Fri, 01 Mar 2024 01:42:31 +0000
Date: Fri, 1 Mar 2024 09:41:25 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [linusw-pinctrl:ib-nomadik-gpio 7/25] kismet: WARNING: unmet direct
 dependencies detected for GPIO_NOMADIK when selected by PINCTRL_NOMADIK
Message-ID: <202403010917.pnDhdS1Y-lkp@intel.com>
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
commit: ae82f5d2b18a6c6cd95f8896010b221780114cac [7/25] pinctrl: nomadik: Kconfig: allow building with COMPILE_TEST
config: alpha-kismet-CONFIG_GPIO_NOMADIK-CONFIG_PINCTRL_NOMADIK-0-0 (https://download.01.org/0day-ci/archive/20240301/202403010917.pnDhdS1Y-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240301/202403010917.pnDhdS1Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403010917.pnDhdS1Y-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for GPIO_NOMADIK when selected by PINCTRL_NOMADIK
   
   WARNING: unmet direct dependencies detected for GPIO_NOMADIK
     Depends on [n]: GPIOLIB [=n] && HAS_IOMEM [=y] && (ARCH_U8500 || ARCH_NOMADIK || COMPILE_TEST [=y])
     Selected by [y]:
     - PINCTRL_NOMADIK [=y] && PINCTRL [=y] && (ARCH_U8500 || ARCH_NOMADIK || COMPILE_TEST [=y]) && OF [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

