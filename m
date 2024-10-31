Return-Path: <linux-gpio+bounces-12397-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 872539B82B5
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 19:41:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 476B62830DD
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 18:41:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68AE11C9DD5;
	Thu, 31 Oct 2024 18:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XYwEnDDs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F76B19D089;
	Thu, 31 Oct 2024 18:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730400109; cv=none; b=pu390L8Vxt2b1Lca1nLiHK48MF0GwrDRgsMUIkw/EtN2NNRKfyVaQ4GrEIjU1tNPk+i7nvImuVnoc724Zz3gyVMFiu/C2snps2YEX/Pyg/xUL9ibGY6PoymAQvEX8MRf3m+cPZa2m+9dukf+3z9GVGih++2MEb+YOU4GVhRttHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730400109; c=relaxed/simple;
	bh=O5y3yG44Z4TIp1Sm4Gu/6/BEmbwWPpuPhRNG0KS07T0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CVRgd9vP4IULBUJJiFAp88O1lDEJcHL0NR8av+G0xV/ah8g+YFGhQJmRmaVlqg/flAJeQD/N5MjZkBmyVGFCuXeeTI6x3Edb/rvBBCch7qzpgpkGZR0YCdIlquC5kEjQ336Q7U7Hkk8rp+a9I9higsFYqu7P2mZnco47ToS6ZAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XYwEnDDs; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730400105; x=1761936105;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O5y3yG44Z4TIp1Sm4Gu/6/BEmbwWPpuPhRNG0KS07T0=;
  b=XYwEnDDsiOo7YEA+LIuE++F5sPf0QJK0UUmQAfCL29tJv5gnYXWDWRsT
   5xDrpCcf9kLD/wug/b6TpGVSiHe2N/ZFOE6/XdG7p2hZALJxd1hmQrTvY
   hxariau/dyAUYEXT8ZbFrafJ6m0ULCxW5DCh/WkBQ44J8ejEI+E0WS5WR
   YqjiRaX2D7gvLPXtVaq9zpM2X06qH17T9Tu50Q8wx01sTqhgwoI0cjsVy
   G9Ll2JN/Dkm17p0j3hF2wKaF2kQ9HjMfCZVH3z+DR85K5iLlBUPXzQQQ6
   3TA3FgtswKAVRx+/Vb807idmvHMHdwiYGoQ4DteyFPGMtESefR3k94Qcj
   w==;
X-CSE-ConnectionGUID: c4TZn0ExSTeHTeOjLo9VHg==
X-CSE-MsgGUID: 4aPu+QUzT1yZVD2uP7RiBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="34094548"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="34094548"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 11:41:45 -0700
X-CSE-ConnectionGUID: Krln/6P8SmaZlQfEP74GXA==
X-CSE-MsgGUID: dOqKAt02SbmNtCK7R0+xmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="82813006"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 31 Oct 2024 11:41:42 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6a72-000gc2-0S;
	Thu, 31 Oct 2024 18:41:40 +0000
Date: Fri, 1 Nov 2024 02:40:57 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>
Subject: Re: [rft, PATCH v2 1/1] gpio: Drop unused inclusions from of_gpio.h
Message-ID: <202411010235.zmCLneNF-lkp@intel.com>
References: <20241031105314.2463446-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031105314.2463446-1-andriy.shevchenko@linux.intel.com>

Hi Andy,

kernel test robot noticed the following build errors:

