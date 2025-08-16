Return-Path: <linux-gpio+bounces-24445-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D812B28959
	for <lists+linux-gpio@lfdr.de>; Sat, 16 Aug 2025 02:36:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 404FF174D8D
	for <lists+linux-gpio@lfdr.de>; Sat, 16 Aug 2025 00:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED1BC2BB13;
	Sat, 16 Aug 2025 00:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l/1idiUP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F39B23DE;
	Sat, 16 Aug 2025 00:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755304583; cv=none; b=pIRY3yfriRyoi4Z3j7yd7Iyr7f/5aJa9us1G/mtR1t89sXmYlowjZuHPA/t4mazgJVERuhj8g6Pp5ZCCLlhxdmRKlMQcDlIujEMXf1GEgSmhWMQ9guXmfIFIXzVYuvuAG7tznfSV7HO90om75rCJLSMxH/AoeeSB8s2oK7jPzwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755304583; c=relaxed/simple;
	bh=YDxjULu7qEyWirbAvD6wzbjz+KYgzH+G9EhzWARCC7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hGUwkL9/6ODqbv79yhfj9ebW3AU+jXYkbsL5FSd6en8D1RpPAq5t6dazXxQ5NfXxKlhpxYBgcPo7a7WFgWMhL6gX0KUBHFX1BrSr64/oHUVKS8NzMswuK75rfecbIGGzqIdhWY4aBooB/TGvkodBgHY/OlOJ3p0fh4gOReTuUaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l/1idiUP; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755304582; x=1786840582;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YDxjULu7qEyWirbAvD6wzbjz+KYgzH+G9EhzWARCC7o=;
  b=l/1idiUPnxUiPFg4qvfwIdJboxMSBmjtt5GSENONRX9NdqqdRfAsTj+F
   5ATEbgDh3jYRiEVqGapJ2hYSGEXa7eZnSDYnMRsHZpEb+C9vARzM7ikpQ
   Un20YaJ9rpw8iStGIyWnGieMWIvaBPhPYrJESSDvmJSgGLbGqy9LAqmQ2
   Ejte9BjRmlcb7zb18CkHWYiUVbUdYoFPA2C2U4or2fliDhaWKz4XuThhg
   M0lbJ+3UhafH46r/94tIyFBv2BHCxxpDQMlskyHHav83r9XDTXbo2gznY
   wi85CAKb8Q0VYoQbw9W5yyCXXpUpUyRnYMehyT01Ux/fyG8/G8E1Uyxmk
   Q==;
X-CSE-ConnectionGUID: U4j67bUSR+WSPwsgyO+VFg==
X-CSE-MsgGUID: ElGl2nn9TuSMw3yctjlnxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="68715620"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="68715620"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 17:36:21 -0700
X-CSE-ConnectionGUID: QUhMb4KfTNKGb2SROBTq1A==
X-CSE-MsgGUID: EXyFp8Q3T1ulfYyXeBEHvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="172467174"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 15 Aug 2025 17:36:18 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1un4u8-000CSG-01;
	Sat, 16 Aug 2025 00:36:16 +0000
Date: Sat, 16 Aug 2025 08:35:50 +0800
From: kernel test robot <lkp@intel.com>
To: Nuno =?iso-8859-1?Q?S=E1?= via B4 Relay <devnull+nuno.sa.analog.com@kernel.org>,
	linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH 4/6] hwmon: ltc4283-hwmon: Add support for the LTC4283
 Swap Controller
Message-ID: <202508160822.04pfkosr-lkp@intel.com>
References: <20250814-ltc4283-support-v1-4-88b2cef773f2@analog.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814-ltc4283-support-v1-4-88b2cef773f2@analog.com>

Hi Nuno,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9703c672af8dd3573c76ce509dfff26bf6c4768d]

url:    https://github.com/intel-lab-lkp/linux/commits/Nuno-S-via-B4-Relay/dt-binbings-mfd-Add-bindings-for-the-LTC4283-Swap-Controller/20250814-190311
base:   9703c672af8dd3573c76ce509dfff26bf6c4768d
patch link:    https://lore.kernel.org/r/20250814-ltc4283-support-v1-4-88b2cef773f2%40analog.com
patch subject: [PATCH 4/6] hwmon: ltc4283-hwmon: Add support for the LTC4283 Swap Controller
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250816/202508160822.04pfkosr-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250816/202508160822.04pfkosr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508160822.04pfkosr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwmon/ltc4283-hwmon.c:579:10: warning: result of comparison of constant 65536 with expression of type 'u16' (aka 'unsigned short') is always false [-Wtautological-constant-out-of-range-compare]
     579 |         if (tmp == BIT(16))
         |             ~~~ ^  ~~~~~~~
   1 warning generated.


vim +579 drivers/hwmon/ltc4283-hwmon.c

   570	
   571	static int __ltc4283_hwmon_write_in_history(struct ltc4283_hwmon *st,
   572						    u32 reg, long lowest, u32 fs)
   573	{
   574		__be16 __raw;
   575		u16 tmp;
   576		int ret;
   577	
   578		tmp = DIV_ROUND_CLOSEST(BIT(16) * lowest, fs);
 > 579		if (tmp == BIT(16))
   580			tmp = U16_MAX;
   581	
   582		__raw = cpu_to_be16(tmp);
   583	
   584		ret = regmap_bulk_write(st->map, reg, &__raw, sizeof(__raw));
   585		if (ret)
   586			return ret;
   587	
   588		tmp = 0;
   589		return regmap_bulk_write(st->map, reg + 1,  &tmp, sizeof(tmp));
   590	}
   591	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

