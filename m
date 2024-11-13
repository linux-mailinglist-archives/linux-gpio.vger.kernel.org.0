Return-Path: <linux-gpio+bounces-12969-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1FE9C746C
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 15:35:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B656D1F273EB
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 14:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5A5D1FE0F8;
	Wed, 13 Nov 2024 14:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gZzN44L7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6551052F76;
	Wed, 13 Nov 2024 14:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731508488; cv=none; b=FklVcqeCpJ0IF3rRvEQrjxDJvCHPSTopZ0yUJN3LlFPURo8zGtaq8cHRu9TlOQR29DupN55t6uLUOZjb8rEuilkZ8sppoU+2xxv1T9FRnUIo6gbDhgGvn+J3LB54GNtCOuAYmiq3wSyF/Ldba2BUENecIS3DtqAIaCrX9eJTxv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731508488; c=relaxed/simple;
	bh=dM5isGoT8gvEzdUI7m24PY0e10UMd7maYxFQPVEb2S8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NkFIJCARNMjfiSUyS9t15hmJksU7T2uC5FzyMAqxsKIu6YjmfTLksqWBztkvaISUIADaQvjmeTRXY7ZesZr2Zh40qQY1s4TGnfnETCTzSb4P0z7omPRvujhv9LGidoeyqiK+1Zgv/N+TRZwWHS+6usJqIsQr3GOySUtWN2MPilk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gZzN44L7; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731508486; x=1763044486;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dM5isGoT8gvEzdUI7m24PY0e10UMd7maYxFQPVEb2S8=;
  b=gZzN44L7zIYrx7ClEs5xnnBbMJbhlFnnEac41s5WzlUiLqQ61c3lXSak
   K3Xzr35ZSD/i5wXCEfOZyi7i/wY5j5bwMCHeAm3cDeCJK7CXDd48oqxk2
   fuYCIBPHljkK65sEgLJfLnhfHjHTQA9dfdzzAhHY/9blOf+vSq5EUC8fc
   rsIJZ19ZVo/hk1DXPJ8SHQEhdce04666v/TllpGYTAzjRYLie5BrbGSwC
   Co8OgovfxuwM0ClyxQlubl3RAlPMZzlHrSunJVSIvHtSFpRoucWUVqW+I
   tqV4IVMSA/IW8vEnZ8HVEuqQ3hwdukK2lhdha0VCPEg3i1L5P8pKzxZru
   g==;
X-CSE-ConnectionGUID: vRE7MTP6QTmCczYaaFS8gQ==
X-CSE-MsgGUID: scf18RNuRrOa1OLYxLSOKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="19010677"
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; 
   d="scan'208";a="19010677"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 06:34:45 -0800
X-CSE-ConnectionGUID: Mp0B/uQKTpulc6xwndRd1g==
X-CSE-MsgGUID: dPCbY9paSP+5GgUIMsiBpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; 
   d="scan'208";a="88050341"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 13 Nov 2024 06:34:39 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBES4-0000Sj-2J;
	Wed, 13 Nov 2024 14:34:36 +0000
Date: Wed, 13 Nov 2024 22:34:11 +0800
From: kernel test robot <lkp@intel.com>
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>, Lee Jones <lee@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Subject: Re: [PATCH v6 7/7] MAINTAINERS: add MAINTAINER for NXP SIUL2 MFD
 driver
Message-ID: <202411132227.SO6y3U3E-lkp@intel.com>
References: <20241113101124.1279648-8-andrei.stefanescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241113101124.1279648-8-andrei.stefanescu@oss.nxp.com>

Hi Andrei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linusw-pinctrl/devel]
[also build test WARNING on linusw-pinctrl/for-next lee-mfd/for-mfd-next shawnguo/for-next linus/master v6.12-rc7 next-20241113]
[cannot apply to lee-mfd/for-mfd-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrei-Stefanescu/dt-bindings-mfd-add-support-for-the-NXP-SIUL2-module/20241113-181639
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20241113101124.1279648-8-andrei.stefanescu%40oss.nxp.com
patch subject: [PATCH v6 7/7] MAINTAINERS: add MAINTAINER for NXP SIUL2 MFD driver
reproduce: (https://download.01.org/0day-ci/archive/20241113/202411132227.SO6y3U3E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411132227.SO6y3U3E-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`tc<../../networking/netlink_spec/tc>`
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: Documentation/userspace-api/netlink/index.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
   Warning: Documentation/userspace-api/netlink/specs.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/mfd/nxp,siul2.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/reserved-memory/qcom
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

