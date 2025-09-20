Return-Path: <linux-gpio+bounces-26419-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEC7B8D14C
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Sep 2025 22:49:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8C4817CB6C
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Sep 2025 20:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 303882D0C94;
	Sat, 20 Sep 2025 20:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kxGuF4/f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F1921C163;
	Sat, 20 Sep 2025 20:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758401376; cv=none; b=VQDEXPFwoavzK9Wq+amwPYfLMw5GPjxy29Ycwsu2pZNfSuCzXLcDabMgxPeyWGpKz8b36+Wj01TruaZUlNhyDIBS8MP7jwY1O91AF/SUL3nJ0quVTDKL9moLtYroIHkk2Dcgefj7AgsXUsO0v/C/jyel8ZDeVK07S+ePmUDBmi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758401376; c=relaxed/simple;
	bh=5PofiIjgAx4VGnfdZ4zQnv30kMD9cHFOibQ2RBJQAwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kp2BnDLw+CGIbkGeukVN//nAn+6aQejc3rMRCkDKfFmt4PT52/Sos7MnGuUC5UzsxwwDDrwQ5lW5yk5te+6GA8wwPCr5W1Lzh5bt8KK//gd4jdoWcPnOiclQsLw4m6LEbd0sjcpGi/B8+sE5eC2+1p24aVpx7TC5a8eIz7NizWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kxGuF4/f; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758401374; x=1789937374;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5PofiIjgAx4VGnfdZ4zQnv30kMD9cHFOibQ2RBJQAwo=;
  b=kxGuF4/fCsKbldf/f5BB+tcYDR0/baEHrf+dcTLy20IceBxr63Rqa9ll
   JfMDS7t4h8/RHDN8NbP13kr6tbWwSvXXqyH5kuCjNCErpZE9W/gSlkv0G
   +tft2phokDhxn6whCm7w0BU+mYZEe+0BWsoA6NwfZpf92KcDKRC0q+hoT
   l4dfqI8d39j53ibblpwKQqz5CE7RrVRxKjl0xwlMLam4cQMds09lGu119
   yM5dMAnm2jQNdsOZL++HqrEB7CnItM+ZTuWGjelYiPhorid1JJH/NF54t
   5lYR/ihaanPKYLJpQhZ99RU1vD4GFfV+qJrolHjUx/yV5IAN5NYlXQ2d0
   A==;
X-CSE-ConnectionGUID: tDrbZqw6R2moNdZIGD2uiA==
X-CSE-MsgGUID: 6QTJ1xgXTz64bJ0bY3cqTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11559"; a="71395420"
X-IronPort-AV: E=Sophos;i="6.18,281,1751266800"; 
   d="scan'208";a="71395420"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2025 13:49:34 -0700
X-CSE-ConnectionGUID: qsWGhSxhQPyWu+N0WNqlGg==
X-CSE-MsgGUID: PBO4BdgHSSur2mHpWFrq7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,281,1751266800"; 
   d="scan'208";a="175388023"
Received: from lkp-server01.sh.intel.com (HELO 7f63209e7e66) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 20 Sep 2025 13:49:31 -0700
Received: from kbuild by 7f63209e7e66 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v04WN-00006t-1t;
	Sat, 20 Sep 2025 20:49:27 +0000
Date: Sun, 21 Sep 2025 04:49:08 +0800
From: kernel test robot <lkp@intel.com>
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
	David Collins <david.collins@oss.qualcomm.com>
Subject: Re: [PATCH 1/3] spmi: spmi-pmic-arb: add support for PMIC arbiter v8
Message-ID: <202509210436.v24lwANK-lkp@intel.com>
References: <20250920-glymur-spmi-v8-gpio-driver-v1-1-23df93b7818a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250920-glymur-spmi-v8-gpio-driver-v1-1-23df93b7818a@oss.qualcomm.com>

Hi Kamal,

kernel test robot noticed the following build errors:

[auto build test ERROR on c3067c2c38316c3ef013636c93daa285ee6aaa2e]

