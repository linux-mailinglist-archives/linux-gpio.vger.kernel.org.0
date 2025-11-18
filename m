Return-Path: <linux-gpio+bounces-28684-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B813C6ADBA
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 18:13:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E2F9D4F6B62
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 17:05:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4019377EA1;
	Tue, 18 Nov 2025 17:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="T1bR4O99"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07A236CDF8;
	Tue, 18 Nov 2025 17:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763485548; cv=fail; b=bU5kKJPoSt5LUWo8sTnEMbxbSQylEJGgMSeFZCO9JOgPSqmqMNFPU3DkOh2zRcvAQXKe09oXgMZbjbgY2RNeZ52jPjlh87xRvA6rWtd2WnizytkGOInem23xO98/E85czf3YKAHttfBdfPELcO4vMnyz3qgasvpLKIJ7OvwMpqo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763485548; c=relaxed/simple;
	bh=zQllCc82cQlJXpvMJLJJQPZmHSpWrniMLzBlAG/B/Jk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k+oMnetwNa6sXqFSw+tYP7+SZkgg/uPKv/XJUJuVSS3F/6XgJ6IH5ZL4Z+6GYfnx0gyKPufQbSEUryVFEqHc4jtiV2WnWOzlnNyW7MPgLltbOlEpT9D4AT+abN3uOldp5PmasG4HwOy5baHZWHnRBqPnxz8Gp5Zkq3l09+VdcXE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=T1bR4O99; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIH3UuO504506;
	Tue, 18 Nov 2025 18:05:16 +0100
Received: from du2pr03cu002.outbound.protection.outlook.com (mail-northeuropeazon11011061.outbound.protection.outlook.com [52.101.65.61])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4agndtj96j-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 18 Nov 2025 18:05:15 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ghLTmdPW6V+v2vjw5rMMlyiIWFzDFtVrqPsU5aavQkUYdJ2iTaS0AOZKb1rQj0ZpA9qyHAScGUCPaZI/LEwa1rDLtdzBnYP73+V51xO0SQPS1zzV0PyiIlzpdtUYqtPTfKq74xz/VVHWvzOvI14UTxr/Hg9t0g1QTITfaDWI6f6xSMBZmr/lp0qFmav3TlVyWLk9ZTnW39ChLWtpgrn1Gw4zQWvRsD4avXe4WDtpVkP+mKkiagmvtBJvBj7fkpu/uQ9KwEtmjYo8elHqkDtmC46d0P05wV3xvybqwBsM7phrQ/35Ig7lpuFlVLAkvRPMhTxxYAOly+InTKNRxAJmrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XVwZCAt0lP3NdUCEmcxyhCg2Flf5qpLt/4FK4E8Ji4k=;
 b=hT41we0KZW5/QVtkvCWN9uq8KhNSHD6QFmjtl0Iab/uIGSzMibI4mI69wrTyj09PUoPaeE4nm47Gb4MK3IPNs3h+AlHvyKpzNGNleUhacoYaByUfroyavoajoeikWElIMADrgTVDEy9LCsNH9ke9MgYJi/amgfJJ86usxtzFzh0GMMpc02WPLt7qFDktREmeWmGvYpCKeJ5gAcRc0LiAkLrSvkGwZCkXg7wYYT6AyfFNJ1tf9hLapQ58cEdfXT62pVA/aJAAlXgH70wEe2WRm8uJaDcyGDFFwzgGyznEXfYl5Ciw0+AF0ELviqHP7JmPwOziAfU3GpL90kVVDCG9Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XVwZCAt0lP3NdUCEmcxyhCg2Flf5qpLt/4FK4E8Ji4k=;
 b=T1bR4O99g+DXZ5wt8NCvvu7UF18knzWXdKAQPLYilte4orPljw44jlbJt5/FnYoPIAuV0dQFvTgIRhXC/2BJjWDA79s+QMcbm9UVr1xSSlOtcSxmqTE99gl7mRChEcck3+IRBYMYfhqbCTGjH+f+kK6Ez1qxhc9Irg9FuO15Jp0M1cTpb2iUBNK+DDseNnHH4yI1TfaFT3SNxa5vAiF4HWJguYYQT82cyPfyWaDtprjZLgdSyeDcBYlwuM6iDcpsRO72Oq7SSFRpN4gguVkM/uWaeVB58gJej4fnqCCDsc7JPnsVmtTDJqSGd8osEaYCmS6oSF11luG2RaoeFCeyCw==
