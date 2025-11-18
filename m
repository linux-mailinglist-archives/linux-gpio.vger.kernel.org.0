Return-Path: <linux-gpio+bounces-28679-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 14523C6A95F
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 17:22:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id B2B002B73E
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 16:22:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 591593A5E70;
	Tue, 18 Nov 2025 16:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="aF29vmiT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51D03A1D07;
	Tue, 18 Nov 2025 16:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763482841; cv=fail; b=QnoIpPK7bODRE1ltU68gFgUX9TetyyYuU7Vxi9g0yKX7apmjPO8IpdeY4epMYKF+IoAeqWWEELHKGVcnyghitEUwfuupkcwC845zr3PfNn1+4sB+Ut7yVBLChoiw9m8QFycJKS5qlSCCESbLBpigGaIiJheRTEEzeVBLr0nFRzc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763482841; c=relaxed/simple;
	bh=C3vVmU9txVqcwu1FqVKNisud9fxZnnKVfUURxBL/hcQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VniJ5ru+lVVbkuGUIdgAMmcVuM9oSrmy3viPXtTNWXdEtQ+OvU/S8u1KViuHfQdjWw37dgvCfoZCt9AB1E5ICSrmElqsuKBuoefryBaSpfsfDJFwV14mCfthCDaVm0Xe1vEY+s4k9mhKt0LlLCZinyEG8H1uPf6h3RfSYVdtnh4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=aF29vmiT; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIGBAet104626;
	Tue, 18 Nov 2025 17:20:03 +0100
Received: from osppr02cu001.outbound.protection.outlook.com (mail-norwayeastazon11013041.outbound.protection.outlook.com [40.107.159.41])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4ag6nwcvw0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 18 Nov 2025 17:20:03 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wLgWaelkNZuJd5ToXKHp6MhtaskUoB+AgHDT4Wo1DVtWlAapVu2ESAKXd+YWBLQRNOWlHz8XNeFwnxe0V9Kg1z/ADETT9WEbce7Q1ZDCDWeH2SXMAVB4MBW432PShIaG53HswVqRAMrVnHZKDmyNNxMz2kmVxBEtrOo1wjaaWA/uU6bcY0+vkpGIJBU4vKjWLT0LU1eDuxtruWONyScTiDTkkuJlhVr7t8PHTN3eJrVfoF8C//HEysM48O0NQQiO/Jm4yF8w3EvqxMjc0jwRz+IyqWDauVN1xZCF66j8u95Y/cfEGONNgV8pwARofz+BnYYJVORRkqR7ZCu9qYEFtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kkOEp1UB68Zz0wf+mA5kHrpVXd1/gJjuYN42h6S/I8c=;
 b=CReFgnKZCMu/FjGkQcKxTYGKTCOPVf9gT8lffy/elLuI2wTL5Cy8OWWadg+4Q5ouxqZVPC+M1N8/a5h1Io1U2ivw3A7zE8eoVblOV7aLeIKhCZlNAzXqSZa5LseF/7eD65NYmXdpKvjC3OWdffZcU7zkMpWwKytWbX1W5ZZyIFoYNGTXhhZHbaQfsll5mQ/CDtYI2Kdcv4Js0Nv76tbwifSaO4WBL7WnL5oUhj1xLKcNrmiJ/17AkL900ro7oKHggOwGHGlEfGC1IBuFws49/+Dm6ZMVccw1pXBtNXDBA/Yaa7/g/3I83ez68AtOu66FcXTQSEY50hm+fTpnEm2XaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kkOEp1UB68Zz0wf+mA5kHrpVXd1/gJjuYN42h6S/I8c=;
 b=aF29vmiTfLE2KoSeFjzY/DQxBlHr24tpHr97DsDocrze/zDHpSAscLq5ZYnQCtn5MApnM7LXBvL4CLjD1QGHFiI9UIYCyIvxNC8Zkj3gzCOFn6JQYv34Tu89dSARJIdrR0nhvQD6Q1Rbf3rYuLl2SqBMG4U8JJElclvowB3lHAcY0MhR/lmMyvJzCfk72fbtnn1CvKmmPISOnqg1+Gum0CFDSUkUcHVZ7eJhi8W5YzvrLrdCbou6hW7BMMwa7eGha8VjfpRfxMLCif3fKgXz/Z+xPh3jWdT6ZU3i7F3s51Ycq6huwh5MEDlY1W2nRLsEQf2Z/S8e5wUROHznaSuymw==
