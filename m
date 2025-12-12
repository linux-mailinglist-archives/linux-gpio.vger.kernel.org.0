Return-Path: <linux-gpio+bounces-29516-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD91CB9AF7
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Dec 2025 20:48:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0086430E47EB
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Dec 2025 19:45:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5833B2F5322;
	Fri, 12 Dec 2025 19:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="EJ57OlfQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012004.outbound.protection.outlook.com [52.101.66.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0298C1CAA78;
	Fri, 12 Dec 2025 19:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765568728; cv=fail; b=PUMODuTEwOLb1wNfrkupDepd+wRXV1yTa3WtfeW1bASsEZgOAf4afsAy68mW4RuKL5dT8Ugio4PLm5ko9tz+OuKlTjJkIPbX8iU/VsapiPIJFpgpyHJGy+kUreVHPX+NnaKEs7jYyJlt7BvMoHfSERvWwYROy9LzDwvP9MbHIt4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765568728; c=relaxed/simple;
	bh=cGobakO6CsA1ExL18AiFrMqP2HAld54z5WFCDQwfoUs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XdNP5nynlxDcQucaRSyKTehX0AnnpWPB3EodXlBPms9P5wURtSSI0jEt77EKFRHZzvTIyBZLc8dRQMGqY75dFuNv81Q3YWYf8WCzWQ1eiTcVU3AtwbeywJJsOIbewz4517kR7jTlxMM2TSPg+7gLID0ZOl2bd+7RlKSsfnyC8nQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=EJ57OlfQ; arc=fail smtp.client-ip=52.101.66.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=twTYO/O8hWSU/qlaM5JqnaCS7oQi95kpJ8BsO1kACC/UfyHZpePh8PDFbYtgdiE761yLG9T3jFb7h3Zj7wkWs0YEemzvQ8UEAfQIE3UX+yoaVNQ+FofDc7BkTchMwELn6lOE/ONsj11w8FOxOaR8ozzA3yjV2rEsSvK+pPEUPJ1EM6o6n/gbaUkrh69rSJ5bFOIYdHHCQpl3r6KHIMZcZA9b+kgIks2L5DN/wnNfSe5rcvDtUL6KjcfrvleQBvhMMY0b8DtYqPqBi6Ph9K2nvJZLuKGLIF83yD2fQeek8+zjHY1NKuT5rdhutwSuT5Rpim2o05VT1cWGMMGBEiOA/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U3Z6Sl1hmnAVNbH8POuWCNQSscOH1M9kbu7yanKFppU=;
 b=J6PWlHr1klyNYh8xfEhHo2DkqQAPsTE7RdXGzPzsBeATqf/UlZiXX3/QBvQ7HAW3rBHCCBw0JYiCFCI/s3psVGnDRbTMqUrX8c5tr6WmNOnfKpPpSYu0fHfQfc7vT1y27Ie9ST7QiZa129ohRWPIwK8dPtDZIP+gJ0n82h4lXHiz6ndRwzrgPVpqw3MqMmOl0qsesqV0MYezG6EyHEF85f3wJdfdEi4nYyZh/WJq8Gj4Z0+rgNj04DxjpR3cVA8mHJJAmVYm/J3ViU5f7oMZKQApOaoZyDXjlPBWBeNJlNtNCnsy+RquqpTG8RnOcfZsU7wLYMxFY3JNyZi3lWmixw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U3Z6Sl1hmnAVNbH8POuWCNQSscOH1M9kbu7yanKFppU=;
 b=EJ57OlfQapUyI4cBECipJI7joYSKkuI05StXh2KYpaQivCa6dwXo36i2a5ngzRwk0BH5iHXX9lI7gH9F23keDjziBQehwIbgWcyCr/9vyuT6bGavD8wwvafAvdTaGuiV1Yc+D0Jox+CbcA1+dAWZo/BtspK9bOOF9azSmFqWCfuivbI9kiv6c8kkY76f0B2jr9b9X0d/mjG5PvBfwNWuD68p4twddtwknVa8A6Eqa9PIw3td+Xe3O4HWgGjw5+Sv/r//AU2PmycAmlLboxteftkeVApWFqM0vQGdzQck17ITyfU3G1rlGpCs5O8r1r+SspZv+c6DlT6wFQ8EiXpSjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by DU0PR04MB9249.eurprd04.prod.outlook.com (2603:10a6:10:350::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Fri, 12 Dec
 2025 19:45:21 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%5]) with mapi id 15.20.9412.011; Fri, 12 Dec 2025
 19:45:21 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-imx@nxp.com