[auto build test ERROR on brgl/gpio/for-next]
[also build test ERROR on linus/master v6.12-rc5 next-20241031]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/gpio-Drop-unused-inclusions-from-of_gpio-h/20241031-185405
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20241031105314.2463446-1-andriy.shevchenko%40linux.intel.com
patch subject: [rft, PATCH v2 1/1] gpio: Drop unused inclusions from of_gpio.h
config: i386-buildonly-randconfig-002-20241031 (https://download.01.org/0day-ci/archive/20241101/202411010235.zmCLneNF-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411010235.zmCLneNF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411010235.zmCLneNF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from sound/soc/codecs/cs42l52.c:18:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> sound/soc/codecs/cs42l52.c:1143:9: error: call to undeclared function 'devm_gpio_request_one'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1143 |                 ret = devm_gpio_request_one(&i2c_client->dev,
         |                       ^
>> sound/soc/codecs/cs42l52.c:1145:10: error: use of undeclared identifier 'GPIOF_OUT_INIT_HIGH'
    1145 |                                             GPIOF_OUT_INIT_HIGH,
         |                                             ^
>> sound/soc/codecs/cs42l52.c:1152:3: error: call to undeclared function 'gpio_set_value_cansleep'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1152 |                 gpio_set_value_cansleep(cs42l52->pdata.reset_gpio, 0);
         |                 ^
   1 warning and 3 errors generated.
--
   In file included from sound/soc/codecs/wcd938x.c:17:
   In file included from include/sound/pcm.h:15:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> sound/soc/codecs/wcd938x.c:3305:2: error: call to undeclared function 'gpio_direction_output'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3305 |         gpio_direction_output(wcd938x->reset_gpio, 0);
         |         ^
   sound/soc/codecs/wcd938x.c:3305:2: note: did you mean 'gpiod_direction_output'?
   include/linux/gpio/consumer.h:111:5: note: 'gpiod_direction_output' declared here
     111 | int gpiod_direction_output(struct gpio_desc *desc, int value);
         |     ^
>> sound/soc/codecs/wcd938x.c:3308:2: error: call to undeclared function 'gpio_set_value'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3308 |         gpio_set_value(wcd938x->reset_gpio, 1);
         |         ^
   sound/soc/codecs/wcd938x.c:3308:2: note: did you mean 'gpiod_set_value'?
   include/linux/gpio/consumer.h:122:6: note: 'gpiod_set_value' declared here
     122 | void gpiod_set_value(struct gpio_desc *desc, int value);
         |      ^
   1 warning and 2 errors generated.
--
   In file included from sound/soc/codecs/cs42l73.c:18:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> sound/soc/codecs/cs42l73.c:1316:9: error: call to undeclared function 'devm_gpio_request_one'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1316 |                 ret = devm_gpio_request_one(&i2c_client->dev,
         |                       ^
>> sound/soc/codecs/cs42l73.c:1318:10: error: use of undeclared identifier 'GPIOF_OUT_INIT_HIGH'
    1318 |                                             GPIOF_OUT_INIT_HIGH,
         |                                             ^
>> sound/soc/codecs/cs42l73.c:1325:3: error: call to undeclared function 'gpio_set_value_cansleep'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1325 |                 gpio_set_value_cansleep(cs42l73->pdata.reset_gpio, 0);
         |                 ^
   sound/soc/codecs/cs42l73.c:1363:2: error: call to undeclared function 'gpio_set_value_cansleep'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1363 |         gpio_set_value_cansleep(cs42l73->pdata.reset_gpio, 0);
         |         ^
   1 warning and 4 errors generated.


vim +/devm_gpio_request_one +1143 sound/soc/codecs/cs42l52.c

dfe0f98b8d2e11 Brian Austin      2012-04-27  1089  
4a4043456cb82d Stephen Kitt      2022-03-25  1090  static int cs42l52_i2c_probe(struct i2c_client *i2c_client)
dfe0f98b8d2e11 Brian Austin      2012-04-27  1091  {
dfe0f98b8d2e11 Brian Austin      2012-04-27  1092  	struct cs42l52_private *cs42l52;
6dd17757927ba9 Brian Austin      2013-10-25  1093  	struct cs42l52_platform_data *pdata = dev_get_platdata(&i2c_client->dev);
dfe0f98b8d2e11 Brian Austin      2012-04-27  1094  	int ret;
4ac9b48adf4d56 Charles Keepax    2021-05-11  1095  	unsigned int devid;
dfe0f98b8d2e11 Brian Austin      2012-04-27  1096  	unsigned int reg;
391fc59db87615 Brian Austin      2013-11-15  1097  	u32 val32;
dfe0f98b8d2e11 Brian Austin      2012-04-27  1098  
cd9e0b8282653d Markus Elfring    2017-11-22  1099  	cs42l52 = devm_kzalloc(&i2c_client->dev, sizeof(*cs42l52), GFP_KERNEL);
dfe0f98b8d2e11 Brian Austin      2012-04-27  1100  	if (cs42l52 == NULL)
dfe0f98b8d2e11 Brian Austin      2012-04-27  1101  		return -ENOMEM;
dfe0f98b8d2e11 Brian Austin      2012-04-27  1102  	cs42l52->dev = &i2c_client->dev;
dfe0f98b8d2e11 Brian Austin      2012-04-27  1103  
134b2f576b9144 Brian Austin      2012-06-04  1104  	cs42l52->regmap = devm_regmap_init_i2c(i2c_client, &cs42l52_regmap);
dfe0f98b8d2e11 Brian Austin      2012-04-27  1105  	if (IS_ERR(cs42l52->regmap)) {
dfe0f98b8d2e11 Brian Austin      2012-04-27  1106  		ret = PTR_ERR(cs42l52->regmap);
dfe0f98b8d2e11 Brian Austin      2012-04-27  1107  		dev_err(&i2c_client->dev, "regmap_init() failed: %d\n", ret);
134b2f576b9144 Brian Austin      2012-06-04  1108  		return ret;
dfe0f98b8d2e11 Brian Austin      2012-04-27  1109  	}
391fc59db87615 Brian Austin      2013-11-15  1110  	if (pdata) {
6dd17757927ba9 Brian Austin      2013-10-25  1111  		cs42l52->pdata = *pdata;
391fc59db87615 Brian Austin      2013-11-15  1112  	} else {
cd9e0b8282653d Markus Elfring    2017-11-22  1113  		pdata = devm_kzalloc(&i2c_client->dev, sizeof(*pdata),
391fc59db87615 Brian Austin      2013-11-15  1114  				     GFP_KERNEL);
e04db58c125230 Markus Elfring    2017-11-22  1115  		if (!pdata)
391fc59db87615 Brian Austin      2013-11-15  1116  			return -ENOMEM;
e04db58c125230 Markus Elfring    2017-11-22  1117  
391fc59db87615 Brian Austin      2013-11-15  1118  		if (i2c_client->dev.of_node) {
391fc59db87615 Brian Austin      2013-11-15  1119  			if (of_property_read_bool(i2c_client->dev.of_node,
391fc59db87615 Brian Austin      2013-11-15  1120  				"cirrus,mica-differential-cfg"))
391fc59db87615 Brian Austin      2013-11-15  1121  				pdata->mica_diff_cfg = true;
391fc59db87615 Brian Austin      2013-11-15  1122  
391fc59db87615 Brian Austin      2013-11-15  1123  			if (of_property_read_bool(i2c_client->dev.of_node,
391fc59db87615 Brian Austin      2013-11-15  1124  				"cirrus,micb-differential-cfg"))
391fc59db87615 Brian Austin      2013-11-15  1125  				pdata->micb_diff_cfg = true;
391fc59db87615 Brian Austin      2013-11-15  1126  
391fc59db87615 Brian Austin      2013-11-15  1127  			if (of_property_read_u32(i2c_client->dev.of_node,
391fc59db87615 Brian Austin      2013-11-15  1128  				"cirrus,micbias-lvl", &val32) >= 0)
391fc59db87615 Brian Austin      2013-11-15  1129  				pdata->micbias_lvl = val32;
391fc59db87615 Brian Austin      2013-11-15  1130  
391fc59db87615 Brian Austin      2013-11-15  1131  			if (of_property_read_u32(i2c_client->dev.of_node,
391fc59db87615 Brian Austin      2013-11-15  1132  				"cirrus,chgfreq-divisor", &val32) >= 0)
69ae8489076fa0 Mark Brown        2013-11-29  1133  				pdata->chgfreq = val32;
391fc59db87615 Brian Austin      2013-11-15  1134  
391fc59db87615 Brian Austin      2013-11-15  1135  			pdata->reset_gpio =
391fc59db87615 Brian Austin      2013-11-15  1136  				of_get_named_gpio(i2c_client->dev.of_node,
391fc59db87615 Brian Austin      2013-11-15  1137  						"cirrus,reset-gpio", 0);
391fc59db87615 Brian Austin      2013-11-15  1138  		}
391fc59db87615 Brian Austin      2013-11-15  1139  		cs42l52->pdata = *pdata;
391fc59db87615 Brian Austin      2013-11-15  1140  	}
dfe0f98b8d2e11 Brian Austin      2012-04-27  1141  
6dd17757927ba9 Brian Austin      2013-10-25  1142  	if (cs42l52->pdata.reset_gpio) {
4e17d2d33abe4b Axel Lin          2014-04-08 @1143  		ret = devm_gpio_request_one(&i2c_client->dev,
4e17d2d33abe4b Axel Lin          2014-04-08  1144  					    cs42l52->pdata.reset_gpio,
4e17d2d33abe4b Axel Lin          2014-04-08 @1145  					    GPIOF_OUT_INIT_HIGH,
4e17d2d33abe4b Axel Lin          2014-04-08  1146  					    "CS42L52 /RST");
6dd17757927ba9 Brian Austin      2013-10-25  1147  		if (ret < 0) {
6dd17757927ba9 Brian Austin      2013-10-25  1148  			dev_err(&i2c_client->dev, "Failed to request /RST %d: %d\n",
6dd17757927ba9 Brian Austin      2013-10-25  1149  				cs42l52->pdata.reset_gpio, ret);
6dd17757927ba9 Brian Austin      2013-10-25  1150  			return ret;
6dd17757927ba9 Brian Austin      2013-10-25  1151  		}
6dd17757927ba9 Brian Austin      2013-10-25 @1152  		gpio_set_value_cansleep(cs42l52->pdata.reset_gpio, 0);
6dd17757927ba9 Brian Austin      2013-10-25  1153  		gpio_set_value_cansleep(cs42l52->pdata.reset_gpio, 1);
6dd17757927ba9 Brian Austin      2013-10-25  1154  	}
6dd17757927ba9 Brian Austin      2013-10-25  1155  
6dd17757927ba9 Brian Austin      2013-10-25  1156  	i2c_set_clientdata(i2c_client, cs42l52);
dfe0f98b8d2e11 Brian Austin      2012-04-27  1157  
dfe0f98b8d2e11 Brian Austin      2012-04-27  1158  	ret = regmap_register_patch(cs42l52->regmap, cs42l52_threshold_patch,
dfe0f98b8d2e11 Brian Austin      2012-04-27  1159  				    ARRAY_SIZE(cs42l52_threshold_patch));
dfe0f98b8d2e11 Brian Austin      2012-04-27  1160  	if (ret != 0)
dfe0f98b8d2e11 Brian Austin      2012-04-27  1161  		dev_warn(cs42l52->dev, "Failed to apply regmap patch: %d\n",
dfe0f98b8d2e11 Brian Austin      2012-04-27  1162  			 ret);
dfe0f98b8d2e11 Brian Austin      2012-04-27  1163  
dfe0f98b8d2e11 Brian Austin      2012-04-27  1164  	ret = regmap_read(cs42l52->regmap, CS42L52_CHIP, &reg);
4ac9b48adf4d56 Charles Keepax    2021-05-11  1165  	if (ret) {
4ac9b48adf4d56 Charles Keepax    2021-05-11  1166  		dev_err(&i2c_client->dev, "Failed to read chip ID: %d\n", ret);
4ac9b48adf4d56 Charles Keepax    2021-05-11  1167  		return ret;
4ac9b48adf4d56 Charles Keepax    2021-05-11  1168  	}
4ac9b48adf4d56 Charles Keepax    2021-05-11  1169  
dfe0f98b8d2e11 Brian Austin      2012-04-27  1170  	devid = reg & CS42L52_CHIP_ID_MASK;
dfe0f98b8d2e11 Brian Austin      2012-04-27  1171  	if (devid != CS42L52_CHIP_ID) {
dfe0f98b8d2e11 Brian Austin      2012-04-27  1172  		ret = -ENODEV;
dfe0f98b8d2e11 Brian Austin      2012-04-27  1173  		dev_err(&i2c_client->dev,
dfe0f98b8d2e11 Brian Austin      2012-04-27  1174  			"CS42L52 Device ID (%X). Expected %X\n",
dfe0f98b8d2e11 Brian Austin      2012-04-27  1175  			devid, CS42L52_CHIP_ID);
134b2f576b9144 Brian Austin      2012-06-04  1176  		return ret;
dfe0f98b8d2e11 Brian Austin      2012-04-27  1177  	}
dfe0f98b8d2e11 Brian Austin      2012-04-27  1178  
e5f03af644c46b Brian Austin      2013-10-25  1179  	dev_info(&i2c_client->dev, "Cirrus Logic CS42L52, Revision: %02X\n",
a14bf88749c5b5 Axel Lin          2014-04-06  1180  		 reg & CS42L52_CHIP_REV_MASK);
e5f03af644c46b Brian Austin      2013-10-25  1181  
153723f6f1d13e Brian Austin      2013-10-25  1182  	/* Set Platform Data */
44b2ed54036ece Brian Austin      2013-11-14  1183  	if (cs42l52->pdata.mica_diff_cfg)
153723f6f1d13e Brian Austin      2013-10-25  1184  		regmap_update_bits(cs42l52->regmap, CS42L52_MICA_CTL,
153723f6f1d13e Brian Austin      2013-10-25  1185  				   CS42L52_MIC_CTL_TYPE_MASK,
44b2ed54036ece Brian Austin      2013-11-14  1186  				cs42l52->pdata.mica_diff_cfg <<
153723f6f1d13e Brian Austin      2013-10-25  1187  				CS42L52_MIC_CTL_TYPE_SHIFT);
153723f6f1d13e Brian Austin      2013-10-25  1188  
44b2ed54036ece Brian Austin      2013-11-14  1189  	if (cs42l52->pdata.micb_diff_cfg)
153723f6f1d13e Brian Austin      2013-10-25  1190  		regmap_update_bits(cs42l52->regmap, CS42L52_MICB_CTL,
153723f6f1d13e Brian Austin      2013-10-25  1191  				   CS42L52_MIC_CTL_TYPE_MASK,
44b2ed54036ece Brian Austin      2013-11-14  1192  				cs42l52->pdata.micb_diff_cfg <<
153723f6f1d13e Brian Austin      2013-10-25  1193  				CS42L52_MIC_CTL_TYPE_SHIFT);
153723f6f1d13e Brian Austin      2013-10-25  1194  
153723f6f1d13e Brian Austin      2013-10-25  1195  	if (cs42l52->pdata.chgfreq)
153723f6f1d13e Brian Austin      2013-10-25  1196  		regmap_update_bits(cs42l52->regmap, CS42L52_CHARGE_PUMP,
153723f6f1d13e Brian Austin      2013-10-25  1197  				   CS42L52_CHARGE_PUMP_MASK,
153723f6f1d13e Brian Austin      2013-10-25  1198  				cs42l52->pdata.chgfreq <<
153723f6f1d13e Brian Austin      2013-10-25  1199  				CS42L52_CHARGE_PUMP_SHIFT);
153723f6f1d13e Brian Austin      2013-10-25  1200  
153723f6f1d13e Brian Austin      2013-10-25  1201  	if (cs42l52->pdata.micbias_lvl)
153723f6f1d13e Brian Austin      2013-10-25  1202  		regmap_update_bits(cs42l52->regmap, CS42L52_IFACE_CTL2,
153723f6f1d13e Brian Austin      2013-10-25  1203  				   CS42L52_IFACE_CTL2_BIAS_LVL,
153723f6f1d13e Brian Austin      2013-10-25  1204  				cs42l52->pdata.micbias_lvl);
dfe0f98b8d2e11 Brian Austin      2012-04-27  1205  
4ac9b48adf4d56 Charles Keepax    2021-05-11  1206  	return devm_snd_soc_register_component(&i2c_client->dev,
9665a74944b321 Kuninori Morimoto 2018-01-29  1207  			&soc_component_dev_cs42l52, &cs42l52_dai, 1);
dfe0f98b8d2e11 Brian Austin      2012-04-27  1208  }
dfe0f98b8d2e11 Brian Austin      2012-04-27  1209  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

