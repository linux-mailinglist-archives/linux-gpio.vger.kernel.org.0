Return-Path: <linux-gpio+bounces-8587-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 300D0947DA6
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2024 17:06:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9A226B24221
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2024 15:06:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CA2513C683;
	Mon,  5 Aug 2024 15:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DyVSBq5v"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1054F13A268
	for <linux-gpio@vger.kernel.org>; Mon,  5 Aug 2024 15:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722870381; cv=none; b=CFy2/hBkbiLGr3UHQDG4iVO1dyaJtftpZa4vmMN3F1i750+yw6sZCIkx5puCVvHJMp2DU6JyUKjz9UKRIlANqDL547br+STBBL9bdwKDOXyEsZ6M5TPsMe8LMswik9L0Y9cRD9Ut6gcAl+VkVifckpM/OSyK0aP54gjEz3TZIDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722870381; c=relaxed/simple;
	bh=j9pVi1haEyKvjtYmkWH1sxVBzws4x/02E4t0vRM4zws=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RIxtmpgvWpUyIbcv1KV1kjwCeNXzhuafBEKzArGCYrNclxWKCS2ByR02+WyxtWqYSn7YkwJMHsRgu3NMB0UpUMtp4iKBxO3ftXuz0fJZSZhCrz8EnQ/HVUaWTcxuUcg5OnwIV8kGdoixg5rAWp46MlGLYqb3TBGU69pXhmeKapc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DyVSBq5v; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722870379; x=1754406379;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j9pVi1haEyKvjtYmkWH1sxVBzws4x/02E4t0vRM4zws=;
  b=DyVSBq5vllIMitpewtWOinaKib4D74TK0p0MGcf7gtffBdg1Zb5o8ODF
   0omJmR1OeJ27KejwmsqpfJhRdxJSm0fdTzm6jnxsCey7YKjNs+N9V5DpL
   qxPDEp41RL2eXcW0GFMc0uwTzoAv92rTtr6oHESblzUdRTUuDW4ZNlgWF
   PH/2vlWF3QO/GPxWvdReN0rzWC+9WUJkIjJi/EF1JWccnoxNTcMQ4pIEo
   obtjzcoPN5uYYu091xnuX3AgvSoFWKlDqdrzb0aEEEDSxZShMRV/12af7
   8fRrsnv9NvWoP44sVAc5pvFEa33nCQbnkzVZ/BuE9onEu4yYMRa5yI0cB
   Q==;
X-CSE-ConnectionGUID: c0877G97SzywMkkBmvNxqw==
X-CSE-MsgGUID: oU00K6HvSOmPoQJct3KkYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="20654089"
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; 
   d="scan'208";a="20654089"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2024 08:06:03 -0700
X-CSE-ConnectionGUID: A+IfD5IsSGSHVBoKM4MStA==
X-CSE-MsgGUID: DrwoNvpTTwKHuvytqLE2wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; 
   d="scan'208";a="60813702"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 05 Aug 2024 08:05:53 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sazHS-0002t6-1Q;
	Mon, 05 Aug 2024 15:05:50 +0000
Date: Mon, 5 Aug 2024 23:04:56 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org
Subject: [linusw-gpio:b4/asoc-tas-gpios 2/4]
 sound/soc/codecs/tas2781-i2c.c:786:13: error: no member named 'irq_info' in
 'struct tasdevice_priv'