Received: from DU2PR04CA0072.eurprd04.prod.outlook.com (2603:10a6:10:232::17)
 by AM7PR10MB3794.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:17f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 16:19:59 +0000
Received: from DB1PEPF0003922E.eurprd03.prod.outlook.com
 (2603:10a6:10:232:cafe::22) by DU2PR04CA0072.outlook.office365.com
 (2603:10a6:10:232::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Tue,
 18 Nov 2025 16:19:51 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF0003922E.mail.protection.outlook.com (10.167.8.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Tue, 18 Nov 2025 16:19:59 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 18 Nov
 2025 17:20:07 +0100
Received: from localhost (10.48.86.11) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 18 Nov
 2025 17:19:52 +0100
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
Subject: [PATCH v2 13/15] arm64: dts: st: add pinctrl nodes on stm32mp21
Date: Tue, 18 Nov 2025 17:19:34 +0100
Message-ID: <20251118161936.1085477-14-antonio.borneo@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DB1PEPF0003922E:EE_|AM7PR10MB3794:EE_
X-MS-Office365-Filtering-Correlation-Id: d47f4ed4-6fc4-4aad-9b2e-08de26be5221
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gLONd5XJpJdAZ80npJaQCtbRaQz1EfunK+Q428nmIvxpdJmbPARBp5GKCnXM?=
 =?us-ascii?Q?+fUJRGPfCoO6wtdKmnh8PgWLDLruJ4UKxOoHDlyjGrjN66vuYkwRV3l1uAXR?=
 =?us-ascii?Q?88OcYKbAHTqEdTSY/cCPGUyv2KcQDRK4JVnHfsN/aj0cZ1tSlCvutq8zjULK?=
 =?us-ascii?Q?uFl2PS4v4RJGxMz8O27Dro+iCslF/O9lz3JNs+3gmY7g5xr4ekKoONEHcShY?=
 =?us-ascii?Q?wf2PqaBtdjQK+AdiWqGCQ96P6grDCCMpvoq5C3/5FOlEgvTQvZnZljQdiQ0d?=
 =?us-ascii?Q?8Lo9AlWjq/93khf4ftUxLw2gKZZaCfl5p62TxBnqoAAj9Y1C7OLPiozvccI/?=
 =?us-ascii?Q?TKb9v9AtthEOUtFkxxNT7iDzccxCPPm0BLEyR9uShZequcCI5tqLPG2FkNZu?=
 =?us-ascii?Q?7ZnqyqPOvTBZFHbLzHvwoXFxcUaoBmfO3vl6nogUT/pPuPOeKBbM+xl+R6f0?=
 =?us-ascii?Q?I/E/BVKI8LZWnzenqknvIqIftYXp/OgjHWehz04Cg43qPGfG+FDs1KvxoXaW?=
 =?us-ascii?Q?xBe9pUv54ecyLcR7bVEXsAPVglnt2JGRemlGWgpkdQ+mGb63bfoMZWnn/Lrg?=
 =?us-ascii?Q?OhhUFJEq34Ub0dQa5FqRUIwGKEHTIA3TNJc2qXuYz3QOqAfMdlb0yQS8c7jQ?=
 =?us-ascii?Q?m38WZFF5BQNaLTqRizadTqvvNRIYQC226DrJXT/kpZyDJ1HfQYd4L+14dGOx?=
 =?us-ascii?Q?oPLYDAxsT8Z8K9gA30MNlQEaWyb4h49cE3BGRWFc9McRhgJQlzZCBXPbig+I?=
 =?us-ascii?Q?tFyGVbeAmnAEFzgiJcXoqHIzDAlslN+hWlbXNnEDG/7/RYIoh3KTxGDr0PaM?=
 =?us-ascii?Q?bz2NnH4tVIi1pPc3WenZb3rltIzzFPBsaT4dUAyDO1BiIGtxsH1ZtezI8I9G?=
 =?us-ascii?Q?PI3YZSf2cqTAz/8F6h8JL79vdx9teKVSQDm1xKa33EiO+u8+/7FjD+voQzGc?=
 =?us-ascii?Q?B/gPXK+3LheFHyTzSYy8JQTFsbmZizGm677/iqcqJWWAVPb32m7hIGYRKLQa?=
 =?us-ascii?Q?wJlUPf8OtevdfDQHBkbQiN2MYagmIGBZ4xoY5sLO0GwpWkHNMukI5uvechML?=
 =?us-ascii?Q?TW4QhzatLGWm00sFLdKbV3uAFno9EuZlOV3BXl+JxII8mju3ss0X+By1l6xM?=
 =?us-ascii?Q?tukvrgTWFQLkJXDGZGAE2t8fpHLFRs9NZI5+FDTmG3hz2Ll1etca9sudDklU?=
 =?us-ascii?Q?BDNzSM6gPLcG+SXa/TBMlEQGRrw/FTyo75yDPYdB7URURva/efOheBGsyqoe?=
 =?us-ascii?Q?l0dbz5XYGuocSgrBV7PGLB9FneCo6ev3rSTeub0rsVGZcUDi6XL1h5bAn6BE?=
 =?us-ascii?Q?zhZ32/mei+ZssgdIKBMDr5t1GHJPErA18UcKnThnYibJH2Wk8vlDW71ZRkww?=
 =?us-ascii?Q?qe60K/Si1BPPGXvdgxANTz2cZbY5Ud/U32izVGeMU+fnyTEMf0s68QP71yNT?=
 =?us-ascii?Q?1y4OJEj2NXhxcNslRJ5khMGOLjkZo8h7WbJpviMPTaQvKizZVMvS0gk21/9d?=
 =?us-ascii?Q?UvhpdH7eYkFqlo1tOUmTsTQfzm79o7Rj83T6AJdQFJKnR6fLLH1TVssuAeSw?=
 =?us-ascii?Q?owRSwfKyDIPG5YQG1wL8hOB5rJtuhgxBtv+OQ9xA?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(7416014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 16:19:59.5454
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d47f4ed4-6fc4-4aad-9b2e-08de26be5221
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF0003922E.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3794
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDEzMSBTYWx0ZWRfX9FggP/ow3hBT
 p/dOclOAE0v04U9yN/plrAF6SSswdrcA0dgBJAqYU+Q3jiUDpOCgCJKgc1A3JXor5eXA9iKA0cw
 3UbBIcK5v00DfIRyDrhdmal25LzWycjjivZyrNNtDNDFpeb0Y4pupgg4CefU6sJqV/Y/V2CG0WO
 M+7rOWiB679MtCiT7H0xaNgYM63kyrf5nvObtB9c5xxxpC1UHTELsnBEZ/N025dm0B4qlYC5sru
 6QN4Ja/B3zA5nOQ4WSAefLZyr96QEIlftz3xbpQbSAsuG1U8swWdY0DwFiyiHvptj4+ZpIkFHXK
 LeyCu9YvBaKPea79SeALfhumzPxuxCixieyYAeGMxf+8TlJKmAiVHpA6JwZIk/AfqWRZ42PBOHY
 5oBfiB+9lqLb6DVKtxlPEMXmX7TguQ==
X-Authority-Analysis: v=2.4 cv=WPVyn3sR c=1 sm=1 tr=0 ts=691c9cb3 cx=c_pps
 a=GrztFhi0USRFALZlYqp0Hw==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=y9YUpebZf6kA:10 a=6UeiqGixMTsA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=5i_IRMTHtInRKmmbx1QA:9 a=T3LWEMljR5ZiDmsYVIUa:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: sm16d_WfZZy3BHYybzK7unx1b-0Oikul
X-Proofpoint-ORIG-GUID: sm16d_WfZZy3BHYybzK7unx1b-0Oikul
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180131

Update the device-tree stm32mp211.dtsi to add the nodes for pinctrl.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp211.dtsi | 142 +++++++++++++++++++++++++
 1 file changed, 142 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp211.dtsi b/arch/arm64/boot/dts/st/stm32mp211.dtsi
index 4bdf4b3a39829..fd561a85027c3 100644
--- a/arch/arm64/boot/dts/st/stm32mp211.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp211.dtsi
@@ -3,6 +3,7 @@
  * Copyright (C) STMicroelectronics 2025 - All Rights Reserved
  * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
  */
+#include <dt-bindings/clock/st,stm32mp21-rcc.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 
 / {
@@ -205,6 +206,124 @@ syscfg: syscon@44230000 {
 			reg = <0x44230000 0x0 0x10000>;
 		};
 
+		pinctrl: pinctrl@44240000 {
+			bootph-all;
+			compatible = "st,stm32mp215-pinctrl";
+			ranges = <0 0x44240000 0x80400>;
+			interrupt-parent = <&exti1>;
+			st,syscfg = <&exti1 0x60 0xff>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			gpioa: gpio@44240000 {
+				bootph-all;
+				reg = <0x0 0x400>;
+				clocks = <&scmi_clk CK_SCMI_GPIOA>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				st,bank-name = "GPIOA";
+				status = "disabled";
+			};
+
+			gpiob: gpio@44250000 {
+				bootph-all;
+				reg = <0x10000 0x400>;
+				clocks = <&scmi_clk CK_SCMI_GPIOB>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				st,bank-name = "GPIOB";
+				status = "disabled";
+			};
+
+			gpioc: gpio@44260000 {
+				bootph-all;
+				reg = <0x20000 0x400>;
+				clocks = <&scmi_clk CK_SCMI_GPIOC>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				st,bank-name = "GPIOC";
+				status = "disabled";
+			};
+
+			gpiod: gpio@44270000 {
+				bootph-all;
+				reg = <0x30000 0x400>;
+				clocks = <&scmi_clk CK_SCMI_GPIOD>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				st,bank-name = "GPIOD";
+				status = "disabled";
+			};
+
+			gpioe: gpio@44280000 {
+				bootph-all;
+				reg = <0x40000 0x400>;
+				clocks = <&scmi_clk CK_SCMI_GPIOE>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				st,bank-name = "GPIOE";
+				status = "disabled";
+			};
+
+			gpiof: gpio@44290000 {
+				bootph-all;
+				reg = <0x50000 0x400>;
+				clocks = <&scmi_clk CK_SCMI_GPIOF>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				st,bank-name = "GPIOF";
+				status = "disabled";
+			};
+
+			gpiog: gpio@442a0000 {
+				bootph-all;
+				reg = <0x60000 0x400>;
+				clocks = <&scmi_clk CK_SCMI_GPIOG>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				st,bank-name = "GPIOG";
+				status = "disabled";
+			};
+
+			gpioh: gpio@442b0000 {
+				bootph-all;
+				reg = <0x70000 0x400>;
+				clocks = <&scmi_clk CK_SCMI_GPIOH>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				st,bank-name = "GPIOH";
+				status = "disabled";
+			};
+
+			gpioi: gpio@442c0000 {
+				bootph-all;
+				reg = <0x80000 0x400>;
+				clocks = <&scmi_clk CK_SCMI_GPIOI>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				st,bank-name = "GPIOI";
+				status = "disabled";
+			};
+		};
+
 		exti2: interrupt-controller@442d0000 {
 			compatible = "st,stm32mp1-exti", "syscon";
 			reg = <0x442d0000 0x0 0x400>;
@@ -267,6 +386,29 @@ exti2: interrupt-controller@442d0000 {
 				<&intc GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		pinctrl_z: pinctrl@46200000 {
+			bootph-all;
+			compatible = "st,stm32mp215-z-pinctrl";
+			ranges = <0 0x46200000 0x400>;
+			interrupt-parent = <&exti1>;
+			st,syscfg = <&exti1 0x60 0xff>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			gpioz: gpio@46200000 {
+				bootph-all;
+				reg = <0 0x400>;
+				clocks = <&scmi_clk CK_SCMI_GPIOZ>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				st,bank-name = "GPIOZ";
+				st,bank-ioport = <11>;
+				status = "disabled";
+			};
+		};
+
 		intc: interrupt-controller@4ac10000 {
 			compatible = "arm,gic-400";
 			reg = <0x4ac10000 0x0 0x1000>,
-- 
2.34.1


