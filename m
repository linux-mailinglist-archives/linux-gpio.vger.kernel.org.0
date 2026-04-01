Return-Path: <linux-gpio+bounces-34522-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qN7WBrtzzGn1SwYAu9opvQ
	(envelope-from <linux-gpio+bounces-34522-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 03:24:11 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 919AE373786
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 03:24:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DC35A308C148
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2026 01:22:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0224287268;
	Wed,  1 Apr 2026 01:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aII2l34u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71B52820C6;
	Wed,  1 Apr 2026 01:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775006529; cv=none; b=NeuznNfPFKW5Nf764rn22MWf+rOfeYXMz9QLVL0AR1487yccOgra5csfx9eXE4P1r0Fx071ZjT7d0BDAyAoLqnYk7PmMyEIRpCtqR7DCr8Hmb+iDAVxlOG1d+/EcRgubkfTVaLkNJHqiyilAqmF/ubNl5EY7UHZwA1rsoa6sOxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775006529; c=relaxed/simple;
	bh=IV/ezrq2wJekwozwDxi/VB18Q8hzC5mhy/g8CQQwaXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=excqkUfe7AbnOLHDc3HhC7u7ahVd533+JctpLxmOzhWwBGzZqqRQ8IwS9SiAPLyAJDaOYSOlxbdJnXMKnTem+CvtGvTdykGwt8MSiMomixISAuOIwqbUcy+pDHJ72wC1uay4tEXT+Fg5PzGanrCkLqXV8k8DH3r3F8SxoMm5qG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aII2l34u; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775006527; x=1806542527;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IV/ezrq2wJekwozwDxi/VB18Q8hzC5mhy/g8CQQwaXc=;
  b=aII2l34uU29bBx13Ay+fMRhmHb5qHvI0YfumytNwZt2/yC1IrmGQd0HW
   5m9xwsa01zql3KjxsXj3kV2Yp5fRUvrkhScMG+7e+PFdr88UftAmhd8Q/
   ccVPPJbf+51BOwaU+AcWtNSDPD05rsgNpPT9BhgXbRwKhFGDzK+7M7pgQ
   TLpqef8R59XxpY3PqUkXTGpqf3H1VKL7KDxDRzMLUVP2O+CxWCvcnG+UC
   emx7GaDEEAzJIqc07lRQueOTRZEK7ZoOwm4sfvJtwAItW8LdBCgUtL534
   /KYQP/WMMnfkc6Ly/U1m4j5VN9e3U6swkgbib8xTh8naWF0V0uZDd5kgT
   A==;
X-CSE-ConnectionGUID: AQK2wqqaR4iJQfD6tU00Sw==
X-CSE-MsgGUID: PPZVv3svRx2ih+4ku6XB7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75073339"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="75073339"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 18:22:07 -0700
X-CSE-ConnectionGUID: tC+gR6JkSHirq2rGvZGdwg==
X-CSE-MsgGUID: k10tL47EQp29KSvB8kLdpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="230596232"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 31 Mar 2026 18:22:00 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7kHN-000000004XR-0wJY;
	Wed, 01 Apr 2026 01:21:57 +0000
Date: Wed, 1 Apr 2026 09:21:46 +0800
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
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Gary Bisson <bisson.gary@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4 7/9] regulator: Add MediaTek MT6392 regulator
Message-ID: <202604010924.UuETwSKZ-lkp@intel.com>
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
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34522-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[git-scm.com:url,01.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,intel.com:mid]
X-Rspamd-Queue-Id: 919AE373786
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
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260401/202604010924.UuETwSKZ-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604010924.UuETwSKZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604010924.UuETwSKZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/regulator/mt6392-regulator.c:181:18: warning: unused variable 'ldo_volt_table1b' [-Wunused-const-variable]
     181 | static const u32 ldo_volt_table1b[] = {
         |                  ^~~~~~~~~~~~~~~~
   1 warning generated.


vim +/ldo_volt_table1b +181 drivers/regulator/mt6392-regulator.c

   180	
 > 181	static const u32 ldo_volt_table1b[] = {
   182		1500000, 1800000, 2500000, 2800000,
   183	};
   184	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

