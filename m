Return-Path: <linux-gpio+bounces-9184-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6536395F8C5
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 20:10:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 834821C2189A
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 18:10:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87A04198E7F;
	Mon, 26 Aug 2024 18:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sg5fD8vH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4315018FC83
	for <linux-gpio@vger.kernel.org>; Mon, 26 Aug 2024 18:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724695827; cv=none; b=OWDIyrWNTpLCGEc0vVQWSDUyU4YWUsxQL1rXh7iQNyXyo7whY8YOhCboEPZcXE/EsPahXipuWdyRcUF+OQkbAl79cpXJA2dcjkQHMr8Y24Gi8UcfYhpaJ5AC30Ymim4AXUjgtpf2Olyuz3FKSN16PvMHhah53F0UrClfhmjftSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724695827; c=relaxed/simple;
	bh=1HY95TgskjQw3DicPs8nXeZ75xLkAousJ1JOgMZJBIE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Cb7B9TyznBb14ezgS5WahuM569rSwFXFiPecn7dFeFP3UvEYnNzyDzdMQ1QOXxLW0OcWZF2yMirH8MKo8f5PpJiuqF3Ye7eP5A6o3q4dYOAVTyY5VHMkFB4QEb/SIG4/++B2Yw9aWIFek4iVmxcNhG5hJwTkNZ6wrYixBfmKL5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sg5fD8vH; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724695825; x=1756231825;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1HY95TgskjQw3DicPs8nXeZ75xLkAousJ1JOgMZJBIE=;
  b=Sg5fD8vHlNfGH7pb3t5giegT10qsmC+MWYD8hoUJ/8x52D3LTHOHPlda
   29a2nj6Fn3VbamrpKLlA6IGFuF7YAWGCwUaBnv0rHqyMaCaEE1/NEHFuo
   m3zdpSVvkbiJTf1JlRkWHfcGzhf+THEQWzZuUsYI4nq9e0bld5ADcAbyO
   PxmaeqQemYfDMMKW6qVwsM7vLR2crhPd357J4l3KIzBB4T/RFjOii2Vpn
   Vp0wGw1ZXQzEBWEi/ES+bpVEcbnlKJkJuvOPGwXN2MNxRFrduxC50foCa
   plRFNUNGYeQPiQWJunxBsm4Qid6SRqlsv0H2fYvPpn4S6MhVMeVjpAeWe
   Q==;
X-CSE-ConnectionGUID: kEvhU4VQQEiVUrSobvhWIA==
X-CSE-MsgGUID: jH+gyI+3RzizdoDd8kM13A==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="23316670"
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; 
   d="scan'208";a="23316670"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 11:10:24 -0700
X-CSE-ConnectionGUID: N8hUpObdSlmiI5xQWlTqdw==
X-CSE-MsgGUID: afF4w9ALQOuZv9ccMjJf4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; 
   d="scan'208";a="62908029"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 26 Aug 2024 11:10:22 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sieAW-000HSs-1G;
	Mon, 26 Aug 2024 18:10:20 +0000
Date: Tue, 27 Aug 2024 02:09:20 +0800
From: kernel test robot <lkp@intel.com>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [linusw-pinctrl:ib-sophgo-pintrl 2/5]
 drivers/pinctrl/sophgo/pinctrl-cv18xx.c:544:14: error:
 'PIN_CONFIG_INPUT_SCHMITT_UV' undeclared; did you mean
 'PIN_CONFIG_INPUT_SCHMITT'?
