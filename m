Return-Path: <linux-gpio+bounces-20112-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8D7AB6341
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 08:37:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CE224A2C0C
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 06:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C73DA20102C;
	Wed, 14 May 2025 06:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IhdMpq3V"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBDE1EE7DD;
	Wed, 14 May 2025 06:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747204642; cv=none; b=e4itvZstgLXr3QpQEJ7YG1QFb4kr/zEs+nFe2ZxOuoM4AAX6ONh83KUd0chq4mcldj5FzXkrhYy1gM/1woWOKTzjZBwNyFtXl9Ty3ugbbLyW+jn+Hg0l1WpqkJ8i+3Wr6Znk7+ST6HiM5pvUhA9L9RhwYET5AuUxpF1V1rbcP5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747204642; c=relaxed/simple;
	bh=RbhXtIrRhBy0RlZvUxz2MFpP+1FzxdT29n2jIZIigBw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m8LpVl8RGGc54w0YbkjlveTyQB5uOYdQTo6+gWOiNVt7EvJkfLIBez1cq2O3W2OfvvBEqeqN3mGfu/53AQ7GKchwzUYmIJjage1dSNrovQSYIml6qm6TSA/ttyyLAft0sYCgXTEK5OzbE0sgS2fYFFQuzn0m7QvFk7vuDjf4NMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IhdMpq3V; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747204638; x=1778740638;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RbhXtIrRhBy0RlZvUxz2MFpP+1FzxdT29n2jIZIigBw=;
  b=IhdMpq3Voa7r5QCYzJSq++bWEH9z+3mKbaNvN3sE7pZHOM9JSp7q7W3Q
   QJzp4xTxVjP+XnBmDXslw+yvAsxZIGbAcR4NFydD7xH9yon6XgOOy2H/T
   EPyjAnraue+UoVOZKWGnc/eziCn0KamipGcJ0Z+ABR72F/P/Kq2PR5Kn0
   VitTS5zHqdAwOG5ZttxzsxDAkGVQiFU8uzTCc+q/Lf3pA/46T6pnvs3rR
   W+HAjdx9TjodYVuM5gMer1S8NHcH7y67SgZVcaMlfcw7/P3zgtn2TLgZ+
   wFOiQiJg9iXQlq8wWBmbw29czDpvALWutCv1RJUpiELm2T7OyL8KPH2zl
   w==;
X-CSE-ConnectionGUID: t7tFbuXlRmit2KlkZzpHMQ==
X-CSE-MsgGUID: fF2uK/t8Q7uyLXLEiVRMCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="52747828"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="52747828"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 23:37:17 -0700
X-CSE-ConnectionGUID: jF0NRkM1Tmy83oc6fZJjmw==
X-CSE-MsgGUID: YDOIw/whQ1q72UtK/u//TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="175062780"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 May 2025 23:37:14 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uF5js-000GlD-0A;
	Wed, 14 May 2025 06:37:12 +0000
Date: Wed, 14 May 2025 14:36:30 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Esben Haabendal <esben@geanix.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] pinctrl: freescale: Enable driver if platform is
 enabled.
Message-ID: <202505141457.fMT8QfVq-lkp@intel.com>
References: <20250513150010.600656-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513150010.600656-1-alexander.stein@ew.tq-group.com>

Hi Alexander,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linusw-pinctrl/devel]
[also build test WARNING on linusw-pinctrl/for-next linus/master v6.15-rc6 next-20250513]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Stein/pinctrl-freescale-Enable-driver-if-platform-is-enabled/20250513-230259
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20250513150010.600656-1-alexander.stein%40ew.tq-group.com
patch subject: [PATCH v2 1/1] pinctrl: freescale: Enable driver if platform is enabled.
config: alpha-kismet-CONFIG_PINCTRL_IMX-CONFIG_PINCTRL_IMX_SCU-0-0 (https://download.01.org/0day-ci/archive/20250514/202505141457.fMT8QfVq-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250514/202505141457.fMT8QfVq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505141457.fMT8QfVq-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PINCTRL_IMX when selected by PINCTRL_IMX_SCU
   WARNING: unmet direct dependencies detected for PINCTRL_IMX
     Depends on [n]: PINCTRL [=y] && OF [=n]
     Selected by [y]:
     - PINCTRL_IMX_SCU [=y] && PINCTRL [=y] && (IMX_SCU [=y] || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

