Return-Path: <linux-gpio+bounces-231-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDE37F04C4
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Nov 2023 09:17:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B3B11F220B5
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Nov 2023 08:17:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 820355398;
	Sun, 19 Nov 2023 08:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GpW+3aUb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F885182;
	Sun, 19 Nov 2023 00:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700381812; x=1731917812;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0NkMhkkV+cUo97yEBokAzfARPMt+tQWy8S0Z8qalPik=;
  b=GpW+3aUb1+wBDblfaP4e0dLVSh+j+HlTZHvg/g8HPQuIgys4HPJJjZAe
   ir28FQ5aCfwetu3e/z2Ryoa3uhxbmjif01oe+/YjPjg7ljzVBUAZTIu30
   J+0xsEROD7N11UPSgGLio5I/TIYJk5E0Jgn6U6R09japvimlbhG2/e97l
   0N/C7JlILXH+m7nK0R7HR3JxhVDFZMkMc2HQzjuTHil2nafb5e7Boaufn
   tqs4wD//olNFsPcVBURYkjVvCRmXeH/Zta92o8Ilohbr1ZbbbTTS752Qq
   U9749+ew8+SSYDGmCZS1quoCplgsgJmM9Wb/B9QWeHTLDzke7PujTc8Kw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="381866511"
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="381866511"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 00:16:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="759536758"
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="759536758"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 19 Nov 2023 00:16:43 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4cyv-0004pL-1K;
	Sun, 19 Nov 2023 08:16:41 +0000
Date: Sun, 19 Nov 2023 16:16:33 +0800
From: kernel test robot <lkp@intel.com>
To: Herve Codina <herve.codina@bootlin.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH v9 23/27] net: wan: framer: Add support for the Lantiq
 PEF2256 framer
Message-ID: <202311191651.ayfggTMD-lkp@intel.com>
References: <20231115144007.478111-24-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231115144007.478111-24-herve.codina@bootlin.com>

Hi Herve,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linusw-pinctrl/devel linusw-pinctrl/for-next robh/for-next linus/master v6.7-rc1 next-20231117]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Herve-Codina/soc-fsl-cpm1-tsa-Fix-__iomem-addresses-declaration/20231115-224517
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20231115144007.478111-24-herve.codina%40bootlin.com
patch subject: [PATCH v9 23/27] net: wan: framer: Add support for the Lantiq PEF2256 framer
config: s390-kismet-CONFIG_MFD_CORE-CONFIG_FRAMER_PEF2256-0-0 (https://download.01.org/0day-ci/archive/20231119/202311191651.ayfggTMD-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20231119/202311191651.ayfggTMD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311191651.ayfggTMD-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for MFD_CORE when selected by FRAMER_PEF2256
   
   WARNING: unmet direct dependencies detected for MFD_CORE
     Depends on [n]: HAS_IOMEM [=n]
     Selected by [y]:
     - FRAMER_PEF2256 [=y] && NETDEVICES [=y] && WAN [=y] && FRAMER [=y] && OF [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

