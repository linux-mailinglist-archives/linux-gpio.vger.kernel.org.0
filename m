Return-Path: <linux-gpio+bounces-13354-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 837959DC345
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Nov 2024 13:13:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E240DB23031
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Nov 2024 12:13:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54E4C19CC28;
	Fri, 29 Nov 2024 12:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hWTm9Ypb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19783198E74;
	Fri, 29 Nov 2024 12:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732882385; cv=none; b=jnOOvpWzAotrsxlE3hMA0aPh4aI8ZBUM28N+WC9zmgCqGsZBEUulNq351xxTi7XEbTUg6qhqhNGW39upkX2M16taXAC+Bo0wA3QQLxJ1niEIYcq9tcyJ2ONkbsbZFtLeCxU/JjL6ERtQ2GqwUqjTk3gpMQ/nmZ5/KyMTyR+Wqxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732882385; c=relaxed/simple;
	bh=ocQppVVNFhRwq7ha/VHFUhe3KayUiaBEiHqz3BhEtu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I2kkFmJYnMhYcIFjcP6aw6O8+VAUk+k7ZfwAuwtWQ8DqaV76FLyPjDapYfs7iKClHy6WuHo8dXGqJaTfG2/QqoPtvP1RfOvbYMteTSI5Qu7nIdHRkeCo+V68rt9gXvKENCwYu3VNJFBqTsbwqVhOeujCMx191YBhq4FOOWDQGDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hWTm9Ypb; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732882383; x=1764418383;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ocQppVVNFhRwq7ha/VHFUhe3KayUiaBEiHqz3BhEtu0=;
  b=hWTm9YpbmQi5kKIo8gy2zY9bu1xG6cNPx6GhWtrRQULxUYNunqCyXRfd
   QbH2te0szxSyNujOXL0pZwk4LDEI/kkyRFKk7LwhMlSTX6p9B3T4njjxz
   ryNJKM4QOOBfsG3ahUnUBy+wFuVtLrcWASaZKIyRfkkJPl+SUSnFoW71V
   m51n0YgRGPwrWxGQ4LUT9hqveexjRUHXGbSmORdHAqpHFNsnpfhA3BJjs
   Y78x/4kTedmbZbDmKIFenWf1lvPAM974p3LnlGkyzYZZOenNSZIs4bREF
   hTjRImva/2sMQuqDdnq1nyFbPdlMFGRJAplA0FJTPL4zA+pZUBijxsPIJ
   w==;
X-CSE-ConnectionGUID: tye51lqiQeScLs1QbeYkhA==
X-CSE-MsgGUID: UHbIpkGdSW62hL5wJ2TrKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="32486084"
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; 
   d="scan'208";a="32486084"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 04:13:02 -0800
X-CSE-ConnectionGUID: vwrFvSoWRaiFVOXbhsOqwg==
X-CSE-MsgGUID: fJbP48qZT6m6AmlfXsrmzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; 
   d="scan'208";a="97577588"
Received: from lkp-server01.sh.intel.com (HELO 5e2646291792) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 29 Nov 2024 04:12:56 -0800
Received: from kbuild by 5e2646291792 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGzrh-0000It-18;
	Fri, 29 Nov 2024 12:12:53 +0000
Date: Fri, 29 Nov 2024 20:12:22 +0800
From: kernel test robot <lkp@intel.com>
To: Xiangxu Yin <quic_xiangxuy@quicinc.com>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, quic_lliu6@quicinc.com,
	quic_fangez@quicinc.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-gpio@vger.kernel.org, Xiangxu Yin <quic_xiangxuy@quicinc.com>
Subject: Re: [PATCH 3/8] phy: qcom: qmp-usbc: Add DP phy mode support on
 QCS615
Message-ID: <202411292042.NDeS4BGv-lkp@intel.com>
References: <20241129-add-displayport-support-for-qcs615-platform-v1-3-09a4338d93ef@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241129-add-displayport-support-for-qcs615-platform-v1-3-09a4338d93ef@quicinc.com>

Hi Xiangxu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on f486c8aa16b8172f63bddc70116a0c897a7f3f02]