Subject: [PATCH v6 5/5] arm64: dts: imx8ulp: Add rpmsg node under imx_rproc
Date: Fri, 12 Dec 2025 13:43:41 -0600
Message-ID: <20251212194341.966387-6-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251212194341.966387-1-shenwei.wang@nxp.com>
References: <20251212194341.966387-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0045.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::20) To AS8PR04MB9176.eurprd04.prod.outlook.com
 (2603:10a6:20b:44b::7)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|DU0PR04MB9249:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a37e9bd-a9b9-4eb3-8189-08de39b6fbe7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|376014|366016|7416014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SnQV5HO2wW0qJy7QbYliqoYJlOgQ96DR6GuSZfZ7FG23ypSSQ6IVZyUKEkmE?=
 =?us-ascii?Q?GHLqVX+DdpMYnVpnCctl35lnTRfs3EqHeka32F9LKt6Vi2sEMk8to3YFLx5N?=
 =?us-ascii?Q?GydcZABw9+Xb0rsv06LfI8RuTRXNgkKQqjWfBtUSvvOpCMAJlEHrA4PyCXcr?=
 =?us-ascii?Q?VWsN0zc9NCN8K9xnIj9poc47FrsdFAQOjWLi5nXbGHAWg0zO7Co/99dFKk93?=
 =?us-ascii?Q?1Y6ekXDi3BdvrC90J6L9EMaAEQk+zZwh8ywp8jF+1a6X+/zRMv0OsQ5t3arz?=
 =?us-ascii?Q?gZKHOMF10ZGfJWOMVh8aaDhU2X7/ZMzzO7MuMQRgzCV0+I5ziBIN/Daq8P+w?=
 =?us-ascii?Q?twQZQXPfy73SqRM/7UKgnKchdDUPwslHnvigGV1mKvuLukcjInw3mrei2Exe?=
 =?us-ascii?Q?6TMUIUfKhpKgoEp/zSwgyTGrlwGwwOi9c84Vzhi3FaU7MZwfHyqEf6JpVbxb?=
 =?us-ascii?Q?sqme7ZTXxQUlbsBK9gFaz8WCS/y6wSdByE5d74lTVjMQ1KT9okkIk36UOolD?=
 =?us-ascii?Q?jXru2nLZxg2sBeqodfOsyLiFkqfPzCPF22AAIainmoxuY3ocbkg0qVDKHfSk?=
 =?us-ascii?Q?LRPYEHNxaWPxNNvUG6gLKEWaIbxyJOPCJze+7e7I5SwG+pPbEX4ScoG1nAKf?=
 =?us-ascii?Q?VO1PmyCjaJpCJ8eNLFsSNw/FQvuCtdW1Dhk5/XgGirNto2GdudThNQgo5Jv+?=
 =?us-ascii?Q?KE5w4ggI9oqUm9VVdUp5F4oBe3qgt9FDn8nhkR6yTG/JibB6s6kj6eqmSmx6?=
 =?us-ascii?Q?qKDZgxRW9hIIuasez6uSYWVdq8k/w4WAZzMZht4LDLFLy/hFqLV0HRo6zJj+?=
 =?us-ascii?Q?E3Igq8IhnZx9pDS+RArp++dveihmydy6vtv4MyCa6d6av1cSyLXe60EWyVVL?=
 =?us-ascii?Q?LJYC1GwS6JaTt/5wxZBXFrH9Hyb7zs5Hh44pcLnRxC4076ByNG0MVyUW12/b?=
 =?us-ascii?Q?6UHEWvXiGRB79/TF3bxJ1Au6X/QCzmOW35r96TVmABz+txrTTezOWgIuKtUb?=
 =?us-ascii?Q?p3yO09YKSfO69MyCNYYpDDerxazdfiBX8JgRksz/pqsLYOiyNYERmiEjDb8q?=
 =?us-ascii?Q?DqtXUehcbOgLccmLETKki9o7o/j6RhGeENI0ahp79rGBpVVYVR9MPZLi0XW0?=
 =?us-ascii?Q?2OL1fKkB2XG24gtEo3PrBVX2nvkvGyOJC3zsXUZo/DQpRPh7DlErLHQsapx5?=
 =?us-ascii?Q?x2XHtBxrJpraElB9cpuoduV2aPl6FX2AIRQC+gINdHgN8hM5sPa1CFo4tUBl?=
 =?us-ascii?Q?eOiSojR7OXzW+AJp8TNDz57qnC3GhF4pqnhtJe//MxoX+kPMNU4pWWGeMsHW?=
 =?us-ascii?Q?ZBG+bDhKWodyT+0i9JU2p6u53uq3/HkfFj3m03cws8d5mXz1XxdxUXJAdMDZ?=
 =?us-ascii?Q?IdsZJsGhDvK/yO5hlTJobj7aPKlLe8lxO2833qKxk8mJka5iEBunupAF/w+3?=
 =?us-ascii?Q?UDbnJV+mxCo6JRgyzD48vwzucd4+0FgKj+M52bFrVXFn9aqbcnoYyqLtv/Ud?=
 =?us-ascii?Q?ZDnXn0HBFvLNZztFkBJi79wbOrxMUIPhoP07BIo7xyo6fvUHDpJpnog7wA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(366016)(7416014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2ywprKC8QwDbt2CIVhCW1+WxonihzIF5WcIj11G3g09QjRV9r8MAklfngMtU?=
 =?us-ascii?Q?dCy0NKOyUof5iru389T6rwQ0Rpy7ra6WgYPjH/htYCChhFPA5tDm+LwpJftR?=
 =?us-ascii?Q?b6MnDaV1X7VXHO84JRMGjQRB7l8g9QgZNquP6fFkqcO/aDspBue/bfGtjMhP?=
 =?us-ascii?Q?y6DUReER825pvq+TC6y+yMHbfFdjKR0+LgPQ3rmQiD+3kzFMKAHI1vE2uJLg?=
 =?us-ascii?Q?72qMWDsgz5JuSGQFdG2Y2kpHiiePZIz2EheW2PAy/4u9aBFvnYtrqgxU86vm?=
 =?us-ascii?Q?hKZQI13lo4MQUpIMGTKTiANgfK9RnFWHlEc7vA54qTfR8uqJo++8LdUof66L?=
 =?us-ascii?Q?+54r3GMhotJ90LPF7fj6u+jR98AZsGxN/kROGLKx1JrSfb5PxdjHe/Fu2K8K?=
 =?us-ascii?Q?aWLtNnVKGAL1o70KgUhZnjifGm1M1BJPK/d2EmqGdwPR+2llIGcRZCQuzFPZ?=
 =?us-ascii?Q?47xV7d9c573gOR7SUyfLZdIkpZLQ28LBPE2007FArggxvVuNbaA4X7NVOaVE?=
 =?us-ascii?Q?nInyvHdP4zanoHYmxzP6AB9aP04S57vtOl8lE4mxW84EWyiR/Lh3n8Nrip3Z?=
 =?us-ascii?Q?0snBhhme47vJVAMuPb//g6zfdtGVBfAUsyoGy3IUDsPwH9FnSIpM5pAsLtdV?=
 =?us-ascii?Q?VNgb36JDkr9X/arKLgfwliOhwTV9GKkpNMZZ1GdPLGMQa+3G7zWAEla/wtvi?=
 =?us-ascii?Q?9PdJGcqoo/Vizid9Dmua2mcRuyXUeLAzwmNeFYtOlZ2s3jW2rf/pYaS6KO+b?=
 =?us-ascii?Q?bUiUvJw0chvqczID2shatXgTwwMTCQSlHaPZlxw4gNX0Znq47MtCafkosy7c?=
 =?us-ascii?Q?06NbiFVNT3tE0UwQHi88HHdMrjLTC1ZlUtFNJgBn4dJV2GiUCefBy3pd5uVe?=
 =?us-ascii?Q?dqqR7DRTfVx/405MXW0/Nt3DbURt2XPG3IOwNu8uSJFhnOSfur3G2iE2we4+?=
 =?us-ascii?Q?/7BSC6yAhiZtlfPNrVEsdj/jCv+a3PSnHeeG0TTdFwbDLmDCqSgwjX/dH4zV?=
 =?us-ascii?Q?rPy1+7Ib502iSbV8I5r40jWMakYb0jgIMozhlG6sNgSkeNXt1m89sRi0eFMB?=
 =?us-ascii?Q?DVoVFKnjyZXJRlQBeTTuh0dJeZ+ngpJpEf9IGeBWssBzUTiWJNxKw1EQKP/f?=
 =?us-ascii?Q?UqMm0jWwyz0/EEtsTRC9MV4gU9vGrBfUUXfFvuVTk/HoMcdufyAFLmudLc0Z?=
 =?us-ascii?Q?asxryVu2PPV+5uR7Liqn6PGlDWpRzx9OOe36BqJexp7x3HCPufZNy5sMNlrV?=
 =?us-ascii?Q?FXyI/RUAKOwTIN3gSQppGl273sLxW1jsVyL4+V6lCDuVS08sfk5ykP/+kaM6?=
 =?us-ascii?Q?dut8Y0GhaqtbqwOFIu2Ao0mq8H3ON4Qc+6mlXjvK0nSxWuMaUL31bV0hL5c+?=
 =?us-ascii?Q?MxbNrlzKnDwuiGLULr9W12zJX3SUlCqmBNYb0M8Y0JfOQ+oGHunDrk6G5lcs?=
 =?us-ascii?Q?/QXfFYsAfWjgPPCSG+/T1N8kgMg9+Bdky1dPlULRa3kHwe5vfU1ntgunDGcJ?=
 =?us-ascii?Q?vdki2cfBOjE0yQyhNR0jRHUymhHzcknjwSMunX8Xxwl9yeBt4l24Rij6mxAM?=
 =?us-ascii?Q?UoMzmy+Z9ki/59yBePq0qGQ0J6iSg/lAWxXpObw1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a37e9bd-a9b9-4eb3-8189-08de39b6fbe7
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9176.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 19:45:21.4374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3DsswrFL81ELzcHF3Mg0Ilk8VoJaHkuVF6h7No3+yjPSedMWIKG0m8DtqC3pTNG3BgQYsm6/Prn+6Ty3Dgjh+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9249

Add the RPMSG bus node along with its GPIO subnodes to the device
tree.

Enable remote device communication and GPIO control via RPMSG on
the i.MX platform.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 13b01f3aa2a4..93846435c6c1 100644
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
+					compatible = "rpmsg-gpio";
+					reg = <0>;
+					gpio-controller;
+					#gpio-cells = <2>;
+					#interrupt-cells = <2>;
+					interrupt-controller;
+					interrupt-parent = <&rpmsg_gpioa>;
+				};
+
+				rpmsg_gpiob: gpio@1 {
+					compatible = "rpmsg-gpio";
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


