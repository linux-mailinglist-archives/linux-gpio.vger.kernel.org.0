Return-Path: <linux-gpio+bounces-27114-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 342C9BDA2E2
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 16:58:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D58063ACEF7
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 14:57:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C92A2FF67A;
	Tue, 14 Oct 2025 14:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="iRCxXnk8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EB71EEA5F;
	Tue, 14 Oct 2025 14:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760453852; cv=fail; b=em2oH35uM3HMgI/984LRMs4+mP568zTUFGScYXXC7mXz/ocaNXGsLYLpa4BllJgbQRcjIUqIPkk141PE2qNucYLednSnNO9bICPwJXG6OA8YKfyMGOOKXKPxFVgN268Qry61cUzECP5Duwo/NpUoKuYOxzZMNDV7Hv8DcO9IWaU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760453852; c=relaxed/simple;
	bh=Vbj8IZCK9IRBHRfnoYqYQKvwv3QZvxk0w6nMlw8DCHo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rNgrfpvj1IfH8VnoSBo8bmKRom8GJIQGYLVFCOZAKaL/AwUN9VWv5wBhDTv7Li/FaJm7xsarxEUeoGYvWyi4n/Wg20gHfVGU3coeHnXiddcINa+CDpm7WC2newqLQZXBAYMUiLaoxyqD/+3/JE43yQjpO0jwITGTyyKubi1VbRo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=iRCxXnk8; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59ECebI3031470;
	Tue, 14 Oct 2025 16:05:02 +0200
Received: from am0pr83cu005.outbound.protection.outlook.com (mail-westeuropeazon11010043.outbound.protection.outlook.com [52.101.69.43])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49r0t02afb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Oct 2025 16:05:01 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xwmms6jRhWqIgA5Z59t+zop2+0fh/1bGOvfjH+dUuGjD4o0ugQgM0bEgs49B17giSqJKSw45hMUX0TgUYCxrgcSBy3GcHkRNIWacX0FV2pPAQa1euCCWE9Sy4ntv9b6JDcOk58u/+F+VuKVRbSNxtqIHNp4BYssSlv4yLfSRyUi4gsPGL4fMg3qwXMhAdxn/nmDFVS1aKGn7OCIVJGIxENsR6Ro9ugiOYlZDSIvQ0RuN1CZ1tyHT6CzH7LoxtrAKqA3EebvDHqjxVtkaDSuY4TzcQmba/AwnCpZkG+d+LpkMr/KYM9V7iti9qyVv9cXW0/3BdX2wFdX+M9wuxrlerA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L7khND/x0XwWgNWsJnrSzt4iKDswt45U3PGjagR6zG8=;
 b=m8rC+An3Kl2NZiOFa+AdsWOcsqiamTbJs+OzWV6gS8U2vf+NLs82MmeS9cqg4zyjE37Tn6j5uaA6qTXLdPi8swqV9pfEehDnLSqiJzq2c5+ASnEuz3teP21o8mKHOwNyJXHBB3uckNs9kY91eaqFncohSwwIR/V5A2QyymZcgQ1zvx1Gmfl6Hy5rQ580/TuKLRj7ZT9csqaoFEwKkLae/VlD7ibQ3ZVeic86//Z+stP1JHr1AbPPTLh9S+nMg96Y/EbGtH4ivQ2QX8gIn/WcRXTMzgdvjUBkW8GWwQep4EpXfuJKs8WwqfEkLj0fhkTmNdFAVkYsqNF4rWU3+GASnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L7khND/x0XwWgNWsJnrSzt4iKDswt45U3PGjagR6zG8=;
 b=iRCxXnk8YqWNFRYacjkCavfjurrDlooyEIJvoN5VthBku2hT6JdHDJA1FJzNcZvBRA3UsfYM2wRTpR30RBjX2vNJg+czeh7qdDxs6T4EGoI6O+F8aU17JjzXBDO0LQt/SyHessDFY5vPDTmTvFKgMV1bqJeFovz8xfX7sZizKat3LZnLennP6bbfQw5kjmgeXD4peQytee/+TYKK97Sbrk8V7OidasPS7CCnrcFI3uPCyToAqRWyGe+8FhCcCMQlD5u8GrARHfxjP78+Lk1n+p3cwnuaA34cJ5qO4r/gqXdKOxFfuezJghZtcT1oSN9ZhfM6P/ylh8vcNyjohYrafg==
