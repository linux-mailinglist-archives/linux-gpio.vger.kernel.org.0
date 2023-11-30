Return-Path: <linux-gpio+bounces-759-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0397B7FEAD2
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 09:35:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE12D284250
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 08:35:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54D492C84A;
	Thu, 30 Nov 2023 08:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AMVv3dUv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0789FB2
	for <linux-gpio@vger.kernel.org>; Thu, 30 Nov 2023 00:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701333297; x=1732869297;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JHr+VCox4m2nofXFeu4Vg+oKk011j0SzF5wb0zg1MYo=;
  b=AMVv3dUvyyicsTm1Oyg2p3wbR6TUaSuU+vTCZonGfRB6VRJFtJjqXdNf
   r/WwUE6n2meJfBA1j1X/1jFiGdwY8I5eHxSw27kGTDKvcrgNYkN2xeXiJ
   H3L3v9imBAoC/t/pm3uo00upOE/llXrHmSVlzVhQKT1EGZ0oWroP79v1W
   AXPbQYDXmqPh91q1E0hABYHxEi0Edvbj3o/X1LjFtHN2uSjevpIYMWegq
   yQNnCTIl0WAhl5dnCwoAtzm8iGG3D1FaJyT6BnEQBSyHRBibe/KNCnfyR
   6xb1Ky9NNDtIqEUYjXI/YSPajh+1SqRodRD2n8xdnR3d+fXPj2WlWUH4Y
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="390451529"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="390451529"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 00:34:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="17314278"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 30 Nov 2023 00:34:56 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8cVZ-0001aI-2y;
	Thu, 30 Nov 2023 08:34:53 +0000
Date: Thu, 30 Nov 2023 16:34:19 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: [linusw-gpio:b4/descriptors-sound-cirrus 7/12]
 sound/soc/codecs/cs35l36.c:1843:8: warning: assignment to 'struct irq_data
 *' from 'int' makes pointer from integer without a cast