Message-ID: <202408052250.05n5ih5t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git b4/asoc-tas-gpios
head:   fdef6b7abff7f4cfe98c3bc496210885c9b26292
commit: 30316639286278a6d196a3f71c0f6e09c5850bbe [2/4] ASoC: tas2781-i2c: Drop weird GPIO code
config: arm-randconfig-003-20240805 (https://download.01.org/0day-ci/archive/20240805/202408052250.05n5ih5t-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 423aec6573df4424f90555468128e17073ddc69e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240805/202408052250.05n5ih5t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408052250.05n5ih5t-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from sound/soc/codecs/tas2781-i2c.c:19:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> sound/soc/codecs/tas2781-i2c.c:786:13: error: no member named 'irq_info' in 'struct tasdevice_priv'
     786 |                 tas_priv->irq_info.irq_gpio = of_irq_get(np, 0);
         |                 ~~~~~~~~  ^
   1 warning and 1 error generated.


vim +786 sound/soc/codecs/tas2781-i2c.c

ef3bcde75d06d6 Shenghao Ding     2023-06-18  754  
ef3bcde75d06d6 Shenghao Ding     2023-06-18  755  static void tasdevice_parse_dt(struct tasdevice_priv *tas_priv)
ef3bcde75d06d6 Shenghao Ding     2023-06-18  756  {
ef3bcde75d06d6 Shenghao Ding     2023-06-18  757  	struct i2c_client *client = (struct i2c_client *)tas_priv->client;
ef3bcde75d06d6 Shenghao Ding     2023-06-18  758  	unsigned int dev_addrs[TASDEVICE_MAX_CHANNELS];
30316639286278 Linus Walleij     2024-06-30  759  	int i, ndev = 0;
ef3bcde75d06d6 Shenghao Ding     2023-06-18  760  
ef3bcde75d06d6 Shenghao Ding     2023-06-18  761  	if (tas_priv->isacpi) {
ef3bcde75d06d6 Shenghao Ding     2023-06-18  762  		ndev = device_property_read_u32_array(&client->dev,
ef3bcde75d06d6 Shenghao Ding     2023-06-18  763  			"ti,audio-slots", NULL, 0);
ef3bcde75d06d6 Shenghao Ding     2023-06-18  764  		if (ndev <= 0) {
ef3bcde75d06d6 Shenghao Ding     2023-06-18  765  			ndev = 1;
ef3bcde75d06d6 Shenghao Ding     2023-06-18  766  			dev_addrs[0] = client->addr;
ef3bcde75d06d6 Shenghao Ding     2023-06-18  767  		} else {
ef3bcde75d06d6 Shenghao Ding     2023-06-18  768  			ndev = (ndev < ARRAY_SIZE(dev_addrs))
ef3bcde75d06d6 Shenghao Ding     2023-06-18  769  				? ndev : ARRAY_SIZE(dev_addrs);
ef3bcde75d06d6 Shenghao Ding     2023-06-18  770  			ndev = device_property_read_u32_array(&client->dev,
ef3bcde75d06d6 Shenghao Ding     2023-06-18  771  				"ti,audio-slots", dev_addrs, ndev);
ef3bcde75d06d6 Shenghao Ding     2023-06-18  772  		}
ef3bcde75d06d6 Shenghao Ding     2023-06-18  773  
30316639286278 Linus Walleij     2024-06-30  774  		tas_priv->irq =
ef3bcde75d06d6 Shenghao Ding     2023-06-18  775  			acpi_dev_gpio_irq_get(ACPI_COMPANION(&client->dev), 0);
31a45f9190b5b4 Rob Herring (Arm  2024-07-02  776) 	} else if (IS_ENABLED(CONFIG_OF)) {
ef3bcde75d06d6 Shenghao Ding     2023-06-18  777  		struct device_node *np = tas_priv->dev->of_node;
31a45f9190b5b4 Rob Herring (Arm  2024-07-02  778) 		u64 addr;
31a45f9190b5b4 Rob Herring (Arm  2024-07-02  779) 
31a45f9190b5b4 Rob Herring (Arm  2024-07-02  780) 		for (i = 0; i < TASDEVICE_MAX_CHANNELS; i++) {
31a45f9190b5b4 Rob Herring (Arm  2024-07-02  781) 			if (of_property_read_reg(np, i, &addr, NULL))
31a45f9190b5b4 Rob Herring (Arm  2024-07-02  782) 				break;
31a45f9190b5b4 Rob Herring (Arm  2024-07-02  783) 			dev_addrs[ndev++] = addr;
ef3bcde75d06d6 Shenghao Ding     2023-06-18  784  		}
31a45f9190b5b4 Rob Herring (Arm  2024-07-02  785) 
31a45f9190b5b4 Rob Herring (Arm  2024-07-02 @786) 		tas_priv->irq_info.irq_gpio = of_irq_get(np, 0);
31a45f9190b5b4 Rob Herring (Arm  2024-07-02  787) 	} else {
ef3bcde75d06d6 Shenghao Ding     2023-06-18  788  		ndev = 1;
ef3bcde75d06d6 Shenghao Ding     2023-06-18  789  		dev_addrs[0] = client->addr;
ef3bcde75d06d6 Shenghao Ding     2023-06-18  790  	}
ef3bcde75d06d6 Shenghao Ding     2023-06-18  791  	tas_priv->ndev = ndev;
ef3bcde75d06d6 Shenghao Ding     2023-06-18  792  	for (i = 0; i < ndev; i++)
ef3bcde75d06d6 Shenghao Ding     2023-06-18  793  		tas_priv->tasdevice[i].dev_addr = dev_addrs[i];
ef3bcde75d06d6 Shenghao Ding     2023-06-18  794  
ef3bcde75d06d6 Shenghao Ding     2023-06-18  795  	tas_priv->reset = devm_gpiod_get_optional(&client->dev,
ef3bcde75d06d6 Shenghao Ding     2023-06-18  796  			"reset-gpios", GPIOD_OUT_HIGH);
ef3bcde75d06d6 Shenghao Ding     2023-06-18  797  	if (IS_ERR(tas_priv->reset))
ef3bcde75d06d6 Shenghao Ding     2023-06-18  798  		dev_err(tas_priv->dev, "%s Can't get reset GPIO\n",
ef3bcde75d06d6 Shenghao Ding     2023-06-18  799  			__func__);
ef3bcde75d06d6 Shenghao Ding     2023-06-18  800  
ef3bcde75d06d6 Shenghao Ding     2023-06-18  801  	strcpy(tas_priv->dev_name, tasdevice_id[tas_priv->chip_id].name);
ef3bcde75d06d6 Shenghao Ding     2023-06-18  802  }
ef3bcde75d06d6 Shenghao Ding     2023-06-18  803  

:::::: The code at line 786 was first introduced by commit
:::::: 31a45f9190b5b4f5cd8cdec8471babd5215eee04 ASoC: tas2781: Use of_property_read_reg()

:::::: TO: Rob Herring (Arm) <robh@kernel.org>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

