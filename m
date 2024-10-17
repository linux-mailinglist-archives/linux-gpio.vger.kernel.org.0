Return-Path: <linux-gpio+bounces-11488-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B80B79A185E
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 04:06:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D21D285DD9
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 02:06:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B8D03B182;
	Thu, 17 Oct 2024 02:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SwnGJy9O"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D0034CF5;
	Thu, 17 Oct 2024 02:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729130761; cv=none; b=QofT1U0IOIx7ejRPToWS+bbvCnbxoZ5NZYSSpYlhnWSFSeQaR5mngT7RqnqhxbMYcHPx+ddlnoiOiYBZ6wnciK5EC4BK2Gd7B0nj7+P7SgNO0HzWjFiEMI+TirF/+wrO/8wvjMZKHShFMbD/iVRrQtj0ewwY2qkmsQgOj48VbWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729130761; c=relaxed/simple;
	bh=4Mna6OEjLgG7GmlUcMbQtaxe3lvjAF5M+fby7Mt+Mko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P+QVWwS4h9T5rtF/aojbJHJT3+i6EmqHKIUULjPRwery/FcP8t4itnDx0znK03ILNp/zw02EoQ8OJUFI9YO3+ODqThDEgEdO1Zqpj1j7NuSgw8qDGONW303a0e3Ld+QGBP5HjEJ6OIE31HI3rEBe7mpm8Mm+gZh0pA22xwlsSSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SwnGJy9O; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729130759; x=1760666759;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4Mna6OEjLgG7GmlUcMbQtaxe3lvjAF5M+fby7Mt+Mko=;
  b=SwnGJy9OjdnaUpPyP/h10gc124a4ZxWnw4aSn2qOS7nbv9rqnSTmSHnd
   N0az709togEuwvGSQDgjmFZJ0s9BV95rUvSN4ajjsTF+FuMQMVGvJpnu/
   2tsLhe41qEOoxVNYEeDU0+/0aW+GG4T/bFqKKY5gHF3ltQeE6XTqy01Rb
   eMiWVz/T3Ly5M0vb0CfscraQhOudZ8coKpf48Td8Uwsc/ONaFGEKK+W1U
   OZJnA0IF36xYbjToWGMMB63osDn31zYjS2zMNNfKUdwr+7WWyPDonHwbQ
   YARNBNkFW3P9wE7ylG1SRCHr0QlxjWYSyqXrNIiq5tCCpg3kmw+JJ5eCE
   Q==;
X-CSE-ConnectionGUID: 7MIL0nJeQim+B/OvsC9rSg==
X-CSE-MsgGUID: LrN0D3QsThCRdwfrk1dTPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="28693154"
X-IronPort-AV: E=Sophos;i="6.11,209,1725346800"; 
   d="scan'208";a="28693154"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 19:05:55 -0700
X-CSE-ConnectionGUID: Qz4+fddATlaBGIyE7WftZQ==
X-CSE-MsgGUID: e+J3TUu6RUWTNk454YxnEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,209,1725346800"; 
   d="scan'208";a="83467937"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 16 Oct 2024 19:05:52 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1Ftd-000Lcd-2N;
	Thu, 17 Oct 2024 02:05:49 +0000
Date: Thu, 17 Oct 2024 10:05:38 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio: mmio: Parse ngpios property
Message-ID: <202410170940.KyJaAkpF-lkp@intel.com>
References: <20241016-gpio-ngpios-v1-2-f16cf154f715@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016-gpio-ngpios-v1-2-f16cf154f715@linaro.org>

Hi Linus,

kernel test robot noticed the following build errors:

[auto build test ERROR on 9852d85ec9d492ebef56dc5f229416c925758edc]

url:    https://github.com/intel-lab-lkp/linux/commits/Linus-Walleij/dt-bindings-gpio-mmio-Add-ngpios-property/20241016-152354
base:   9852d85ec9d492ebef56dc5f229416c925758edc
patch link:    https://lore.kernel.org/r/20241016-gpio-ngpios-v1-2-f16cf154f715%40linaro.org
patch subject: [PATCH 2/2] gpio: mmio: Parse ngpios property
config: i386-buildonly-randconfig-003-20241017 (https://download.01.org/0day-ci/archive/20241017/202410170940.KyJaAkpF-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241017/202410170940.KyJaAkpF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410170940.KyJaAkpF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpio/gpio-mmio.c:709:10: error: no member named 'ngpios' in 'struct bgpio_pdata'; did you mean 'ngpio'?
     709 |                 pdata->ngpios = ngpios;
         |                        ^~~~~~
         |                        ngpio
   include/linux/gpio/driver.h:688:6: note: 'ngpio' declared here
     688 |         int ngpio;
         |             ^
   1 error generated.


vim +709 drivers/gpio/gpio-mmio.c

   693	
   694	static struct bgpio_pdata *bgpio_parse_fw(struct device *dev, unsigned long *flags)
   695	{
   696		struct bgpio_pdata *pdata;
   697		u32 ngpios;
   698	
   699		if (!dev_fwnode(dev))
   700			return NULL;
   701	
   702		pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
   703		if (!pdata)
   704			return ERR_PTR(-ENOMEM);
   705	
   706		pdata->base = -1;
   707	
   708		if (!device_property_read_u32(dev, "ngpios", &ngpios))
 > 709			pdata->ngpios = ngpios;
   710	
   711		if (device_is_big_endian(dev))
   712			*flags |= BGPIOF_BIG_ENDIAN_BYTE_ORDER;
   713	
   714		if (device_property_read_bool(dev, "no-output"))
   715			*flags |= BGPIOF_NO_OUTPUT;
   716	
   717		return pdata;
   718	}
   719	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

