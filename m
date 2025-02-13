Return-Path: <linux-gpio+bounces-15923-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3AAA34981
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 17:19:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4F303A828C
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 16:12:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67FBA14831C;
	Thu, 13 Feb 2025 16:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U+x6wTGK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A18E155326;
	Thu, 13 Feb 2025 16:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739463123; cv=none; b=ezcuyjcXKEfgmtcctCgmnsbzQYDR53qCF9ivfNswGbfLnjWKWI1zyl0BBLbqQQmWB6cktrifcNjn7doVYI7DFxnGkIHzc0N9pHEXu3Sc6Md5vY264iRobDtlRku5XkzU5svbtIPNKvBbQmGpMfxCcAo1eetGleJ5qbu7B9NdI8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739463123; c=relaxed/simple;
	bh=Gw2NNolSujsXsCBXaWvkOKgck4tkLrrExFqPs0BhTqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cfllzoce6F1CQY6LhXKBY+4Z5hqdNt8GR1is/2UfMQ6LO9Z7cDJj4FmuXALBF56gLpdA7sVKO61gazpuI5USk7gLJlFDEki0p2KnbEnutiLVjdXOsVam+bCx1giLWmCK7SXVdsXCWTYSWjFpgTnVSoWeS+zPlczIQvr1Brda6jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U+x6wTGK; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739463121; x=1770999121;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Gw2NNolSujsXsCBXaWvkOKgck4tkLrrExFqPs0BhTqc=;
  b=U+x6wTGK4fYP9tkRuqCuUhfRTB3qqmqur4ekoD2asgYQJUmPlj2qKBUf
   F0e25SMS56WqWU8g+ixEPqqkHmRY+leQ32HEPKMHgj1/aiGIYIKizA/OH
   3e0xEt7/JMAOyoiVvMf/MUgFJyoP19FudFiI/y0jZIONRqI0iRyJcK4vN
   Y5soUGo/9JrthiepfUrPB0PoTIKHan60KiC8lk5SAClhciYzSgdvJqkmT
   /4szliwVrkosMXyEaGuXJM2Ht78bcLb7FM2Trxk9bMHAMgDhWJHa54KOk
   ihWq/bydhWQWQsXkql8Xe8PzaAURnuRjk/ZYQjPJCtPC8nwZi0ztylTX/
   g==;
X-CSE-ConnectionGUID: +6p6uQbNSx2Puy9lxf/aKQ==
X-CSE-MsgGUID: S+Bk9+RDQ76AecP6SgYxvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="50790721"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="50790721"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 08:11:57 -0800
X-CSE-ConnectionGUID: 20q/Wuc2QR++M6YKWg7BjQ==
X-CSE-MsgGUID: 7YyOYlSnRB+omCGp8+2yzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="113846352"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 13 Feb 2025 08:11:55 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tibof-0018Ol-1H;
	Thu, 13 Feb 2025 16:11:53 +0000
Date: Fri, 14 Feb 2025 00:11:06 +0800
From: kernel test robot <lkp@intel.com>
To: Kim Seer Paller <kimseer.paller@analog.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Kim Seer Paller <kimseer.paller@analog.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: add adg1414
Message-ID: <202502132314.mPTyC8ew-lkp@intel.com>
References: <20250213-for_upstream-v2-1-ec4eff3b3cd5@analog.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213-for_upstream-v2-1-ec4eff3b3cd5@analog.com>

Hi Kim,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 4dc1d1bec89864d8076e5ab314f86f46442bfb02]

url:    https://github.com/intel-lab-lkp/linux/commits/Kim-Seer-Paller/dt-bindings-gpio-add-adg1414/20250213-211900
base:   4dc1d1bec89864d8076e5ab314f86f46442bfb02
patch link:    https://lore.kernel.org/r/20250213-for_upstream-v2-1-ec4eff3b3cd5%40analog.com
patch subject: [PATCH v2 1/2] dt-bindings: gpio: add adg1414
reproduce: (https://download.01.org/0day-ci/archive/20250213/202502132314.mPTyC8ew-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502132314.mPTyC8ew-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/ja_JP/SubmittingPatches references a file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff
   Warning: Documentation/translations/zh_CN/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: Documentation/translations/zh_TW/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/gpio/gpio-adg1414.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
   Warning: lib/Kconfig.debug references a file that doesn't exist: Documentation/dev-tools/fault-injection/fault-injection.rst
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