Message-ID: <202311301538.eWFZQ2lU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git b4/descriptors-sound-cirrus
head:   7a0c40a60968f5390997298321ac8be86a7541de
commit: f7347803759a03f9c457c85b961a946ece9f93f8 [7/12] ASoC: cs35l36: Drop legacy includes
config: i386-buildonly-randconfig-005-20231130 (https://download.01.org/0day-ci/archive/20231130/202311301538.eWFZQ2lU-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231130/202311301538.eWFZQ2lU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311301538.eWFZQ2lU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/codecs/cs35l36.c: In function 'cs35l36_i2c_probe':
   sound/soc/codecs/cs35l36.c:1843:10: error: implicit declaration of function 'irq_get_irq_data'; did you mean 'irq_set_irq_wake'? [-Werror=implicit-function-declaration]
    1843 |  irq_d = irq_get_irq_data(i2c_client->irq);
         |          ^~~~~~~~~~~~~~~~
         |          irq_set_irq_wake
>> sound/soc/codecs/cs35l36.c:1843:8: warning: assignment to 'struct irq_data *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1843 |  irq_d = irq_get_irq_data(i2c_client->irq);
         |        ^
   sound/soc/codecs/cs35l36.c:1850:12: error: implicit declaration of function 'irqd_get_trigger_type' [-Werror=implicit-function-declaration]
    1850 |  irq_pol = irqd_get_trigger_type(irq_d);
         |            ^~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +1843 sound/soc/codecs/cs35l36.c

6ba9dd6c893b8e James Schulman     2019-02-07  1699  
4a4043456cb82d Stephen Kitt       2022-03-25  1700  static int cs35l36_i2c_probe(struct i2c_client *i2c_client)
6ba9dd6c893b8e James Schulman     2019-02-07  1701  {
6ba9dd6c893b8e James Schulman     2019-02-07  1702  	struct cs35l36_private *cs35l36;
6ba9dd6c893b8e James Schulman     2019-02-07  1703  	struct device *dev = &i2c_client->dev;
6ba9dd6c893b8e James Schulman     2019-02-07  1704  	struct cs35l36_platform_data *pdata = dev_get_platdata(dev);
6ba9dd6c893b8e James Schulman     2019-02-07  1705  	struct irq_data *irq_d;
6ba9dd6c893b8e James Schulman     2019-02-07  1706  	int ret, irq_pol, chip_irq_pol, i;
6ba9dd6c893b8e James Schulman     2019-02-07  1707  	u32 reg_id, reg_revid, l37_id_reg;
6ba9dd6c893b8e James Schulman     2019-02-07  1708  
6ba9dd6c893b8e James Schulman     2019-02-07  1709  	cs35l36 = devm_kzalloc(dev, sizeof(struct cs35l36_private), GFP_KERNEL);
6ba9dd6c893b8e James Schulman     2019-02-07  1710  	if (!cs35l36)
6ba9dd6c893b8e James Schulman     2019-02-07  1711  		return -ENOMEM;
6ba9dd6c893b8e James Schulman     2019-02-07  1712  
6ba9dd6c893b8e James Schulman     2019-02-07  1713  	cs35l36->dev = dev;
6ba9dd6c893b8e James Schulman     2019-02-07  1714  
6ba9dd6c893b8e James Schulman     2019-02-07  1715  	i2c_set_clientdata(i2c_client, cs35l36);
6ba9dd6c893b8e James Schulman     2019-02-07  1716  	cs35l36->regmap = devm_regmap_init_i2c(i2c_client, &cs35l36_regmap);
6ba9dd6c893b8e James Schulman     2019-02-07  1717  	if (IS_ERR(cs35l36->regmap)) {
6ba9dd6c893b8e James Schulman     2019-02-07  1718  		ret = PTR_ERR(cs35l36->regmap);
6ba9dd6c893b8e James Schulman     2019-02-07  1719  		dev_err(dev, "regmap_init() failed: %d\n", ret);
cdf20c3ef0e90b Christophe JAILLET 2021-04-11  1720  		return ret;
6ba9dd6c893b8e James Schulman     2019-02-07  1721  	}
6ba9dd6c893b8e James Schulman     2019-02-07  1722  
6ba9dd6c893b8e James Schulman     2019-02-07  1723  	cs35l36->num_supplies = ARRAY_SIZE(cs35l36_supplies);
6ba9dd6c893b8e James Schulman     2019-02-07  1724  	for (i = 0; i < ARRAY_SIZE(cs35l36_supplies); i++)
6ba9dd6c893b8e James Schulman     2019-02-07  1725  		cs35l36->supplies[i].supply = cs35l36_supplies[i];
6ba9dd6c893b8e James Schulman     2019-02-07  1726  
6ba9dd6c893b8e James Schulman     2019-02-07  1727  	ret = devm_regulator_bulk_get(dev, cs35l36->num_supplies,
6ba9dd6c893b8e James Schulman     2019-02-07  1728  				      cs35l36->supplies);
6ba9dd6c893b8e James Schulman     2019-02-07  1729  	if (ret != 0) {
6ba9dd6c893b8e James Schulman     2019-02-07  1730  		dev_err(dev, "Failed to request core supplies: %d\n", ret);
6ba9dd6c893b8e James Schulman     2019-02-07  1731  		return ret;
6ba9dd6c893b8e James Schulman     2019-02-07  1732  	}
6ba9dd6c893b8e James Schulman     2019-02-07  1733  
6ba9dd6c893b8e James Schulman     2019-02-07  1734  	if (pdata) {
6ba9dd6c893b8e James Schulman     2019-02-07  1735  		cs35l36->pdata = *pdata;
6ba9dd6c893b8e James Schulman     2019-02-07  1736  	} else {
6ba9dd6c893b8e James Schulman     2019-02-07  1737  		pdata = devm_kzalloc(dev, sizeof(struct cs35l36_platform_data),
6ba9dd6c893b8e James Schulman     2019-02-07  1738  				     GFP_KERNEL);
6ba9dd6c893b8e James Schulman     2019-02-07  1739  		if (!pdata)
6ba9dd6c893b8e James Schulman     2019-02-07  1740  			return -ENOMEM;
6ba9dd6c893b8e James Schulman     2019-02-07  1741  
6ba9dd6c893b8e James Schulman     2019-02-07  1742  		if (i2c_client->dev.of_node) {
6ba9dd6c893b8e James Schulman     2019-02-07  1743  			ret = cs35l36_handle_of_data(i2c_client, pdata);
6ba9dd6c893b8e James Schulman     2019-02-07  1744  			if (ret != 0)
6ba9dd6c893b8e James Schulman     2019-02-07  1745  				return ret;
6ba9dd6c893b8e James Schulman     2019-02-07  1746  
6ba9dd6c893b8e James Schulman     2019-02-07  1747  		}
6ba9dd6c893b8e James Schulman     2019-02-07  1748  
6ba9dd6c893b8e James Schulman     2019-02-07  1749  		cs35l36->pdata = *pdata;
6ba9dd6c893b8e James Schulman     2019-02-07  1750  	}
6ba9dd6c893b8e James Schulman     2019-02-07  1751  
6ba9dd6c893b8e James Schulman     2019-02-07  1752  	ret = regulator_bulk_enable(cs35l36->num_supplies, cs35l36->supplies);
6ba9dd6c893b8e James Schulman     2019-02-07  1753  	if (ret != 0) {
6ba9dd6c893b8e James Schulman     2019-02-07  1754  		dev_err(dev, "Failed to enable core supplies: %d\n", ret);
6ba9dd6c893b8e James Schulman     2019-02-07  1755  		return ret;
6ba9dd6c893b8e James Schulman     2019-02-07  1756  	}
6ba9dd6c893b8e James Schulman     2019-02-07  1757  
6ba9dd6c893b8e James Schulman     2019-02-07  1758  	/* returning NULL can be an option if in stereo mode */
6ba9dd6c893b8e James Schulman     2019-02-07  1759  	cs35l36->reset_gpio = devm_gpiod_get_optional(dev, "reset",
6ba9dd6c893b8e James Schulman     2019-02-07  1760  						      GPIOD_OUT_LOW);
6ba9dd6c893b8e James Schulman     2019-02-07  1761  	if (IS_ERR(cs35l36->reset_gpio)) {
6ba9dd6c893b8e James Schulman     2019-02-07  1762  		ret = PTR_ERR(cs35l36->reset_gpio);
6ba9dd6c893b8e James Schulman     2019-02-07  1763  		cs35l36->reset_gpio = NULL;
6ba9dd6c893b8e James Schulman     2019-02-07  1764  		if (ret == -EBUSY) {
6ba9dd6c893b8e James Schulman     2019-02-07  1765  			dev_info(dev, "Reset line busy, assuming shared reset\n");
6ba9dd6c893b8e James Schulman     2019-02-07  1766  		} else {
6ba9dd6c893b8e James Schulman     2019-02-07  1767  			dev_err(dev, "Failed to get reset GPIO: %d\n", ret);
6ba9dd6c893b8e James Schulman     2019-02-07  1768  			goto err_disable_regs;
6ba9dd6c893b8e James Schulman     2019-02-07  1769  		}
6ba9dd6c893b8e James Schulman     2019-02-07  1770  	}
6ba9dd6c893b8e James Schulman     2019-02-07  1771  
6ba9dd6c893b8e James Schulman     2019-02-07  1772  	if (cs35l36->reset_gpio)
6ba9dd6c893b8e James Schulman     2019-02-07  1773  		gpiod_set_value_cansleep(cs35l36->reset_gpio, 1);
6ba9dd6c893b8e James Schulman     2019-02-07  1774  
6ba9dd6c893b8e James Schulman     2019-02-07  1775  	usleep_range(2000, 2100);
6ba9dd6c893b8e James Schulman     2019-02-07  1776  
6ba9dd6c893b8e James Schulman     2019-02-07  1777  	/* initialize amplifier */
6ba9dd6c893b8e James Schulman     2019-02-07  1778  	ret = regmap_read(cs35l36->regmap, CS35L36_SW_RESET, &reg_id);
6ba9dd6c893b8e James Schulman     2019-02-07  1779  	if (ret < 0) {
6ba9dd6c893b8e James Schulman     2019-02-07  1780  		dev_err(dev, "Get Device ID failed %d\n", ret);
6ba9dd6c893b8e James Schulman     2019-02-07  1781  		goto err;
6ba9dd6c893b8e James Schulman     2019-02-07  1782  	}
6ba9dd6c893b8e James Schulman     2019-02-07  1783  
6ba9dd6c893b8e James Schulman     2019-02-07  1784  	if (reg_id != CS35L36_CHIP_ID) {
6ba9dd6c893b8e James Schulman     2019-02-07  1785  		dev_err(dev, "Device ID (%X). Expected ID %X\n", reg_id,
6ba9dd6c893b8e James Schulman     2019-02-07  1786  			CS35L36_CHIP_ID);
6ba9dd6c893b8e James Schulman     2019-02-07  1787  		ret = -ENODEV;
6ba9dd6c893b8e James Schulman     2019-02-07  1788  		goto err;
6ba9dd6c893b8e James Schulman     2019-02-07  1789  	}
6ba9dd6c893b8e James Schulman     2019-02-07  1790  
6ba9dd6c893b8e James Schulman     2019-02-07  1791  	ret = regmap_read(cs35l36->regmap, CS35L36_REV_ID, &reg_revid);
6ba9dd6c893b8e James Schulman     2019-02-07  1792  	if (ret < 0) {
6ba9dd6c893b8e James Schulman     2019-02-07  1793  		dev_err(&i2c_client->dev, "Get Revision ID failed %d\n", ret);
6ba9dd6c893b8e James Schulman     2019-02-07  1794  		goto err;
6ba9dd6c893b8e James Schulman     2019-02-07  1795  	}
6ba9dd6c893b8e James Schulman     2019-02-07  1796  
6ba9dd6c893b8e James Schulman     2019-02-07  1797  	cs35l36->rev_id = reg_revid >> 8;
6ba9dd6c893b8e James Schulman     2019-02-07  1798  
6ba9dd6c893b8e James Schulman     2019-02-07  1799  	ret = regmap_read(cs35l36->regmap, CS35L36_OTP_MEM30, &l37_id_reg);
6ba9dd6c893b8e James Schulman     2019-02-07  1800  	if (ret < 0) {
6ba9dd6c893b8e James Schulman     2019-02-07  1801  		dev_err(&i2c_client->dev, "Failed to read otp_id Register %d\n",
6ba9dd6c893b8e James Schulman     2019-02-07  1802  			ret);
cf7250e95d309a Zheyu Ma           2022-05-10  1803  		goto err;
6ba9dd6c893b8e James Schulman     2019-02-07  1804  	}
6ba9dd6c893b8e James Schulman     2019-02-07  1805  
6ba9dd6c893b8e James Schulman     2019-02-07  1806  	if ((l37_id_reg & CS35L36_OTP_REV_MASK) == CS35L36_OTP_REV_L37)
6ba9dd6c893b8e James Schulman     2019-02-07  1807  		cs35l36->chip_version = CS35L36_12V_L37;
6ba9dd6c893b8e James Schulman     2019-02-07  1808  	else
6ba9dd6c893b8e James Schulman     2019-02-07  1809  		cs35l36->chip_version = CS35L36_10V_L36;
6ba9dd6c893b8e James Schulman     2019-02-07  1810  
6ba9dd6c893b8e James Schulman     2019-02-07  1811  	switch (cs35l36->rev_id) {
6ba9dd6c893b8e James Schulman     2019-02-07  1812  	case CS35L36_REV_A0:
6ba9dd6c893b8e James Schulman     2019-02-07  1813  		ret = regmap_register_patch(cs35l36->regmap,
6ba9dd6c893b8e James Schulman     2019-02-07  1814  				cs35l36_reva0_errata_patch,
6ba9dd6c893b8e James Schulman     2019-02-07  1815  				ARRAY_SIZE(cs35l36_reva0_errata_patch));
6ba9dd6c893b8e James Schulman     2019-02-07  1816  		if (ret < 0) {
6ba9dd6c893b8e James Schulman     2019-02-07  1817  			dev_err(dev, "Failed to apply A0 errata patch %d\n",
6ba9dd6c893b8e James Schulman     2019-02-07  1818  				ret);
6ba9dd6c893b8e James Schulman     2019-02-07  1819  			goto err;
6ba9dd6c893b8e James Schulman     2019-02-07  1820  		}
6ba9dd6c893b8e James Schulman     2019-02-07  1821  		break;
6ba9dd6c893b8e James Schulman     2019-02-07  1822  	case CS35L36_REV_B0:
6ba9dd6c893b8e James Schulman     2019-02-07  1823  		ret = cs35l36_pac(cs35l36);
6ba9dd6c893b8e James Schulman     2019-02-07  1824  		if (ret < 0) {
6ba9dd6c893b8e James Schulman     2019-02-07  1825  			dev_err(dev, "Failed to Trim OTP %d\n", ret);
6ba9dd6c893b8e James Schulman     2019-02-07  1826  			goto err;
6ba9dd6c893b8e James Schulman     2019-02-07  1827  		}
6ba9dd6c893b8e James Schulman     2019-02-07  1828  
6ba9dd6c893b8e James Schulman     2019-02-07  1829  		ret = regmap_register_patch(cs35l36->regmap,
6ba9dd6c893b8e James Schulman     2019-02-07  1830  				cs35l36_revb0_errata_patch,
6ba9dd6c893b8e James Schulman     2019-02-07  1831  				ARRAY_SIZE(cs35l36_revb0_errata_patch));
6ba9dd6c893b8e James Schulman     2019-02-07  1832  		if (ret < 0) {
6ba9dd6c893b8e James Schulman     2019-02-07  1833  			dev_err(dev, "Failed to apply B0 errata patch %d\n",
6ba9dd6c893b8e James Schulman     2019-02-07  1834  				ret);
6ba9dd6c893b8e James Schulman     2019-02-07  1835  			goto err;
6ba9dd6c893b8e James Schulman     2019-02-07  1836  		}
6ba9dd6c893b8e James Schulman     2019-02-07  1837  		break;
6ba9dd6c893b8e James Schulman     2019-02-07  1838  	}
6ba9dd6c893b8e James Schulman     2019-02-07  1839  
6ba9dd6c893b8e James Schulman     2019-02-07  1840  	if (pdata->vpbr_config.is_present)
6ba9dd6c893b8e James Schulman     2019-02-07  1841  		cs35l36_apply_vpbr_config(cs35l36);
6ba9dd6c893b8e James Schulman     2019-02-07  1842  
6ba9dd6c893b8e James Schulman     2019-02-07 @1843  	irq_d = irq_get_irq_data(i2c_client->irq);
eb23dcd20e91fe Dan Carpenter      2019-02-22  1844  	if (!irq_d) {
6ba9dd6c893b8e James Schulman     2019-02-07  1845  		dev_err(&i2c_client->dev, "Invalid IRQ: %d\n", i2c_client->irq);
eb23dcd20e91fe Dan Carpenter      2019-02-22  1846  		ret = -ENODEV;
6ba9dd6c893b8e James Schulman     2019-02-07  1847  		goto err;
6ba9dd6c893b8e James Schulman     2019-02-07  1848  	}
6ba9dd6c893b8e James Schulman     2019-02-07  1849  
6ba9dd6c893b8e James Schulman     2019-02-07  1850  	irq_pol = irqd_get_trigger_type(irq_d);
6ba9dd6c893b8e James Schulman     2019-02-07  1851  
6ba9dd6c893b8e James Schulman     2019-02-07  1852  	switch (irq_pol) {
6ba9dd6c893b8e James Schulman     2019-02-07  1853  	case IRQF_TRIGGER_FALLING:
6ba9dd6c893b8e James Schulman     2019-02-07  1854  	case IRQF_TRIGGER_LOW:
6ba9dd6c893b8e James Schulman     2019-02-07  1855  		chip_irq_pol = 0;
6ba9dd6c893b8e James Schulman     2019-02-07  1856  		break;
6ba9dd6c893b8e James Schulman     2019-02-07  1857  	case IRQF_TRIGGER_RISING:
6ba9dd6c893b8e James Schulman     2019-02-07  1858  	case IRQF_TRIGGER_HIGH:
6ba9dd6c893b8e James Schulman     2019-02-07  1859  		chip_irq_pol = 1;
6ba9dd6c893b8e James Schulman     2019-02-07  1860  		break;
6ba9dd6c893b8e James Schulman     2019-02-07  1861  	default:
6ba9dd6c893b8e James Schulman     2019-02-07  1862  		dev_err(cs35l36->dev, "Invalid IRQ polarity: %d\n", irq_pol);
6ba9dd6c893b8e James Schulman     2019-02-07  1863  		ret = -EINVAL;
6ba9dd6c893b8e James Schulman     2019-02-07  1864  		goto err;
6ba9dd6c893b8e James Schulman     2019-02-07  1865  	}
6ba9dd6c893b8e James Schulman     2019-02-07  1866  
6ba9dd6c893b8e James Schulman     2019-02-07  1867  	regmap_update_bits(cs35l36->regmap, CS35L36_PAD_INTERFACE,
6ba9dd6c893b8e James Schulman     2019-02-07  1868  			   CS35L36_INT_POL_SEL_MASK,
6ba9dd6c893b8e James Schulman     2019-02-07  1869  			   chip_irq_pol << CS35L36_INT_POL_SEL_SHIFT);
6ba9dd6c893b8e James Schulman     2019-02-07  1870  
6ba9dd6c893b8e James Schulman     2019-02-07  1871  	ret = devm_request_threaded_irq(dev, i2c_client->irq, NULL, cs35l36_irq,
6ba9dd6c893b8e James Schulman     2019-02-07  1872  					IRQF_ONESHOT | irq_pol, "cs35l36",
6ba9dd6c893b8e James Schulman     2019-02-07  1873  					cs35l36);
6ba9dd6c893b8e James Schulman     2019-02-07  1874  	if (ret != 0) {
6ba9dd6c893b8e James Schulman     2019-02-07  1875  		dev_err(dev, "Failed to request IRQ: %d\n", ret);
6ba9dd6c893b8e James Schulman     2019-02-07  1876  		goto err;
6ba9dd6c893b8e James Schulman     2019-02-07  1877  	}
6ba9dd6c893b8e James Schulman     2019-02-07  1878  
6ba9dd6c893b8e James Schulman     2019-02-07  1879  	regmap_update_bits(cs35l36->regmap, CS35L36_PAD_INTERFACE,
6ba9dd6c893b8e James Schulman     2019-02-07  1880  			   CS35L36_INT_OUTPUT_EN_MASK, 1);
6ba9dd6c893b8e James Schulman     2019-02-07  1881  
6ba9dd6c893b8e James Schulman     2019-02-07  1882  	/* Set interrupt masks for critical errors */
6ba9dd6c893b8e James Schulman     2019-02-07  1883  	regmap_write(cs35l36->regmap, CS35L36_INT1_MASK,
6ba9dd6c893b8e James Schulman     2019-02-07  1884  		     CS35L36_INT1_MASK_DEFAULT);
6ba9dd6c893b8e James Schulman     2019-02-07  1885  	regmap_write(cs35l36->regmap, CS35L36_INT3_MASK,
6ba9dd6c893b8e James Schulman     2019-02-07  1886  		     CS35L36_INT3_MASK_DEFAULT);
6ba9dd6c893b8e James Schulman     2019-02-07  1887  
6ba9dd6c893b8e James Schulman     2019-02-07  1888  	dev_info(&i2c_client->dev, "Cirrus Logic CS35L%d, Revision: %02X\n",
6ba9dd6c893b8e James Schulman     2019-02-07  1889  		 cs35l36->chip_version, reg_revid >> 8);
6ba9dd6c893b8e James Schulman     2019-02-07  1890  
6ba9dd6c893b8e James Schulman     2019-02-07  1891  	ret =  devm_snd_soc_register_component(dev, &soc_component_dev_cs35l36,
6ba9dd6c893b8e James Schulman     2019-02-07  1892  					       cs35l36_dai,
6ba9dd6c893b8e James Schulman     2019-02-07  1893  					       ARRAY_SIZE(cs35l36_dai));
6ba9dd6c893b8e James Schulman     2019-02-07  1894  	if (ret < 0) {
6ba9dd6c893b8e James Schulman     2019-02-07  1895  		dev_err(dev, "%s: Register component failed %d\n", __func__,
6ba9dd6c893b8e James Schulman     2019-02-07  1896  			ret);
6ba9dd6c893b8e James Schulman     2019-02-07  1897  		goto err;
6ba9dd6c893b8e James Schulman     2019-02-07  1898  	}
6ba9dd6c893b8e James Schulman     2019-02-07  1899  
6ba9dd6c893b8e James Schulman     2019-02-07  1900  	return 0;
6ba9dd6c893b8e James Schulman     2019-02-07  1901  
6ba9dd6c893b8e James Schulman     2019-02-07  1902  err:
6ba9dd6c893b8e James Schulman     2019-02-07  1903  	gpiod_set_value_cansleep(cs35l36->reset_gpio, 0);
6ba9dd6c893b8e James Schulman     2019-02-07  1904  
6ba9dd6c893b8e James Schulman     2019-02-07  1905  err_disable_regs:
6ba9dd6c893b8e James Schulman     2019-02-07  1906  	regulator_bulk_disable(cs35l36->num_supplies, cs35l36->supplies);
6ba9dd6c893b8e James Schulman     2019-02-07  1907  	return ret;
6ba9dd6c893b8e James Schulman     2019-02-07  1908  }
6ba9dd6c893b8e James Schulman     2019-02-07  1909  

:::::: The code at line 1843 was first introduced by commit
:::::: 6ba9dd6c893b8e60639cfe34e983786068dba9fa ASoC: cs35l36: Add support for Cirrus CS35L36 Amplifier

:::::: TO: James Schulman <james.schulman@cirrus.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

