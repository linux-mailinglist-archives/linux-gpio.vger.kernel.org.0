Return-Path: <linux-gpio+bounces-32858-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Ph+O540r2kPQQIAu9opvQ
	(envelope-from <linux-gpio+bounces-32858-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 21:59:10 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9562413F4
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 21:59:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A1AFD301B939
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Mar 2026 20:56:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E42B33ECBDB;
	Mon,  9 Mar 2026 20:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZA9TegaH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011011.outbound.protection.outlook.com [40.107.130.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BEB3EDAA6;
	Mon,  9 Mar 2026 20:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773089790; cv=fail; b=BEntQ37gYl5JEAXwMrA0P8i+J3YyCfoTKxVGVcWFLcyfVHNvff9ctQWpXXfqiByTHSl+gDxrWGaORlfWrMbHZZDICvs0e1SFS1ge0L5eZDBK8KA79cniv8+NX0RRvdqCil2yDSUpUIp1PZtm11j7FJCVD15HnTUiIPc9Gxg8qEw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773089790; c=relaxed/simple;
	bh=6GPsFy9zCNA4aOGX5lsr4ft8T8IqZh9Ce5RCYwC8o6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=F/pq9V4r8sCIh9XazvuTChn4rhRgSuUHiE+rLZMQcawRVOJ7M9mckxZSG8lQgtyfwe0AygRkIg4M7GSgupHeHgUuaIgc67zlXwZxcC+mWcKFx1O9nBprW1coHUUHKcEZjqo3Wh0J1z/hDS31s7rml0DS85mWT8cA8q0Rf+NDVnk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ZA9TegaH; arc=fail smtp.client-ip=40.107.130.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V4xsw/OF5l3vSp3wDY9Zclm73cw8Ipklm43BnysamGQTQF2eZ56/dRuUOir1X6m0f5y9ov7YRo+MGz3YSj9E5AKkNafZqcRVXFOT8FT4hgUCA8cscgfn6ZjHo1iQqUpdht8hIaG94IyIiOFGPRZq2aL8AEc93hTRxcNtHJStQNMJwq1+p00uV91pRHcCa0yq5mJZbw0aivfrGoBG2whcVA5ZoQinsvN2jA8YK45nNiGyirk0/Yvvj8n7HJ+2a1MOtm6hThzRzpQ8Beq3NScNQ8e1+WxoUdSRO+URmJH7zKd+uEAoqQFufoUSsfchOL7uKpmMO3mlJ3nEh7bi7LYPkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RC93O/9B2LylJvMbACxtTRweB3sixPckboUTpa+OTAc=;
 b=ANKaGeaeSTUu44D0tj2mtjgde6/zK6u2vbK/a2tESHZtDMtsmbzpO9jHX+frsfgT8ajqoHpBb3vnbuJ3s9OhyH0cnemzRiKIVxdiZDZbSDWIVXPqhoeQkLxyfhkBO2Ym2oU7ifejVJXxhM0ddwzsVlovon88oRxnNbageSGKSpcfGnXsKwm41BBZ5SsiC4fxUW4K8eWfzn77NIdIUrqgAbdCrkUSxSeZgniOOTzPGEgCu2l4GNK2Vr/l3mL105cSIkOQSBKNTkYNIiEF7vcmgPT1Fx125xvynrIbCi5sJaRT2Mr8s8OGMRshGL0YUngD4UivgxICvfjkLNec2LLlcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RC93O/9B2LylJvMbACxtTRweB3sixPckboUTpa+OTAc=;
 b=ZA9TegaHh4I+7lkygHuYT6GTqqR/G/Y3J3p9cBOOj7np2XsIU2C1JvnQl0rMUqjEOhe+6vPsfaNVQLHU9M5K9RjKNXxEU9M5XmDeFUPyQ8NDehL4MIOiB6xTq2FevSDrTmfDWMeFHKYnWl9DyghIw06Yn/fqD1niwTKMLtLgjTwST0yxCW/4xE0hNliHWdmgzLCoLM+iPE8pLYe6l+GcxwUqAOe1lxp4zE+w66TWhGfKrL2RuoIbGMx0srCsm/bmwG1uqsp5hoUybcrU8BeYweHUUlD/s4Gnv2i88JnIy95HDCcamZ/NnyKUQyDrKtAdD7C9ioDnOCL6Q0iCW1R7nw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by DBAPR04MB7335.eurprd04.prod.outlook.com (2603:10a6:10:1b1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 20:56:26 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9678.024; Mon, 9 Mar 2026
 20:56:26 +0000
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
Subject: [PATCH v10 5/5] arm64: dts: imx8ulp: Add rpmsg node under imx_rproc
Date: Mon,  9 Mar 2026 15:55:32 -0500
Message-ID: <20260309205532.1794202-6-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309205532.1794202-1-shenwei.wang@nxp.com>
References: <20260309205532.1794202-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN6PR08CA0031.namprd08.prod.outlook.com
 (2603:10b6:805:66::44) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|DBAPR04MB7335:EE_
X-MS-Office365-Filtering-Correlation-Id: 266dbdf8-ca80-4088-3efb-08de7e1e5440
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|19092799006|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	tsF1DaDu9CU/7mBqE+AMBd60Lsb4KDdDakK0NkI3adHUgce38K8Ur54goT/YXKpMfnXFQSV63yLBN/dVI53Qx+L6tHx/RVT/z278B/wRGRL36frADmzsc1u0fZe7BBBGYXrLKAydgFiYD0mUY6mmDShtmhyPvWZOkXjEmWce3BOTwAe3I//qyErzjCPZnEdwK9OxCetVLIwZ9eApan7kYMhtEfcLQkAQt4hLZ1ytCug2ImHdJUHa1jUI3l96xB5mIYQP8qBWBch9okMTV7W6TegUns5k40aLZ6Oc/JpOu0EiCEog5WSflcKg60CbswJplOg+zAS8Y9EMyjBn+iTKcsbk3pXHpqQMXcfmIDSEkpCHsgV3UiAU881UCNgBH9qvxMiZHp0geTGlp9r6iN9D4QMqt2azo7fm+bDIm8MYy75ThoaKLNMCFMPoqwbIZyxLauy76JOwmKgFn7cze1BQkl/qEBg91Bmmnclphf8jwkYqxywlmKSXP4LtCOsGLhrrXBZNnCScI+u3IQQPvDOQCS3GcZxibcHNDW8gqIZrlQwnjMqbSel4kaTXSESUdXwm/BMiYZFExPUrtFuiymqlCkaW9v6E/piQFSgWodY/bIjZvV7BOF7Dlypg2gInZ4OTW1muc1Xorck9MZOkzcqsHaLbkbOYd3uNwvotdA7hx8TCmSV6LewG+J8HRuFiJUs8JB2IowDvZkNYQA+w5goOcQYJiNa5iksSCT/3TbbENIqpqRnUE4Rgny9KUEJ+xZ/enKUeCL4A90bsUUs+5/9XqJ27dWNXdfBy4dmJ0wu3UjROXZuicjbD4sDZKq3JQLlZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(19092799006)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yYBWqXnMqP9KChauIS3tC7+ySwo7M1ZeV+A/exsJ6G9byOGvvmHlIq2t2ruw?=
 =?us-ascii?Q?vixBVO8SmdcizhaTTLovdXCSdZWaFW83XuZ7sw49xkgkoIXzJ5EgBwjlzC+N?=
 =?us-ascii?Q?Rh366AhvT2wrg3mhoQPt6WilUbkhFCWnytHROHCZ1QLCEQYu7WPWEIv8OH5q?=
 =?us-ascii?Q?YItau4HlCGQdbKLIoTa9mL8bvFPFxQOBToASeiiSJSfQ6uXXOJR6JVkqCCsV?=
 =?us-ascii?Q?D1fJOKGXF2OSAP1NOKHHQ237ier+0GuPuhFre5+sqEw66KisTaa0OYJ8AFbD?=
 =?us-ascii?Q?I8Mvt+Kak1H8IRsaKOw/NeBmfFMn0jZUMW7ggXVAcNRFghbYtU5cmvGPHbQH?=
 =?us-ascii?Q?VxfJdkXN+VmntNNcs3QUD3fz98wxURExIgvkyR/vVkDrsG4PLdrortnkF5Kj?=
 =?us-ascii?Q?oO27fZQaEtuKXGUeY8zviamPWYzr4bT4TwBZf9fZzhMddUnoulytMJObVibe?=
 =?us-ascii?Q?JGWuF+ap+dCCgifmaqNKljXpWAc3SV27v8IVxbam2bdrHbMfsikwk/QS4hHO?=
 =?us-ascii?Q?ANMaSfPOczmbfh51iELw4NrvaCG4oHfqzY1zDDGvkmnBoKtpQnFPU7cQ8PTX?=
 =?us-ascii?Q?ni5ElWv7q5sfrNj0P5Vu4oQVdkkxUKD0b+ZiuTUOk3lRVRAgVTy4kI+AwRh3?=
 =?us-ascii?Q?YTHgAYUFk31dn+j1unS8jMa+6JEdTaKSa+Y1BgkzyTootov/ZT/LYVrRnTgd?=
 =?us-ascii?Q?QZLa2DZMYbHRlTduqziGSnhB//XNsZsCCM3eYX2rYPaHv+poGOJzOqPC7AHW?=
 =?us-ascii?Q?ZZm1xMxciOI3IulUM3G9qj0wAHfA3mnngfiJkjx52k+RdwcPJR2uzB6Ndoiy?=
 =?us-ascii?Q?7h+1292UzRK0AByadk6TT8DuK7ND/YE/C/YCqSPQkOEUl7XIn2N5Ozv5aOGj?=
 =?us-ascii?Q?5zLisRcBzusxgMiQhVrQcjmBSadl734s4LqBJ4oEHdMNr0JSytKhMiYu/aB3?=
 =?us-ascii?Q?Rr1azbaPtuPeYyEwryvm7tPsTi9E3LOLzElmSBcFlrl5FlFUWgs6icRluofb?=
 =?us-ascii?Q?AUkq9rPE5Ccv6H/USVSikNNRFPjgikJAUV2NFS0X20QSRZKzkITWAB5rpo0t?=
 =?us-ascii?Q?H7WLeFGgwsQRFs81f6wBYh19G7vdY6O9PlUZZLrY7z7Pg6NjMGS89RIzDjVN?=
 =?us-ascii?Q?QR40ngBr4HNiD0M9krA8QNtVdZEAlg5K6akcWAwJTvxCITbHNBoJ8d7m2cRX?=
 =?us-ascii?Q?XPTuXt7jb7ykuAYvixzSsu7aNUx3mEJI4fVseXr00hhqfVUeu7m5guNRCC3r?=
 =?us-ascii?Q?qf7rmhNBW7gJmeIx76XBiii3ul2i6/CwnSyZ1FvzifuEKSqTWtQHOFvSd9rL?=
 =?us-ascii?Q?KRxz/9bA0RD7rFlptO4hRtCtwt3oUU5zFlDTni6LubbVyuXgyMlNYJo6Ex5O?=
 =?us-ascii?Q?JttRVOBGPXjXy8ZNXGDlGWAiBQ3YwSVI19hWFRBg/A30e4UMcqVlu6gStVTW?=
 =?us-ascii?Q?Mn93DFWNtTK8i6HTEYXilK/B84YqgnW+6JTvbZZCpdlAllwNqq8Ai+7xxzvk?=
 =?us-ascii?Q?HgVcUj8WSow+WXqpmChnsx2myxOe/wHgrHXHJid+3IUch+xKFKI4gpK1rRAa?=
 =?us-ascii?Q?nDNTo6WkLQa5mg8WWc7Kb6QCpXzxXcEyW6scwElcYvHtlsY4ajMZzPnit9Bx?=
 =?us-ascii?Q?gq9bBTHWfXY6cKSUM/P9agf2vqBlDZxTFRgXFZxdiXe+tvqVYIa3S6UuRc3g?=
 =?us-ascii?Q?uGaqE9Bo8E92M6nwy+cZzL2v9r6lVrEWCFUEUgfmy/NGrHNkUIYZ28jJqFE/?=
 =?us-ascii?Q?01YC7yhOjw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 266dbdf8-ca80-4088-3efb-08de7e1e5440
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 20:56:26.2465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oZtBKmQcSt2791tdaUYq0oofZMznitcLL2tc/p2dlFSpJNBowXWrafXTN4XIS3GIcHrJTVbqvy/DquVxNcxj2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7335
X-Rspamd-Queue-Id: 0C9562413F4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-32858-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[0.0.0.15:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,nxp.com:mid,i.mx:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,0.0.0.0:email,0.0.0.1:email]
X-Rspamd-Action: no action

Add the RPMSG bus node along with its GPIO subnodes to the device
tree.

Enable remote device communication and GPIO control via RPMSG on
the i.MX platform.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 9b5d98766512..ad1ef00a1e3d 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -191,6 +191,31 @@ scmi_sensor: protocol@15 {
 	cm33: remoteproc-cm33 {
 		compatible = "fsl,imx8ulp-cm33";
 		status = "disabled";
+
+		rpmsg {
+			rpmsg-io-channel {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				rpmsg_gpioa: gpio@0 {
+					compatible = "rpmsg-gpio";
+					reg = <0>;
+					gpio-controller;
+					#gpio-cells = <2>;
+					#interrupt-cells = <2>;
+					interrupt-controller;
+				};
+
+				rpmsg_gpiob: gpio@1 {
+					compatible = "rpmsg-gpio";
+					reg = <1>;
+					gpio-controller;
+					#gpio-cells = <2>;
+					#interrupt-cells = <2>;
+					interrupt-controller;
+				};
+			};
+		};
 	};
 
 	soc: soc@0 {
-- 
2.43.0