url:    https://github.com/intel-lab-lkp/linux/commits/Xiangxu-Yin/dt-bindings-display-msm-Document-DP-on-QCS615/20241129-160612
base:   f486c8aa16b8172f63bddc70116a0c897a7f3f02
patch link:    https://lore.kernel.org/r/20241129-add-displayport-support-for-qcs615-platform-v1-3-09a4338d93ef%40quicinc.com
patch subject: [PATCH 3/8] phy: qcom: qmp-usbc: Add DP phy mode support on QCS615
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241129/202411292042.NDeS4BGv-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241129/202411292042.NDeS4BGv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411292042.NDeS4BGv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/phy/qualcomm/phy-qcom-qmp-usbc.c:17:
   In file included from include/linux/phy/phy.h:17:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/phy/qualcomm/phy-qcom-qmp-usbc.c:721:24: warning: variable 'pre_emphasis_cfg' is uninitialized when used here [-Wuninitialized]
     721 |         if ((v_level > 4) || (pre_emphasis_cfg > 4)) {
         |                               ^~~~~~~~~~~~~~~~
   drivers/phy/qualcomm/phy-qcom-qmp-usbc.c:708:40: note: initialize the variable 'pre_emphasis_cfg' to silence this warning
     708 |         u8 voltage_swing_cfg, pre_emphasis_cfg;
         |                                               ^
         |                                                = '\0'
>> drivers/phy/qualcomm/phy-qcom-qmp-usbc.c:1801:47: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
    1801 |                 dev_err(dev, "get resource fail, ret:%d\n", ret);
         |                                                             ^~~
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/phy/qualcomm/phy-qcom-qmp-usbc.c:1797:9: note: initialize the variable 'ret' to silence this warning
    1797 |         int ret;
         |                ^
         |                 = 0
>> drivers/phy/qualcomm/phy-qcom-qmp-usbc.c:2082:13: warning: variable 'np' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    2082 |         } else if (qmp->type == QMP_PHY_USBC_DP) {
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/qualcomm/phy-qcom-qmp-usbc.c:2150:14: note: uninitialized use occurs here
    2150 |         of_node_put(np);
         |                     ^~
   drivers/phy/qualcomm/phy-qcom-qmp-usbc.c:2082:9: note: remove the 'if' if its condition is always true
    2082 |         } else if (qmp->type == QMP_PHY_USBC_DP) {
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/qualcomm/phy-qcom-qmp-usbc.c:2027:24: note: initialize the variable 'np' to silence this warning
    2027 |         struct device_node *np;
         |                               ^
         |                                = NULL
   7 warnings generated.


vim +/pre_emphasis_cfg +721 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c

   699	
   700	static int qcs615_qmp_configure_dp_voltages(struct qmp_usbc *qmp)
   701	{
   702		struct qmp_phy_dp_layout *layout = to_dp_layout(qmp);
   703		struct qmp_phy_dp_cfg *cfg = to_dp_cfg(qmp);
   704		const struct phy_configure_opts_dp *dp_opts = &layout->dp_opts;
   705		void __iomem *tx = layout->dp_tx;
   706		void __iomem *tx2 = layout->dp_tx2;
   707		unsigned int v_level = 0, p_level = 0;
   708		u8 voltage_swing_cfg, pre_emphasis_cfg;
   709		int i;
   710	
   711		if (dp_opts->lanes > 4) {
   712			dev_err(qmp->dev, "Invalid lane_num(%d)\n", dp_opts->lanes);
   713			return -EINVAL;
   714		}
   715	
   716		for (i = 0; i < dp_opts->lanes; i++) {
   717			v_level = max(v_level, dp_opts->voltage[i]);
   718			p_level = max(p_level, dp_opts->pre[i]);
   719		}
   720	
 > 721		if ((v_level > 4) || (pre_emphasis_cfg > 4)) {
   722			dev_err(qmp->dev, "Invalid v(%d) | p(%d) level)\n",
   723				v_level, pre_emphasis_cfg);
   724			return -EINVAL;
   725		}
   726	
   727		voltage_swing_cfg = (*cfg->swing_tbl)[v_level][p_level];
   728		pre_emphasis_cfg = (*cfg->pre_emphasis_tbl)[v_level][p_level];
   729	
   730		/* Enable MUX to use Cursor values from these registers */
   731		voltage_swing_cfg |= DP_PHY_TXn_TX_DRV_LVL_MUX_EN;
   732		pre_emphasis_cfg |= DP_PHY_TXn_TX_EMP_POST1_LVL_MUX_EN;
   733	
   734		if (voltage_swing_cfg == 0xFF && pre_emphasis_cfg == 0xFF)
   735			return -EINVAL;
   736	
   737		/* program default setting first */
   738		writel(0x2A, tx + QSERDES_V3_TX_TX_DRV_LVL);
   739		writel(0x20, tx + QSERDES_V3_TX_TX_EMP_POST1_LVL);
   740		writel(0x2A, tx2 + QSERDES_V3_TX_TX_DRV_LVL);
   741		writel(0x20, tx2 + QSERDES_V3_TX_TX_EMP_POST1_LVL);
   742	
   743		writel(voltage_swing_cfg, tx + QSERDES_V3_TX_TX_DRV_LVL);
   744		writel(pre_emphasis_cfg, tx + QSERDES_V3_TX_TX_EMP_POST1_LVL);
   745		writel(voltage_swing_cfg, tx2 + QSERDES_V3_TX_TX_DRV_LVL);
   746		writel(pre_emphasis_cfg, tx2 + QSERDES_V3_TX_TX_EMP_POST1_LVL);
   747	
   748		return 0;
   749	}
   750	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

