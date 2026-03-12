Return-Path: <linux-gpio+bounces-33294-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LUjH74Us2mDSAAAu9opvQ
	(envelope-from <linux-gpio+bounces-33294-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 20:32:14 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3152227805E
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 20:32:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 41759309021D
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 19:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E55A401A15;
	Thu, 12 Mar 2026 19:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="E5Djd99u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011004.outbound.protection.outlook.com [52.101.70.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B394014B1;
	Thu, 12 Mar 2026 19:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773343843; cv=fail; b=qg3DK4al8JmUAzVpqLxsLVp/AaZKMa+PHI13ivwS7DMhDRnTLkCiuXH+wC8ka0QDFSdb4XY0LoBZkt5Q9NDLkDMTqkD/RJd1Na7vjE6+zOsEMOjWNfysSyO3aJZ90vP2CcU9NFF3LQz/BlA3JfHcAFEI/HQcnNJYCQgwVyKomDc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773343843; c=relaxed/simple;
	bh=42qrrPFZN447gOdu57uvW2fMqKaXO0goBcZHJNkOzsY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jWzDUMtI9/FquHkUjGhGanL76C3uJjnGZ6x5YRg+C34DeJ9FFUoPRdhrryyw/tfDCTL3U+a31lO5RU+K7FoeQ4UhebO0cUHEnzTfiXxZYBH7cO9vZStXrs+QY6rTTmfOLavVsg121SmU4xptAr0kcrIUtj4m8P7Pg73cwykrTro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=E5Djd99u; arc=fail smtp.client-ip=52.101.70.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ww7Q3cGWGU5Sq2HN6FHE3qEZJXBjytqa7vz4gQkBxZsBil/JSFJnRtImRJ+jBzuuI9QvLWlwuJulNcFWu4JNkmKM57hiU+lm2p3Njwjw9UXonKzXHt9JpIXEXNgu9UD+WIVUw2MT+PVMGIZfII5mzlHxEncKvO4ERFCFsy99k6ZAkYjDqTlYAx/isNqUIXf9cIbtMOHSk+xzm3lQ037yH1LuKouHHY27/o8l7sSK/qV8etgiwFFHOljJcTpRzOOTaegG1YkC7hjh0A76YsK+rmFJx0FIsekPD2rerU3Pqhozn9uZ6z0CzIMb2HqC5gOxiudyczEzDR47j7Pi74s+Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5bmtcR7bVXN1iiCY+yw0WNRhUOLkt1prkpCXAQSLeLc=;
 b=N0q/srgftDdpn/GWbGVaf5v3geZnY0EIrr8Ke+It8Y6CFT76YTkuFk+e9DNPlP05gK0ocuyIF1zE9Oq5gmRofHC7lX+lYpPgyOml5kBo1zeJog9Lc6TmA+RqP5JIanDoVNtJsIzKU9YFlj3xJPTzcm614WqFb6EceN6H7CfsanZ4rHT9GMKqpEZXaGAVycvAkBwOR16GGYi09JxtMQlZumz9GBy0UdNPFHJSNz/Y/2/LqcbsUFEXZmF+oQRJmfr06gDyC+Q5zoxJT6HwxWpXyOEOr0aJfNbA32kvCMP/dT7vQ5jGG0aa36VErBRQbeHV6cmW+xkFQyqGb/ClFxMAsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5bmtcR7bVXN1iiCY+yw0WNRhUOLkt1prkpCXAQSLeLc=;
 b=E5Djd99uZZALwiSA5/OAgX+WGA2UIMbeWO/ZWYKHt759/gHrVcj4FpExQ38+rjvnWRqPRxEmcRVwTTv+XhZzlJgR/AgTQUx5RIFhBgHC7P/VGlIVAgkw/hKpYiHsq459QdffBN803erhQUq/FOteO3x5LBKfE4xCxAgtGqnAAgtIWB6OXqOhpeVPUfPgoD3MUBtGFSPGkRk5/34qJa3k5asVEBMKKQ8SPThZAFdz7hNCOH5rn7u/rz1iqi8Vl6F6c/ptZYekdAWwoOhJ+XgBi/DDF8nQq9bHzwuYvbnLg2JEZ45boMv/B6wdc8QEDPmvbMXvg221NF4KFKd1Th9aYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by PR3PR04MB7468.eurprd04.prod.outlook.com (2603:10a6:102:8d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 19:30:32 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9700.013; Thu, 12 Mar 2026
 19:30:35 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	arnaud.pouliquen@foss.st.com
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v11 3/5] gpio: rpmsg: add generic rpmsg GPIO driver
Date: Thu, 12 Mar 2026 14:29:55 -0500
Message-ID: <20260312192957.1978329-4-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260312192957.1978329-1-shenwei.wang@nxp.com>
References: <20260312192957.1978329-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9PR13CA0112.namprd13.prod.outlook.com
 (2603:10b6:806:24::27) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|PR3PR04MB7468:EE_
X-MS-Office365-Filtering-Correlation-Id: 76c4fb0f-ceca-430c-31eb-08de806dd55d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|52116014|7416014|376014|921020|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	e2LRf8EpimoOal2WbTSR9sAzfA3vPMdrD78WO2Hdoqnw4HpvUaKZ2ji+qEdtWS1rd2JMbLnetks+b54SwkpU/4gn5twR1kjEzv/sqOk/7w84sBxiTxH/0gIK2Ym1CA10EijsAsNucTI0dZxU3A2bgQ5z62+c99MV2ap1ayLu2/KQeBwILWsbPuq8sP8qU15wNRk/fd33iIZTBBnBywV8NlZvpO0xQEzFWcuskc5E8/eUhkEEO6dd/2B30ia/h0FgxMpgMY5fCawBC21uikPDAEQT25s8PsQBWbh2jJ35dB7ovc8gSmK1RhGrv42T4MK50PdpcaJMGZq2wtRLB4G5HD9Pg7L39moeRr8SNtPid7sm1qIaMnRZ20g48b6Ka+duwykzEwXqHnHlTuehTlg9OfXSBcn5bRoEXUlneWSV1dVOEZntgSsNJQwYNmMhQ6ui0qrOQz9SV2ju0FXDg79b/2iXJtS7n9XVrJDpZJZMSf6uhoCCnIq7MQHYFN4VCdpdNSh0kd83nVeaH3W4U6GPOCkO85PmebUjFSXuL1He3Kka1+FIycDruxIxhP31oEC/Ee8vhFxiCtKwTH9y9MmYMTFLkYeE97+pt9YcIUEzX1dvm/xXpfFUT9dJMO5Bc6YFyKEiX6wC3jLnKwO15Z7JgOhfVOBIRWGAKjvl+vd0AR37pbB/SjcdA3zAIgn+47D0XJ9E0kfTcssxUkyPBgMD0f70uMgNy1fnpRoeagYDQG6C8I02xjx70t7Odg6yqiqUalc+5sdnxhuahv3lgzx/DNSzq2NLTmN+9Mrf0ddE/oJeedk4gmle0vut8SHwsYMI
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(7416014)(376014)(921020)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZsVcg48K4STusyqt8lU/W+fp15x+pwbCJdWFdWQeM6qL5VcJiN2xMyEL0j+z?=
 =?us-ascii?Q?zCWy62OvyJNxApomZ19FFcPoaESsj1T1f63s2+uBhFCAaIOLKXbgCd0TXb9I?=
 =?us-ascii?Q?7DF0P4oUVR8wgWNlvzQUFIgmQem+YmwRbSkmhrfnLvq31S8LNcWscrnhUTPF?=
 =?us-ascii?Q?KOKz0J0E2AlCXCPEgKminVOR6cNJ+CXYYZavu8CRsad1s4XCGn1r6CJ9ZwS0?=
 =?us-ascii?Q?gmUFUQWyUwpchTPBl+ijbY0sr3JYht/hd9zIibPp0D3tuDe6zOMSErxKW7pj?=
 =?us-ascii?Q?TTec+rS+VsVYpqHGK/5TLV17tNUFhZyQ8jYXBUd8frMxHh6iJo1GHrgHUGb0?=
 =?us-ascii?Q?ZqEAnasOE6NF6gDLp9lFm1jlIJpad2v4WWQ3qoP93wcqHfWFcI25sYjJ0NHw?=
 =?us-ascii?Q?TGsymAtl+WQ2V3PrD1xV8nufJEyhu2SxL1UUoPA9AjsA2WokNV+wW22PPk9C?=
 =?us-ascii?Q?NeugJIBMJ5KOah4SUTwvOsVls0hFXB2Ezdc7xmNQYSN4fx3zz1PgeJf8x+hN?=
 =?us-ascii?Q?aO6T6wExzqWKAVujM6hoXeSpNIBTUsIBoaFdaLCvo8AHg0SZf966G3bTyUkV?=
 =?us-ascii?Q?EFi/ovSJP9LxuZPvygLRbYZDX/1CZfsrCRUmGyP0jGxeOEDFE+s/HCvgGl65?=
 =?us-ascii?Q?DfIXWhLq2bHaoltw2g803I8HubBhRZLSpn/kD8jxJUeUM26IwpwNAIZa407K?=
 =?us-ascii?Q?OQIHJSyDKJ9OZ09VutaDGt2h4koBlmWKAbQ5pGZSBwXf/v4IAu1izwsNyNhs?=
 =?us-ascii?Q?d/zvVYICqKzqBseKuNqTlOfuoEHb7NWUZewqeExFvXZpMG/UgJv1vV5wiqjF?=
 =?us-ascii?Q?KXE30re6F/qo5k+SakVssxQt7Wtnt7GvZUGNHyokzqfTx02pojTuS2/rCEVX?=
 =?us-ascii?Q?CgqO5gqZQGLzfA7m3r+8UEvwOZxHaTdya34EW/mHhewPmai+8F23bmffZ3cd?=
 =?us-ascii?Q?kYA2fzYXI1X+t8nKOTPtKkmmppWwLDNAsPPrtpRvxN/oabIiwZ0r56KtHqgo?=
 =?us-ascii?Q?+YHdNlP3d0TP8phffhxLLAfPrZvLHqy9tj4rpjdw1LaiBMlvQeS5RRs84vgf?=
 =?us-ascii?Q?HSO+PFbdl/LRnl0YNqdrTdegK8ghKOKa2+LSmDVafwvomNhcLTfDjT3Tg60D?=
 =?us-ascii?Q?GPyGObmfHw7NLSlpbQ2986o7PcfG5C/I+Jsl4Miu++t4liP56DCUw5TiRql3?=
 =?us-ascii?Q?K9PhhtAuYSzTxnYQRLMt3zltD2NzptX0N1qS65tnnmhvjhd1h8MULA8tfsrB?=
 =?us-ascii?Q?NZGDuDj2PsWR27IrjEx8q34/ajWH62LEFx47NxHLZDcQA+e2m2btml1g3MN1?=
 =?us-ascii?Q?fQ6fm51w4pmjDVh4O1L6oKR8SbRrtkQp3Ryvmxo0cYuhWn/thGgbxDz/gEby?=
 =?us-ascii?Q?7jPQ6NPLeBq5RKOaq7/82ee9OBi7J4RehuSCCMnFyGdHiHPxLKiweM2wG+MT?=
 =?us-ascii?Q?AP0qIzMMPEhvbwsyL17PWCOOmNA1A99FmyuJJFXCv3V/TL9ukkUmCki12oNX?=
 =?us-ascii?Q?HGIHDIaH8nEVWLrrb/ojCWsInhZB6z+S8EZjL4H0CWFt/In6/2gzxMoiHLhn?=
 =?us-ascii?Q?mOYaU8toEjhIItmQY6nbKTo6hinnMHS1maHfXpD2g+I/q+inLX6ExajWcrDG?=
 =?us-ascii?Q?/2Xnh0GvLjY6XqzBxO5g1xS6vLq9bDP547ucq9mK15lWLaSJmOjQipptjmWy?=
 =?us-ascii?Q?r6561EZTMZmhIzCQI5bVIvUJM85FVaJgKcjPGEHhvyPj/ZCTyQ5zQDUO1lIf?=
 =?us-ascii?Q?UKc6IZdMJg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76c4fb0f-ceca-430c-31eb-08de806dd55d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 19:30:35.5754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zmugvhit6Fsxo3/nJIK9dun8sghpKyYez9BLs5UkmDPQ+YkE7a1zey12szgRSv/TbsvXwsvahaUsZ1vdoR4/VA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7468
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33294-lists,linux-gpio=lfdr.de];
	URIBL_MULTI_FAIL(0.00)[lunn.ch:server fail,nxp.com:server fail,bgdev.pl:server fail,tor.lore.kernel.org:server fail];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org,bgdev.pl,lunn.ch];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bgdev.pl:email,nxp.com:dkim,nxp.com:email,nxp.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3152227805E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On an AMP platform, the system may include two processors:
	- An MCU running an RTOS
	- An MPU running Linux

