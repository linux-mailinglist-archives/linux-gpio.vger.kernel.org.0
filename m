Return-Path: <linux-gpio+bounces-20453-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8C3AC043D
	for <lists+linux-gpio@lfdr.de>; Thu, 22 May 2025 07:51:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16B149E7745
	for <lists+linux-gpio@lfdr.de>; Thu, 22 May 2025 05:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86F0D1C3306;
	Thu, 22 May 2025 05:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bKn3IGfc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4401AF0B5;
	Thu, 22 May 2025 05:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747893073; cv=none; b=AKFoN5I8/wD4Dqpyy6kNMFhsfy3KxFBTnm4hI8dJYE2LDdB/jWUGUWb4ZWn9Ds3DJ4TBm6AA7QIVwmsqVTFBK6YFwTvdp5LZxmbG0mHRo5mXY4UAq6rSgAAfk5xv0rwiOQlpKKBViFauha+Oeb0yP/2bn3XwVgZidkuz6oFQ9k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747893073; c=relaxed/simple;
	bh=wo0GrAIDnNGwKbCU5YwR5h8YPBDNfUgDDwhK7IutCPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hTikXO5itjLQsF2CfZd9nsi+UoFC0blCgEWdeZvL4R0susqIleCA2q1w88dtpzdUUjgPzR7fyYUuEtlZd15yeu4mFURf/GhwRYaTCjEzxDKFFWOBV7CQuJmFVxYglTtbj1I+Ma1xlE8dH9ehcfaVDHfCNYn+oGf7NQKKGdCQHsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bKn3IGfc; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747893070; x=1779429070;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wo0GrAIDnNGwKbCU5YwR5h8YPBDNfUgDDwhK7IutCPQ=;
  b=bKn3IGfcuwhPmH3Ex/xqnwMqS2pXeorApksNraMO0tj/2iq1JWnKqrg2
   Sapfl+Q94SnZ7yxBAVk/U6uoL17KEF/4ppFkP52AT+c4qUaMNhm1IrGBu
   IfvhGJYJaO+uMBp6MmXUf3Fxz59rfjZ2i/NmNU16XR/h/3cE2gXIHc6qc
   0Bl01rHYPFcQ0kPcoJyxOr5xBAXAwDNaATrI1VzZPtv85H8lKxKqv3zay
   8yyJdgqYm1gw+F1uoR6Twpt3ypT8JM2p/Pa2MaG4jiZfJToHRoxtCB8Vp
   Lpc9/ddaKjLQOvHojlu3RM8RgB5dQyKLyWT/9exBasvV/0Wp/1Hfb2HIE
   g==;
X-CSE-ConnectionGUID: qi7r7bAyTlKBQloZPrLIlw==
X-CSE-MsgGUID: 8YVi7VM4S6aHRVecQ+HMoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="72427103"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="72427103"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 22:51:09 -0700
X-CSE-ConnectionGUID: HxbXkY2RRvSVagwRKRFk3g==
X-CSE-MsgGUID: o+hJjS+yQou7exiCuk2NqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="140952649"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 21 May 2025 22:51:05 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHypa-000OxY-33;
	Thu, 22 May 2025 05:51:02 +0000
Date: Thu, 22 May 2025 13:50:33 +0800
From: kernel test robot <lkp@intel.com>
To: Yulin Lu <luyulin@eswincomputing.com>, linus.walleij@linaro.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, kees@kernel.org,
	gustavoars@kernel.org, brgl@bgdev.pl,
	linux-hardening@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, ningyu@eswincomputing.com,
	zhengyu@eswincomputing.com, linmin@eswincomputing.com,
	huangyifeng@eswincomputing.com, fenglin@eswincomputing.com,
	lianghujun@eswincomputing.com,
	Yulin Lu <luyulin@eswincomputing.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v4 2/2] pinctrl: eswin: Add EIC7700 pinctrl driver
Message-ID: <202505221319.lOivf9w0-lkp@intel.com>
References: <20250515054736.922-1-luyulin@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515054736.922-1-luyulin@eswincomputing.com>

Hi Yulin,

kernel test robot noticed the following build errors:

[auto build test ERROR on linusw-pinctrl/devel]
[also build test ERROR on linusw-pinctrl/for-next robh/for-next linus/master v6.15-rc7 next-20250521]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yulin-Lu/dt-bindings-pinctrl-eswin-Document-for-EIC7700-SoC/20250515-134847
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20250515054736.922-1-luyulin%40eswincomputing.com
patch subject: [PATCH v4 2/2] pinctrl: eswin: Add EIC7700 pinctrl driver
config: s390-randconfig-r132-20250522 (https://download.01.org/0day-ci/archive/20250522/202505221319.lOivf9w0-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce: (https://download.01.org/0day-ci/archive/20250522/202505221319.lOivf9w0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505221319.lOivf9w0-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-mgr-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-bridge-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-region-test.o
>> ERROR: modpost: "pinconf_generic_dt_node_to_map" [drivers/pinctrl/pinctrl-eic7700.ko] undefined!
>> ERROR: modpost: "pinconf_generic_dt_free_map" [drivers/pinctrl/pinctrl-eic7700.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

