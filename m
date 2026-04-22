Return-Path: <linux-gpio+bounces-35377-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DLGKShB6WksWwIAu9opvQ
	(envelope-from <linux-gpio+bounces-35377-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 23:44:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D4844B0C7
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 23:44:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A08830FFFD3
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 21:30:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A71AB376BD3;
	Wed, 22 Apr 2026 21:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="k+VzkdU9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010042.outbound.protection.outlook.com [52.101.84.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5175374E40;
	Wed, 22 Apr 2026 21:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776893429; cv=fail; b=cuc1cLqkWdxUhzQuVJrZGU8fs60S/ABqRNV1+dWNtSLGNC7azEzVvSRCQaX3kx5CwjpLvfAUrcftC2goTjRyPOALSki9Ez+W7lHkRq113pgdAX0Ter+6bqBXUM57xhbtvLSFGeOXDCamDJIDALmvZtyUtkxmcXrsP6QuygRyx9M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776893429; c=relaxed/simple;
	bh=Luozaj66/zYH2HrWyW1DkBCoVwv8KNO97+wq9qGdYQA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=W/T8H5mUe9ETfNV/5X+2IJn/FvVT1HSk+7fDWdeU+LakhkWFqf2ww4DMih4b8WvJ0bQW79dS2Go95fU8eY3VPC92Z1pfh8tqCfetqHqUAOpYGqBpy68udTm8SlF2Dx3PQeQpsLvbHBoNt2h/4wMrgesike9WgDZO+ddVt7egh+U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=k+VzkdU9; arc=fail smtp.client-ip=52.101.84.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ff7pzs3sNJbImUmbASzktJ1dwIXOsJL6mtAPPj5/GzcXznvXMZBrA5grTNUlm0+eY3+twIYx010FgfPTZCXmqnaAlyIfnstTfSv5vbs5p1JQPD5I4xe7/t83/q9eYW42mOEFA8KOocW1kZcUyCt6uNg3btqRZE9wk0qpDwVo4/9Fq537OxSu4Y7IOJLN98xDwwFmwdLGJss/Ob3gONAIyLO14+LtD99k5W2XqURzv1zqG8icQIHPQnPUmrI5eVnEnibfBqg540ErqoyA/A3gBjsfj445/LsXPRUXTdJT3PUr6D2N40BlP+/GlQ7DFgGcsSRi1BIh4GZp+LhPdzsseQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OyocYzYKTx/6S6qPDZZaBcYBo1tj1fmASl25eWMWw0s=;
 b=xmFZxwWZEfrW7tjvyc7ENlKy8W53eJog5ZTmVZk8LZzN3rZUBRdqE2+QPhVeequyDn8n9EDp0DOQCE1bWGYY1v5rU5G0geDoCD/nUjFgf2ykNI8WQdYJNKCdC/ev1WM6OZcry/o6BUiPH6ai2vIDIMbAxRFRCNmI5Pc95djAQ5Ju5fPMTiIdE258YmRWYHnXN+Jv5/D6+anikf7m6Gh2ldLsD/eMsWPAnnhoofnsAasEjlhyziwsSa7QaWGaDg2LozyfjrCwq07n830kYhq/PCMCT/u1Ua609Fx3pKiKatZJcAQ2Re3w9un6nmI5JNcNVxPWKkfYfPERcH80xpUTVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OyocYzYKTx/6S6qPDZZaBcYBo1tj1fmASl25eWMWw0s=;
 b=k+VzkdU9FEyKfAnDA80l/0R0fg8Gu0Ww0ESa6WpbFGCclBIuiKXf1cuOR0fIxm1bG4EnTivfR6/MGQL/hWCN5wMQg8ipSW2fbX3YpFiFmc72PsGTUfVu53xpnVVXX8ccoX4Epp8opMECZH9zrSABdWjICzFMauiV9OSIpakYJNJztjzIb3xy3TS6/9cqO/mKMpLs68wn2DAvG6dk02a8TrufQVD3mYg2N4Njnrpg9sk+7URsUCzrqkxfxziHTtZZBTOYLQXTMq3Vph2zM84dYDieqCSWW7oUpZ96HOgR3eH92z07o2Aa6JIRxP0Hb1fmmT+OTZ6uGXzByUTef0/9GA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9176.eurprd04.prod.outlook.com (2603:10a6:20b:44b::7)
 by DU2PR04MB8870.eurprd04.prod.outlook.com (2603:10a6:10:2e1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Wed, 22 Apr
 2026 21:30:24 +0000
Received: from AS8PR04MB9176.eurprd04.prod.outlook.com
 ([fe80::ba87:1cd1:53d9:fcd7]) by AS8PR04MB9176.eurprd04.prod.outlook.com
 ([fe80::ba87:1cd1:53d9:fcd7%6]) with mapi id 15.20.9846.019; Wed, 22 Apr 2026
 21:30:24 +0000
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
	Sascha Hauer <s.hauer@pengutronix.de>
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
Subject: [PATCH v13 2/4] dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
Date: Wed, 22 Apr 2026 16:28:47 -0500
Message-ID: <20260422212849.1240591-3-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260422212849.1240591-1-shenwei.wang@nxp.com>
References: <20260422212849.1240591-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN6PR2101CA0014.namprd21.prod.outlook.com
 (2603:10b6:805:106::24) To AS8PR04MB9176.eurprd04.prod.outlook.com
 (2603:10a6:20b:44b::7)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9176:EE_|DU2PR04MB8870:EE_
X-MS-Office365-Filtering-Correlation-Id: 32b31881-ca55-4cb7-8e34-08dea0b65d25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|7416014|1800799024|19092799006|18002099003|921020|38350700014|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	BmS9cyKdNJcKocvdnxWaJSedT6rgCKXcG7bT2kjJEI+WWMZxkTzj0Bb6DpneZYrf67QRaIoz8r2cDvpJ+glvQTWx5UwFj3Wb2sN059ud6eS9S+CjRHirSiYj1VVdBo9Pj0iJVdpI33U3o2nVIvKSA+t+O1o9EV8A/mjLxlPbFVQaXbmf/KMu/z+VpdxhunqXgwyPErEmaKrs+XjGXCCazh/Pi21dQ8/P+3xVat9W82WW8rQ+X+eKe0PyEcz/gdcJbave1djFnjU7PPJSMLIKM9UkDGDgxwf/APuH85zoZLGvvcuoBWHAG604t4rxy8BWhnmqM10kbzy9WAMFgakymUyAfdWceqhkAApohX1UU3hQz/fK3UNWG4CJGXK+HGiAwMMoFRByGYjCCzzQLFCleZbaUcpu+ZGFbXNQmgTLHZm8MEAWrjI4XVQQX1dXA0gkbf2Pe1NyEI6P+ExM3M1RRezYcoPaFbly/CsPyqfncy0Kzgs16oi5KPsHJOtGPTo9ugtRYoA8lma1wg/mn1UdFYvr8asBD3J13XBm4f2+XhzSXkt0ljc2TeOomGVv7qtxFIw9PFufNI7z9s9CJ4uj2mlCoBROrA1oNsmp0vBfXsF5FlO59MzpU7yN62vlLDEnwwdCIpTlnylg0EfbkLeexuFpG4480jR4oyvT5J1LKtnrBsLC7Epasl2J/EJgx5Omapb45vK4i7fLLLlK3TYmZv+ci0RRtfaBhVe489NhLo7k+oP+mndRwmS23G9mzziMemvTp5PcwnqTc86GzWh8lA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9176.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(1800799024)(19092799006)(18002099003)(921020)(38350700014)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AgIYmTdx/i/4JfDk4yKsgrxZieEKliBtm0SIj3h9dkf/KBtzx3pxbd3VbH5H?=
 =?us-ascii?Q?Ivgedf/H4vehx+3eBSYMdKJda1zdsKcCUnKvCDFuqZMp8lKhE4SKF29dU1HR?=
 =?us-ascii?Q?TsgrwE62CHYvZyQApEqjn0HMVTMrOOr4epq2Uhl+Gb84IQsHb/kgz5oxOJfO?=
 =?us-ascii?Q?6Wob5M9o9HnJZLJO0XGXSADYrbTOAIjovqZ8iZRHyz51ijdZPhnYmeU695pj?=
 =?us-ascii?Q?mCT5KC8WgPmmmgXIENpWd5aAEUrUyER69lbGegILJ/ebRub7MWfyfmXKwEAn?=
 =?us-ascii?Q?M7wO0m5j+Bmsi/CKNRiBmoCoBzx6rb9nNZL4BaQtJvZxA2beRgsbKgd664x9?=
 =?us-ascii?Q?KIxhNUHQjRZX/XNy5z9Hbx1G7tutS3KFLfc4Jgd6ntGj650iFnZ54oVVN8ay?=
 =?us-ascii?Q?WOa/J7UOFnufI0CcVGeKGHEOovEYB9/YJnkt1hdscY/gdPCjaqNRJpw0ZlAL?=
 =?us-ascii?Q?GDuJog3aGJkV1YjHviksEAigAPP7Zun5PP1lGtFAv7AKllk1ZpA0d2pWdhgm?=
 =?us-ascii?Q?UeQ/Pku+tteRZkpHDh+6xTe1Ccapr+GjmNN2uG1YnDI52IE+zWaVrAkW9RZB?=
 =?us-ascii?Q?Ym8DBU9vN6FwwzSlUy3Ao9uh5QOWWACVe2G9Rnp1NFO+M2ippkoEH4Pr66vA?=
 =?us-ascii?Q?HvlTj4A4WvvpZGUXp7va6Nd5UrmH1Q3RsSvpCL9+p/Zlp+WsJ3eLup1g5vVa?=
 =?us-ascii?Q?l3IOyBzGXTJhfEJEOO8nQTt10F3t+YaPpDdbDHvAbZhwXV/kNv3WVeDkbZMs?=
 =?us-ascii?Q?bX4/QXxVPWlxoohfzDNDVddL2cxzZi+vx1VnKE4t366PyOeQgkgwNZaRCS2Z?=
 =?us-ascii?Q?s+597joh0dDDBYlgu233g4ZR0F2U8DDHisGyHdWR2LFq7YF26gW5HXLRIhh9?=
 =?us-ascii?Q?RCF5vCsyG6Q/EyfFn1LWJXq4+OOUUmgncNDqw2cwjhdagVgc7qkBOyhb7buh?=
 =?us-ascii?Q?DoY7kVsImgQthVTd2Z7W5gJUE24pz1T9LKzdWIeQ3+gjcbwjsOQHs1BSYrTP?=
 =?us-ascii?Q?ku+e2pz13Csi5ibB3Xer/UwPuWRcViATIOyQ7KM0/P/lSubBCHGzngO9n+VA?=
 =?us-ascii?Q?2MBJtllXEcVuGOsMcehcX2s/wiC2FpCN8ok0MjSwo6EiIS5+GxzIX8MEvyaw?=
 =?us-ascii?Q?Qx7xCEO3U+4faw8u+OIQjkqdDdnpJFEggNWcaJpfRkhVVOyhyir/rHx0IeFv?=
 =?us-ascii?Q?ToftZVml05uPnP6RnIEujHtB5ZP3ZtNbX7A35JACkwvm6Pb/52RrerT7qgbH?=
 =?us-ascii?Q?ybh/HA+X//lbrqP6TbDJpsFQLcZdKM09Y0C+7GCpVzTGYmw2456jaExz/tT+?=
 =?us-ascii?Q?aIEb1EhaiFqNylZVUTqMl+Jiqd8d+Oyw6JNzmPQKVZpFblnDCO0f0MlITnam?=
 =?us-ascii?Q?KPYNn+GZ2k9sh7H/OnGaplbSpmDTNYPcL/LGdNSbDTdvtQwf3reHC79Ym3Q4?=
 =?us-ascii?Q?uKwGQVnJ0HIIpVpsYuTw29PLF3qQJpYDCPGk5Tcnqt0BHvmb2D0mGmpGF3u+?=
 =?us-ascii?Q?AtxPU0kK7I4EQMlQWp77+J6b41X4HuPPDf0ycYLVskgEqJ4yhll/mIN9ikK5?=
 =?us-ascii?Q?Vr6+E7T4FHozFBzO3VUs7cOm2VnDpi3rpPOuzWldVT9B2IKkklhRcxRzTYbG?=
 =?us-ascii?Q?Rkmjqic1CMv1NdsIGA63YhO/3sOBZi0vxKJsIJscaF+mqyMHWazPfHxt5of8?=
 =?us-ascii?Q?3rxm5JI4f6iRYPtbzFm6pYJqUn8/leqkwxv03XVB9G49xyHJnlJuypN3/Zr2?=
 =?us-ascii?Q?PoDSnrbjfw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32b31881-ca55-4cb7-8e34-08dea0b65d25
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9176.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 21:30:24.2730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BY+mhXP9J2AiLqvAhxG9Va2fH7jpiAigr/2cy0cRqkjRX6Zd6cuYWUspjrXYlN1UeTcNF6baArndUHwVB2vYSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8870
X-Spamd-Result: default: False [7.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35377-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,body];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2600:3c0a:e001:db::12fc:5321:from];
	RCPT_COUNT_TWELVE(0.00)[23];
	R_DKIM_ALLOW(0.00)[nxp.com:s=selector1];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org];
	DMARC_POLICY_ALLOW(0.00)[nxp.com,none];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[52.101.84.42:received,2603:10a6:20b:44b::7:received];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@nxp.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c0a:e001:db::/64:c];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.472];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 00D4844B0C7
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

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
index ce8ec0119469..aea33205a881 100644
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
+      rpmsg-io:
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
+        rpmsg-io {
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


