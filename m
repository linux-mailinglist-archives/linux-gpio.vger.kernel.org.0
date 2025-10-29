Return-Path: <linux-gpio+bounces-27855-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FC9C1D1D1
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 21:00:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 671C158088D
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 19:59:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 750A4359FB3;
	Wed, 29 Oct 2025 19:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OVEuonPM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011010.outbound.protection.outlook.com [52.101.70.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615E236449E;
	Wed, 29 Oct 2025 19:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761767856; cv=fail; b=GfW+My1YjTOOD3twsAERVLMNAmgNAJaIyM8LwudcHc56ILg7rii0/fTP5SX8ECCAGQN1bPpu+NzuTE+rS4m/VWueI/yf934s/rWsPOYA1P3jF00YQq8WcxgRzh1WJ6CkSAgo9nyxKvWlNTuGRbo3ErS+TnYOgmLUGi05pfZZXco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761767856; c=relaxed/simple;
	bh=vGLhSV9HOD4MlWjPO5ELI7rFfhHl/ceGxaektFvV2mo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Hvt01nygww1CHonQE7M/B9jQEW2UnO1bec4P25kfCH1y1URYb4jyFONF/45Tt0d7cv+ICt8/2QRPrwggUU3KsT3rc00BbHpeXiYoLNWAGLENbQbCF3EJMXtY+gpww7vDtAaThN4tRTVD72sq040NCSTOfQDUBg0D/QIr4PElhCw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OVEuonPM; arc=fail smtp.client-ip=52.101.70.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hV6JnppUAJDinM45uQsCsrNiZrz4dru9UvOd+hHjs3bAYA7KwPcp0k+iEA/m80AhCgv9ydL9giUkkeseuHfMpV5TKiQ6XncVsvfSyC1sluF0ek+oiFsGwCKu4EbABNg2m9rjZ+xcjwl1ki+9NWyyfNs6X5XHHBnr9W6AzC1Ps1VoR6M1XN0XnX0f/fra5mDWxMM0A6+BHdjUrYHY+je8XGLb8XR40xTCIGg40HEjFzRAwv9liSU/wCrMOoMYeRR6MvI+5O0CDBd04hyH081J8kH4xFaa8lnyS4GI86lof8dWkTeaKWJ/s71Hv8/d7DL2yPobvvACWEd5vmloHqwH/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B2HiVBIMWSRnhCNOweRn6OKMCU2LmeoFk1QA712toKQ=;
 b=mZvfK12G6vBe/CLCc6bgYiuLLw8STOheTssglsIXqtDQeZPd+RK8fH7IvfPRdvQKXYMVPCOYoHqND1SVN04fPW+fi7IIyz36E6hiLye6V/RfDu3FPuYjmGz1rhv+PaZxFv/MPY1bgibWIlxxKVq6IRYtRAwLwXjHm5p6wjNHxGofAfH3KSRKEwTvVYvgxem5XpOtnHo7X+uQj92QojEYGMxR9IiMysK2jBpd+FiaIf39AdNMR+Vep5tDLaS67nfaTbetAVj2TAAm4wiY2gsIZCV6RcpvlWLB/SvekgX9AgvNBp8O/LEKLQ6X7vu7oD/YMTCXPI/mgo75pV4NQ/M8sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B2HiVBIMWSRnhCNOweRn6OKMCU2LmeoFk1QA712toKQ=;
 b=OVEuonPMp8x56U/xSUeekEvbazrooD8uR1enJwGhmS1P+Evp6/aUIaQpSRucxqnpCTodAAbbK+pJ8EHO+ArqliBXK/CznjO1PyScOB+p7/Q+58z8vIq7bmq5NUQ6+JG2RwkLI0RxaSBOPw1+aOwDsnYJWWmwr41BIzqULJSltZFnFq+3c9j3QAP4+X0ieG31zMJqSwVLO9c0rpJXxr6/MVBJymTpg0XJ1MsdrwZPATmHsUbP6CU3yTtHWkbL7FBfA/bJ8ksBm2+Nj9I9pOw33ziL7O8hpxFpD56nMYFCD6WJ+njsKvhMywhyQXXgJb2g0va87i9GErdWQOubaMzRzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by GV2PR04MB11687.eurprd04.prod.outlook.com (2603:10a6:150:2a6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.20; Wed, 29 Oct
 2025 19:57:31 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%5]) with mapi id 15.20.9253.018; Wed, 29 Oct 2025
 19:57:31 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Jonathan Corbet <corbet@lwn.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Peng Fan <peng.fan@nxp.com>,
	linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-imx@nxp.com,
	Shenwei Wang <shenwei.wang@nxp.com>
