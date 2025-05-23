Return-Path: <linux-gpio+bounces-20536-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ED478AC234A
	for <lists+linux-gpio@lfdr.de>; Fri, 23 May 2025 15:00:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08791A25329
	for <lists+linux-gpio@lfdr.de>; Fri, 23 May 2025 12:59:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 013781420DD;
	Fri, 23 May 2025 12:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EIk8o8b8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0EA049620;
	Fri, 23 May 2025 12:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748005198; cv=none; b=CMnXcvBPGDJz7xI+okvQrfndvSDir5qGU2/rxpaLmvfvTDAJ3qMr+qyYiqll2dYFYZwWeuOx4RCwjBhVfalgbHCySB+TaAOgK+3XJPjiYBheADc+cdHetlYNePxbXKb9GzyY8iCosMjaoIvgPu8S3qz9js9j4zWwzCyKbtWfnE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748005198; c=relaxed/simple;
	bh=8Oii3f2EpE50r9YcogV8EDUUJwl4GHW6cOuBxkjjA80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lB4H1qKkcuC34WAQrhftdPmT1a9yG66Or5/u+lC/QGp66chOJLDI9G2ME9h5M+BxF0D3fjZ9H2jqSpeEMtpGDCl6R1sWAcm7hIyzOXy4PmUoHdnCa/YpfYDN9vZNWgMOFU7g1/EsN+D7ChxYWQd440A2rNFNeTwlNEYIXOpqS+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EIk8o8b8; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748005197; x=1779541197;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8Oii3f2EpE50r9YcogV8EDUUJwl4GHW6cOuBxkjjA80=;
  b=EIk8o8b8FbtsydVr9vD/xHIQQPqFybgbSaOKx23MnKP5Wkga6I88w6Pz
   vbWDLeZfqBq1MF1ixQiVQC6kddmR5E4+stugg53SW7baO+bewOETq6zW6
   8op++gavux3QgPL97i7bqarzI41+e/7iRxWsTOcsYHXZdV8VnexuSEiTM
   nx3EgDeMR1QFrHU5XFmefjBfakiBnh+4POJqpSxhsr7eLayGSmOGkBLxF
   6y0QmLkVimef/k0PaXCD+jEh8I9AIR6qBymfpvb05wmvX4qxP4tKRt7YN
   BNQGMQRDavQVmuac2Rqjy6w+48avhsl2nOG18IfJPnZ67XvVRBFHJmTAd
   Q==;
X-CSE-ConnectionGUID: ReCGIyeaQMOMuqzyEei87g==
X-CSE-MsgGUID: ReNfqDedRHqzmcoeyAExlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50114861"
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; 
   d="scan'208";a="50114861"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 05:59:56 -0700
X-CSE-ConnectionGUID: R0SfHCEYSQGGhBW06eSNNQ==
X-CSE-MsgGUID: 4WRagGqCRoWo4F1rbnk8EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; 
   d="scan'208";a="146123824"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 23 May 2025 05:59:51 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIS05-000QOa-1H;
	Fri, 23 May 2025 12:59:49 +0000
Date: Fri, 23 May 2025 20:59:15 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Klimov <alexey.klimov@linaro.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 06/12] ASoC: codecs: add wsa881x-i2c amplifier codec
 driver
Message-ID: <202505232000.eTkDhRzd-lkp@intel.com>
References: <20250522-rb2_audio_v3-v3-6-9eeb08cab9dc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522-rb2_audio_v3-v3-6-9eeb08cab9dc@linaro.org>

Hi Alexey,

kernel test robot noticed the following build errors:

