Return-Path: <linux-gpio+bounces-29785-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A3718CD525B
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Dec 2025 09:47:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 12D7030305B9
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Dec 2025 08:43:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25EBA30E0DF;
	Mon, 22 Dec 2025 08:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VsM5g689"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3752E3043D2;
	Mon, 22 Dec 2025 08:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766393001; cv=none; b=ov53Em13I96OXSbNyjQ1PvwKFtcFhim262o40Yr2unL2XptnCdPdrrpd+iyfJnBcFBlJk54bbPTcf7ZUM0s4wNPOQF6PWvX9Ng7OfG77IJasugoEbBvJ7Xv9dPf/xBgLngBFWW8+Mpvh40fM5vU+oLNAG3M2uRzgoCBuxFpKPvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766393001; c=relaxed/simple;
	bh=GRcYlQBruRngt7LkX5/K9L6heF2AHR0uznAPu0+t6A0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aFPS5txfFm8gtyK0Y7ZO5Ym02FIAeoag//XT82Q8F2r16ZUQlpODzixbrTyNauOqRF6B4vhh+wLKv+O0wJ44Bnjd5ljZmNeGVaEIf8sBZq9F77aQ+CXU07u3YRPjWWNGUPDXwnOE0kHAkavXIrl9MkIK203NrhWyKtQ0Lx5BN58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VsM5g689; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766393000; x=1797929000;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GRcYlQBruRngt7LkX5/K9L6heF2AHR0uznAPu0+t6A0=;
  b=VsM5g689PESY/qyz5a1ZgevV924aYcV2zd6mg8KlFulRKRxBJjipsaZZ
   UWyNCB18nBk0xctd0kP1/ANRH36+bstxOVnLj0dxCRKGy7TXTDVDl1Rns
   t9LiEVSBfGPvuV5FHjQfsM/nIg7UYSUg/jzQ2ltLPPAAS3T4SB7iWNtAP
   KDPXW1yPXj9wpAqIUnZQQVwJwkFRvoZw3gSO9EpDt4ZXHmiG4jkqVQzOT
   GxSXcbPOHAmg1Yy5QvVL9o+bP7YXqbYNTsxu45deF9N0bKl+8K7/Xwd9g
   2YtnOYeJJQv7GeXuS5+oqA2H7urmTA3kBr4ibgndjyUcLpQJKF4xjinau
   A==;
X-CSE-ConnectionGUID: LCUUFYvJTpevpmBtiGM6Mg==
X-CSE-MsgGUID: Y2JlwDWhRs2FkCoFNK01xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="68000150"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="68000150"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 00:43:20 -0800
X-CSE-ConnectionGUID: S07oB/BDQSaGmbOKpqOOhQ==
X-CSE-MsgGUID: n2Ww8oiZS1yQtD5njgISaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="199979885"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 22 Dec 2025 00:43:16 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXbVZ-000000005Pk-3usP;
	Mon, 22 Dec 2025 08:43:13 +0000
Date: Mon, 22 Dec 2025 09:43:03 +0100
From: kernel test robot <lkp@intel.com>
To: Sander Vanheule <sander@svanheule.net>, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Michael Walle <mwalle@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, Sander Vanheule <sander@svanheule.net>
Subject: Re: [PATCH v9 3/6] mfd: Add RTL8231 core device
Message-ID: <202512220956.FVakrdhV-lkp@intel.com>
References: <20251215175115.135294-4-sander@svanheule.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215175115.135294-4-sander@svanheule.net>

Hi Sander,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-mfd/for-mfd-fixes]
[also build test WARNING on lee-leds/for-leds-next linusw-pinctrl/devel linusw-pinctrl/for-next linus/master v6.19-rc2 next-20251219]
[cannot apply to lee-mfd/for-mfd-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sander-Vanheule/dt-bindings-leds-Binding-for-RTL8231-scan-matrix/20251216-015552
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-fixes
patch link:    https://lore.kernel.org/r/20251215175115.135294-4-sander%40svanheule.net
patch subject: [PATCH v9 3/6] mfd: Add RTL8231 core device
config: alpha-kismet-CONFIG_MDIO_BUS-CONFIG_REGMAP_MDIO-0-0 (https://download.01.org/0day-ci/archive/20251222/202512220956.FVakrdhV-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251222/202512220956.FVakrdhV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512220956.FVakrdhV-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for MDIO_BUS when selected by REGMAP_MDIO
   WARNING: unmet direct dependencies detected for MDIO_BUS
     Depends on [n]: NETDEVICES [=n]
     Selected by [y]:
     - REGMAP_MDIO [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

