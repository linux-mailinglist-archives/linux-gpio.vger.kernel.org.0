Return-Path: <linux-gpio+bounces-27093-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9191DBD9E1C
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 16:06:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2A4B3E5C2D
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 14:05:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B60531576D;
	Tue, 14 Oct 2025 14:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="ZyGyOMdg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513273148B5;
	Tue, 14 Oct 2025 14:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760450729; cv=fail; b=rnX68qSKYE5wHKieJMy4SYRTJpMk4N5fn7JcEus0iNYi/f7QMGvyzvkHifCiZCnFzTzYbZXbY8QEpY9xTgW7PhbGFavnsP5mPL5CqVg6t8IKU3kwAI0qcRaK90Vu5qmvoIeB1GSaoy4XqsYAJYUnJNocmX+WeyX8Esoqwc3bJAM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760450729; c=relaxed/simple;
	bh=NhygrzLOrWQ3LXcp5+7f4Px83CUKqlxQ9xgCpNZ4pdY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kvJES4iigvde3GjsGp41OZXGKB3UxNVcs/RcgYP619czS4neBFBRoQqvznTBCZv6MV2+xz3S+LAvS8qjuTQgglIK2mWRw1FUM5q8Kfd276kBEjEB57bQD1wwWCNXE3cKJy4DfPnr9uikB6mBew4JJBmmrn+VHCf5qhZBAz/5y9w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=ZyGyOMdg; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59EDJ2fR015086;
	Tue, 14 Oct 2025 16:05:04 +0200
Received: from duzpr83cu001.outbound.protection.outlook.com (mail-northeuropeazon11012040.outbound.protection.outlook.com [52.101.66.40])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49r26j20gf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Oct 2025 16:05:04 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FUxaABitXDwMkTT/kQKsaUud70W+WVReEba7+iplQgXrtB4+eWexp8e1BkJnC9gxxVgi/vnxM+79KSn7U9jyoy20FEjqbPRUrh3LKGimmRvrRuS5EYt8rLbJotUT7hkb/KR69GDF7Pc+qXpBD4Q+0cT+z2Nf2SrzyNZg3N6mReCW0hSo29QvCicy04N4w+c975+t+pKFAungVCDY/2HXoXJtEFcQyq7Ravb2wjJoRa9C72ci9jsyIRjxNzDYDTbA+phFUBCKkaqwOnrmxrPBsk+eM1jY1VKCeWWfkvfoE64K37C1YbAwTV58WX1lDaUPfA2YhtJbty5qn9D1N/7fbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dCjAeXptzJXdXlXSPmLgqUAdOdGWKy13cjYzi3YEodc=;
 b=G8NgdOgC+e4PjbVzAciBAWu0YKINrpWpU5HpXG2e/onmVeos+GslJDvscLmdPE5VQf5q5Gdv7p+Clr78QK6C/bCXdqdadQz/gnWM3OdVQUSm6rzuAN2h2vIqrek1yAH8MIZFZ0k5BOfSmGVw6Nz+ZbLhuNbdtAKi+M+RuDv7ALFODWypIKTU4+9ophmYdnqcTbttSL/v2Gh2rJIIomjhGwbIF2MtF1NGg1xIpbz1yiEw9sgDDBMM0nX+6kvjjawjTr1tStCGTJS4optdJ5RW3eVy274MYV4ShmI+vKZbPhGvLRDqCbqXUmuG5AcwhWkKZhpXgTpG8kzEMSVNPS/FQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dCjAeXptzJXdXlXSPmLgqUAdOdGWKy13cjYzi3YEodc=;
 b=ZyGyOMdgyMqUMAdS0Q8IohKZqhmdRxfM3MRicocf8B1KeZdNk2Y7nwxeBVwJKUgcyq2OBkdcNRVuJNtatv1QdAfxlmCQ3PK8CbipdAj93Q+Vz/c3KK8j+jJo/OspYKZWbdHDfC8YyIDkGS7QREvddtyLgxNLo3GAcfsfJqF5BsFABUU1s6qVMM4WMuyMaHoSZbDbk5tls6bYuHnBPKq+AYHqjcZKqpSph8A3ysb8QQyrWZa5kXqIGTs/Io16gJdlPq+hge1d2fDAMOD61xRjX6rlnqoe2KAoakE255mdwf3vZT5qIIRw9zx9iwGnrKq+lHfc/5im82wWE+2Pvrncig==
