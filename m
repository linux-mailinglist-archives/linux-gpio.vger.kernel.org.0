Return-Path: <linux-gpio+bounces-23422-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D57B0968D
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Jul 2025 23:52:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 581D94E508C
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Jul 2025 21:52:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4568237173;
	Thu, 17 Jul 2025 21:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cuiYKGwC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B6F2264D2;
	Thu, 17 Jul 2025 21:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752789162; cv=none; b=PWMRBiTFLlnkB+9z9r0XaMIOkJTn1MPtsMfyYdz1Jy+mMPO6QdLgY1axiUunHAccPTNd7DTZFzpeZy9IHGdWj5yodpnaiK1ACY+zNbQ8ibRKmNmCKZmjUCt2r4njf63QJMEeJzt4ZgpHZs5oFFc5/FaYXSUFA+IU1tsh5y9FdMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752789162; c=relaxed/simple;
	bh=5CBicrbhXtL9L2WtqL7HdX/deKcqvUNeJR9TBkHR9N0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VnsvzPsQQ4+RcpMaxv6ZwmMA6Hjm4WMvgir+sHn+uTcV9R2/sJl4hUVVzM6Cm7uOTw7YTsbR9fdE+afPEzVUFzmJHYII8K7paOha7DR/Jblq24rl4HdnRPSgkh6Not1Tihf49WPoonPSXY/q7WaY6HELGER5eDvB4tyHbg5st+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cuiYKGwC; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752789161; x=1784325161;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5CBicrbhXtL9L2WtqL7HdX/deKcqvUNeJR9TBkHR9N0=;
  b=cuiYKGwC0oD3ue70EZz03j/dLCR2ehSWUB7Xps4S3EI3Ap6S1NOUk3fg
   qLaIV3BeeR4jGz2ORU4Pd+NEBNS2rvIxabpHmE/xRZLNyZcqX30CuBBd2
   mxf871C0al7YmuStxqgishSQsqoRuHfuLu+vEQDukoIkfyebvwo48gxs/
   hLkjd5uGgz/7A80XQOz/7UQr2VU+B1JNbKra31/fVyhvRRhgQ/zGnJSCm
   ppXb+Z8TrgH6XIkT3L89ZXMVxQ+zz75Jo+JzuflcabVXisVZBq8lhKkre
   dvBjsSdjmF0+/00YqoBmtwUJDsyYF2N+QQ5U52n40Q41IBS8p8sCdKRR/
   A==;
X-CSE-ConnectionGUID: wt3FbwkmS6auDI1U5eofXg==
X-CSE-MsgGUID: Ssos9h8VRsCvfR8E1A9UvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="55021231"
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; 
   d="scan'208";a="55021231"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 14:52:40 -0700
X-CSE-ConnectionGUID: wMDSmwFfQvWxkbaZSiXyJg==
X-CSE-MsgGUID: iTiStihjT2KaBwyiCRyjzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; 
   d="scan'208";a="157980363"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 Jul 2025 14:52:36 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucWWn-000E2p-1y;
	Thu, 17 Jul 2025 21:52:33 +0000
Date: Fri, 18 Jul 2025 05:52:06 +0800
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
Subject: Re: [PATCH v6 18/24] media: i2c: maxim-serdes: add MAX96717 driver
Message-ID: <202507180543.aUfFOLJo-lkp@intel.com>
References: <20250716193111.942217-19-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716193111.942217-19-demonsingur@gmail.com>

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
patch link:    https://lore.kernel.org/r/20250716193111.942217-19-demonsingur%40gmail.com
patch subject: [PATCH v6 18/24] media: i2c: maxim-serdes: add MAX96717 driver
config: nios2-kismet-CONFIG_GENERIC_PINCTRL_GROUPS-CONFIG_VIDEO_MAX96717-0-0 (https://download.01.org/0day-ci/archive/20250718/202507180543.aUfFOLJo-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250718/202507180543.aUfFOLJo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507180543.aUfFOLJo-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for GENERIC_PINCTRL_GROUPS when selected by VIDEO_MAX96717
   WARNING: unmet direct dependencies detected for GENERIC_PINCONF
     Depends on [n]: PINCTRL [=n]
     Selected by [y]:
     - VIDEO_MAX96717 [=y] && MEDIA_SUPPORT [=y] && VIDEO_DEV [=y] && COMMON_CLK [=y]
   
   WARNING: unmet direct dependencies detected for GENERIC_PINMUX_FUNCTIONS
     Depends on [n]: PINCTRL [=n]
     Selected by [y]:
     - VIDEO_MAX96717 [=y] && MEDIA_SUPPORT [=y] && VIDEO_DEV [=y] && COMMON_CLK [=y]
   
   WARNING: unmet direct dependencies detected for GENERIC_PINCTRL_GROUPS
     Depends on [n]: PINCTRL [=n]
     Selected by [y]:
     - VIDEO_MAX96717 [=y] && MEDIA_SUPPORT [=y] && VIDEO_DEV [=y] && COMMON_CLK [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

