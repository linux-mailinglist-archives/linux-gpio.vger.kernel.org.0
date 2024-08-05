Return-Path: <linux-gpio+bounces-8586-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80645947B8F
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2024 15:09:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 003001F23324
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2024 13:09:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACFA3156C74;
	Mon,  5 Aug 2024 13:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="caOV8dTC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D5618026
	for <linux-gpio@vger.kernel.org>; Mon,  5 Aug 2024 13:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722863344; cv=none; b=oY9DYyQclBQg8zp2J1y3EG0taCPXNzlTCkvR+JOfqZSJEVfeG0tws9gcfaAmnwIwe6AiLSjNCQGs4e4h5EMRjON4zUnmX+XvKOWcIUlEE2hJMt+2lh7K1ZLKOD5obRgj29ug5TXQHhJ8K96tVopYFjr1H6aAw4VMJ676GQ76new=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722863344; c=relaxed/simple;
	bh=er6EUPhG9WCgRFfOrp5TRDg5h5HuNZFBGgHfc885Ec0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IiX7vTePr0gvlAS9IZaTyePyfOm1my+QDN5zVxpfDRyWvsZLTi8JlUW88rzzQ1fA6obw6B5Jwni16uN17CCtoYMzyc5Y2AO6Ah7waKvFWgqv7O27T6sTeUpVtA7mc2MHaVMzyGQfSpTTt38NMm1vgaKuN01bzAZW3Z1rLASIKDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=caOV8dTC; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722863342; x=1754399342;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=er6EUPhG9WCgRFfOrp5TRDg5h5HuNZFBGgHfc885Ec0=;
  b=caOV8dTCr+K6OJ7piWuWZfR6b2A9WJetPW8WpuVz9eimDRQehAi3Fcz1
   2UqR/PeC2gWBvSx/wYCIVaf3zPcOuK7Cu5SOrNIQmFpNMWAbs6C52Tb4K
   +KVq0ze9HkDbtsnB2OZf4J2/PGF5N1dDu7ooJQN7PpAdTdYtk+HzU7Ylf
   VEeHcomVXGNzeou9ng8zuLioKUdSU0l7BSGjRe+wjPaotYTHp3GuAjJiv
   vqQSlAufPX01hnor1g/BmO2CQ1mF/ZPx6D1nSsvTbj/lcxT3jf0jERAD6
   lJSmChBlqXuU6xcnRrkR0UXFRcBw9Lq55WTjcAOaC4yHfIwsRWCVBfu5Y
   Q==;
X-CSE-ConnectionGUID: IGZLoeCKSG+PgQYYJorSpg==
X-CSE-MsgGUID: tOEKdWQfS8W+uTPzuNCZDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="21002721"
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; 
   d="scan'208";a="21002721"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2024 06:09:02 -0700
X-CSE-ConnectionGUID: V31x6G2rSGOP20JOq+wo6A==
X-CSE-MsgGUID: Guzy1UKHTwiwBpBaJ9yOTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; 
   d="scan'208";a="56089287"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 05 Aug 2024 06:09:01 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1saxSM-0002Pk-0l;
	Mon, 05 Aug 2024 13:08:58 +0000
Date: Mon, 5 Aug 2024 21:01:28 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: [linusw-gpio:b4/asoc-tas-gpios 2/4]
 sound/soc/codecs/tas2781-i2c.c:786:25: error: 'struct tasdevice_priv' has no
 member named 'irq_info'
Message-ID: <202408052045.Xpi6dIIm-lkp@intel.com>
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
config: arm-randconfig-001-20240805 (https://download.01.org/0day-ci/archive/20240805/202408052045.Xpi6dIIm-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240805/202408052045.Xpi6dIIm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408052045.Xpi6dIIm-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/codecs/tas2781-i2c.c: In function 'tasdevice_parse_dt':
>> sound/soc/codecs/tas2781-i2c.c:786:25: error: 'struct tasdevice_priv' has no member named 'irq_info'
     786 |                 tas_priv->irq_info.irq_gpio = of_irq_get(np, 0);
         |                         ^~


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