Received: from AS4P191CA0046.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:657::6)
 by PAVPR10MB6814.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:2ff::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Tue, 14 Oct
 2025 14:05:00 +0000
Received: from AM4PEPF00027A64.eurprd04.prod.outlook.com
 (2603:10a6:20b:657:cafe::d8) by AS4P191CA0046.outlook.office365.com
 (2603:10a6:20b:657::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.9 via Frontend Transport; Tue,
 14 Oct 2025 14:05:00 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 AM4PEPF00027A64.mail.protection.outlook.com (10.167.16.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Tue, 14 Oct 2025 14:05:00 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 14 Oct
 2025 16:02:37 +0200
Received: from localhost (10.48.86.11) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 14 Oct
 2025 16:04:59 +0200
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
Subject: [PATCH v3 06/10] pinctrl: stm32: Avoid keeping a bool value in a u32 variable
Date: Tue, 14 Oct 2025 16:04:47 +0200
Message-ID: <20251014140451.1009969-7-antonio.borneo@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A64:EE_|PAVPR10MB6814:EE_
X-MS-Office365-Filtering-Correlation-Id: 92c2e0d9-ca28-47e2-6e9e-08de0b2aaa02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8YkR1MIEBjqwj/Fc5Vtk/pX0KegMDj7iioJJA5p3SkKfsVP3N7NfYovHAh8G?=
 =?us-ascii?Q?TxeXx6EM8lop4XJgAjzV+YbCP2t5U6mx+rR6X/7SmEEmdqZf16DTOChzVFvY?=
 =?us-ascii?Q?y9PsxaHdkgPy31R6BKhQAnv885qL5osrvaxWZfEh78sqVhIb3PoXrmoWrB2p?=
 =?us-ascii?Q?osNqO5HNocLbTDpzVgHqvRWiyN9BLIwYAMWgjOnz21t8sCaNDBwWIN1+KOXx?=
 =?us-ascii?Q?MH1bm3qCA5XtbsTW28h3AC6JkVpwAj6uhDYIN++7IiyjIytcIY3urf8TWoEn?=
 =?us-ascii?Q?RAoCu3b7Ek5W0wphH8dRlPtxTFinj70zpTPHCvUquujBhyo5QXptl3J3v0L9?=
 =?us-ascii?Q?B/V2mbO5giuQHrkozZCzEDTX1M8XLN6f3B+WE00LeJF9JlFrRemiW8H9jB1X?=
 =?us-ascii?Q?34FLagP/QXUigOSckkbh9xbwUPMKgkMKKm5RJPT7TJOWydXgtEt8wcceQBAZ?=
 =?us-ascii?Q?YVH+BUS0v2xSgfSDxRubNtl3Uex6VY4AJt39zxliX21tqGbV8C88aBbbNosy?=
 =?us-ascii?Q?UoHgO8lh6KImtcDazhRGeCzRrDYbtepGQQLcCKnhp5a7Alv8o39be2uzYYA2?=
 =?us-ascii?Q?0NIholr88KLP6cU4Q8IjZ0ooPGxi+82DpnDOIGDGgSoJVWXILS54GmQtXU0k?=
 =?us-ascii?Q?Th38oua2hcZS+tQqUpGX708izq8S2RFHW4KegI+of1ovMhnpN83+Cd+2F7UG?=
 =?us-ascii?Q?5GRFDMwm//RYShu89ZTgHzOZB4+UBzWAztIdX5EElDmUwDJPJS/ilLoTlVSP?=
 =?us-ascii?Q?+N2pQEtcBRH66wX+e9jZaoaX2+lQ76gHpAoYT5iHJihv/9sHnjv1Xw/NyGkB?=
 =?us-ascii?Q?hs98t4kKZF4L7hNwKCTwGJnM0fswdVF4MKrZiqkGNlzE922M1B1NJnJ51ciV?=
 =?us-ascii?Q?cJtENXmAY/D/FYp0IE3QJLnL8dOrFkdAeX9uXauJd5NRtCC+UNWRJoA/7sYe?=
 =?us-ascii?Q?pkZZMxqZzZLbX8KnffB5dvNH8f0YFnnGIKAtNYBZJfuD2OvhQQx/K6ZsBORu?=
 =?us-ascii?Q?3VWl7WYUQO2W94V8Oqtwx+qahC6ZEdpq+DVAO2HWPIvT4/3/uIKA92XvlNKc?=
 =?us-ascii?Q?d75Am6HGMtkwc0NUZbVM3OlKW/nBEGIdSzxp30R299jfRj2tYISI+eFuYZv/?=
 =?us-ascii?Q?U1fu37PZQ7BPpXeCe5VpOZRcBjxISa7dkZXn6icpwh+wUtMHnWsIe0R7WkjU?=
 =?us-ascii?Q?1OcLqdKKTnRoCxTKuS2KPjIxh4XdMtBcKdnrweWRMDtTD3Nd+leF6sGamBUt?=
 =?us-ascii?Q?bveDrXfmDCI96wd1Vl2iXPot6/Km3W+9l/ay7JKVD1U183wskmA2qNf99MgP?=
 =?us-ascii?Q?VIdkGs83hm8CjUyN+AMGTXPL6EpQDA56pvv8huem76kueaYreJbrv17ZhACV?=
 =?us-ascii?Q?L14oXy/uphv5KhtEne48MrlLVXY7ZKxiI+emUiP+ZXgEdNJFPapZ0BRJ1bq6?=
 =?us-ascii?Q?fZ+uFaMhieWc85/SYEOsaEz60umVc4iO1Q828xb8FEqYAxnMC1NrMWcGLmV9?=
 =?us-ascii?Q?NQLVfv6RTw83ocWL+/tpV7pKNZWOwQuMdAFIqlTw7ccACEeOVD75ew7yVrB+?=
 =?us-ascii?Q?gu/G30CuTO0nJUiOazD54SJtoPLmSYZNMzyY41gN?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.43;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 14:05:00.0885
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92c2e0d9-ca28-47e2-6e9e-08de0b2aaa02
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.43];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A64.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB6814
X-Proofpoint-ORIG-GUID: 5FYZ2qJKqPThs_xVTdlJJOSGgRzXj0iQ
X-Proofpoint-GUID: 5FYZ2qJKqPThs_xVTdlJJOSGgRzXj0iQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEyMDAwMiBTYWx0ZWRfX0Qj5HvYRGMlR
 o0mPXjIuRGYcyCGyvvi2Wy8G7RWKkS3/n7ubwZOfjTHfTNOoE1H6m2iUdqL8ejikPBYkq2RHTHX
 8cGeGHd/ZRDkVpY5yz3n9bQ23S0Cx0wmaL0YmeKN/GJ4tOODWXpwAnxn2XLV47zWR4aFYV5M+pN
 /arx3dpBc4DtgwoHm3QXdbY4OEMXDavpnu1Jrm2G0AwsCD0lgXdBjtpgoN+70fFRcRRu6taUE8R
 HNSLGKrM27GhynZXDpFSZSJ5Bx9ztzHZxfflKNn58H2d83AAR4HPTHpESnPl7rJlKQ6cmWtN1CM
 /PUzvST37qT3zsKh8bWrd4lkqWL01ttgK+4A+s5gh5U5+vMcDh3BNsW+5P3bv4+9si1O1v8CE1J
 M/pwtp8CqbYOvz8NQK23KqvaQADuOA==
X-Authority-Analysis: v=2.4 cv=X5Vf6WTe c=1 sm=1 tr=0 ts=68ee5890 cx=c_pps
 a=u25irTIIb+Jay1RSCBfqKA==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=7Z6HTxmNocq6VBzl:21 a=y9YUpebZf6kA:10
 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=Nw7eZBQmKDrzE-cWAosA:9
 a=zZCYzV9kfG8A:10 a=T3LWEMljR5ZiDmsYVIUa:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510120002

Change type of variable to avoid keeping the bool return value in
a variable of u32 type.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 7175328d0df0c..ac64cb7f86d74 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -1148,7 +1148,7 @@ static u32 stm32_pconf_get_bias(struct stm32_gpio_bank *bank,
 static bool stm32_pconf_get(struct stm32_gpio_bank *bank,
 	unsigned int offset, bool dir)
 {
-	u32 val;
+	bool val;
 
 	if (dir)
 		val = !!(readl_relaxed(bank->base + STM32_GPIO_IDR) &
-- 
2.34.1


