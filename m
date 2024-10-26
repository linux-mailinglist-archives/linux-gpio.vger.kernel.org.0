Return-Path: <linux-gpio+bounces-12161-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AE09B1AF9
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Oct 2024 23:03:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63407282278
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Oct 2024 21:03:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B05FF1C9B61;
	Sat, 26 Oct 2024 21:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QY48jxGI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCDA41C64;
	Sat, 26 Oct 2024 21:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729976607; cv=none; b=XB+vzPOZesnLjpBqCl5px5ois2fAg7jj6zvPbBw4wkLucmsq/Ag2huwbjArwxHuMxA5rmKcJPRyf9DD9fmw5F250W9kAZRrWOPCrnxCXmdhjgmGDE799vBSTbkPsVrHEr3E6PBDTAjb36vpvY0bMVi1BKON/OsaadvQ5FZlbHy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729976607; c=relaxed/simple;
	bh=E5zHO0T8fHIBD/QegqIPLhaTd7AJ1sZiM24k53rmUcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tj12DnYhczjb9G42crwBoGmaaXdFWIA5wPtaCbPX4l8YV5jNdhE+IT4ap5dHP5y3wJFX10Us/ho41sAOaFVj+4sEDAH6zBdLIRDkswFJbFdhC+IouNIJlumw1aq/3g6QZfJFS7s51/wzo7o6n1fHih4Hkw0G87dL6zDRgvg21V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QY48jxGI; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729976606; x=1761512606;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E5zHO0T8fHIBD/QegqIPLhaTd7AJ1sZiM24k53rmUcU=;
  b=QY48jxGIXo/d9WRzBrWl/w9rZlI5Zl+JI8smvPdYEdbRXis7eeEHpogc
   26T5yuzCjb54m8KDUZgxM+jaIw62hlm3o+X7YIDeUKCYA52rdvnB3cqvn
   8XXI9s2MaTjzb8vtTnoe7CFx+EYbAnMGSwVq/0h6fTV1knsu/ga+Oh3I9
   H05HFSKCs7l0Kr8BE667apmllc6Rn0TARkd1SQCPqZE/Zu4athkgp6GRs
   A4JDKpLkmRo1sO8zTthpTcrs7C1NQXnd7uJN8PHIAVtkeRLedDUuGnAQG
   4L+RnD3iHIeKwLXRSZri1yKLec4UKPjANn6xwD62znltr54wtZYM9odmP
   g==;
X-CSE-ConnectionGUID: 3BftpqC6QjSMf4oVP35hHQ==
X-CSE-MsgGUID: sTFE3xNlQ9mOKPAR2YgfIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11237"; a="29512922"
X-IronPort-AV: E=Sophos;i="6.11,235,1725346800"; 
   d="scan'208";a="29512922"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 14:03:25 -0700
X-CSE-ConnectionGUID: eY4LFc0RQ8ea/pddqQPZnQ==
X-CSE-MsgGUID: npmgQsnFRha/gd4qZwyHzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,235,1725346800"; 
   d="scan'208";a="81149526"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 26 Oct 2024 14:03:22 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4nwO-000a2a-2L;
	Sat, 26 Oct 2024 21:03:20 +0000
Date: Sun, 27 Oct 2024 05:02:42 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] gpio: relax the Kconfig dependency on OF_GPIO in drivers
Message-ID: <202410270419.5ZWOyqMq-lkp@intel.com>
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

kernel test robot noticed the following build errors:

[auto build test ERROR on brgl/gpio/for-next]
[also build test ERROR on linus/master v6.12-rc4 next-20241025]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/gpio-relax-the-Kconfig-dependency-on-OF_GPIO-in-drivers/20241025-032925
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20241024192758.91748-1-brgl%40bgdev.pl
patch subject: [PATCH] gpio: relax the Kconfig dependency on OF_GPIO in drivers
config: sh-randconfig-r052-20241027 (https://download.01.org/0day-ci/archive/20241027/202410270419.5ZWOyqMq-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241027/202410270419.5ZWOyqMq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410270419.5ZWOyqMq-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: drivers/gpio/gpio-altera.o: in function `altera_gpio_remove':
>> gpio-altera.c:(.text+0x20): undefined reference to `of_mm_gpiochip_remove'
   sh4-linux-ld: drivers/gpio/gpio-altera.o: in function `altera_gpio_probe':
>> gpio-altera.c:(.text+0x544): undefined reference to `of_mm_gpiochip_add_data'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