url:    https://github.com/intel-lab-lkp/linux/commits/Kamal-Wadhwa/spmi-spmi-pmic-arb-add-support-for-PMIC-arbiter-v8/20250920-040410
base:   c3067c2c38316c3ef013636c93daa285ee6aaa2e
patch link:    https://lore.kernel.org/r/20250920-glymur-spmi-v8-gpio-driver-v1-1-23df93b7818a%40oss.qualcomm.com
patch subject: [PATCH 1/3] spmi: spmi-pmic-arb: add support for PMIC arbiter v8
config: nios2-randconfig-001-20250921 (https://download.01.org/0day-ci/archive/20250921/202509210436.v24lwANK-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250921/202509210436.v24lwANK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509210436.v24lwANK-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/spmi/spmi-pmic-arb.c: In function 'qpnpint_spmi_write':
>> drivers/spmi/spmi-pmic-arb.c:129:30: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
    #define hwirq_to_sid(hwirq)  FIELD_GET(GENMASK(32, 28), (hwirq))
                                 ^~~~~~~~~
   drivers/spmi/spmi-pmic-arb.c:620:11: note: in expansion of macro 'hwirq_to_sid'
     u8 sid = hwirq_to_sid(d->hwirq);
              ^~~~~~~~~~~~
   In file included from include/linux/bitops.h:6,
                    from include/linux/bitmap.h:8,
                    from drivers/spmi/spmi-pmic-arb.c:5:
   include/linux/bits.h:49:20: warning: right shift count >= width of type [-Wshift-count-overflow]
           type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
                       ^~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   drivers/spmi/spmi-pmic-arb.c:129:40: note: in expansion of macro 'GENMASK'
    #define hwirq_to_sid(hwirq)  FIELD_GET(GENMASK(32, 28), (hwirq))
                                           ^~~~~~~
   drivers/spmi/spmi-pmic-arb.c:620:11: note: in expansion of macro 'hwirq_to_sid'
     u8 sid = hwirq_to_sid(d->hwirq);
              ^~~~~~~~~~~~
   drivers/spmi/spmi-pmic-arb.c: In function 'qpnpint_spmi_read':
   include/linux/bits.h:49:20: warning: right shift count >= width of type [-Wshift-count-overflow]
           type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
                       ^~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   drivers/spmi/spmi-pmic-arb.c:129:40: note: in expansion of macro 'GENMASK'
    #define hwirq_to_sid(hwirq)  FIELD_GET(GENMASK(32, 28), (hwirq))
                                           ^~~~~~~
   drivers/spmi/spmi-pmic-arb.c:632:11: note: in expansion of macro 'hwirq_to_sid'
     u8 sid = hwirq_to_sid(d->hwirq);
              ^~~~~~~~~~~~
   drivers/spmi/spmi-pmic-arb.c: In function 'qpnpint_spmi_masked_write':
   include/linux/bits.h:49:20: warning: right shift count >= width of type [-Wshift-count-overflow]
           type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
                       ^~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   drivers/spmi/spmi-pmic-arb.c:129:40: note: in expansion of macro 'GENMASK'
    #define hwirq_to_sid(hwirq)  FIELD_GET(GENMASK(32, 28), (hwirq))
                                           ^~~~~~~
   drivers/spmi/spmi-pmic-arb.c:646:11: note: in expansion of macro 'hwirq_to_sid'
     u8 sid = hwirq_to_sid(d->hwirq);
              ^~~~~~~~~~~~
   drivers/spmi/spmi-pmic-arb.c: In function 'periph_interrupt':
>> drivers/spmi/spmi-pmic-arb.c:124:3: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
     (FIELD_PREP(GENMASK(32, 28), (slave_id))  | \
      ^~~~~~~~~~
   drivers/spmi/spmi-pmic-arb.c:685:12: note: in expansion of macro 'spec_to_hwirq'
               spec_to_hwirq(sid, per, id, apid));
               ^~~~~~~~~~~~~
   In file included from include/linux/bitops.h:6,
                    from include/linux/bitmap.h:8,
                    from drivers/spmi/spmi-pmic-arb.c:5:
   include/linux/bits.h:49:20: warning: right shift count >= width of type [-Wshift-count-overflow]
           type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
                       ^~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   drivers/spmi/spmi-pmic-arb.c:124:14: note: in expansion of macro 'GENMASK'
     (FIELD_PREP(GENMASK(32, 28), (slave_id))  | \
                 ^~~~~~~
   drivers/spmi/spmi-pmic-arb.c:685:12: note: in expansion of macro 'spec_to_hwirq'
               spec_to_hwirq(sid, per, id, apid));
               ^~~~~~~~~~~~~
   drivers/spmi/spmi-pmic-arb.c: In function 'qpnpint_irq_domain_activate':
   include/linux/bits.h:49:20: warning: right shift count >= width of type [-Wshift-count-overflow]
           type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
                       ^~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   drivers/spmi/spmi-pmic-arb.c:129:40: note: in expansion of macro 'GENMASK'
    #define hwirq_to_sid(hwirq)  FIELD_GET(GENMASK(32, 28), (hwirq))
                                           ^~~~~~~
   drivers/spmi/spmi-pmic-arb.c:887:12: note: in expansion of macro 'hwirq_to_sid'
     u16 sid = hwirq_to_sid(d->hwirq);
               ^~~~~~~~~~~~
   drivers/spmi/spmi-pmic-arb.c: In function 'qpnpint_irq_domain_translate':
   include/linux/bits.h:49:20: warning: right shift count >= width of type [-Wshift-count-overflow]
           type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
                       ^~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   drivers/spmi/spmi-pmic-arb.c:124:14: note: in expansion of macro 'GENMASK'
     (FIELD_PREP(GENMASK(32, 28), (slave_id))  | \
                 ^~~~~~~
   drivers/spmi/spmi-pmic-arb.c:952:15: note: in expansion of macro 'spec_to_hwirq'
     *out_hwirq = spec_to_hwirq(intspec[0], intspec[1], intspec[2], apid);
                  ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_GET +129 drivers/spmi/spmi-pmic-arb.c

   118	
   119	/*
   120	 * hwirq value crosses 32 bits only for platforms with more than 16 PMICs,
   121	 * none of which happen to support booting Linux in 32-bit mode.
   122	 */
   123	#define spec_to_hwirq(slave_id, periph_id, irq_id, apid) \
 > 124		(FIELD_PREP(GENMASK(32, 28), (slave_id))  | \
   125		FIELD_PREP(GENMASK(27, 20), (periph_id)) | \
   126		FIELD_PREP(GENMASK(18, 16), (irq_id))    | \
   127		FIELD_PREP(GENMASK(12, 0),  (apid)))
   128	
 > 129	#define hwirq_to_sid(hwirq)  FIELD_GET(GENMASK(32, 28), (hwirq))
   130	#define hwirq_to_per(hwirq)  FIELD_GET(GENMASK(27, 20), (hwirq))
   131	#define hwirq_to_irq(hwirq)  FIELD_GET(GENMASK(18, 16), (hwirq))
   132	#define hwirq_to_apid(hwirq) FIELD_GET(GENMASK(12, 0), (hwirq))
   133	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

