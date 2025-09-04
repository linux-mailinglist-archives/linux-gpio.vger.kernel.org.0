Return-Path: <linux-gpio+bounces-25633-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AE9B4489C
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 23:34:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ABE061CC1769
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 21:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63E642C15AB;
	Thu,  4 Sep 2025 21:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fSiUCYcQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BC22BEFE7;
	Thu,  4 Sep 2025 21:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757021637; cv=none; b=h5g6tobOCM4jPSqWGC851Fa3IS2U//5nXUGZrVi8aybyOvotlsbb1A55JZD8s2vPB10JGEWrbyWwOCjLxrgFFVLyMwmhlVBES6qFpxPnp6rFSlJVTsfR2S7iMIvCwn4SdFBLVoRzY6OSAvEpu8ithb6OivRkgaEjE7tERP9+sJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757021637; c=relaxed/simple;
	bh=p/s/kJpm8SZfihBzXvBjykI1k2rg3DZ0ryhkDZpJKe4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q75Rip2Nq9j9Etpq43NCzvH24+bhN6vYsMAweqcVIL2jq4aFx53vpvfrwtcbX1+RkpqEUBs4jt/PcvJ9Fld9J5xwswE8DlL1k02fgbbYQ/NfJKtbAmkmwIyJ+CioPOd2xqwUXZ+4BGsbX4E5jmhFkYsYgQynBv0d5lHCeHkBOVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fSiUCYcQ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757021636; x=1788557636;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=p/s/kJpm8SZfihBzXvBjykI1k2rg3DZ0ryhkDZpJKe4=;
  b=fSiUCYcQqPUoC+0oVVx2LIg01FIa6JOmML/lNH3Y37JdoInrnOq1ppX4
   azwqJRwY+3A2bWOmU6y6zZMyuuwAyWG4y8IwZHVdycOchxVNxqtxzQ315
   qk8gNyRuLZgbItuvs6RCsXx+Kc5mioOOMFEsd7W7Em7AKl71JDeh8uNK5
   v29nYIUkG6Hc5LKPkxUjM/Kp4j5v96rWDWtOUi9C+aX2mTcnWaziEnaqU
   nUis4RF51OD+pK3LjBLP3HGbI2Zce0KxqU07gPAQbqYuGfGCN1KVwC3IE
   Jg+d6LzUWLenu7um91D7JLZT+sJzmvoPO0T0rY39CSdtdFJe5B/6Lcpsz
   A==;
X-CSE-ConnectionGUID: 70bzBgCgR7uxMRNnQbCuxw==
X-CSE-MsgGUID: oxHPqsB8S/KDRJenDSpQSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="59522603"
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; 
   d="scan'208";a="59522603"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2025 14:33:55 -0700
X-CSE-ConnectionGUID: d8h7wvHORNuG1VzVvVYbxw==
X-CSE-MsgGUID: X2KPy3u+TVekGncrgIKZIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; 
   d="scan'208";a="171891495"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 04 Sep 2025 14:33:49 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uuHa1-0005wZ-1p;
	Thu, 04 Sep 2025 21:33:25 +0000
Date: Fri, 5 Sep 2025 05:30:48 +0800
From: kernel test robot <lkp@intel.com>
To: Nuno =?iso-8859-1?Q?S=E1?= via B4 Relay <devnull+nuno.sa.analog.com@kernel.org>,
	linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v2 2/3] hwmon: ltc4283: Add support for the LTC4283 Swap
 Controller
Message-ID: <202509050501.MXDrcrZA-lkp@intel.com>
References: <20250903-ltc4283-support-v2-2-6bce091510bf@analog.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903-ltc4283-support-v2-2-6bce091510bf@analog.com>

Hi Nuno,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9703c672af8dd3573c76ce509dfff26bf6c4768d]

url:    https://github.com/intel-lab-lkp/linux/commits/Nuno-S-via-B4-Relay/dt-binbings-hwmon-Document-the-LTC4283-Swap-Controller/20250903-180813
base:   9703c672af8dd3573c76ce509dfff26bf6c4768d
patch link:    https://lore.kernel.org/r/20250903-ltc4283-support-v2-2-6bce091510bf%40analog.com
patch subject: [PATCH v2 2/3] hwmon: ltc4283: Add support for the LTC4283 Swap Controller
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250905/202509050501.MXDrcrZA-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250905/202509050501.MXDrcrZA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509050501.MXDrcrZA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwmon/ltc4283.c:595:10: warning: result of comparison of constant 65536 with expression of type 'u16' (aka 'unsigned short') is always false [-Wtautological-constant-out-of-range-compare]
     595 |         if (tmp == BIT(16))
         |             ~~~ ^  ~~~~~~~
   1 warning generated.


vim +595 drivers/hwmon/ltc4283.c

   586	
   587	static int __ltc4283_write_in_history(struct ltc4283_hwmon *st,
   588					      u32 reg, long lowest, u32 fs)
   589	{
   590		__be16 __raw;
   591		u16 tmp;
   592		int ret;
   593	
   594		tmp = DIV_ROUND_CLOSEST(BIT(16) * lowest, fs);
 > 595		if (tmp == BIT(16))
   596			tmp = U16_MAX;
   597	
   598		__raw = cpu_to_be16(tmp);
   599	
   600		ret = regmap_bulk_write(st->map, reg, &__raw, sizeof(__raw));
   601		if (ret)
   602			return ret;
   603	
   604		tmp = 0;
   605		return regmap_bulk_write(st->map, reg + 1,  &tmp, sizeof(tmp));
   606	}
   607	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