Message-ID: <202408270140.L6Hm1sNo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git ib-sophgo-pintrl
head:   e7a4141f4420879720f9d2c99974e269044c7597
commit: a29d8e93e710e97863d5bb4e4b6079d6c7daab81 [2/5] pinctrl: sophgo: add support for CV1800B SoC
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240827/202408270140.L6Hm1sNo-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240827/202408270140.L6Hm1sNo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408270140.L6Hm1sNo-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pinctrl/sophgo/pinctrl-cv18xx.c: In function 'cv1800_pconf_get':
>> drivers/pinctrl/sophgo/pinctrl-cv18xx.c:544:14: error: 'PIN_CONFIG_INPUT_SCHMITT_UV' undeclared (first use in this function); did you mean 'PIN_CONFIG_INPUT_SCHMITT'?
     544 |         case PIN_CONFIG_INPUT_SCHMITT_UV:
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |              PIN_CONFIG_INPUT_SCHMITT
   drivers/pinctrl/sophgo/pinctrl-cv18xx.c:544:14: note: each undeclared identifier is reported only once for each function it appears in
   drivers/pinctrl/sophgo/pinctrl-cv18xx.c: In function 'cv1800_pinconf_compute_config':
   drivers/pinctrl/sophgo/pinctrl-cv18xx.c:611:22: error: 'PIN_CONFIG_INPUT_SCHMITT_UV' undeclared (first use in this function); did you mean 'PIN_CONFIG_INPUT_SCHMITT'?
     611 |                 case PIN_CONFIG_INPUT_SCHMITT_UV:
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                      PIN_CONFIG_INPUT_SCHMITT


vim +544 drivers/pinctrl/sophgo/pinctrl-cv18xx.c

   505	
   506	static int cv1800_pconf_get(struct pinctrl_dev *pctldev,
   507				    unsigned int pin_id, unsigned long *config)
   508	{
   509		struct cv1800_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
   510		int param = pinconf_to_config_param(*config);
   511		struct cv1800_pin *pin = cv1800_get_pin(pctrl, pin_id);
   512		enum cv1800_pin_io_type type;
   513		u32 value;
   514		u32 arg;
   515		bool enabled;
   516		int ret;
   517	
   518		if (!pin)
   519			return -EINVAL;
   520	
   521		type = cv1800_pin_io_type(pin);
   522		if (type == IO_TYPE_ETH || type == IO_TYPE_AUDIO)
   523			return -ENOTSUPP;
   524	
   525		value = readl(cv1800_pinctrl_get_component_addr(pctrl, &pin->conf));
   526	
   527		switch (param) {
   528		case PIN_CONFIG_BIAS_PULL_DOWN:
   529			enabled = FIELD_GET(PIN_IO_PULLDOWN, value);
   530			arg = cv1800_pull_down_typical_resistor(pctrl, pin);
   531			break;
   532		case PIN_CONFIG_BIAS_PULL_UP:
   533			enabled = FIELD_GET(PIN_IO_PULLUP, value);
   534			arg = cv1800_pull_up_typical_resistor(pctrl, pin);
   535			break;
   536		case PIN_CONFIG_DRIVE_STRENGTH_UA:
   537			enabled = true;
   538			arg = FIELD_GET(PIN_IO_DRIVE, value);
   539			ret = cv1800_pinctrl_reg2oc(pctrl, pin, arg);
   540			if (ret < 0)
   541				return ret;
   542			arg = ret;
   543			break;
 > 544		case PIN_CONFIG_INPUT_SCHMITT_UV:
   545			arg = FIELD_GET(PIN_IO_SCHMITT, value);
   546			ret = cv1800_pinctrl_reg2schmitt(pctrl, pin, arg);
   547			if (ret < 0)
   548				return ret;
   549			arg = ret;
   550			enabled = arg != 0;
   551			break;
   552		case PIN_CONFIG_POWER_SOURCE:
   553			enabled = true;
   554			arg = cv1800_get_power_cfg(pctrl, pin->power_domain);
   555			break;
   556		case PIN_CONFIG_SLEW_RATE:
   557			enabled = true;
   558			arg = FIELD_GET(PIN_IO_OUT_FAST_SLEW, value);
   559			break;
   560		case PIN_CONFIG_BIAS_BUS_HOLD:
   561			arg = FIELD_GET(PIN_IO_BUS_HOLD, value);
   562			enabled = arg != 0;
   563			break;
   564		default:
   565			return -ENOTSUPP;
   566		}
   567	
   568		*config = pinconf_to_config_packed(param, arg);
   569	
   570		return enabled ? 0 : -EINVAL;
   571	}
   572	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

