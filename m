Return-Path: <linux-gpio+bounces-31613-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGURAECUjGlIrQAAu9opvQ
	(envelope-from <linux-gpio+bounces-31613-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 15:37:52 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9798B1254CD
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 15:37:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3A583011756
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 14:37:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A039E2BE643;
	Wed, 11 Feb 2026 14:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QiHHMXte"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5ABC183CC3;
	Wed, 11 Feb 2026 14:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770820663; cv=none; b=qQS20iAPov+II/bwvPwrQH+WA3PdRYksZ4YxlHTp6lHz0dKh5gMSZ/I6dEuRPckKYR/REKZ513zUkxHs1xN7bBbcAAD0+eYr+OYR26PsnPO1fZrGdv2WQ1Bej0YLuIfdVTPIgHDSStqC3svU4TOuvmgurw6+Gqpbogp2fffU3UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770820663; c=relaxed/simple;
	bh=6a6C1Oo2VXTtwxfCgh52YB7e/Bvv2ZnnllQSS7+LNqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NZG6pAKiqMDOxdwVIsDMQSQXiwYY6Q+X2GN74Zsr0ks39lHn3qsE1CRSj1N0n+YnUZSWM2C3rt4JOA8vlO3Iiz1iCRXCKwc/PBQ6rE1loT8//x01Itw0J7X8NGieeodr279H2KRmdCM4+dOxmRDrCLBL0SiiRRuPOEFX28yhQS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QiHHMXte; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770820661; x=1802356661;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6a6C1Oo2VXTtwxfCgh52YB7e/Bvv2ZnnllQSS7+LNqk=;
  b=QiHHMXteZNhlfHyCFWZJM0u6+3nJpOdbIOgmoq7KiG4kpBEh3DSzoX5+
   iq7lLM3R+LbO4D6GSs47sbO57d8mGcRGymBUjzTdfeUxpdzvNT71fIszw
   nQ8bL7fESwb4VWLfH3HfbG4Qy1KLeJCc4GZPZFkzNFtqQ9i1SyC+RY7I2
   HM0PFiySGIhwE7SrwR9sSDX7V93wBAKUL37WZCxcs6w+EMnDP3kM5ve+i
   9chrVjAIsJoOtrhUYwLE6K5P3LsJJv76OcGmPOur2sN1kr9A1Rqi7QKJY
   Heehr15gEiSan5wouf9CCBFK/joQ6QmKVsOkCOXqAzz2mYFQyN0nkEJsS
   w==;
X-CSE-ConnectionGUID: 8BUAK+DlQ+SdBjRzA86YLw==
X-CSE-MsgGUID: 7+5ij7IXRtu4fJ+CUuulqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="83410591"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="83410591"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 06:37:40 -0800
X-CSE-ConnectionGUID: 1olVpYRZQImHZO61gK3Adw==
X-CSE-MsgGUID: WJelymD/S8WHbDyy+MdGww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="212094960"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Feb 2026 06:37:34 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqBLQ-00000000q4e-2HC3;
	Wed, 11 Feb 2026 14:37:32 +0000
Date: Wed, 11 Feb 2026 22:37:05 +0800
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
Message-ID: <202602112252.gWFirLCA-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FREEMAIL_CC(0.00)[lists.linux.dev,pengutronix.de,gmail.com,nxp.com,vger.kernel.org,lists.infradead.org,foss.st.com,lunn.ch];
	TAGGED_FROM(0.00)[bounces-31613-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:mid,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: 9798B1254CD
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
config: sparc-randconfig-r133-20260211 (https://download.01.org/0day-ci/archive/20260211/202602112252.gWFirLCA-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602112252.gWFirLCA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602112252.gWFirLCA-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc-linux-ld: drivers/gpio/gpio-rpmsg.o: in function `rpmsg_gpio_channel_probe':
>> gpio-rpmsg.c:(.text+0x788): undefined reference to `rproc_get_by_child'
>> sparc-linux-ld: gpio-rpmsg.c:(.text+0x834): undefined reference to `rproc_get_by_child'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

