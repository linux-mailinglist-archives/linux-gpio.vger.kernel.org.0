Return-Path: <linux-gpio+bounces-25335-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB335B3EC55
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 18:38:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7984F2082AE
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 16:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAC39306491;
	Mon,  1 Sep 2025 16:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X8n0/J1R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8B3324B07;
	Mon,  1 Sep 2025 16:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756744624; cv=none; b=P7ourghtYT1K05XyMnbqZcMNdhb7VxIlgpm1lxrZNnvmSGnQwrEcJdMWeKHbE6I3QMwMskFFIHN58PmS/Dikrd1PyBSlt4ffcIue8FRVlr6eC6InlLATfB/hlaPTAjG+HgJJggtRFYf9HneS+G/o6v314WFOkNWz2UVAD1lAicI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756744624; c=relaxed/simple;
	bh=keNSKPuw2F2CZECiinRy3q4cbKeIscOHFCwb7KIcJbs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RQpiKAkZCQgzVr+zHCl1MnoRwmY/7bSSZtf5dBpZhzYMPmPJxm7xRT/+QCRBF3i61iqVMkHuesRzyNJL9GyHknnYY+GlhJQvezUTPou3veQzK6uBj58Zl0jX/mE8Z2zLFnf0SxN6LeKEKS8Gx45bry/Bo+lKtuHuxKTTMEi8d3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X8n0/J1R; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756744623; x=1788280623;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=keNSKPuw2F2CZECiinRy3q4cbKeIscOHFCwb7KIcJbs=;
  b=X8n0/J1Ribxt2/tz13OQkIROMEekSixQkPrwwQExTtOaZJtvrHtH0lH8
   vyo4qxWkoxwliHoEr62V1P1CGr29ah3zEuuC415IFvkPZkUjGWAwDUVSE
   5RfrewP4AMCkud2uv3ZAbzXhARVBX0f8O40u3wzjSkNK9RdaaUCjUGS+H
   2h8dsEk8tukoo5xRXzzwjj3LXFRcc2g1XIFrQtDJZTQUBlkCPzWBJi2NI
   8R2wWlalqxtgOljzLzKZa6ZJ7FtqSsXnv2JYvYI1L7qjoonq60KLhRbOA
   mrAQ3DqjAGMJtKHxd/kAsnYwj7SqfAAHWhGDwL9/S66vqfJ9IA7Nj4NMm
   g==;
X-CSE-ConnectionGUID: vd8nBSvxSqO+E6yYEdLNiA==
X-CSE-MsgGUID: +VdPtS6dQcaX7oPgkYLNxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="81589236"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="81589236"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 09:37:01 -0700
X-CSE-ConnectionGUID: 6L0HCz0tR9eQw2JQTXGv2A==
X-CSE-MsgGUID: 9V1OToB3SDe3bBiM7WSh2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="208263614"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 01 Sep 2025 09:36:57 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ut7Vx-0000oV-0V;
	Mon, 01 Sep 2025 16:36:27 +0000
Date: Tue, 2 Sep 2025 00:35:58 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Tran <alex.t.tran@gmail.com>, broonie@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz,
	shenghao-ding@ti.com, kevin-lu@ti.com, baojun.xu@ti.com,
	linus.walleij@linaro.org, brgl@bgdev.pl,
	linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Alex Tran <alex.t.tran@gmail.com>
Subject: Re: [PATCH v2] ASoC: codecs: tlv320dac33: switch to gpiod api
Message-ID: <202509020014.XuEeJtZr-lkp@intel.com>
References: <20250901035956.1195081-1-alex.t.tran@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901035956.1195081-1-alex.t.tran@gmail.com>

