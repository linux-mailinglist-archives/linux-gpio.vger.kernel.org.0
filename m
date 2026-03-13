Return-Path: <linux-gpio+bounces-33397-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aD0OJMRstGmWnwAAu9opvQ
	(envelope-from <linux-gpio+bounces-33397-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 21:00:04 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDB828981C
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 21:00:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2FF6E3232D73
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 19:58:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D365E3E1CE4;
	Fri, 13 Mar 2026 19:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CEpLObsA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012009.outbound.protection.outlook.com [52.101.66.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305D239769C;
	Fri, 13 Mar 2026 19:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773431927; cv=fail; b=vADgggiT4TnqjaeLOLnfNif3AFtBPzQH4XAvaqfsYJviVF/y83h2D5MxR7aWoo4Nb2YpAge6NAILkiJfUUtOdz5DsXMNYTBXDaJLHH/n3gm0i67dtYXfOQsexmhcdche8KfxLhAhUkiqchNTim8fyZ2JxIZhepmHUwlUX2HL0Ak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773431927; c=relaxed/simple;
	bh=6SqKbix4u8uriJ/a6R0DzmkSlC3f9FELJK3PZKiIJaA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S+i8c2pbnpmP+jISUziyPmuDrw1a9Lcn3EGe0Vmx5Djz3juVzM4wnU6KLarUG5NmGwJ5ta+O8/4FdC+/MkV61z54GhQcdFYivWLJ56Vd//snxIxIriHM2CQl2wooe0NsaZZP1K7P+/xgZwiG1zIOaZ9mXpCTF2wzaD6q5s0kEok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CEpLObsA; arc=fail smtp.client-ip=52.101.66.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hLrld5/ttrn8jmNpMNxmcYbspYTpApkj0hjvkhVqEllQJ0YplROg3ofUsn6B062Kh+AS+obI+lR2bzSHvp53HdbvmSdI1jHRP9nsMECqOiF1CiuGe887ZjUuTLvXDci3nZQ+hMuqIJSoEC+oyZqiKJOVgV1daYKQGB9bw5A6mf1ehZG6doaLb/aCkBlWgPHOE+4ujIcfqTY4Df2IMChRXtTtZRPtir5L/Yrr2l12NLlURUBMUCHtHL20NISdERCHJQOO07UuCAfguZJgURcQ2ZBgeKDr6od6KJ+XXY0/wEV3pQ7tyODk9RTQhhy3YFQd4F7SjZdlq6GxZiC6CiEkSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vHjn70swDdWLLv2zCNEtQPoHvvD+r5yGSKfMbd2+X74=;
 b=c14jQUZ1L/PtK7WFeKKmYwJ+wOmy2rAYW0kayLUEuxn70S+hNAv68ZJi59qMuWAQQcE3ae0UGgrwmjMeUPXRAiqezTqJ2sJSDa/xYNtLd+PFIOPhZa3jmKPo4e83Yt61wzOPTRxqKzLzJt/TeUcs3yaV3ZaOiGQRk0ku5u8n3bnHbCBnGmoBc9z7mvh9dHb/CYgs4rEscVjFgk0dOD1RXjt3znYF2lLfSzfoC/dMy1XSGVDIdYjYlCY3C7Xb+1B1WHW/UQWYPG0cgMok0VAFSmOpPoMlPFChCxKhByW85tkSOaKxBW86faVKGzUVahYt/nPHxA5pEwdm0x2gliAtbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vHjn70swDdWLLv2zCNEtQPoHvvD+r5yGSKfMbd2+X74=;
 b=CEpLObsA1DxUQR5HXt9eBQjXvPHrImi6xawjeg8R7DSNwgZGKfdEvuR6AIW788MuOUuXw5bMATw77IP2Oc9BkwCKvS6BCYLy15ic+nNYvntOnqbjUp82JKswkPHsMXKCWQIwe3zlqirMuJXiKrNz2FDzXZrlRCn49mJYXBqmlM8mikWJgUZGpcOHcwNy5aXgSfD5zHxLgGfREGhkuwzq2XLhJUs3qlmxNkDAItwY4SY76qruaFf67l9LcTYVWwc5BT4NEbqTTS5mYCeSf24Ir1OntKlY90pdUAtK15/amRPg6v2z+ug5cSMqagPCCnwfcPMNtKGc4GGobHYXCk+H/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by AS8PR04MB8755.eurprd04.prod.outlook.com (2603:10a6:20b:42e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Fri, 13 Mar
 2026 19:58:40 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9700.013; Fri, 13 Mar 2026
 19:58:39 +0000
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
	linux-imx@nxp.com
Subject: [PATCH v12 2/5] dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
Date: Fri, 13 Mar 2026 14:57:58 -0500
Message-ID: <20260313195801.2043306-3-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313195801.2043306-1-shenwei.wang@nxp.com>
References: <20260313195801.2043306-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0162.namprd05.prod.outlook.com
 (2603:10b6:a03:339::17) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|AS8PR04MB8755:EE_
X-MS-Office365-Filtering-Correlation-Id: 4870aee7-bd16-43f9-8769-08de813aeab7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|1800799024|366016|18002099003|22082099003|56012099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	7FBvKJ0XcvbHgmOxU/UhezrM0KBbsm2IupAcNAI1oM64/UdIL/LV/+vLHFEC2ttRW+qTaoygysyGbq2bmfREvV4bF/9nl9w2AlPKZSY3i/L2/3ubkZDIHx1yfd4jaoW3sraZ0AswnkXjQZhrDeGO64TCup++jVorDTEDmZj2Nz5VhA3MYCzqzB1CMDRAiLVWXc8aCFlSY9uhbJVPJgAewd3pewZPhIXqlVDsy/3nyN3tWUCERHN4rgvSv/7oeRRFSz+LQLp7RYJbqvbM4I8g7BZeVNaVuD5cAlgVi6oMEaco5YyOmWNRRi6HNitkKfghYH7W9IPecojxxAw+qxzbdMnd3YgjlnjG8lQyXBmFEDw1zWZ+If+ekYDYNEEm9n1odm84SwAWeiZHbWMrQKzME88FUJT+sdq8p8QGsM//sOqE9CijrlpeCGvzk3rYR3uMA+vccGeO8kxXwpOmeybY36KwyMN3yMMOB9G7asgPkuBXH1T1+7mCtLOv0aG7J7IWo9DhSRfIEAS1ISanTCikdMD0apL54zqxDA6tZ4yxa0nY9Nrmfq34dVB/1isfARkPUM4gW1T1y0veo2p0sJVSMAS0c2HfxaDCv46ekJVM5hbpGrOJJQKyM8X6Ax2vYZAviarEwHNyK+7tmoYJNod518GYw8fmx1XxkkHgORaaP05lDI+hauc451dpKy2hoAleyutoRbY/VPWdVxCGpNnIRjGNwe89wHDVop0vq6yyD9g5S2aPrG7jpcocY7nLZ0BE/ukbMlU8/Cy1kJwF2ykFsw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(1800799024)(366016)(18002099003)(22082099003)(56012099003)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iPxylTomIJlAG9r7mrlAiqxngSgDCrvaxkxMrm3j2KmxLxA1AyI1YCXDlUku?=
 =?us-ascii?Q?Clb6or5lNY85k+2Ns91BWd/mdTnjAv5Tw7EP135Hhcq5YN2AuO+iB3beK621?=
 =?us-ascii?Q?5A/1JwZa8USgezrNBH+XuvcIZNlXy5qYDfWuuPdabiuNFt0qhRIklt0A/UsI?=
 =?us-ascii?Q?Yzm6q1LvJLC9rWweI3SeKGvZ8puE50V2I4NqMPGqnAcK7opsHtcrkpF4rBPD?=
 =?us-ascii?Q?yY060waMWriPkxlWVjXIbW0WOIZTze9+gqx14eauHr03Q+f7Jns5atJRu7qm?=
 =?us-ascii?Q?y42gsiGlh9UOqIAcglU3zLrepnDgBpUkniRXMXOfQToVik/5iNKZvfOB3MSP?=
 =?us-ascii?Q?Ai2unWuZzMVJ/1GSlr+0lVR888tnizJP103OiHUmFAEVdSHM5jK82gSfUSc+?=
 =?us-ascii?Q?wpZmbmwHiemyntvNdp5YRDS8f5UWkWQK76IPEaajopWTruCyAJ4nAY6wW//5?=
 =?us-ascii?Q?m4/B/dkdjgK9kOeqW7etZCGPy1JaHr3xAfhaErpH4HQWV2cxJyrJO+wTOCCm?=
 =?us-ascii?Q?a3Bcq1vBoyTHXJaXpc/dz0/GKq/QLNQshf5264TWGEaYySpcCodS5hnDqvlY?=
 =?us-ascii?Q?PgfoAL2LBupNwBLnAV6GaACZ5DgTjAYtuEhPohQ1rMnXJcHI6goOCRRa+kEN?=
 =?us-ascii?Q?3V9ihNWPqXNZYy+L0jA7GeIxYPSAeB5sbC1f3bYo9SyoBWKuLEMtooN0pAqQ?=
 =?us-ascii?Q?5PPrFFU+tWKqHHuM5KFmJGvJF5S5W4CpjNliGQrA1eZjdTr/nrtAGr3rYUUi?=
 =?us-ascii?Q?cgLKYFBxQTgkYMkTikuzPAal6o0FQQB+TV7hB+4d12jKvXnx/hwPFaacX6B2?=
 =?us-ascii?Q?OqXMo2UovNYCmPnaZBkc48uDUsbHrwGFWXXR1kxqGCGKmLoJdojdwxBL1IX8?=
 =?us-ascii?Q?ItPRL73GVope2owsc1J6P7BJlJx2iRHNf/GoOnfyHHfJNPhwMSWLBay9zLS9?=
 =?us-ascii?Q?pbbcDOIG4mL03yTKaw0RtQsvhPNyOh55czgjQawmR84b/IjLaZd6ni8h11Xz?=
 =?us-ascii?Q?YwnsJsLRR+vZIOnpSYgiOgzT+M2kTOeAS5QpEDtwEyFDeK59ino5STZlcctG?=
 =?us-ascii?Q?BRPylbUQPJrFGZZ5LoIJ0+egJA7YQLwQyXWaUw0FtVH3Dm0BsXR+ZC0S/FlX?=
 =?us-ascii?Q?nHTs4Zq/FGr0JzIa2xuo88LcWZpRpUx+rWoZf2UsRN9sUUYHfoB17tK27jF1?=
 =?us-ascii?Q?XpmKtcRwW8jjFdq52XR8J2z73WLcouA0b6rznYwgmAxn99vWDZPPvDTWXcWp?=
 =?us-ascii?Q?g5+l/GFvZQ0WhkEIQFhFBUGgIcBfiO0aXVXm1yc9BQezNYjjAGvn3BzbpngB?=
 =?us-ascii?Q?D6orhfi4TVohDeqCsJViQ2coN37WtYhBLH887BPE50gH4AcieVg21ZQJlBh2?=
 =?us-ascii?Q?VIRwGS7z4C218YqeCvnXcoVOZ/76u0l1JLzIK0i3NotfISNISkn5eX2kqPcZ?=
 =?us-ascii?Q?QzJ6HUXeGXZox2XrJvC/Lalrp2ky6nEP1ad/ggyrk92n4RkOhDdm/f2MSqjD?=
 =?us-ascii?Q?liBv1GR9oR5lMOIp8L4GOJMXcMf8/Qflvv6sHx+3h4phlp4WKs/Kx9xjXKzW?=
 =?us-ascii?Q?41ZCD6rPPSXkL4STKX34mUwSFNM5AlDpNmfe9SVX5R0KGoSkF3bRb37t2YDc?=
 =?us-ascii?Q?v78gkoHRBiNbYOgLNpB6TbtdkFJ/9+VvyVo9AZwo5ZOW+jdfOdAnz7xLT3tw?=
 =?us-ascii?Q?MWd/WUuhP28eAHeJt3ZM2gCKb446BJlM5Cx5UVQKC1Nw8nP2m/kC2S+Q8AWC?=
 =?us-ascii?Q?s72yNAlb0g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4870aee7-bd16-43f9-8769-08de813aeab7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 19:58:38.8576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L7xPRjfkez2K9FIKY5kvpQOeIjKarJBRXQUkSVyZU7RQM+wQQAdRtcmraqX9Ao5BzWhNTcIgr3s/esTMGkb9yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8755
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33397-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.0:email,devicetree.org:url,0.0.0.1:email,nxp.com:dkim,nxp.com:email,nxp.com:mid]
X-Rspamd-Queue-Id: 3EDB828981C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remote processors may announce multiple GPIO controllers over an RPMSG
channel. These GPIO controllers may require corresponding device tree
nodes, especially when acting as providers, to supply phandles for their
consumers.

Define an RPMSG node to work as a container for a group of RPMSG channels
under the imx_rproc node. Each subnode within "rpmsg" represents an
individual RPMSG channel. The name of each subnode corresponds to the
channel name as defined by the remote processor.

All remote devices associated with a given channel are defined as child
nodes under the corresponding channel node.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 .../devicetree/bindings/gpio/gpio-rpmsg.yaml  | 55 +++++++++++++++++++
 .../bindings/remoteproc/fsl,imx-rproc.yaml    | 53 ++++++++++++++++++
 2 files changed, 108 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml b/Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
new file mode 100644
index 000000000000..6c78b6850321
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/gpio-rpmsg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic RPMSG GPIO Controller
+
+maintainers:
+  - Shenwei Wang <shenwei.wang@nxp.com>
+
+description:
+  On an AMP platform, some GPIO controllers are exposed by the remote processor
+  through the RPMSG bus. The RPMSG GPIO transport protocol defines the packet
+  structure and communication flow between Linux and the remote firmware. Those
+  controllers are managed via this transport protocol. For more details of the
+  protocol, check the document below.
+  Documentation/driver-api/gpio/gpio-rpmsg.rst
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - fsl,rpmsg-gpio
+          - const: rpmsg-gpio
+      - const: rpmsg-gpio
+
+  reg:
+    description:
+      The reg property represents the index of the GPIO controllers. Since
+      the driver manages controllers on a remote system, this index tells
+      the remote system which controller to operate.
+    maxItems: 1
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-controller: true
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - "#gpio-cells"
+  - "#interrupt-cells"
+
+allOf:
+  - $ref: /schemas/gpio/gpio.yaml#
+
+unevaluatedProperties: false
diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index ce8ec0119469..88281ffc18ca 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -85,6 +85,34 @@ properties:
       This property is to specify the resource id of the remote processor in SoC
       which supports SCFW
 
+  rpmsg:
+    type: object
+    additionalProperties: false
+    description:
+      Represents the RPMSG bus between Linux and the remote system. Contains
+      a group of RPMSG channel devices running on the bus.
+
+    properties:
+      rpmsg-io-channel:
+        type: object
+        additionalProperties: false
+        properties:
+          '#address-cells':
+            const: 1
+
+          '#size-cells':
+            const: 0
+
+        patternProperties:
+          "gpio@[0-9a-f]+$":
+            type: object
+            $ref: /schemas/gpio/gpio-rpmsg.yaml#
+            unevaluatedProperties: false
+
+        required:
+          - '#address-cells'
+          - '#size-cells'
+
 required:
   - compatible
 
@@ -147,5 +175,30 @@ examples:
                 &mu 3 1>;
       memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>, <&rsc_table>;
       syscon = <&src>;
+
+      rpmsg {
+        rpmsg-io-channel {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          gpio@0 {
+            compatible = "rpmsg-gpio";
+            reg = <0>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            #interrupt-cells = <2>;
+            interrupt-controller;
+          };
+
+          gpio@1 {
+            compatible = "rpmsg-gpio";
+            reg = <1>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            #interrupt-cells = <2>;
+            interrupt-controller;
+          };
+        };
+      };
     };
 ...
-- 
2.43.0


