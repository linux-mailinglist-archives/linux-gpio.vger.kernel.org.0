Return-Path: <linux-gpio+bounces-12105-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAC39B076E
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 17:13:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D527128221F
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 15:13:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7695D1FB895;
	Fri, 25 Oct 2024 15:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S7rdDo2f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1D41FB899;
	Fri, 25 Oct 2024 15:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729868901; cv=none; b=oBaYjGcxHbA5qfPXT2p+yvXSon/USanoG1LDdYbLLSYn7zHjLPmF2r+V43UInd0l/uBH/8D2Q6Zu2L7IIep0++SPtAOicH3ifpvUuAbGCdbu5n64OMD4gKeq15gspqjmhjbbufPhCzDdEYBLWy11HflybpRhLBgQdeeBDBSdn8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729868901; c=relaxed/simple;
	bh=rppvuYDWzvfCkS2KAohnOiip3kS9PjpY9UnZSDutk24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gC5aKGGn6bvZK4Ew37Wrg57rfmpEyg8PtIRmMxV51M6UJUCNrXsCOhEUu1d4szM4VuXIukgQya2nnD8dViXF0vLGcB6oHB9HEbPmM6NcefAvgEd7j6gq7ga5sXX8B0gwd4LCo3H6am6AFf0QWKKKQMhHNXx8bhoRE+2mRrEfv1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S7rdDo2f; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729868899; x=1761404899;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rppvuYDWzvfCkS2KAohnOiip3kS9PjpY9UnZSDutk24=;
  b=S7rdDo2fI+9AinHMggUHHZKjCPKQcA1DKPjK1ikw7Ijeyf4oatBNEJ2E
   LRmHtXvERXh16Omt6E9OHeAG5VXHjtCohqDCluYOyFrtC9740QkJbVSru
   f+a87nbF46jpkzpjoLrVT9EM2E/Z3/jz8E0vmCzFiEUln8Hxsfsu7jEaH
   LOv/pF91+ql5AhRZrE+zg5yl7hNlhw0PUpa4+1rZ/Bpvft/Poqa/BQ/Wa
   PR+PAfGDSoNtBXkd+/OAM6kHYyK4VUJTaYo4+0nJPm/KeIYtJOkuY3x3p
   XGxCvQFGXpc+ELXlcRcaqFgNAGRz/pOx0VLUVb3xPW3HzL9YtcFurFiPI
   g==;
X-CSE-ConnectionGUID: U5NhG5qaSF6Su1ohaS1VOA==
X-CSE-MsgGUID: q6k8nqaTTTKhBEYCywQtPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="54945783"
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; 
   d="scan'208";a="54945783"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 08:08:19 -0700
X-CSE-ConnectionGUID: CMV7AipwRCeHZY9W+czBZQ==
X-CSE-MsgGUID: swJZ+5tEQYOod1/gAaVsTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; 
   d="scan'208";a="85725264"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 25 Oct 2024 08:08:11 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4Lv5-000YOI-00;
	Fri, 25 Oct 2024 15:08:07 +0000
Date: Fri, 25 Oct 2024 23:07:08 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] gpio: relax the Kconfig dependency on OF_GPIO in drivers
Message-ID: <202410252227.4k7pn2o5-lkp@intel.com>
References: <20241024192758.91748-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024192758.91748-1-brgl@bgdev.pl>

Hi Bartosz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brgl/gpio/for-next]
[also build test WARNING on linus/master v6.12-rc4 next-20241025]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/gpio-relax-the-Kconfig-dependency-on-OF_GPIO-in-drivers/20241025-032925
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20241024192758.91748-1-brgl%40bgdev.pl
patch subject: [PATCH] gpio: relax the Kconfig dependency on OF_GPIO in drivers
config: i386-kismet-CONFIG_GPIO_SYSCON-CONFIG_GPIO_SAMA5D2_PIOBU-0-0 (https://download.01.org/0day-ci/archive/20241025/202410252227.4k7pn2o5-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241025/202410252227.4k7pn2o5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410252227.4k7pn2o5-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for GPIO_SYSCON when selected by GPIO_SAMA5D2_PIOBU
   WARNING: unmet direct dependencies detected for GPIO_SYSCON
     Depends on [n]: GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF [=n]
     Selected by [y]:
     - GPIO_SAMA5D2_PIOBU [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && (ARCH_AT91 || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