Hi Alex,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on tiwai-sound/for-next tiwai-sound/for-linus linus/master v6.17-rc4 next-20250901]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Tran/ASoC-codecs-tlv320dac33-switch-to-gpiod-api/20250901-120204
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20250901035956.1195081-1-alex.t.tran%40gmail.com
patch subject: [PATCH v2] ASoC: codecs: tlv320dac33: switch to gpiod api
config: loongarch-randconfig-002-20250901 (https://download.01.org/0day-ci/archive/20250902/202509020014.XuEeJtZr-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250902/202509020014.XuEeJtZr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509020014.XuEeJtZr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/tlv320dac33.c:1506:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    1506 |         if (IS_ERR(dac33->reset_gpiod)) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/tlv320dac33.c:1531:9: note: uninitialized use occurs here
    1531 |         return ret;
         |                ^~~
   sound/soc/codecs/tlv320dac33.c:1506:2: note: remove the 'if' if its condition is always false
    1506 |         if (IS_ERR(dac33->reset_gpiod)) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1507 |                 dev_err_probe(&client->dev, PTR_ERR(dac33->reset_gpiod),
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1508 |                               "Failed to get reset GPIO\n");
         |                               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1509 |                 goto err;
         |                 ~~~~~~~~~
    1510 |         }
         |         ~
   sound/soc/codecs/tlv320dac33.c:1477:9: note: initialize the variable 'ret' to silence this warning
    1477 |         int ret, i;
         |                ^
         |                 = 0
   1 warning generated.


vim +1506 sound/soc/codecs/tlv320dac33.c

  1473	
  1474	static int dac33_i2c_probe(struct i2c_client *client)
  1475	{
  1476		struct tlv320dac33_priv *dac33;
  1477		int ret, i;
  1478	
  1479		dac33 = devm_kzalloc(&client->dev, sizeof(struct tlv320dac33_priv),
  1480				     GFP_KERNEL);
  1481		if (dac33 == NULL)
  1482			return -ENOMEM;
  1483	
  1484		dac33->reg_cache = devm_kmemdup_array(&client->dev, dac33_reg, ARRAY_SIZE(dac33_reg),
  1485						      sizeof(dac33_reg[0]), GFP_KERNEL);
  1486		if (!dac33->reg_cache)
  1487			return -ENOMEM;
  1488	
  1489		dac33->i2c = client;
  1490		mutex_init(&dac33->mutex);
  1491		spin_lock_init(&dac33->lock);
  1492	
  1493		i2c_set_clientdata(client, dac33);
  1494	
  1495		if (!dac33->burst_bclkdiv)
  1496			dac33->burst_bclkdiv = 8;
  1497		if (!dac33->mode1_latency)
  1498			dac33->mode1_latency = 10000; /* 10ms */
  1499		dac33->irq = client->irq;
  1500		/* Disable FIFO use by default */
  1501		dac33->fifo_mode = DAC33_FIFO_BYPASS;
  1502	
  1503		/* request optional reset GPIO */
  1504		dac33->reset_gpiod =
  1505			devm_gpiod_get_optional(&client->dev, "reset", GPIOD_OUT_LOW);
> 1506		if (IS_ERR(dac33->reset_gpiod)) {
  1507			dev_err_probe(&client->dev, PTR_ERR(dac33->reset_gpiod),
  1508				      "Failed to get reset GPIO\n");
  1509			goto err;
  1510		}
  1511	
  1512		for (i = 0; i < ARRAY_SIZE(dac33->supplies); i++)
  1513			dac33->supplies[i].supply = dac33_supply_names[i];
  1514	
  1515		ret = devm_regulator_bulk_get(&client->dev, ARRAY_SIZE(dac33->supplies),
  1516					 dac33->supplies);
  1517	
  1518		if (ret != 0) {
  1519			dev_err(&client->dev, "Failed to request supplies: %d\n", ret);
  1520			goto err;
  1521		}
  1522	
  1523		ret = devm_snd_soc_register_component(&client->dev,
  1524				&soc_component_dev_tlv320dac33, &dac33_dai, 1);
  1525		if (ret < 0)
  1526			goto err;
  1527	
  1528		return ret;
  1529	
  1530	err:
  1531		return ret;
  1532	}
  1533	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

