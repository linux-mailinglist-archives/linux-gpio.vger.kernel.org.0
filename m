Return-Path: <linux-gpio+bounces-37684-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFmuDZp2GWqwwwgAu9opvQ
	(envelope-from <linux-gpio+bounces-37684-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 13:20:58 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CE35F60188B
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 13:20:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8128F3011C77
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 11:15:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D30E53D0900;
	Fri, 29 May 2026 11:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XyQZ6UYL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82123CFF4F
	for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 11:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780053316; cv=none; b=C0er/Ina+6eOLKbYq4fm2JqOeuKlEQZVrc979sWvdxSBmlr9AWIfWkZEJwvJo/WI8YG0+MkhrkEv8XqspMgCoaBpnO3XspfcRpRyvbljKaab5xhc6MwQLBvSn8rN0eSZV21uDhrDloRMxiRwzLUd7kaDS0DR0K52No4TJQzXSrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780053316; c=relaxed/simple;
	bh=mSnr50PamQTUdTLeHGSpb4YPvAb9owFYXAyhnhD2ZNA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZhDqrjgGXoXGEn+YbIkPnxEU8N+Up3j5Lao5UZFUZzPChnqXaqEofb1EsD1IANHbNAIishj8jOw18iXpW4sP5yM2M3eDd7Uq2I8SlCFF6vNEFzWscENmDuJZjA7hMuTzgdrR61D4dr65iQjbLtxsLKy5kxKBEr7uV0i0arwhhVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XyQZ6UYL; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780053312; x=1811589312;
  h=date:from:to:cc:subject:message-id;
  bh=mSnr50PamQTUdTLeHGSpb4YPvAb9owFYXAyhnhD2ZNA=;
  b=XyQZ6UYLT9P25AJV4Klde3URMOt5toybgB3Z2El/oFG1Qcxy5KjrYc0V
   b8pmQrJW+teV86eytw2pcYZPDU+94QbcmaSHtM6GRCOF627CQo0TpSdh1
   Brx9V9ZW6jxIyqLjmMeiKPjlFsip3WfNNrsaLNOIr6yxivBM+LPFIiIRC
   fkObSTze+LI5CnLO+skedcvjAgNrP0RhvTnn9PECeey7w0EBR/mBrgv5x
   pF/SSdOySRzJRy2rMYVEaIE+kF2SyIGcpO0p1fDVyNURqcwVTID9gpZ67
   BcxqbknSR4pugs1Le8HYEl+SxBdXtj/VrKuryNI5lTsv+uSawaWPTrmEN
   Q==;
X-CSE-ConnectionGUID: VDXpxxf2RCOd3CrNCG5i6A==
X-CSE-MsgGUID: 2SEYOK3FRHKBnFSYwkGWCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="98476140"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="98476140"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 04:15:11 -0700
X-CSE-ConnectionGUID: xTWi7UJNQy68/bA9qpGGWw==
X-CSE-MsgGUID: rwTGvIxkQN2s01gKZ5n2Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="280945191"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 29 May 2026 04:15:09 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSvBC-0000000078s-2S2D;
	Fri, 29 May 2026 11:15:06 +0000
Date: Fri, 29 May 2026 19:14:50 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS WITH WARNING
 0524a508b2cf7a3819406cd10d43d6e30fa31004
Message-ID: <202605291905.ZbIigdMK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TAGGED_FROM(0.00)[bounces-37684-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: CE35F60188B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 0524a508b2cf7a3819406cd10d43d6e30fa31004  pinctrl: qcom: sm6115: Add egpio support

Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202605282107.qMTvFj61-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202605290016.yjxpI0nU-lkp@intel.com

    drivers/pinctrl/ns' defined but not used [-Wunused-const-variable=]
    drivers/pinctrl/tegra/pinctegra/pinctrl-tegra238.c:1125:27: warning: unused variable 'soc_gpio77_pgg0_pins' [-Wunused-const-variable]
    drivers/pinctrl/tegra/pinctrl-tegra238.c:1077:27: warning: 'soc_gpio49_pee2_pins' defined but not used [-Wunused-const-variable=]
    drivers/pinctrl/tegra/pinctrl-tegra238.c:1077:27: warning: unused variable 'soc_gpio49_pee2_pins' [-Wunused-const-variable]
    drivers/pinctrl/tegra/pinctrl-tegra238.c:1081:27: warning: 'soc_gpio82_pee3_pins' defined but not used [-Wunused-const-variable=]
    drivers/pinctrl/tegra/pinctrl-tegra238.c:1081:27: warning: unused variable 'soc_gpio82_pee3_pins' [-Wunused-const-variable]
    drivers/pinctrl/tegra/pinctrl-tegra238.c:1085:27: warning: 'soc_gpio50_pee4_pins' defined but not used [-Wunused-const-variable=]
    drivers/pinctrl/tegra/pinctrl-tegra238.c:1085:27: warning: unused variable 'soc_gpio50_pee4_pins' [-Wunused-const-variable]
    drivers/pinctrl/tegra/pinctrl-tegra238.c:1089:27: warning: 'soc_gpio83_pee5_pins' defined but not used [-Wunused-const-variable=]
    drivers/pinctrl/tegra/pinctrl-tegra238.c:1089:27: warning: unused variable 'soc_gpio83_pee5_pins' [-Wunused-const-variable]
    drivers/pinctrl/tegra/pinctrl-tegra238.c:1093:27: warning: 'soc_gpio69_pff0_pins' defined but not used [-Wunused-const-variable=]
    drivers/pinctrl/tegra/pinctrl-tegra238.c:1093:27: warning: unused variable 'soc_gpio69_pff0_pins' [-Wunused-const-variable]
    drivers/pinctrl/tegra/pinctrl-tegra238.c:1097:27: warning: 'soc_gpio70_pff1_pins' defined but not used [-Wunused-const-variable=]
    drivers/pinctrl/tegra/pinctrl-tegra238.c:1097:27: warning: unused variable 'soc_gpio70_pff1_pins' [-Wunused-const-variable]
    drivers/pinctrl/tegra/pinctrl-tegra238.c:1101:27: warning: 'soc_gpio71_pff2_pins' defined but not used [-Wunused-const-variable=]
    drivers/pinctrl/tegra/pinctrl-tegra238.c:1101:27: warning: unused variable 'soc_gpio71_pff2_pins' [-Wunused-const-variable]
    drivers/pinctrl/tegra/pinctrl-tegra238.c:1105:27: warning: 'soc_gpio72_pff3_pins' defined but not used [-Wunused-const-variable=]
    drivers/pinctrl/tegra/pinctrl-tegra238.c:1105:27: warning: unused variable 'soc_gpio72_pff3_pins' [-Wunused-const-variable]
    drivers/pinctrl/tegra/pinctrl-tegra238.c:1109:27: warning: 'soc_gpio73_pff4_pins' defined but not used [-Wunused-const-variable=]
    drivers/pinctrl/tegra/pinctrl-tegra238.c:1109:27: warning: unused variable 'soc_gpio73_pff4_pins' [-Wunused-const-variable]
    drivers/pinctrl/tegra/pinctrl-tegra238.c:1113:27: warning: 'soc_gpio74_pff5_pidrivers/pinctrl/tegra/pinctrl-tegra238.c:1077:27: warning: unused variable 'soc_gpio49_pee2_pins' [-Wunused-const-variable]
    drivers/pinctrl/tegra/pinctrl-tegra238.c:1113:27: warning: 'soc_gpio74_pff5_pins' defined but not used [-Wunused-const-variable=]
    drivers/pinctrl/tegra/pinctrl-tegra238.c:1113:27: warning: unused variable 'soc_gpio74_pff5_pins' [-Wunused-const-variable]
    drivers/pinctrl/tegra/pinctrl-tegra238.c:1117:27: warning: 'soc_gpio80_pff6_pins' defined but not used [-Wunused-const-variable=]
    drivers/pinctrl/tegra/pinctrl-tegra238.c:1117:27: warning: unused variable 'soc_gpio80_pff6_pins' [-Wunused-const-variable]
    drivers/pinctrl/tegra/pinctrl-tegra238.c:1121:27: warning: 'soc_gpio76_pff7_pins' defined but not used [-Wunused-const-variable=]
    drivers/pinctrl/tegra/pinctrl-tegra238.c:1121:27: warning: unused variable 'soc_gpio76_pff7_pins' [-Wunused-const-variable]
    drivers/pinctrl/tegra/pinctrl-tegra238.c:1125:27: warning: 'soc_gpio77_pgg0_pins' defined but not used [-Wunused-const-variable=]
    drivers/pinctrl/tegra/pinctrl-tegra238.c:1125:27: warning: unused variable 'soc_gpio77_pgg0_pins' [-Wunused-const-variable]
    drivers/pinctrl/tegra/pinctrl-tegra238.c:1129:27: warning: 'soc_gpio84_pgg1_pins' defined but not used [-Wunused-const-variable=]
    drivers/pinctrl/tegra/pinctrl-tegra238.c:1129:27: warning: unused variable 'soc_gpio84_pgg1_pins' [-Wunused-const-variable]
    drivers/pinctrl/tegra/pinctrl-tegra238.c:1133:27: warning: 'uart2_tx_pgg2_pins' defined but not used [-Wunused-const-variable=]
    drivers/pinctrl/tegra/pinctrl-tegra238.c:1133:27: warning: unused variable 'uart2_tx_pgg2_pins' [-Wunused-const-variable]
    drivers/pinctrl/tegra/pinctrl-tegra238.c:1137:27: warning: 'uart2_rx_pgg3_pins' defined but not used [-Wunused-const-variable=]
    drivers/pinctrl/tegra/pinctrl-tegra238.c:1137:27: warning: unused variable 'uart2_rx_pgg3_pins' [-Wunused-const-variable]
    drivers/pinctrl/tegra/pinctrl-tegra238.c:1141:27: warning: 'uart2_rts_pgg4_pins' defined but not used [-Wunused-const-variable=]
    drivers/pinctrl/tegra/pinctrl-tegra238.c:1141:27: warning: unused variable 'uart2_rts_pgg4_pins' [-Wunused-const-variable]
    drivers/pinctrl/tegra/pinctrl-tegra238.c:1145:27: warning: 'uart2_cts_pgg5_pins' defined but not used [-Wunused-const-variable=]
    drivers/pinctrl/tegra/pinctrl-tegra238.c:1145:27: warning: unused variable 'uart2_cts_pgg5_pins' [-Wunused-const-variable]
    drivers/pinctrl/tegra/pinctrl-tegra238.c:1149:27: warning: 'soc_gpio85_pgg6_pins' defined but not used [-Wunused-const-variable=]
    drivers/pinctrl/tegra/pinctrl-tegra238.c:1149:27: warning: unused variable 'soc_gpio85_pgg6_pins' [-Wunused-const-variable]
    drivers/pinctrl/tegra/pinctrl-tegra238.c:1153:27: warning: 'uart5_tx_pgg7_pins' defined but not used [-Wunused-const-variable=]
    drivers/pinctrl/tegra/pinctrl-tegra238.c:1153:27: warning: unused variable 'uart5_tx_pgg7_pins' [-Wunused-const-variable]
    drivers/pinctrl/tegra/pinctrl-tegra238.c:1157:27: warning: 'uart5_rx_phh0_pins' defined but not used [-Wunused-const-variable=]
    drivers/pinctrl/tegra/pinctrl-tegra238.c:1157:27: warning: unused variable 'uart5_rx_phh0_pins' [-Wunused-const-variable]
    drivers/pinctrl/tegra/pinctrl-tegra238.c:1161:27: warning: 'uart5_rts_phh1_pins' defined but not used [-Wunused-const-variable=]
    drivers/pinctrl/tegra/pinctrl-tegra238.c:1161:27: warning: unused variable 'uart5_rts_phh1_pins' [-Wunused-const-variable]
    drivers/pinctrl/tegra/pinctrl-tegra238.c:1165:27: warning: 'uart5_cts_phh2_pins' defined but not used [-Wunused-const-variable=]
    drivers/pinctrl/tegra/pinctrl-tegra238.c:1165:27: warning: unused variable 'uart5_cts_phh2_pins' [-Wunused-const-variable]
    drivers/pinctrl/tegra/pinctrl-tegra238.c:1169:27: warning: 'soc_gpio86_phh3_pins' defined but not used [-Wunused-const-variable=]
    drivers/pinctrl/tegra/pinctrl-tegra238.c:1169:27: warning: unused variable 'soc_gpio86_phh3_pins' [-Wunused-const-variable]
    trl-tegra238.c:1169:27: warning: 'soc_gpio86_phh3_pins' defined but not used [-Wunused-const-variable=]

Warning ids grouped by kconfigs:

recent_errors
|-- alpha-allyesconfig
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio49_pee2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio50_pee4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio69_pff0_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio70_pff1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio71_pff2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio72_pff3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio73_pff4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio74_pff5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio76_pff7_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio77_pgg0_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio80_pff6_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio82_pee3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio83_pee5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio84_pgg1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio85_pgg6_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio86_phh3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_cts_pgg5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_rts_pgg4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_rx_pgg3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_tx_pgg2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_cts_phh2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_rts_phh1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_rx_phh0_pins-defined-but-not-used
|   `-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_tx_pgg7_pins-defined-but-not-used
|-- arc-allmodconfig
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio49_pee2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio50_pee4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio69_pff0_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio70_pff1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio71_pff2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio72_pff3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio73_pff4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio74_pff5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio76_pff7_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio77_pgg0_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio80_pff6_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio82_pee3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio83_pee5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio84_pgg1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio85_pgg6_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio86_phh3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_cts_pgg5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_rts_pgg4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_rx_pgg3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_tx_pgg2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_cts_phh2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_rts_phh1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_rx_phh0_pins-defined-but-not-used
|   `-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_tx_pgg7_pins-defined-but-not-used
|-- arm-allyesconfig
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio49_pee2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio50_pee4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio69_pff0_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio70_pff1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio71_pff2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio72_pff3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio73_pff4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio74_pff5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio76_pff7_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio77_pgg0_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio80_pff6_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio82_pee3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio83_pee5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio84_pgg1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio85_pgg6_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio86_phh3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_cts_pgg5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_rts_pgg4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_rx_pgg3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_tx_pgg2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_cts_phh2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_rts_phh1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_rx_phh0_pins-defined-but-not-used
|   `-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_tx_pgg7_pins-defined-but-not-used
|-- arm64-defconfig
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio49_pee2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio50_pee4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio69_pff0_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio70_pff1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio71_pff2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio72_pff3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio73_pff4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio74_pff5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio76_pff7_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio77_pgg0_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio80_pff6_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio82_pee3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio83_pee5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio84_pgg1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio85_pgg6_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio86_phh3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_cts_pgg5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_rts_pgg4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_rx_pgg3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_tx_pgg2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_cts_phh2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_rts_phh1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_rx_phh0_pins-defined-but-not-used
|   `-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_tx_pgg7_pins-defined-but-not-used
|-- csky-allmodconfig
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio49_pee2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio50_pee4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio69_pff0_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio70_pff1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio71_pff2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio72_pff3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio73_pff4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio74_pff5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio76_pff7_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio77_pgg0_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio80_pff6_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio82_pee3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio83_pee5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio84_pgg1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio85_pgg6_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio86_phh3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_cts_pgg5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_rts_pgg4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_rx_pgg3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_tx_pgg2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_cts_phh2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_rts_phh1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_rx_phh0_pins-defined-but-not-used
|   `-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_tx_pgg7_pins-defined-but-not-used
|-- csky-randconfig-r064-20260529
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio49_pee2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio50_pee4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio69_pff0_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio70_pff1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio71_pff2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio72_pff3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio73_pff4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio74_pff5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio76_pff7_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio77_pgg0_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio80_pff6_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio82_pee3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio83_pee5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio84_pgg1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio85_pgg6_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio86_phh3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_cts_pgg5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_rts_pgg4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_rx_pgg3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_tx_pgg2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_cts_phh2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_rts_phh1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_rx_phh0_pins-defined-but-not-used
|   `-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_tx_pgg7_pins-defined-but-not-used
|-- hexagon-allmodconfig
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio49_pee2_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio50_pee4_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio69_pff0_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio70_pff1_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio71_pff2_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio72_pff3_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio73_pff4_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio74_pff5_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio76_pff7_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio77_pgg0_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio80_pff6_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio82_pee3_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio83_pee5_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio84_pgg1_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio85_pgg6_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio86_phh3_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-uart2_cts_pgg5_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-uart2_rts_pgg4_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-uart2_rx_pgg3_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-uart2_tx_pgg2_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-uart5_cts_phh2_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-uart5_rts_phh1_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-uart5_rx_phh0_pins
|   `-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-uart5_tx_pgg7_pins
|-- i386-allmodconfig
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio49_pee2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio50_pee4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio69_pff0_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio70_pff1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio71_pff2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio72_pff3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio73_pff4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio74_pff5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio76_pff7_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio77_pgg0_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio80_pff6_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio82_pee3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio83_pee5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio84_pgg1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio85_pgg6_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio86_phh3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_cts_pgg5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_rts_pgg4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_rx_pgg3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_tx_pgg2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_cts_phh2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_rts_phh1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_rx_phh0_pins-defined-but-not-used
|   `-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_tx_pgg7_pins-defined-but-not-used
|-- i386-allyesconfig
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio49_pee2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio50_pee4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio69_pff0_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio70_pff1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio71_pff2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio72_pff3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio73_pff4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio74_pff5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio76_pff7_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio77_pgg0_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio80_pff6_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio82_pee3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio83_pee5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio84_pgg1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio85_pgg6_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio86_phh3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_cts_pgg5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_rts_pgg4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_rx_pgg3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_tx_pgg2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_cts_phh2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_rts_phh1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_rx_phh0_pins-defined-but-not-used
|   `-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_tx_pgg7_pins-defined-but-not-used
|-- m68k-allmodconfig
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio49_pee2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio50_pee4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio69_pff0_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio70_pff1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio71_pff2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio72_pff3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio73_pff4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio74_pff5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio76_pff7_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio77_pgg0_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio80_pff6_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio82_pee3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio83_pee5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio84_pgg1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio85_pgg6_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio86_phh3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_cts_pgg5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_rts_pgg4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_rx_pgg3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_tx_pgg2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_cts_phh2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_rts_phh1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_rx_phh0_pins-defined-but-not-used
|   `-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_tx_pgg7_pins-defined-but-not-used
|-- m68k-allyesconfig
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio49_pee2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio50_pee4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio69_pff0_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio70_pff1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio71_pff2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio72_pff3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio73_pff4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio74_pff5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio76_pff7_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio77_pgg0_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio80_pff6_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio82_pee3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio83_pee5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio84_pgg1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio85_pgg6_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio86_phh3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_cts_pgg5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_rts_pgg4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_rx_pgg3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_tx_pgg2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_cts_phh2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_rts_phh1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_rx_phh0_pins-defined-but-not-used
|   `-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_tx_pgg7_pins-defined-but-not-used
|-- microblaze-allyesconfig
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio49_pee2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio50_pee4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio69_pff0_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio70_pff1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio71_pff2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio72_pff3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio73_pff4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio74_pff5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio76_pff7_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio77_pgg0_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio80_pff6_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio82_pee3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio83_pee5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio84_pgg1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio85_pgg6_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio86_phh3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_cts_pgg5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_rts_pgg4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_rx_pgg3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_tx_pgg2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_cts_phh2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_rts_phh1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_rx_phh0_pins-defined-but-not-used
|   `-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_tx_pgg7_pins-defined-but-not-used
|-- mips-allmodconfig
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio49_pee2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio50_pee4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio69_pff0_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio70_pff1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio71_pff2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio72_pff3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio73_pff4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio74_pff5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio76_pff7_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio77_pgg0_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio80_pff6_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio82_pee3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio83_pee5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio84_pgg1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio85_pgg6_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio86_phh3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_cts_pgg5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_rts_pgg4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_rx_pgg3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_tx_pgg2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_cts_phh2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_rts_phh1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_rx_phh0_pins-defined-but-not-used
|   `-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_tx_pgg7_pins-defined-but-not-used
|-- mips-allyesconfig
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio49_pee2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio50_pee4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio69_pff0_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio70_pff1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio71_pff2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio72_pff3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio73_pff4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio74_pff5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio76_pff7_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio77_pgg0_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio80_pff6_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio82_pee3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio83_pee5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio84_pgg1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio85_pgg6_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio86_phh3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_cts_pgg5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_rts_pgg4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_rx_pgg3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_tx_pgg2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_cts_phh2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_rts_phh1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_rx_phh0_pins-defined-but-not-used
|   `-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_tx_pgg7_pins-defined-but-not-used
|-- nios2-allmodconfig
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio49_pee2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio50_pee4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio69_pff0_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio70_pff1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio71_pff2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio72_pff3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio73_pff4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio74_pff5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio76_pff7_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio77_pgg0_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio80_pff6_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio82_pee3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio83_pee5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio84_pgg1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio85_pgg6_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio86_phh3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_cts_pgg5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_rts_pgg4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_rx_pgg3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_tx_pgg2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_cts_phh2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_rts_phh1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_rx_phh0_pins-defined-but-not-used
|   `-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_tx_pgg7_pins-defined-but-not-used
|-- nios2-randconfig-r051-20260529
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio49_pee2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio50_pee4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio69_pff0_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio70_pff1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio71_pff2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio72_pff3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio73_pff4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio74_pff5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio76_pff7_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio77_pgg0_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio80_pff6_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio82_pee3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio83_pee5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio84_pgg1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio85_pgg6_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio86_phh3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_cts_pgg5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_rts_pgg4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_rx_pgg3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_tx_pgg2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_cts_phh2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_rts_phh1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_rx_phh0_pins-defined-but-not-used
|   `-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_tx_pgg7_pins-defined-but-not-used
|-- openrisc-allmodconfig
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio49_pee2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio50_pee4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio69_pff0_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio70_pff1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio71_pff2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio72_pff3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio73_pff4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio74_pff5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio76_pff7_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio77_pgg0_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio80_pff6_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio82_pee3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio83_pee5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio84_pgg1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio85_pgg6_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio86_phh3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_cts_pgg5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_rts_pgg4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_rx_pgg3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_tx_pgg2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_cts_phh2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_rts_phh1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_rx_phh0_pins-defined-but-not-used
|   `-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_tx_pgg7_pins-defined-but-not-used
|-- parisc-allmodconfig
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio49_pee2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio50_pee4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio69_pff0_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio70_pff1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio71_pff2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio72_pff3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio73_pff4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio74_pff5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio76_pff7_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio77_pgg0_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio80_pff6_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio82_pee3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio83_pee5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio84_pgg1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio85_pgg6_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio86_phh3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_cts_pgg5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_rts_pgg4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_rx_pgg3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_tx_pgg2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_cts_phh2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_rts_phh1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_rx_phh0_pins-defined-but-not-used
|   `-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_tx_pgg7_pins-defined-but-not-used
|-- parisc-allyesconfig
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio49_pee2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio50_pee4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio69_pff0_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio70_pff1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio71_pff2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio72_pff3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio73_pff4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio74_pff5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio76_pff7_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio77_pgg0_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio80_pff6_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio82_pee3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio83_pee5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio84_pgg1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio85_pgg6_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio86_phh3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_cts_pgg5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_rts_pgg4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_rx_pgg3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_tx_pgg2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_cts_phh2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_rts_phh1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_rx_phh0_pins-defined-but-not-used
|   `-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_tx_pgg7_pins-defined-but-not-used
|-- powerpc-allmodconfig
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio49_pee2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio50_pee4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio69_pff0_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio70_pff1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio71_pff2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio72_pff3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio73_pff4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio74_pff5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio76_pff7_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio77_pgg0_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio80_pff6_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio82_pee3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio83_pee5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio84_pgg1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio85_pgg6_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio86_phh3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_cts_pgg5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_rts_pgg4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_rx_pgg3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_tx_pgg2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_cts_phh2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_rts_phh1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_rx_phh0_pins-defined-but-not-used
|   `-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_tx_pgg7_pins-defined-but-not-used
|-- riscv-allyesconfig
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio49_pee2_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio50_pee4_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio69_pff0_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio70_pff1_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio71_pff2_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio72_pff3_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio73_pff4_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio74_pff5_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio76_pff7_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio77_pgg0_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio80_pff6_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio82_pee3_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio83_pee5_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio84_pgg1_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio85_pgg6_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio86_phh3_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-uart2_cts_pgg5_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-uart2_rts_pgg4_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-uart2_rx_pgg3_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-uart2_tx_pgg2_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-uart5_cts_phh2_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-uart5_rts_phh1_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-uart5_rx_phh0_pins
|   `-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-uart5_tx_pgg7_pins
|-- s390-allmodconfig
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio49_pee2_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio50_pee4_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio69_pff0_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio70_pff1_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio71_pff2_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio72_pff3_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio73_pff4_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio74_pff5_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio76_pff7_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio77_pgg0_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio80_pff6_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio82_pee3_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio83_pee5_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio84_pgg1_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio85_pgg6_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio86_phh3_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-uart2_cts_pgg5_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-uart2_rts_pgg4_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-uart2_rx_pgg3_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-uart2_tx_pgg2_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-uart5_cts_phh2_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-uart5_rts_phh1_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-uart5_rx_phh0_pins
|   `-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-uart5_tx_pgg7_pins
|-- s390-allyesconfig
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio49_pee2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio50_pee4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio69_pff0_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio70_pff1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio71_pff2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio72_pff3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio73_pff4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio74_pff5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio76_pff7_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio77_pgg0_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio80_pff6_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio82_pee3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio83_pee5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio84_pgg1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio85_pgg6_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio86_phh3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_cts_pgg5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_rts_pgg4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_rx_pgg3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_tx_pgg2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_cts_phh2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_rts_phh1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_rx_phh0_pins-defined-but-not-used
|   `-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_tx_pgg7_pins-defined-but-not-used
|-- sh-allmodconfig
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio49_pee2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio50_pee4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio69_pff0_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio70_pff1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio71_pff2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio72_pff3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio73_pff4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio74_pff5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio76_pff7_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio77_pgg0_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio80_pff6_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio82_pee3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio83_pee5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio84_pgg1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio85_pgg6_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio86_phh3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_cts_pgg5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_rts_pgg4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_rx_pgg3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_tx_pgg2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_cts_phh2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_rts_phh1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_rx_phh0_pins-defined-but-not-used
|   `-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_tx_pgg7_pins-defined-but-not-used
|-- sh-allyesconfig
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio49_pee2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio50_pee4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio69_pff0_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio70_pff1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio71_pff2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio72_pff3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio73_pff4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio74_pff5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio76_pff7_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio77_pgg0_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio80_pff6_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio82_pee3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio83_pee5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio84_pgg1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio85_pgg6_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio86_phh3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_cts_pgg5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_rts_pgg4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_rx_pgg3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_tx_pgg2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_cts_phh2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_rts_phh1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_rx_phh0_pins-defined-but-not-used
|   `-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_tx_pgg7_pins-defined-but-not-used
|-- sparc64-allmodconfig
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio49_pee2_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio50_pee4_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio69_pff0_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio70_pff1_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio71_pff2_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio72_pff3_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio73_pff4_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio74_pff5_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio76_pff7_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio77_pgg0_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio80_pff6_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio82_pee3_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio83_pee5_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio84_pgg1_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio85_pgg6_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio86_phh3_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-uart2_cts_pgg5_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-uart2_rts_pgg4_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-uart2_rx_pgg3_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-uart2_tx_pgg2_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-uart5_cts_phh2_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-uart5_rts_phh1_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-uart5_rx_phh0_pins
|   `-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-uart5_tx_pgg7_pins
|-- um-allmodconfig
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio49_pee2_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio50_pee4_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio69_pff0_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio70_pff1_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio71_pff2_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio72_pff3_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio73_pff4_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio74_pff5_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio76_pff7_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio77_pgg0_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio80_pff6_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio82_pee3_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio83_pee5_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio84_pgg1_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio85_pgg6_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio86_phh3_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-uart2_cts_pgg5_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-uart2_rts_pgg4_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-uart2_rx_pgg3_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-uart2_tx_pgg2_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-uart5_cts_phh2_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-uart5_rts_phh1_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-uart5_rx_phh0_pins
|   `-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-uart5_tx_pgg7_pins
|-- um-allyesconfig
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio49_pee2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio50_pee4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio69_pff0_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio70_pff1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio71_pff2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio72_pff3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio73_pff4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio74_pff5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio76_pff7_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio77_pgg0_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio80_pff6_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio82_pee3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio83_pee5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio84_pgg1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio85_pgg6_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio86_phh3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_cts_pgg5_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_rts_pgg4_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_rx_pgg3_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_tx_pgg2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_cts_phh2_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_rts_phh1_pins-defined-but-not-used
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_rx_phh0_pins-defined-but-not-used
|   `-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_tx_pgg7_pins-defined-but-not-used
|-- x86_64-allmodconfig
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio49_pee2_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio50_pee4_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio69_pff0_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio70_pff1_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio71_pff2_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio72_pff3_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio73_pff4_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio74_pff5_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio76_pff7_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio77_pgg0_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio80_pff6_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio82_pee3_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio83_pee5_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio84_pgg1_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio85_pgg6_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio86_phh3_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-uart2_cts_pgg5_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-uart2_rts_pgg4_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-uart2_rx_pgg3_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-uart2_tx_pgg2_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-uart5_cts_phh2_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-uart5_rts_phh1_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-uart5_rx_phh0_pins
|   `-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-uart5_tx_pgg7_pins
|-- x86_64-allyesconfig
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio49_pee2_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio50_pee4_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio69_pff0_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio70_pff1_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio71_pff2_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio72_pff3_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio73_pff4_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio74_pff5_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio76_pff7_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio77_pgg0_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio80_pff6_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio82_pee3_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio83_pee5_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio84_pgg1_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio85_pgg6_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-soc_gpio86_phh3_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-uart2_cts_pgg5_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-uart2_rts_pgg4_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-uart2_rx_pgg3_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-uart2_tx_pgg2_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-uart5_cts_phh2_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-uart5_rts_phh1_pins
|   |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-uart5_rx_phh0_pins
|   `-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:unused-variable-uart5_tx_pgg7_pins
`-- xtensa-allyesconfig
    |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio49_pee2_pins-defined-but-not-used
    |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio50_pee4_pins-defined-but-not-used
    |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio69_pff0_pins-defined-but-not-used
    |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio70_pff1_pins-defined-but-not-used
    |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio71_pff2_pins-defined-but-not-used
    |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio72_pff3_pins-defined-but-not-used
    |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio73_pff4_pins-defined-but-not-used
    |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio74_pff5_pins-defined-but-not-used
    |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio76_pff7_pins-defined-but-not-used
    |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio77_pgg0_pins-defined-but-not-used
    |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio80_pff6_pins-defined-but-not-used
    |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio82_pee3_pins-defined-but-not-used
    |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio83_pee5_pins-defined-but-not-used
    |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio84_pgg1_pins-defined-but-not-used
    |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio85_pgg6_pins-defined-but-not-used
    |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:soc_gpio86_phh3_pins-defined-but-not-used
    |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_cts_pgg5_pins-defined-but-not-used
    |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_rts_pgg4_pins-defined-but-not-used
    |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_rx_pgg3_pins-defined-but-not-used
    |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart2_tx_pgg2_pins-defined-but-not-used
    |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_cts_phh2_pins-defined-but-not-used
    |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_rts_phh1_pins-defined-but-not-used
    |-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_rx_phh0_pins-defined-but-not-used
    `-- drivers-pinctrl-tegra-pinctrl-tegra238.c:warning:uart5_tx_pgg7_pins-defined-but-not-used

elapsed time: 2469m

configs tested: 252
configs skipped: 6

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260529    clang-23
arc                   randconfig-001-20260529    gcc-14.3.0
arc                   randconfig-002-20260529    clang-23
arc                   randconfig-002-20260529    gcc-10.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260529    clang-23
arm                   randconfig-001-20260529    gcc-14.3.0
arm                   randconfig-002-20260529    clang-23
arm                   randconfig-002-20260529    gcc-8.5.0
arm                   randconfig-003-20260529    clang-23
arm                   randconfig-003-20260529    gcc-13.4.0
arm                   randconfig-004-20260529    clang-23
arm                           spitz_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260529    clang-23
arm64                 randconfig-001-20260529    gcc-8.5.0
arm64                 randconfig-002-20260529    clang-23
arm64                 randconfig-003-20260529    clang-23
arm64                 randconfig-004-20260529    clang-23
arm64                 randconfig-004-20260529    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260529    clang-23
csky                  randconfig-001-20260529    gcc-15.2.0
csky                  randconfig-002-20260529    clang-23
csky                  randconfig-002-20260529    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260529    clang-23
hexagon               randconfig-001-20260529    gcc-8.5.0
hexagon               randconfig-002-20260529    clang-23
hexagon               randconfig-002-20260529    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260529    gcc-12
i386        buildonly-randconfig-002-20260529    clang-20
i386        buildonly-randconfig-002-20260529    gcc-12
i386        buildonly-randconfig-003-20260529    gcc-12
i386        buildonly-randconfig-004-20260529    gcc-12
i386        buildonly-randconfig-004-20260529    gcc-14
i386        buildonly-randconfig-005-20260529    gcc-12
i386        buildonly-randconfig-005-20260529    gcc-14
i386        buildonly-randconfig-006-20260529    gcc-12
i386        buildonly-randconfig-006-20260529    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260529    gcc-14
i386                  randconfig-002-20260529    gcc-12
i386                  randconfig-002-20260529    gcc-14
i386                  randconfig-003-20260529    clang-20
i386                  randconfig-003-20260529    gcc-14
i386                  randconfig-004-20260529    clang-20
i386                  randconfig-004-20260529    gcc-14
i386                  randconfig-005-20260529    gcc-14
i386                  randconfig-006-20260529    clang-20
i386                  randconfig-006-20260529    gcc-14
i386                  randconfig-007-20260529    gcc-12
i386                  randconfig-007-20260529    gcc-14
i386                  randconfig-011-20260529    clang-20
i386                  randconfig-011-20260529    gcc-14
i386                  randconfig-012-20260529    clang-20
i386                  randconfig-012-20260529    gcc-14
i386                  randconfig-013-20260529    clang-20
i386                  randconfig-013-20260529    gcc-14
i386                  randconfig-014-20260529    clang-20
i386                  randconfig-014-20260529    gcc-14
i386                  randconfig-015-20260529    gcc-14
i386                  randconfig-016-20260529    clang-20
i386                  randconfig-016-20260529    gcc-14
i386                  randconfig-017-20260529    gcc-13
i386                  randconfig-017-20260529    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260529    gcc-15.2.0
loongarch             randconfig-001-20260529    gcc-8.5.0
loongarch             randconfig-002-20260529    gcc-15.2.0
loongarch             randconfig-002-20260529    gcc-8.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                                defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
microblaze                          defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            alldefconfig    gcc-11.5.0
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260529    gcc-8.5.0
nios2                 randconfig-002-20260529    gcc-8.5.0
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260529    clang-19
parisc                randconfig-001-20260529    gcc-8.5.0
parisc                randconfig-002-20260529    clang-19
parisc                randconfig-002-20260529    gcc-8.5.0
parisc64                            defconfig    clang-19
parisc64                            defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260529    clang-19
powerpc               randconfig-001-20260529    gcc-12.5.0
powerpc               randconfig-002-20260529    clang-19
powerpc64             randconfig-001-20260529    clang-19
powerpc64             randconfig-001-20260529    gcc-15.2.0
powerpc64             randconfig-002-20260529    clang-19
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-23
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260529    gcc-15.2.0
riscv                 randconfig-001-20260529    gcc-8.5.0
riscv                 randconfig-002-20260529    gcc-15.2.0
riscv                 randconfig-002-20260529    gcc-9.5.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-23
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260529    gcc-15.2.0
s390                  randconfig-001-20260529    gcc-8.5.0
s390                  randconfig-002-20260529    clang-23
s390                  randconfig-002-20260529    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-15.2.0
sh                    randconfig-001-20260529    gcc-15.2.0
sh                    randconfig-002-20260529    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260529    gcc-8.5.0
sparc                 randconfig-002-20260529    gcc-15.2.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260529    gcc-11.5.0
sparc64               randconfig-002-20260529    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    clang-23
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260529    gcc-14
um                    randconfig-002-20260529    gcc-14
um                           x86_64_defconfig    clang-23
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260529    gcc-14
x86_64      buildonly-randconfig-002-20260529    gcc-14
x86_64      buildonly-randconfig-003-20260529    gcc-14
x86_64      buildonly-randconfig-004-20260529    clang-20
x86_64      buildonly-randconfig-004-20260529    gcc-14
x86_64      buildonly-randconfig-005-20260529    clang-20
x86_64      buildonly-randconfig-005-20260529    gcc-14
x86_64      buildonly-randconfig-006-20260529    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                         randconfig-001    gcc-14
x86_64                randconfig-001-20260529    clang-20
x86_64                randconfig-001-20260529    gcc-14
x86_64                         randconfig-002    gcc-14
x86_64                randconfig-002-20260529    clang-20
x86_64                         randconfig-003    clang-20
x86_64                randconfig-003-20260529    clang-20
x86_64                randconfig-003-20260529    gcc-14
x86_64                         randconfig-004    clang-20
x86_64                randconfig-004-20260529    clang-20
x86_64                         randconfig-005    gcc-14
x86_64                randconfig-005-20260529    clang-20
x86_64                         randconfig-006    clang-20
x86_64                randconfig-006-20260529    clang-20
x86_64                randconfig-011-20260529    clang-20
x86_64                randconfig-011-20260529    gcc-14
x86_64                randconfig-012-20260529    clang-20
x86_64                randconfig-012-20260529    gcc-14
x86_64                randconfig-013-20260529    clang-20
x86_64                randconfig-014-20260529    clang-20
x86_64                randconfig-015-20260529    clang-20
x86_64                randconfig-015-20260529    gcc-14
x86_64                randconfig-016-20260529    clang-20
x86_64                randconfig-071-20260529    clang-20
x86_64                randconfig-071-20260529    gcc-14
x86_64                randconfig-072-20260529    clang-20
x86_64                randconfig-073-20260529    clang-20
x86_64                randconfig-074-20260529    clang-20
x86_64                randconfig-074-20260529    gcc-14
x86_64                randconfig-075-20260529    clang-20
x86_64                randconfig-075-20260529    gcc-14
x86_64                randconfig-076-20260529    clang-20
x86_64                randconfig-076-20260529    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260529    gcc-11.5.0
xtensa                randconfig-002-20260529    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

