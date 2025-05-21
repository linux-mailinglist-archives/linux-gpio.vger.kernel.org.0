Return-Path: <linux-gpio+bounces-20451-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C11CABFEFD
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 23:35:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1BAE1BA3535
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 21:35:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36E5C22B5BC;
	Wed, 21 May 2025 21:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mz5yFJmz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F921FDE19;
	Wed, 21 May 2025 21:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747863327; cv=none; b=BakOBG2PF0W8UYpx1uaF99tKpJv9vc8Wwdhl2q8y91IBylU7yDha7hwa3YOtCdSBtZFbHuvWK0nhTP8ybKlgC2N6Rp42dKOtTskfa0EfjKB81LQLmSS3tlVCiD0UVbDMkHXhJJXbzp/UKGhA1m1E9M4dexzQnBIYcIV+UJEoulQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747863327; c=relaxed/simple;
	bh=JY3+EDGgRxvxsrUQbrwFOjb3pPNzoNfUgnXnt2viI8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C8zF/D/V/LU+IBGpz1O4GwFH8PhSW8svFLZr7/bXcE1AhgzMsdiQz42UIUgTN8xi4mJcwvWNrz62OcC3NZFzC3QObgKxbpJ8OYZL7vPDfXErsTjzXEuUSdd50qmTGHizNVXA8DT4YDGN6dl1NcramhQsqlgn7ojgNf4g0pdgxxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mz5yFJmz; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747863325; x=1779399325;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=JY3+EDGgRxvxsrUQbrwFOjb3pPNzoNfUgnXnt2viI8E=;
  b=Mz5yFJmzs1kfGGoujmyiqihleoW6RKXAjj3MwFqv9BDwSUCG+NYT6CrZ
   OHtLhLtBEKrRc0LT4pw2CqD5qIPPVnyZk9gWYu96ew9aAlsYrNipUE5aq
   DXm5/pxMEUgOZOSMZbAWmpEncyhCnQ8Lrprnx9Dl4ghOweX8ORQaWOpN0
   HH/I05Dcb0O1dZmMe6xg6zhjBxo8npuQUs6b/QJ2596VWTczsOTZXYFf6
   3bq9ckI+MLO2qlb54KW9fQrKlblXaUelOoUwhogMkvFKIDlAd8FnqBDSZ
   xUcdT1kOjs5KFYB2+Chk6JZTgwLSV0T5efwVTXmA4/6W1qb2San7V8Be3
   g==;
X-CSE-ConnectionGUID: 9uRVCFAMQxycbOFn2oLTfw==
X-CSE-MsgGUID: OjNn1xedT4i8XoMg6nMj2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="61208554"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="61208554"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 14:35:21 -0700
X-CSE-ConnectionGUID: 3aiUfBnrQaSQSzx9A/Y0FQ==
X-CSE-MsgGUID: yUBaWO8+THO92MV2mqshbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="145393226"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 21 May 2025 14:35:18 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHr5n-000Oee-2g;
	Wed, 21 May 2025 21:35:15 +0000
Date: Thu, 22 May 2025 05:34:52 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	=?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>
Subject: Re: [PATCH v2 2/8] pinctrl: stm32: Introduce HDP driver
Message-ID: <202505220509.cwmpJvcz-lkp@intel.com>
References: <20250520-hdp-upstream-v2-2-53f6b8b5ffc8@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250520-hdp-upstream-v2-2-53f6b8b5ffc8@foss.st.com>

Hi Clément,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 09fac5c576bbff764dddf2baca0038b359376fd8]

url:    https://github.com/intel-lab-lkp/linux/commits/Cl-ment-Le-Goffic/dt-bindings-pinctrl-stm32-Introduce-HDP/20250520-230751
base:   09fac5c576bbff764dddf2baca0038b359376fd8
patch link:    https://lore.kernel.org/r/20250520-hdp-upstream-v2-2-53f6b8b5ffc8%40foss.st.com
patch subject: [PATCH v2 2/8] pinctrl: stm32: Introduce HDP driver
config: arc-randconfig-r121-20250522 (https://download.01.org/0day-ci/archive/20250522/202505220509.cwmpJvcz-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250522/202505220509.cwmpJvcz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505220509.cwmpJvcz-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pinctrl/stm32/pinctrl-stm32-hdp.c:720:1: sparse: sparse: symbol 'stm32_hdp_pm_ops' was not declared. Should it be static?

vim +/stm32_hdp_pm_ops +720 drivers/pinctrl/stm32/pinctrl-stm32-hdp.c

   719	
 > 720	DEFINE_SIMPLE_DEV_PM_OPS(stm32_hdp_pm_ops, stm32_hdp_suspend, stm32_hdp_resume);
   721	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

