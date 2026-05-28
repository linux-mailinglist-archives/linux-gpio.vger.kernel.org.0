Return-Path: <linux-gpio+bounces-37642-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEBtONFEGGr5iAgAu9opvQ
	(envelope-from <linux-gpio+bounces-37642-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 15:36:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA8F5F2D17
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 15:36:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8A1DD3006011
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 13:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BC703F4DD3;
	Thu, 28 May 2026 13:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ezuvlXQF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750E03D34B5
	for <linux-gpio@vger.kernel.org>; Thu, 28 May 2026 13:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779975213; cv=none; b=KwCsoL4bD03IV3+KSY/HMB7QRdmqJ+V1wifjM6yIT21/zn5CiKuOD65F1pzG+qSrysAUYNeuJAEk+Fgl3rANSbeeARw8GL9ECo7PTf0/emG5FM4rL4edZXHQCpSoPelF7BHivc6edt2TKEgSgWpY6eYDIxFW+98Ra93XHdjHubs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779975213; c=relaxed/simple;
	bh=wRO4g8LxtkP8/d4l7qmnZwaEwTbv4mZmJfQnBYp9/+E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Cd5t9TO8iQB5rVv7JljyOTjpI0KGE662XbBbvtcya52h0m/zTUSlCRdoVxqpIz2juUCpoMMXvGquGoRQ1XtlD54qti2lfr/aa+DkJrG8lmrqsfJPg6xuCfYM6zVr1z8AT7TKaEsGv9sl7IDrIroCjLn909WTQrc7IEFwYjxInd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ezuvlXQF; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779975211; x=1811511211;
  h=date:from:to:cc:subject:message-id;
  bh=wRO4g8LxtkP8/d4l7qmnZwaEwTbv4mZmJfQnBYp9/+E=;
  b=ezuvlXQF5fkeY1apLFK8NW0srLAMvC2h7r5aF04S7zUuAlCSH2s0Ic3A
   53DeHihUpOB2yphdJjIsHpZ+sfRzX2Twgk7tlwvWh43YvtMk8qf5+JgxH
   CXTUdqyGmaeRTRQtQAo7oqnGczsB/dHDF1EccryqpPySBSjYsmGA5JSNU
   0TQn6JAl4y2Qdlt60z1BP3Rw3rV7arr/rMiKAnOVlAMivKu0IoI/x2EDI
   gU+ZcLz1/WoI3LSXdcJwFX+otSbBF/BA7cKLV4+eucxGwEPS3BCF5+n2h
   dTAAeRg59gULNOnsM7DJzNegOztqYzZIOnAt1Nrg8EJxHh/F5pxhOSWN8
   w==;
X-CSE-ConnectionGUID: 4PxCXUivRjiX5z1SB3AEAw==
X-CSE-MsgGUID: 73gznk9tR4qDwZJogQrbMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="92289327"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="92289327"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 06:33:31 -0700
X-CSE-ConnectionGUID: hGvzQdqgTUyJgJ7WcEDatQ==
X-CSE-MsgGUID: 6Vpcf1RCQ+SaDtTEzPlWDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="239978789"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 28 May 2026 06:33:28 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSarW-0000000060g-0DUk;
	Thu, 28 May 2026 13:33:26 +0000
Date: Thu, 28 May 2026 21:32:39 +0800
From: kernel test robot <lkp@intel.com>
To: Prathamesh Shete <pshete@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
 Linus Walleij <linusw@kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [linusw-pinctrl:devel 70/81]
 drivers/pinctrl/tegra/pinctrl-tegra238.c:1169:27: warning:
 'soc_gpio86_phh3_pins' defined but not used
Message-ID: <202605282107.qMTvFj61-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37642-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,intel.com:email,intel.com:mid,intel.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: ECA8F5F2D17
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
head:   0524a508b2cf7a3819406cd10d43d6e30fa31004
commit: 25cac7292d49f4fc5ee352eff7c8874d1b296380 [70/81] pinctrl: tegra: Add Tegra238 pinmux driver
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260528/202605282107.qMTvFj61-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260528/202605282107.qMTvFj61-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605282107.qMTvFj61-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/tegra/pinctrl-tegra238.c:1169:27: warning: 'soc_gpio86_phh3_pins' defined but not used [-Wunused-const-variable=]
    1169 | static const unsigned int soc_gpio86_phh3_pins[] = {
         |                           ^~~~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/tegra/pinctrl-tegra238.c:1165:27: warning: 'uart5_cts_phh2_pins' defined but not used [-Wunused-const-variable=]
    1165 | static const unsigned int uart5_cts_phh2_pins[] = {
         |                           ^~~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/tegra/pinctrl-tegra238.c:1161:27: warning: 'uart5_rts_phh1_pins' defined but not used [-Wunused-const-variable=]
    1161 | static const unsigned int uart5_rts_phh1_pins[] = {
         |                           ^~~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/tegra/pinctrl-tegra238.c:1157:27: warning: 'uart5_rx_phh0_pins' defined but not used [-Wunused-const-variable=]
    1157 | static const unsigned int uart5_rx_phh0_pins[] = {
         |                           ^~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/tegra/pinctrl-tegra238.c:1153:27: warning: 'uart5_tx_pgg7_pins' defined but not used [-Wunused-const-variable=]
    1153 | static const unsigned int uart5_tx_pgg7_pins[] = {
         |                           ^~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/tegra/pinctrl-tegra238.c:1149:27: warning: 'soc_gpio85_pgg6_pins' defined but not used [-Wunused-const-variable=]
    1149 | static const unsigned int soc_gpio85_pgg6_pins[] = {
         |                           ^~~~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/tegra/pinctrl-tegra238.c:1145:27: warning: 'uart2_cts_pgg5_pins' defined but not used [-Wunused-const-variable=]
    1145 | static const unsigned int uart2_cts_pgg5_pins[] = {
         |                           ^~~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/tegra/pinctrl-tegra238.c:1141:27: warning: 'uart2_rts_pgg4_pins' defined but not used [-Wunused-const-variable=]
    1141 | static const unsigned int uart2_rts_pgg4_pins[] = {
         |                           ^~~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/tegra/pinctrl-tegra238.c:1137:27: warning: 'uart2_rx_pgg3_pins' defined but not used [-Wunused-const-variable=]
    1137 | static const unsigned int uart2_rx_pgg3_pins[] = {
         |                           ^~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/tegra/pinctrl-tegra238.c:1133:27: warning: 'uart2_tx_pgg2_pins' defined but not used [-Wunused-const-variable=]
    1133 | static const unsigned int uart2_tx_pgg2_pins[] = {
         |                           ^~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/tegra/pinctrl-tegra238.c:1129:27: warning: 'soc_gpio84_pgg1_pins' defined but not used [-Wunused-const-variable=]
    1129 | static const unsigned int soc_gpio84_pgg1_pins[] = {
         |                           ^~~~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/tegra/pinctrl-tegra238.c:1125:27: warning: 'soc_gpio77_pgg0_pins' defined but not used [-Wunused-const-variable=]
    1125 | static const unsigned int soc_gpio77_pgg0_pins[] = {
         |                           ^~~~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/tegra/pinctrl-tegra238.c:1121:27: warning: 'soc_gpio76_pff7_pins' defined but not used [-Wunused-const-variable=]
    1121 | static const unsigned int soc_gpio76_pff7_pins[] = {
         |                           ^~~~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/tegra/pinctrl-tegra238.c:1117:27: warning: 'soc_gpio80_pff6_pins' defined but not used [-Wunused-const-variable=]
    1117 | static const unsigned int soc_gpio80_pff6_pins[] = {
         |                           ^~~~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/tegra/pinctrl-tegra238.c:1113:27: warning: 'soc_gpio74_pff5_pins' defined but not used [-Wunused-const-variable=]
    1113 | static const unsigned int soc_gpio74_pff5_pins[] = {
         |                           ^~~~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/tegra/pinctrl-tegra238.c:1109:27: warning: 'soc_gpio73_pff4_pins' defined but not used [-Wunused-const-variable=]
    1109 | static const unsigned int soc_gpio73_pff4_pins[] = {
         |                           ^~~~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/tegra/pinctrl-tegra238.c:1105:27: warning: 'soc_gpio72_pff3_pins' defined but not used [-Wunused-const-variable=]
    1105 | static const unsigned int soc_gpio72_pff3_pins[] = {
         |                           ^~~~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/tegra/pinctrl-tegra238.c:1101:27: warning: 'soc_gpio71_pff2_pins' defined but not used [-Wunused-const-variable=]
    1101 | static const unsigned int soc_gpio71_pff2_pins[] = {
         |                           ^~~~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/tegra/pinctrl-tegra238.c:1097:27: warning: 'soc_gpio70_pff1_pins' defined but not used [-Wunused-const-variable=]
    1097 | static const unsigned int soc_gpio70_pff1_pins[] = {
         |                           ^~~~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/tegra/pinctrl-tegra238.c:1093:27: warning: 'soc_gpio69_pff0_pins' defined but not used [-Wunused-const-variable=]
    1093 | static const unsigned int soc_gpio69_pff0_pins[] = {
         |                           ^~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/tegra/pinctrl-tegra238.c:1089:27: warning: 'soc_gpio83_pee5_pins' defined but not used [-Wunused-const-variable=]
    1089 | static const unsigned int soc_gpio83_pee5_pins[] = {
         |                           ^~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/tegra/pinctrl-tegra238.c:1085:27: warning: 'soc_gpio50_pee4_pins' defined but not used [-Wunused-const-variable=]
    1085 | static const unsigned int soc_gpio50_pee4_pins[] = {
         |                           ^~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/tegra/pinctrl-tegra238.c:1081:27: warning: 'soc_gpio82_pee3_pins' defined but not used [-Wunused-const-variable=]
    1081 | static const unsigned int soc_gpio82_pee3_pins[] = {
         |                           ^~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/tegra/pinctrl-tegra238.c:1077:27: warning: 'soc_gpio49_pee2_pins' defined but not used [-Wunused-const-variable=]
    1077 | static const unsigned int soc_gpio49_pee2_pins[] = {
         |                           ^~~~~~~~~~~~~~~~~~~~


vim +/soc_gpio86_phh3_pins +1169 drivers/pinctrl/tegra/pinctrl-tegra238.c

  1076	
> 1077	static const unsigned int soc_gpio49_pee2_pins[] = {
  1078		TEGRA_PIN_SOC_GPIO49_PEE2,
  1079	};
  1080	
> 1081	static const unsigned int soc_gpio82_pee3_pins[] = {
  1082		TEGRA_PIN_SOC_GPIO82_PEE3,
  1083	};
  1084	
> 1085	static const unsigned int soc_gpio50_pee4_pins[] = {
  1086		TEGRA_PIN_SOC_GPIO50_PEE4,
  1087	};
  1088	
> 1089	static const unsigned int soc_gpio83_pee5_pins[] = {
  1090		TEGRA_PIN_SOC_GPIO83_PEE5,
  1091	};
  1092	
> 1093	static const unsigned int soc_gpio69_pff0_pins[] = {
  1094		TEGRA_PIN_SOC_GPIO69_PFF0,
  1095	};
  1096	
> 1097	static const unsigned int soc_gpio70_pff1_pins[] = {
  1098		TEGRA_PIN_SOC_GPIO70_PFF1,
  1099	};
  1100	
> 1101	static const unsigned int soc_gpio71_pff2_pins[] = {
  1102		TEGRA_PIN_SOC_GPIO71_PFF2,
  1103	};
  1104	
> 1105	static const unsigned int soc_gpio72_pff3_pins[] = {
  1106		TEGRA_PIN_SOC_GPIO72_PFF3,
  1107	};
  1108	
> 1109	static const unsigned int soc_gpio73_pff4_pins[] = {
  1110		TEGRA_PIN_SOC_GPIO73_PFF4,
  1111	};
  1112	
> 1113	static const unsigned int soc_gpio74_pff5_pins[] = {
  1114		TEGRA_PIN_SOC_GPIO74_PFF5,
  1115	};
  1116	
> 1117	static const unsigned int soc_gpio80_pff6_pins[] = {
  1118		TEGRA_PIN_SOC_GPIO80_PFF6,
  1119	};
  1120	
> 1121	static const unsigned int soc_gpio76_pff7_pins[] = {
  1122		TEGRA_PIN_SOC_GPIO76_PFF7,
  1123	};
  1124	
> 1125	static const unsigned int soc_gpio77_pgg0_pins[] = {
  1126		TEGRA_PIN_SOC_GPIO77_PGG0,
  1127	};
  1128	
> 1129	static const unsigned int soc_gpio84_pgg1_pins[] = {
  1130		TEGRA_PIN_SOC_GPIO84_PGG1,
  1131	};
  1132	
> 1133	static const unsigned int uart2_tx_pgg2_pins[] = {
  1134		TEGRA_PIN_UART2_TX_PGG2,
  1135	};
  1136	
> 1137	static const unsigned int uart2_rx_pgg3_pins[] = {
  1138		TEGRA_PIN_UART2_RX_PGG3,
  1139	};
  1140	
> 1141	static const unsigned int uart2_rts_pgg4_pins[] = {
  1142		TEGRA_PIN_UART2_RTS_PGG4,
  1143	};
  1144	
> 1145	static const unsigned int uart2_cts_pgg5_pins[] = {
  1146		TEGRA_PIN_UART2_CTS_PGG5,
  1147	};
  1148	
> 1149	static const unsigned int soc_gpio85_pgg6_pins[] = {
  1150		TEGRA_PIN_SOC_GPIO85_PGG6,
  1151	};
  1152	
> 1153	static const unsigned int uart5_tx_pgg7_pins[] = {
  1154		TEGRA_PIN_UART5_TX_PGG7,
  1155	};
  1156	
> 1157	static const unsigned int uart5_rx_phh0_pins[] = {
  1158		TEGRA_PIN_UART5_RX_PHH0,
  1159	};
  1160	
> 1161	static const unsigned int uart5_rts_phh1_pins[] = {
  1162		TEGRA_PIN_UART5_RTS_PHH1,
  1163	};
  1164	
> 1165	static const unsigned int uart5_cts_phh2_pins[] = {
  1166		TEGRA_PIN_UART5_CTS_PHH2,
  1167	};
  1168	
> 1169	static const unsigned int soc_gpio86_phh3_pins[] = {
  1170		TEGRA_PIN_SOC_GPIO86_PHH3,
  1171	};
  1172	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

