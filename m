Return-Path: <linux-gpio+bounces-28606-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C9FC65B0C
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 19:19:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id A80C028AB1
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 18:19:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 814A42EC541;
	Mon, 17 Nov 2025 18:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SxQH5XL8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC522FD1B2
	for <linux-gpio@vger.kernel.org>; Mon, 17 Nov 2025 18:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763403580; cv=none; b=Uw0gaJll1c3Tl1T2pEYn8fGtO4Fd8FRysRvspkO21c4GTKvLE3iT8t4KtvtI+rRR0HGoTnOaqutG04rJdcWP9D6KHde297Ro+WJ1m8GRlJWhLK6AT9p52UjoGcz1jtlYzgNj5+TGyC3qtgzBDINWmgA2s/uNuWDxmvLa5dEI7E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763403580; c=relaxed/simple;
	bh=Rt0FcpkBwrKDPv+RAlnoaXSMHwdO4ZUMq9JaQBbMZSE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hPtLpbjNuXVtPbtd+sPM15z/HZEOm3V0sbTrUvsPsEzwk9SvYphjuJX/0DX/9/pH/O0WXRkOmhiEKGlEe522vJ8x/v0fbbCbGqr//Hn6At5skv7nPEWtwyZk1Kubsyl/D12WczRhcGqwmd1QSNpYE2TvFkGB78A6OyBh/lWh7Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SxQH5XL8; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763403578; x=1794939578;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rt0FcpkBwrKDPv+RAlnoaXSMHwdO4ZUMq9JaQBbMZSE=;
  b=SxQH5XL8ZugTwcO7xCd7o4twaxDJIXv+Ok25PQjggdx47wM9vHf0srcc
   Zhw8gJTJcSeOpPk5l2pHkK98b3AeGE/ODlzJBLoFRQM7SqFogWzG2dQfY
   cj4TsaQZY9Kd4YX11MvBT9taPL5Sf0M+QAPV2ErGnP9e+0cwMUNvlbNac
   LBGYrm4pJVl0aGQ6TW7YcMV4TeABLr82QGVl0JvluwNlHM9/ZCjWZZFBp
   v+bFPzZ9L9YcIfvxSclG7AZTXC0f3u3VEV9DMS50jRixvRCRj3oFh4kdX
   2c+Y8So6WNdjAM4/3eSoPEVNscFE0hIPkhiwQzBipZ16alXziwENI0Wnt
   g==;
X-CSE-ConnectionGUID: tQg0by2VSi6qw5qpYP3X9w==
X-CSE-MsgGUID: sp3uK+7xTXGLaogT5CuSBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65451813"
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; 
   d="scan'208";a="65451813"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 10:19:37 -0800
X-CSE-ConnectionGUID: C5g/bgwjT9SJzucdTZHV9Q==
X-CSE-MsgGUID: T0bdGmprRuW8P2kW+VlRPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; 
   d="scan'208";a="190545919"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 Nov 2025 10:19:35 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vL3p6-0000vV-23;
	Mon, 17 Nov 2025 18:19:32 +0000
Date: Tue, 18 Nov 2025 02:18:33 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [brgl:gpio/for-next 3/11] drivers/gpio/gpiolib-shared.c:62:1:
 warning: 'gpio_shared_find_entry' defined but not used
Message-ID: <202511180232.EItKeYjY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
head:   67f9b828d4e5e47caf3472a399c25c3c0ddc824a
commit: a060b8c511abb0997381b397e52149a5e3e5259a [3/11] gpiolib: implement low-level, shared GPIO support
config: s390-randconfig-r073-20251117 (https://download.01.org/0day-ci/archive/20251118/202511180232.EItKeYjY-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251118/202511180232.EItKeYjY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511180232.EItKeYjY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpio/gpiolib-shared.c:62:1: warning: 'gpio_shared_find_entry' defined but not used [-Wunused-function]
    gpio_shared_find_entry(struct fwnode_handle *controller_node,
    ^~~~~~~~~~~~~~~~~~~~~~


vim +/gpio_shared_find_entry +62 drivers/gpio/gpiolib-shared.c

    60	
    61	static struct gpio_shared_entry *
  > 62	gpio_shared_find_entry(struct fwnode_handle *controller_node,
    63			       unsigned int offset)
    64	{
    65		struct gpio_shared_entry *entry;
    66	
    67		list_for_each_entry(entry, &gpio_shared_list, list) {
    68			if (entry->fwnode == controller_node && entry->offset == offset)
    69				return entry;
    70		}
    71	
    72		return NULL;
    73	}
    74	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

