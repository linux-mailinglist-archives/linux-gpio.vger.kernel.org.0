Return-Path: <linux-gpio+bounces-20676-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF36AC6CF4
	for <lists+linux-gpio@lfdr.de>; Wed, 28 May 2025 17:36:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 862887B00D1
	for <lists+linux-gpio@lfdr.de>; Wed, 28 May 2025 15:35:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3275428C2C1;
	Wed, 28 May 2025 15:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="libzENgz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D594B28BAAB;
	Wed, 28 May 2025 15:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748446586; cv=none; b=d+T3j8SaxL6nLJ83jdzYMnwy9wGZvx2tH1aG5E6moG2ZPyUJ862WK9O9syUl2wFnGQPE6G3Ffj+aNqba3PUCDfT9XzmmpJmwLuO0BGvli5oRHrB0rmdn5FoSgGOBfUyWVEhfIrzBcjoPAp3w8GSk03pRoDN4jZrwoqPo4x2s1EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748446586; c=relaxed/simple;
	bh=NyxJjdO0uqLgRbXeG3fMSXDtDw3lT9wwstsorauv94E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c+4BNW+zegbckhqs5feQ8BnwbH8eYGSiYz6X9Qy/jw2uND318TkPbrBltVqZbaVnrP7hyu5y6L+eiudz3TghtY87KCT+3Kshy3n+vCn8SHDesJ1riFkX8llsm4H+2rGjFqLMU7aVQwucHpuwHV5ywrIFzOKu7PkU9RG1pLesqI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=libzENgz; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748446583; x=1779982583;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=NyxJjdO0uqLgRbXeG3fMSXDtDw3lT9wwstsorauv94E=;
  b=libzENgzVfyjEj0jizhiCOsdiGQZqTZLhyIwQt1pV97WXDEnanIRKSK/
   XgTOuaySKZ4HuU0xR/iY75ezSfANsGTB01GSE3eotrho12Bp9vpEybkAo
   OVb4OHmwiM5Zid4BtQ/Abs+HbFTKTvJZQtPL1dpL838EDy8AZ98Vtcsz6
   4si2W4BJuTKQ9KXZ295vRjCVpgWNCTG3Fj0fhW+o7aW6X7MXxMEmkoWci
   tUvy3ufRbF7V2C8yiHmixHSBOYmjwRS5wQ4BBXc/QK+dnmr7el1F56JdI
   8eBPy/v9Yf1RsKfqUPhnKAcuerUTg3b4X/OMFqK8IhWfj3KqBnMdmr5mU
   Q==;
X-CSE-ConnectionGUID: Rv0CnB5MQfOvPyeaqlZ4sQ==
X-CSE-MsgGUID: OZYz5iRgTMi5hnXE1RXtHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="67894315"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="67894315"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 08:36:22 -0700
X-CSE-ConnectionGUID: ZOSc//TGTDiNqLFdZkNVow==
X-CSE-MsgGUID: 4kneYjTAQt+FRNP8RxgZhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="147154189"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 28 May 2025 08:36:19 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKIpE-000VnY-2r;
	Wed, 28 May 2025 15:36:16 +0000
Date: Wed, 28 May 2025 23:36:16 +0800
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
Subject: Re: [PATCH v4 4/9] =?iso-8859-1?Q?MAINTAIN?=
 =?iso-8859-1?Q?ERS=3A_add_Cl=E9ment?= Le Goffic as STM32 HDP maintainer
Message-ID: <202505282333.T9mzfGT8-lkp@intel.com>
References: <20250528-hdp-upstream-v4-4-7e9b3ad2036d@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250528-hdp-upstream-v4-4-7e9b3ad2036d@foss.st.com>

Hi Clément,

kernel test robot noticed the following build warnings:

[auto build test WARNING on a08b2b34239e63bd839078de98911d3653cdab83]

url:    https://github.com/intel-lab-lkp/linux/commits/Cl-ment-Le-Goffic/gpio-mmio-add-BGPIOF_NO_INPUT-flag-for-GPO-gpiochip/20250528-213620
base:   a08b2b34239e63bd839078de98911d3653cdab83
patch link:    https://lore.kernel.org/r/20250528-hdp-upstream-v4-4-7e9b3ad2036d%40foss.st.com
patch subject: [PATCH v4 4/9] MAINTAINERS: add Clément Le Goffic as STM32 HDP maintainer
reproduce: (https://download.01.org/0day-ci/archive/20250528/202505282333.T9mzfGT8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505282333.T9mzfGT8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/ja_JP/process/submit-checklist.rst references a file that doesn't exist: Documentation/translations/ja_JP/SubmitChecklist
   Warning: Documentation/translations/zh_CN/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: Documentation/translations/zh_TW/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl-hdp.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
   Can't build as 1 mandatory dependency is missing at ./scripts/sphinx-pre-install line 984.
   make[2]: *** [Documentation/Makefile:121: htmldocs] Error 255
   make[1]: *** [Makefile:1799: htmldocs] Error 2
   make: *** [Makefile:248: __sub-make] Error 2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