Subject: [PATCH v4 5/5] arm64: dts: imx8ulp: Add rpmsg node under imx_rproc
Date: Wed, 29 Oct 2025 14:56:19 -0500
Message-ID: <20251029195619.152869-6-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251029195619.152869-1-shenwei.wang@nxp.com>
References: <20251029195619.152869-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0019.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::32) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|GV2PR04MB11687:EE_
X-MS-Office365-Filtering-Correlation-Id: b3b33d2b-5119-43a1-8b3c-08de17256530
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3Ypku8+Bx5ChrZM7wAjkh9qoXCRzyIhLhboI7atERIdqtEZU4GJ1gcHKZPx4?=
 =?us-ascii?Q?CMEr0M8zt4XU+Mkaz5P2g28Hjfm3a1DnfienKp3FzQMeLBNxVcSVcQtTKH3a?=
 =?us-ascii?Q?bICCWIcaBBAYVQeDZgNv74Ox7pyA5RvO2dv9j1vGfHG3bLGd5hBMiqJ7/Jf/?=
 =?us-ascii?Q?9fhhqtlCvR/rKmtBWycFlZUCyKrt9Iubyhs0Us+M5XGK9THn3BvR5CeEKLtB?=
 =?us-ascii?Q?y0Ydl0jKQVUnYOxYprYWvM9yoyWmZ+5meE9ihZPXWpoeaT2iZJStv2/FR32P?=
 =?us-ascii?Q?IbRYSrPCPnSYo8dr+K2WW4nzvHsJyK7ET1ot+JmsUxIAydDxhlU07ge2yI46?=
 =?us-ascii?Q?YHhcqzpu3blKp3V/EgppBxwTmpQr4rAUksXCSR3s2IrLcu+Ct0aevS39jE8U?=
 =?us-ascii?Q?Q7KQ5oV09eOmy3jQ11D9YoTT7zWAp4bQkOy1ScmUC82uRkUp3NRhubv3tCW7?=
 =?us-ascii?Q?DVJNFddIsWgY8QuDcIyu6kz/0vRs2vQjAstPSJTaj6osScj2JzoUtj4/Xn6u?=
 =?us-ascii?Q?2kzUZ0GU22K+xAP4QTsOgILAWgxOxXA1ch9POjtr5s+uWlJXMN7zP6HKA1zg?=
 =?us-ascii?Q?cvUIS0dI/dsm+4fmzbDs5/alFPZ9jQuzPpTUy5WPK5Dq3aeJ+dTkOCtW4Vij?=
 =?us-ascii?Q?ssVCQXsQmZYNSNiwg/Kc71fwd4ht/TRpEMLSVAet/+O1uYbTCEZyZ2WxRLdz?=
 =?us-ascii?Q?AL/2ez2Z/uufOiV5KQZaSIibTn6S+FRfz7y5PE7x8leiipSOuojLJjwCYjqJ?=
 =?us-ascii?Q?MdhCxpEoR5uitplYe66tF/tYjU7I/zdVvnoLcHEfA8aLWy0FdBe8BLqswr/I?=
 =?us-ascii?Q?pgDsLkxoJKB98mKVsLgaiDu2FTDMVu2ivKwlgvY1Ud3ACFWw63gFq5asd/v0?=
 =?us-ascii?Q?FO+2/yARytDZrFrD/7VtuI9+6CVGjpCl3fmAyvCdD2yajykLS/uTXUanQiZf?=
 =?us-ascii?Q?yI0zqrwGGILVMjfWTSDy4Ssd12dhrWQmAWQayGaE8dJebDOE+/tbNsHcGOuN?=
 =?us-ascii?Q?mpvIfBwFFnAcmEtvw0iZphdAR01yNJu9Tsqk3KFu7FP5cyrGuPnhPmobzbqm?=
 =?us-ascii?Q?zQUnAPTUubUZ8zxOIwYpAw9WbDBDMPuT478/ssWtv6ka9F5hgRfY3EuHlt2J?=
 =?us-ascii?Q?KlNxh3DvflsW/iWWBzxifSaTQvik/lT+J9zjUg7Rkw1hWSVAJk+wpW4wbZzb?=
 =?us-ascii?Q?puP3KUod1uwzu0V5HoFyb9+Jjv2Bb9kmyDsYv4IHc6cMxwr2+x/pbBTtaHpS?=
 =?us-ascii?Q?ucjRbsamTcJN1d648cSzLc6qcMm4DkZaDZaOSSDosg6D0fOY2jEBTFzQpYMu?=
 =?us-ascii?Q?8BItunSYxfbT6ceTMyvSSGXw8Lc7lA9dZlg+h559JrdD4XoSA0PGE9Cjo4BM?=
 =?us-ascii?Q?m7ZaswlfcssO8/LuXwTJgyx6zF2H6WuepdxoNz2DFJkF64U5j6rhGlxdQ31M?=
 =?us-ascii?Q?0uqEMVjIuO7+hFnkq1TMz5YZWWkAJ8Z090wWOoFfIrIy53q7Jt0Sv2IwG9JT?=
 =?us-ascii?Q?0t+qWdlNds0K5euSSg6cQAZdMemTiMxigvPVg4eht91ZcuwvLLsUb1JIag?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VBMBbAd4ntCVAAs9ucwupFJoUifCOwTcsEMaWxM5Tc1BuaUBdpt7rABNnGUO?=
 =?us-ascii?Q?nJCsK5ahIzT4T0Q+9iXzLGzXs5KgzxpWzK3K9nEZjxp/JnaDziqu9dt3e3v8?=
 =?us-ascii?Q?/uPZOYNakviG4JxM/6kmFlXa5UiaCNrxKDtXzj+NetfMsvXHSpKFi/Wi6Tkx?=
 =?us-ascii?Q?kzBne2d9b+D9xf5uCESisne0o9/dHFTAGo8a/N3AixbBSxakKcCUEPlWPlgc?=
 =?us-ascii?Q?YZcQdNVzsiNLe20bEVxosn6lW5XjazuPa0nicn8SGria/aWbaM+EkTf8YuMX?=
 =?us-ascii?Q?2A2fLCAYpOCmzXUO36XM+G9IPMckZ/V4nOtSGejdR9HdYuGPJeP9wScCPZRa?=
 =?us-ascii?Q?xuIDfrJfjs97TLfgwo2pr/c8Xz/q1yeVDJkGFmsFNsjGwfDNdr/ZRiysQ6VM?=
 =?us-ascii?Q?/02Kh0q2kvTEB4aP0dMvW0+a3+hK55206ghcVRt5+T8tsVG7xCvR6ZZOCLF4?=
 =?us-ascii?Q?OcL4L9x9RmcCe8Hgj3vCfQ/yjHHhylMNR3Xnh9UC/pmlp+8wDV6nVGv1KSYL?=
 =?us-ascii?Q?HVrzmwoi3U74wrzo7HI0qqCxRBMZzAIPHkgT+cDhnj8v6I5u9cT1Um6Mf9Tx?=
 =?us-ascii?Q?Fz4WxhBrW7Nwr5apGsNZK59GfrtdZ6aLzMm7wuFW0XAd3xGUtVMv2u0mfjDk?=
 =?us-ascii?Q?NXe4BotjZGXWKMDLY4H/XH4aIooEbblTRrxIkA2lRpa5taHOK04jNRny1z8b?=
 =?us-ascii?Q?oe98dkKulqIioxjWA3xN2tG9F2chQHA5BuKvGZeBasIOLRfe1oO4q1LoLLXT?=
 =?us-ascii?Q?sWmYJYDE0PHzpS4Qay+etS2Hb88CXGvy44dCzxl05bGrYkQXpcQ/yxIEMM7K?=
 =?us-ascii?Q?7EIBBJO6KKO/IM7OaKQ5R0vQ57hECsITFcHo6H2JgcXR2zDtuzs273KAygsx?=
 =?us-ascii?Q?HA/qGLq3g9LsympnCpNeDpB9dUAB8h4mLYtETcldVw35cpRGyv9Gi9GpQnhb?=
 =?us-ascii?Q?WYeIUMf9o5LQc4sUJ3OdNlTdQ56uC9LL0BI89818Io32k78xmlCormh2KgHx?=
 =?us-ascii?Q?GJYmdmZu2sF7P8loYVcWzvpKhV1ace9kCUQNMEZD8GdhFNRGnFSz7MpQuLNt?=
 =?us-ascii?Q?iCvxiFhsFwO1OeCwEcfho0kdo/BjycURxHcQu2FXuFBtHBZLqeIFk8Jm/PAK?=
 =?us-ascii?Q?VWoVpg6xGqauZGXinJckmJAedrQkC2od3tB4hFtrhGjyA1nvZuTHCStaDvnz?=
 =?us-ascii?Q?a8a/bC1p4TJGyPBZYyiHE0w4Zqf7aTJNczWG7EklVntBrDAmq6+MInv2/UgI?=
 =?us-ascii?Q?7AJSwC6q7WaVXCIV8b6Fsy2Z7clhLOO4pqzZeh6cG065F7YjiTD7g/mMb3pm?=
 =?us-ascii?Q?Ixw4o8yD+rkuBSC4rXrp4UVJeSqwJIMs4AX3vTOdTYGanYgBShRlXS3YYuj/?=
 =?us-ascii?Q?+XybPw96DkZCfBcDnYxJShjCoQxI9bBBDBvyc2e/1gNYKG8q8qfVzJh03M/n?=
 =?us-ascii?Q?HkzBrD/+vEGbxtyAPrCjSfzehRDCtfb/5rHUOBczfsQpmB7uyV9Yo/TNWrIR?=
 =?us-ascii?Q?Xavqcm99OlhZ3ft9fGxfokX91+hK3FEaYSTW58FirrwwDZKThlIJxRCTumPW?=
 =?us-ascii?Q?J0lOxPYqPURMO3zjseGojkvrjco7tu0MZwlAb4Xg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3b33d2b-5119-43a1-8b3c-08de17256530
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 19:57:31.3653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f+VG6bnX9TeC0M51NwohCwrIiU+9zApOt1t/l6qp2/3H7e8hz3Bki+XEAU2z72NoJ8TrpIFOSC8yggbEx4pSaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11687

Add the RPMSG bus node along with its GPIO subnodes to the device
tree.

Enable remote device communication and GPIO control via RPMSG on
the i.MX platform.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 13b01f3aa2a4..6ab1c12a3bc1 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -191,6 +191,33 @@ scmi_sensor: protocol@15 {
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
+					compatible = "fsl,imx-rpmsg-gpio";
+					reg = <0>;
+					gpio-controller;
+					#gpio-cells = <2>;
+					#interrupt-cells = <2>;
+					interrupt-controller;
+					interrupt-parent = <&rpmsg_gpioa>;
+				};
+
+				rpmsg_gpiob: gpio@1 {
+					compatible = "fsl,imx-rpmsg-gpio";
+					reg = <1>;
+					gpio-controller;
+					#gpio-cells = <2>;
+					#interrupt-cells = <2>;
+					interrupt-controller;
+					interrupt-parent = <&rpmsg_gpiob>;
+				};
+			};
+		};
 	};
 
 	soc: soc@0 {
-- 
2.43.0


