Return-Path: <linux-gpio+bounces-31429-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Ra+bG1s4g2ngjwMAu9opvQ
	(envelope-from <linux-gpio+bounces-31429-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 13:15:23 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AD1E5AB3
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 13:15:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B281C3088C85
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Feb 2026 12:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F31702BE639;
	Wed,  4 Feb 2026 12:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jzEUtJeF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CD23A8FEE;
	Wed,  4 Feb 2026 12:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770207026; cv=none; b=ZSZg3mtrQZebwZsmW3eCLXBNPNIUu1pe93ijXxPriYZ4J2XC7utm7gYdzPxP9hcBNU25AN2DmKU6u5jjbtYrTLhVfC/SxJZKlWEfLd6qHW1CHyYQYeLG9cXAg64uj0lEWgP+nOqfhvZcy76WTOo1G6kRugQMewkLKXyao6isyvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770207026; c=relaxed/simple;
	bh=+PD9kPlOhiNRJ5eVE2tCAKpwL+HFCmAsSnc7GfEb0C8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hWkdt7a0Piu65FrKzypBpqlsFU2fnujs7P28H9h1VBwrIUoODPYwiQs1wa4iR0efB//cz7KrNMhsFhrvZRnHB7lcNQAbCtZEXid1CUpw/2Q44OMtHlmarvhWLIxZJjao37lOdb2jBDpxGWSi2AVjbvIGzP6HZQ68m/5YgNJd/tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jzEUtJeF; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770207027; x=1801743027;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+PD9kPlOhiNRJ5eVE2tCAKpwL+HFCmAsSnc7GfEb0C8=;
  b=jzEUtJeFQLf5ajBHeeXaLLx06oXVRJbvyp+2bHxcSmyoS5bYOt0+l9pA
   eo/B001UBR2tinpyBmAScLY2z5N9irWLQUX2UPhvQXnZc6ZVGESPz7leB
   egUrPyV6Stvw2K8Cd0bvs2DNdmphVnoIJ5AggQogYqte1TGZXTn1uksJD
   1N5uBNDXbPRVVPqSp7sFQNjSk3Mm/Cdn6XdAwNaW8wZDWpwyiiA6JQe16
   2hOpKF/PU6pdYJWzMbS3E0jggGn2cgGKJrfwPvomLt7Bk6pUucCeWkZ9t
   XeILeII+mVuG2rdkqlcwO0ZGx40jiX3LngAw9HPevRDgzwSa/ZHmK1EOt
   A==;
X-CSE-ConnectionGUID: 8NItw5L7TKOh6MXOVBn0Tg==
X-CSE-MsgGUID: NggWQ1CCQ8Ox4InlomMzig==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71425503"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="71425503"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 04:10:27 -0800
X-CSE-ConnectionGUID: jMqUk0dMRq+vKyxseg0bNg==
X-CSE-MsgGUID: L6+UxEbmTEq/Tlho+El/GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="209244113"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 04 Feb 2026 04:10:21 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnbi5-00000000hlQ-20h9;
	Wed, 04 Feb 2026 12:10:17 +0000
Date: Wed, 4 Feb 2026 20:10:14 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	=?iso-8859-1?Q?J=E9r=E9mie?= Dautheribes <jeremie.dautheribes@bootlin.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	"Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Subject: Re: [PATCH v3 4/5] gpio: aaeon: Add GPIO driver for SRG-IMX8P MCU
Message-ID: <202602042017.bULyWOXm-lkp@intel.com>
References: <20260203-dev-b4-aaeon-mcu-driver-v3-4-0a19432076ac@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203-dev-b4-aaeon-mcu-driver-v3-4-0a19432076ac@bootlin.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31429-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[bootlin.com,kernel.org,pengutronix.de,gmail.com,linux-watchdog.org,roeck-us.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,01.org:url]
X-Rspamd-Queue-Id: A1AD1E5AB3
X-Rspamd-Action: no action

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on d358e5254674b70f34c847715ca509e46eb81e6f]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Perrot-Schneider-Electric/dt-bindings-vendor-prefixes-Add-AAEON-vendor-prefix/20260204-004221
base:   d358e5254674b70f34c847715ca509e46eb81e6f
patch link:    https://lore.kernel.org/r/20260203-dev-b4-aaeon-mcu-driver-v3-4-0a19432076ac%40bootlin.com
patch subject: [PATCH v3 4/5] gpio: aaeon: Add GPIO driver for SRG-IMX8P MCU
config: mips-randconfig-r113-20260204 (https://download.01.org/0day-ci/archive/20260204/202602042017.bULyWOXm-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260204/202602042017.bULyWOXm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602042017.bULyWOXm-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "aaeon_mcu_i2c_xfer" [drivers/gpio/gpio-aaeon-mcu.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CAN_DEV
   Depends on [n]: NETDEVICES [=n] && CAN [=m]
   Selected by [m]:
   - CAN [=m] && NET [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

