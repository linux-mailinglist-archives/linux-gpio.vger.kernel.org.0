Return-Path: <linux-gpio+bounces-28683-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 687EBC6ADAB
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 18:12:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0F14F4E8461
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 17:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21D2B36CDF1;
	Tue, 18 Nov 2025 17:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="EzrQUUg9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5E2305079;
	Tue, 18 Nov 2025 17:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763485546; cv=fail; b=qZTtHmQtoaXF74BIarLBKkF0ALBpFFXcfWC/AMR/3tigsXLZODSbh4H7YyOlJhFTPTPQC/A2DRvQ7CybIKk+0H8L9bfVJmDCm/RGiPgTyubOmoNCxlHnTCJedr8qqdLxSDKilACWgkcgThuimzSSw5IwS/PC/OKe8g6xrkwQCS4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763485546; c=relaxed/simple;
	bh=n2YI4eU/BUYENnwg+29FXGGJzugap8baYf9UU3etJjs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nuk9irStRtskOc9KMuY99Zh0aIRHPvjBYJk62c6mPwqT5QbOA4wgjpnPx22bW3QgLmXXCgeOmZYVxSlzZf5LUoAV9czVmLDHOoXlLe2s9GcF/DeCJeMn9DxJ2Lp+rPHcwpd2qRKpyf/vIpuu0LiRpUT01rn98dWj2+3MPEVnPKU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=EzrQUUg9; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIGtChG191115;
	Tue, 18 Nov 2025 18:05:13 +0100
Received: from pa4pr04cu001.outbound.protection.outlook.com (mail-francecentralazon11013044.outbound.protection.outlook.com [40.107.162.44])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4agvrb0110-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 18 Nov 2025 18:05:13 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h3wgwPeBqn6sAxEKW84z5q8Pc0lR80upNHTGeOzQ2ax/7NkEwkynH8uvAgWXracnYEu0i7O6Tc4nanjEyJy1bIksdDEiW1/phUTo6ER7EOmI1R7x3cPhQCZJAnW5FY2L4Vz0Sh0eSLL/PQSB7OX1DybIPJzwkKOlAVrvqEoRj9TcvJ4K7f17qo04m1aKDrkCZND/h2NUnDgUho//ldwMYRc5/XSNg9qB3QI5RUi7XidSChS+E+OC/OCTADf7jz4vRiCRWNFlksYpmiLhIeS4NX8sWHShGjIOUBNwhZqTBdWGhiiLMZ0D1jpQIvrHvzb75A4Ta2y7Iox3RZlvtql05A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DkuC4Nv7tXmq6q/9HWofM5d1KnDy/bOg340jqOvvtdI=;
 b=gpEvClVkPHmLhv+aiVoyAAnnLjCh9NXixspWGUSuahIWvfmBy81EztfClo2qyN/L8x4skVvgp1y9eIpERnGlNj46ClEIxcd7NdBa2CGS11UyRfhaWzYOAjpgOs0jHaTBnaXXi6/jGsVf09r2Qv2TpGKLvRnQGhEE2X+wDM/WMDsU+ux9gfRqeJnagZlvZn0o47Fsi1GLWxBOTf/56isYD9ZX9x/k1Lqraw73kjUw2pBZa8ZMcTR3tsQNDNXKGKAwpJBHiq/iefbfS8RruyRkHdJmioF2Nnw5+Cehhqf48jB3rQ13xJBW4+DmXS2J2c2G/D2H6QOcrwdkRsHS+QOE3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DkuC4Nv7tXmq6q/9HWofM5d1KnDy/bOg340jqOvvtdI=;
 b=EzrQUUg9cuKofTq+pE/uvltODuzTc/jeMwwPDKB1uDp0SI4ticcf9Hz5S3KXdP2eiMmhs2cSTWJO6IWuRNOEZ+cp/BqjalSUbQ1J5oveflxPQG3Iv+Jb9gdKs56jHmBbreihuc3K7RVjhjECtgeLWoQfkI8PVjmvsST3O1Ak60CsfO2wB4g9lzefHNMUVRiEzHBwCnPFDtl1DLLHXLPtghSQNzhwZWo50nm/wqKSM8Q8nKH2Cy1f5ouVOwTxkbjVsCSrYyyoSqyb1D7VAx05OkGEU1Xy8MbVAyVGsaGGTsFEay0lgrAIrJUnPHHdGSYJJV82upo00pYPTkpc/UapKQ==
