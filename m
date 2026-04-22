Return-Path: <linux-gpio+bounces-35379-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yC7JK0M/6WmEWQIAu9opvQ
	(envelope-from <linux-gpio+bounces-35379-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 23:36:03 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CA08144AFBB
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 23:36:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1B01311B327
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 21:30:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 306EC377554;
	Wed, 22 Apr 2026 21:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="J4qc3Jpf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012068.outbound.protection.outlook.com [52.101.66.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8028B376BD3;
	Wed, 22 Apr 2026 21:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776893437; cv=fail; b=c49iKOTu2Q+cYWqRl6Rh/drnlrml5AmTmJmObI7t9WVUKg8PvMAhxLASfYROhDk2iQsNgY6lg7E00RyYgzIJTOTEXsZS6Opp9nSIXGfMzRqqrRy2tK5G89L/dQfoaMrxIQ4uQG3+ReF9+ew/QrVDmkE3T8wSqQbMdYPZvD6oiEM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776893437; c=relaxed/simple;
	bh=0S6/K6qkz76UWjihsJ5CTy9c2nUqNU5nYbTyEIwrfto=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aEUxWEnFumFWX0DVrXmzDko+O8Fjj9FhT0FS7VF1R6JJqaJkX4K/UiHKKyG7yT2iXrGtml3Z2wvk51wOjsvz+bevw0CpdigVPep5L/VJWpd3oCpLM9es4DdGumlU5GTEZNA/yoAQd+8JMvAoxnPybR8FxZrwx7eTdvdkaqpoDgo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=J4qc3Jpf; arc=fail smtp.client-ip=52.101.66.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p8uTGU23q4x7hDn/r4P8/hl81dZySQGkK4lg28xaj6IZXWTFl2mvvw6VtTNbvIVhSIgnQ5nwSAPDrAdFRZpJBofJfj3Ui7uA0CfdVhW2G1Z6du8Ndpo3v6SkVq6HVoDKeOFcPy7kXoctk+aBYBn3biB/EMDLuhe4fSWtbh73kCqldABs5UFb311+3U0Kv+voy7LWed7PVc4zqOLS8+SV4IQQc2u6U1OfdaMENQs5RpqTDPYLWk1Yo32X/tBkgJaIQV3a2ciRy1lI4TDWdHf3OYzTfVkhSnOlGuD4Xzdz0CA328fXlXgAihNvcnjdP+IOIdhNwLJZX/AfyCZ4ZghPpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q7ZLdTZDWYa0Zb8fpFZNgzbDtVk0sb4LTog2d7uxCPQ=;
 b=f/4o8+Gi3CZzYhq8ROWZY0nMwmlAYlckUVGYAGZcPrUd8CbP1VhQYQglN8VQUoHWQovDj4Og4smNAc43UPcFfWC6KoWfSUVruMy3aJ2ymDUaDIJ4DHhJ43l7gnlJ6j80FPoUhCiFkIfUHd35Rm+heQzPZVgixKVqrVitQ1x5zODw+cM9PKHyc4o5FBQvW5wyDIHpRcXHwf+b8GeyVLQqbAXZKQ/izM0Z+JtR81mRhayEELCJaSouw+mMseXYgRjH98vEwp9Sm4I8Qt+PK2WUrHiJPMzlOYTPfV7iJ8+1nSCa0Q8++k5vToScXjOIL8znN2Z9vIkjBbQvFAjpR4xmWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q7ZLdTZDWYa0Zb8fpFZNgzbDtVk0sb4LTog2d7uxCPQ=;
 b=J4qc3JpfSK07l/T1ypIfG1w9ge0Np1LyMe0Rt56okh2LOS11wsWT9HLiWZjags8Jt2NuYJ/Q6suxYMOfgONDjn6YqE+5IipN4NumRnpEEfHeJ5dkzhqSxcqpTWrBomDw88AVDBn28qzuCEl/U0LMFdr0m+Hj3G+WrTM0HCfGk7gPxF0UrMKROTf2FA1SuXqKw43ZgEwaSuznK6vHUjC2i9E5I+7wxLKmkHvPm25aDjbH4ad8YCH1hIEcZ0A8spx0utARGUT1cGYnDjBfKHosd+uo4FlKU5VgcTTgYIZeQHWGOl5L3I68h4RjcARlI0ySGeGfheD3J/6yLSx2cJptJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9176.eurprd04.prod.outlook.com (2603:10a6:20b:44b::7)
 by DU2PR04MB8870.eurprd04.prod.outlook.com (2603:10a6:10:2e1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Wed, 22 Apr
 2026 21:30:33 +0000
Received: from AS8PR04MB9176.eurprd04.prod.outlook.com
 ([fe80::ba87:1cd1:53d9:fcd7]) by AS8PR04MB9176.eurprd04.prod.outlook.com
 ([fe80::ba87:1cd1:53d9:fcd7%6]) with mapi id 15.20.9846.019; Wed, 22 Apr 2026
 21:30:33 +0000
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
Subject: [PATCH v13 4/4] arm64: dts: imx8ulp: Add rpmsg node under imx_rproc
Date: Wed, 22 Apr 2026 16:28:49 -0500
Message-ID: <20260422212849.1240591-5-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260422212849.1240591-1-shenwei.wang@nxp.com>
References: <20260422212849.1240591-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA1PR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:806:2d2::22) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9176:EE_|DU2PR04MB8870:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fc6dbe4-9b1e-4791-feb8-08dea0b662ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|7416014|1800799024|19092799006|18002099003|921020|38350700014|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	s6XrvE4W2VxVAHufFIPps+Ljht7+VW0jcjWD8ol4TY5lcmIGC15yniavhFKk+tBrCLHqEvTx6W3LcmBROCR8vlvHrWgrZK8v97RV23E/yn+KGd0bGIo7mFXDfsl/YtT54yvcp6wUWMuYT6pHWBEfkdCVhaISGS8o3Je7yCkvhPnXPrto6PbnrjHSCAzvnznHAHp3SG/EDQSj8rjCWxij5kYv8OoTqFgSaNDhxQriMEDhhBTYnIw9OnAT/Rut0OqvrPjAe9vAt7ekw0cA21uYWFZpYW7xIQ2gAYHazffmCCiMPH+FX1aMa6UKpN+AAUUr5fOGe7qAKteTU0nakyK85N2VrvvBlVrXbL8N8i/s9qlFXT0y04hE9sHRNZKRIZPA0ljaTsdMn6Q/BogPqC2SRnqej7QNdHJ1Hug4fwVPFsIwqOAQBmqVxGWBJAQj/RfAJ+hxSZppOx4irWfyw//YdWqb28gvaEJR/Z8LJSSg6VPwHJ2Shm7eFovy4M26Ra7QcUMHCeD80gak4rU4kBC4DbMFh2LDTYZS1LjwJ4N5XW1zwniwktINkVYhceIw/lMxwPc9Y1uK1QJgzxKvDg/nYfzTROFDqxUTjN6UfRQ+Q6ngznU3qvEJBKRI8fqfynKI9s5Q6f1LlLSW4o7whwG/EbbpWjaStI2nGkbLfsX6VF4TzxbROpzFPvglUBq8ZL0IPYdwIl2BaydsXAPlESujnWpaD+O3QXvjV3UakAl96QhYaK7BksKS13tIVrEykxj0S6w1AGL7vfD7ADtW2O11IytmROmrfPsujUGoK1kGE046yLFlebBQtVPm2eqgJo4R
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9176.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(1800799024)(19092799006)(18002099003)(921020)(38350700014)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8jhcxlileYk00c/Mxp7iqfJkRn5BSoDhJLzG/gdxFVZFWTh7v8R6QqzAi07q?=
 =?us-ascii?Q?1dXb9leX9IRPqIuq/SOJVvVTVCvF9Z9xZC+pKzwCrwMI3zXUPEIr/Z+l3JML?=
 =?us-ascii?Q?YOr/W6oPE3EOETjAFzKe13+s5cYgYraEwPAwJ9SN/JcB1EkgHnre6YL1fS42?=
 =?us-ascii?Q?T6yMpkYKmqkCG7QwahM3t5v9IUDjv9FkiMcpdMNVP5E6ZWLbClRp4kC+AYyw?=
 =?us-ascii?Q?pWsZhoPdCHsmFUk1Rn/25DCy/eY5K0R3Ep+zDff7lBrI8PO9CG3zJHGx1SAF?=
 =?us-ascii?Q?itoGtTTMzM0W5G9LrVaQ2ESqfiTef1Totz1AuuVZMN5fHUOnjUeHPXwOWCsz?=
 =?us-ascii?Q?4PqEKxPy5YSWHyuPcqxRWnRBMhuzeDhOg+Vm+mm7yHtKdPgXCGgR3VTh5Smu?=
 =?us-ascii?Q?ZE2RidBR8geLDXE9kMf6/FUhiEHpV2mS4C1pK9+7E5E9ckr+a5YdK0RkkjMF?=
 =?us-ascii?Q?kFEZ7CQOlZ7R0FxSXV3bF8hcphtYxs2t8MjsTt486WEuFz4rXlsh5J+DdWhL?=
 =?us-ascii?Q?a3WraNxG6MDAiw5JGBCuXGBr7aRFYuf7+vXvhcJxOuF+kioMAtlMw0TNl3zg?=
 =?us-ascii?Q?qefqOp7zlx8ogSRksDLdafeqEHg9jKfvsMkIrqxDhIY1+ZAxRzCLFPY0+s+V?=
 =?us-ascii?Q?e3NbYMsC0CBGV3jJI7+5fUjlwpZao7TZQr9S8ioeKZtkWC6xnY1AjJipL3cC?=
 =?us-ascii?Q?Jgz6LFs+fqKI0SQgYh0uCai0+NLpsLWVfXlAMavGCPbjwW5oXJfLeT2A/JYh?=
 =?us-ascii?Q?2Ca5QaA3JTUkomuyz9/OYgPohI2RLiPtA9Duyb32dDF/MGKc+atrujbSMIVa?=
 =?us-ascii?Q?Ta9c3aEyLEMOGaoM9l5EabFE34bfCdBvf53o8m3qheGdmV9joNi6G0mCas81?=
 =?us-ascii?Q?XP9vtxmy+N5lmIZNuyVzl6Be4hKSxnxuOnRFuYCJDka79Lme2WLn+mTrKLgz?=
 =?us-ascii?Q?cUU4QttUK5a8akGIYL50yNkhOKYBWspGGncYzLXfgmCBpxCa78sVX/CES9E6?=
 =?us-ascii?Q?6eqpPRmhsr5eD8+1fWYYv6or2VYwiJhlXIxM+JW2CmkyEj5kFtQxkBgkRcaC?=
 =?us-ascii?Q?qF2qV1z6pXYQ9hSQfaDHvZtUT7sfho7KSfa0o+4rnLIBgYL0Fata0ygXNLKK?=
 =?us-ascii?Q?cPMrgAKJ0igfpQD0GqoJcvyeVjRugQAOl03Q+AzrGxeVi6qjIpw2j3dVu++T?=
 =?us-ascii?Q?eZdDNDDGHdgu7KrJhQSb7i5lLiGttmNNEuib3Nt9190A0crv2otFnsVC556I?=
 =?us-ascii?Q?kxkSOr5sPYP9fK1CHnupM5uj+iPyGxAIisMSZQJOKhpQsl8lBaL/wQo5FPJ+?=
 =?us-ascii?Q?JEL5HGXaVj8HwHnh32IZPy3B5EvUSoDSbZ+S2JpUwv1FsCyrGEkklVlXtjdM?=
 =?us-ascii?Q?ktNGRALIBEuGcJfsTf1AKszvPh6HYvGTybH5Hgnz3/0wke0G//lVqJROr4Ni?=
 =?us-ascii?Q?91GrisHy87kzJD8cwcq6YtIxqGRThedUzohDuV156rPKhPU5d4Gb8GoKD3hb?=
 =?us-ascii?Q?ffYeqewtjduYZB2mOP7U1A7xOYXXrh7UQva0pi6+747GTh3TcoKtNBKihZlP?=
 =?us-ascii?Q?ThhbcqPSRusuBfFA366QZ+IImdhlhedpLx75Bew+7LzYOWv8//Bn3bf6o9tS?=
 =?us-ascii?Q?HTOmh9Qx0BCGUqRaRuf0bDYg9Bwt/ByblH1m6+h8PI6nA4ffkiQuPapcQ+I0?=
 =?us-ascii?Q?ErrsLfshqhTOk3YEOaJ0iNqNS/wQL2f2K4f9XuB6Mgs/4KO/W0D0knaX6vVH?=
 =?us-ascii?Q?9Tz1nTRWhg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fc6dbe4-9b1e-4791-feb8-08dea0b662ad
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 21:30:33.7139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AfWw5VI1EA80zcovJWAO1SB6B87pZkrUXqM6rkV4NB22smr8fIvMPuAyVTXi0VoW+L+T86Y5+UYhmI4F/LVguA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8870
X-Spamd-Result: default: False [7.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35379-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[nxp.com:s=selector1];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org];
	DMARC_POLICY_ALLOW(0.00)[nxp.com,none];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@nxp.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	R_SPF_ALLOW(0.00)[+ip4:172.234.253.10:c];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.210];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: CA08144AFBB
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

Add the RPMSG bus node along with its GPIO subnodes to the device
tree.

Enable remote device communication and GPIO control via RPMSG on
the i.MX platform.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 1de3ad60c6aa..f1b984eb1203 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -190,6 +190,31 @@ scmi_sensor: protocol@15 {
 	cm33: remoteproc-cm33 {
 		compatible = "fsl,imx8ulp-cm33";
 		status = "disabled";
+
+		rpmsg {
+			rpmsg-io {
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


