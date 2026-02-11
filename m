Return-Path: <linux-gpio+bounces-31582-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICozN0oajGn9ggAAu9opvQ
	(envelope-from <linux-gpio+bounces-31582-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 06:57:30 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 113FC1218A0
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 06:57:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 554973014F48
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 05:57:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 440BA349B04;
	Wed, 11 Feb 2026 05:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NX2TBbv1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28B130EF94;
	Wed, 11 Feb 2026 05:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770789443; cv=none; b=D+sJTeaJrtyC3F6/Sb90sRtD+tZeLtnQCcPhjVGfxmKTfQbJe+0kojcUdxipx60HNij59j78R//jBrnwTx4Cxf2lxQ6+LvXvHFyG1ycpHeqjzkhGnhU7zFagE5t9py7Ts8YLpnRStHMMER3bc+YoSSB/wYCSSUU9sUB7V/KtnfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770789443; c=relaxed/simple;
	bh=WnpB/MHUvOu0MxaG9qXi+XunVyvMIMGcsZJjH30GK1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nMVk7aV3ZQzQU9mVTph3JjoOH3X9RV39Wbm3sAvgF3sd6MTZUBfxGeJomRJ4gUsXKP4YCkId38EJkPsADLA3BBQ5GcitKKsCZD0uVQwg5Zqbh5cHQ22QpXmjzu+mD5WnjV/d6ihQPCrsQpWu+0WMlEOs8IyX3AJReoChI8w+wRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NX2TBbv1; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770789442; x=1802325442;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WnpB/MHUvOu0MxaG9qXi+XunVyvMIMGcsZJjH30GK1s=;
  b=NX2TBbv1xhrHswGVJURVxU3XzgKWSE4ETUlYUuzHoK16HCXXjusbfQWB
   Ajnx1SuFy/T+X9ks2aOT1BMoBADM9/I6s/tYWxHDItRtBM4XDzo3hdVwK
   EWsKQY9G+xTLTtBC5KU9eEZKvMANa1MrwznzvkotZFO8idSYaAbco7ds6
   2ELNtUyeAX83PSBHbX+Xx8djkSdk4hMmFrZ+HZlvYE+2vyQ0tOL0KxTST
   bVQQyOKr4AzZf/1vQVaJ6Cc2UhALkKvhKudvLpKRVl2DlBRKQJ7TuHlD8
   8eHfm7L+kmwSgSk2p0hroZZy5L1iTgYoB8TxfJffWuqLu9u6k9je1voTZ
   g==;
X-CSE-ConnectionGUID: UbHVe8RET1SbHgwpe0DJbw==
X-CSE-MsgGUID: m3w9gAj+SNiM6IC3s0bS/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="94569681"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="94569681"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 21:57:21 -0800
X-CSE-ConnectionGUID: Cp3x9V8wSLW7rubOh6WZ5A==
X-CSE-MsgGUID: H3wgMnd3QcCarV66oRkcfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="212176563"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 10 Feb 2026 21:57:15 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vq3Ds-00000000piq-4C4o;
	Wed, 11 Feb 2026 05:57:13 +0000
Date: Wed, 11 Feb 2026 13:56:41 +0800
From: kernel test robot <lkp@intel.com>
To: Shenwei Wang <shenwei.wang@nxp.com>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>
Cc: oe-kbuild-all@lists.linux.dev,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-imx@nxp.com,
	arnaud.pouliquen@foss.st.com, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v7 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Message-ID: <202602111320.C3eHRtNV-lkp@intel.com>
References: <20260210170814.406883-4-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210170814.406883-4-shenwei.wang@nxp.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FREEMAIL_CC(0.00)[lists.linux.dev,pengutronix.de,gmail.com,nxp.com,vger.kernel.org,lists.infradead.org,foss.st.com,lunn.ch];
	TAGGED_FROM(0.00)[bounces-31582-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:mid,intel.com:dkim,intel.com:email,01.org:url]
X-Rspamd-Queue-Id: 113FC1218A0
X-Rspamd-Action: no action

Hi Shenwei,

kernel test robot noticed the following build errors:

[auto build test ERROR on brgl/gpio/for-next]
[also build test ERROR on robh/for-next remoteproc/rproc-next linus/master v6.19 next-20260210]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shenwei-Wang/dt-bindings-remoteproc-imx_rproc-Add-rpmsg-subnode-support/20260211-011505
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20260210170814.406883-4-shenwei.wang%40nxp.com
patch subject: [PATCH v7 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
config: nios2-randconfig-r054-20260211 (https://download.01.org/0day-ci/archive/20260211/202602111320.C3eHRtNV-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602111320.C3eHRtNV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602111320.C3eHRtNV-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: drivers/gpio/gpio-rpmsg.o: in function `rpmsg_get_channel_ofnode':
>> drivers/gpio/gpio-rpmsg.c:473: undefined reference to `rproc_get_by_child'
>> drivers/gpio/gpio-rpmsg.c:473:(.text+0x454): relocation truncated to fit: R_NIOS2_CALL26 against `rproc_get_by_child'
   nios2-linux-ld: drivers/gpio/gpio-rpmsg.o: in function `rpmsg_get_rproc_node_name':
   drivers/gpio/gpio-rpmsg.c:450: undefined reference to `rproc_get_by_child'
   drivers/gpio/gpio-rpmsg.c:450:(.text+0x4e0): relocation truncated to fit: R_NIOS2_CALL26 against `rproc_get_by_child'


vim +473 drivers/gpio/gpio-rpmsg.c

   466	
   467	static struct device_node *
   468	rpmsg_get_channel_ofnode(struct rpmsg_device *rpdev, char *chan_name)
   469	{
   470		struct device_node *np_chan = NULL, *np;
   471		struct rproc *rproc;
   472	
 > 473		rproc = rproc_get_by_child(&rpdev->dev);
   474		if (!rproc)
   475			return NULL;
   476	
   477		np = of_node_get(rproc->dev.of_node);
   478		if (!np && rproc->dev.parent)
   479			np = of_node_get(rproc->dev.parent->of_node);
   480	
   481		if (np) {
   482			/* Balance the of_node_put() performed by of_find_node_by_name(). */
   483			of_node_get(np);
   484			np_chan = of_find_node_by_name(np, chan_name);
   485			of_node_put(np);
   486		}
   487	
   488		return np_chan;
   489	}
   490	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

