Return-Path: <linux-gpio+bounces-14244-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D62C9FCA2F
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Dec 2024 11:16:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 204F5162E41
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Dec 2024 10:16:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 464FE1CEEBA;
	Thu, 26 Dec 2024 10:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bf9rtxUh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD802450F2;
	Thu, 26 Dec 2024 10:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735208166; cv=none; b=ooRH2Lza7oB3PbjzMcZkOlwHD3jJNdUEgJXBHDTl2G/da2q+Qqpr9ybWBsNJfAz+5KU1/WyFDnTl4m5y4ZqgtPEOE/W7RbRFdCPvMr4cBy6ZZuJRAvxqmWBkccrrSL5iCvclP4NL+hpcfrXVKj41XSPr9q9yo+Um3exEFiz9TuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735208166; c=relaxed/simple;
	bh=PNysoKr4x3TzAEfHcmAw8WO9zljvb8duad9elAZ9Cfo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W9VjaAQJcrvATzei1jGXL3pm0hnzWKAxjJTs/Y65TVZ7VLvfmqYBLQV0485tnoJA7mzyAnGKKkC5W0F081hG41Ypnc05hdlHjRPlJs8WSh3JNCGfH6BGJEwxJK8FbNfuvK38iDD6K8fBYzqJxOYB93FtbhCI9H74Y0CiR1WpbAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bf9rtxUh; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735208163; x=1766744163;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PNysoKr4x3TzAEfHcmAw8WO9zljvb8duad9elAZ9Cfo=;
  b=Bf9rtxUh/zMZKBKXlhBTiuus8ljD6mFSNGJI3TPgenMWrqeYP3O/TJPP
   cupAdv3ui2kZqPbbUqlNLbc57ZoUnPkqV+UuqFCR0FCx6jvQbqZrUTeUT
   S3dY0PoJfxQkmzzGSsbqNDZuLqDWmLa3rb0YZkD6+Rt/2X9rztNC2JT6B
   AGVd+Dsf4NWRoRJKgBZgEvhGq4OXd2ej4inLfjjyRmSEWlru6vneo5zSY
   hIKI3AVbID7Ixbtan1tn12n+fnviy9BasAC7rSEIaCGHHkZOQk+/Ute47
   ApHVPnN27U4hRzcyHk6C8BSuXzUzE6WbJV7oJ2HoeAmZUSEnN1vApX6p0
   A==;
X-CSE-ConnectionGUID: 9WSk4SJdTU+liyD/5XkPhA==
X-CSE-MsgGUID: IqVDxrMBTCi/4NJwr1rmlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="35855076"
X-IronPort-AV: E=Sophos;i="6.12,265,1728975600"; 
   d="scan'208";a="35855076"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2024 02:16:02 -0800
X-CSE-ConnectionGUID: YtWgRRzCSgS7Y0XstJNVKg==
X-CSE-MsgGUID: SXJucXphRAa1naaBE0aT+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100716808"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 26 Dec 2024 02:15:58 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQkuJ-0002TS-1u;
	Thu, 26 Dec 2024 10:15:55 +0000
Date: Thu, 26 Dec 2024 18:15:02 +0800
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
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	Xianwei Zhao <xianwei.zhao@amlogic.com>
Subject: Re: [PATCH v2 2/5] pinctrl: pinconf-generic: Add API for pinmux
 propertity in DTS file
Message-ID: <202412261752.6HK0iJXu-lkp@intel.com>
References: <20241226-amlogic-pinctrl-v2-2-cdae42a67b76@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241226-amlogic-pinctrl-v2-2-cdae42a67b76@amlogic.com>

Hi Xianwei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 4de5110762b94b9978fb8182a568572fb2194f8b]

url:    https://github.com/intel-lab-lkp/linux/commits/Xianwei-Zhao-via-B4-Relay/dt-bindings-pinctrl-Add-support-for-Amlogic-SoCs/20241226-155844
base:   4de5110762b94b9978fb8182a568572fb2194f8b
patch link:    https://lore.kernel.org/r/20241226-amlogic-pinctrl-v2-2-cdae42a67b76%40amlogic.com
patch subject: [PATCH v2 2/5] pinctrl: pinconf-generic: Add API for pinmux propertity in DTS file
config: arc-randconfig-001-20241226 (https://download.01.org/0day-ci/archive/20241226/202412261752.6HK0iJXu-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241226/202412261752.6HK0iJXu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412261752.6HK0iJXu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/pinconf-generic.c:250: warning: Function parameter or struct member 'dev' not described in 'pinconf_generic_parse_dt_pinmux'
>> drivers/pinctrl/pinconf-generic.c:250: warning: Excess function parameter 'pctldev' description in 'pinconf_generic_parse_dt_pinmux'


vim +250 drivers/pinctrl/pinconf-generic.c

   235	
   236	/**
   237	 * pinconf_generic_parse_dt_pinmux()
   238	 * parse the pinmux properties into generic pin mux values.
   239	 * @np: node containing the pinmux properties
   240	 * @pctldev: pincontrol device
   241	 * @pid: array with pin identity entries
   242	 * @pmux: array with pin mux value entries
   243	 * @npins: number of pins
   244	 *
   245	 * pinmux propertity: mux value [0,7]bits and pin identity [8,31]bits.
   246	 */
   247	int pinconf_generic_parse_dt_pinmux(struct device_node *np, struct device *dev,
   248					    unsigned int **pid, unsigned int **pmux,
   249					    unsigned int *npins)
 > 250	{
   251		unsigned int *pid_t;
   252		unsigned int *pmux_t;
   253		struct property *prop;
   254		unsigned int npins_t, i;
   255		u32 value;
   256		int ret;
   257	
   258		prop = of_find_property(np, "pinmux", NULL);
   259		if (!prop) {
   260			dev_info(dev, "Missing pinmux property\n");
   261			return -ENOENT;
   262		}
   263	
   264		if (!pid || !pmux || !npins) {
   265			dev_err(dev, "paramers error\n");
   266			return -EINVAL;
   267		}
   268	
   269		npins_t = prop->length / sizeof(u32);
   270		pid_t = devm_kcalloc(dev, npins_t, sizeof(*pid_t), GFP_KERNEL);
   271		pmux_t = devm_kcalloc(dev, npins_t, sizeof(*pmux_t), GFP_KERNEL);
   272		if (!pid_t || !pmux_t) {
   273			dev_err(dev, "kalloc memory fail\n");
   274			return -ENOMEM;
   275		}
   276		for (i = 0; i < npins_t; i++) {
   277			ret = of_property_read_u32_index(np, "pinmux", i, &value);
   278			if (ret) {
   279				dev_err(dev, "get pinmux value fail\n");
   280				goto exit;
   281			}
   282			pmux_t[i] = value & 0xff;
   283			pid_t[i] = (value >> 8) & 0xffffff;
   284		}
   285		*pid = pid_t;
   286		*pmux = pmux_t;
   287		*npins = npins_t;
   288	
   289		return 0;
   290	exit:
   291		devm_kfree(dev, pid_t);
   292		devm_kfree(dev, pmux_t);
   293		return ret;
   294	}
   295	EXPORT_SYMBOL_GPL(pinconf_generic_parse_dt_pinmux);
   296	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

