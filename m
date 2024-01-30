Return-Path: <linux-gpio+bounces-2766-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A0C843107
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 00:18:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 78B911C2430E
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jan 2024 23:18:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CBD578B67;
	Tue, 30 Jan 2024 23:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GjKBs5Ab"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28E1762E7
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jan 2024 23:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706656605; cv=none; b=BBgr5pFKV01v24mY9U+7jRcGRwbOVgLIjfvFX0znHiVYAe4NAlH+MtqCViHX0MMNS+uD3LHks379vFWHkcYmQb5LQf3S4Zeig69ZZgmkgs/FHTE5VOtUzjMp8z6qGdwk4M6pUN8hn7AFNsDQQZycxAZChYa2fIX8DRQKyAFIUdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706656605; c=relaxed/simple;
	bh=1X0HrQt6EpwaTegUwK9T+Rbbn8dS2jupjrnSD2jmzJs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KE9FA3tBHzFJW/eSS4RECmci2mma48peX+F1fNF81lk5JDDAI3nWoMWNlHHGYaIACaFUWishT2DZW1XjcoG9gzbO+TdR+IrCS/z9TE0c/D0MOedQKsSoixd5JNrFZz9gy3WxA1F9jdc/M+6Kx2ER34nA259vnAHjonzH41DPu+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GjKBs5Ab; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706656603; x=1738192603;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1X0HrQt6EpwaTegUwK9T+Rbbn8dS2jupjrnSD2jmzJs=;
  b=GjKBs5AbIGyy5+lOotMrWxnuDxjUWF1kkDznIBX1E7xU9vuLFKzOOgJU
   RmVlCNkDBpl5thm0PDoxQwLS+9/NvWkAZitUMwiz5GfRKtN3LC5T4yQMJ
   Y/997UyTrgZjauj1w0S5/sUs76sfQwxEi4xUtVRXOWfcM+khqs0lnrBL4
   wlC2iT2r79iIhrgZ/g6RbtMtyj2iS3PSjqz+/mwiK5V/tx6POqtxFvwke
   w81E3OaHKgS2A4HmFu4GpAqmMDFJPsTdj6/0Q67/5PFjDZleoVUcuRnoj
   mpZGNrU6GxsS0Cly7zrBPlT+5SkdjRoUeFsgXgyJVgDdog9dGMcOE6Ko3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10807118"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="10807118"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 15:16:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="3880849"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 30 Jan 2024 15:16:40 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUxLK-0000vU-0N;
	Tue, 30 Jan 2024 23:16:38 +0000
Date: Wed, 31 Jan 2024 07:16:19 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org
Subject: [linusw-gpio:b4/descriptors-wireless 2/7]
 drivers/net/wireless/ath/ath9k/hw.c:2731:2: error: must use 'struct' tag to
 refer to type 'gpio_desc'
Message-ID: <202401310721.pDBU6qLV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git b4/descriptors-wireless
head:   99b6016595e9254167434ef82f4c2ed88d986452
commit: 0dd7ce9e2be9a81dc04549e8e604931c19547531 [2/7] wifi: ath9k: Obtain system GPIOS from descriptors
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20240131/202401310721.pDBU6qLV-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project fdac7d0b6f74f919d319b31a0680c77f66732586)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240131/202401310721.pDBU6qLV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401310721.pDBU6qLV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/wireless/ath/ath9k/hw.c:2731:2: error: must use 'struct' tag to refer to type 'gpio_desc'
    2731 |         gpio_desc *gpiod;
         |         ^
         |         struct 
>> drivers/net/wireless/ath/ath9k/hw.c:2734:10: error: no member named 'gpiods' in 'struct ath_hw'
    2734 |         if (ah->gpiods[gpio])
         |             ~~  ^
   drivers/net/wireless/ath/ath9k/hw.c:2748:6: error: no member named 'gpiods' in 'struct ath_hw'
    2748 |         ah->gpiods[gpio] = gpiod;
         |         ~~  ^
   drivers/net/wireless/ath/ath9k/hw.c:2836:17: error: no member named 'gpiods' in 'struct ath_hw'
    2836 |         } else if (ah->gpiods[gpio]) {
         |                    ~~  ^
   drivers/net/wireless/ath/ath9k/hw.c:2837:29: error: no member named 'gpiods' in 'struct ath_hw'
    2837 |                 val = gpiod_get_value(ah->gpiods[gpio]);
         |                                       ~~  ^
   drivers/net/wireless/ath/ath9k/hw.c:2860:17: error: no member named 'gpiods' in 'struct ath_hw'
    2860 |         } else if (ah->gpiods[gpio]) {
         |                    ~~  ^
   drivers/net/wireless/ath/ath9k/hw.c:2861:23: error: no member named 'gpiods' in 'struct ath_hw'
    2861 |                 gpiod_set_value(ah->gpiods[gpio], val);
         |                                 ~~  ^
   7 errors generated.


vim +2731 drivers/net/wireless/ath/ath9k/hw.c

  2724	
  2725	/* BSP should set the corresponding MUX register correctly.
  2726	 */
  2727	static void ath9k_hw_gpio_cfg_soc(struct ath_hw *ah, u32 gpio, bool out,
  2728					  const char *label)
  2729	{
  2730		enum gpiod_flags flags = out ? GPIOD_OUT_LOW : GPIOD_IN;
> 2731		gpio_desc *gpiod;
  2732		int err;
  2733	
> 2734		if (ah->gpiods[gpio])
  2735			return;
  2736	
  2737		/* Obtains a system specific GPIO descriptor from another GPIO controller */
  2738		gpiod = devm_gpiod_get_index(ah->dev, NULL, gpio, flags);
  2739	
  2740		if (IS_ERR(gpiod)) {
  2741			err = PTR_ERR(gpiod);
  2742			ath_err(ath9k_hw_common(ah), "request GPIO%d failed:%d\n",
  2743				gpio, err);
  2744			return;
  2745		}
  2746	
  2747		gpiod_set_consumer_name(gpiod, label);
  2748		ah->gpiods[gpio] = gpiod;
  2749	}
  2750	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