Received: from AS9PR05CA0354.eurprd05.prod.outlook.com (2603:10a6:20b:490::30)
 by DU4PR10MB8758.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:569::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 17:05:11 +0000
Received: from AMS1EPF00000045.eurprd04.prod.outlook.com
 (2603:10a6:20b:490:cafe::b2) by AS9PR05CA0354.outlook.office365.com
 (2603:10a6:20b:490::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Tue,
 18 Nov 2025 17:05:11 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF00000045.mail.protection.outlook.com (10.167.16.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Tue, 18 Nov 2025 17:05:10 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 18 Nov
 2025 17:20:09 +0100
Received: from localhost (10.48.86.11) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 18 Nov
 2025 17:19:44 +0100
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Antonio Borneo <antonio.borneo@foss.st.com>,
        =?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <legoffic.clement@gmail.com>,
        "Amelie
 Delaunay" <amelie.delaunay@foss.st.com>,
        Pascal Paillet
	<p.paillet@foss.st.com>
Subject: [PATCH v2 03/15] arm: dts: stm32: update property 'st,package' to new bindings
Date: Tue, 18 Nov 2025 17:19:24 +0100
Message-ID: <20251118161936.1085477-4-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251118161936.1085477-1-antonio.borneo@foss.st.com>
References: <20251118161936.1085477-1-antonio.borneo@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000045:EE_|DU4PR10MB8758:EE_
X-MS-Office365-Filtering-Correlation-Id: e7350c0d-5351-4b2d-815a-08de26c4a224
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?omHmvtZmPHtsA4ikPtnGvTRhvcYyIvN6Yuh+5sx6/yXxNYOgApSfjU6m4mhM?=
 =?us-ascii?Q?Taz2PFRXoR6u27Flf/hW4RDVPCJwZiUU39Op0cCRKIHjSR4eLa7ejEE83NtS?=
 =?us-ascii?Q?WVaNY5nPOyE2VgCAqM6Q+1DVFCPm0zbF8+JbhIjV/vxfTFnaVUFBaAPNJSRq?=
 =?us-ascii?Q?iDfstF1N0GUU22LN51E/xRF7GHnT+Op9jYjDSr4xU4jCaSpKQDZ8S6DjDWwR?=
 =?us-ascii?Q?5QHX+KuNTCGBlM3mMiNzUlkBvYw0iwYr7k1a0lE7IZNVp6Ngs9Mt3JzbYW+x?=
 =?us-ascii?Q?L/BUvneGdO9YxpKCJ0mfVTcJWb7BB8mDjtGGZ+pW0Ro1iHc/U5TbIQAPEbQ2?=
 =?us-ascii?Q?O5vFSC4pAgjFnCBNy9oSWRPdJAbht/RF3UQSHuvRD9EP8IA6zf1+ZjCUUwDn?=
 =?us-ascii?Q?j2reu4HHHxV9rvX/o1oM7yROP94vVvUCVRzLOcetoZctnKtr2JjFki/RmQoO?=
 =?us-ascii?Q?glfrq8BCEstP4+yoES9Ot8nN2F27H2Xn0TgC5m9+h42ZzAlbjhhGOXwKJM31?=
 =?us-ascii?Q?37NDyrZLDEG99J1IWAj0HZoFosZ7Rbh8Ee0dXC+7ecM1Eh0OyJmgFfBkDF7a?=
 =?us-ascii?Q?tbiUv/T45Q1ypHuzSsPPPmINwWxiLzInVKvSlhG6A3u67bJNfD9RFwf87nip?=
 =?us-ascii?Q?2ZzudUqVIex+QShyb8j6gBPoAAc3o/v5QgOMg0xpAqciTNVtAMJATh5HX/jz?=
 =?us-ascii?Q?fiylyfWNktWsRQkubP7lUdiZ6Xjyy61oD6l5nn2+PhZHEzAb5f7gY9+gOtTj?=
 =?us-ascii?Q?187yWq2kI8177BgTDOhxuK/J7x+qtkyQQdjQ+/oSB/pi7+A/9L6Blx6kQuZu?=
 =?us-ascii?Q?kLpdVfkHN0ZhOmeVOD3B4TyHewZEmj5UMK100IFB0XBwheueMBY3Z85V1TbB?=
 =?us-ascii?Q?LYGV9KqxrbLB+B4+FXtNM9cifbYNwQNDUE97NKDqHQ1C7WksB2WPPkiJ0SCC?=
 =?us-ascii?Q?H77ZtpEW+9ol6+cSeN0A8Thj2JuFYDAIuZlQ2bXfdcxvk2NPfqbIty91Jvzc?=
 =?us-ascii?Q?KfgA7L1coFyHjpjsEoitWxatESHOSEurWk5ErtpvdF0I06Epz+cnq17VymtL?=
 =?us-ascii?Q?RzaZ+02vAVOIYFyCFTxkid0jL4WxVBErhHHqiZccxvcbrY/VwvF2lIPhfRWw?=
 =?us-ascii?Q?71FF2hl6OVFTaF8tMwstV4x3j0ETW0ITejuErB1ewvyh0i4srkf/nca2bc08?=
 =?us-ascii?Q?j8jMdCy1momuemEqYHIIOD1y/hBj6qBrpPgGfGiTPHKJar9FWpYHJBdnSAjW?=
 =?us-ascii?Q?26LnWNhzAoDwOI8FT0rlOOv9sS2wbN7KAti2ZoODLofII1KNt6w2Uo+vq9ZR?=
 =?us-ascii?Q?PEeHS84ITQHnb68Z2TyfrwNkqKi3kFPcBow4b9TzZ6mRWUh01y0/fzXO9+CA?=
 =?us-ascii?Q?ltde71ew6F+GnaRvBky3gizvbxYkyHDdxLsYSde3AcyOqEuid3nACv8UXH/R?=
 =?us-ascii?Q?H1JvEaPfLzF0Pu3dItceNflOwnQ6A8YmTCKGoQZUv69Fm74i2b75nAEzd4+P?=
 =?us-ascii?Q?M/vQt3L3DdgcsxYD+JMAbDvbZ7Kndse46+C64pcCK4Mvr+V/3OPZU0sXLsCB?=
 =?us-ascii?Q?JwDICnsb0JYZ2bBTBqOvYyntVfaXt+mSXB7y2uUw?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 17:05:10.8166
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7350c0d-5351-4b2d-815a-08de26c4a224
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000045.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB8758
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDEzOCBTYWx0ZWRfXywZi5kPBwd4k
 +AKT4KybW0qUqB+kfJx6wj+P3RwnrifCsoLXYw0HRArwG5/f3jh8HA34jqh9Yo2TkI9OYgsDnxi
 bOnnr7UeYROq7sDZ5Y0xmIL+rX0VvqzBPVZ53RlBceTZO/VIWLdySgVRZzRnl379hkeRFEDkYVz
 O9wmRW/H8EvrhWlTiODLZFHd3MkA2gdz8Kl79UgwCco0h/oRxH+tXtRSxmFqEspi8TvGzszGDYp
 qevbCOVreABIjtRk+KgtnRCLmC/GnQ1WBcQiK2ViMc4UhF7LdbbFpDKwGgFVYClarhxRytswWDQ
 p6gXpx0LBKOF1W7r1ZQ+AxYO9VlF0PBDgw0b6CRLcxWdlGVenKQxzVpNoEdUsrv0pb0aArfgAX+
 xtbfNSuPeePbn0FckCTh6GBCWyJjYA==
X-Authority-Analysis: v=2.4 cv=SaL6t/Ru c=1 sm=1 tr=0 ts=691ca749 cx=c_pps
 a=CcFEla9EprtmhgrLblTNNw==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=y9YUpebZf6kA:10 a=6UeiqGixMTsA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=KbIsqNqJ5Tj8EtjJE8oA:9 a=T3LWEMljR5ZiDmsYVIUa:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: 8Nl3zOtLR-q08ski8fD1-OBlQbd-IKr1
X-Proofpoint-ORIG-GUID: 8Nl3zOtLR-q08ski8fD1-OBlQbd-IKr1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180138

The property 'st,package' reports the SoC package used in the
board DT and is used to inform the driver about which pins are
available for use by the pinctrl driver.

Use the new bindings where 'st,package' value is a string.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp15xxaa-pinctrl.dtsi | 4 ++--
 arch/arm/boot/dts/st/stm32mp15xxab-pinctrl.dtsi | 2 +-
 arch/arm/boot/dts/st/stm32mp15xxac-pinctrl.dtsi | 4 ++--
 arch/arm/boot/dts/st/stm32mp15xxad-pinctrl.dtsi | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp15xxaa-pinctrl.dtsi b/arch/arm/boot/dts/st/stm32mp15xxaa-pinctrl.dtsi
index 04f7a43ad66f9..a5dc0badec69a 100644
--- a/arch/arm/boot/dts/st/stm32mp15xxaa-pinctrl.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xxaa-pinctrl.dtsi
@@ -5,7 +5,7 @@
  */
 
 &pinctrl {
-	st,package = <STM32MP_PKG_AA>;
+	st,package = "AA";
 
 	gpioa: gpio@50002000 {
 		status = "okay";
@@ -75,7 +75,7 @@ gpiok: gpio@5000c000 {
 };
 
 &pinctrl_z {
-	st,package = <STM32MP_PKG_AA>;
+	st,package = "AA";
 
 	gpioz: gpio@54004000 {
 		status = "okay";
diff --git a/arch/arm/boot/dts/st/stm32mp15xxab-pinctrl.dtsi b/arch/arm/boot/dts/st/stm32mp15xxab-pinctrl.dtsi
index 328dad140e9b0..fbb22cca9ae00 100644
--- a/arch/arm/boot/dts/st/stm32mp15xxab-pinctrl.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xxab-pinctrl.dtsi
@@ -5,7 +5,7 @@
  */
 
 &pinctrl {
-	st,package = <STM32MP_PKG_AB>;
+	st,package = "AB";
 
 	gpioa: gpio@50002000 {
 		status = "okay";
diff --git a/arch/arm/boot/dts/st/stm32mp15xxac-pinctrl.dtsi b/arch/arm/boot/dts/st/stm32mp15xxac-pinctrl.dtsi
index 7eaa245f44db4..f019611dbf0d6 100644
--- a/arch/arm/boot/dts/st/stm32mp15xxac-pinctrl.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xxac-pinctrl.dtsi
@@ -5,7 +5,7 @@
  */
 
 &pinctrl {
-	st,package = <STM32MP_PKG_AC>;
+	st,package = "AC";
 
 	gpioa: gpio@50002000 {
 		status = "okay";
@@ -63,7 +63,7 @@ gpioi: gpio@5000a000 {
 };
 
 &pinctrl_z {
-	st,package = <STM32MP_PKG_AC>;
+	st,package = "AC";
 
 	gpioz: gpio@54004000 {
 		status = "okay";
diff --git a/arch/arm/boot/dts/st/stm32mp15xxad-pinctrl.dtsi b/arch/arm/boot/dts/st/stm32mp15xxad-pinctrl.dtsi
index b63e207de2166..ac304329e5dcd 100644
--- a/arch/arm/boot/dts/st/stm32mp15xxad-pinctrl.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xxad-pinctrl.dtsi
@@ -5,7 +5,7 @@
  */
 
 &pinctrl {
-	st,package = <STM32MP_PKG_AD>;
+	st,package = "AD";
 
 	gpioa: gpio@50002000 {
 		status = "okay";
-- 
2.34.1


