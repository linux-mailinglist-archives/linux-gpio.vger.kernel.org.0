Return-Path: <linux-gpio+bounces-28678-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C03C6AA23
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 17:29:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 288C93A0BED
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 16:21:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96C3F3A1CE9;
	Tue, 18 Nov 2025 16:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Hlxm49kA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D4E377E9C;
	Tue, 18 Nov 2025 16:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763482835; cv=fail; b=NnjMKQyRSojcLb88+YNWeAtwNX8rjW0GUEmnchNCdvx8K9gYf/9bpDFBi5JfAKlkZytQYA2Ql3AVBe/vZ3Ok/9HXOVwN2Ib3hIl4/pg1ett9lRxmmHXcJmKsKGVCJibcwIgUEANXwAp/qWSZtCs5x2umDHvxxPXzcbArpqAtcwI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763482835; c=relaxed/simple;
	bh=gnSURVRExRJPjRMxy6rXeJI1BzBOuM3W6RqxX5LQI3Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EdhwdosPYk1sBH/vjK2EtGMN7kPx8YY/GmaPjHOb4CNbTrozr2braqWxsSy1fHJpHp6LY/fXEENQNvMfhfMRpy4VuCwi8t+wzpdshjw1I64M5hKtt/L1lRYWlOVVWZq/lHIdTTMq9Y1S8t5X13fdnbFukebTD0+Vvp1+1h/hyWE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Hlxm49kA; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIGHtNG414303;
	Tue, 18 Nov 2025 17:20:04 +0100
Received: from duzpr83cu001.outbound.protection.outlook.com (mail-northeuropeazon11012070.outbound.protection.outlook.com [52.101.66.70])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4agndtj27f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 18 Nov 2025 17:20:04 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y3V3G9ts1m/5O8H2HZE+J/e4u8NYt1D2awmldDpjP2cjQL1zBr4UNeSupSDa7gF+/JeUR7u9jWPzqz9ZNvHI75VhPVWWQXJ4TD+UMW2/dxB//t19Y8X0ZlSg5CPP7uSyjXQ3d8HkiWNDGTNZEiz5Nc1b+eswO71vdlcXP72FPj3X5A4Si6WKOEIPwo5bSreW0co50vT/dtix4FwHnrSfsaUquUo/3HsMi/UO/bzJBIibtkKKk+Knqr3GWHcIiwo9CHtYfy3XUXPdxPgnhK+CejBwW2oWvEwWt9CoN5sYPEd1jO5poeUT8D6RJEOImNZelwWxvNpNak2jP6bV6fhgpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ao5pBG9bzr6NWllFYlVOtPWhQCtgSU06MuByvTKHKsI=;
 b=E2z9XgyfSSkB0hkY7ifLGXCqMwnIdpPGV4hhn8NN6XDswZRdjuM25TuQi/KBjnvTQ2AOzO4bpFXCydli8v9wJbnE4e2xkKjV80mW6FoqGPs2oQN/X2QRtujrOkumXFXyAJHNYeN1ekkBggPBDg4tcB5CiYQXloHC2S95ZQkpTJ2aykdDO2s5jhs3nkJ7zdz6kRnUrt8oyhQD2YDmKlZz5RrcjOcHrDuZqtCYcb1KyFGpyF+wgM7JvR8mPLGQtSDk6vQQuJEf3CfzVMkspp8AguHlvu0JhIAd06FQQ5Vl7hnHq/cW20QVjqEBKnWKYfvQK8CAjSSX3uDDtYbFUu6rWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ao5pBG9bzr6NWllFYlVOtPWhQCtgSU06MuByvTKHKsI=;
 b=Hlxm49kAwDGEjgbYOjFjtm/au3tj6Mn/33CnIOBhgxw60nev0RUo0aRNlA8JfkXfYKj+69JRYRskETnItoCwYeWlVp9INMpp43WefPcvrQ+vRXLb2mySz7DGOFC7Zbu9fYKJVsU0RxPJ1DRRzsLc/C66nqHY/xRhaKft+8p4yFe8nSOTigEQO9EyBz2xARAAzdkqGWVd5pjUI/goyhl9wZVhDsyK/wymmXLrsWRKN2f9dmK37xqHNkp1Hcw0lD1I3Ok9xf4vNzlUV/O95y0xPUmgoy0MENqO59XEboeFHGTi0ozxILmsgAwmZcQlg3sTBse1yrfXLJQflFAtL0tGbQ==
