Return-Path: <linux-gpio+bounces-26220-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5F8B59DDC
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Sep 2025 18:40:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0DD471C02074
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Sep 2025 16:41:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A057C31E8A9;
	Tue, 16 Sep 2025 16:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Pt/n8COv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010009.outbound.protection.outlook.com [52.101.69.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE3431E893;
	Tue, 16 Sep 2025 16:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758040841; cv=fail; b=FgkXyaUVwwopa3W8HekfTe00ExkN1UAtcLlUaIDyJsi4YJKN/RcTElVvasAfT2iPLpqktbCSeY10dcIqkYaIy1ddfBNlCJO6fYtQTXkJoElsIo04cbZMi1ebvgUTLQYXg3F/JSCDadT//jJ++IAPMYt5OqVJU5Lalpzski6cN1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758040841; c=relaxed/simple;
	bh=Fh4hAXgX5jGy2I2RsC3goxBJ796cVwmIYpBv2nmn0SA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NOO8sGvcpXyhYnQDIy+7Wdphr4Qdj+6yJ7OJG9V4wGIYaPJR1h0y5tFvGctbipPDiUfPp2rs8+cl5ejgOPDext61v1kYXQHtuNT7SMv4AlrHuR+84Szmw87PBSHr3ICU+/q2y595Jqb381hNgjd75Cot54vqRxurpcp9G0DO0AE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Pt/n8COv; arc=fail smtp.client-ip=52.101.69.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q3jA+i2dXPjYbVJdIaB6EA4Xg1bcLiBee2XnDw5b3W0U4cc/gLzvKu9PiQkKC56K9y52aqWCikPkFCXHo1hmKADye0uffsH4Jou5/F3g2LPFVCfxZja4fVXGG7NDKkpxUD3yIk150jF3ONDgaTzCM3Q7pxJFcspLVMO3wjY9Kqu/xNCsreS/xY3tSJAt8GTZ954d+LAPbbcYydPZXIIszIgr76eqsvr2vD8oLrtnGnR1+HtXG7ZxXA+Njv6My6cuxJMtaL4l05Sr52613eCPm1iQyXdJe1wpGEXGSQdmiSUvjbAPkvWA6TAKWzWcB2VDGDy0ovBcLWExcsbGRDh8fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MO/jpbqPilFHviq+otejEmqI407C0fcmKaJkimMMvr0=;
 b=Q6YSnu6fTmYTqNINupMYjzvt+nHWq9xn5GA+p7J+F+3px/3Ycb5Mj/IoxavoKT9BDO91KoJg4J+jXT9N9sdTMu34kUbVGsHlcUlaaKgmao5hm5snod4eX0c4Bn7RLCnyxjIQfl8ZnWvCwHfXK9PKvVvBcZvcsqGih6/hkyFAMXloGgIPgvlHaOC8a7SSU+yqOxb5E/8mrhbSx0PF1YTABx1cDIqNQyzNNkCdApRn/05iq0XL2ztHTM4KOxz1ZrrLiTKXJHWEDJf9CLfTPUPRsQfwzW4fmsEudJ34oBlh0M5WC0f53mh+dLelQxWnlU8VPsLwSmhOvTvBFFzNrMdGIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MO/jpbqPilFHviq+otejEmqI407C0fcmKaJkimMMvr0=;
 b=Pt/n8COvXkU3Nae+6ssjelqwvfL9O1yRk47YWpI6w81pSM09d3y1HZJfP5DQZEXo/vKM25yFWv+8TlGfWnniXlA7E1MeWxGshHJX5tiLPQIlaCtShiP74jFKNapQKWiYQm0aqrTdbJdT7IfEK9UP1U05R+gXDkmzxlFbeuos/khjQtZ5gvhakFB+z93xiqcfEu0fl3M7gKTVcavNc1zzHyf8Caxy7aa4BcitzkMZl1meRjVVfv/7woA05ZgQYLBw/EMFu0bhiC4zrxvAiEilPgd396RU4QVesnVLUeUPfvc2wtP8v5vQvcuynPZgkgFRwkVuUZaUnjuXh9X1W8W6ng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by DU4PR04MB10936.eurprd04.prod.outlook.com (2603:10a6:10:588::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.12; Tue, 16 Sep
 2025 16:40:35 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9137.010; Tue, 16 Sep 2025
 16:40:35 +0000
Date: Tue, 16 Sep 2025 12:40:28 -0400
From: Frank Li <Frank.li@nxp.com>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shawn Guo <shawnguo@kernel.org>, Michael Walle <mwalle@kernel.org>,
	Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/9] arm64: dts: lx2160a-rdb: describe the QIXIS FPGA
 and two child GPIO controllers
Message-ID: <aMmS/Bfc6hQLgpDQ@lizhi-Precision-Tower-5810>
References: <20250915122354.217720-1-ioana.ciornei@nxp.com>
 <20250915122354.217720-7-ioana.ciornei@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915122354.217720-7-ioana.ciornei@nxp.com>
X-ClientProxiedBy: PH8P222CA0030.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:2d7::11) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|DU4PR04MB10936:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fb92329-acd9-4d31-aece-08ddf53fc29e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|52116014|376014|1800799024|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?K+BFuY/4n9E99gCr4Mmlf4Aa41kPiZWm0cWJFtbPbxoB7hTCOAaB0DyBe7Rm?=
 =?us-ascii?Q?oCIeVgsaF/7jmbHkwUGW1ZI8znQxJfm0QRvSgn0A8+YroCskTN9oUPiqXmWC?=
 =?us-ascii?Q?YCYq+Bq9ZE5fkGkWouT7zeGVkNma3MsuXwq68jODzG3dJOJvv++Kf9kGnBqu?=
 =?us-ascii?Q?ZbJCJh/MU06s/nCLEqZqP8YDiCnpfk2hWXDbhLDXsmk14QPICorklMqhuLWx?=
 =?us-ascii?Q?eUD9u6ucRs9nFF26MDQYEAnM7Wu8uiZrokhQGkD0mZSfTNeFq3X/3zGHMvRE?=
 =?us-ascii?Q?E9xEMfJTY4G10wlwwJFio68YGBBCHPDwL8syzvB86/bmgdXVpM4uKqHc+r8s?=
 =?us-ascii?Q?j0YG19K8xt9fdFmGy05OO7ujvY+bdiikH/BvRBCIjNt1oeuOHQnzxw2Myyg9?=
 =?us-ascii?Q?zOiXFrHIO1225O+awQE4v9ZBzT83wojWb1Eat0PtcJUDv4TZeH3FyX4Bqd7q?=
 =?us-ascii?Q?NOeDC+2KyU4JxggxaQRlnT1srK3RsH9G2OfkikfCT1FMHFQRCfBXQ0ERk7uu?=
 =?us-ascii?Q?tlxen85yenGU0io0yXzZIz0cGzwHwAHhRZf39Vp9dOOWAmvnX+3FQ9s07VbS?=
 =?us-ascii?Q?YA1TaX0rxJAEGL3RL1lkI7qxD1Bwv0F0FbaDQNx/U5XYNmHylySno4621aPl?=
 =?us-ascii?Q?G4e9v929sEjd6W8CEu6gKiD5j9E4mjfSOHpoMJa16E6I0wrfFlK6yupZfQ+o?=
 =?us-ascii?Q?FC1WZi9nE+J9DjXGzc0R/pa6qVm4Xs7LW/FmuglKMq9lsZu+ThjiQbE1tRe9?=
 =?us-ascii?Q?YiYoidR6luebegNqTRfUjnJJVeOXDTHg/XV4U7JD5HmIpz1m48n1AXvXxptx?=
 =?us-ascii?Q?3fyvkdo4Eh+3JbmxITum/l00PHdKiTI+ur2uWJM84oWz9IOt0zgoTeh5rRPH?=
 =?us-ascii?Q?0huJinqRDHCE0Lh/DAN4Hy5ZirkwPDYztN/N6RFxdgR4wLtyaO2AXn3y9Tje?=
 =?us-ascii?Q?yIJXYISnMHXJhTClH+JQV3AoI1AGnc6MqI1es9AbQCTicj8FTVHBhiBiMQmt?=
 =?us-ascii?Q?MLjwE2cL+OGfqG/oXX7SqS8IkiDpqKS1av0DRqQ7O5likY7d87GQIsZQUSjq?=
 =?us-ascii?Q?D694FDBo4AvA+FvI0QvWFbjQ58xh9fAz7jd02c/tslEf6bjEgOh7cY8CV+Gt?=
 =?us-ascii?Q?TK5hI+asPj8MdKFZ7JaoWqUl6IorvyLBTo1xy5zuLwPEhLjOLteoMIpqflxY?=
 =?us-ascii?Q?ykFVXYYctPFKtYGUCo/XaBDQSldS5xEtOBhRmfD6FtCvhRNRn7J1ph/5SFwd?=
 =?us-ascii?Q?D18RjEmTSbmZM57ZFcdwjoMtbxyu8WE0VoYYdptzAxyCqx8AUWJ9sWW67iUj?=
 =?us-ascii?Q?W4M3OcvOl7jdqWeGInpTNXlS8cBV65gu3adSUXRui5F+CLHf1LKh74KgqPkS?=
 =?us-ascii?Q?IIpEkqG4Fh5XpfM1/ArGCkeVwLevIZPqVd2+e736nyr+vPZzH4sKYUbAPOlr?=
 =?us-ascii?Q?MXIw79Ba5MWdgQ4JTn5kyoSaK8hxXc7tbWbNjidM5hT56bl9riUoPA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(1800799024)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9j2ZpfEk3kBiYpGLCeFmTCVNnmNASnDWLJbdlBAzZA967mDk3RzJvPKvlak4?=
 =?us-ascii?Q?Cna/Q3F8KN2OIbErE/0SXFPCij2S2kv5cStLaz9PLeX5ln4Qyo4u1vl/kdFR?=
 =?us-ascii?Q?ojz2wrDoNWPmoEEnQwd0cVXPf+PNFJ+0lO82jhsXMkPsKmGSYSO+K3/0F0d2?=
 =?us-ascii?Q?xXnJT7+o1t5xpixlTd79AcU2tor9TExdHaeys1bRDsgAkFgiStxfFxPzrfYw?=
 =?us-ascii?Q?WYxPeJDvy0PdFeePC5crOrInhawYaOK9jhgwe/oL8E/CIsP+n/Itw8ojMFMP?=
 =?us-ascii?Q?bayX4rlCaPPy7NZON5SKSTS5cddBbibEMGwNeeXvPPLXzlO7WepfqPNyjFLO?=
 =?us-ascii?Q?4fHnxQJfmw3S1aABHM2HDuXgshK02BFln0/qIbryCxWAYdP37VzaVRfvQsXH?=
 =?us-ascii?Q?6SBK7f1GwG+NE84QMN+1KQ2DpDOFMmAjiF7rDfwbUSnyKiRpqoS2CcFBGNnr?=
 =?us-ascii?Q?O5ssWcW9IxC24zq7WRSZLOz7vFjKFCzJy0LP4ymHwUd8+MjtiGyxiy4+jrBh?=
 =?us-ascii?Q?GnzLRvNyn29/nFPeIokpB5ulT+15p7zzzQVtriiJRCc/Mp4i5ezKEGbC73PE?=
 =?us-ascii?Q?V2W6uh9UHKGDEkRLdZHN8V7TDkrsOaFhBK8UvNcqBpJ3wkxX4Az2WfChmC9M?=
 =?us-ascii?Q?dyUjdKrpeee2zNiur7yatAV0u3DWGiuJ6ZOY9mCpJ2jMPxtzv2mOMm0GoEbQ?=
 =?us-ascii?Q?VS4L0ENHXo+2v+mnzrrdAySeuqgN5/SBvV5uh7xR26Z88QX424hYSF+zbjFp?=
 =?us-ascii?Q?v/iAoH+4WggiM8Fh/PEPm0GG7udK2B3Ye0DvPBXmFOfwutDK8jFMNsaWk05V?=
 =?us-ascii?Q?ExdS2jyGprc+PqyWbQrP8bZPZh1IxATL09CbEKWTLhMF5/Hrva8LNgKzp0yr?=
 =?us-ascii?Q?5uiH0VsT51bs7fyComuCA+iQJriLS1cZMs7w45REnoqrjMLWS2z6287SxCrq?=
 =?us-ascii?Q?VdmUHvf2geTzJlfcvWQaUxJqxtnamsG+ECtoOjIAdhrCGFHjz1sOJG2pg+FE?=
 =?us-ascii?Q?d34LGrWHf73f9HNHzV/5vAUnLUe5srdY5ZQz97HV3X1lqwDlvJQzEFuwUtyz?=
 =?us-ascii?Q?wXEwjEk/YEIrap6VVUhccUixF3zD1OsIqT/YsxYEQf0RLpb4o+Q/11TFKL/9?=
 =?us-ascii?Q?Bww/NR5tzhiYflTzrNh2j7ib4cPs7luZ9rRuy4LiGpnLB3+CKZVmkn/yWYD7?=
 =?us-ascii?Q?uQPv2L2fmOGICBxzq266uQsG+BqquFVo9LzUMSTBdR8d6nk3iBrTrKdM/PYJ?=
 =?us-ascii?Q?ytbqSnbcjEM75x6yFPelLIcNXeqT4dZg7FxYnTR2xEfx6FyzV6weUOeKLtfo?=
 =?us-ascii?Q?eH7Tp4w5lmHn0mFLL2MgKdZxHDr7fuHdp0yg/qngtws7merHWKr3WY3rVrsI?=
 =?us-ascii?Q?mhjHzYXCSt9u5Tm420QhkBJ99M/QP9imRMsusg7agkd6ZGqdnO5DMzqkKlqN?=
 =?us-ascii?Q?h29oJ3jdZBDgVYJI7iTA063+9m90I4mNEw9LArnJaybZfZubwNkR4fyz6Ra3?=
 =?us-ascii?Q?IXQEvJ87l4sscqN2TUDwGcQ6EXCJszne/ZQtINf6UNWP8liT+HRcfeGmzRI8?=
 =?us-ascii?Q?dH71otCaWvM7INAuCNenXiSZZ/cHU/sMiwcQnhln?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fb92329-acd9-4d31-aece-08ddf53fc29e
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 16:40:35.5290
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EvvFhYlMR5SZNp4htjt2DxXoYUTSGd3J+foWAvVrjum1lAO+iojcfJJc1Uke0/iGU7fOj9hQFOHfMB5AnL76Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10936

