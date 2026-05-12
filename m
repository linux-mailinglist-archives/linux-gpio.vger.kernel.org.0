Return-Path: <linux-gpio+bounces-36679-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAp+JNE/A2ro2AEAu9opvQ
	(envelope-from <linux-gpio+bounces-36679-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 16:57:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 151AA523183
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 16:57:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F1BF93087CDF
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 14:48:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8557F346FA8;
	Tue, 12 May 2026 14:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="G1Y0yjfp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011022.outbound.protection.outlook.com [40.107.130.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9313434750D;
	Tue, 12 May 2026 14:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778597311; cv=fail; b=KWUuYruvVZTMzoTO7DIS/zUPa2KUksYP78KAPb9J+6P468earU69fDYZHxjlstqXFh8TRsGw6ZODw5W7A+NGy7mERTirU0/bW6EzDLteHciWkJEkPN7vdlQFZ5pxkbj7CtEeIlkkmR7tl5qwuhztiWqY4+EnE0BMeWYqpXmslS4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778597311; c=relaxed/simple;
	bh=2e6/LjkOdvxk4UpTbkNZ/PRTSVW3XhCbxtJtWjP0q8c=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=hqkehlU2DZ824DwRQ1wmFNpMNS7m7uDNo0ZiJaO07qbqsaWnwuSt8CiDcgX4N2PVfw9uSwV4pd22h4IkggtIx7W1IDJOcGSwThF0mRkeHgujHcNmlfeAAHEWfo/tDxWj59SAduACJPA5R7N9Ky2QAridYNLRnJvyANhWjGdcKGE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=G1Y0yjfp; arc=fail smtp.client-ip=40.107.130.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NYd71W3B+4YyhEleE1hRa/BKx86s6uQ57h3UivgcDf+CBzIPniRPZXmDLSXZGWEdoYcePiGXtJpOzmzEP+tmF7aFK5vOvr3QHzh89hMcoFgNM23HagiO5K027E6ntDLyX2YqTmRrDlrS7tmcy/d3DVrVE8hp/VbsNM3u/irptMzZhr8D2n4+vMa7lasrabwrB8G+Vtr03exwkKhMNgspYuGBxM4H1/sMuJRiaRN2PmCJE4ZLXHDrphVf78hVNbDSZ/kaPoeDgncYAvrF6Ge7VXJIqcEVuObIn8viGoXGrYOqZKCCsCPKBbJpKLuL8WgBxFq5G8XEWvTcqDjZfDzsmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fd8WhdpCx7eQ8qzquudKo6XjDgmaDQd7jtMdGzQ+wYc=;
 b=SPsphCNY8WjPE2iQ25DOg9SXilcjPB/Eqkv7PN6xAfoZFJaoMjDgX43PWqTsLxv5NU/TzWCZ0AxhfgYkg1mkArDvFEv2uoUG8yUuhGgQB+gBaJuEmjos3yMai/RoLusPmiboK0E5n8N4xrH0lCXXgkuWStEKWTGeEa4coAImSHc2anh8J0X/TcEpw1hLpwDg3TVF+uZ32gK2FEopyBGkqfAL5kn+kqo/RIDR0M/MsdkDeJHOqa3WWehqtLcFFFXXsvk57kuBdkfCKveg9qKeL+h/5Qmr2cIC7NW8BvoVJnjjjLwsKe4dWna9p3nzkMziSxDbcMhOLyQOd5OadmIh1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fd8WhdpCx7eQ8qzquudKo6XjDgmaDQd7jtMdGzQ+wYc=;
 b=G1Y0yjfp9fwR5pnA5V09FImre/D7Rauzh4l5BeioP4w2BtVXzI2h5s8pGoSJGdFGeR762h+ue3imBuPWSIf7NGwM3qhD7UOJYLkHQBC0MLD4Z3nhZ45F+5vcPNfQ3q0LXiEjD/DEqGemGnapCYfVrN9Kx8uMMn+v5en+cYB2qmyNoWlx1J2f3/k6Ao6wGV1dXzaAHt7xsNuSpKL81+INoLK8uYYTjttwsdoGjz/RrQRScOooyjWAYWtGKLwnwvQoiVqMYm78ktH4YPYKrz4WolgM70wdsdd45FXuVpQ+VabcU36kJWIOULoTD+sorzEQdzQmzLO2JtVk9kNVPlBrxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AMBPR04MB11810.eurprd04.prod.outlook.com (2603:10a6:20b:6ef::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 14:48:26 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 14:48:26 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Linus Walleij <linusw@kernel.org>,
	linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev,
	Frank Li <Frank.Li@nxp.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH 1/1] pinctrl: Add OF dependency for PINCTRL_GENERIC_MUX
Date: Tue, 12 May 2026 10:48:05 -0400
Message-ID: <20260512144806.22447-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0044.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::19) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AMBPR04MB11810:EE_
X-MS-Office365-Filtering-Correlation-Id: 57b0ff61-a2a2-4392-100a-08deb03585d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|52116014|376014|38350700014|56012099003|11063799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	fbC5OIOCrt62C/mOM3X3ArcJk9sTNdHfcW8cn7TogYnZsIogThOz4A36VFIf2FTXt3cE3fZ6ZgqqazEzDeGIROQ/MXommAFIqupfraxG/0wA4+ssBxHhFanmirHPiDfdC5F6FvlOJNv+lD1X7RY8oPjxT7OjxuuGqHvhwm4lp7diy5PNQJcjt4K9a7ztb2ZGiULOMZE8kvs8Az+38nIHT/zGSbSR+k4u7qA0bQOh0Xx/a4eKKKJSdropxRmRQATfIrv6VYJTTLPdmHoyxGBn8aWhzDSOzL3Sz4zFn1etm2vAHajE1jJ+7qMUDzft57dAyNoJvxjzE4KliZVFGiMV9u5o4+8+DscTuF68F83WTblYKa7PMZN4m+3SeE5FZGnZIV4mKHHMbaJqUJUFbbI0UVMW8MgECnDNFA8rq89m8YXA8JGXDHQ9Vm1VFSTDXt7kvN3vWGagpMfwy/ZShfUzb5MgfiIZYXGeKM9G5orLcYfgFBNMS8bRfSbDj1jolk5eUDxDMin7Zh03N8wnSTYxuRiTByEXlsX66CXhm90WdbYSurViiFuk10bHKCtlfSLB8Gw1Fvh/CG6BmjLfc1S02/m77tygHdBTElJzU/jLwPWUUZ6FAExzDpmUfUzSDHiyo0tbq7EZsf5BD2vH+wmD1mhF7wSTzO+ABhQ1nsZG2L9KWtEenGe0PZuxKLVBF64wjX48GqeWuTZyyAbAsCQOk4Zgd1LL19nWFDSnRBXNSikJDtS+a1yCRN/lQePsUlUz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(376014)(38350700014)(56012099003)(11063799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OgKqKSmyh8P7jyUmvADnKDll0pWWlX+k0jlePdfH2+ejHoZ2dxLwTrgjP5+3?=
 =?us-ascii?Q?rNSrEcVO4pwlgWPmSLuS15VAlaRbJ4O8C4UZuSQ0AmEqzcUfQ0DOOIJwnb1K?=
 =?us-ascii?Q?x0xj4bDEcqz48KV0gPFL4mWFArlR0p0lUYcu4dmtfBTD2z29HjRNCdKAW/zU?=
 =?us-ascii?Q?zudK0FqBiB5JTuczu7HeI8fwAZviD631Ptb5G+wE6SnHMsFGLuaTbE+u4XVL?=
 =?us-ascii?Q?8yzM32cOwffKYSwgivWqDhv9LVP1clKK5ZVOp54DI1GLGHhp2iEGWrSSJGSL?=
 =?us-ascii?Q?4l9zMDdyvDe0EbqTSjlMJjpz9EFNom/CJee8Is6SAYC/jhu/6j4BtlOvSkkn?=
 =?us-ascii?Q?nyvG2L6OFyE0j2kl0x3BXNgE/CJxniRhSnSGCms9z2yKjFYcTd2OPLog1oVb?=
 =?us-ascii?Q?uW1AaNlyKUCN7/R4YzfGZJ8SDFUowA332Jkl7VycpNbB4/zt4r3+9EGerGdD?=
 =?us-ascii?Q?3hnebCRdyRc/kEevw4k3G1KHmWvu5SHXIkV1ZeF7phLOYRvd4IBeKHI3IZ7v?=
 =?us-ascii?Q?vU5P46dDmTdtK9ZFBu/vqUkbDsZZPOb4m0BlWCnX3f1xIg1u1LdVwz19wygh?=
 =?us-ascii?Q?qx1JhcGJ751/wL/4yAGu+QT8zTG0NLWR3kerAQ6r2F9rtG2DVbUwsesbmDvv?=
 =?us-ascii?Q?HjzL7fptzzeBR+50O1zA5mYp0IdGTJtfdwEUD3WRYKv98DoUIzHdVjVmcSrt?=
 =?us-ascii?Q?VwNIWQiT2UxttqLImXfhyjLJM7IYwnATqjzlkMKY2cc+1jfiSoGdwrzDEQEC?=
 =?us-ascii?Q?ifA2Rk2/07DZajTwpP86vBOfRC244S2vRZweeg7mk3ofKecCdn2N55Tb3o4v?=
 =?us-ascii?Q?ODoS3KgV10jXq+PoXp+qcADQFw8D4tXLQDlTinKtyGcH9tjOmA9yLZzTzP4x?=
 =?us-ascii?Q?gS1lWPgDtXN+CvfuvyvAdchpvN4ihKrh3GQ251+Iq5bm/h3ZlGTl6tD30rhd?=
 =?us-ascii?Q?dl17vEhosQSXRGHkgzvjAHZ6hT6fh5A2otcNc99YQMEXccih73IWg6whKR4r?=
 =?us-ascii?Q?u0NvJMzG/1tPnJOFrVPYne/pTBoCixO/Szbq0xZUvjSHsT09VXYswJCbuA6c?=
 =?us-ascii?Q?4WnUEAkG9QeLSUUSGQlo99gqFK6VnupSUXGudzq/FgYHv7Y+6RWyDEOlkFXt?=
 =?us-ascii?Q?wCs8sVSK3F8ZIwf7rin5Qj5lFS6LunWPNrv6L7/oWD6diWx8b/GRRGYEiMWQ?=
 =?us-ascii?Q?6sXl0hCyQd+lpBu37qGWvNxmI2LWFz2mF5GW8TR2fkcECHeG0v+0Vqx20kAL?=
 =?us-ascii?Q?tgecRKHDbVWSvUCKE49lLVERtGzyMvX1qCqBhhGb0KkjnR6LBScvVQhcyfWv?=
 =?us-ascii?Q?94AuqBjHnM9fNP5IP0ph4yrv7NeRrYxX3K9wwISIXMKaax7wYMvyvKHxZFIo?=
 =?us-ascii?Q?8805AI7hZ/O/EQwvHUTlKJ40Xl7zOsTZUdHTivkm5yhOm7C5n4qqdF6aPxGv?=
 =?us-ascii?Q?qIuBGUcc/yMZTblTUQ10cZN7gp6EAQwYQ/l6fEfX/VwbFYNpMt4k+91MDTEI?=
 =?us-ascii?Q?titiT4d43UxOJJJh86teeCy2La2yUZLjC2zlaqq40L99QECDafqgXNxC99U1?=
 =?us-ascii?Q?VIrQU4S1ClPyPCpehJz7pqgCtmK+HqS+hL/vOCr8ylhks/KVDOjTBOuZ2JbZ?=
 =?us-ascii?Q?GdFqPSZyLiutSuKMeEecYejuCQ4nLE4jVWjvJROt67mz3sS4Wnudz4zxuvMg?=
 =?us-ascii?Q?UJnbAD+KAJC+UpzNSiy5Pc9SoGlLCwClR34IjDVrMlvromNg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57b0ff61-a2a2-4392-100a-08deb03585d2
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 14:48:26.1143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VLYKuXsGvml7CIJjKCGmPTe0L+0n6aFsqx/zg8lq6a7FKkUSEwtQEpgwKoi4wb9RGI1TMJVsGr65nyAPBJ4Uow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB11810
X-Rspamd-Queue-Id: 151AA523183
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36679-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:email,nxp.com:mid,nxp.com:dkim,intel.com:email]
X-Rspamd-Action: no action