These processors communicate via the RPMSG protocol.
The driver implements the standard GPIO interface, allowing
the Linux side to control GPIO controllers which reside in
the remote processor via RPMSG protocol.

Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 drivers/gpio/Kconfig      |  17 ++
 drivers/gpio/Makefile     |   1 +
 drivers/gpio/gpio-rpmsg.c | 596 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 614 insertions(+)
 create mode 100644 drivers/gpio/gpio-rpmsg.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index b45fb799e36c..cff0fda8a283 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1892,6 +1892,23 @@ config GPIO_SODAVILLE
 
 endmenu
 
+menu "RPMSG GPIO drivers"
+	depends on RPMSG
+
+config GPIO_RPMSG
+	tristate "Generic RPMSG GPIO support"
+	depends on OF && REMOTEPROC
+	select GPIOLIB_IRQCHIP
+	default REMOTEPROC
+	help
+	  Say yes here to support the generic GPIO functions over the RPMSG
+	  bus. Currently supported devices: i.MX7ULP, i.MX8ULP, i.MX8x, and
+	  i.MX9x.
+
+	  If unsure, say N.
+
+endmenu
+
 menu "SPI GPIO expanders"
 	depends on SPI_MASTER
 
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index c05f7d795c43..501aba56ad68 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -158,6 +158,7 @@ obj-$(CONFIG_GPIO_RDC321X)		+= gpio-rdc321x.o
 obj-$(CONFIG_GPIO_REALTEK_OTTO)		+= gpio-realtek-otto.o
 obj-$(CONFIG_GPIO_REG)			+= gpio-reg.o
 obj-$(CONFIG_GPIO_ROCKCHIP)	+= gpio-rockchip.o