On Mon, Sep 15, 2025 at 03:23:51PM +0300, Ioana Ciornei wrote:
> Describe the FPGA present on the LX2160ARDB board as a simple-mfd I2C
> device. The FPGA presents registers that deal with power-on-reset
> timing, muxing, SFP cage monitoring and control etc.
>
> Also add the two GPIO controllers responsible for monitoring and
> controlling the SFP+ cages used for MAC5 and MAC6.
>
> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
> Changes in v2:
> - Use the same compatible string for both GPIO controller nodes.
>
>  .../boot/dts/freescale/fsl-lx2160a-rdb.dts    | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
> index 0c44b3cbef77..4ede1295f29d 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
> +++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
> @@ -170,6 +170,37 @@ mt35xu512aba1: flash@1 {
>  &i2c0 {
>  	status = "okay";
>
> +	cpld@66 {
> +		compatible = "fsl,lx2160ardb-fpga";
> +		reg = <0x66>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		sfp2_csr: gpio@19 {
> +			compatible = "fsl,lx2160ardb-fpga-gpio-sfp";
> +			reg = <0x19>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-line-names =
> +				"SFP2_TX_EN", "",
> +				"", "",
> +				"SFP2_RX_LOS", "SFP2_TX_FAULT",
> +				"", "SFP2_MOD_ABS";
> +		};
> +
> +		sfp3_csr: gpio@1a {
> +			compatible = "fsl,lx2160ardb-fpga-gpio-sfp";
> +			reg = <0x1a>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-line-names =
> +				"SFP3_TX_EN", "",
> +				"", "",
> +				"SFP3_RX_LOS", "SFP3_TX_FAULT",
> +				"", "SFP3_MOD_ABS";
> +		};
> +	};
> +
>  	i2c-mux@77 {
>  		compatible = "nxp,pca9547";
>  		reg = <0x77>;
> --
> 2.25.1
>

