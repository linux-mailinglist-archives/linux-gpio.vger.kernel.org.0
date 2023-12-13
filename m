Return-Path: <linux-gpio+bounces-1338-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1858106EE
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 01:48:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E27A1C20D73
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 00:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0886FA49;
	Wed, 13 Dec 2023 00:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dMtpTAmh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7A5D99;
	Tue, 12 Dec 2023 16:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702428501; x=1733964501;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QZwgJx1UZkImcvYR1/1lBCiVrQ6yZ06VKsgvip+6rxU=;
  b=dMtpTAmh44gYCiccQjy/rz00rqezmtZ0QwHsKLRo/AixQwqxk2hBM6rs
   dhUzvTtjsOfOBbtywg+EeXnTcpp7PT3AWaPnYq5cs5lJ5LFA1/75JWp+k
   JN7KTyPrJOBEch+2qfHKX0YZyjIZ8H2NukE3QHPm6fR2yEiKzZ0blekER
   6UOqx1TvdIR9A3AvXuxCa77ifHQmKMhj5GCIkNwjj6CVITZk6hMVolgu4
   XK74U3WEsPIfhLQQ74Mg+lCBS5N7aiM+JRDjm4qsb3lVbgsectp/Pi7YU
   eyHh7heWkPIDrD+kqDBY4/UWRllssCkskbY6rnLB1xhUDaPCZsESteJX3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="1974332"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; 
   d="scan'208";a="1974332"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 16:48:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="946987130"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; 
   d="scan'208";a="946987130"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 12 Dec 2023 16:48:16 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDDQ6-000JvK-0Q;
	Wed, 13 Dec 2023 00:48:14 +0000
Date: Wed, 13 Dec 2023 08:48:00 +0800
From: kernel test robot <lkp@intel.com>
To: Tomer Maimon <tmaimon77@gmail.com>, arnd@arndb.de,
	pmenzel@molgen.mpg.de, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	avifishman70@gmail.com, tali.perry1@gmail.com, joel@jms.id.au,
	venture@google.com, yuenn@google.com, benjaminfair@google.com,
	j.neuschaefer@gmx.net
Cc: oe-kbuild-all@lists.linux.dev, openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v2 3/3] soc: nuvoton: add NPCM BPC driver
Message-ID: <202312130836.kt5QMxGM-lkp@intel.com>
References: <20231212100703.3374555-4-tmaimon77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231212100703.3374555-4-tmaimon77@gmail.com>

Hi Tomer,

kernel test robot noticed the following build warnings:

[auto build test WARNING on soc/for-next]
[also build test WARNING on robh/for-next linus/master v6.7-rc5 next-20231212]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tomer-Maimon/dt-bindings-soc-nuvoton-Add-NPCM-BPC/20231212-181115
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20231212100703.3374555-4-tmaimon77%40gmail.com
patch subject: [PATCH v2 3/3] soc: nuvoton: add NPCM BPC driver
config: arm64-randconfig-r112-20231213 (https://download.01.org/0day-ci/archive/20231213/202312130836.kt5QMxGM-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20231213/202312130836.kt5QMxGM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312130836.kt5QMxGM-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/soc/nuvoton/npcm-bpc.c:105:22: sparse: sparse: invalid assignment: |=
>> drivers/soc/nuvoton/npcm-bpc.c:105:22: sparse:    left side has type restricted __poll_t
>> drivers/soc/nuvoton/npcm-bpc.c:105:22: sparse:    right side has type int
   drivers/soc/nuvoton/npcm-bpc.c:108:22: sparse: sparse: invalid assignment: |=
   drivers/soc/nuvoton/npcm-bpc.c:108:22: sparse:    left side has type restricted __poll_t
   drivers/soc/nuvoton/npcm-bpc.c:108:22: sparse:    right side has type int

vim +105 drivers/soc/nuvoton/npcm-bpc.c

    97	
    98	static __poll_t npcm_bpc_poll(struct file *file, struct poll_table_struct *pt)
    99	{
   100		struct npcm_bpc_channel *chan = npcm_file_to_ch(file);
   101		__poll_t mask = 0;
   102	
   103		poll_wait(file, &chan->wq, pt);
   104		if (!kfifo_is_empty(&chan->fifo))
 > 105			mask |= POLLIN;
   106	
   107		if (chan->host_reset) {
   108			mask |= POLLHUP;
   109			chan->host_reset = false;
   110		}
   111	
   112		return mask;
   113	}
   114	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

