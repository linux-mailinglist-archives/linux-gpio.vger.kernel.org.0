Return-Path: <linux-gpio+bounces-34490-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPsKDyPxy2m5MgYAu9opvQ
	(envelope-from <linux-gpio+bounces-34490-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 18:06:59 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8495936C5AC
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 18:06:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5019830B73CF
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 16:01:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5EB2421EEB;
	Tue, 31 Mar 2026 16:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CDl6VWIz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AE341B37F;
	Tue, 31 Mar 2026 16:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774972916; cv=none; b=l0/VnZZCv5NNVgVj/MQxB6wNWU0Wlwm0R9jxab+7fSwej3a9JKqOpR7Hnvvi4LslzykmPDrrrBF7N77wqRWB03UN4K3iH6CnRUtYEKOBZAVhFl9WN+53RJfuKmO6ZolKdbm+SvPx6KNtsRXuhey29dKU6vLli617t1VzTYZykbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774972916; c=relaxed/simple;
	bh=eI8SQ8hlmfnTvWkv7QAhjjIQ17PWVbfzQx5ojZvnNo4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JIv3GAHlXjQX+Fd/xJ2TlnYEgxkxlwcINPefkpcsyDZtnF40pg6DgxwYVnTpl+HFmWqpebXfli8cRxBBZ8h8KWDgt2r0TZZJoximoTThcqwavGMUYvB4Zr8GwC1wa+tEiK4C/0xsQ7MCyRY6MeRThf2yJbLCgJXeJz2XTYGuiu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CDl6VWIz; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774972914; x=1806508914;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eI8SQ8hlmfnTvWkv7QAhjjIQ17PWVbfzQx5ojZvnNo4=;
  b=CDl6VWIzjIwknuEDX8aRVR75G7bHOlu84fc2/88FEPNZCmUPG8mOdxOE
   9bVxQxuJ/Sh8FAfHLViltZXSaBrPrKMSL434pjgx6VEOvGDgLeTrVxvEu
   Hlwc/j6KyOhVN0zP6Se7aUO4kEBcR1YRwKWzTjq01zp0XFGImD8kbYKDF
   IJ3E+hH8lv8kE1d0JfpCqxLmV10uPHo6W9UpiVNImnnP1r6imBRdK8HYN
   4NYOWvHLPIi/IiX31MZQA7tpPe1CpdSS9BwBQv+IkuxrLxiLTkwgKKt9i
   3kBHNO2jj+6b03DnNZ/pArD6HBN2PK2ZCmaxL/joRZdm4xnxzQfuEnaQs
   A==;
X-CSE-ConnectionGUID: LIy7F1x4SiGg8NvMZuOL0g==
X-CSE-MsgGUID: +B5r4h/zQ6qftZSuJHgjNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75954401"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="75954401"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 09:01:53 -0700
X-CSE-ConnectionGUID: W+2NdeozTVSmfTQd4l/CIQ==
X-CSE-MsgGUID: IGnx9ev2S/KHj+cLPQVwFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="226270636"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 31 Mar 2026 09:01:47 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7bXD-000000002qT-3p6k;
	Tue, 31 Mar 2026 16:01:43 +0000
Date: Wed, 1 Apr 2026 00:01:12 +0800
From: kernel test robot <lkp@intel.com>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	linux-mediatek@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Fabien Parent <parent.f@gmail.com>, Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Gary Bisson <bisson.gary@gmail.com>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4 5/9] mfd: mt6397: Add support for MT6392 PMIC
Message-ID: <202603312339.CMJpqhEq-lkp@intel.com>
References: <20260330083429.359819-6-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330083429.359819-6-l.scorcia@gmail.com>
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34490-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[lists.linux.dev,gmail.com,packett.cool,collabora.com,kernel.org,mediatek.com,vger.kernel.org,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[git-scm.com:url,intel.com:dkim,intel.com:email,intel.com:mid,01.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8495936C5AC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Luca,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-mfd/for-mfd-next]
[also build test WARNING on broonie-regulator/for-next linusw-pinctrl/devel linusw-pinctrl/for-next lee-mfd/for-mfd-fixes linus/master v7.0-rc6 next-20260330]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Luca-Leonardo-Scorcia/dt-bindings-mfd-mt6397-Add-MT6392-PMIC/20260331-081127
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20260330083429.359819-6-l.scorcia%40gmail.com
patch subject: [PATCH v4 5/9] mfd: mt6397: Add support for MT6392 PMIC
config: s390-randconfig-002-20260331 (https://download.01.org/0day-ci/archive/20260331/202603312339.CMJpqhEq-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603312339.CMJpqhEq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603312339.CMJpqhEq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mfd/mt6397-core.c:421:16: warning: cast to smaller integer type 'enum mfd_match_data' from 'const void *' [-Wvoid-pointer-to-enum-cast]
     421 |         device_data = (enum mfd_match_data)of_device_get_match_data(&pdev->dev);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +421 drivers/mfd/mt6397-core.c

   398	
   399	static int mt6397_probe(struct platform_device *pdev)
   400	{
   401		int ret;
   402		unsigned int id = 0;
   403		struct mt6397_chip *pmic;
   404		const struct chip_data *pmic_core;
   405		enum mfd_match_data device_data;
   406	
   407		pmic = devm_kzalloc(&pdev->dev, sizeof(*pmic), GFP_KERNEL);
   408		if (!pmic)
   409			return -ENOMEM;
   410	
   411		pmic->dev = &pdev->dev;
   412	
   413		/*
   414		 * mt6397 MFD is child device of soc pmic wrapper.
   415		 * Regmap is set from its parent.
   416		 */
   417		pmic->regmap = dev_get_regmap(pdev->dev.parent, NULL);
   418		if (!pmic->regmap)
   419			return -ENODEV;
   420	
 > 421		device_data = (enum mfd_match_data)of_device_get_match_data(&pdev->dev);
   422		switch (device_data) {
   423		case MATCH_DATA_MT6323:
   424			pmic_core = &mt6323_core;
   425			break;
   426		case MATCH_DATA_MT6328:
   427			pmic_core = &mt6328_core;
   428			break;
   429		case MATCH_DATA_MT6331:
   430			pmic_core = &mt6331_mt6332_core;
   431			break;
   432		case MATCH_DATA_MT6357:
   433			pmic_core = &mt6357_core;
   434			break;
   435		case MATCH_DATA_MT6358:
   436			pmic_core = &mt6358_core;
   437			break;
   438		case MATCH_DATA_MT6359:
   439			pmic_core = &mt6359_core;
   440			break;
   441		case MATCH_DATA_MT6392:
   442			pmic_core = &mt6392_core;
   443			break;
   444		case MATCH_DATA_MT6397:
   445			pmic_core = &mt6397_core;
   446			break;
   447		default:
   448			dev_err(&pdev->dev, "Unknown device match data %u\n", device_data);
   449			return -ENODEV;
   450		}
   451	
   452		ret = regmap_read(pmic->regmap, pmic_core->cid_addr, &id);
   453		if (ret) {
   454			dev_err(&pdev->dev, "Failed to read chip id: %d\n", ret);
   455			return ret;
   456		}
   457	
   458		pmic->chip_id = (id >> pmic_core->cid_shift) & 0xff;
   459	
   460		platform_set_drvdata(pdev, pmic);
   461	
   462		pmic->irq = platform_get_irq(pdev, 0);
   463		if (pmic->irq <= 0)
   464			return pmic->irq;
   465	
   466		ret = pmic_core->irq_init(pmic);
   467		if (ret)
   468			return ret;
   469	
   470		ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_NONE,
   471					   pmic_core->cells, pmic_core->cell_size,
   472					   NULL, 0, pmic->irq_domain);
   473		if (ret) {
   474			irq_domain_remove(pmic->irq_domain);
   475			dev_err(&pdev->dev, "failed to add child devices: %d\n", ret);
   476		}
   477	
   478		return ret;
   479	}
   480	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