Received: from AS4P250CA0023.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:5e3::11)
 by AS8PR10MB7112.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:612::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 14:04:59 +0000
Received: from AM4PEPF00027A67.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e3:cafe::ae) by AS4P250CA0023.outlook.office365.com
 (2603:10a6:20b:5e3::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.9 via Frontend Transport; Tue,
 14 Oct 2025 14:04:59 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 AM4PEPF00027A67.mail.protection.outlook.com (10.167.16.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Tue, 14 Oct 2025 14:04:59 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 14 Oct
 2025 15:57:54 +0200
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
Subject: [PATCH v3 05/10] pinctrl: stm32: Drop useless spinlock save and restore
Date: Tue, 14 Oct 2025 16:04:46 +0200
Message-ID: <20251014140451.1009969-6-antonio.borneo@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A67:EE_|AS8PR10MB7112:EE_
X-MS-Office365-Filtering-Correlation-Id: bcb5b46e-33cb-4879-741c-08de0b2aa9ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|1800799024|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?15c9tifAOEgNdMTygcCJZ5DD5rdnCWlKJpFBwpD8yglyKQgHaC/u39VawtG/?=
 =?us-ascii?Q?rh2CR14E+fUf8W3H++7D/HvOgkUgoAqIk+BZXs+/YJODzsnmDio//IOceaHq?=
 =?us-ascii?Q?lBEpDI5zLsMASX9A3UzvMaDitMUrqkVHhXfrogoVKYDyDeUXjKQwT5pNY7zt?=
 =?us-ascii?Q?UB3bIP2tS0oyRosCu2AD0LYW7waBNHDmWormLZLi/cNCVLilvyAtls3CvzMQ?=
 =?us-ascii?Q?aVigfhGOXfWhmOWeOB/N5KHrKgzxtfV4uIYi1LlCRoIO4AnHEtW/VqQ/3ziM?=
 =?us-ascii?Q?JuAcqw4iPYN/taH13q6EjdH5rim8FUPjASnOoSHzO/Gk2WStNgkq18Z+Pmh2?=
 =?us-ascii?Q?VvxXFO7BY/3sKyk5nb7Mx9NIDcpzwXaB1e6UioXwwa/7DzX7ohuQnZETQzsi?=
 =?us-ascii?Q?O17/BeMQjzI+l9xVh5s+QCDTaFyaVXdSlPWx5YuQR2L1HcDvhNsgnOVKMVHa?=
 =?us-ascii?Q?nTHK68xlKqvxt68DAQI4pa6XW34ab3EDFQY5zAi78FwxBgEpuoDnTen5xT+a?=
 =?us-ascii?Q?u1lZV7xcfxZmm4eWX+ReH09I0Fv4hK6zmjbQONyfxMX/JBrB3IcXyULMCQOE?=
 =?us-ascii?Q?M2QdeFhvbKLC3GmV+lMS/Uac9+OaDiJ19rRPPDc3qYHArG332okPNHelB7pN?=
 =?us-ascii?Q?SndMWvltgT+QGOit1QqOuuvJ+2groVvug8rzeDlWgXPCYRctUEerafy50Xoe?=
 =?us-ascii?Q?YrHVysC/44GPIHCDMyWCb1gRism2A6XtR4lSwTU545EpWQpussC0uZRdQMhd?=
 =?us-ascii?Q?LtStQOvSLycC2l0Aw00VXcFWLwSQuKxR8ykEUXn/sr2cNqY50M9wZ6jx0L4W?=
 =?us-ascii?Q?TmYM2lle5EfuBD1nG14vqsjpKx7k7QlF1XcaCto/8xDscgiGT/kJem88bGVP?=
 =?us-ascii?Q?SBh2pLe+pcolfv6VlvfUjdR7Y1rQqDMJZedg0e5/EehUB/YdorkbsI5OR/KR?=
 =?us-ascii?Q?lOIIOGl4x2dbQgGUCDiuyCC83nKRqoYREkJPhhPdHRmuo/dHVzxD/f1g/Ig/?=
 =?us-ascii?Q?dzyf3f6kfXsCRET2sMSD/1VYIBh+ilcBm+q3r2lv0R0S24SA/4BePmTKP3me?=
 =?us-ascii?Q?N7Z6crNWyubD9Uo3goYbmp2jDSAsqE9AHI1D9Meoy1j8gkA/yQp9P0oBdgDE?=
 =?us-ascii?Q?Q+FVhn84DEcQgQTHcOrExgvKnBOtaFaApFAiAKYOd2ojWjgMJgy4/jf0N2vW?=
 =?us-ascii?Q?dqrsAH6YtJ1SnlBoC6ygCeR2oAIFyE9/PmLgelDIH7+HEdexRX1RCJ30m9JG?=
 =?us-ascii?Q?bN9mvgDQP17wU9wahclHB8qEsR9159aQH82/c3wmH+QvbtamD/jJUY7V24m6?=
 =?us-ascii?Q?Z/HIH2wdSPoZJk0c+rjelflAuvTMYhXBYwq6KMWEX8o5u3uzXDZnI2QtzAfw?=
 =?us-ascii?Q?LzuhHOx8LsDbYJ3i0Aqyo4laGxweRgZcZF0N0u1tcFFLTaKk3b0Jo9fKsdl1?=
 =?us-ascii?Q?UaZ7KfX/ghqj3elWYBMe+67t9XoP3K5S/nAo5tNI+2yTXQ6wbPamHlA9lHD4?=
 =?us-ascii?Q?oH6TlK81OGBjjenyqvU9yhy3xjkqq2DCLkU2C4EplQUTZY4vIH9ySxA7Jb7v?=
 =?us-ascii?Q?KIA8Rrdh34kV8F+PHJaY4vhmKNV00rKjxkTvTF7i?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.44;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 14:04:59.5197
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bcb5b46e-33cb-4879-741c-08de0b2aa9ac
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.44];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A67.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7112
X-Proofpoint-GUID: HjePCMGHn4UpbY4euYCPkwyvW2e5xr2S
X-Proofpoint-ORIG-GUID: HjePCMGHn4UpbY4euYCPkwyvW2e5xr2S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDEzMyBTYWx0ZWRfX/XdBcrs3+mHg
 CYK87JzIQuzLn/AH89P5GKHBRXd9T712bs80nMYRvtMY2VpnuncoI/D4N5rzwUvRxXVHdmnrnqE
 zqgTgrKgbPZWFQXYRmhX4XPW3V8tmgB75Qpu5zmxNyg7NJzCrFBVqC3E4UEthSjTqEq3G5NkU5R
 KHWp6u1UsFKK8BWzrNP5v2J6rSHkYqk2Yy6NZ8iz4GRrCzcNr5B6M8L7EjyTFHkwbD7LIyQlNVv
 A7cXW+cv/bm0XyjTMy4ZM8X5ED6lsX0vOQiUAhR2LxPnhyTKaiq5M2Yd+m7NbtwLnfQsw0UUpeg
 01s2np9hgq4gnY2UYv0tgC9SOoM7V3rSvdKsQ0TnZy6koF/sFsccATctjSpOEdAzeoZqJcHnzx5
 QlmCGOKFLNTE9dNejtADJlCsrflM9w==
X-Authority-Analysis: v=2.4 cv=dY6NHHXe c=1 sm=1 tr=0 ts=68ee588e cx=c_pps
 a=CrEM3l311luX7ryRsfSUgg==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=y9YUpebZf6kA:10 a=x6icFKpwvdMA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=HYu-Q55BAeZO7lAW1c0A:9 a=T3LWEMljR5ZiDmsYVIUa:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110133

There is no need to acquire a spinlock to only read a register for
debugfs reporting.
Drop such useless spinlock save and restore.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 25 -------------------------
 1 file changed, 25 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 66f9783fce862..7175328d0df0c 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -920,9 +920,6 @@ static void stm32_pmx_get_mode(struct stm32_gpio_bank *bank, int pin, u32 *mode,
 	u32 val;
 	int alt_shift = (pin % 8) * 4;
 	int alt_offset = STM32_GPIO_AFRL + (pin / 8) * 4;
-	unsigned long flags;
-
-	spin_lock_irqsave(&bank->lock, flags);
 
 	val = readl_relaxed(bank->base + alt_offset);
 	val &= GENMASK(alt_shift + 3, alt_shift);
@@ -931,8 +928,6 @@ static void stm32_pmx_get_mode(struct stm32_gpio_bank *bank, int pin, u32 *mode,
 	val = readl_relaxed(bank->base + STM32_GPIO_MODER);
 	val &= GENMASK(pin * 2 + 1, pin * 2);
 	*mode = val >> (pin * 2);
-
-	spin_unlock_irqrestore(&bank->lock, flags);
 }
 
 static int stm32_pmx_set_mux(struct pinctrl_dev *pctldev,
@@ -1050,16 +1045,11 @@ static int stm32_pconf_set_driving(struct stm32_gpio_bank *bank,
 static u32 stm32_pconf_get_driving(struct stm32_gpio_bank *bank,
 	unsigned int offset)
 {
-	unsigned long flags;
 	u32 val;
 
-	spin_lock_irqsave(&bank->lock, flags);
-
 	val = readl_relaxed(bank->base + STM32_GPIO_TYPER);
 	val &= BIT(offset);
 
-	spin_unlock_irqrestore(&bank->lock, flags);
-
 	return (val >> offset);
 }
 
@@ -1101,16 +1091,11 @@ static int stm32_pconf_set_speed(struct stm32_gpio_bank *bank,
 static u32 stm32_pconf_get_speed(struct stm32_gpio_bank *bank,
 	unsigned int offset)
 {
-	unsigned long flags;
 	u32 val;
 
-	spin_lock_irqsave(&bank->lock, flags);
-
 	val = readl_relaxed(bank->base + STM32_GPIO_SPEEDR);
 	val &= GENMASK(offset * 2 + 1, offset * 2);
 
-	spin_unlock_irqrestore(&bank->lock, flags);
-
 	return (val >> (offset * 2));
 }
 
@@ -1152,27 +1137,19 @@ static int stm32_pconf_set_bias(struct stm32_gpio_bank *bank,
 static u32 stm32_pconf_get_bias(struct stm32_gpio_bank *bank,
 	unsigned int offset)
 {
-	unsigned long flags;
 	u32 val;
 
-	spin_lock_irqsave(&bank->lock, flags);
-
 	val = readl_relaxed(bank->base + STM32_GPIO_PUPDR);
 	val &= GENMASK(offset * 2 + 1, offset * 2);
 
-	spin_unlock_irqrestore(&bank->lock, flags);
-
 	return (val >> (offset * 2));
 }
 
 static bool stm32_pconf_get(struct stm32_gpio_bank *bank,
 	unsigned int offset, bool dir)
 {
-	unsigned long flags;
 	u32 val;
 
-	spin_lock_irqsave(&bank->lock, flags);
-
 	if (dir)
 		val = !!(readl_relaxed(bank->base + STM32_GPIO_IDR) &
 			 BIT(offset));
@@ -1180,8 +1157,6 @@ static bool stm32_pconf_get(struct stm32_gpio_bank *bank,
 		val = !!(readl_relaxed(bank->base + STM32_GPIO_ODR) &
 			 BIT(offset));
 
-	spin_unlock_irqrestore(&bank->lock, flags);
-
 	return val;
 }
 
-- 
2.34.1


