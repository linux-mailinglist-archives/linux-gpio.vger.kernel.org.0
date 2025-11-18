Return-Path: <linux-gpio+bounces-28675-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7D2C6A9D1
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 17:27:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 38F134F171A
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 16:20:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4104D36CE0D;
	Tue, 18 Nov 2025 16:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="oXstZmB2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C53136C5B6;
	Tue, 18 Nov 2025 16:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763482829; cv=fail; b=F7LkqOXgbm/ObPlZ0dGMisR8v+hXzs/s5WxXRc21gdmN2vGepdepItQgBNwvO/eejg4xu4XdRPziZ5CmbMOimMYfsPUI790OuVN1bNWzkqxQAZH2jeM87IVB9Cp61LUzvv1m/7TXM50RWoeRmKZ3ASnzrUFt9tK3sBXVKhAyEe4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763482829; c=relaxed/simple;
	bh=9EwBx5diKxVUYqyZ/2Uv9d2pbbMT0RpmFH4kuhZpMP4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=vB+0StHZzoMlESZaxZmAN/rQ7QxpOhcTjWpzyBwKOoJhPQvmV9MOVQLLbcpg2tFscSg+z7kUpe3DS+JQHGZxb8d8K43IuMaSsAZ3k4fGtBcqBhyOxVnkkbKjNaU+K5Hj4uFeNwA6XyRgySGCYXRQMIxayMBulHtHjAd4NhDQhhY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=oXstZmB2; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIGJaGJ108117;
	Tue, 18 Nov 2025 17:20:00 +0100
Received: from gvxpr05cu001.outbound.protection.outlook.com (mail-swedencentralazon11013016.outbound.protection.outlook.com [52.101.83.16])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4agrub8vfk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 18 Nov 2025 17:20:00 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pA7EXiibz7mFyXFqF21Qh/PXI60DHdFlc1iEHbwf0X7mM5LpbpGc7D/COKQ7vyM/kaqGYGKvWdhwBG8HT2A9OPMkg6/MAicPIYOZVHkqBlGMzegFvt1nOPdiPrGa9/seDZG5Wore54ofFwaOiioc3L7Vcl2XUtq6Ps3rTcyG7QoPjZwacCj9fzI0eVNre2PAtCc8Ca1jgcydb5QsrEnW1C+EwFHK99BEh0L6i+0Wae+TkukqibAzWTJzJCcsKaAc7IAhW0pewahslaNPb8nGeMPhoBM9Qs+G6XVVSLy+/qtwaGnq6PMpEwZTxyvnXhBE/Tjs6wI+PnE5S0Wpv3HPUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jXNuv+0KjapdYnuPaEW9TsBH/ZX5p8xssm/Z3nLujz4=;
 b=jaJL4rHt/2LtiHotKdmTJDs/hG4Tf5Nwf/zANeyhcYnApiUh7I6G1R499mxiKW63b3KytdKY6FwXDPb3gwOUUtARBNuyonmKWbDGxzy68AWd4LIP69Vi/IiqBZMGKeuEwUtYf9ZcBDc0kp5MnEDr208gvMqYcX0ia41FVLla1ElnSq2DzFxaaaGCc8aGzbjlaRoUszL/pVzCEZndhE4khrwwH22nWRwb6z5QPaT9bKPpQhkutWPK4AAr3D52Sw8yTVPDTwqd5m1ODBnrNNFpeM/GUtSDuACty37BpIg/dzq80aT1A8i7IMDk554HnKrPxN/8zL+5Svbnvhp/vjdelw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jXNuv+0KjapdYnuPaEW9TsBH/ZX5p8xssm/Z3nLujz4=;
 b=oXstZmB2BSy3y7MtAxJqNdRXNSotEj+XWolOQBurZH9T6MaauRz9wgCycjlwLWs26HOnMvoZomCB7pc77dnNWHRS8O1w9Hs8WybOt5zYXem0eQLFiiNGlqNyLYQM1O98gtdwompGs6z0Z5MDiINQNm8Yawy2uZC6VNsko4MsaCVglGMDodOB5IBVFUWNj0o9KxHt2FOM3COI1/9knbxp3ZVdM0DSqVJkc4FrnDtWuNrXHV36nBOE0/AZCVl0jdM6MRuxK/j/dDqfTLWFI1Y84eRw22JoMaRh8HdjyM0I4VXXtlCp/pOCXmvTNfOmnY+WWvR6qjT0+GQ8XsfFUpUY0w==
Received: from DU2PR04CA0069.eurprd04.prod.outlook.com (2603:10a6:10:232::14)
 by DU4PR10MB9620.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:645::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 16:19:57 +0000
