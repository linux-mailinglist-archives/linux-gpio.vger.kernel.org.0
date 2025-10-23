Return-Path: <linux-gpio+bounces-27540-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAE6C01713
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 15:35:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C26433AD0E0
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 13:34:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 077B733F8AD;
	Thu, 23 Oct 2025 13:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Z4D3UsP/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C956E31B810;
	Thu, 23 Oct 2025 13:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761226046; cv=fail; b=b0rme0UGiVitsNtHo9MLemLKTcoPLfsYyXGyUzO/rLpiM1kuoX6G/JE52ECtAj+uH/PSZO2r23bqQDbRUQ0FzEo7L2bSxfiEzXK673mX5n1pkI2qaiJPriNiak/7PkdhKEkPe8NB8+tX/jmpc8+HhIQv8o6csAmGA5+FkqvkCLs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761226046; c=relaxed/simple;
	bh=bJizNAsV95lem499I64rubJfUgAYAcLqWlxSRdvgtio=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XpjnQ5l5ANW9NRwWcKYFw/xlpW06dHNuP42PEVNydqLktCBJ2TRKabh0ZV1t/ggeIZuKIP7jd0BBqhsvEJdVjgTRYIx9TbUkWkhqcbwF8/oK9D0rNbIQFUPC+iERHMMDw8ZJqnyYKLiwMaVvrRZ68are9VeOwN8AMVZRHAhUzy4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Z4D3UsP/; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N9gki2017345;
	Thu, 23 Oct 2025 15:27:13 +0200
Received: from gvxpr05cu001.outbound.protection.outlook.com (mail-swedencentralazon11013046.outbound.protection.outlook.com [52.101.83.46])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49v017qfgj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Oct 2025 15:27:13 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L9txDfIcpZCIlvNjRWFVL9WbWipfbLAPUjldhp0LTFbr63pl2oSZ4gs60QKkZLfAQmMwOOxpnfjW3uqFvZylJoiYC5B37cx+CZV9IXGmKyM5AaoE5DeuFgaf6STw2uHx3qZeySOcyuFYd4plEKofVORO0AeEG5Br4W+XO0PviDTBBqQR6cjOABkmcF6uoDK691VvA+CGPqg0UFHba4oTs7jFRB9mMQUnBwxv5wLmb51qnHF1TQgyx73Tk5YHCP7c+wXc5kbJ5n9RMJAESCgSyGOTEczrzA9rL5xMCKq59vuOpBI/WOMrmQEgPi66n/Nv9yYSSqANkaS+ij3veK8Wtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fXgz1BkN8buEzkZrwDurWAA3DLjC/FNhi2On/YvuIIs=;
 b=RsJV2jQHiw5KksyVIUSSDFvsVqI+dfKoHMcYczJWA2NX3u57nqYURKznPwPS0tNIEhHTkItFhhcxhhTOkh9dYbwX3wNXd2stxfVmepbrIaKnVQqqzRwv0EOwjKpNQNVFqEf6v1/x9CMYOxOjd/GtGQlmYbmREB+fxtFi74vtn0wX1P0zb9gp1fwRCZ6dlNxk4oeqOxGuQ7f+HpMql0F0xx/5w1hj329jnXRiuQihM3EiALrE3LHwwFPIEvcetOgS5WoUjp3sxlrNsj8kyjwbHevuVafPJU3Ew5RErXoZSnP48Onc3d7uqEe2s5UWNW0ZB76zAt651UBuHpEtd6TyEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fXgz1BkN8buEzkZrwDurWAA3DLjC/FNhi2On/YvuIIs=;
 b=Z4D3UsP/D3/eIHTBhG1JF/WnWMvpNgpsX4KIuC8qu2CfzKe6emkDzajU+ayhP6VwAnV/fLb3CrQA7A7AGmr86EfGrwqpg55BZyllmriQo1Jw+OjdquLvaARFmhgROaODdMTyw5tNU6bffrBpp96Km+/vx+Ft/iXhkU5BxRn8dzIrpQyIJW3ehkHDUAbhRX/tXR+bbrZYDDbar06sQh3q3RMsK/YBh30cJmth2+URVBSCOwmmGrJoEO681tb35AOQCLOXv11qqQQ6TZ4b9HLnIUp7jbOSS1YyeVOFpQUpe0xP/dalsHH664+6pbISarB9JcEdqW99g8EPUrrlaTPLtA==
