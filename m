Return-Path: <linux-gpio+bounces-11487-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7C69A185C
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 04:06:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A118628633E
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 02:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35144374C4;
	Thu, 17 Oct 2024 02:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uy0QJwcI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8285481D5;
	Thu, 17 Oct 2024 02:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729130758; cv=none; b=SX1aozY6v1jS+qTe8z2LVfWJFSSi+M+YMo8WdFhR74hvWjDhLBxppG8Ho1UyDMeQ+nsmYCUrjFQMhH8oHPTpxxnaso3lxz9hHKEgqQU0d11gTkg6o5CxWuP8Awlt/71KG2RangZwsmQJNGA0go8s7QRGIxBZ4UhbWXMjEM1D4Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729130758; c=relaxed/simple;
	bh=sB/eF3N7Yt4FBhU5bdNaw5ferB5BUtf2dhXB9V+NOWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UB4BY8JzQc8YUzJn4iQZVpD8uroc9i9H/GRG+aEnI9pWrmyQQxiVPpQ5LawJ0lEK+muWA9/saDau50eYfs/HSpXugZ0TMuZZYiJwW2BPEjXJCq9rR9fs+97pdVydbykoEpmxmSt7zeCEicewrXlFJIZlQ6LepSVzfQFQeedJV4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uy0QJwcI; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729130756; x=1760666756;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sB/eF3N7Yt4FBhU5bdNaw5ferB5BUtf2dhXB9V+NOWY=;
  b=Uy0QJwcIYRKqiUEjFgsno5yjUvGJhcXFK/ho/f7U6d64+W1pYJM+zerU
   LVWNS2VXJWizA8V720+h3bb8zBg8HXoBKjVRbk91S+uC5d0LhkXEK6ar2
   6h3bgzI3VZl/zPYE5qlQ8J/jb/HzQL7e015oGJOsRNPPRI5zaCMLDYGhb
   zmKrvjRoUVtUXEU7b+bGUAbx5ZHJdf4f0wlNX2PSSXEwqiMncwDK3xu4o
   oVY9D5oMTl4gB/plSNGLcwvBMAPWSghf6lG/N59JJCTsBg1QruCtJoVwN
   3c759ZiSQh4JETN7Rjy19TGCdIaDu8mAv2qt+nTv1GLnHabc9hxiNGeLt
   w==;
X-CSE-ConnectionGUID: bIXcDvvhS6CjzvEEp47aHw==
X-CSE-MsgGUID: PZC5Bpq7Qn2IvvGmmKBRCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="28693149"
X-IronPort-AV: E=Sophos;i="6.11,209,1725346800"; 
   d="scan'208";a="28693149"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 19:05:55 -0700
X-CSE-ConnectionGUID: xLpmNLZJR3u3R/W7UbZ9aw==
X-CSE-MsgGUID: 2Zp3sZPATlqe0HhQyYMLjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,209,1725346800"; 
   d="scan'208";a="83467936"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 16 Oct 2024 19:05:52 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1Ftd-000Lcf-2V;
	Thu, 17 Oct 2024 02:05:49 +0000
Date: Thu, 17 Oct 2024 10:05:37 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio: mmio: Parse ngpios property
Message-ID: <202410170940.c317EO5s-lkp@intel.com>
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
config: i386-buildonly-randconfig-001-20241017 (https://download.01.org/0day-ci/archive/20241017/202410170940.c317EO5s-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241017/202410170940.c317EO5s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410170940.c317EO5s-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpio/gpio-mmio.c: In function 'bgpio_parse_fw':
>> drivers/gpio/gpio-mmio.c:709:24: error: 'struct bgpio_pdata' has no member named 'ngpios'; did you mean 'ngpio'?
     709 |                 pdata->ngpios = ngpios;
         |                        ^~~~~~
         |                        ngpio


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

