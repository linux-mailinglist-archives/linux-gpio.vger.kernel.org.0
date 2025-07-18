Return-Path: <linux-gpio+bounces-23426-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1187BB098F2
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 02:27:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6E533ABF66
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 00:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3FE2286A9;
	Fri, 18 Jul 2025 00:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wj7lh9G/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDF02E36EF;
	Fri, 18 Jul 2025 00:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752798419; cv=none; b=mIjoLb3nVIueBwbFPNiRCx/lTp02qG5PvGcwYQyQN+jVSa68QBQzL7r9bCW/vyGnJDDM3WxgxVhOx5tAE7uyT20kqBPpJDlT8ON0FpHkY9sQnLxqubaJHrfX9hZ+fNCFs1o3mH+8FAOTA9W2UHQNGNPKgB7nlRDoKl29S7qWQzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752798419; c=relaxed/simple;
	bh=2s19iaScvlr4LwAAreqq4qXppS14HcVbmVXKdPkbTUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k+IEXNpCbswTLHEHb+teNv6RaKpTRw2BlM2aVTlevIZLhEI/jvX5jkisCq2j0NkYkkRMuHyUMKuc4+CcQOd00KKImS1T/widRl9MQ2P9bUD9CeT4470Y9JyymJRTyWxuzZRgi6NEyL8ehwZbv4ylPo31jEX9mHP0lZtmSSOkLJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wj7lh9G/; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752798418; x=1784334418;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2s19iaScvlr4LwAAreqq4qXppS14HcVbmVXKdPkbTUI=;
  b=Wj7lh9G/LBGq43Y+VNPkcvG6lqbjDJZhkBzpAIxNKz2nYd3tIs5PrVuA
   mVsoW55T3ceNqhVLNXAD5KlFGrNAEIxLTMCyb8qJL4N4cGXrsaPHYdI8A
   CW2WDdYWnt/bnkMLDzV17IvtFrx42jUnnXQa6CfLOQTxzmLn+W3HB1zaa
   dCLONMfCmqTSIZfqFkAjrbQQ8hW1eercTER9+iL6r7rm0o4EYV+8yiedA
   am5gVUmEcM/GCIuxNjch57454dE0CqqEPVRo1MXZkHzM9hYHH3s3Q0KN/
   qh/qGp2S+gxtyiNFgwffrGfonIGiPn8mQHbhW40rmt5P6WVELTL0LyC3X
   A==;
X-CSE-ConnectionGUID: eHPgtTi2SfSlsW69FExW1Q==
X-CSE-MsgGUID: /xfJaZZkR5SzUp8X7H9gtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="54946759"
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; 
   d="scan'208";a="54946759"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 17:26:57 -0700
X-CSE-ConnectionGUID: xa/s9jE6RMq3L4doVCOfqA==
X-CSE-MsgGUID: CgZsOIq0Ti2sZFV1e55NhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; 
   d="scan'208";a="181642955"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 17 Jul 2025 17:26:53 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucYw7-000E9v-08;
	Fri, 18 Jul 2025 00:26:51 +0000
Date: Fri, 18 Jul 2025 08:25:55 +0800
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
Message-ID: <202507180835.07NwogM6-lkp@intel.com>
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
config: nios2-kismet-CONFIG_I2C_ATR-CONFIG_VIDEO_MAXIM_SERDES-0-0 (https://download.01.org/0day-ci/archive/20250718/202507180835.07NwogM6-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250718/202507180835.07NwogM6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507180835.07NwogM6-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for I2C_ATR when selected by VIDEO_MAXIM_SERDES
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