Received: from AS4P191CA0022.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d9::13)
 by DU0PR10MB5629.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:31b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 13:27:09 +0000
Received: from AM4PEPF00025F9A.EURPRD83.prod.outlook.com
 (2603:10a6:20b:5d9:cafe::6f) by AS4P191CA0022.outlook.office365.com
 (2603:10a6:20b:5d9::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.13 via Frontend Transport; Thu,
 23 Oct 2025 13:27:09 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 AM4PEPF00025F9A.mail.protection.outlook.com (10.167.16.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.0 via Frontend Transport; Thu, 23 Oct 2025 13:27:09 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 23 Oct
 2025 15:20:10 +0200
Received: from localhost (10.48.86.11) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 23 Oct
 2025 15:27:07 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
CC: Antonio Borneo <antonio.borneo@foss.st.com>,
        Christophe Roullier
	<christophe.roullier@foss.st.com>,
        Fabien Dessenne
	<fabien.dessenne@foss.st.com>,
        Valentin Caron <valentin.caron@foss.st.com>
Subject: [PATCH v4 06/12] pinctrl: stm32: Simplify handling of backup pin status
Date: Thu, 23 Oct 2025 15:26:54 +0200
Message-ID: <20251023132700.1199871-7-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251023132700.1199871-1-antonio.borneo@foss.st.com>
References: <20251023132700.1199871-1-antonio.borneo@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F9A:EE_|DU0PR10MB5629:EE_
X-MS-Office365-Filtering-Correlation-Id: 74c03428-86c2-4dcd-897c-08de1237de3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HtmzF0HhBMrkL9i5cJS2ssKLnWlU9MSef9E2gC6t7Gke+N98dNOfxxyC4naW?=
 =?us-ascii?Q?c68UZHk3ZNNmyzCB7bslKXp7zSvyAmhwmkSOlYo6W8GmIwPG8yjcKq5KCkkw?=
 =?us-ascii?Q?8sT+ELBY4lWoydljx/yF6fi83HrBhxDiKYQ9VvWPzMzbiTO1AtenidcgNSKd?=
 =?us-ascii?Q?HVYwjA0tHoKBnbLBOj67CVlRQp2L/3QDk4nyX9qlcrHb0KiOhK1pp5wSNlBg?=
 =?us-ascii?Q?pg6z1OyJdpRz7pSOPWWL8JH1MzZf6N63rhhwW96vMJSr+GB8VW8r/Z/o+fNU?=
 =?us-ascii?Q?TyFptkHonSGX2NxneeC1YF6TKO3wVybsG+1mNOcL4kGOEAUjseoUEzWqDRbj?=
 =?us-ascii?Q?1syaaqy4d2xBh/il6X7robx+0xth3bI1Y6uCPwz/f4eRRoUxBBu5C0u24xRh?=
 =?us-ascii?Q?gz01ZL3MrzLQp0li07aJhcLyb9f4MFZd2FTm+7Np65+YCGTtFo4uq3nszvhl?=
 =?us-ascii?Q?lSj768lk9W7wL+nbjie+GdMnG1RCQuqKOEs3ArogKMljrEbXh1DxU3jaN0id?=
 =?us-ascii?Q?8kFAGZbmOALdS3o6ILEQ1Hl8Xa7uBHNFT9tio+d2cj9x5gD4WMNGUnUB66dn?=
 =?us-ascii?Q?OMZRRyrso8ZiLUljS73LsftlQbrejMn6fJb/6HNQ+87kfLP5B0UiPjtknMlM?=
 =?us-ascii?Q?xDCxi1I0Q8rQlNLcfyppH67JLti3Y4LkDz3ZJBlgVw/t7Q2GCKvQrIVI0T7l?=
 =?us-ascii?Q?Lh2zATIpf7WoVIvFvcE4TJVU4GFhoN4riRFdNpaKplk3IYWCWGvb1U2XYkV6?=
 =?us-ascii?Q?UNf/GhLBfoKCuESqKmFipJwSXt8CGncpNmitn+H+uNXaAopXrta5e2VGu3h7?=
 =?us-ascii?Q?S21eibGkXZ3R1g7k2cuCh0Ib1z7tSdWwqdKzuRFYbP0nSLYVoo4DtLIVUtIn?=
 =?us-ascii?Q?yKzNyOq0ZNkKZe3fbGSDchSxSOlOg06EVooh6OL5lBotILQTZcEGoCHPFF7W?=
 =?us-ascii?Q?qVXlquQdDCFIkW1eJRR4YYXgthQhW6216U1eTJnHVDaaN5px4p8T62KVm1bC?=
 =?us-ascii?Q?xrYGgsnGsQRoeUJ4Hyl15ywFFSC5wQU1loeEM0rS0+gMsd9M3wiympGa5ITt?=
 =?us-ascii?Q?wViuJxC0NnqpF/V8Ua2ENX9FbsHvprkuHAHQkYvYHXhccNZY0aThEEML/87s?=
 =?us-ascii?Q?NFJJQbRTP29gTgB51gnB60nHjrJ/rve75T9hqZ1d9dRx6YLcQSTZJI5vCEVh?=
 =?us-ascii?Q?VXgfp+9Gh1eccyAZlasDQBAvZcnL8uOY9uO+MpYKVzgZreRAvoaWTakIzjFx?=
 =?us-ascii?Q?i7jlnJwbG1fPc22qnv/66J3HhzNfnGW2NFeJ/IH0L40aCsQC4OBecnOUast+?=
 =?us-ascii?Q?iYx+V6iJfFuZVLMgzDMHxr+RQOF64vnK/CrdcJ7G0nSqyyzButjcOcpt6Fnh?=
 =?us-ascii?Q?HPgzxLtYuD57JyfL1ldwQFgoga+00ywfMjAWRBkyQ+2/lXq5adyqHY25pxz8?=
 =?us-ascii?Q?QeIZ76ZIkoYqW8PTrlHwffUk6EUV7SQ5mw8AtXyp7iJ8jpkED5dto4pL5XNQ?=
 =?us-ascii?Q?LI2vWuFBtdUEooYemcS1Uwivk3LfiU0u0FN5Wq1B3FByBMuJ251bDUiNJSXD?=
 =?us-ascii?Q?BAChXIMO+eSTOrsmRDnLn67LrXT7jaULnd5yuGxK?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.44;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 13:27:09.2985
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74c03428-86c2-4dcd-897c-08de1237de3c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.44];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F9A.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5629
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE3MDE4NiBTYWx0ZWRfX/jnhOGPE9Aq/
 zdhah4lDN3Mge148rxAax1nJLFKAoiPk7DG/wn7AXVwda2VSeXNWfGIT6Po/w5WHiit1I4ZL6vD
 t5xdpAvaZxiIxuMVK4vkSUoVQ7VJ0/LF9G1pGaiqDjQ+caLg8bqchk1phc8tKnpSRs6jA6oCHJU
 LZBU/+UADC+XpUur1UiRv8LeYo0upByE8e5ffYWCcezvemwQ8l/44lY+N1tJL9Wv0ToCiH538Ql
 57tehVFiqMeDFKHLQ7TQiVZzQg0EQypXWg2sI0oyt/7UA6VqZVAcK+EFZNWYm6GPOo9kjIEe69s
 xViYi8HRu8uOtcynUaRl4OX7orsuaJL8UFlf7MjWF9s16kZoRDQgyIIgiNphvYXy4mP4VT7D3AI
 xxqDebke7arXTTOIGNfXbeC+5WPgTw==
X-Authority-Analysis: v=2.4 cv=CYwFJbrl c=1 sm=1 tr=0 ts=68fa2d31 cx=c_pps
 a=XUW+b4G2ANNWtaUD5ifWjQ==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=y9YUpebZf6kA:10 a=x6icFKpwvdMA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=WsDl9yZTujSQv8eLU2MA:9 a=T3LWEMljR5ZiDmsYVIUa:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: bAKD809sUcizTHV_XMUELH3WQ8kBxI4k
X-Proofpoint-ORIG-GUID: bAKD809sUcizTHV_XMUELH3WQ8kBxI4k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510170186

Use C bit-field to keep the backup of the pin status, instead of
explicitly handling the bit-field through shift and mask of a u32
container.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 70 +++++++++------------------
 1 file changed, 24 insertions(+), 46 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 6c5f9e015e8e1..66f9783fce862 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -54,18 +54,6 @@
 #define STM32_GPIO_CIDCFGR(x)	(0x50 + (0x8 * (x)))
 #define STM32_GPIO_SEMCR(x)	(0x54 + (0x8 * (x)))
 
-/* custom bitfield to backup pin status */
-#define STM32_GPIO_BKP_MODE_SHIFT	0
-#define STM32_GPIO_BKP_MODE_MASK	GENMASK(1, 0)
-#define STM32_GPIO_BKP_ALT_SHIFT	2
-#define STM32_GPIO_BKP_ALT_MASK		GENMASK(5, 2)
-#define STM32_GPIO_BKP_SPEED_SHIFT	6
-#define STM32_GPIO_BKP_SPEED_MASK	GENMASK(7, 6)
-#define STM32_GPIO_BKP_PUPD_SHIFT	8
-#define STM32_GPIO_BKP_PUPD_MASK	GENMASK(9, 8)
-#define STM32_GPIO_BKP_TYPE		10
-#define STM32_GPIO_BKP_VAL		11
-
 #define STM32_GPIO_CIDCFGR_CFEN		BIT(0)
 #define STM32_GPIO_CIDCFGR_SEMEN	BIT(1)
 #define STM32_GPIO_CIDCFGR_SCID_MASK	GENMASK(5, 4)
@@ -100,6 +88,15 @@ struct stm32_pinctrl_group {
 	unsigned pin;
 };
 
+struct stm32_pin_backup {
+	unsigned int alt:4;
+	unsigned int mode:2;
+	unsigned int bias:2;
+	unsigned int speed:2;
+	unsigned int drive:1;
+	unsigned int value:1;
+};
+
 struct stm32_gpio_bank {
 	void __iomem *base;
 	struct reset_control *rstc;
@@ -110,7 +107,7 @@ struct stm32_gpio_bank {
 	struct irq_domain *domain;
 	u32 bank_nr;
 	u32 bank_ioport_nr;
-	u32 pin_backup[STM32_GPIO_PINS_PER_BANK];
+	struct stm32_pin_backup pin_backup[STM32_GPIO_PINS_PER_BANK];
 	u8 irq_type[STM32_GPIO_PINS_PER_BANK];
 	bool secure_control;
 	bool rif_control;
@@ -176,38 +173,32 @@ static inline u32 stm32_gpio_get_alt(u32 function)
 static void stm32_gpio_backup_value(struct stm32_gpio_bank *bank,
 				    u32 offset, u32 value)
 {
-	bank->pin_backup[offset] &= ~BIT(STM32_GPIO_BKP_VAL);
-	bank->pin_backup[offset] |= value << STM32_GPIO_BKP_VAL;
+	bank->pin_backup[offset].value = value;
 }
 
 static void stm32_gpio_backup_mode(struct stm32_gpio_bank *bank, u32 offset,
 				   u32 mode, u32 alt)
 {
-	bank->pin_backup[offset] &= ~(STM32_GPIO_BKP_MODE_MASK |
-				      STM32_GPIO_BKP_ALT_MASK);
-	bank->pin_backup[offset] |= mode << STM32_GPIO_BKP_MODE_SHIFT;
-	bank->pin_backup[offset] |= alt << STM32_GPIO_BKP_ALT_SHIFT;
+	bank->pin_backup[offset].mode = mode;
+	bank->pin_backup[offset].alt = alt;
 }
 
 static void stm32_gpio_backup_driving(struct stm32_gpio_bank *bank, u32 offset,
 				      u32 drive)
 {
-	bank->pin_backup[offset] &= ~BIT(STM32_GPIO_BKP_TYPE);
-	bank->pin_backup[offset] |= drive << STM32_GPIO_BKP_TYPE;
+	bank->pin_backup[offset].drive = drive;
 }
 
 static void stm32_gpio_backup_speed(struct stm32_gpio_bank *bank, u32 offset,
 				    u32 speed)
 {
-	bank->pin_backup[offset] &= ~STM32_GPIO_BKP_SPEED_MASK;
-	bank->pin_backup[offset] |= speed << STM32_GPIO_BKP_SPEED_SHIFT;
+	bank->pin_backup[offset].speed = speed;
 }
 
 static void stm32_gpio_backup_bias(struct stm32_gpio_bank *bank, u32 offset,
 				   u32 bias)
 {
-	bank->pin_backup[offset] &= ~STM32_GPIO_BKP_PUPD_MASK;
-	bank->pin_backup[offset] |= bias << STM32_GPIO_BKP_PUPD_SHIFT;
+	bank->pin_backup[offset].bias = bias;
 }
 
 /* RIF functions */
@@ -1798,7 +1789,7 @@ static int __maybe_unused stm32_pinctrl_restore_gpio_regs(
 					struct stm32_pinctrl *pctl, u32 pin)
 {
 	const struct pin_desc *desc = pin_desc_get(pctl->pctl_dev, pin);
-	u32 val, alt, mode, offset = stm32_gpio_pin(pin);
+	u32 mode, offset = stm32_gpio_pin(pin);
 	struct pinctrl_gpio_range *range;
 	struct stm32_gpio_bank *bank;
 	bool pin_is_irq;
@@ -1818,36 +1809,23 @@ static int __maybe_unused stm32_pinctrl_restore_gpio_regs(
 
 	bank = gpiochip_get_data(range->gc);
 
-	alt = bank->pin_backup[offset] & STM32_GPIO_BKP_ALT_MASK;
-	alt >>= STM32_GPIO_BKP_ALT_SHIFT;
-	mode = bank->pin_backup[offset] & STM32_GPIO_BKP_MODE_MASK;
-	mode >>= STM32_GPIO_BKP_MODE_SHIFT;
-
-	ret = stm32_pmx_set_mode(bank, offset, mode, alt);
+	mode = bank->pin_backup[offset].mode;
+	ret = stm32_pmx_set_mode(bank, offset, mode, bank->pin_backup[offset].alt);
 	if (ret)
 		return ret;
 
-	if (mode == 1) {
-		val = bank->pin_backup[offset] & BIT(STM32_GPIO_BKP_VAL);
-		val = val >> STM32_GPIO_BKP_VAL;
-		__stm32_gpio_set(bank, offset, val);
-	}
+	if (mode == 1)
+		__stm32_gpio_set(bank, offset, bank->pin_backup[offset].value);
 
-	val = bank->pin_backup[offset] & BIT(STM32_GPIO_BKP_TYPE);
-	val >>= STM32_GPIO_BKP_TYPE;
-	ret = stm32_pconf_set_driving(bank, offset, val);
+	ret = stm32_pconf_set_driving(bank, offset, bank->pin_backup[offset].drive);
 	if (ret)
 		return ret;
 
-	val = bank->pin_backup[offset] & STM32_GPIO_BKP_SPEED_MASK;
-	val >>= STM32_GPIO_BKP_SPEED_SHIFT;
-	ret = stm32_pconf_set_speed(bank, offset, val);
+	ret = stm32_pconf_set_speed(bank, offset, bank->pin_backup[offset].speed);
 	if (ret)
 		return ret;
 
-	val = bank->pin_backup[offset] & STM32_GPIO_BKP_PUPD_MASK;
-	val >>= STM32_GPIO_BKP_PUPD_SHIFT;
-	ret = stm32_pconf_set_bias(bank, offset, val);
+	ret = stm32_pconf_set_bias(bank, offset, bank->pin_backup[offset].bias);
 	if (ret)
 		return ret;
 
-- 
2.34.1


