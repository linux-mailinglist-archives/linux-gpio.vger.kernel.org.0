Return-Path: <linux-gpio+bounces-24871-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 226AFB33347
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 01:27:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B068B7AEFA7
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Aug 2025 23:25:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89EA42580F2;
	Sun, 24 Aug 2025 23:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HA7cGAIU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2458219319;
	Sun, 24 Aug 2025 23:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756078030; cv=none; b=GzaR1xOJTG+tqPDGiZyjXQspyWffdSQtmPQKZkWGf04K5EXD1/SfbY5R9rWM86bPJCyS8Zk7wvAGQH9JJSObsTHPkxpQwSy7hSeMV/e9YY89DoszcjBVxtDb+VJW0gq4Pj8t1jhKRvLffC2lAuTvJg7ARC+k9Z/HtiPB0zzlZ6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756078030; c=relaxed/simple;
	bh=uZycFtq4HWobblKsAM7DWXlaK0GqW7YFhmxQIB8PTr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E4isrCf5YlQj/neEl0GaZtjXN1LE4OlUWvJsXctdL300ZTxdF+kc5Ulq8Xmd3ad1dmd+Hudu1HwCRU620f6cxig+NCuvH5zdi7kQobktIVgfQMhE6qrWvq4n19n7YUaBI2Uy9Yuk2Kjggy3tN2wOr2O5bjJBOM+L79ChKTbgLcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HA7cGAIU; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756078029; x=1787614029;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uZycFtq4HWobblKsAM7DWXlaK0GqW7YFhmxQIB8PTr0=;
  b=HA7cGAIUGDbhfO2WwAzVH4zK6tSO7D2HQI6sW/vTNTlZNR+skAf5f1jf
   vBVCIFG7NraeZFKvyGM2CbTiA5x2KAjNao4zKftCd7CMIRueSQYC7H3OT
   Pz+NR9xETzq6HPINSApwxYgpeVMmpEr7+qYTwgkqc1HcugNrLdakAkLgZ
   5Z6tBk9R1KoFBWeyYf0xylSDjLjIrOa5HmEbQwKx0+qHrmf0YIAHHvnFP
   kf2PPvzKdGsUTP+HKDqYGkhaG6PmE/ah46Oi9b/cgNDLL26QtDartjtNu
   sAc7nj3nN0xHVSlU3R4N3Pqnfp/igvJJTqSTJ+0rDjk+TzCs4UegEspZD
   g==;
X-CSE-ConnectionGUID: MgUyVngUS02vEHPfxIw3jg==
X-CSE-MsgGUID: Zt5tB7MOQz6F84eaiXNdpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="80881771"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="80881771"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2025 16:27:08 -0700
X-CSE-ConnectionGUID: WgxCIVdaS7KSshHTn4/VUw==
X-CSE-MsgGUID: eAkxHeOyTPeiOqumhjXJ8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="169334994"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 24 Aug 2025 16:27:05 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uqK68-000NFz-2K;
	Sun, 24 Aug 2025 23:26:26 +0000
Date: Mon, 25 Aug 2025 07:24:40 +0800
From: kernel test robot <lkp@intel.com>
To: Nickolay Goppen <setotau@yandex.ru>,
	Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
	Nickolay Goppen <setotau@yandex.ru>
Subject: Re: [PATCH 1/3] pinctrl: qcom: lpass-lpi: Introduce pin_offset
 callback
Message-ID: <202508250651.QMqSAkyR-lkp@intel.com>
References: <20250824-sdm660-lpass-lpi-v1-1-003d5cc28234@yandex.ru>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250824-sdm660-lpass-lpi-v1-1-003d5cc28234@yandex.ru>

Hi Nickolay,

kernel test robot noticed the following build errors:

[auto build test ERROR on 038d61fd642278bab63ee8ef722c50d10ab01e8f]

url:    https://github.com/intel-lab-lkp/linux/commits/Nickolay-Goppen/pinctrl-qcom-lpass-lpi-Introduce-pin_offset-callback/20250825-045348
base:   038d61fd642278bab63ee8ef722c50d10ab01e8f
patch link:    https://lore.kernel.org/r/20250824-sdm660-lpass-lpi-v1-1-003d5cc28234%40yandex.ru
patch subject: [PATCH 1/3] pinctrl: qcom: lpass-lpi: Introduce pin_offset callback
config: sh-randconfig-002-20250825 (https://download.01.org/0day-ci/archive/20250825/202508250651.QMqSAkyR-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250825/202508250651.QMqSAkyR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508250651.QMqSAkyR-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "pin_offset_default" [drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.ko] undefined!
>> ERROR: modpost: "pin_offset_default" [drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.ko] undefined!
>> ERROR: modpost: "pin_offset_default" [drivers/pinctrl/qcom/pinctrl-sm8350-lpass-lpi.ko] undefined!
>> ERROR: modpost: "pin_offset_default" [drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.ko] undefined!
>> ERROR: modpost: "pin_offset_default" [drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.ko] undefined!
>> ERROR: modpost: "pin_offset_default" [drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.ko] undefined!
ERROR: modpost: "devm_clk_hw_register" [drivers/media/i2c/tc358746.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

