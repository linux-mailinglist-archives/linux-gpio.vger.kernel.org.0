Return-Path: <linux-gpio+bounces-27112-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 40089BDA1E6
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 16:46:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 000924E57C7
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 14:46:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7E162FD7BC;
	Tue, 14 Oct 2025 14:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="jfsrk8Uo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF62826C383;
	Tue, 14 Oct 2025 14:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760453170; cv=fail; b=DSqZA6rh1j72XYTA4p4SsvG0RLb7RcldSjYDzRWtgZUCkBh1H1D78nVBcUSFE4xXSl1izKqd96tJbB7Yn7Mu27bKlKMDOgT7+SYY0IkvLO/hUBAVh1Iqj6h3Lu2ueyrV8WFCbs5yqhS0qh/ZuFn8t1zytujWmKUJqUYG63qSM3U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760453170; c=relaxed/simple;
	bh=bJizNAsV95lem499I64rubJfUgAYAcLqWlxSRdvgtio=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EupY2YGqHbjzdDB3A/d+62aULSwqT6w3JH+Z/Hol3559RONSOaagYuT0zms+NW75FuwUzQoSt+yQULwwZO3ffBNJr2+6qzzWV7894ISBfC6fFANg6MyypdxOgUC50v+awGaR5Att3iW3PHRlu5SDRTquXXVC7+e4lcb3GYu091w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=jfsrk8Uo; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59EDbbK3015141;
	Tue, 14 Oct 2025 16:05:02 +0200
Received: from as8pr04cu009.outbound.protection.outlook.com (mail-westeuropeazon11011023.outbound.protection.outlook.com [52.101.70.23])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49qfe64nhd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Oct 2025 16:05:02 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JVlt8pg0Dq9Mm7T7Wxq0JS2kJmwMtaKdba90G2RGfYM5qk4+EK679LE13rqg56E7OFvUnCtuGjob1JYQ4izJW/6gV1KD0PgqB1x8W9w7oaFto4lV1msIwofQiDVvWcj4QWvcY9OqPWdcexIJFusnxbDQwfzQ5m6BEE0ZjBNsU3kxw9+dl3uam50LkvTZuWb4tJC2pD0YtByPp+RqolqCzxMejisTtR0nCVIWATzpEa8PbCkmdjSboQ25y7yQD7UWksLGJhOgi6TzaunLQLjgp6onhWpJ1P4CCYKlJZ13iF6052J5lnHjIfSGg9OklZrGpaVziFeIUK9ptFjtwBz8Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fXgz1BkN8buEzkZrwDurWAA3DLjC/FNhi2On/YvuIIs=;
 b=gqLmRTDPv8X7WYz4v3C8veNtBiEG5Yoo/pifLoN2RciGJU/RgFz/NcwoIu/GJCI4oBVeVQ1ywc4imgj7JMWgWUd3J923rkrKHQQoB60yHg5E2JJPgDvi3smeLh01yuRDNTPg+fgNzi2uWwWWjR+Q9oUkY3ZKG7ByWHcAQxMquOmfNISWcNQFcZd5+y27roeB1Nd0vlmEqTeUise3DbLsvzJnb4L6nsC/Tp3ViDz5jD6CRrDoswFQE08sXvwMtg+wLVUr1ttztVoheZ0a/ES6dqPVjLAEn/ukT9vGv2lFpwuF9LsrC8fTPXdiz9VWPkYSko1Q9rc5LTbQiCN7QxNKZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fXgz1BkN8buEzkZrwDurWAA3DLjC/FNhi2On/YvuIIs=;
 b=jfsrk8UoW/LqxOzz2A6TRHTeUtjGxKhwPKvBGhHo9YvLWMj7XZcEffVKUjgC/75+n5MSrbpmC4b7fB3X/6LDNVTUBYUOVYwWIUHUoL8uwcg3UbM+2P+7kVEJmiqAEn6b6zxLSPAtQr77mnuBw31+WhF0e/h3w/J8lwJ1SyHvBAktCosqT9p36Rqjn3WZXFFJJ9GTHYZU7onZXvXoBdAY2OYfzw4+UlQGryArOJw417OVtreTdf41UaOeLoQG3mt0YjQx6R8Slb5yyWWoPlcJvSlK4SGymGTf4SUjfUVb63T7R/Whi1NpIdW66SMhIJ/wcWEK5gIV3nbkaB2H7Y+jtw==
