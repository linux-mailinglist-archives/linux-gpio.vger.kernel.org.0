Return-Path: <linux-gpio+bounces-7370-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ED948904407
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 20:51:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 890E5B240F8
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 18:51:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D3C47F49B;
	Tue, 11 Jun 2024 18:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ja/M6hmV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588E779949;
	Tue, 11 Jun 2024 18:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718131865; cv=none; b=k/2M84Vhw3ijci+m6a/DA3aJMsLHZTldhReZFmqnKD7U1skTFLiRpWZ9i1616+bLJiGNQjv/Of6dYPbL7e8afAUeMABfe1GDzpIOV8QdRwtPpK7XiQDS0nI2XAR0ap0Q65PJIFikOglZbe4e3Wf9nTYNcBhxTG+/D30M6j7y8i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718131865; c=relaxed/simple;
	bh=RzJp8cb00wWu9a4yoQ4JsrdL7/XwAY9pJKi6QkNRA7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r4SEtQFfDZQ+IAzOI38/VXSKLe3lthjqtvMEqYjQ+NIwStEtevgPXP1u04k3xt0ZfKUiywtYINA2faEQsAYsFNkHKiyHzNpvMCuQduV4zJ4x7gGX79Yb1QxISg+4z5lFTwMEu2cWnAznCE8OlaFtz0nz8ltxW2HAmss1re5//Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ja/M6hmV; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718131864; x=1749667864;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RzJp8cb00wWu9a4yoQ4JsrdL7/XwAY9pJKi6QkNRA7I=;
  b=ja/M6hmVV1KzPYJSDXAeC6vYPxsZRlA61urVMDIVdmvB+mee4NInpO1t
   YMMJ/FZ8DOox+r76wky2r0dedRUqbENu7VJ57b0D9szXrR/SfUZSPg6ee
   tASLNqBur3B3FZy0Kk3ViccwzAF1C3pp0vg3PhdxKuHR+cS4oFRH98xR8
   3ESTMMl4QBKfEUGLlMTYmBnuiO2xtHzfF9NhK/9d7FwVbQ1sQUsaIKrjR
   xCQV0ekxHEX0fynxOclyFR54YpS62U3DqQ2CBZ0baay6E/IUzP3rMFe45
   PLjxnc/Rw6eaKOVD72pGpqCb3lljYZvTQXBebyiFCOAdO/ajQ9KbFexEk
   Q==;
X-CSE-ConnectionGUID: zqFRTYeqQSarjMvqBnRwgA==
X-CSE-MsgGUID: eTEckkh7SyuBzhQRvISPTQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="18721235"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; 
   d="scan'208";a="18721235"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 11:51:03 -0700
X-CSE-ConnectionGUID: qFaEQGGQR0yj92/nkWYFjw==
X-CSE-MsgGUID: vVT7fhWYSwGUXsLltUGGmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; 
   d="scan'208";a="39638525"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Jun 2024 11:50:59 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sH6a9-0000nd-1G;
	Tue, 11 Jun 2024 18:50:57 +0000
Date: Wed, 12 Jun 2024 02:50:56 +0800
From: kernel test robot <lkp@intel.com>
To: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	Xianwei Zhao <xianwei.zhao@amlogic.com>
Subject: Re: [PATCH 3/3] arm64: dts: amlogic: a4: add pinctrl node
Message-ID: <202406120256.PStYu9fX-lkp@intel.com>
References: <20240611-a4_pinctrl-v1-3-dc487b1977b3@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240611-a4_pinctrl-v1-3-dc487b1977b3@amlogic.com>

Hi Xianwei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 87501b7ca0005c533d770d37e0047a60954d986a]

url:    https://github.com/intel-lab-lkp/linux/commits/Xianwei-Zhao-via-B4-Relay/dt-bindings-pinctrl-Add-support-for-Amlogic-A4-SoCs/20240611-131412
base:   87501b7ca0005c533d770d37e0047a60954d986a
patch link:    https://lore.kernel.org/r/20240611-a4_pinctrl-v1-3-dc487b1977b3%40amlogic.com
patch subject: [PATCH 3/3] arm64: dts: amlogic: a4: add pinctrl node
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240612/202406120256.PStYu9fX-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240612/202406120256.PStYu9fX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406120256.PStYu9fX-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi:71.32-85.4: Warning (unit_address_vs_reg): /soc/bus@fe000000/pinctrl@4000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi:52.35-66.5: Warning (unit_address_vs_reg): /soc/pinctrl@fe08e700: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi:71.32-85.4: Warning (simple_bus_reg): /soc/bus@fe000000/pinctrl@4000: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi:52.35-66.5: Warning (simple_bus_reg): /soc/pinctrl@fe08e700: missing or empty reg/ranges property

vim +71 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi

  > 52			aobus_pinctrl: pinctrl@fe08e700 {
    53				compatible = "amlogic,a4-aobus-pinctrl";
    54				#address-cells = <2>;
    55				#size-cells = <2>;
    56				ranges;
    57	
    58				ao_gpio: bank@fe08e700 {
    59					reg = <0x0 0xfe08e700 0x0 0x04>,
    60					      <0x0 0xfe08e704 0x0 0x60>;
    61					reg-names = "mux", "gpio";
    62					gpio-controller;
    63					#gpio-cells = <2>;
    64					gpio-ranges = <&aobus_pinctrl 0 0 8>;
    65				};
    66			};
    67		};
    68	};
    69	
    70	&apb {
  > 71		periphs_pinctrl: pinctrl@4000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