Add an explicit OF dependency for PINCTRL_GENERIC_MUX to ensure the
generic mux support is only enabled when device tree is available.

Also fix the stub implementation of pinctrl_generic_to_map() by correcting
its last argument to match the non-stub prototype.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202604072013.aI84l57L-lkp@intel.com/
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Linus Walleij:
	I am sorry for missed a previous fixes patch
(https://lore.kernel.org/imx/20260408050702.2454661-1-Frank.Li@nxp.com/)
when rebase since it is located another fixes tree.

Frank
---
 drivers/pinctrl/Kconfig   | 1 +
 drivers/pinctrl/pinconf.h | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 31d698fbaa01d..f4ffe1f3b720f 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -275,6 +275,7 @@ config PINCTRL_GEMINI
 config PINCTRL_GENERIC_MUX
 	tristate "Generic Pinctrl driver by using multiplexer"
 	depends on MULTIPLEXER
+	depends on OF
 	select PINMUX
 	select GENERIC_PINCTRL
 	help
diff --git a/drivers/pinctrl/pinconf.h b/drivers/pinctrl/pinconf.h
index fa8fb0d290d1d..9711d16c38b62 100644
--- a/drivers/pinctrl/pinconf.h
+++ b/drivers/pinctrl/pinconf.h
@@ -195,7 +195,7 @@ pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device_node *parent,
 		       unsigned int *num_maps, unsigned int *num_reserved_maps,
 		       const char **group_name, unsigned int ngroups,
 		       const char **functions, unsigned int *pins,
-		       void *function_data)
+		       unsigned int npins)
 {
 	return -ENOTSUPP;
 }
-- 
2.43.0