Received: from AS4P191CA0031.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:657::13)
 by DU0PR10MB5773.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:310::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Tue, 14 Oct
 2025 14:04:59 +0000
Received: from AM4PEPF00027A64.eurprd04.prod.outlook.com
 (2603:10a6:20b:657:cafe::b0) by AS4P191CA0031.outlook.office365.com
 (2603:10a6:20b:657::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.13 via Frontend Transport; Tue,
 14 Oct 2025 14:04:59 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 AM4PEPF00027A64.mail.protection.outlook.com (10.167.16.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Tue, 14 Oct 2025 14:04:59 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 14 Oct
 2025 16:02:36 +0200
Received: from localhost (10.48.86.11) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 14 Oct
 2025 16:04:58 +0200
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
Subject: [PATCH v3 04/10] pinctrl: stm32: Simplify handling of backup pin status
Date: Tue, 14 Oct 2025 16:04:45 +0200
Message-ID: <20251014140451.1009969-5-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251014140451.1009969-1-antonio.borneo@foss.st.com>
References: <20251014140451.1009969-1-antonio.borneo@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SAFCAS1NODE1.st.com (10.75.90.11) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A64:EE_|DU0PR10MB5773:EE_
X-MS-Office365-Filtering-Correlation-Id: 83cb6b44-8e4e-45d7-39fc-08de0b2aa974
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|36860700013|376014|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wUm76WqBmw3/TSGRLllFdYrfaC5KUHdGFAXyv43w5pEVgkODPiQIMY28bNlW?=
 =?us-ascii?Q?DBIFgnwrnx1kDt7M4bNhJMtW/KwJik4pbWWZhtxs/Shi/R8QlYMPArpFuJqq?=
 =?us-ascii?Q?kyftxnMmya0SM05KuG+vEdRl/R/YFkdoEf15+eBmGjIGCypH/aNpIDsw5Zav?=
 =?us-ascii?Q?MO4O94hDDOr7WbolKnFPDwgWGjq/lLEhjCz+TbCGLOmfw+HYgkUPwcQMzasV?=
 =?us-ascii?Q?BXE3zS943uLdQY96YzjQsL0PiscqEBC22g0pV2i7DnLrwZzA/NyDQgsQA9kU?=
 =?us-ascii?Q?o9uEXW55U6mI/W6lQ1Zn0oGkIThiUyieT0sR8QCIoXPMfx60qVXgXRnPXHZN?=
 =?us-ascii?Q?c+CmyBjvZvlXbGflgrcyuro+hfdsoHbjluYvQhFUUaqkbcL3LYtD1TqszRLA?=
 =?us-ascii?Q?0erriKrrz3WMr0cZMjmMPJMqVvY6izzlt5EUobpTfqfk6h3u0hr4mSb9MxUt?=
 =?us-ascii?Q?hYOBKqNCNcM7lCGIMJmK5lDqjBJHUpK2abZ8Lw5PbThAcz/KtWtyd2AIKybD?=
 =?us-ascii?Q?dQp0Z7JEnfusS/BJbiFq9FpqiJsD4EJYWi+BTaAcSsWrG628fCoVin4Zvad6?=
 =?us-ascii?Q?2ilboVbPbuNQo3eMvHnsVyaHyk2jzq48YzSnpnR0GnFHoQm17kwtDQoX900V?=
 =?us-ascii?Q?HoyuOUMhV4rR1NTzmNFtKptOf/44G0xREBY4jkatZ+9RVcJnZoY2RbCJgCs8?=
 =?us-ascii?Q?+Yssd84DoAbJM/+Vfs6kl+aJ7EgSiw4JM8ETbBpX3RfQZEa2wN1v0iw1QRqL?=
 =?us-ascii?Q?G3lScWQO7vEcQabBP+dygo53M9QOrAfFv0GmV80REPLws/6Id7UqTwAJx8Y6?=
 =?us-ascii?Q?OOrT3y0hqSR74y6ccJKKdHw0HlL3NrAxbeTNrNd6pxoOTTouv/lL/+2NqNnx?=
 =?us-ascii?Q?KDflXqOboRfTYZma3XMoh2JeDdYt5t5Tr9mzA67BjeW4YkVw/85+wEx+da8d?=
 =?us-ascii?Q?oGooLjIrJ8+7zq+gFmjGG0wN3rk5PQmnmLTSLSulcwvlEYYD/h5atoKVPOyX?=
 =?us-ascii?Q?BG1dh/L+BXS3OWgqvXb1lGPh1qkSkelNdtF2tfo+zAvkxoxo5qxUrUF25HYG?=
 =?us-ascii?Q?qQhgkYr3r6wgU4tXcDoPzEp4HMWTU9Uxkw/mD+p9KSEIV6Plh59VYFh5atRl?=
 =?us-ascii?Q?F+0UTd5YfP8M+3ziWrCIxS4zeJp8dq6GVpHFUzq9B2QIlXIwJLvlBYsq99BN?=
 =?us-ascii?Q?YKGymxIol88HG7EJ/tKKa3ToFafuwFUw8Zt92THiTyUmm0gdhZ2sAeGeUp3e?=
 =?us-ascii?Q?uVT9HPjf6UuGpZm8TxQwktmDGSIZUFDv5fYkqs0nt5pMOJk1bmPoYfux0YF/?=
 =?us-ascii?Q?sK9FWBWRD1VVLubluAXHqApH29gJeLweVZNePHBU0BC7jCqgsWIlR4/+mK9M?=
 =?us-ascii?Q?9eetkf72MYG7xdmy8/IEWXK4+kKDMAIXVDb2RbM4Ioluy7QEPeng+3CXvDND?=
 =?us-ascii?Q?ndc9VgSJFN5zgh3CEWqypNbFdD3YRsiP4o2mB7Gm26GdIppGwIrDK98v3wqf?=
 =?us-ascii?Q?OYI1WKXBKB0QrrRbsFW02es1hkH62ScIe40Bl75cr0IHIxpPO3nEMuxBhCF4?=
 =?us-ascii?Q?eTLWTKKpn7ucKjD/cR2VLTd3jGlcoEl5rK6RbXzj?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.43;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(36860700013)(376014)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 14:04:59.0330
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83cb6b44-8e4e-45d7-39fc-08de0b2aa974
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.43];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A64.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5773
X-Proofpoint-GUID: 75J-1glklgcw4neMpTQ6UZ8KgoELBeJ4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX0ETQvQLoa6KH
 QPJgh/Q1FXuPinagpyIevTcUBbHwEVZ7YHk3FPmLuil/FWb7rKzetAwMucHef1MmQ5T184A+MbJ
 E+REFyC4k2UK4VZNnlLEQxmutdYAzCo7x/jbWCNUV8VxCF9UCuijjhrMitxuyIAYluOsCjzioft
 EYsJPDd9yFKw80+DX8zK2lAdeADXn+C7kPoqCP61hwoc2AKSpIg2Rd+62VNeL2ox2S+MYFNk26j
 D/yoZZLsRWdKEoXDWLc2Ts5jxJ+FQ+Wzw2FQt6ElMvFL9EWprneKmftxceYEICEo+Eo/1pPkhYQ
 uKJYjjeFmD8gLq1QNJ6YCADtU5ZOivHCNEtx3jzwwpV/mQSHh5iGK5zGYMV9qocLXSmR6SikMfG
 VoN8WgFzavjNTPNbJjkpxrwL3IF60g==
X-Authority-Analysis: v=2.4 cv=NfvrFmD4 c=1 sm=1 tr=0 ts=68ee588e cx=c_pps
 a=DZ5mOaW1MAiWX1o+C2viOA==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=y9YUpebZf6kA:10 a=x6icFKpwvdMA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=WsDl9yZTujSQv8eLU2MA:9 a=T3LWEMljR5ZiDmsYVIUa:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: 75J-1glklgcw4neMpTQ6UZ8KgoELBeJ4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018

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


