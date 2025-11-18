Return-Path: <linux-gpio+bounces-28687-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B38C6ADCF
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 18:13:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 434684F7A61
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 17:07:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06D493A79B8;
	Tue, 18 Nov 2025 17:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="B88HV+q8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A737F36CE1F;
	Tue, 18 Nov 2025 17:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763485555; cv=fail; b=L/J4g4+xHAlDN8k+xsuR2/BmH1QL4Q0e4EEoea6wYdYCJVwCwy/BA5ELylaSQBuMRXzrmysNOJGLWQV3Sv9Dd9YAB5vj8vlmnbqJMFH3tO+L85mPcqJi1qSOziSLkN5Q1C/bW+c/CdPKX20HMgasrL+poWD8fzhJhMsW5IIvrWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763485555; c=relaxed/simple;
	bh=GRqoWdiq4Mc0ZR7Ry9FRCdfm4oehtvW+JHJ023tWQss=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e/2SoIDzjHunvia6X+OILjK4ZRhc+e0IE6z/5bi/G9FlKCjIQfLqtWyV4XRYoJZp0BkOTaUNMCBnmBZw+fAvR9YLykwXq1M9nTUeVYdx0poOt8g774/ejDDm3SZDkdm/09D7EvJZTNpvIy/kyLPNskLBx8HTr07l97oy8rwt3JA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=B88HV+q8; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIGtDgk191119;
	Tue, 18 Nov 2025 18:05:17 +0100
Received: from as8pr04cu009.outbound.protection.outlook.com (mail-westeuropeazon11011058.outbound.protection.outlook.com [52.101.70.58])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4agvrb0119-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 18 Nov 2025 18:05:16 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bLu94JXYET3DphDjYny4oBE1/3P9tJ+kxjtQ5dTU4Rm2g2KOgsGzB1QBymCDCzh44aOXoRTwThEKo6u3otQKBlf9kNhZkNviVj+Z+1p4MWCkL8lDEaK9f7v5cr4jUaQRtMrvR017wrn2ITcAyANZfwDCtr0xwcBZNlLwoMp4ePiDq+mODby2+6CtgOjwXsQXpRa8WETVtJoaSJPgV7ngsEVGZOmZd5opN24Ytwi+5hv0kZj+7fhLrp59dsMSIeZDO+3MgXEIjL8+EFQ4BTSD3dPfFcodmEdZ5hentC+W2hzNUTnz5byC+1Dt1/N3OnuVLwrzBpDmn+o63ETNUEQe6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1qkEfV4rEwK30qTUZkhKk3fWdeeBQLADwrk4MKe+a+w=;
 b=nNU6Wpm0CQd0kCX4kiGwmLL6jPQ7LxyK9qbBjfvGd6jMVkzEneLe4XpgPB0v7OSQish5dbogWE/PLzHtDsrLmvygPZEypYcG9Csxa7P4Pm/IvedEm+QPgi7vjM3twmGsiXt4ydUJM2eoGBAsNXSPo1ThbH+tofMMLtCouKYg6N0RY1ezmQevlGSuu3N31DFQPkkT0TZg0m9uoX9ghaBAcLkWViKnsfX/H4eQaL4YUcZ1y53OwgcA+/OHz8W39VuMlFqgVgp2qoGf9wCcrmql+I2LHEjQb8Hy6TAatRRsixr0VbryanN6aTOKSK+rnT+24cyJELdwDz0A6T/2mESr6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1qkEfV4rEwK30qTUZkhKk3fWdeeBQLADwrk4MKe+a+w=;
 b=B88HV+q8eWjIsaNd+Iv8pJu02bYa9Y8Rohs6QWDUGrYjd9Pnz3S6P1r7k1RMVmWNms6FdxGt10am7Lv1a5FWq4nWGaV7o1jh50xnl3/9I/81paIP1bd4IIP9MfkrhelBFD2ecUS8uvpgV8e3YH0MDehQqIvrUh794HxLli071XdHW2l36baB4QEcgEPUSIcblckTR7JJcVnJvnZHkeYJrmR9wAwX4OiW0zVWsm5ywyv6SelI84tGMWpQQ6oHDXp0ybarT4LhPgwDNRTfESD3x8CEH6jAzAQ6UAkfMCERWlOpmzyImuAVLAWw7BVNK/enuaTvsnp9WQ++n6ED8PneHg==
