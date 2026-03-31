Return-Path: <linux-gpio+bounces-34501-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOQ8K2YOzGnGNgYAu9opvQ
	(envelope-from <linux-gpio+bounces-34501-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 20:11:50 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BE536FC6B
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 20:11:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A77C33043175
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 17:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 837424418EC;
	Tue, 31 Mar 2026 17:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G1Rr/TMQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFE53D5227;
	Tue, 31 Mar 2026 17:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774979804; cv=none; b=aJyH9WAUebfRLSzCwlIqga1cXxnCbFGBCpno/u+LKRMgtvLveas6OOd1Ozn73cVgxUFBtPaxIu6DqEjl2obFOAGzbYXlDzWzDtwP4+4IoKSwk9YTaOR3feVNgx5n0JPwl8SVxOZ7Cp5+Pb/u06tzjkSlf8mbCZKuc4gIRwUJ3NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774979804; c=relaxed/simple;
	bh=TcZWBzzpqTS7aPD+ZnOCeM/2iUYCY9wQrFL9paJkYx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=clTbBrUZYfSrYpQ/9AoKe/DAJZ4nqHL2ityCDLlLzvZ+bQ0Yq1mXxL85pSKBRwX9ODqs5kGmgPafJbESAS7RH/HcszB7Nxw3bNtjTil1SEs70A6BZf0YSZxQuuXUL7daX0b7m7jXxL6hQeYY/GPyOiTQjDORmKcOltP72OAeEYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G1Rr/TMQ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774979802; x=1806515802;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TcZWBzzpqTS7aPD+ZnOCeM/2iUYCY9wQrFL9paJkYx8=;
  b=G1Rr/TMQKqk7w9CtAWxbppxiam0oLIIMi1Ytb1yq9KfvYmRI+TOyoAo/
   uKlP5x/hx2Z5F4TB192TKzb3MzV2CV3DdFLmCpnV0WrCMtYj1h2yL+a8+
   UJz4aJjBKZ5HXWSwiVLmsrLn3uYrz8UqAvL0L5mLWux1t+LUCPAr18Pat
   7TEAiHidZTvf4ZiGd9U/wSD8/wzH/qi5+kxHEFZgyUp9RptoTu24TZN14
   4ezlrxe+TX+D2ZWLmDbPUVTWD0ahVbMeBw/Jsnt58UyQD2MeHvoQFD+u4
   MwWOj6nOsVHHVglpigWRYo/NqMYwSyIObLXrl6LcCB1GtpAFJ2cEh49DI
   Q==;
X-CSE-ConnectionGUID: cJX5dCRjSS69CDlzJEqUKg==
X-CSE-MsgGUID: 7b6FKjxjR7KZvhtjZDR7rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="87078491"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="87078491"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 10:56:40 -0700
X-CSE-ConnectionGUID: vgGp7BthSbC+6Z49GyWWcA==
X-CSE-MsgGUID: z3szsMWpQeymP90If8fszQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="230501581"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 31 Mar 2026 10:56:33 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7dKI-00000000463-3PEk;
	Tue, 31 Mar 2026 17:56:30 +0000
Date: Wed, 1 Apr 2026 01:55:46 +0800
From: kernel test robot <lkp@intel.com>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	linux-mediatek@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, Fabien Parent <parent.f@gmail.com>,
	Val Packett <val@packett.cool>,
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
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Gary Bisson <bisson.gary@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4 7/9] regulator: Add MediaTek MT6392 regulator
Message-ID: <202604010103.FzAGRPye-lkp@intel.com>
References: <20260330083429.359819-8-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330083429.359819-8-l.scorcia@gmail.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,gmail.com,packett.cool,collabora.com,kernel.org,mediatek.com,vger.kernel.org,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	TAGGED_FROM(0.00)[bounces-34501-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,intel.com:mid,git-scm.com:url]
X-Rspamd-Queue-Id: B2BE536FC6B
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
patch link:    https://lore.kernel.org/r/20260330083429.359819-8-l.scorcia%40gmail.com
patch subject: [PATCH v4 7/9] regulator: Add MediaTek MT6392 regulator
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260401/202604010103.FzAGRPye-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604010103.FzAGRPye-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604010103.FzAGRPye-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/regulator/mt6392-regulator.c:181:18: warning: 'ldo_volt_table1b' defined but not used [-Wunused-const-variable=]
     181 | static const u32 ldo_volt_table1b[] = {
         |                  ^~~~~~~~~~~~~~~~


vim +/ldo_volt_table1b +181 drivers/regulator/mt6392-regulator.c

   180	
 > 181	static const u32 ldo_volt_table1b[] = {
   182		1500000, 1800000, 2500000, 2800000,
   183	};
   184	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