Received: from DU2PR04CA0074.eurprd04.prod.outlook.com (2603:10a6:10:232::19)
 by GV2PR10MB6307.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:7b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 16:20:00 +0000
Received: from DB1PEPF0003922E.eurprd03.prod.outlook.com
 (2603:10a6:10:232:cafe::10) by DU2PR04CA0074.outlook.office365.com
 (2603:10a6:10:232::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.23 via Frontend Transport; Tue,
 18 Nov 2025 16:20:00 +0000
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
 2025 17:20:08 +0100
Received: from localhost (10.48.86.11) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 18 Nov
 2025 17:19:54 +0100
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
Subject: [PATCH v2 15/15] arm64: dts: st: add heartbeat LED on stm32mp215f-dk board
Date: Tue, 18 Nov 2025 17:19:36 +0100
Message-ID: <20251118161936.1085477-16-antonio.borneo@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DB1PEPF0003922E:EE_|GV2PR10MB6307:EE_
X-MS-Office365-Filtering-Correlation-Id: acba715b-368b-4802-5701-08de26be5259
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FC9Gp8YuUjl3o22yV0nzOKrtMXvt/XvFGmqoUbZqkx7ZTCYIr6IwwoNvxIzw?=
 =?us-ascii?Q?4dKV6Mx3oINsg/LPeN0Jm2xB/Z+6sU92n6qmOLIrwRGZQGo48zN5pB78Id+J?=
 =?us-ascii?Q?/5iu9GNuV6EoQeU0tQIm6UpKcOFNET6xP8gzVh9rqkvXzqTCfFvF3yHIT/ze?=
 =?us-ascii?Q?nSNLmncKclgURiNT4Pw5/8HYFtDY6sfrEdILbkjobtp+P7xZPnf0xJmuWSga?=
 =?us-ascii?Q?9JT8pS9KVtjfjwalCXVr/sPC6vZ2PX/AzA+Wa7RQW02vqpJgP3GM+DpeR8M2?=
 =?us-ascii?Q?/9sAMzKx3SEzO8282NqIT4IE7KJjFz2clmT+3WC+4q57LsD01tMCT2tzns8T?=
 =?us-ascii?Q?Ao97+w+dpFG40mSqY1fMbavHBHuyIRkW6sizjbiwfDNL67dwCM+prpmUxMoj?=
 =?us-ascii?Q?PtYJ+vVKreHvACuCIvDE1psRBR8Jfbfsa1JZVwF2dXcw4lfx+iVc1U4dophM?=
 =?us-ascii?Q?RIO8M4VNF+criCq8uo6p9YwXz+ROLE/pS94RcWnJ2zxcGk6ZsXg5Hs7MtHpg?=
 =?us-ascii?Q?iKSfwUTCNcVTv6h9vb5UrRrBKxsjZM3PVa2Bri21XBtzpjYQKDGZnZ8MahKf?=
 =?us-ascii?Q?wOKCReFjNtWyAEpbvJ2+aCPE4QccmMLjzlnlJwtharF4mL7IuuF0ImFx6iHR?=
 =?us-ascii?Q?ZWoGQFDvq3B1XplWXf1euAamWsnBzCkImqPkwUzF3c63iz6k367YPxm80min?=
 =?us-ascii?Q?E4Si8AfN1PLfzcSfdvhSUS78hxDyoDykAa3n6+vNpmjgCQtrBRyXFxpjIctA?=
 =?us-ascii?Q?bdfe46pZpgH3Mjkv3Gmf8vw5mz+83RaPcKUoKRwbFLCLAaLhVJUWUpR9Ck+8?=
 =?us-ascii?Q?7mz8wkUBGnsZW6oNNqUiTf13P9dJLxMa79RGO2I1h9xXWeFIeeu9VR6mPP9d?=
 =?us-ascii?Q?aSZ8N+WNLQvQQ2O7kgvDe8VDumzQuXdmm4+zdF05pbUV2frLuZDMNjS/2q+/?=
 =?us-ascii?Q?e8GDGs+Es+j6NIGO++N56mdWAjXMoy2Ai1T9n0DfIdunQuZOhvoX8qNAdWpS?=
 =?us-ascii?Q?P3va9ral+kJkANEUIaMEF/mqMF8edDIQUoTxSvGfBPsZ4XEn1KEHwSWILmG5?=
 =?us-ascii?Q?5wDD1akM3hgtnnhXj0SsHpxgNIsVjS5RCb5H73F675gr2JAfllrrk/iWr2bi?=
 =?us-ascii?Q?i67Y9pDo60taU54B0j+XTo+VzLzi1iqlX9cohQ/ZBt0cznUTKyO6Qq2y3RiM?=
 =?us-ascii?Q?rxKlZ9I9m149NdjUH0rsU+QoEt7nDeWsWURkCS+lXqIOpIXimje4ZsZyaxuh?=
 =?us-ascii?Q?53UgsykHatXCBUP7Ziv3Dl7Z6hBBZmDt7PzBNGU7PVCTWwc62BBf7eMcecib?=
 =?us-ascii?Q?C7bqHELu3Uh5vmQft5p5O4t/RFoKB6GMBrWSjgQv7scGmij5lAhdlfaUI6LN?=
 =?us-ascii?Q?CReSYfCaiB619PO3LNhDZYuuJAYqSfeL0zylGYBDjgDHTOrT5KCW8sUAf/tV?=
 =?us-ascii?Q?p4qXhSZ8E0Gjhau03/eHGW5+32875aejGhEqc/nko9+6sNN/pTdzgBZBYvjB?=
 =?us-ascii?Q?V0gb61foJ1KgUDfMv/M8yLdnq3sD1NgxyylWYT6m0C3DIgcM+SpVdAUJwX0w?=
 =?us-ascii?Q?m6mcI3CMTW9z41dRXQjYQYuXxv/9kBjbkXJZI+ed?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 16:19:59.9223
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: acba715b-368b-4802-5701-08de26be5259
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF0003922E.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB6307
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDEzMSBTYWx0ZWRfX3w67ibFLGmRE
 vSNe/tli8e3MpHUZqMd3C1f5o2AX6RrO35x38jAnP2Zg976yUeWmD0/JFSorIIJymodGAD3YYAw
 +TBLpPlh7MJivv5vjXsWJODxN/JErdgQItccZ3rCdHx8HGAnbxbSxlc9JIfeqIcGVYRKfYceNze
 6u6zL2Bi/XGuXzBaeo44DnCpqqrQiDWaVLklri2I63h72mlbgjRtkbzPRqEFbQQeh/8v0jSJ08l
 lWsoYDUsZ7KSv5pltOaKsFjFc2uzJFWpgiHXdCySdnjQyl/nIlE7K+VU/8HkASrvKXNXj/ryUhL
 JLMFIs/Qy7nu2vNOUX+nIDZ3grPeAtY3Bz2zddtvGmkq+uaErilJ5UTSx1AczNvbNzJoEZZnKcq
 FQZfJC6rf1v2ht8+CAs/TC5x5kcb6Q==
X-Proofpoint-GUID: lR-qrqNvUpNbkdQ4B5vt0izYYiQd0EW0
X-Authority-Analysis: v=2.4 cv=Uqhu9uwB c=1 sm=1 tr=0 ts=691c9cb4 cx=c_pps
 a=IcPIPwgAtlgZYoiLq5rGsA==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=y9YUpebZf6kA:10 a=6UeiqGixMTsA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=aNayrZUiNngYzDPniTAA:9 a=T3LWEMljR5ZiDmsYVIUa:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: lR-qrqNvUpNbkdQ4B5vt0izYYiQd0EW0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180131

From: Pascal Paillet <p.paillet@foss.st.com>

Add heartbeat LED on stm32mp215f-dk.

Signed-off-by: Pascal Paillet <p.paillet@foss.st.com>
Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp215f-dk.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp215f-dk.dts b/arch/arm64/boot/dts/st/stm32mp215f-dk.dts
index 8571dcf427fc4..6d10b0641d2bf 100644
--- a/arch/arm64/boot/dts/st/stm32mp215f-dk.dts
+++ b/arch/arm64/boot/dts/st/stm32mp215f-dk.dts
@@ -6,6 +6,8 @@
 
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 #include "stm32mp215.dtsi"
 #include "stm32mp21xf.dtsi"
 #include "stm32mp21-pinctrl.dtsi"
@@ -23,6 +25,18 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	gpio-leds {
+		compatible = "gpio-leds";
+
+		led-blue {
+			function = LED_FUNCTION_HEARTBEAT;
+			color = <LED_COLOR_ID_BLUE>;
+			gpios = <&gpioz 3 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+			default-state = "off";
+		};
+	};
+
 	memory@80000000 {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0x0 0x80000000>;
-- 
2.34.1


