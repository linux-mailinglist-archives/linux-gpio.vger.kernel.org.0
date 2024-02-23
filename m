Return-Path: <linux-gpio+bounces-3688-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B96860DEB
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Feb 2024 10:25:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D484E1C20B47
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Feb 2024 09:25:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A099E5B69A;
	Fri, 23 Feb 2024 09:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TM3o31ME"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDE918039
	for <linux-gpio@vger.kernel.org>; Fri, 23 Feb 2024 09:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708680345; cv=none; b=XTLrOQik46UAHvrHyF2dIAtHZgheRHprxr5ChZ+P44eb6ubDBqCr4LKl1PdFolkJosid8336TUD/7KXSwenj24IDDfuou5Yi9xb4WKM40dj25oP9ynOT4R4gl1CY8XzusOXvFZY+BHemY9NA1lx4jkdzer44Txg4Z+bckyloVQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708680345; c=relaxed/simple;
	bh=O6wCPEDf5O+9Pu6YvSeWPM1PWp4R5rgRpm3yLHS4Ljc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OpEYKAL3dYvOd6/5eY5nu5+7QziCn7Y1nO1m2xhrIIiSZpg9fIb7JtCdt/u7P7I5RVtfMEVp8SerAGRKEeXFDYmHgBs1brlu4eNajwnes9AUTRrRJwkSBIjBpl9rg7/+zenc1MgLjchzVe4KcDHxhUhlqN9yrf7GMgOmVo2mESg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TM3o31ME; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708680343; x=1740216343;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O6wCPEDf5O+9Pu6YvSeWPM1PWp4R5rgRpm3yLHS4Ljc=;
  b=TM3o31MEPuzxtrq8X9BML11Ad9SlE9c+doARqdxgEbYXweCWjDPc8Jvv
   WEhARkJ3Qk8ov6qdiRnuT0OQ4A0W7uOnCT9wp4dr6oLgk5YOx4MtNNmEx
   VHMMElMkns/cbJBlYA0PvcMe93pJGpPlQuDQ+ElaMquU64onG/MXr1OCY
   sBd2HCX2zpPmdK4RFWu572eYkSBfYeYEJGZOiAbaxnBVYHBP8JhdhUMFZ
   R4mds0vH9uHJ3zV5Er+YQAQYcg2cmHoJ35icxyq/7GYSm4Op4ebyEcTqs
   oJltsu/FCzEAelSzdWaMv3RWW21TfynAno4OpN+awTIiuTNij3NNnXo/w
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="20426253"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="20426253"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 01:25:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="10456654"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 23 Feb 2024 01:25:41 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdRnw-0007H2-2j;
	Fri, 23 Feb 2024 09:25:30 +0000
Date: Fri, 23 Feb 2024 17:23:36 +0800
From: kernel test robot <lkp@intel.com>
To: "andy.shevchenko" <andy.shevchenko@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [brgl:gpio/for-next 42/42] undefined reference to `iowrite64be'
Message-ID: <202402231729.PvxQ1uRx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
head:   36e44186e0badfda499b65d4462c49783bf92314
commit: 36e44186e0badfda499b65d4462c49783bf92314 [42/42] gpio: mmio: Support 64-bit BE access
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240223/202402231729.PvxQ1uRx-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240223/202402231729.PvxQ1uRx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402231729.PvxQ1uRx-lkp@intel.com/

All errors (new ones prefixed by >>):

   alpha-linux-ld: drivers/gpio/gpio-mmio.o: in function `bgpio_write64be':
>> (.text+0x910): undefined reference to `iowrite64be'
>> alpha-linux-ld: (.text+0x920): undefined reference to `iowrite64be'
   alpha-linux-ld: drivers/gpio/gpio-mmio.o: in function `bgpio_read64be':
>> (.text+0x95c): undefined reference to `ioread64be'
>> alpha-linux-ld: (.text+0x964): undefined reference to `ioread64be'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