Received: from AS9PR05CA0348.eurprd05.prod.outlook.com (2603:10a6:20b:490::18)
 by VI0PR10MB8936.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:239::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Tue, 18 Nov
 2025 17:05:11 +0000
Received: from AMS1EPF00000045.eurprd04.prod.outlook.com
 (2603:10a6:20b:490:cafe::d9) by AS9PR05CA0348.outlook.office365.com
 (2603:10a6:20b:490::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Tue,
 18 Nov 2025 17:05:12 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF00000045.mail.protection.outlook.com (10.167.16.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Tue, 18 Nov 2025 17:05:11 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 18 Nov
 2025 17:20:12 +0100
Received: from localhost (10.48.86.11) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 18 Nov
 2025 17:19:47 +0100
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
Subject: [PATCH v2 06/15] dt-bindings: pinctrl: stm32: add new package to stm32mp257 pinctrl support
Date: Tue, 18 Nov 2025 17:19:27 +0100
Message-ID: <20251118161936.1085477-7-antonio.borneo@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AMS1EPF00000045:EE_|VI0PR10MB8936:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a6a3321-a276-4202-ad68-08de26c4a2ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?S42W/aTNZZI+X33pVvXcP5Zxhxu8uUwoCzRRy9NVZMJ3Mg2tHFqzD/jz0pJx?=
 =?us-ascii?Q?TDFVd4CdIH55cZ/iQF59yiEQiYMoSN8kZ7zBle15b7oxCdZQL0n46WrK6NnU?=
 =?us-ascii?Q?4qM1fZcJduPBT8YMb6w54B0L05KWPb8ePaTKnlBvFZj7SAqlWAtwMMS6/o3N?=
 =?us-ascii?Q?k990zc6vGOo6gXVDYBG1vOrs+czQy+l6iIDm3rowaQ25z3Y9frq3WnSKKMUe?=
 =?us-ascii?Q?sIju66dc2d+mPSxDwY/5KgobPwBQWKPRQUs7wv3FAxJDjAH+Ed65WyOQjtcm?=
 =?us-ascii?Q?RfJLEQo38L0fYjmxDJYni9SEEiqkdMv3IdSNb4fyM2x/6YPmV2eq/R7MRVVS?=
 =?us-ascii?Q?zGaXN9A/iGslGBk5vTc/N6R/mu2mBHqSRd/s0dpPwXnBJFL18ArdY6P6Oeds?=
 =?us-ascii?Q?16dO3mZrv6ZgDHalcabn8M+wkMEz9Lq8lROOY8KOx4mL7wivXkdT8fnma9O6?=
 =?us-ascii?Q?yI8v/fpbwJ1uMU0x3WcdTudAv1+TxrXnW8IbCTLQlo1QljDuQfhDP4bR+g4+?=
 =?us-ascii?Q?Fl275glyZe2xMspfSVk02+AQai/cfWFDsgKiyVmWEi3GoX+hAIbHHiXDHnjV?=
 =?us-ascii?Q?Dl7Ay7bsrHhY9ZkHKECD+0o6ownHRoN18sLf4Ag4CcLAeFT5i6qcUq97t3T9?=
 =?us-ascii?Q?Qhpol+/hi79E39Rhyne7y1emhWpY5UdERh8GIDn0cNbscL5YbqCiXcYBAxAo?=
 =?us-ascii?Q?mZ07yuE0bKE4H2twus+WNFjLFg8/uREkxVCjMON8UwrADny5qepDQ1ffUoMj?=
 =?us-ascii?Q?8O3JOvQv6WPLLXP/mTooGpKzSHeIADs/chY/ZRcI5ARweA/fAsc2wVil4l4P?=
 =?us-ascii?Q?mKIDAjbxg59BzkEZutsg3GZXDiLtzagbGJ1R/Dk2dePKxUlB5/bQsUt1lo68?=
 =?us-ascii?Q?Lc03TFwbRzOVZ5QZOwt1ejZUpIkT9WGCSj8De1wdMwCjfk3J/W34XnK65iEK?=
 =?us-ascii?Q?wcXi+iMEel6gXJ9mkgFta98GzpN80sdPG9yylMt/2ro6Lw2oSvA1g/NJAcfK?=
 =?us-ascii?Q?vnNYXnXNoJAqn4tZgiLLZOv48MBpRjd3BH4Skdawjuz42KILbSr83rFSerHv?=
 =?us-ascii?Q?fO89jRGwQAkN0cbKAsnH7OBiMcGMguv4Sqs/6mZSsYq+0k3ETTMcj1MGei8/?=
 =?us-ascii?Q?iGUP59xwWswZpnUecLloLP1WQt/4HheLSRZ19zIpQ7zqEIuNWZXr+og0chrE?=
 =?us-ascii?Q?blvq+qTSrXcJGrmP2Wfd5CQB01rHuDvvzlkf7MBEEkl1dU4KgUBu0bzsDMmM?=
 =?us-ascii?Q?jl4jET0nj8/vmhLHlUvY05jnvOaaaKEjupawmwwI1UHopFDrI5U8GEOloYGI?=
 =?us-ascii?Q?V5rpt2sBYySNEWfiOnGM+NRXlOsgv98PXAHPjMS6QwPDHF1IV12Fa1dq8MjZ?=
 =?us-ascii?Q?6+m/DEToJw9VFRMiviVhCM1Aob0c64OehajY5LbImbvjmx2Jzge18PeugIRD?=
 =?us-ascii?Q?xvp/UmYsocknt0Jf7o7CvxO/pB7DW6vdAVZ96VD13HT1kg759AWhYMUKg8hA?=
 =?us-ascii?Q?DSykv9ZnN8myNVARqdf8odPOf3rcZl0u8nD9y/t+w7W92JpOUgBD29Y4E1XB?=
 =?us-ascii?Q?+ad4snYmKzArr9Gl5OWgCdspyh3AX0nhy5D8wOdo?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 17:05:11.7962
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a6a3321-a276-4202-ad68-08de26c4a2ba
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000045.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8936
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDEzOCBTYWx0ZWRfXweOV7Nw3J8HO
 dymYJFHHbmzdr4LVxCtYQRtAxuDr7gCK5eA0Faq7xMRCDFeyETJdbstqfyOZMGWUFKDW6+XzpQb
 H7n6dmPlHbWIyO/zAcx7IeZ1x5JnHwbBMUJ19u3v2RQMaPDsAgf4/76RaMtH/ZyV1YLo6XOPQ6Q
 w3at+vafzbIcUy+4NY3ETKyPn+AlipgKOBR1GVF/W6QgpwNqsqofnsD+X6zwzQvoSauTNYnAAae
 NbQi9kd40joQl0Tf7FycYSBiU2VhN51jXIvS4A7hcnICdCh/0zVkbiqHhY3/ACN9J8gKCKiw0RN
 1OgpjizUy5z39HbVWJnJ98TZ0bOdklAuv2t0RKXGoQp9jdqIba7Hsgi0cuSNmJv7rT2vTNt/FB1
 8PZgTlEPNkYknvXojZFpaoIgDqCcYA==
X-Proofpoint-GUID: xq5-p7s3_EWb0Jv_SsIRuOUIQdMLXTjj
X-Authority-Analysis: v=2.4 cv=Uqhu9uwB c=1 sm=1 tr=0 ts=691ca74b cx=c_pps
 a=EUaLOA8Z8AdjKRxvbO/E2w==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=y9YUpebZf6kA:10 a=6UeiqGixMTsA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=hXECQbzG_lJ34Zqc32MA:9 a=T3LWEMljR5ZiDmsYVIUa:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: xq5-p7s3_EWb0Jv_SsIRuOUIQdMLXTjj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180138

Add the package 'AJ' to the list of supported SoC packages for
stm32mp257 pinctrl.
It corresponds to the package type TFBGA361.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
index 73277f515a8fe..27e1efee13481 100644
--- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
@@ -69,6 +69,7 @@ properties:
           - AC
           - AD
           - AI
+          - AJ
           - AK
           - AL
 
-- 
2.34.1


