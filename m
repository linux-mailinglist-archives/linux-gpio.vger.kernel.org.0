Return-Path: <linux-gpio+bounces-36266-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8IlzHEQB+2kbVQMAu9opvQ
	(envelope-from <linux-gpio+bounces-36266-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 10:52:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9F54D81F2
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 10:52:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9812C30861E0
	for <lists+linux-gpio@lfdr.de>; Wed,  6 May 2026 08:47:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 207D238735A;
	Wed,  6 May 2026 08:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k9gmSTpz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7410F355049
	for <linux-gpio@vger.kernel.org>; Wed,  6 May 2026 08:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778057248; cv=none; b=mBBIs2yvxpsDMsBXPKgjgEirrxE6DPyrlh5uJ2IMFJsV9m1gEbsZkRp5z2SBcbm6z6R/Ow480DWlJVCqupYDdJZ1HX262IExYazYpfmsUReL2yUDzw4g4wK2/fqas9TcXeuJkm7Oo1ZxmksOGS3uFmVILA+gCxIb7hxQtNCM8zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778057248; c=relaxed/simple;
	bh=wBjTmVoZj6LeWFYADoLEyqRb76qAFRCDjeAhjHxofwc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=B+ccxVwdLOctzaY+VNucvyc6a0Z3wSAhgANpCQv4gyOWv0iipPWjwx3fZ0GkSZ4/0jR3ku39aS58/3z7BX5L0El4fpCM8OWKZrVoyXWsYy80LLHQaGdkxE40qMWPktao5uJBo0w8Xi8A89hpyqkeUlB/lJ/xtmfTwnasF2saOKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k9gmSTpz; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778057247; x=1809593247;
  h=date:from:to:cc:subject:message-id;
  bh=wBjTmVoZj6LeWFYADoLEyqRb76qAFRCDjeAhjHxofwc=;
  b=k9gmSTpz3GO1U/swPEFlqOG4BTRZ1hIazsfu2dUhZ77ACbD87I8kDHZ7
   xPUmtSjD59Ii/e2kQmtILUaSNypst0xYeCf1H6FWMDZVcvL4V68EkvceZ
   NRuXXDSq4vM6R2tvhEGqjVRXQGygrDnTG+35FzXE6h0679ditdjx0cGo2
   r1cNtWgiPl2rdCNBPxidV0yvtuYIAy6+54l+FhUd5xn/yJqmCGL7kiioS
   Am5GCk1MOmDn6b7zUPkcBWBEEtTrvuaJ/JxGsKL7HFRQQTolHo6xHUnjr
   egIxc0zYaJWn4AuY+X21bJRgRwP1Kd1T0gWyIhxg9rL3Hrvl75Slzklh0
   A==;
X-CSE-ConnectionGUID: heEwHOE2T3CuI+IBd7xGUg==
X-CSE-MsgGUID: xVoHvPgjRsqfq0vlgBitKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78130148"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="78130148"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 01:47:27 -0700
X-CSE-ConnectionGUID: mNyXde+zSqSH4x3akhqDkg==
X-CSE-MsgGUID: 2DLCifDnRZG44lyEI3DFNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="232982929"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 06 May 2026 01:47:24 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKXub-000000000pd-3rbY;
	Wed, 06 May 2026 08:47:21 +0000
Date: Wed, 06 May 2026 16:46:58 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
 Linus Walleij <linusw@kernel.org>,
 Shawn Guo <shengchao.guo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Maulik Shah <maulik.shah@oss.qualcomm.com>,
 Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Subject: [linusw-pinctrl:devel 20/35]
 drivers/pinctrl/qcom/pinctrl-nord.c:1420:9: sparse: sparse: Initializer entry
 defined twice
Message-ID: <202605061633.BJLI5voT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: CA9F54D81F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36266-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,01.org:url]

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
head:   590bb3b76d18487f884e0915efedbd6e80250bb1
commit: c24dd0826f064d6b99a74ca0e004a4cda6677b9f [20/35] pinctrl: qcom: add the TLMM driver for the Nord platforms
config: loongarch-randconfig-r134-20260505 (https://download.01.org/0day-ci/archive/20260506/202605061633.BJLI5voT-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260506/202605061633.BJLI5voT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605061633.BJLI5voT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pinctrl/qcom/pinctrl-nord.c:1420:9: sparse: sparse: Initializer entry defined twice
   drivers/pinctrl/qcom/pinctrl-nord.c:1422:9: sparse:   also defined here

vim +1420 drivers/pinctrl/qcom/pinctrl-nord.c

  1309	
  1310	static const struct pinfunction nord_functions[] = {
  1311		MSM_GPIO_PIN_FUNCTION(gpio),
  1312		MSM_PIN_FUNCTION(aoss_cti),
  1313		MSM_PIN_FUNCTION(atest_char),
  1314		MSM_PIN_FUNCTION(atest_usb20),
  1315		MSM_PIN_FUNCTION(atest_usb21),
  1316		MSM_PIN_FUNCTION(aud_intfc0_clk),
  1317		MSM_PIN_FUNCTION(aud_intfc0_data),
  1318		MSM_PIN_FUNCTION(aud_intfc0_ws),
  1319		MSM_PIN_FUNCTION(aud_intfc10_clk),
  1320		MSM_PIN_FUNCTION(aud_intfc10_data),
  1321		MSM_PIN_FUNCTION(aud_intfc10_ws),
  1322		MSM_PIN_FUNCTION(aud_intfc1_clk),
  1323		MSM_PIN_FUNCTION(aud_intfc1_data),
  1324		MSM_PIN_FUNCTION(aud_intfc1_ws),
  1325		MSM_PIN_FUNCTION(aud_intfc2_clk),
  1326		MSM_PIN_FUNCTION(aud_intfc2_data),
  1327		MSM_PIN_FUNCTION(aud_intfc2_ws),
  1328		MSM_PIN_FUNCTION(aud_intfc3_clk),
  1329		MSM_PIN_FUNCTION(aud_intfc3_data),
  1330		MSM_PIN_FUNCTION(aud_intfc3_ws),
  1331		MSM_PIN_FUNCTION(aud_intfc4_clk),
  1332		MSM_PIN_FUNCTION(aud_intfc4_data),
  1333		MSM_PIN_FUNCTION(aud_intfc4_ws),
  1334		MSM_PIN_FUNCTION(aud_intfc5_clk),
  1335		MSM_PIN_FUNCTION(aud_intfc5_data),
  1336		MSM_PIN_FUNCTION(aud_intfc5_ws),
  1337		MSM_PIN_FUNCTION(aud_intfc6_clk),
  1338		MSM_PIN_FUNCTION(aud_intfc6_data),
  1339		MSM_PIN_FUNCTION(aud_intfc6_ws),
  1340		MSM_PIN_FUNCTION(aud_intfc7_clk),
  1341		MSM_PIN_FUNCTION(aud_intfc7_data),
  1342		MSM_PIN_FUNCTION(aud_intfc7_ws),
  1343		MSM_PIN_FUNCTION(aud_intfc8_clk),
  1344		MSM_PIN_FUNCTION(aud_intfc8_data),
  1345		MSM_PIN_FUNCTION(aud_intfc8_ws),
  1346		MSM_PIN_FUNCTION(aud_intfc9_clk),
  1347		MSM_PIN_FUNCTION(aud_intfc9_data),
  1348		MSM_PIN_FUNCTION(aud_intfc9_ws),
  1349		MSM_PIN_FUNCTION(aud_mclk0_mira),
  1350		MSM_PIN_FUNCTION(aud_mclk0_mirb),
  1351		MSM_PIN_FUNCTION(aud_mclk1_mira),
  1352		MSM_PIN_FUNCTION(aud_mclk1_mirb),
  1353		MSM_PIN_FUNCTION(aud_mclk2_mira),
  1354		MSM_PIN_FUNCTION(aud_mclk2_mirb),
  1355		MSM_PIN_FUNCTION(aud_refclk0),
  1356		MSM_PIN_FUNCTION(aud_refclk1),
  1357		MSM_PIN_FUNCTION(bist_done),
  1358		MSM_PIN_FUNCTION(ccu_async_in),
  1359		MSM_PIN_FUNCTION(ccu_i2c_scl),
  1360		MSM_PIN_FUNCTION(ccu_i2c_sda),
  1361		MSM_PIN_FUNCTION(ccu_timer),
  1362		MSM_PIN_FUNCTION(clink_debug),
  1363		MSM_PIN_FUNCTION(dbg_out),
  1364		MSM_PIN_FUNCTION(dbg_out_clk),
  1365		MSM_PIN_FUNCTION(ddr_bist_complete),
  1366		MSM_PIN_FUNCTION(ddr_bist_fail),
  1367		MSM_PIN_FUNCTION(ddr_bist_start),
  1368		MSM_PIN_FUNCTION(ddr_bist_stop),
  1369		MSM_PIN_FUNCTION(ddr_pxi),
  1370		MSM_PIN_FUNCTION(dp_rx0),
  1371		MSM_PIN_FUNCTION(dp_rx00),
  1372		MSM_PIN_FUNCTION(dp_rx01),
  1373		MSM_PIN_FUNCTION(dp_rx0_mute),
  1374		MSM_PIN_FUNCTION(dp_rx1),
  1375		MSM_PIN_FUNCTION(dp_rx10),
  1376		MSM_PIN_FUNCTION(dp_rx11),
  1377		MSM_PIN_FUNCTION(dp_rx1_mute),
  1378		MSM_PIN_FUNCTION(edp0_hot),
  1379		MSM_PIN_FUNCTION(edp0_lcd),
  1380		MSM_PIN_FUNCTION(edp1_hot),
  1381		MSM_PIN_FUNCTION(edp1_lcd),
  1382		MSM_PIN_FUNCTION(edp2_hot),
  1383		MSM_PIN_FUNCTION(edp2_lcd),
  1384		MSM_PIN_FUNCTION(edp3_hot),
  1385		MSM_PIN_FUNCTION(edp3_lcd),
  1386		MSM_PIN_FUNCTION(emac0_mcg),
  1387		MSM_PIN_FUNCTION(emac0_mdc),
  1388		MSM_PIN_FUNCTION(emac0_mdio),
  1389		MSM_PIN_FUNCTION(emac0_ptp),
  1390		MSM_PIN_FUNCTION(emac1_mcg),
  1391		MSM_PIN_FUNCTION(emac1_mdc),
  1392		MSM_PIN_FUNCTION(emac1_mdio),
  1393		MSM_PIN_FUNCTION(emac1_ptp),
  1394		MSM_PIN_FUNCTION(gcc_gp1_clk),
  1395		MSM_PIN_FUNCTION(gcc_gp2_clk),
  1396		MSM_PIN_FUNCTION(gcc_gp3_clk),
  1397		MSM_PIN_FUNCTION(gcc_gp4_clk),
  1398		MSM_PIN_FUNCTION(gcc_gp5_clk),
  1399		MSM_PIN_FUNCTION(gcc_gp6_clk),
  1400		MSM_PIN_FUNCTION(gcc_gp7_clk),
  1401		MSM_PIN_FUNCTION(gcc_gp8_clk),
  1402		MSM_PIN_FUNCTION(jitter_bist),
  1403		MSM_PIN_FUNCTION(lbist_pass),
  1404		MSM_PIN_FUNCTION(mbist_pass),
  1405		MSM_PIN_FUNCTION(mdp0_vsync_out),
  1406		MSM_PIN_FUNCTION(mdp1_vsync_out),
  1407		MSM_PIN_FUNCTION(mdp_vsync_e),
  1408		MSM_PIN_FUNCTION(mdp_vsync_p),
  1409		MSM_PIN_FUNCTION(mdp_vsync_s),
  1410		MSM_PIN_FUNCTION(pcie0_clk_req_n),
  1411		MSM_PIN_FUNCTION(pcie1_clk_req_n),
  1412		MSM_PIN_FUNCTION(pcie2_clk_req_n),
  1413		MSM_PIN_FUNCTION(pcie3_clk_req_n),
  1414		MSM_PIN_FUNCTION(phase_flag),
  1415		MSM_PIN_FUNCTION(pll_bist_sync),
  1416		MSM_PIN_FUNCTION(pll_clk_aux),
  1417		MSM_PIN_FUNCTION(prng_rosc0),
  1418		MSM_PIN_FUNCTION(prng_rosc1),
  1419		MSM_PIN_FUNCTION(pwrbrk_i_n),
> 1420		MSM_PIN_FUNCTION(qdss_cti),
  1421		MSM_PIN_FUNCTION(qdss),
  1422		MSM_PIN_FUNCTION(qdss_cti),
  1423		MSM_PIN_FUNCTION(qspi),
  1424		MSM_PIN_FUNCTION(qup0_se0),
  1425		MSM_PIN_FUNCTION(qup0_se1),
  1426		MSM_PIN_FUNCTION(qup0_se2),
  1427		MSM_PIN_FUNCTION(qup0_se3),
  1428		MSM_PIN_FUNCTION(qup0_se4),
  1429		MSM_PIN_FUNCTION(qup0_se5),
  1430		MSM_PIN_FUNCTION(qup1_se0),
  1431		MSM_PIN_FUNCTION(qup1_se1),
  1432		MSM_PIN_FUNCTION(qup1_se2),
  1433		MSM_PIN_FUNCTION(qup1_se3),
  1434		MSM_PIN_FUNCTION(qup1_se4),
  1435		MSM_PIN_FUNCTION(qup1_se5),
  1436		MSM_PIN_FUNCTION(qup1_se6),
  1437		MSM_PIN_FUNCTION(qup2_se0),
  1438		MSM_PIN_FUNCTION(qup2_se1),
  1439		MSM_PIN_FUNCTION(qup2_se2),
  1440		MSM_PIN_FUNCTION(qup2_se3),
  1441		MSM_PIN_FUNCTION(qup2_se4),
  1442		MSM_PIN_FUNCTION(qup2_se5),
  1443		MSM_PIN_FUNCTION(qup2_se6),
  1444		MSM_PIN_FUNCTION(qup3_se0_mira),
  1445		MSM_PIN_FUNCTION(qup3_se0_mirb),
  1446		MSM_PIN_FUNCTION(sailss_ospi),
  1447		MSM_PIN_FUNCTION(sdc4_clk),
  1448		MSM_PIN_FUNCTION(sdc4_cmd),
  1449		MSM_PIN_FUNCTION(sdc4_data),
  1450		MSM_PIN_FUNCTION(smb_alert),
  1451		MSM_PIN_FUNCTION(smb_alert_n),
  1452		MSM_PIN_FUNCTION(smb_clk),
  1453		MSM_PIN_FUNCTION(smb_dat),
  1454		MSM_PIN_FUNCTION(tb_trig_sdc4),
  1455		MSM_PIN_FUNCTION(tmess_prng0),
  1456		MSM_PIN_FUNCTION(tmess_prng1),
  1457		MSM_PIN_FUNCTION(tsc_timer),
  1458		MSM_PIN_FUNCTION(tsense_pwm),
  1459		MSM_PIN_FUNCTION(usb0_hs),
  1460		MSM_PIN_FUNCTION(usb0_phy_ps),
  1461		MSM_PIN_FUNCTION(usb1_hs),
  1462		MSM_PIN_FUNCTION(usb1_phy_ps),
  1463		MSM_PIN_FUNCTION(usb2_hs),
  1464		MSM_PIN_FUNCTION(usxgmii0_phy),
  1465		MSM_PIN_FUNCTION(usxgmii1_phy),
  1466		MSM_PIN_FUNCTION(vsense_trigger_mirnat),
  1467		MSM_PIN_FUNCTION(wcn_sw),
  1468		MSM_PIN_FUNCTION(wcn_sw_ctrl),
  1469	};
  1470	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

