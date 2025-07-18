Return-Path: <linux-gpio+bounces-23428-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DD653B09943
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 03:38:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E94AE16A81B
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 01:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF0FB19F11F;
	Fri, 18 Jul 2025 01:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GFSBLDIT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D41192D68;
	Fri, 18 Jul 2025 01:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752802687; cv=none; b=md28EvsIoTUd05WvWT3xwtf5hsuXZLfrfbFLcFAKJOTwPGxUPCHUuiVNs5mWOS4WD2o6Ge2tWsunBv0CBbfID/MZE13oyDZz1Cfs/80EmD5+/omf45gNOe+p2BA/Iu7kqwU6aJtrKnbGqMhnbD1w3sPiBXjs3NFMan+i93QJ3bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752802687; c=relaxed/simple;
	bh=Gxsb4twQZ7MutHEiCFwLHr/tvz7swWwvohxSb9zPqnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X+svdXMtQbTGTo5RSg+ysn4z9OLHsGS2udfsfoK7oct2FylmsYwj0PjCnW9Iq2/Y53hs74g1ztVnO4jHmG2qtu8Zy4T9/dQIbgkckJQBrcZPTfLwU4YCumJdLrHMjSnFhWAYZ8xSDGR98g4bb56UFSlcJup8euefPhpq0MxpG/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GFSBLDIT; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752802686; x=1784338686;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Gxsb4twQZ7MutHEiCFwLHr/tvz7swWwvohxSb9zPqnI=;
  b=GFSBLDITQ+l58IoZ9XTMrSx8ZlUcrziKWd2vxr63qEyF1U+Z+fVXZjae
   M2k496EkQHtulhi9cdcNcv7JUM32DQPB1Sr7jgDKYncnxcJg8mmbnn+62
   h5Ln8HueQ4q7q47ropDSYls6to9xNFUEgyJ/ALPNw1SjMDvW/cZOivF95
   tuhUSCetGQS8SQ/2XbWktUyNYDLmKi2A4HDrk0UofvQxnnzdE6QergkMP
   hclqe/ZNRadxnK/LAQr/xzljISRXWKLYDBAJ5gNWROPRJ2ajx8r/Yji7W
   X7d4HqMcrmqS+76KzFq8ogmWZ0wJ5s1ZMWo7YoFo3rv1JySiIIVuOezmF
   w==;
X-CSE-ConnectionGUID: eFpetS8qQYmExQAtivm0nA==
X-CSE-MsgGUID: YV+dlN8xS1Gjls+VcNuHYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="72661797"
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; 
   d="scan'208";a="72661797"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 18:38:03 -0700
X-CSE-ConnectionGUID: Z2UUVbOuQFuAmZyMGnYsEA==
X-CSE-MsgGUID: 5uXw69UySuOliODhA/VrLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; 
   d="scan'208";a="162216196"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Jul 2025 18:37:59 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uca2u-000ECp-2C;
	Fri, 18 Jul 2025 01:37:56 +0000
Date: Fri, 18 Jul 2025 09:37:14 +0800
From: kernel test robot <lkp@intel.com>
To: Cosmin Tanislav <demonsingur@gmail.com>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v6 15/24] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer framework
Message-ID: <202507180909.8Mnk3jkp-lkp@intel.com>
References: <20250716193111.942217-16-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716193111.942217-16-demonsingur@gmail.com>

Hi Cosmin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20250716]
[also build test WARNING on v6.16-rc6]
[cannot apply to robh/for-next staging/staging-testing staging/staging-next staging/staging-linus arm64/for-next/core linus/master v6.16-rc6 v6.16-rc5 v6.16-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cosmin-Tanislav/media-mc-Add-INTERNAL-pad-flag/20250717-033901
base:   next-20250716
patch link:    https://lore.kernel.org/r/20250716193111.942217-16-demonsingur%40gmail.com
patch subject: [PATCH v6 15/24] media: i2c: add Maxim GMSL2/3 serializer and deserializer framework
config: nios2-kismet-CONFIG_I2C_MUX-CONFIG_VIDEO_MAXIM_SERDES-0-0 (https://download.01.org/0day-ci/archive/20250718/202507180909.8Mnk3jkp-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250718/202507180909.8Mnk3jkp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507180909.8Mnk3jkp-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for I2C_MUX when selected by VIDEO_MAXIM_SERDES
   WARNING: unmet direct dependencies detected for I2C_MUX
     Depends on [n]: I2C [=n]
     Selected by [y]:
     - VIDEO_MAXIM_SERDES [=y] && MEDIA_SUPPORT [=y] && VIDEO_DEV [=y]
   
   WARNING: unmet direct dependencies detected for I2C_ATR
     Depends on [n]: I2C [=n]
     Selected by [y]:
     - VIDEO_MAXIM_SERDES [=y] && MEDIA_SUPPORT [=y] && VIDEO_DEV [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