Received: from AS9PR05CA0353.eurprd05.prod.outlook.com (2603:10a6:20b:490::13)
 by PAWPR10MB6880.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:33d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Tue, 18 Nov
 2025 17:05:13 +0000
Received: from AMS1EPF00000045.eurprd04.prod.outlook.com
 (2603:10a6:20b:490:cafe::64) by AS9PR05CA0353.outlook.office365.com
 (2603:10a6:20b:490::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.23 via Frontend Transport; Tue,
 18 Nov 2025 17:05:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF00000045.mail.protection.outlook.com (10.167.16.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Tue, 18 Nov 2025 17:05:13 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 18 Nov
 2025 17:20:15 +0100
Received: from localhost (10.48.86.11) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 18 Nov
 2025 17:19:50 +0100
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
Subject: [PATCH v2 10/15] arm64: dts: st: introduce stm32mp21 pinctrl files
Date: Tue, 18 Nov 2025 17:19:31 +0100
Message-ID: <20251118161936.1085477-11-antonio.borneo@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AMS1EPF00000045:EE_|PAWPR10MB6880:EE_
X-MS-Office365-Filtering-Correlation-Id: f81e87d2-7d39-4c2e-869d-08de26c4a3ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QJQkAhyqDSWOZMXe7Q7igwpPbO3wO0WwBid47nu7ZpLyv/Zb7ZmggDDhTDL+?=
 =?us-ascii?Q?sDskUluGY6SRxIxoMUjI4SQKFUlDOVM1DfapqoE/9sX7upk5AcANLnZ1JaM6?=
 =?us-ascii?Q?XuIPHi5smT/idCkYiOTCH/D6RMUcF6x4g9dm8S+/3hAfL3UgdPAL5k6YF+q7?=
 =?us-ascii?Q?cuVPZXVZu19JYYGxem7vAh1L+AfTTid2i3j5mAL5qG5bf8blmIAEC+dA3zsh?=
 =?us-ascii?Q?2LmEiuxW2/CIGABBgIKci8zIYEoPkH1W0clqEKZyKxackx5b7U4csENTgJWe?=
 =?us-ascii?Q?WbKut/6Gz0B34+OxwOZrDztpmyy8U4dAlCz72AG7OQufao8aehknpmt0uL/r?=
 =?us-ascii?Q?6xdJvrf3YfdkSaUm9vLGmPwzlSKw5VP1+B3RSSjVD/4HZ7epq3yjTvucy91k?=
 =?us-ascii?Q?QA4/7MJEwbq2AkRUe5h9m7EyNQPnCoKdIlJ4DqAIAzjMYHwtFkv4Z8XlEJ6A?=
 =?us-ascii?Q?gxNtlRQCQRtyV1Ik7kKB7o0uP9p6oclkw73QaI/hjFpOB1fQSYWIFeyIId6L?=
 =?us-ascii?Q?EZiLyzWDxDNP5eEIFdmilq5Ust7nWV5Mn9jErWCaTZsuSRqqXmpl1uble8bR?=
 =?us-ascii?Q?sX9PLq6a/z8qQeasMs9RKTz1WiFnQb8wreAeyK/5hizjKe2CGxttfDCQIupR?=
 =?us-ascii?Q?P1gpmtmL4auFXJ8PE8WeKfZXTV3eLJzXI56/R8b9+naRHCQdSK5E6mu8kj7j?=
 =?us-ascii?Q?FsTnlC9/8G+NNja4R7/AV0vcgQWkR5tPJPDdLhK9VPG3kfRJGwOWMJzuGFKz?=
 =?us-ascii?Q?uHzFE78L3hFxu+t9wOUS2o9nyxQ8qQykPBZv5WXiKyMq1TEAwSNOd4TobUAz?=
 =?us-ascii?Q?gKulGqe7ouvZxf2CAfRC53RP/RzX5ik+XkypyAdfPbEkJq+cgnpmSfpvOb9P?=
 =?us-ascii?Q?2hb4SrZicvKLrrHj7cYn6eNqiv02tt7G2N1GsyY1gfArLMwIJcWIpFwP4Jzv?=
 =?us-ascii?Q?mg5X8RoGP+HxvYtoakJ5H/h3T1dJoAfdVZ8w7w5Bjze3rHZbFwS6rapSY6WM?=
 =?us-ascii?Q?NVbl00w8nOfTZFQPqInxw1DuUlWMBUOAJj7qoacNY9Ju0TYvc5xurPGxugkR?=
 =?us-ascii?Q?MsKUX6QxOqXvfnqk6wNmnrRv65my1WfdC1uAkR1OXAmXNkFalp7U1tuiGCZJ?=
 =?us-ascii?Q?UqwdNuaKaDmPHlDZi88meO0/3Ym3fj1VhJ+MS4maE3y9vB1AC8gGFNYhl7l2?=
 =?us-ascii?Q?IqIzWjxqAerKvcawjmyhJTFc7dtqwyZ8nxUPMjaBBzIB2PZKvRzx9uyJdH9t?=
 =?us-ascii?Q?xdO1PUJtN8mhYtm8AYOJ5hfG1u1TDtifb1tEXGUmrOCmgEnNz7F3RAIZxItc?=
 =?us-ascii?Q?XZ2xm0e4srMvuZi4toWlr3HGCirYkwJjyS+pdtDG9l7pVn3IHwjpDxUdntO4?=
 =?us-ascii?Q?4px74UQZI40t9EFfE6Z6qkxgPSrUFkw2Aqdiv+NCLzk8fCZoXZYwRDFf+Aiu?=
 =?us-ascii?Q?BrWRtrdVG39ltHawdsKJpA52hpUw11noF+V+YJCFrWOOXePbYE+TwrAXTyfC?=
 =?us-ascii?Q?4fXlUo0e4i7/mi1Z/7G2+DK9mKfFOLyXbjO6WBQZHe/gxnVbnIu3ckqhXTTl?=
 =?us-ascii?Q?QNoYljsU0MqwI4NjgoCX1MC7M4rEReColrxquR6Q?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 17:05:13.3694
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f81e87d2-7d39-4c2e-869d-08de26c4a3ab
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000045.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB6880
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDEzOCBTYWx0ZWRfX1/Um3JHvLB32
 1l6KxjceGv5UFoYeCmeM9f+bTWrqFzQeS//GrYB2U8USmTMmdiEPm/CCExGPijx0c3yIkP3R4Jp
 KEfd1CIVelAYc9r644dLH0CiKljbVV+Y9Vb9CifuBP1BcW4eP/daTFsLL6JFhpAyCjb15oTSIlR
 bzfIrdfyOrG0xvRWJcfdEKOgNWkldlMICw5bPCLPDfmjIca0Z9zeHrgsQnHD6EpOak98yLSF0hD
 7ZkflY1lvP/w/gjC/SEe5hSbPPk+qa5uLhP/V3XR6qcigql4QzR1zArjgZUnZNiOIZfq5N5OuDh
 cIsgu18pDPRsFdxkOWzoeV3eFSzv3PcwDQ7b1SxnKRHn7p4tqSHEu2lJzIppRXJqNV4JgABQI7N
 1hYVvBSuyNJkVl/NrvydEPRL4BlEqw==
X-Authority-Analysis: v=2.4 cv=SaL6t/Ru c=1 sm=1 tr=0 ts=691ca74c cx=c_pps
 a=RyyIEAsz3HJQHbvHKsAcJw==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=y9YUpebZf6kA:10 a=6UeiqGixMTsA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=ZLbOOgSRx9BD0f6wEaYA:9 a=T3LWEMljR5ZiDmsYVIUa:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: 9fjgseALNQ6PChX1KKd4v_qVwzfgc5wR
X-Proofpoint-ORIG-GUID: 9fjgseALNQ6PChX1KKd4v_qVwzfgc5wR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180138

From: Amelie Delaunay <amelie.delaunay@foss.st.com>

Four packages exist for stm32mp21 dies. As ball-out is different between
them, this patch cover those differences by introducing dedicated pinctrl
dtsi files. Each dtsi pinctrl package file describes the package ball-out
through gpio-ranges.

Available packages are:
STM32MP21xxAL: 10*10 VFBGA361 / 123 GPIOs
STM32MP21xxAM: 14*14 VFBGA289 / 123 GPIOs
STM32MP21xxAN: 11*11 VFBGA273 / 123 GPIOs
STM32MP21xxAO: 8*8 VFBGA225 / 98 GPIOs

It includes also the common file used for pin groups definition.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp21-pinctrl.dtsi |  6 ++
 .../boot/dts/st/stm32mp21xxal-pinctrl.dtsi    | 71 +++++++++++++++++++
 .../boot/dts/st/stm32mp21xxam-pinctrl.dtsi    | 71 +++++++++++++++++++
 .../boot/dts/st/stm32mp21xxan-pinctrl.dtsi    | 71 +++++++++++++++++++
 .../boot/dts/st/stm32mp21xxao-pinctrl.dtsi    | 63 ++++++++++++++++
 5 files changed, 282 insertions(+)
 create mode 100644 arch/arm64/boot/dts/st/stm32mp21-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/st/stm32mp21xxal-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/st/stm32mp21xxam-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/st/stm32mp21xxan-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/st/stm32mp21xxao-pinctrl.dtsi

diff --git a/arch/arm64/boot/dts/st/stm32mp21-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp21-pinctrl.dtsi
new file mode 100644
index 0000000000000..7e9b74f3d9d96
--- /dev/null
+++ b/arch/arm64/boot/dts/st/stm32mp21-pinctrl.dtsi
@@ -0,0 +1,6 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+/*
+ * Copyright (C) 2024-2025, STMicroelectronics - All Rights Reserved
+ * Author: Amelie Delaunay <amelie.delaunay@foss.st.com> for STMicroelectronics.
+ */
+#include <dt-bindings/pinctrl/stm32-pinfunc.h>
diff --git a/arch/arm64/boot/dts/st/stm32mp21xxal-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp21xxal-pinctrl.dtsi
new file mode 100644
index 0000000000000..7acf8a7e40e62
--- /dev/null
+++ b/arch/arm64/boot/dts/st/stm32mp21xxal-pinctrl.dtsi
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2024-2025 - All Rights Reserved
+ * Author: Amelie Delaunay <amelie.delaunay@foss.st.com> for STMicroelectronics.
+ */
+
+&pinctrl {
+	st,package = "AL";
+
+	gpioa: gpio@44240000 {
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 0 16>;
+		status = "okay";
+	};
+
+	gpiob: gpio@44250000 {
+		ngpios = <13>;
+		gpio-ranges = <&pinctrl 1 17 3>, <&pinctrl 5 21 3>, <&pinctrl 9 25 7>;
+		status = "okay";
+	};
+
+	gpioc: gpio@44260000 {
+		ngpios = <14>;
+		gpio-ranges = <&pinctrl 0 32 14>;
+		status = "okay";
+	};
+
+	gpiod: gpio@44270000 {
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 48 16>;
+		status = "okay";
+	};
+
+	gpioe: gpio@44280000 {
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 64 16>;
+		status = "okay";
+	};
+
+	gpiof: gpio@44290000 {
+		ngpios = <15>;
+		gpio-ranges = <&pinctrl 0 80 14>, <&pinctrl 15 95 1>;
+		status = "okay";
+	};
+
+	gpiog: gpio@442a0000 {
+		ngpios = <15>;
+		gpio-ranges = <&pinctrl 0 96 6>, <&pinctrl 7 103 9>;
+		status = "okay";
+	};
+
+	gpioh: gpio@442b0000 {
+		ngpios = <9>;
+		gpio-ranges = <&pinctrl 4 116 2>, <&pinctrl 7 119 7>;
+		status = "okay";
+	};
+
+	gpioi: gpio@442c0000 {
+		ngpios = <6>;
+		gpio-ranges = <&pinctrl 0 128 2>, <&pinctrl 4 132 3>, <&pinctrl 8 136 1>;
+		status = "okay";
+	};
+};
+
+&pinctrl_z {
+	gpioz: gpio@46200000 {
+		ngpios = <3>;
+		gpio-ranges = <&pinctrl_z 0 400 2>, <&pinctrl_z 3 403 1>;
+		status = "okay";
+	};
+};
diff --git a/arch/arm64/boot/dts/st/stm32mp21xxam-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp21xxam-pinctrl.dtsi
new file mode 100644
index 0000000000000..2e66028f50a6c
--- /dev/null
+++ b/arch/arm64/boot/dts/st/stm32mp21xxam-pinctrl.dtsi
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2024-2025 - All Rights Reserved
+ * Author: Amelie Delaunay <amelie.delaunay@foss.st.com> for STMicroelectronics.
+ */
+
+&pinctrl {
+	st,package = "AM";
+
+	gpioa: gpio@44240000 {
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 0 16>;
+		status = "okay";
+	};
+
+	gpiob: gpio@44250000 {
+		ngpios = <13>;
+		gpio-ranges = <&pinctrl 1 17 3>, <&pinctrl 5 21 3>, <&pinctrl 9 25 7>;
+		status = "okay";
+	};
+
+	gpioc: gpio@44260000 {
+		ngpios = <14>;
+		gpio-ranges = <&pinctrl 0 32 14>;
+		status = "okay";
+	};
+
+	gpiod: gpio@44270000 {
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 48 16>;
+		status = "okay";
+	};
+
+	gpioe: gpio@44280000 {
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 64 16>;
+		status = "okay";
+	};
+
+	gpiof: gpio@44290000 {
+		ngpios = <15>;
+		gpio-ranges = <&pinctrl 0 80 14>, <&pinctrl 15 95 1>;
+		status = "okay";
+	};
+
+	gpiog: gpio@442a0000 {
+		ngpios = <15>;
+		gpio-ranges = <&pinctrl 0 96 6>, <&pinctrl 7 103 9>;
+		status = "okay";
+	};
+
+	gpioh: gpio@442b0000 {
+		ngpios = <9>;
+		gpio-ranges = <&pinctrl 4 116 2>, <&pinctrl 7 119 7>;
+		status = "okay";
+	};
+
+	gpioi: gpio@442c0000 {
+		ngpios = <6>;
+		gpio-ranges = <&pinctrl 0 128 2>, <&pinctrl 4 132 3>, <&pinctrl 8 136 1>;
+		status = "okay";
+	};
+};
+
+&pinctrl_z {
+	gpioz: gpio@46200000 {
+		ngpios = <3>;
+		gpio-ranges = <&pinctrl_z 0 400 2>, <&pinctrl_z 3 403 1>;
+		status = "okay";
+	};
+};
diff --git a/arch/arm64/boot/dts/st/stm32mp21xxan-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp21xxan-pinctrl.dtsi
new file mode 100644
index 0000000000000..0e48f411262f1
--- /dev/null
+++ b/arch/arm64/boot/dts/st/stm32mp21xxan-pinctrl.dtsi
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2024-2025 - All Rights Reserved
+ * Author: Amelie Delaunay <amelie.delaunay@foss.st.com> for STMicroelectronics.
+ */
+
+&pinctrl {
+	st,package = "AN";
+
+	gpioa: gpio@44240000 {
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 0 16>;
+		status = "okay";
+	};
+
+	gpiob: gpio@44250000 {
+		ngpios = <13>;
+		gpio-ranges = <&pinctrl 1 17 3>, <&pinctrl 5 21 3>, <&pinctrl 9 25 7>;
+		status = "okay";
+	};
+
+	gpioc: gpio@44260000 {
+		ngpios = <14>;
+		gpio-ranges = <&pinctrl 0 32 14>;
+		status = "okay";
+	};
+
+	gpiod: gpio@44270000 {
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 48 16>;
+		status = "okay";
+	};
+
+	gpioe: gpio@44280000 {
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 64 16>;
+		status = "okay";
+	};
+
+	gpiof: gpio@44290000 {
+		ngpios = <15>;
+		gpio-ranges = <&pinctrl 0 80 14>, <&pinctrl 15 95 1>;
+		status = "okay";
+	};
+
+	gpiog: gpio@442a0000 {
+		ngpios = <15>;
+		gpio-ranges = <&pinctrl 0 96 6>, <&pinctrl 7 103 9>;
+		status = "okay";
+	};
+
+	gpioh: gpio@442b0000 {
+		ngpios = <9>;
+		gpio-ranges = <&pinctrl 4 116 2>, <&pinctrl 7 119 7>;
+		status = "okay";
+	};
+
+	gpioi: gpio@442c0000 {
+		ngpios = <6>;
+		gpio-ranges = <&pinctrl 0 128 2>, <&pinctrl 4 132 3>, <&pinctrl 8 136 1>;
+		status = "okay";
+	};
+};
+
+&pinctrl_z {
+	gpioz: gpio@46200000 {
+		ngpios = <3>;
+		gpio-ranges = <&pinctrl_z 0 400 2>, <&pinctrl_z 3 403 1>;
+		status = "okay";
+	};
+};
diff --git a/arch/arm64/boot/dts/st/stm32mp21xxao-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp21xxao-pinctrl.dtsi
new file mode 100644
index 0000000000000..0c4ed4a6d6401
--- /dev/null
+++ b/arch/arm64/boot/dts/st/stm32mp21xxao-pinctrl.dtsi
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2024-2025 - All Rights Reserved
+ * Author: Amelie Delaunay <amelie.delaunay@foss.st.com> for STMicroelectronics.
+ */
+
+&pinctrl {
+	st,package = "AO";
+
+	gpioa: gpio@44240000 {
+		ngpios = <15>;
+		gpio-ranges = <&pinctrl 0 0 12>, <&pinctrl 13 13 3>;
+		status = "okay";
+	};
+
+	gpiob: gpio@44250000 {
+		ngpios = <5>;
+		gpio-ranges = <&pinctrl 11 27 5>;
+		status = "okay";
+	};
+
+	gpioc: gpio@44260000 {
+		ngpios = <14>;
+		gpio-ranges = <&pinctrl 0 32 14>;
+		status = "okay";
+	};
+
+	gpiod: gpio@44270000 {
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 48 16>;
+		status = "okay";
+	};
+
+	gpioe: gpio@44280000 {
+		ngpios = <14>;
+		gpio-ranges = <&pinctrl 0 64 10>, <&pinctrl 11 75 3>, <&pinctrl 15 79 1>;
+		status = "okay";
+	};
+
+	gpiof: gpio@44290000 {
+		ngpios = <15>;
+		gpio-ranges = <&pinctrl 0 80 14>, <&pinctrl 15 95 1>;
+		status = "okay";
+	};
+
+	gpiog: gpio@442a0000 {
+		ngpios = <9>;
+		gpio-ranges = <&pinctrl 0 96 6>, <&pinctrl 7 103 1>, <&pinctrl 11 107 2>;
+		status = "okay";
+	};
+
+	gpioh: gpio@442b0000 {
+		ngpios = <7>;
+		gpio-ranges = <&pinctrl 4 116 2>, <&pinctrl 9 121 5>;
+		status = "okay";
+	};
+
+	gpioi: gpio@442c0000 {
+		ngpios = <3>;
+		gpio-ranges = <&pinctrl 0 128 2>, <&pinctrl 4 132 1>;
+		status = "okay";
+	};
+};
-- 
2.34.1