[auto build test ERROR on 7bac2c97af4078d7a627500c9bcdd5b033f97718]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexey-Klimov/ASoC-dt-bindings-qcom-Add-SM6115-LPASS-rxmacro-and-vamacro-codecs/20250523-014432
base:   7bac2c97af4078d7a627500c9bcdd5b033f97718
patch link:    https://lore.kernel.org/r/20250522-rb2_audio_v3-v3-6-9eeb08cab9dc%40linaro.org
patch subject: [PATCH v3 06/12] ASoC: codecs: add wsa881x-i2c amplifier codec driver
config: x86_64-buildonly-randconfig-004-20250523 (https://download.01.org/0day-ci/archive/20250523/202505232000.eTkDhRzd-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250523/202505232000.eTkDhRzd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505232000.eTkDhRzd-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> sound/soc/codecs/wsa881x-i2c.c:555:5: warning: variable 'reg_addr' set but not used [-Wunused-but-set-variable]
     555 |         u8 reg_addr = 0;
         |            ^
>> sound/soc/codecs/wsa881x-i2c.c:1263:24: error: cannot assign to non-static data member 'driver' with const-qualified type 'const struct snd_soc_component_driver *'
    1263 |         wsa881x->driver->name = devm_kasprintf(dev, GFP_KERNEL, "wsa-codec%d",
         |         ~~~~~~~~~~~~~~~~~~~~~ ^
   sound/soc/codecs/wsa881x-common.h:260:41: note: non-static data member 'driver' declared const here
     260 |         const struct snd_soc_component_driver *driver;
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   1 warning and 1 error generated.


vim +1263 sound/soc/codecs/wsa881x-i2c.c

  1171	
  1172	static int wsa881x_i2c_probe(struct i2c_client *client)
  1173	{
  1174		struct device *dev = &client->dev;
  1175		struct wsa881x_priv *wsa881x;
  1176		int leftright;
  1177		int ret;
  1178	
  1179		ret = wsa881x_probe_common(&wsa881x, dev);
  1180		if (ret)
  1181			return ret;
  1182	
  1183		wsa881x->mclk_pin = devm_gpiod_get(dev, "mclk",
  1184						   GPIOD_FLAGS_BIT_NONEXCLUSIVE);
  1185		if (IS_ERR(wsa881x->mclk_pin))
  1186			dev_err_probe(dev, PTR_ERR(wsa881x->mclk_pin),
  1187				      "MCLK GPIO not found\n");
  1188	
  1189		wsa881x->wsa_mclk = devm_clk_get_enabled(&client->dev, NULL);
  1190		if (IS_ERR(wsa881x->wsa_mclk))
  1191			return dev_err_probe(dev, PTR_ERR(wsa881x->wsa_mclk),
  1192					     "failed to get mclk\n");
  1193		gpiod_direction_output(wsa881x->mclk_pin, 1);
  1194		clk_set_rate(wsa881x->wsa_mclk, 9600000);
  1195	
  1196		wsa881x->client[DIGITAL] = client;
  1197		ret = check_wsa881x_presence(wsa881x);
  1198		if (ret < 0) {
  1199			dev_err(&client->dev,
  1200				"failed to ping wsa with addr:%x, ret = %d\n",
  1201				client->addr, ret);
  1202			return -ENODEV;
  1203		}
  1204	
  1205		wsa881x->regmap = devm_regmap_init_i2c(client,
  1206						&wsa881x_ana_regmap_config[DIGITAL]);
  1207		if (IS_ERR(wsa881x->regmap)) {
  1208			dev_err(dev, "digital regmap init failed %d\n", ret);
  1209			return PTR_ERR(wsa881x->regmap);
  1210		}
  1211		regcache_cache_bypass(wsa881x->regmap, true);
  1212	
  1213		wsa881x_init_common(wsa881x);
  1214	
  1215		wsa881x->version = wsa881x_i2c_read_device(wsa881x, WSA881X_CHIP_ID1);
  1216		if (wsa881x->version == WSA881X_2_0) {
  1217			wsa881x_update_reg_defaults_2_0();
  1218			wsa881x_update_regmap_2_0(wsa881x->regmap, DIGITAL);
  1219		}
  1220	
  1221		/*
  1222		 * If we reached this point, then device is present and we're good to
  1223		 * go to initialise analog part of the amplifier
  1224		 */
  1225		wsa881x->client[ANALOG] = devm_i2c_new_dummy_device(&client->dev,
  1226								    client->adapter,
  1227						client->addr + I2C_ANALOG_OFFSET);
  1228		if (IS_ERR(wsa881x->client[ANALOG])) {
  1229			dev_err(dev,
  1230				"failed to register i2c device for analog part\n");
  1231			return PTR_ERR(wsa881x->client[ANALOG]);
  1232		}
  1233	
  1234		wsa881x->regmap_analog = devm_regmap_init_i2c(wsa881x->client[ANALOG],
  1235						&wsa881x_ana_regmap_config[ANALOG]);
  1236		if (IS_ERR(wsa881x->regmap_analog)) {
  1237			dev_err(dev, "analog regmap init failed %d\n", ret);
  1238			return PTR_ERR(wsa881x->regmap_analog);
  1239		}
  1240		regcache_cache_bypass(wsa881x->regmap_analog, true);
  1241	
  1242		wsa881x->client[ANALOG]->dev.platform_data = wsa881x;
  1243		i2c_set_clientdata(wsa881x->client[ANALOG], wsa881x);
  1244		wsa881x->regmap_flag = true;
  1245	
  1246		if (wsa881x->version == WSA881X_2_0)
  1247			wsa881x_update_regmap_2_0(wsa881x->regmap_analog, ANALOG);
  1248		/* finished initialising analog part */
  1249	
  1250		leftright = wsa881x_i2c_read_device(wsa881x, WSA881X_BUS_ID) & 0x1;
  1251	
  1252		wsa881x->driver = devm_kmemdup(dev, &soc_codec_dev_wsa881x,
  1253					       sizeof(*wsa881x->driver), GFP_KERNEL);
  1254		if (!wsa881x->driver)
  1255			return -ENOMEM;
  1256	
  1257		wsa881x->dai_driver = devm_kmemdup(dev, wsa_dai,
  1258						   sizeof(struct snd_soc_dai_driver),
  1259						   GFP_KERNEL);
  1260		if (!wsa881x->dai_driver)
  1261			return -ENOMEM;
  1262	
> 1263		wsa881x->driver->name = devm_kasprintf(dev, GFP_KERNEL, "wsa-codec%d",
  1264						       leftright);
  1265		if (!wsa881x->driver->name)
  1266			return -ENOMEM;
  1267	
  1268		wsa881x->dai_driver->name = devm_kasprintf(dev, GFP_KERNEL,
  1269							   "wsa_rx%d", leftright);
  1270		if (!wsa881x->dai_driver->name)
  1271			return -ENOMEM;
  1272	
  1273		wsa881x->dai_driver->playback.stream_name = devm_kasprintf(dev,
  1274						GFP_KERNEL, "WSA881X_AIF%d Playback",
  1275						leftright);
  1276		if (!wsa881x->dai_driver->playback.stream_name)
  1277			return -ENOMEM;
  1278	
  1279		pm_runtime_set_autosuspend_delay(dev, 3000);
  1280		pm_runtime_use_autosuspend(dev);
  1281		pm_runtime_mark_last_busy(dev);
  1282		pm_runtime_set_active(dev);
  1283		pm_runtime_enable(dev);
  1284	
  1285		return devm_snd_soc_register_component(dev,
  1286						       wsa881x->driver,
  1287						       wsa881x->dai_driver,
  1288						       ARRAY_SIZE(wsa_dai));
  1289	}
  1290	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