Received: from DB1PEPF0003922E.eurprd03.prod.outlook.com
 (2603:10a6:10:232:cafe::ac) by DU2PR04CA0069.outlook.office365.com
 (2603:10a6:10:232::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Tue,
 18 Nov 2025 16:19:57 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF0003922E.mail.protection.outlook.com (10.167.8.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Tue, 18 Nov 2025 16:19:57 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 18 Nov
 2025 17:20:00 +0100
Received: from localhost (10.48.86.11) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 18 Nov
 2025 17:19:45 +0100
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
Subject: [PATCH v2 04/15] arm64: dts: st: update property 'st,package' to new bindings
Date: Tue, 18 Nov 2025 17:19:25 +0100
Message-ID: <20251118161936.1085477-5-antonio.borneo@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DB1PEPF0003922E:EE_|DU4PR10MB9620:EE_
X-MS-Office365-Filtering-Correlation-Id: 62b4e789-8472-4320-0ef5-08de26be5102
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|82310400026|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sulJaZTH0bDgyvBJE3KAItFUzimKA2ZRfCz+Y/M7JTCdzvOFFoYF+KlQuPZs?=
 =?us-ascii?Q?pkKSOYF/5NNOWkA5Odz2uUBrDTu9pop89muGNTOQCb9iWueZR5+CLr+uv04g?=
 =?us-ascii?Q?julxb2q1nHyJLQJ+RfRQ/yUApVLTSkUU/bfYkz/3e8HBL82SEjRNlL2P3QjX?=
 =?us-ascii?Q?KsvzJPylnAjtv4iapNjofqZk+7V96S0/syylivQnMOBhHveIMt/DWmR3JeT9?=
 =?us-ascii?Q?/bYCIECnja+6ykB2FPG1cRu27EAo2POty0d/F4Z43PJb1kFRDOSJuID4KQC7?=
 =?us-ascii?Q?eQCVAUlEMMYQQLBg/gIK2q0i4YzfnyVE1fT390WdME/bARTnGilvbrkwDj9S?=
 =?us-ascii?Q?qE+GHm8VsDU4KkzqDUnaVsz1cdpPZaNZ5RCuNQHloFjnp6pNgMQrnlOINcJw?=
 =?us-ascii?Q?ekc/6IRcCp44XSctlh4n/PCTy35w8X5a+yIXrshvbstUMIqT/HqKYk5PelBS?=
 =?us-ascii?Q?UA1DtQGUIH6yI2WGl3HtcVfi2h0cMJoVo6R4/tFRI7iGoKS7yLsFov03BtRE?=
 =?us-ascii?Q?9X8uXCtC5tmTBEYCCajJVDZpXGYm9qQywV6i5eZAKbeRgCSEIaYKQWTB1FwM?=
 =?us-ascii?Q?R6Z/JtnJLU0XEj2Y+EL5FBzrX0AM1EgnY165PIX8sIhRX0CT9XNlFMD25KGx?=
 =?us-ascii?Q?cW9LG5xQiTUi3LlRAzwOgDuamIEq3V1xh5ICO6V1QycNO9j/lzVJexQNL30E?=
 =?us-ascii?Q?yON0/1kkH/ogBYauaawdYO55aFp3ClTF//GniwaOi2m8cEedbeF/9aWpYt+H?=
 =?us-ascii?Q?UXGPZAiyPt3gS2SRG4hNE1dU/tk0ASFSY8nUeJv6bLul5m+Gb8JcbUGNCrOP?=
 =?us-ascii?Q?NyfJTAfZEEI02rHuTBENxiUyyQoDB6TrPFBrf55ElXcXNX1ogHeKpFNeJjH7?=
 =?us-ascii?Q?T9gAprmENkiBZQ6txs1sn5bax6HoCIkjlTH8M74rBD4NASkwiKfgjjbL6J8d?=
 =?us-ascii?Q?pzkIbpHzkuoWtA1sdz86oaErpPz+6YwPOM+AOcW4Fa4LrAvk0+vIJyNEWFtU?=
 =?us-ascii?Q?gYYQcIxVTxF0oFZMzzZHwO7zWkfhOh0wNLOZaz/wlwTyjzfLw9/xi7+KghRT?=
 =?us-ascii?Q?T8G33lCR8a+bWNottxG4LLY3Z0pSPNJcUKkDa7IPDRpIfrXzZaL6NGtZ6HEM?=
 =?us-ascii?Q?fgzSQSK/F6IgGav8udtscxxQCiMDbUnR6lRKBFpbdYnDowno+4IoXy32WDJ4?=
 =?us-ascii?Q?P9jum32rOx6s9Rnnn8P1lpTgzwTXb+IHQxwslIOjaSEaBR8tu4EjaEWWgxMr?=
 =?us-ascii?Q?0qzrBe0OviS/F8gT0I9FTjkvrhR1IYROKXm2+/kG8ZqK5lFYmv+9AImSGUA0?=
 =?us-ascii?Q?xsYHr6NzRvnBx5Dud33m4DE79g4DHznQrI8YG3vhW3FIio5vbN6leYn97rRg?=
 =?us-ascii?Q?+de9LnKIPzKSm1mI2MAnOtDxg8IJvd2ulZOgepZgBS28tBBNHqxHfGzTHTdf?=
 =?us-ascii?Q?mZPAdpV5cekPpiYc8YzZuVfVwyM0Wfv20kgoXE25DK2u6OFOq7WIq8IrRcFU?=
 =?us-ascii?Q?cw9Oa49l8lCE/ZFJVEX2IBKp60zsLtzYJKfqwrWYLTMOh3Qi7c1BT3qRA/na?=
 =?us-ascii?Q?avtnHakzo8tqj8BJlizqy4OlJUXKq7jW2Brw3vXL?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(82310400026)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 16:19:57.6817
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62b4e789-8472-4320-0ef5-08de26be5102
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF0003922E.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB9620
X-Authority-Analysis: v=2.4 cv=LKBrgZW9 c=1 sm=1 tr=0 ts=691c9cb0 cx=c_pps
 a=pEH+0fcWjejdo5BwJR6p8Q==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=y9YUpebZf6kA:10 a=6UeiqGixMTsA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=456DfskNNfzbJWC3vVwA:9 a=T3LWEMljR5ZiDmsYVIUa:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: zrAlWzpLe_WMs6rp0sG3QZzUgHOzVDpW
X-Proofpoint-GUID: zrAlWzpLe_WMs6rp0sG3QZzUgHOzVDpW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDEzMSBTYWx0ZWRfX3nJKYri5ab7p
 uKGVrE/NxFqVSES0DTstXGYHY5/GDaPi7rdV7XhOcRfyOslfeLu0u+nCaKk+zNBDUiMlmhAni7M
 ylk0Bs7RECqAd1DdzxDicmv6NwRkDclOjNA5uSBiQZEGWJOc4uPXcTm130U0W0qwshggwCgQQqh
 Dhz0WjDMwZGs4cqATYxKrEHbNXWGWsw7naeHZ85yZjU87O5ysdE2VgXKSW8GMyRbp5UlTiQtQBd
 nTEiL6GTCnJQju/izkq5ki5qBoLnqtfNix8U63WHzwmsHtESVD/Evhi2BHH0V1GkOh9yh+YhYix
 3+ul4h/B+1V93H/hUHVjJOx1TSPujYzdw3NoEYE9e109qHIF7CHrS+C8O5LnqOIHODx8zoPl4SV
 yCnPu45RsGCldGAfv9fuDDNKVpmUVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180131

The property 'st,package' reports the SoC package used in the
board DT and is used to inform the driver about which pins are
available for use by the pinctrl driver.

Use the new bindings where 'st,package' value is a string.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp25xxai-pinctrl.dtsi | 2 +-
 arch/arm64/boot/dts/st/stm32mp25xxak-pinctrl.dtsi | 2 +-
 arch/arm64/boot/dts/st/stm32mp25xxal-pinctrl.dtsi | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp25xxai-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25xxai-pinctrl.dtsi
index abdbc7aebc7f1..c1dccdb634dff 100644
--- a/arch/arm64/boot/dts/st/stm32mp25xxai-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25xxai-pinctrl.dtsi
@@ -5,7 +5,7 @@
  */
 
 &pinctrl {
-	st,package = <STM32MP_PKG_AI>;
+	st,package = "AI";
 
 	gpioa: gpio@44240000 {
 		status = "okay";
diff --git a/arch/arm64/boot/dts/st/stm32mp25xxak-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25xxak-pinctrl.dtsi
index 2e0d4d349d143..b485056801c92 100644
--- a/arch/arm64/boot/dts/st/stm32mp25xxak-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25xxak-pinctrl.dtsi
@@ -5,7 +5,7 @@
  */
 
 &pinctrl {
-	st,package = <STM32MP_PKG_AK>;
+	st,package = "AK";
 
 	gpioa: gpio@44240000 {
 		status = "okay";
diff --git a/arch/arm64/boot/dts/st/stm32mp25xxal-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25xxal-pinctrl.dtsi
index 2406e972554c1..1e55ac283fab7 100644
--- a/arch/arm64/boot/dts/st/stm32mp25xxal-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25xxal-pinctrl.dtsi
@@ -5,7 +5,7 @@
  */
 
 &pinctrl {
-	st,package = <STM32MP_PKG_AL>;
+	st,package = "AL";
 
 	gpioa: gpio@44240000 {
 		status = "okay";
-- 
2.34.1


