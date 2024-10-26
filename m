Return-Path: <linux-gpio+bounces-12131-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5C09B1754
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Oct 2024 13:14:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ADA9EB210A5
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Oct 2024 11:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEE8F217F22;
	Sat, 26 Oct 2024 11:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HzXmhDOB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEDE1D2F66;
	Sat, 26 Oct 2024 11:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729941242; cv=none; b=hxKyr8t2P4z6lt7JfUVRzOx7q/I+NOBOYqA58caCd8pfmT0sB/NThQh2r2KpFp1E5SAZosvnFcwDSWVF06UOUyRiy9dm7ireSA57iLMookXZO9hVb+UO7jCveMETzIWzI4FKz/ZGhFp3L6vA1s861qgRp+QIEl6Td5pDDGXyt4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729941242; c=relaxed/simple;
	bh=Kx8R7i0es2J18t3j6ytFBgg4KrumRNAM3QSsRjkTUME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ASmE1oVjdhE82HJ4Lo0Cmq5YtzGHNIlijB9IHm1cl68L0ceG7uzdTE2SPkIO9XCUOa9ecxbM7YMyx14GrXtlxO3jvhjq4Ed4Cu8hTiAgARga1LKQAw6S6EDwx292W1zboLlzjAeYsZnQn6c5zTqFCxBCa6/ZZDUxx8DeddWAf+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HzXmhDOB; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729941240; x=1761477240;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Kx8R7i0es2J18t3j6ytFBgg4KrumRNAM3QSsRjkTUME=;
  b=HzXmhDOBDXMkqB+0ovYu1bCJQbLaUUf7DWmkl9QIe0YnvsnfY7y4ioqO
   No5D/pEiBBVC7uSBhYreYtGetEdlkxeWsIFGc7A5skHUK7U39pFCOC718
   94qNYTPZSelUvuQySZa5Z+zoLjonWL6VhNwshzST9c0e6TNTeLcqnXe4X
   zN1GBP8mHig/99bv4mVTbhU7Aro51+uNZeYwbnXwXzxKDOxXN5oEdiTOe
   FJMSiHAkkeKtkMj/6MY0kwVno8xk/goHbhmRGp3TCQeidFMQ9DBm42yIa
   9UrYcWH4sqlflGlOtUv0b1PANk2+RfuKT9lttA7nNFjnn4xhY/qzoiSid
   Q==;
X-CSE-ConnectionGUID: dvKzRpM+Sp+he0VK6G3L/w==
X-CSE-MsgGUID: njXxP5OqSpu4NRlqCBOVjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="32466170"
X-IronPort-AV: E=Sophos;i="6.11,234,1725346800"; 
   d="scan'208";a="32466170"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 04:13:59 -0700
X-CSE-ConnectionGUID: 6EqCKnueSDqDH3Bx3XlKnw==
X-CSE-MsgGUID: /lQfrYWPTYqbyKwR/jyfIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,234,1725346800"; 
   d="scan'208";a="80800321"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 26 Oct 2024 04:13:59 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4ek0-000ZYf-09;
	Sat, 26 Oct 2024 11:13:56 +0000
Date: Sat, 26 Oct 2024 19:13:05 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] gpio: of: drop dependency on HAS_IOMEM
Message-ID: <202410261912.IFxHoNb2-lkp@intel.com>
References: <20241025163651.54566-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025163651.54566-1-brgl@bgdev.pl>

Hi Bartosz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brgl/gpio/for-next]
[also build test WARNING on linus/master v6.12-rc4 next-20241025]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/gpio-of-drop-dependency-on-HAS_IOMEM/20241026-003750
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20241025163651.54566-1-brgl%40bgdev.pl
patch subject: [PATCH] gpio: of: drop dependency on HAS_IOMEM
config: s390-kismet-CONFIG_MFD_STMFX-CONFIG_PINCTRL_STMFX-0-0 (https://download.01.org/0day-ci/archive/20241026/202410261912.IFxHoNb2-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241026/202410261912.IFxHoNb2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410261912.IFxHoNb2-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for MFD_STMFX when selected by PINCTRL_STMFX
   WARNING: unmet direct dependencies detected for MFD_STMFX
     Depends on [n]: HAS_IOMEM [=n] && I2C [=y] && OF [=y]
     Selected by [y]:
     - PINCTRL_STMFX [=y] && PINCTRL [=y] && I2C [=y] && OF_GPIO [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