+obj-$(CONFIG_GPIO_RPMSG)		+= gpio-rpmsg.o
 obj-$(CONFIG_GPIO_RTD)			+= gpio-rtd.o
 obj-$(CONFIG_ARCH_SA1100)		+= gpio-sa1100.o
 obj-$(CONFIG_GPIO_SAMA5D2_PIOBU)	+= gpio-sama5d2-piobu.o
diff --git a/drivers/gpio/gpio-rpmsg.c b/drivers/gpio/gpio-rpmsg.c
new file mode 100644
index 000000000000..9c609b55bc14
--- /dev/null
+++ b/drivers/gpio/gpio-rpmsg.c
@@ -0,0 +1,596 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2026 NXP
+ *
+ * The driver exports a standard gpiochip interface to control
+ * the GPIO controllers via RPMSG on a remote processor.
+ */
+
+#include <linux/completion.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/gpio/driver.h>
+#include <linux/init.h>
+#include <linux/irqdomain.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/remoteproc.h>
+#include <linux/rpmsg.h>
+#include <linux/virtio_gpio.h>
+
+#define MAX_PORT_PER_CHANNEL    10
+#define GPIOS_PER_PORT_DEFAULT	32
+#define RPMSG_TIMEOUT		1000
+
+/* GPIO RPMSG Type */
+#define GPIO_RPMSG_SEND		0
+#define GPIO_RPMSG_REPLY	1
+#define GPIO_RPMSG_NOTIFY	2
+
+struct rpmsg_gpio_packet {
+	u8 type;	/* Message type */
+	u8 cmd;		/* Command code */
+	u8 port_idx;
+	u8 line;
+	u8 val1;
+	u8 val2;
+};
+
+struct rpmsg_gpio_line {
+	u8 irq_shutdown;
+	u8 irq_unmask;
+	u8 irq_mask;
+	u32 irq_wake_enable;
+	u32 irq_type;
+	struct rpmsg_gpio_packet msg;
+};
+
+struct rpmsg_gpio_info {
+	struct rpmsg_device *rpdev;
+	struct rpmsg_gpio_packet *reply_msg;
+	struct completion cmd_complete;
+	struct mutex lock;
+	void **port_store;
+};
+
+struct rpmsg_gpio_port {
+	struct gpio_chip gc;
+	struct rpmsg_gpio_line lines[GPIOS_PER_PORT_DEFAULT];
+	struct rpmsg_gpio_info info;
+	u32 ngpios;
+	u32 idx;
+};
+
+struct rpmsg_gpio_fixed_up {
+	int (*send_fixed_up)(struct rpmsg_gpio_info *info, struct rpmsg_gpio_packet *msg);
+	struct rpmsg_gpio_packet *(*recv_fixed_up)(struct rpmsg_device *rpdev, void *data);
+};
+
+/*
+ * @rproc_name: the name of the remote proc.
+ * @recv_pkt: a pointer to the received packet for protocol fix up.
+ * @protocol_fixed_up: optional callbacks to handle protocol mismatches.
+ * @channel_devices: an array of the devices related to the rpdev.
+ */
+struct rpdev_drvdata {
+	const char *rproc_name;
+	void *recv_pkt;
+	struct rpmsg_gpio_fixed_up *protocol_fixed_up;
+	void *channel_devices[MAX_PORT_PER_CHANNEL];
+};
+
+static int rpmsg_gpio_send_message(struct rpmsg_gpio_port *port,
+				   struct rpmsg_gpio_packet *msg,
+				   bool sync)
+{
+	struct rpmsg_gpio_info *info = &port->info;
+	struct rpdev_drvdata *drvdata;
+	int ret;
+
+	drvdata = dev_get_drvdata(&info->rpdev->dev);
+	reinit_completion(&info->cmd_complete);
+
+	if (drvdata->protocol_fixed_up)
+		ret = drvdata->protocol_fixed_up->send_fixed_up(info, msg);
+	else
+		ret = rpmsg_send(info->rpdev->ept, msg, sizeof(*msg));
+
+	if (ret) {
+		dev_err(&info->rpdev->dev, "rpmsg_send failed: %d\n", ret);
+		return ret;
+	}
+
+	if (sync) {
+		ret = wait_for_completion_timeout(&info->cmd_complete,
+						  msecs_to_jiffies(RPMSG_TIMEOUT));
+		if (ret == 0) {
+			dev_err(&info->rpdev->dev, "rpmsg_send timeout!\n");
+			return -ETIMEDOUT;
+		}
+
+		if (info->reply_msg->val1 != 0) {
+			dev_err(&info->rpdev->dev, "remote core replies an error: %d!\n",
+				info->reply_msg->val1);
+			return -EINVAL;
+		}
+
+		/* copy the reply message */
+		memcpy(&port->lines[info->reply_msg->line].msg,
+		       info->reply_msg, sizeof(*info->reply_msg));
+	}
+
+	return 0;
+}
+
+static struct rpmsg_gpio_packet *
+rpmsg_gpio_msg_init_common(struct rpmsg_gpio_port *port, unsigned int line, u8 cmd)
+{
+	struct rpmsg_gpio_packet *msg = &port->lines[line].msg;
+
+	memset(msg, 0, sizeof(struct rpmsg_gpio_packet));
+	msg->type = GPIO_RPMSG_SEND;
+	msg->cmd = cmd;
+	msg->port_idx = port->idx;
+	msg->line = line;
+
+	return msg;
+}
+
+static int rpmsg_gpio_get(struct gpio_chip *gc, unsigned int line)
+{
+	struct rpmsg_gpio_port *port = gpiochip_get_data(gc);
+	struct rpmsg_gpio_packet *msg;
+	int ret;
+
+	guard(mutex)(&port->info.lock);
+
+	msg = rpmsg_gpio_msg_init_common(port, line, VIRTIO_GPIO_MSG_GET_VALUE);
+
+	ret = rpmsg_gpio_send_message(port, msg, true);
+	if (!ret)
+		ret = !!port->lines[line].msg.val2;
+
+	return ret;
+}
+
+static int rpmsg_gpio_get_direction(struct gpio_chip *gc, unsigned int line)
+{
+	struct rpmsg_gpio_port *port = gpiochip_get_data(gc);
+	struct rpmsg_gpio_packet *msg;
+	int ret;
+
+	guard(mutex)(&port->info.lock);
+
+	msg = rpmsg_gpio_msg_init_common(port, line, VIRTIO_GPIO_MSG_GET_DIRECTION);
+
+	ret = rpmsg_gpio_send_message(port, msg, true);
+	if (ret)
+		return ret;
+
+	switch (port->lines[line].msg.val2) {
+	case VIRTIO_GPIO_DIRECTION_IN:
+		return GPIO_LINE_DIRECTION_IN;
+	case VIRTIO_GPIO_DIRECTION_OUT:
+		return GPIO_LINE_DIRECTION_OUT;
+	default:
+		break;
+	}
+
+	return -EINVAL;
+}
+
+static int rpmsg_gpio_direction_input(struct gpio_chip *gc, unsigned int line)
+{
+	struct rpmsg_gpio_port *port = gpiochip_get_data(gc);
+	struct rpmsg_gpio_packet *msg;
+
+	guard(mutex)(&port->info.lock);
+
+	msg = rpmsg_gpio_msg_init_common(port, line, VIRTIO_GPIO_MSG_SET_DIRECTION);
+	msg->val1 = VIRTIO_GPIO_DIRECTION_IN;
+
+	return rpmsg_gpio_send_message(port, msg, true);
+}
+
+static int rpmsg_gpio_set(struct gpio_chip *gc, unsigned int line, int val)
+{
+	struct rpmsg_gpio_port *port = gpiochip_get_data(gc);
+	struct rpmsg_gpio_packet *msg;
+
+	guard(mutex)(&port->info.lock);
+
+	msg = rpmsg_gpio_msg_init_common(port, line, VIRTIO_GPIO_MSG_SET_VALUE);
+	msg->val1 = val;
+
+	return rpmsg_gpio_send_message(port, msg, true);
+}
+
+static int rpmsg_gpio_direction_output(struct gpio_chip *gc, unsigned int line, int val)
+{
+	struct rpmsg_gpio_port *port = gpiochip_get_data(gc);
+	struct rpmsg_gpio_packet *msg;
+	int ret;
+
+	guard(mutex)(&port->info.lock);
+
+	msg = rpmsg_gpio_msg_init_common(port, line, VIRTIO_GPIO_MSG_SET_DIRECTION);
+	msg->val1 = VIRTIO_GPIO_DIRECTION_OUT;
+
+	ret = rpmsg_gpio_send_message(port, msg, true);
+	if (ret)
+		return ret;
+
+	msg = rpmsg_gpio_msg_init_common(port, line, VIRTIO_GPIO_MSG_SET_VALUE);
+	msg->val1 = val;
+
+	return rpmsg_gpio_send_message(port, msg, true);
+}
+
+static int gpio_rpmsg_irq_set_type(struct irq_data *d, u32 type)
+{
+	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+	u32 line = d->hwirq;
+	int ret = 0;
+
+	switch (type) {
+	case IRQ_TYPE_EDGE_RISING:
+		type = VIRTIO_GPIO_IRQ_TYPE_EDGE_RISING;
+		irq_set_handler_locked(d, handle_simple_irq);
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		type = VIRTIO_GPIO_IRQ_TYPE_EDGE_FALLING;
+		irq_set_handler_locked(d, handle_simple_irq);
+		break;
+	case IRQ_TYPE_EDGE_BOTH:
+		type = VIRTIO_GPIO_IRQ_TYPE_EDGE_BOTH;
+		irq_set_handler_locked(d, handle_simple_irq);
+		break;
+	case IRQ_TYPE_LEVEL_LOW:
+		type = VIRTIO_GPIO_IRQ_TYPE_LEVEL_LOW;
+		irq_set_handler_locked(d, handle_level_irq);
+		break;
+	case IRQ_TYPE_LEVEL_HIGH:
+		type = VIRTIO_GPIO_IRQ_TYPE_LEVEL_HIGH;
+		irq_set_handler_locked(d, handle_level_irq);
+		break;
+	default:
+		ret = -EINVAL;
+		irq_set_handler_locked(d, handle_bad_irq);
+		break;
+	}
+
+	port->lines[line].irq_type = type;
+
+	return ret;
+}
+
+static int gpio_rpmsg_irq_set_wake(struct irq_data *d, u32 enable)
+{
+	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+	u32 line = d->hwirq;
+
+	port->lines[line].irq_wake_enable = enable;
+
+	return 0;
+}
+
+/*
+ * This unmask/mask function is invoked in two situations:
+ *   - when an interrupt is being set up, and
+ *   - after an interrupt has occurred.
+ *
+ * The GPIO driver does not access hardware registers directly.
+ * Instead, it caches all relevant information locally, and then sends
+ * the accumulated state to the remote system at this stage.
+ */
+static void gpio_rpmsg_unmask_irq(struct irq_data *d)
+{
+	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+	u32 line = d->hwirq;
+
+	port->lines[line].irq_unmask = 1;
+}
+
+static void gpio_rpmsg_mask_irq(struct irq_data *d)
+{
+	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+	u32 line = d->hwirq;
+
+	/*
+	 * When an interrupt occurs, the remote system masks the interrupt
+	 * and then sends a notification to Linux. After Linux processes
+	 * that notification, it sends an RPMsg command back to the remote
+	 * system to unmask the interrupt again.
+	 */
+	port->lines[line].irq_mask = 1;
+}
+
+static void gpio_rpmsg_irq_shutdown(struct irq_data *d)
+{
+	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+	u32 line = d->hwirq;
+
+	port->lines[line].irq_shutdown = 1;
+}
+
+static void gpio_rpmsg_irq_bus_lock(struct irq_data *d)
+{
+	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+
+	mutex_lock(&port->info.lock);
+}
+
+static void gpio_rpmsg_irq_bus_sync_unlock(struct irq_data *d)
+{
+	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+	struct rpmsg_gpio_packet *msg;
+	u32 line = d->hwirq;
+
+	/*
+	 * For mask irq, do nothing here.
+	 * The remote system will mask interrupt after an interrupt occurs,
+	 * and then send a notification to Linux system. After Linux system
+	 * handles the notification, it sends an rpmsg back to the remote
+	 * system to unmask this interrupt again.
+	 */
+	if (port->lines[line].irq_mask && !port->lines[line].irq_unmask) {
+		port->lines[line].irq_mask = 0;
+		mutex_unlock(&port->info.lock);
+		return;
+	}
+
+	msg = rpmsg_gpio_msg_init_common(port, line, VIRTIO_GPIO_MSG_IRQ_TYPE);
+
+	if (port->lines[line].irq_shutdown) {
+		port->lines[line].irq_shutdown = 0;
+		msg->val1 = VIRTIO_GPIO_IRQ_TYPE_NONE;
+		msg->val2 = 0;
+	} else {
+		/* if irq type is not set, use low level trigger as default. */
+		msg->val1 = port->lines[line].irq_type;
+		if (!msg->val1)
+			msg->val1 = VIRTIO_GPIO_IRQ_TYPE_LEVEL_LOW;
+		if (port->lines[line].irq_unmask) {
+			msg->val2 = 0;
+			port->lines[line].irq_unmask = 0;
+		} else /* irq set wake */
+			msg->val2 = port->lines[line].irq_wake_enable;
+	}
+
+	rpmsg_gpio_send_message(port, msg, false);
+	mutex_unlock(&port->info.lock);
+}
+
+static const struct irq_chip gpio_rpmsg_irq_chip = {
+	.irq_mask = gpio_rpmsg_mask_irq,
+	.irq_unmask = gpio_rpmsg_unmask_irq,
+	.irq_set_wake = gpio_rpmsg_irq_set_wake,
+	.irq_set_type = gpio_rpmsg_irq_set_type,
+	.irq_shutdown = gpio_rpmsg_irq_shutdown,
+	.irq_bus_lock = gpio_rpmsg_irq_bus_lock,
+	.irq_bus_sync_unlock = gpio_rpmsg_irq_bus_sync_unlock,
+	.flags = IRQCHIP_IMMUTABLE,
+};
+
+static void rpmsg_gpio_remove_action(void *data)
+{
+	struct rpmsg_gpio_port *port = data;
+
+	port->info.port_store[port->idx] = NULL;
+}
+
+static int rpmsg_gpiochip_register(struct rpmsg_device *rpdev, struct device_node *np)
+{
+	struct rpdev_drvdata *drvdata = dev_get_drvdata(&rpdev->dev);
+	struct rpmsg_gpio_port *port;
+	struct gpio_irq_chip *girq;
+	struct gpio_chip *gc;
+	int ret;
+
+	port = devm_kzalloc(&rpdev->dev, sizeof(*port), GFP_KERNEL);
+	if (!port)
+		return -ENOMEM;
+
+	ret = of_property_read_u32(np, "reg", &port->idx);
+	if (ret)
+		return ret;
+
+	if (port->idx >= MAX_PORT_PER_CHANNEL)
+		return -EINVAL;
+
+	ret = devm_mutex_init(&rpdev->dev, &port->info.lock);
+	if (ret)
+		return ret;
+
+	ret = of_property_read_u32(np, "ngpios", &port->ngpios);
+	if (ret || port->ngpios > GPIOS_PER_PORT_DEFAULT)
+		port->ngpios = GPIOS_PER_PORT_DEFAULT;
+
+	port->info.reply_msg = devm_kzalloc(&rpdev->dev,
+					    sizeof(struct rpmsg_gpio_packet),
+					    GFP_KERNEL);
+	if (!port->info.reply_msg)
+		return -ENOMEM;
+
+	init_completion(&port->info.cmd_complete);
+	port->info.port_store = drvdata->channel_devices;
+	port->info.port_store[port->idx] = port;
+	port->info.rpdev = rpdev;
+
+	gc = &port->gc;
+	gc->owner = THIS_MODULE;
+	gc->parent = &rpdev->dev;
+	gc->fwnode = of_fwnode_handle(np);
+	gc->ngpio = port->ngpios;
+	gc->base = -1;
+	gc->label = devm_kasprintf(&rpdev->dev, GFP_KERNEL, "%s-gpio%d",
+				   drvdata->rproc_name, port->idx);
+
+	gc->direction_input = rpmsg_gpio_direction_input;
+	gc->direction_output = rpmsg_gpio_direction_output;
+	gc->get_direction = rpmsg_gpio_get_direction;
+	gc->get = rpmsg_gpio_get;
+	gc->set = rpmsg_gpio_set;
+
+	girq = &gc->irq;
+	gpio_irq_chip_set_chip(girq, &gpio_rpmsg_irq_chip);
+	girq->parent_handler = NULL;
+	girq->num_parents = 0;
+	girq->parents = NULL;
+	girq->chip->name = devm_kasprintf(&rpdev->dev, GFP_KERNEL, "%s-gpio%d",
+					  drvdata->rproc_name, port->idx);
+
+	ret = devm_add_action_or_reset(&rpdev->dev, rpmsg_gpio_remove_action, port);
+	if (ret)
+		return ret;
+
+	return devm_gpiochip_add_data(&rpdev->dev, gc, port);
+}
+
+static const char *rpmsg_get_rproc_node_name(struct rpmsg_device *rpdev)
+{
+	const char *name = NULL;
+	struct device_node *np;
+	struct rproc *rproc;
+
+	rproc = rproc_get_by_child(&rpdev->dev);
+	if (!rproc)
+		return NULL;
+
+	np = of_node_get(rproc->dev.of_node);
+	if (!np && rproc->dev.parent)
+		np = of_node_get(rproc->dev.parent->of_node);
+
+	if (np) {
+		name = devm_kstrdup(&rpdev->dev, np->name, GFP_KERNEL);
+		of_node_put(np);
+	}
+
+	return name;
+}
+
+static struct device_node *
+rpmsg_get_channel_ofnode(struct rpmsg_device *rpdev, char *chan_name)
+{
+	struct device_node *np_chan = NULL, *np;
+	struct rproc *rproc;
+
+	rproc = rproc_get_by_child(&rpdev->dev);
+	if (!rproc)
+		return NULL;
+
+	np = of_node_get(rproc->dev.of_node);
+	if (!np && rproc->dev.parent)
+		np = of_node_get(rproc->dev.parent->of_node);
+
+	/* The of_node_put() is performed by of_find_node_by_name(). */
+	if (np)
+		np_chan = of_find_node_by_name(np, chan_name);
+
+	return np_chan;
+}
+
+static int rpmsg_gpio_channel_callback(struct rpmsg_device *rpdev, void *data,
+				       int len, void *priv, u32 src)
+{
+	struct rpmsg_gpio_packet *msg = data;
+	struct rpmsg_gpio_port *port = NULL;
+	struct rpdev_drvdata *drvdata;
+
+	drvdata = dev_get_drvdata(&rpdev->dev);
+	if (drvdata && drvdata->protocol_fixed_up)
+		msg = drvdata->protocol_fixed_up->recv_fixed_up(rpdev, data);
+
+	if (!msg || !drvdata)
+		return -EINVAL;
+
+	if (msg->port_idx < MAX_PORT_PER_CHANNEL)
+		port = drvdata->channel_devices[msg->port_idx];
+
+	if (!port || msg->line >= port->ngpios) {
+		dev_err(&rpdev->dev, "wrong port index or line number. port:%d line:%d\n",
+			msg->port_idx, msg->line);
+		return -EINVAL;
+	}
+
+	if (msg->type == GPIO_RPMSG_REPLY) {
+		*port->info.reply_msg = *msg;
+		complete(&port->info.cmd_complete);
+	} else if (msg->type == GPIO_RPMSG_NOTIFY) {
+		generic_handle_domain_irq_safe(port->gc.irq.domain, msg->line);
+	} else {
+		dev_err(&rpdev->dev, "wrong command type (0x%x)\n", msg->type);
+	}
+
+	return 0;
+}
+
+static int rpmsg_gpio_channel_probe(struct rpmsg_device *rpdev)
+{
+	struct device *dev = &rpdev->dev;
+	struct rpdev_drvdata *drvdata;
+	struct device_node *np;
+	int ret = -ENODEV;
+
+	if (!dev->of_node) {
+		np = rpmsg_get_channel_ofnode(rpdev, rpdev->id.name);
+		if (np) {
+			dev->of_node = np;
+			set_primary_fwnode(dev, of_fwnode_handle(np));
+		}
+		return -EPROBE_DEFER;
+	}
+
+	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
+	if (!drvdata)
+		return -ENOMEM;
+
+	drvdata->rproc_name = rpmsg_get_rproc_node_name(rpdev);
+	drvdata->protocol_fixed_up = (struct rpmsg_gpio_fixed_up *)rpdev->id.driver_data;
+	dev_set_drvdata(dev, drvdata);
+
+	for_each_child_of_node_scoped(dev->of_node, child) {
+		if (!of_device_is_available(child))
+			continue;
+
+		if (!of_match_node(dev->driver->of_match_table, child))
+			continue;
+
+		ret = rpmsg_gpiochip_register(rpdev, child);
+		if (ret < 0)
+			break;
+	}
+
+	return ret;
+}
+
+static const struct of_device_id rpmsg_gpio_dt_ids[] = {
+	{ .compatible = "rpmsg-gpio" },
+	{ /* sentinel */ }
+};
+
+static struct rpmsg_device_id rpmsg_gpio_channel_id_table[] = {
+	{ .name = "rpmsg-io" },
+	{ },
+};
+MODULE_DEVICE_TABLE(rpmsg, rpmsg_gpio_channel_id_table);
+
+static struct rpmsg_driver rpmsg_gpio_channel_client = {
+	.callback	= rpmsg_gpio_channel_callback,
+	.id_table	= rpmsg_gpio_channel_id_table,
+	.probe		= rpmsg_gpio_channel_probe,
+	.drv		= {
+		.name	= KBUILD_MODNAME,
+		.of_match_table = rpmsg_gpio_dt_ids,
+	},
+};
+module_rpmsg_driver(rpmsg_gpio_channel_client);
+
+MODULE_AUTHOR("Shenwei Wang <shenwei.wang@nxp.com>");
+MODULE_DESCRIPTION("generic rpmsg gpio driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0


