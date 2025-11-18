Return-Path: <linux-gpio+bounces-28689-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BF5C6AE19
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 18:16:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 639183A67BA
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 17:09:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51B9D393DE1;
	Tue, 18 Nov 2025 17:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="av2PzN8N"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B03321D3F5;
	Tue, 18 Nov 2025 17:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763485705; cv=fail; b=idog7+J2+OP1BkYRnGO+Hl8iB/3l5BwbRr8a6u+er4JwZ+nTDkIubhNcp9UVsCzJ+P5Ug4IPribyUwiGhG0/zjJ1Q0XJ8+pYYGQ10SGz/UjRu9hUhLm5ItAgFh886TeITxB3H+oXQwiTV674mTR/R2bydwk/3MIfQybVqns/oI0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763485705; c=relaxed/simple;
	bh=KHAAOgFUr+g/eqsTxK+ONyYtPm+ZUhzwPNhwjEaqKjA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TCZQ3QSzUi0n2/wkQRoQ/QsNT3T8fIGcDQVAxz/LcU0JrZb5v/0WojRpX/lG1y15AwI1BKi/yI5onGgi9esq51FqEBGy4R+vXU2merkqsEhSRr1ynMtTU8hPweDmskA5IFKpfsQ4lgYCskw3ZbBSl5a5bU13kTU3I2+OHkxSqK8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=av2PzN8N; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIGblq0456269;
	Tue, 18 Nov 2025 18:05:18 +0100
Received: from db3pr0202cu003.outbound.protection.outlook.com (mail-northeuropeazon11010027.outbound.protection.outlook.com [52.101.84.27])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4agndtj96u-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 18 Nov 2025 18:05:17 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CJAnQbskcVvktpRPZweQw1Ux9VdKuOIaGy9qQK7TCqwu2f6zfEwy+loFa/yLH9eitoLmwaP4YzLY2wWBIQkxXY75RhQPgdwveLQLRNZMdXmpx0Oze0Hx+LnUPXDdBCMZ/sYo/qOjw6q6gXSRM2zyXZrO/qDhwGOfD92PBjmJt/Xv0hnTVapb47RAL5WK6h8MZhsDB/qnQZgbKg3+8EypQKxS0cVrPT6xex0AxrpGLj7zF3/P2MQ2JY/QF5gYvqPTLFor6y3bTX8oKDvTINEHvtx6fgyCv0XZctuonNfUX1J+YV+kFO3x7B0gMWYpiMBPZgyUouaTnd/lmI9l6AvONA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ywB4/cDrBumw0Aqkg7Ve6tUqoQLlq5CzJW31aCwkdFA=;
 b=NsP6/et3pwuHnbAqrT+1bfPbktiHpwbo9ldDim2gVLSTErmZEXH6N647g93/E4JaQucBR8nLp8ys0BBlVCYJ/aNxD3e0x5pb7/r017lNWzLTLYlYcAUluToj6l/+YBtsPahVQeIaN6rpP4zIUk6yYNvOpx5X8imBO3f5wok83Xfi/jxMfYE3lhwgEtARRgqDC1P/hrJKCwCgWhV5ngzUPM1IbK6i+LeExQEuqRQOWsLIfO6vVTPmuKkg+MRopbTlfl19hT5D6hIu6knZDg6rgJ0OZmSh6Yiqb6zujxwvRAtioIG/eTg5tKujKWGxO9rNlW3cvj+JbnEizF+gNeUIEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ywB4/cDrBumw0Aqkg7Ve6tUqoQLlq5CzJW31aCwkdFA=;
 b=av2PzN8NfssALUT4WT+0fappE/LEBCUCV5x0YvJW2+hSSPCUbL8huP6AAmi3sOKk9v2OD6h5BlN2Bu2fC/CefFy4N+VSH+FJUdUk+iztFrC3dB/AFKVUkHSqaGni+Wzz+8v8IKxgc4MK+29oqbJsXAOT4B7uRQik1AkglA8QBLgOgABHkszz9GIyogZIhVNqDJYi34jFUw+cjz7OzPAvLw6l3YLhtOZZZNS37XTVDCQp4BhON+ir8BcVyRxVVDkGdnczKRExqmyJAMcSHOjudO1ayZkARxEKL1nSAq59eJmlIj+hcDyK56s//Ni+EM+BKj5JY0d7r0ys+6kOSRvtHA==
Received: from AS9PR05CA0335.eurprd05.prod.outlook.com (2603:10a6:20b:490::31)
 by AM4PR10MB9424.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:6cc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.19; Tue, 18 Nov
 2025 17:05:12 +0000
Received: from AMS1EPF00000045.eurprd04.prod.outlook.com
 (2603:10a6:20b:490:cafe::d1) by AS9PR05CA0335.outlook.office365.com
 (2603:10a6:20b:490::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Tue,
 18 Nov 2025 17:05:09 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF00000045.mail.protection.outlook.com (10.167.16.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Tue, 18 Nov 2025 17:05:12 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 18 Nov
 2025 17:20:08 +0100
Received: from localhost (10.48.86.11) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 18 Nov
 2025 17:19:42 +0100
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
Subject: [PATCH v2 01/15] pinctrl: stm32: accept string value for property 'st,package'
Date: Tue, 18 Nov 2025 17:19:22 +0100
Message-ID: <20251118161936.1085477-2-antonio.borneo@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AMS1EPF00000045:EE_|AM4PR10MB9424:EE_
X-MS-Office365-Filtering-Correlation-Id: dde653ba-24a9-4c1d-ebb8-08de26c4a2f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|7416014|376014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OnSDgEDzqQGHp7W8D6EwYPmcx1w01gKGsoZs27/GJOE3fnxEVGQc5X5siLjk?=
 =?us-ascii?Q?6gYeZXTkyqcNQXS0bmCvopdZqa9PsDyn6qT4IiWQEaA3EpyRdOZpqdf7QaPq?=
 =?us-ascii?Q?9rkE7zGsDj51DufFdLec+eUA3DLx25hPYtUJ7k6Kw04nI7MLsNw0T2SGOD2q?=
 =?us-ascii?Q?z6n3IuQKn6UB2uUfh0d8IadZQUtBNruY8wWRVkx54X3pMgnZ+x+nFJ9Fp2Cg?=
 =?us-ascii?Q?+mE9XteaL6qnLXLzKLgCIgjrRZL/EvDc8RZhC/meiWa6t7S19aRFqLXc38U4?=
 =?us-ascii?Q?JqlwfTy/AjLxcNOn0OswoAoph5hyZV0m2QNQwC2HIqRpzR+HeAmhuVHx+K36?=
 =?us-ascii?Q?rySmx4BAEwul24/d3y1/kX0Ut3TGyfdOc4Nz5UHaeurRDNMc1TCe49ddmR+W?=
 =?us-ascii?Q?lYAx8/LLOSYDHw0x6QIXu58WurYhURPU1+xdIb9RMV/JutJN0ezFhaMfaFv0?=
 =?us-ascii?Q?43EpZ5VWOtohMUks+NDXAjMesG5A4xILotLC71hfS3XGcwfAZJh7eN/gt2rq?=
 =?us-ascii?Q?kmrW9LlRswn4B82keEFx//Kqz0JMu4MbwyqAexA3gecZeCG0NDb9JDFxoWym?=
 =?us-ascii?Q?olVUA+JCpvMF6u+rbZMqNGejmZGGvF4g7r473x15AT4XDc/xSZ+d2SQqbW3d?=
 =?us-ascii?Q?sdlP/cs9xnxdiv4d88tOOMZuhWkYNWsNJ3IW7cBXntYi8KmKGkLPXn9nej+d?=
 =?us-ascii?Q?jkEYuNA3pTWL9PdHC5s9jlufLEtfuPc8m7ZkGXc8l1Ofx7Iix8By8LBKHSqf?=
 =?us-ascii?Q?wPZv96839NnNFU2wDB4Koyv/Y6YFHvU3JHb9jB68jKRtUKsD8GvBDI9JyeHf?=
 =?us-ascii?Q?SFqEUvYgakbQJEKsh/ytpLyhy6EYtOXAt3nxU4V0d1ZYJcadIHkyjKGU3kSP?=
 =?us-ascii?Q?X8TNZa38ECGB5ESzhBaQPg1tqP+g6BaI4sWJsWKIhhwqjnavqBRGat9SIh9x?=
 =?us-ascii?Q?XchdDIb1I2ctmkZhsAzszVODrFb9vpaZafOgO8gIaYfTN8i6Te1GgbLawEgf?=
 =?us-ascii?Q?GCviVD/8rPj3sZnfwiGL3psdE+rv1qBGCzYAOyw3BTvoz2HiFuLBvnF0rFt4?=
 =?us-ascii?Q?KPU9SzV3tMZZ4gh3Z0Wp3Zd/MB0lsoEmRNF/OIwSw0+1ppiPrQ4PDvVvcF0Q?=
 =?us-ascii?Q?tPtb5/x/TMLb06y6RvYq44hgJAHwad+KkFcXLoHRKANac8AtE0EXiqn0snV9?=
 =?us-ascii?Q?n7Yh6FuD4oCD0Iw0lDLMZ+yN3p7VtGJsluGPQYRih2D3atLFyPSupeofnVXi?=
 =?us-ascii?Q?4VT1N/cUfRM1ljnwMyLjdYWdWM4FforbW82fFz/utsrphxHeoww5mmprNrLh?=
 =?us-ascii?Q?N8rYylcl7+U0q2phlSCbEM6qa4qkXydtL1d1qIPZNsNaMK5Wl+0UscOdvg7J?=
 =?us-ascii?Q?SJ6Uo+zcEOZqydcbmkjpOLOf5nancYw77FKqgFMUKwom7s3mYKQ4n242l8km?=
 =?us-ascii?Q?qMuvLnZsKaAH+UXOi75Z9JQYUFnrcV6mSEEt2jL6aPk3x/LSQwWWWIkEmAbr?=
 =?us-ascii?Q?PQGFakpMKoM4cSK0qnbkklJvhlxKQs5O7fSU0TMwwfWvu+XqbJLCxvqZzP4Y?=
 =?us-ascii?Q?RDXbex8Hv9lcHAtfmUZrSSDB615HQuaCCvEVAN/b?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(7416014)(376014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 17:05:12.1660
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dde653ba-24a9-4c1d-ebb8-08de26c4a2f3
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000045.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR10MB9424
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDEzOCBTYWx0ZWRfX6Kr23s5OuIgT
 KM+YGAGWlWDUDBXybQU36e8k4r/ZNhiEhLIQONBg9IQXed1z8XKVyAIOIeFc+IsEAbfB7uYz+UK
 NvbIaO3mn98tcUnGGBFBHWb8MGEV6ubvlz9hQQ9FXpn2ubEM+xDTcS1FhxpnCfySFd9FTS6CcrS
 7LFAmhx8HNeHZrfTop9UtAXZ9/TOZAgbX5KgEbm4bXbBQjz/yte5Y+CwGjVpD/C8iyeAZXesmF8
 dgz//6LYv7Og0j9kKV/l3cCHEr0nNYBp8JqkBxmjUIr4FId+gexptQ/P/zFa8wJwf1NXs46o4UX
 UzUynC9OOwKjAzech9zagYCc7CIFthHmsxWqWJx6mCxvcsqpkltk3m/lEDqqNNQ+z6DZ5YpkZvI
 AfTspqR6bi8nVtkl/y8cFjcN6xinAQ==
X-Proofpoint-GUID: DKbCDfV5cFRfGJYxTDFbcrinqP9X8su8
X-Authority-Analysis: v=2.4 cv=Uqhu9uwB c=1 sm=1 tr=0 ts=691ca74d cx=c_pps
 a=C4PoNGsIU3N66jy1tWvQag==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=y9YUpebZf6kA:10 a=6UeiqGixMTsA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=h23zC11bdaizGTZUbx4A:9 a=T3LWEMljR5ZiDmsYVIUa:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: DKbCDfV5cFRfGJYxTDFbcrinqP9X8su8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180138

The property 'st,package' reports the SoC package used in the
board DT and is used to inform the driver about which pins are
available for use by the pinctrl driver.
It has historically been declared as an uint32 enum, where each
value is a power of 2.

For backward compatibility, still accept the numeric value.
Beside that, accept the new readable string values.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c      |  32 +-
 drivers/pinctrl/stm32/pinctrl-stm32.h      |  25 +-
 drivers/pinctrl/stm32/pinctrl-stm32mp157.c | 352 ++++++++++-----------
 drivers/pinctrl/stm32/pinctrl-stm32mp257.c | 344 ++++++++++----------
 4 files changed, 396 insertions(+), 357 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 6a99708a5a23c..0f5ab585e4bbb 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -125,6 +125,28 @@ static const struct pinconf_generic_params stm32_gpio_bindings[] = {
 	 stm32_gpio_io_sync, ARRAY_SIZE(stm32_gpio_io_sync)},
 };
 
+__diag_push();
+__diag_ignore_all("-Woverride-init", "Allow field overrides in table");
+
+static const char * const stm32_pkgs[] = {
+	/*
+	 * Default dummy value, as match_string() doesn't accepts NULL.
+	 * Also not an empty string because it will match the old numeric
+	 * values <= 0x00ffffff.
+	 */
+	[0 ... (STM32_PKG_MAX - 1)] = "x",
+
+	[STM32_PKG_AA] = "AA",
+	[STM32_PKG_AB] = "AB",
+	[STM32_PKG_AC] = "AC",
+	[STM32_PKG_AD] = "AD",
+	[STM32_PKG_AI] = "AI",
+	[STM32_PKG_AK] = "AK",
+	[STM32_PKG_AL] = "AL",
+};
+
+__diag_pop();
+
 struct stm32_pinctrl_group {
 	const char *name;
 	unsigned long config;
@@ -1894,10 +1916,18 @@ int stm32_pctl_probe(struct platform_device *pdev)
 	pctl->dev = dev;
 	pctl->match_data = match_data;
 
-	/*  get optional package information */
+	/* get optional package information, legacy binding */
 	if (!device_property_read_u32(dev, "st,package", &pctl->pkg))
 		dev_dbg(pctl->dev, "package detected: %x\n", pctl->pkg);
 
+	/* get optional package information, modern binding */
+	ret = device_property_match_property_string(pctl->dev, "st,package",
+						    stm32_pkgs, STM32_PKG_MAX);
+	if (ret >= 0) {
+		dev_dbg(pctl->dev, "package detected: \"%s\"\n", stm32_pkgs[ret]);
+		pctl->pkg = BIT(ret);
+	}
+
 	pctl->pins = devm_kcalloc(pctl->dev, pctl->match_data->npins,
 				  sizeof(*pctl->pins), GFP_KERNEL);
 	if (!pctl->pins)
diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.h b/drivers/pinctrl/stm32/pinctrl-stm32.h
index d17cbdbba4482..6761024ce691a 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.h
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.h
@@ -20,14 +20,23 @@
 #define STM32_PIN_RSVD		(STM32_PIN_ANALOG + 1)
 #define STM32_CONFIG_NUM	(STM32_PIN_RSVD + 1)
 
-/*  package information */
-#define STM32MP_PKG_AA		BIT(0)
-#define STM32MP_PKG_AB		BIT(1)
-#define STM32MP_PKG_AC		BIT(2)
-#define STM32MP_PKG_AD		BIT(3)
-#define STM32MP_PKG_AI		BIT(8)
-#define STM32MP_PKG_AK		BIT(10)
-#define STM32MP_PKG_AL		BIT(11)
+/*
+ * package information
+ * For DT backward compatibility, some value below is tagged as not to be changed
+ * New packages can assume any other value
+ */
+enum stm32_pkg {
+	STM32_PKG_AA = 0,  /* do not change */
+	STM32_PKG_AB = 1,  /* do not change */
+	STM32_PKG_AC = 2,  /* do not change */
+	STM32_PKG_AD = 3,  /* do not change */
+	STM32_PKG_AI = 8,  /* do not change */
+	STM32_PKG_AK = 10, /* do not change */
+	STM32_PKG_AL = 11, /* do not change */
+
+	/* keep this as last item */
+	STM32_PKG_MAX,
+};
 
 struct stm32_desc_function {
 	const char *name;
diff --git a/drivers/pinctrl/stm32/pinctrl-stm32mp157.c b/drivers/pinctrl/stm32/pinctrl-stm32mp157.c
index 91b2fc8ddbdbc..af031d7f47548 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32mp157.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32mp157.c
@@ -12,7 +12,7 @@
 static const struct stm32_desc_pin stm32mp157_pins[] = {
 	STM32_PIN_PKG(
 		PINCTRL_PIN(0, "PA0"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOA0"),
 		STM32_FUNCTION(2, "TIM2_CH1 TIM2_ETR"),
 		STM32_FUNCTION(3, "TIM5_CH1"),
@@ -28,7 +28,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(1, "PA1"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOA1"),
 		STM32_FUNCTION(1, "ETH_CLK"),
 		STM32_FUNCTION(2, "TIM2_CH2"),
@@ -46,7 +46,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(2, "PA2"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOA2"),
 		STM32_FUNCTION(2, "TIM2_CH3"),
 		STM32_FUNCTION(3, "TIM5_CH3"),
@@ -63,7 +63,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(3, "PA3"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOA3"),
 		STM32_FUNCTION(2, "TIM2_CH4"),
 		STM32_FUNCTION(3, "TIM5_CH4"),
@@ -78,7 +78,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(4, "PA4"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOA4"),
 		STM32_FUNCTION(1, "HDP0"),
 		STM32_FUNCTION(3, "TIM5_ETR"),
@@ -95,7 +95,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(5, "PA5"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOA5"),
 		STM32_FUNCTION(2, "TIM2_CH1 TIM2_ETR"),
 		STM32_FUNCTION(4, "TIM8_CH1N"),
@@ -109,7 +109,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(6, "PA6"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOA6"),
 		STM32_FUNCTION(2, "TIM1_BKIN"),
 		STM32_FUNCTION(3, "TIM3_CH1"),
@@ -127,7 +127,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(7, "PA7"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOA7"),
 		STM32_FUNCTION(2, "TIM1_CH1N"),
 		STM32_FUNCTION(3, "TIM3_CH2"),
@@ -144,7 +144,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(8, "PA8"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOA8"),
 		STM32_FUNCTION(1, "MCO1"),
 		STM32_FUNCTION(2, "TIM1_CH1"),
@@ -163,7 +163,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(9, "PA9"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOA9"),
 		STM32_FUNCTION(2, "TIM1_CH2"),
 		STM32_FUNCTION(5, "I2C3_SMBA"),
@@ -178,7 +178,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(10, "PA10"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOA10"),
 		STM32_FUNCTION(2, "TIM1_CH3"),
 		STM32_FUNCTION(6, "SPI3_NSS I2S3_WS"),
@@ -192,7 +192,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(11, "PA11"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOA11"),
 		STM32_FUNCTION(2, "TIM1_CH4"),
 		STM32_FUNCTION(3, "I2C6_SCL"),
@@ -207,7 +207,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(12, "PA12"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOA12"),
 		STM32_FUNCTION(2, "TIM1_ETR"),
 		STM32_FUNCTION(3, "I2C6_SDA"),
@@ -222,7 +222,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(13, "PA13"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOA13"),
 		STM32_FUNCTION(1, "DBTRGO"),
 		STM32_FUNCTION(2, "DBTRGI"),
@@ -233,7 +233,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(14, "PA14"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOA14"),
 		STM32_FUNCTION(1, "DBTRGO"),
 		STM32_FUNCTION(2, "DBTRGI"),
@@ -243,7 +243,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(15, "PA15"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOA15"),
 		STM32_FUNCTION(1, "DBTRGI"),
 		STM32_FUNCTION(2, "TIM2_CH1 TIM2_ETR"),
@@ -265,7 +265,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(16, "PB0"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOB0"),
 		STM32_FUNCTION(2, "TIM1_CH2N"),
 		STM32_FUNCTION(3, "TIM3_CH3"),
@@ -281,7 +281,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(17, "PB1"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOB1"),
 		STM32_FUNCTION(2, "TIM1_CH3N"),
 		STM32_FUNCTION(3, "TIM3_CH4"),
@@ -296,7 +296,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(18, "PB2"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOB2"),
 		STM32_FUNCTION(1, "TRACED4"),
 		STM32_FUNCTION(2, "RTC_OUT2"),
@@ -313,7 +313,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(19, "PB3"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOB3"),
 		STM32_FUNCTION(1, "TRACED9"),
 		STM32_FUNCTION(2, "TIM2_CH2"),
@@ -329,7 +329,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(20, "PB4"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOB4"),
 		STM32_FUNCTION(1, "TRACED8"),
 		STM32_FUNCTION(2, "TIM16_BKIN"),
@@ -347,7 +347,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(21, "PB5"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOB5"),
 		STM32_FUNCTION(1, "ETH_CLK"),
 		STM32_FUNCTION(2, "TIM17_BKIN"),
@@ -369,7 +369,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(22, "PB6"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOB6"),
 		STM32_FUNCTION(2, "TIM16_CH1N"),
 		STM32_FUNCTION(3, "TIM4_CH1"),
@@ -387,7 +387,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(23, "PB7"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOB7"),
 		STM32_FUNCTION(2, "TIM17_CH1N"),
 		STM32_FUNCTION(3, "TIM4_CH2"),
@@ -403,7 +403,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(24, "PB8"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOB8"),
 		STM32_FUNCTION(1, "HDP6"),
 		STM32_FUNCTION(2, "TIM16_CH1"),
@@ -425,7 +425,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(25, "PB9"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOB9"),
 		STM32_FUNCTION(1, "HDP7"),
 		STM32_FUNCTION(2, "TIM17_CH1"),
@@ -447,7 +447,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(26, "PB10"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOB10"),
 		STM32_FUNCTION(2, "TIM2_CH3"),
 		STM32_FUNCTION(4, "LPTIM2_IN1"),
@@ -463,7 +463,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(27, "PB11"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOB11"),
 		STM32_FUNCTION(2, "TIM2_CH4"),
 		STM32_FUNCTION(4, "LPTIM2_ETR"),
@@ -478,7 +478,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(28, "PB12"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOB12"),
 		STM32_FUNCTION(2, "TIM1_BKIN"),
 		STM32_FUNCTION(3, "I2C6_SMBA"),
@@ -495,7 +495,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(29, "PB13"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOB13"),
 		STM32_FUNCTION(2, "TIM1_CH1N"),
 		STM32_FUNCTION(4, "DFSDM1_CKOUT"),
@@ -511,7 +511,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(30, "PB14"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOB14"),
 		STM32_FUNCTION(2, "TIM1_CH2N"),
 		STM32_FUNCTION(3, "TIM12_CH1"),
@@ -526,7 +526,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(31, "PB15"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOB15"),
 		STM32_FUNCTION(1, "RTC_REFIN"),
 		STM32_FUNCTION(2, "TIM1_CH3N"),
@@ -541,7 +541,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(32, "PC0"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOC0"),
 		STM32_FUNCTION(4, "DFSDM1_CKIN0"),
 		STM32_FUNCTION(5, "LPTIM2_IN2"),
@@ -554,7 +554,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(33, "PC1"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOC1"),
 		STM32_FUNCTION(1, "TRACED0"),
 		STM32_FUNCTION(3, "SAI1_D1"),
@@ -570,7 +570,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(34, "PC2"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOC2"),
 		STM32_FUNCTION(4, "DFSDM1_CKIN1"),
 		STM32_FUNCTION(6, "SPI2_MISO I2S2_SDI"),
@@ -582,7 +582,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(35, "PC3"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOC3"),
 		STM32_FUNCTION(1, "TRACECLK"),
 		STM32_FUNCTION(4, "DFSDM1_DATIN1"),
@@ -593,7 +593,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(36, "PC4"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOC4"),
 		STM32_FUNCTION(4, "DFSDM1_CKIN2"),
 		STM32_FUNCTION(6, "I2S1_MCK"),
@@ -604,7 +604,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(37, "PC5"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOC5"),
 		STM32_FUNCTION(3, "SAI1_D3"),
 		STM32_FUNCTION(4, "DFSDM1_DATIN2"),
@@ -618,7 +618,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(38, "PC6"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOC6"),
 		STM32_FUNCTION(1, "HDP1"),
 		STM32_FUNCTION(3, "TIM3_CH1"),
@@ -638,7 +638,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(39, "PC7"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOC7"),
 		STM32_FUNCTION(1, "HDP4"),
 		STM32_FUNCTION(3, "TIM3_CH2"),
@@ -657,7 +657,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(40, "PC8"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOC8"),
 		STM32_FUNCTION(1, "TRACED0"),
 		STM32_FUNCTION(3, "TIM3_CH3"),
@@ -672,7 +672,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(41, "PC9"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOC9"),
 		STM32_FUNCTION(1, "TRACED1"),
 		STM32_FUNCTION(3, "TIM3_CH4"),
@@ -689,7 +689,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(42, "PC10"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOC10"),
 		STM32_FUNCTION(1, "TRACED2"),
 		STM32_FUNCTION(4, "DFSDM1_CKIN5"),
@@ -706,7 +706,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(43, "PC11"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOC11"),
 		STM32_FUNCTION(1, "TRACED3"),
 		STM32_FUNCTION(4, "DFSDM1_DATIN5"),
@@ -722,7 +722,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(44, "PC12"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOC12"),
 		STM32_FUNCTION(1, "TRACECLK"),
 		STM32_FUNCTION(2, "MCO2"),
@@ -738,28 +738,28 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(45, "PC13"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOC13"),
 		STM32_FUNCTION(16, "EVENTOUT"),
 		STM32_FUNCTION(17, "ANALOG")
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(46, "PC14"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOC14"),
 		STM32_FUNCTION(16, "EVENTOUT"),
 		STM32_FUNCTION(17, "ANALOG")
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(47, "PC15"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOC15"),
 		STM32_FUNCTION(16, "EVENTOUT"),
 		STM32_FUNCTION(17, "ANALOG")
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(48, "PD0"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOD0"),
 		STM32_FUNCTION(3, "I2C6_SDA"),
 		STM32_FUNCTION(4, "DFSDM1_CKIN6"),
@@ -775,7 +775,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(49, "PD1"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOD1"),
 		STM32_FUNCTION(3, "I2C6_SCL"),
 		STM32_FUNCTION(4, "DFSDM1_DATIN6"),
@@ -791,7 +791,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(50, "PD2"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOD2"),
 		STM32_FUNCTION(3, "TIM3_ETR"),
 		STM32_FUNCTION(5, "I2C5_SMBA"),
@@ -804,7 +804,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(51, "PD3"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOD3"),
 		STM32_FUNCTION(1, "HDP5"),
 		STM32_FUNCTION(4, "DFSDM1_CKOUT"),
@@ -823,7 +823,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(52, "PD4"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOD4"),
 		STM32_FUNCTION(7, "SAI3_FS_A"),
 		STM32_FUNCTION(8, "USART2_RTS USART2_DE"),
@@ -835,7 +835,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(53, "PD5"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOD5"),
 		STM32_FUNCTION(8, "USART2_TX"),
 		STM32_FUNCTION(11, "SDMMC3_D2"),
@@ -845,7 +845,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(54, "PD6"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOD6"),
 		STM32_FUNCTION(2, "TIM16_CH1N"),
 		STM32_FUNCTION(3, "SAI1_D1"),
@@ -862,7 +862,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(55, "PD7"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOD7"),
 		STM32_FUNCTION(1, "TRACED6"),
 		STM32_FUNCTION(4, "DFSDM1_DATIN4"),
@@ -877,7 +877,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(56, "PD8"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOD8"),
 		STM32_FUNCTION(4, "DFSDM1_CKIN3"),
 		STM32_FUNCTION(7, "SAI3_SCK_B"),
@@ -890,7 +890,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(57, "PD9"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOD9"),
 		STM32_FUNCTION(4, "DFSDM1_DATIN3"),
 		STM32_FUNCTION(7, "SAI3_SD_B"),
@@ -903,7 +903,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(58, "PD10"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOD10"),
 		STM32_FUNCTION(1, "RTC_REFIN"),
 		STM32_FUNCTION(2, "TIM16_BKIN"),
@@ -919,7 +919,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(59, "PD11"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOD11"),
 		STM32_FUNCTION(4, "LPTIM2_IN2"),
 		STM32_FUNCTION(5, "I2C4_SMBA"),
@@ -933,7 +933,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(60, "PD12"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOD12"),
 		STM32_FUNCTION(2, "LPTIM1_IN1"),
 		STM32_FUNCTION(3, "TIM4_CH1"),
@@ -949,7 +949,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(61, "PD13"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOD13"),
 		STM32_FUNCTION(2, "LPTIM1_OUT"),
 		STM32_FUNCTION(3, "TIM4_CH2"),
@@ -965,7 +965,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(62, "PD14"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOD14"),
 		STM32_FUNCTION(3, "TIM4_CH3"),
 		STM32_FUNCTION(7, "SAI3_MCLK_B"),
@@ -976,7 +976,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(63, "PD15"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOD15"),
 		STM32_FUNCTION(3, "TIM4_CH4"),
 		STM32_FUNCTION(7, "SAI3_MCLK_A"),
@@ -988,7 +988,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(64, "PE0"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOE0"),
 		STM32_FUNCTION(2, "LPTIM1_ETR"),
 		STM32_FUNCTION(3, "TIM4_ETR"),
@@ -1004,7 +1004,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(65, "PE1"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOE1"),
 		STM32_FUNCTION(2, "LPTIM1_IN2"),
 		STM32_FUNCTION(6, "I2S2_MCK"),
@@ -1017,7 +1017,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(66, "PE2"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOE2"),
 		STM32_FUNCTION(1, "TRACECLK"),
 		STM32_FUNCTION(3, "SAI1_CK1"),
@@ -1032,7 +1032,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(67, "PE3"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOE3"),
 		STM32_FUNCTION(1, "TRACED0"),
 		STM32_FUNCTION(5, "TIM15_BKIN"),
@@ -1044,7 +1044,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(68, "PE4"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOE4"),
 		STM32_FUNCTION(1, "TRACED1"),
 		STM32_FUNCTION(3, "SAI1_D2"),
@@ -1064,7 +1064,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(69, "PE5"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOE5"),
 		STM32_FUNCTION(1, "TRACED3"),
 		STM32_FUNCTION(3, "SAI1_CK2"),
@@ -1084,7 +1084,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(70, "PE6"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOE6"),
 		STM32_FUNCTION(1, "TRACED2"),
 		STM32_FUNCTION(2, "TIM1_BKIN2"),
@@ -1103,7 +1103,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(71, "PE7"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOE7"),
 		STM32_FUNCTION(2, "TIM1_ETR"),
 		STM32_FUNCTION(3, "TIM3_ETR"),
@@ -1116,7 +1116,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(72, "PE8"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOE8"),
 		STM32_FUNCTION(2, "TIM1_CH1N"),
 		STM32_FUNCTION(4, "DFSDM1_CKIN2"),
@@ -1128,7 +1128,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(73, "PE9"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOE9"),
 		STM32_FUNCTION(2, "TIM1_CH1"),
 		STM32_FUNCTION(4, "DFSDM1_CKOUT"),
@@ -1140,7 +1140,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(74, "PE10"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOE10"),
 		STM32_FUNCTION(2, "TIM1_CH2N"),
 		STM32_FUNCTION(4, "DFSDM1_DATIN4"),
@@ -1152,7 +1152,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(75, "PE11"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOE11"),
 		STM32_FUNCTION(2, "TIM1_CH2"),
 		STM32_FUNCTION(4, "DFSDM1_CKIN4"),
@@ -1167,7 +1167,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(76, "PE12"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOE12"),
 		STM32_FUNCTION(2, "TIM1_CH3N"),
 		STM32_FUNCTION(4, "DFSDM1_DATIN5"),
@@ -1181,7 +1181,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(77, "PE13"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOE13"),
 		STM32_FUNCTION(1, "HDP2"),
 		STM32_FUNCTION(2, "TIM1_CH3"),
@@ -1196,7 +1196,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(78, "PE14"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOE14"),
 		STM32_FUNCTION(2, "TIM1_CH4"),
 		STM32_FUNCTION(6, "SPI4_MOSI"),
@@ -1211,7 +1211,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(79, "PE15"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOE15"),
 		STM32_FUNCTION(1, "HDP3"),
 		STM32_FUNCTION(2, "TIM1_BKIN"),
@@ -1226,7 +1226,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(80, "PF0"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC),
 		STM32_FUNCTION(0, "GPIOF0"),
 		STM32_FUNCTION(5, "I2C2_SDA"),
 		STM32_FUNCTION(10, "SDMMC3_D0"),
@@ -1237,7 +1237,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(81, "PF1"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC),
 		STM32_FUNCTION(0, "GPIOF1"),
 		STM32_FUNCTION(5, "I2C2_SCL"),
 		STM32_FUNCTION(10, "SDMMC3_CMD"),
@@ -1248,7 +1248,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(82, "PF2"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC),
 		STM32_FUNCTION(0, "GPIOF2"),
 		STM32_FUNCTION(5, "I2C2_SMBA"),
 		STM32_FUNCTION(10, "SDMMC2_D0DIR"),
@@ -1260,7 +1260,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(83, "PF3"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC),
 		STM32_FUNCTION(0, "GPIOF3"),
 		STM32_FUNCTION(12, "ETH1_GMII_TX_ER ETH1_MII_TX_ER"),
 		STM32_FUNCTION(13, "FMC_A3"),
@@ -1269,7 +1269,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(84, "PF4"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC),
 		STM32_FUNCTION(0, "GPIOF4"),
 		STM32_FUNCTION(8, "USART2_RX"),
 		STM32_FUNCTION(10, "SDMMC3_D1"),
@@ -1280,7 +1280,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(85, "PF5"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC),
 		STM32_FUNCTION(0, "GPIOF5"),
 		STM32_FUNCTION(8, "USART2_TX"),
 		STM32_FUNCTION(10, "SDMMC3_D2"),
@@ -1290,7 +1290,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(86, "PF6"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOF6"),
 		STM32_FUNCTION(2, "TIM16_CH1"),
 		STM32_FUNCTION(6, "SPI5_NSS"),
@@ -1303,7 +1303,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(87, "PF7"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOF7"),
 		STM32_FUNCTION(2, "TIM17_CH1"),
 		STM32_FUNCTION(6, "SPI5_SCK"),
@@ -1315,7 +1315,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(88, "PF8"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOF8"),
 		STM32_FUNCTION(1, "TRACED12"),
 		STM32_FUNCTION(2, "TIM16_CH1N"),
@@ -1329,7 +1329,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(89, "PF9"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOF9"),
 		STM32_FUNCTION(1, "TRACED13"),
 		STM32_FUNCTION(2, "TIM17_CH1N"),
@@ -1343,7 +1343,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(90, "PF10"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOF10"),
 		STM32_FUNCTION(2, "TIM16_BKIN"),
 		STM32_FUNCTION(3, "SAI1_D3"),
@@ -1358,7 +1358,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(91, "PF11"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOF11"),
 		STM32_FUNCTION(6, "SPI5_MOSI"),
 		STM32_FUNCTION(11, "SAI2_SD_B"),
@@ -1369,7 +1369,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(92, "PF12"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC),
 		STM32_FUNCTION(0, "GPIOF12"),
 		STM32_FUNCTION(1, "TRACED4"),
 		STM32_FUNCTION(12, "ETH1_GMII_RXD4"),
@@ -1379,7 +1379,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(93, "PF13"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC),
 		STM32_FUNCTION(0, "GPIOF13"),
 		STM32_FUNCTION(1, "TRACED5"),
 		STM32_FUNCTION(4, "DFSDM1_DATIN6"),
@@ -1393,7 +1393,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(94, "PF14"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC),
 		STM32_FUNCTION(0, "GPIOF14"),
 		STM32_FUNCTION(1, "TRACED6"),
 		STM32_FUNCTION(4, "DFSDM1_CKIN6"),
@@ -1406,7 +1406,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(95, "PF15"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC),
 		STM32_FUNCTION(0, "GPIOF15"),
 		STM32_FUNCTION(1, "TRACED7"),
 		STM32_FUNCTION(5, "I2C4_SDA"),
@@ -1418,7 +1418,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(96, "PG0"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC),
 		STM32_FUNCTION(0, "GPIOG0"),
 		STM32_FUNCTION(1, "TRACED0"),
 		STM32_FUNCTION(4, "DFSDM1_DATIN0"),
@@ -1429,7 +1429,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(97, "PG1"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC),
 		STM32_FUNCTION(0, "GPIOG1"),
 		STM32_FUNCTION(1, "TRACED1"),
 		STM32_FUNCTION(12, "ETH1_GMII_TXD5"),
@@ -1439,7 +1439,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(98, "PG2"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC),
 		STM32_FUNCTION(0, "GPIOG2"),
 		STM32_FUNCTION(1, "TRACED2"),
 		STM32_FUNCTION(2, "MCO2"),
@@ -1451,7 +1451,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(99, "PG3"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC),
 		STM32_FUNCTION(0, "GPIOG3"),
 		STM32_FUNCTION(1, "TRACED3"),
 		STM32_FUNCTION(4, "TIM8_BKIN2"),
@@ -1463,7 +1463,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(100, "PG4"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC),
 		STM32_FUNCTION(0, "GPIOG4"),
 		STM32_FUNCTION(2, "TIM1_BKIN2"),
 		STM32_FUNCTION(12, "ETH1_GMII_GTX_CLK ETH1_RGMII_GTX_CLK"),
@@ -1473,7 +1473,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(101, "PG5"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC),
 		STM32_FUNCTION(0, "GPIOG5"),
 		STM32_FUNCTION(2, "TIM1_ETR"),
 		STM32_FUNCTION(12, "ETH1_GMII_CLK125 ETH1_RGMII_CLK125"),
@@ -1483,7 +1483,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(102, "PG6"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOG6"),
 		STM32_FUNCTION(1, "TRACED14"),
 		STM32_FUNCTION(2, "TIM17_BKIN"),
@@ -1495,7 +1495,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(103, "PG7"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOG7"),
 		STM32_FUNCTION(1, "TRACED5"),
 		STM32_FUNCTION(7, "SAI1_MCLK_A"),
@@ -1511,7 +1511,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(104, "PG8"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOG8"),
 		STM32_FUNCTION(1, "TRACED15"),
 		STM32_FUNCTION(2, "TIM2_CH1 TIM2_ETR"),
@@ -1530,7 +1530,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(105, "PG9"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOG9"),
 		STM32_FUNCTION(1, "DBTRGO"),
 		STM32_FUNCTION(8, "USART6_RX"),
@@ -1545,7 +1545,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(106, "PG10"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOG10"),
 		STM32_FUNCTION(1, "TRACED10"),
 		STM32_FUNCTION(9, "UART8_CTS"),
@@ -1560,7 +1560,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(107, "PG11"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOG11"),
 		STM32_FUNCTION(1, "TRACED11"),
 		STM32_FUNCTION(5, "USART1_TX"),
@@ -1574,7 +1574,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(108, "PG12"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOG12"),
 		STM32_FUNCTION(2, "LPTIM1_IN1"),
 		STM32_FUNCTION(6, "SPI6_MISO"),
@@ -1591,7 +1591,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(109, "PG13"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOG13"),
 		STM32_FUNCTION(1, "TRACED0"),
 		STM32_FUNCTION(2, "LPTIM1_OUT"),
@@ -1609,7 +1609,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(110, "PG14"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOG14"),
 		STM32_FUNCTION(1, "TRACED1"),
 		STM32_FUNCTION(2, "LPTIM1_ETR"),
@@ -1626,7 +1626,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(111, "PG15"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOG15"),
 		STM32_FUNCTION(1, "TRACED7"),
 		STM32_FUNCTION(3, "SAI1_D2"),
@@ -1640,21 +1640,21 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(112, "PH0"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOH0"),
 		STM32_FUNCTION(16, "EVENTOUT"),
 		STM32_FUNCTION(17, "ANALOG")
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(113, "PH1"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC | STM32MP_PKG_AB | STM32MP_PKG_AD,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC) | BIT(STM32_PKG_AB) | BIT(STM32_PKG_AD),
 		STM32_FUNCTION(0, "GPIOH1"),
 		STM32_FUNCTION(16, "EVENTOUT"),
 		STM32_FUNCTION(17, "ANALOG")
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(114, "PH2"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC),
 		STM32_FUNCTION(0, "GPIOH2"),
 		STM32_FUNCTION(2, "LPTIM1_IN2"),
 		STM32_FUNCTION(10, "QUADSPI_BK2_IO0"),
@@ -1666,7 +1666,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(115, "PH3"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC),
 		STM32_FUNCTION(0, "GPIOH3"),
 		STM32_FUNCTION(4, "DFSDM1_CKIN4"),
 		STM32_FUNCTION(10, "QUADSPI_BK2_IO1"),
@@ -1678,7 +1678,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(116, "PH4"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC),
 		STM32_FUNCTION(0, "GPIOH4"),
 		STM32_FUNCTION(5, "I2C2_SCL"),
 		STM32_FUNCTION(10, "LCD_G5"),
@@ -1688,7 +1688,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(117, "PH5"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC),
 		STM32_FUNCTION(0, "GPIOH5"),
 		STM32_FUNCTION(5, "I2C2_SDA"),
 		STM32_FUNCTION(6, "SPI5_NSS"),
@@ -1698,7 +1698,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(118, "PH6"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC),
 		STM32_FUNCTION(0, "GPIOH6"),
 		STM32_FUNCTION(3, "TIM12_CH1"),
 		STM32_FUNCTION(5, "I2C2_SMBA"),
@@ -1711,7 +1711,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(119, "PH7"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC),
 		STM32_FUNCTION(0, "GPIOH7"),
 		STM32_FUNCTION(5, "I2C3_SCL"),
 		STM32_FUNCTION(6, "SPI5_MISO"),
@@ -1723,7 +1723,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(120, "PH8"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC),
 		STM32_FUNCTION(0, "GPIOH8"),
 		STM32_FUNCTION(3, "TIM5_ETR"),
 		STM32_FUNCTION(5, "I2C3_SDA"),
@@ -1734,7 +1734,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(121, "PH9"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC),
 		STM32_FUNCTION(0, "GPIOH9"),
 		STM32_FUNCTION(3, "TIM12_CH2"),
 		STM32_FUNCTION(5, "I2C3_SMBA"),
@@ -1745,7 +1745,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(122, "PH10"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC),
 		STM32_FUNCTION(0, "GPIOH10"),
 		STM32_FUNCTION(3, "TIM5_CH1"),
 		STM32_FUNCTION(5, "I2C4_SMBA"),
@@ -1757,7 +1757,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(123, "PH11"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC),
 		STM32_FUNCTION(0, "GPIOH11"),
 		STM32_FUNCTION(3, "TIM5_CH2"),
 		STM32_FUNCTION(5, "I2C4_SCL"),
@@ -1769,7 +1769,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(124, "PH12"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC),
 		STM32_FUNCTION(0, "GPIOH12"),
 		STM32_FUNCTION(1, "HDP2"),
 		STM32_FUNCTION(3, "TIM5_CH3"),
@@ -1782,7 +1782,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(125, "PH13"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC),
 		STM32_FUNCTION(0, "GPIOH13"),
 		STM32_FUNCTION(4, "TIM8_CH1N"),
 		STM32_FUNCTION(9, "UART4_TX"),
@@ -1793,7 +1793,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(126, "PH14"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC),
 		STM32_FUNCTION(0, "GPIOH14"),
 		STM32_FUNCTION(4, "TIM8_CH2N"),
 		STM32_FUNCTION(9, "UART4_RX"),
@@ -1805,7 +1805,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(127, "PH15"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC),
 		STM32_FUNCTION(0, "GPIOH15"),
 		STM32_FUNCTION(4, "TIM8_CH3N"),
 		STM32_FUNCTION(14, "DCMI_D11"),
@@ -1815,7 +1815,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(128, "PI0"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC),
 		STM32_FUNCTION(0, "GPIOI0"),
 		STM32_FUNCTION(3, "TIM5_CH4"),
 		STM32_FUNCTION(6, "SPI2_NSS I2S2_WS"),
@@ -1826,7 +1826,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(129, "PI1"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC),
 		STM32_FUNCTION(0, "GPIOI1"),
 		STM32_FUNCTION(4, "TIM8_BKIN2"),
 		STM32_FUNCTION(6, "SPI2_SCK I2S2_CK"),
@@ -1837,7 +1837,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(130, "PI2"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC),
 		STM32_FUNCTION(0, "GPIOI2"),
 		STM32_FUNCTION(4, "TIM8_CH4"),
 		STM32_FUNCTION(6, "SPI2_MISO I2S2_SDI"),
@@ -1848,7 +1848,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(131, "PI3"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC),
 		STM32_FUNCTION(0, "GPIOI3"),
 		STM32_FUNCTION(4, "TIM8_ETR"),
 		STM32_FUNCTION(6, "SPI2_MOSI I2S2_SDO"),
@@ -1858,7 +1858,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(132, "PI4"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC),
 		STM32_FUNCTION(0, "GPIOI4"),
 		STM32_FUNCTION(4, "TIM8_BKIN"),
 		STM32_FUNCTION(11, "SAI2_MCLK_A"),
@@ -1869,7 +1869,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(133, "PI5"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC),
 		STM32_FUNCTION(0, "GPIOI5"),
 		STM32_FUNCTION(4, "TIM8_CH1"),
 		STM32_FUNCTION(11, "SAI2_SCK_A"),
@@ -1880,7 +1880,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(134, "PI6"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC),
 		STM32_FUNCTION(0, "GPIOI6"),
 		STM32_FUNCTION(4, "TIM8_CH2"),
 		STM32_FUNCTION(11, "SAI2_SD_A"),
@@ -1891,7 +1891,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(135, "PI7"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC),
 		STM32_FUNCTION(0, "GPIOI7"),
 		STM32_FUNCTION(4, "TIM8_CH3"),
 		STM32_FUNCTION(11, "SAI2_FS_A"),
@@ -1902,14 +1902,14 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(136, "PI8"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC),
 		STM32_FUNCTION(0, "GPIOI8"),
 		STM32_FUNCTION(16, "EVENTOUT"),
 		STM32_FUNCTION(17, "ANALOG")
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(137, "PI9"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC),
 		STM32_FUNCTION(0, "GPIOI9"),
 		STM32_FUNCTION(1, "HDP1"),
 		STM32_FUNCTION(9, "UART4_RX"),
@@ -1920,7 +1920,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(138, "PI10"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC),
 		STM32_FUNCTION(0, "GPIOI10"),
 		STM32_FUNCTION(1, "HDP0"),
 		STM32_FUNCTION(9, "USART3_CTS USART3_NSS"),
@@ -1931,7 +1931,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(139, "PI11"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC),
 		STM32_FUNCTION(0, "GPIOI11"),
 		STM32_FUNCTION(1, "MCO1"),
 		STM32_FUNCTION(6, "I2S_CKIN"),
@@ -1941,7 +1941,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(140, "PI12"),
-		STM32MP_PKG_AA,
+		BIT(STM32_PKG_AA),
 		STM32_FUNCTION(0, "GPIOI12"),
 		STM32_FUNCTION(1, "TRACED0"),
 		STM32_FUNCTION(3, "HDP0"),
@@ -1951,7 +1951,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(141, "PI13"),
-		STM32MP_PKG_AA,
+		BIT(STM32_PKG_AA),
 		STM32_FUNCTION(0, "GPIOI13"),
 		STM32_FUNCTION(1, "TRACED1"),
 		STM32_FUNCTION(3, "HDP1"),
@@ -1961,7 +1961,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(142, "PI14"),
-		STM32MP_PKG_AA,
+		BIT(STM32_PKG_AA),
 		STM32_FUNCTION(0, "GPIOI14"),
 		STM32_FUNCTION(1, "TRACECLK"),
 		STM32_FUNCTION(15, "LCD_CLK"),
@@ -1970,7 +1970,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(143, "PI15"),
-		STM32MP_PKG_AA,
+		BIT(STM32_PKG_AA),
 		STM32_FUNCTION(0, "GPIOI15"),
 		STM32_FUNCTION(10, "LCD_G2"),
 		STM32_FUNCTION(15, "LCD_R0"),
@@ -1979,7 +1979,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(144, "PJ0"),
-		STM32MP_PKG_AA,
+		BIT(STM32_PKG_AA),
 		STM32_FUNCTION(0, "GPIOJ0"),
 		STM32_FUNCTION(1, "TRACED8"),
 		STM32_FUNCTION(10, "LCD_R7"),
@@ -1989,7 +1989,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(145, "PJ1"),
-		STM32MP_PKG_AA,
+		BIT(STM32_PKG_AA),
 		STM32_FUNCTION(0, "GPIOJ1"),
 		STM32_FUNCTION(1, "TRACED9"),
 		STM32_FUNCTION(15, "LCD_R2"),
@@ -1998,7 +1998,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(146, "PJ2"),
-		STM32MP_PKG_AA,
+		BIT(STM32_PKG_AA),
 		STM32_FUNCTION(0, "GPIOJ2"),
 		STM32_FUNCTION(1, "TRACED10"),
 		STM32_FUNCTION(14, "DSI_TE"),
@@ -2008,7 +2008,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(147, "PJ3"),
-		STM32MP_PKG_AA,
+		BIT(STM32_PKG_AA),
 		STM32_FUNCTION(0, "GPIOJ3"),
 		STM32_FUNCTION(1, "TRACED11"),
 		STM32_FUNCTION(15, "LCD_R4"),
@@ -2017,7 +2017,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(148, "PJ4"),
-		STM32MP_PKG_AA,
+		BIT(STM32_PKG_AA),
 		STM32_FUNCTION(0, "GPIOJ4"),
 		STM32_FUNCTION(1, "TRACED12"),
 		STM32_FUNCTION(15, "LCD_R5"),
@@ -2026,7 +2026,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(149, "PJ5"),
-		STM32MP_PKG_AA,
+		BIT(STM32_PKG_AA),
 		STM32_FUNCTION(0, "GPIOJ5"),
 		STM32_FUNCTION(1, "TRACED2"),
 		STM32_FUNCTION(3, "HDP2"),
@@ -2036,7 +2036,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(150, "PJ6"),
-		STM32MP_PKG_AA,
+		BIT(STM32_PKG_AA),
 		STM32_FUNCTION(0, "GPIOJ6"),
 		STM32_FUNCTION(1, "TRACED3"),
 		STM32_FUNCTION(3, "HDP3"),
@@ -2047,7 +2047,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(151, "PJ7"),
-		STM32MP_PKG_AA,
+		BIT(STM32_PKG_AA),
 		STM32_FUNCTION(0, "GPIOJ7"),
 		STM32_FUNCTION(1, "TRACED13"),
 		STM32_FUNCTION(4, "TIM8_CH2N"),
@@ -2057,7 +2057,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(152, "PJ8"),
-		STM32MP_PKG_AA,
+		BIT(STM32_PKG_AA),
 		STM32_FUNCTION(0, "GPIOJ8"),
 		STM32_FUNCTION(1, "TRACED14"),
 		STM32_FUNCTION(2, "TIM1_CH3N"),
@@ -2069,7 +2069,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(153, "PJ9"),
-		STM32MP_PKG_AA,
+		BIT(STM32_PKG_AA),
 		STM32_FUNCTION(0, "GPIOJ9"),
 		STM32_FUNCTION(1, "TRACED15"),
 		STM32_FUNCTION(2, "TIM1_CH3"),
@@ -2081,7 +2081,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(154, "PJ10"),
-		STM32MP_PKG_AA,
+		BIT(STM32_PKG_AA),
 		STM32_FUNCTION(0, "GPIOJ10"),
 		STM32_FUNCTION(2, "TIM1_CH2N"),
 		STM32_FUNCTION(4, "TIM8_CH2"),
@@ -2092,7 +2092,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(155, "PJ11"),
-		STM32MP_PKG_AA,
+		BIT(STM32_PKG_AA),
 		STM32_FUNCTION(0, "GPIOJ11"),
 		STM32_FUNCTION(2, "TIM1_CH2"),
 		STM32_FUNCTION(4, "TIM8_CH2N"),
@@ -2103,7 +2103,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(156, "PJ12"),
-		STM32MP_PKG_AA,
+		BIT(STM32_PKG_AA),
 		STM32_FUNCTION(0, "GPIOJ12"),
 		STM32_FUNCTION(10, "LCD_G3"),
 		STM32_FUNCTION(15, "LCD_B0"),
@@ -2112,7 +2112,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(157, "PJ13"),
-		STM32MP_PKG_AA,
+		BIT(STM32_PKG_AA),
 		STM32_FUNCTION(0, "GPIOJ13"),
 		STM32_FUNCTION(10, "LCD_G4"),
 		STM32_FUNCTION(15, "LCD_B1"),
@@ -2121,7 +2121,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(158, "PJ14"),
-		STM32MP_PKG_AA,
+		BIT(STM32_PKG_AA),
 		STM32_FUNCTION(0, "GPIOJ14"),
 		STM32_FUNCTION(15, "LCD_B2"),
 		STM32_FUNCTION(16, "EVENTOUT"),
@@ -2129,7 +2129,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(159, "PJ15"),
-		STM32MP_PKG_AA,
+		BIT(STM32_PKG_AA),
 		STM32_FUNCTION(0, "GPIOJ15"),
 		STM32_FUNCTION(15, "LCD_B3"),
 		STM32_FUNCTION(16, "EVENTOUT"),
@@ -2137,7 +2137,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(160, "PK0"),
-		STM32MP_PKG_AA,
+		BIT(STM32_PKG_AA),
 		STM32_FUNCTION(0, "GPIOK0"),
 		STM32_FUNCTION(2, "TIM1_CH1N"),
 		STM32_FUNCTION(4, "TIM8_CH3"),
@@ -2148,7 +2148,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(161, "PK1"),
-		STM32MP_PKG_AA,
+		BIT(STM32_PKG_AA),
 		STM32_FUNCTION(0, "GPIOK1"),
 		STM32_FUNCTION(1, "TRACED4"),
 		STM32_FUNCTION(2, "TIM1_CH1"),
@@ -2161,7 +2161,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(162, "PK2"),
-		STM32MP_PKG_AA,
+		BIT(STM32_PKG_AA),
 		STM32_FUNCTION(0, "GPIOK2"),
 		STM32_FUNCTION(1, "TRACED5"),
 		STM32_FUNCTION(2, "TIM1_BKIN"),
@@ -2173,7 +2173,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(163, "PK3"),
-		STM32MP_PKG_AA,
+		BIT(STM32_PKG_AA),
 		STM32_FUNCTION(0, "GPIOK3"),
 		STM32_FUNCTION(15, "LCD_B4"),
 		STM32_FUNCTION(16, "EVENTOUT"),
@@ -2181,7 +2181,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(164, "PK4"),
-		STM32MP_PKG_AA,
+		BIT(STM32_PKG_AA),
 		STM32_FUNCTION(0, "GPIOK4"),
 		STM32_FUNCTION(15, "LCD_B5"),
 		STM32_FUNCTION(16, "EVENTOUT"),
@@ -2189,7 +2189,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(165, "PK5"),
-		STM32MP_PKG_AA,
+		BIT(STM32_PKG_AA),
 		STM32_FUNCTION(0, "GPIOK5"),
 		STM32_FUNCTION(1, "TRACED6"),
 		STM32_FUNCTION(3, "HDP6"),
@@ -2199,7 +2199,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(166, "PK6"),
-		STM32MP_PKG_AA,
+		BIT(STM32_PKG_AA),
 		STM32_FUNCTION(0, "GPIOK6"),
 		STM32_FUNCTION(1, "TRACED7"),
 		STM32_FUNCTION(3, "HDP7"),
@@ -2209,7 +2209,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(167, "PK7"),
-		STM32MP_PKG_AA,
+		BIT(STM32_PKG_AA),
 		STM32_FUNCTION(0, "GPIOK7"),
 		STM32_FUNCTION(15, "LCD_DE"),
 		STM32_FUNCTION(16, "EVENTOUT"),
@@ -2220,7 +2220,7 @@ static const struct stm32_desc_pin stm32mp157_pins[] = {
 static const struct stm32_desc_pin stm32mp157_z_pins[] = {
 	STM32_PIN_PKG(
 		PINCTRL_PIN(400, "PZ0"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC),
 		STM32_FUNCTION(0, "GPIOZ0"),
 		STM32_FUNCTION(3, "I2C6_SCL"),
 		STM32_FUNCTION(4, "I2C2_SCL"),
@@ -2232,7 +2232,7 @@ static const struct stm32_desc_pin stm32mp157_z_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(401, "PZ1"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC),
 		STM32_FUNCTION(0, "GPIOZ1"),
 		STM32_FUNCTION(3, "I2C6_SDA"),
 		STM32_FUNCTION(4, "I2C2_SDA"),
@@ -2246,7 +2246,7 @@ static const struct stm32_desc_pin stm32mp157_z_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(402, "PZ2"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC),
 		STM32_FUNCTION(0, "GPIOZ2"),
 		STM32_FUNCTION(3, "I2C6_SCL"),
 		STM32_FUNCTION(4, "I2C2_SCL"),
@@ -2260,7 +2260,7 @@ static const struct stm32_desc_pin stm32mp157_z_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(403, "PZ3"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC),
 		STM32_FUNCTION(0, "GPIOZ3"),
 		STM32_FUNCTION(3, "I2C6_SDA"),
 		STM32_FUNCTION(4, "I2C2_SDA"),
@@ -2274,7 +2274,7 @@ static const struct stm32_desc_pin stm32mp157_z_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(404, "PZ4"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC),
 		STM32_FUNCTION(0, "GPIOZ4"),
 		STM32_FUNCTION(3, "I2C6_SCL"),
 		STM32_FUNCTION(4, "I2C2_SCL"),
@@ -2285,7 +2285,7 @@ static const struct stm32_desc_pin stm32mp157_z_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(405, "PZ5"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC),
 		STM32_FUNCTION(0, "GPIOZ5"),
 		STM32_FUNCTION(3, "I2C6_SDA"),
 		STM32_FUNCTION(4, "I2C2_SDA"),
@@ -2297,7 +2297,7 @@ static const struct stm32_desc_pin stm32mp157_z_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(406, "PZ6"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC),
 		STM32_FUNCTION(0, "GPIOZ6"),
 		STM32_FUNCTION(3, "I2C6_SCL"),
 		STM32_FUNCTION(4, "I2C2_SCL"),
@@ -2310,7 +2310,7 @@ static const struct stm32_desc_pin stm32mp157_z_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(407, "PZ7"),
-		STM32MP_PKG_AA | STM32MP_PKG_AC,
+		BIT(STM32_PKG_AA) | BIT(STM32_PKG_AC),
 		STM32_FUNCTION(0, "GPIOZ7"),
 		STM32_FUNCTION(3, "I2C6_SDA"),
 		STM32_FUNCTION(4, "I2C2_SDA"),
diff --git a/drivers/pinctrl/stm32/pinctrl-stm32mp257.c b/drivers/pinctrl/stm32/pinctrl-stm32mp257.c
index 6709bddd97186..346d5a10c6c8a 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32mp257.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32mp257.c
@@ -13,7 +13,7 @@
 static const struct stm32_desc_pin stm32mp257_pins[] = {
 	STM32_PIN_PKG(
 		PINCTRL_PIN(0, "PA0"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOA0"),
 		STM32_FUNCTION(2, "LPTIM1_CH2"),
 		STM32_FUNCTION(3, "SPI5_RDY"),
@@ -31,7 +31,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(1, "PA1"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOA1"),
 		STM32_FUNCTION(3, "SPI6_MISO"),
 		STM32_FUNCTION(5, "SAI3_SD_A"),
@@ -48,7 +48,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(2, "PA2"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOA2"),
 		STM32_FUNCTION(2, "LPTIM2_IN1"),
 		STM32_FUNCTION(3, "SPI7_MISO"),
@@ -64,7 +64,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(3, "PA3"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOA3"),
 		STM32_FUNCTION(2, "LPTIM2_ETR"),
 		STM32_FUNCTION(3, "SPI7_MOSI"),
@@ -81,7 +81,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(4, "PA4"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOA4"),
 		STM32_FUNCTION(7, "USART2_TX"),
 		STM32_FUNCTION(8, "FDCAN2_TX"),
@@ -94,7 +94,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(5, "PA5"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOA5"),
 		STM32_FUNCTION(4, "SPI4_MOSI"),
 		STM32_FUNCTION(5, "SAI2_MCLK_B"),
@@ -111,7 +111,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(6, "PA6"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOA6"),
 		STM32_FUNCTION(4, "SPI4_SCK"),
 		STM32_FUNCTION(5, "SAI2_FS_B"),
@@ -128,7 +128,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(7, "PA7"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOA7"),
 		STM32_FUNCTION(3, "AUDIOCLK"),
 		STM32_FUNCTION(4, "SPI6_RDY"),
@@ -148,7 +148,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(8, "PA8"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOA8"),
 		STM32_FUNCTION(2, "LPTIM2_CH2"),
 		STM32_FUNCTION(3, "SPI7_NSS"),
@@ -163,7 +163,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(9, "PA9"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOA9"),
 		STM32_FUNCTION(4, "SPI4_NSS"),
 		STM32_FUNCTION(5, "SAI2_SCK_B"),
@@ -179,7 +179,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(10, "PA10"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOA10"),
 		STM32_FUNCTION(4, "SPI4_MISO"),
 		STM32_FUNCTION(5, "SAI2_SD_B"),
@@ -195,7 +195,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(11, "PA11"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOA11"),
 		STM32_FUNCTION(2, "SPI8_SCK"),
 		STM32_FUNCTION(3, "LPTIM2_CH1"),
@@ -207,7 +207,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(12, "PA12"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOA12"),
 		STM32_FUNCTION(3, "SPI6_MOSI"),
 		STM32_FUNCTION(5, "SAI3_FS_A"),
@@ -220,7 +220,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(13, "PA13"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOA13"),
 		STM32_FUNCTION(2, "SPI8_RDY"),
 		STM32_FUNCTION(3, "I2S3_MCK"),
@@ -234,7 +234,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(14, "PA14"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOA14"),
 		STM32_FUNCTION(2, "SPI8_NSS"),
 		STM32_FUNCTION(3, "LPTIM2_CH2"),
@@ -246,7 +246,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(15, "PA15"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOA15"),
 		STM32_FUNCTION(3, "SPI3_MISO I2S3_SDI"),
 		STM32_FUNCTION(7, "USART2_RX"),
@@ -257,7 +257,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(16, "PB0"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOB0"),
 		STM32_FUNCTION(3, "SPI2_SCK I2S2_CK"),
 		STM32_FUNCTION(7, "USART1_CK"),
@@ -269,7 +269,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(17, "PB1"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOB1"),
 		STM32_FUNCTION(2, "SPI3_NSS I2S3_WS"),
 		STM32_FUNCTION(8, "TIM16_CH1N"),
@@ -281,7 +281,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(18, "PB2"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOB2"),
 		STM32_FUNCTION(3, "SPI2_MOSI I2S2_SDO"),
 		STM32_FUNCTION(6, "MDF1_CKI3"),
@@ -294,7 +294,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(19, "PB3"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOB3"),
 		STM32_FUNCTION(3, "SPI2_NSS I2S2_WS"),
 		STM32_FUNCTION(6, "MDF1_SDI3"),
@@ -306,7 +306,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(20, "PB4"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOB4"),
 		STM32_FUNCTION(3, "SPI2_RDY"),
 		STM32_FUNCTION(4, "UART4_CTS"),
@@ -322,7 +322,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(21, "PB5"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOB5"),
 		STM32_FUNCTION(3, "I2S2_MCK"),
 		STM32_FUNCTION(4, "UART4_RTS"),
@@ -339,7 +339,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(22, "PB6"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOB6"),
 		STM32_FUNCTION(3, "SPI2_MISO I2S2_SDI"),
 		STM32_FUNCTION(4, "UART4_RX"),
@@ -353,7 +353,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(23, "PB7"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOB7"),
 		STM32_FUNCTION(2, "SPI3_SCK I2S3_CK"),
 		STM32_FUNCTION(4, "UART4_TX"),
@@ -368,7 +368,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(24, "PB8"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOB8"),
 		STM32_FUNCTION(2, "SPI3_MOSI I2S3_SDO"),
 		STM32_FUNCTION(5, "PCIE_CLKREQN"),
@@ -382,7 +382,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(25, "PB9"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOB9"),
 		STM32_FUNCTION(2, "SPI3_RDY"),
 		STM32_FUNCTION(7, "USART1_RTS"),
@@ -397,7 +397,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(26, "PB10"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOB10"),
 		STM32_FUNCTION(2, "SPI3_MISO I2S3_SDI"),
 		STM32_FUNCTION(7, "USART1_RX"),
@@ -409,7 +409,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(27, "PB11"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOB11"),
 		STM32_FUNCTION(2, "I2S3_MCK"),
 		STM32_FUNCTION(7, "USART1_CTS"),
@@ -425,7 +425,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(28, "PB12"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOB12"),
 		STM32_FUNCTION(6, "UART8_CTS"),
 		STM32_FUNCTION(8, "TIM13_CH1"),
@@ -438,7 +438,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(29, "PB13"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOB13"),
 		STM32_FUNCTION(3, "SPI7_SCK"),
 		STM32_FUNCTION(5, "SAI1_SD_B"),
@@ -451,7 +451,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(30, "PB14"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOB14"),
 		STM32_FUNCTION(3, "SPI2_SCK I2S2_CK"),
 		STM32_FUNCTION(6, "MDF1_CKI7"),
@@ -465,7 +465,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(31, "PB15"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOB15"),
 		STM32_FUNCTION(2, "LPTIM1_IN2"),
 		STM32_FUNCTION(3, "SPI5_SCK"),
@@ -483,7 +483,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(32, "PC0"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOC0"),
 		STM32_FUNCTION(2, "LPTIM1_CH1"),
 		STM32_FUNCTION(4, "SPI6_SCK"),
@@ -499,7 +499,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(33, "PC1"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOC1"),
 		STM32_FUNCTION(3, "SPI3_MOSI I2S3_SDO"),
 		STM32_FUNCTION(7, "USART2_TX"),
@@ -510,7 +510,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(34, "PC2"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOC2"),
 		STM32_FUNCTION(2, "SPI8_MOSI"),
 		STM32_FUNCTION(3, "LPTIM2_IN1"),
@@ -523,7 +523,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(35, "PC3"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOC3"),
 		STM32_FUNCTION(2, "LPTIM1_IN2"),
 		STM32_FUNCTION(3, "SPI3_NSS I2S3_WS"),
@@ -539,7 +539,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(36, "PC4"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOC4"),
 		STM32_FUNCTION(4, "SPI6_MISO"),
 		STM32_FUNCTION(5, "SAI3_FS_B"),
@@ -551,7 +551,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(37, "PC5"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOC5"),
 		STM32_FUNCTION(3, "SPDIFRX1_IN1"),
 		STM32_FUNCTION(6, "MDF1_SDI1"),
@@ -567,7 +567,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(38, "PC6"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOC6"),
 		STM32_FUNCTION(2, "RTC_REFIN"),
 		STM32_FUNCTION(3, "SPDIFRX1_IN0"),
@@ -584,7 +584,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(39, "PC7"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOC7"),
 		STM32_FUNCTION(4, "SPI6_MOSI"),
 		STM32_FUNCTION(5, "SAI3_SD_B"),
@@ -598,7 +598,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(40, "PC8"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOC8"),
 		STM32_FUNCTION(2, "LPTIM1_ETR"),
 		STM32_FUNCTION(4, "SPI6_NSS"),
@@ -614,7 +614,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(41, "PC9"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOC9"),
 		STM32_FUNCTION(2, "MCO1"),
 		STM32_FUNCTION(3, "SPI3_MISO I2S3_SDI"),
@@ -632,7 +632,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(42, "PC10"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOC10"),
 		STM32_FUNCTION(3, "SPI3_MOSI I2S3_SDO"),
 		STM32_FUNCTION(8, "LPTIM4_ETR"),
@@ -648,7 +648,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(43, "PC11"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOC11"),
 		STM32_FUNCTION(2, "LPTIM1_CH1"),
 		STM32_FUNCTION(3, "SPI5_NSS"),
@@ -666,7 +666,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(44, "PC12"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOC12"),
 		STM32_FUNCTION(2, "LPTIM1_CH2"),
 		STM32_FUNCTION(4, "I3C3_SCL"),
@@ -682,14 +682,14 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(45, "PC13"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOC13"),
 		STM32_FUNCTION(16, "EVENTOUT"),
 		STM32_FUNCTION(17, "ANALOG")
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(48, "PD0"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOD0"),
 		STM32_FUNCTION(1, "TRACECLK"),
 		STM32_FUNCTION(2, "HDP0"),
@@ -706,7 +706,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(49, "PD1"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOD1"),
 		STM32_FUNCTION(2, "HDP1"),
 		STM32_FUNCTION(3, "SPI1_MISO I2S1_SDI"),
@@ -725,7 +725,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(50, "PD2"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOD2"),
 		STM32_FUNCTION(2, "HDP2"),
 		STM32_FUNCTION(3, "SPI1_NSS I2S1_WS"),
@@ -743,7 +743,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(51, "PD3"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOD3"),
 		STM32_FUNCTION(2, "SAI1_MCLK_A"),
 		STM32_FUNCTION(3, "SPI2_SCK I2S2_CK"),
@@ -760,7 +760,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(52, "PD4"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOD4"),
 		STM32_FUNCTION(1, "TRACED0"),
 		STM32_FUNCTION(2, "SPI4_MISO"),
@@ -776,7 +776,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(53, "PD5"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOD5"),
 		STM32_FUNCTION(1, "TRACED1"),
 		STM32_FUNCTION(2, "SPI4_NSS"),
@@ -792,7 +792,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(54, "PD6"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOD6"),
 		STM32_FUNCTION(1, "TRACED2"),
 		STM32_FUNCTION(2, "SPI4_MOSI"),
@@ -808,7 +808,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(55, "PD7"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOD7"),
 		STM32_FUNCTION(1, "TRACED3"),
 		STM32_FUNCTION(2, "SPI4_SCK"),
@@ -824,7 +824,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(56, "PD8"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOD8"),
 		STM32_FUNCTION(1, "TRACED4"),
 		STM32_FUNCTION(2, "SPI4_RDY"),
@@ -843,7 +843,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(57, "PD9"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOD9"),
 		STM32_FUNCTION(1, "TRACED5"),
 		STM32_FUNCTION(2, "HDP6"),
@@ -861,7 +861,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(58, "PD10"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOD10"),
 		STM32_FUNCTION(1, "TRACED6"),
 		STM32_FUNCTION(2, "HDP7"),
@@ -880,7 +880,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(59, "PD11"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOD11"),
 		STM32_FUNCTION(1, "TRACED7"),
 		STM32_FUNCTION(3, "SPI1_SCK I2S1_CK"),
@@ -899,7 +899,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(60, "PD12"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOD12"),
 		STM32_FUNCTION(2, "SPI7_MISO"),
 		STM32_FUNCTION(3, "SPI2_MISO I2S2_SDI"),
@@ -914,7 +914,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(61, "PD13"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOD13"),
 		STM32_FUNCTION(3, "SPI2_NSS I2S2_WS"),
 		STM32_FUNCTION(6, "MDF1_SDI7"),
@@ -928,7 +928,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(62, "PD14"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOD14"),
 		STM32_FUNCTION(3, "I2S1_MCK"),
 		STM32_FUNCTION(8, "FDCAN1_RX"),
@@ -942,7 +942,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(63, "PD15"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOD15"),
 		STM32_FUNCTION(2, "SPI1_RDY"),
 		STM32_FUNCTION(6, "DSI_TE"),
@@ -959,7 +959,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(64, "PE0"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOE0"),
 		STM32_FUNCTION(1, "TRACED2"),
 		STM32_FUNCTION(2, "LPTIM2_CH1"),
@@ -972,7 +972,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(65, "PE1"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOE1"),
 		STM32_FUNCTION(1, "TRACED3"),
 		STM32_FUNCTION(2, "LPTIM2_CH2"),
@@ -985,7 +985,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(66, "PE2"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOE2"),
 		STM32_FUNCTION(2, "LPTIM2_ETR"),
 		STM32_FUNCTION(3, "SPI1_MISO I2S1_SDI"),
@@ -998,7 +998,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(67, "PE3"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOE3"),
 		STM32_FUNCTION(1, "TRACECLK"),
 		STM32_FUNCTION(3, "SPI1_RDY"),
@@ -1012,7 +1012,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(68, "PE4"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOE4"),
 		STM32_FUNCTION(1, "TRACED0"),
 		STM32_FUNCTION(2, "LPTIM2_IN1"),
@@ -1027,7 +1027,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(69, "PE5"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOE5"),
 		STM32_FUNCTION(1, "TRACED1"),
 		STM32_FUNCTION(2, "LPTIM2_IN2"),
@@ -1042,7 +1042,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(70, "PE6"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOE6"),
 		STM32_FUNCTION(2, "SPI4_RDY"),
 		STM32_FUNCTION(5, "SPDIFRX1_IN2"),
@@ -1056,7 +1056,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(71, "PE7"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOE7"),
 		STM32_FUNCTION(4, "SAI4_D4"),
 		STM32_FUNCTION(5, "SPDIFRX1_IN3"),
@@ -1071,7 +1071,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(72, "PE8"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOE8"),
 		STM32_FUNCTION(2, "SPI4_MOSI"),
 		STM32_FUNCTION(4, "SAI4_CK1"),
@@ -1085,7 +1085,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(73, "PE9"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOE9"),
 		STM32_FUNCTION(2, "SPI4_MISO"),
 		STM32_FUNCTION(4, "SAI4_D2"),
@@ -1100,7 +1100,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(74, "PE10"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOE10"),
 		STM32_FUNCTION(2, "SPI4_SCK"),
 		STM32_FUNCTION(4, "SAI4_D1"),
@@ -1116,7 +1116,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(75, "PE11"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOE11"),
 		STM32_FUNCTION(3, "SPI7_SCK"),
 		STM32_FUNCTION(4, "SAI4_D3"),
@@ -1130,7 +1130,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(76, "PE12"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOE12"),
 		STM32_FUNCTION(2, "SPI4_NSS"),
 		STM32_FUNCTION(4, "SAI4_CK2"),
@@ -1146,7 +1146,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(77, "PE13"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOE13"),
 		STM32_FUNCTION(3, "SPI7_MISO"),
 		STM32_FUNCTION(5, "SAI1_SD_A"),
@@ -1159,7 +1159,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(78, "PE14"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOE14"),
 		STM32_FUNCTION(3, "SPI7_NSS"),
 		STM32_FUNCTION(5, "SAI1_MCLK_A"),
@@ -1173,7 +1173,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(79, "PE15"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOE15"),
 		STM32_FUNCTION(3, "SPI7_MOSI"),
 		STM32_FUNCTION(5, "SAI1_SCK_A"),
@@ -1187,7 +1187,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(80, "PF0"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOF0"),
 		STM32_FUNCTION(3, "SPI3_SCK I2S3_CK"),
 		STM32_FUNCTION(8, "FDCAN2_RX"),
@@ -1201,7 +1201,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(81, "PF1"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOF1"),
 		STM32_FUNCTION(2, "SPI8_MISO"),
 		STM32_FUNCTION(3, "LPTIM2_IN2"),
@@ -1214,7 +1214,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(82, "PF2"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOF2"),
 		STM32_FUNCTION(3, "SPI3_RDY"),
 		STM32_FUNCTION(7, "I2C4_SMBA"),
@@ -1229,7 +1229,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(83, "PF3"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOF3"),
 		STM32_FUNCTION(4, "UART8_RX"),
 		STM32_FUNCTION(5, "SAI2_SCK_B"),
@@ -1246,7 +1246,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(84, "PF4"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOF4"),
 		STM32_FUNCTION(2, "RTC_OUT2"),
 		STM32_FUNCTION(3, "SPI6_NSS"),
@@ -1263,7 +1263,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(85, "PF5"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOF5"),
 		STM32_FUNCTION(3, "SPI6_SCK"),
 		STM32_FUNCTION(5, "SAI3_MCLK_A"),
@@ -1279,7 +1279,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(86, "PF6"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOF6"),
 		STM32_FUNCTION(2, "RTC_OUT2"),
 		STM32_FUNCTION(4, "SAI3_MCLK_B"),
@@ -1293,7 +1293,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(87, "PF7"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOF7"),
 		STM32_FUNCTION(3, "SPDIFRX1_IN1"),
 		STM32_FUNCTION(4, "SPI6_SCK"),
@@ -1307,7 +1307,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(88, "PF8"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOF8"),
 		STM32_FUNCTION(2, "RTC_REFIN"),
 		STM32_FUNCTION(4, "SAI3_SCK_B"),
@@ -1323,7 +1323,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(89, "PF9"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOF9"),
 		STM32_FUNCTION(4, "SAI3_SD_B"),
 		STM32_FUNCTION(5, "SAI2_SD_A"),
@@ -1337,7 +1337,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(90, "PF10"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOF10"),
 		STM32_FUNCTION(2, "MCO2"),
 		STM32_FUNCTION(3, "SPI3_RDY"),
@@ -1351,7 +1351,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(91, "PF11"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOF11"),
 		STM32_FUNCTION(2, "MCO1"),
 		STM32_FUNCTION(3, "SPDIFRX1_IN0"),
@@ -1366,7 +1366,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(92, "PF12"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOF12"),
 		STM32_FUNCTION(1, "TRACECLK"),
 		STM32_FUNCTION(3, "SPI5_MISO"),
@@ -1380,7 +1380,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(93, "PF13"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOF13"),
 		STM32_FUNCTION(1, "TRACED0"),
 		STM32_FUNCTION(2, "HDP0"),
@@ -1397,7 +1397,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(94, "PF14"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOF14"),
 		STM32_FUNCTION(1, "TRACED1"),
 		STM32_FUNCTION(2, "HDP1"),
@@ -1412,7 +1412,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(95, "PF15"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOF15"),
 		STM32_FUNCTION(1, "TRACED2"),
 		STM32_FUNCTION(2, "HDP2"),
@@ -1429,7 +1429,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(96, "PG0"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOG0"),
 		STM32_FUNCTION(2, "LPTIM1_IN1"),
 		STM32_FUNCTION(4, "I3C3_SDA"),
@@ -1445,7 +1445,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(97, "PG1"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOG1"),
 		STM32_FUNCTION(2, "LPTIM1_IN1"),
 		STM32_FUNCTION(3, "I2S3_MCK"),
@@ -1465,7 +1465,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(98, "PG2"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOG2"),
 		STM32_FUNCTION(2, "RTC_REFIN"),
 		STM32_FUNCTION(3, "I2S3_MCK"),
@@ -1483,7 +1483,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(99, "PG3"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOG3"),
 		STM32_FUNCTION(2, "LPTIM1_ETR"),
 		STM32_FUNCTION(3, "SPI5_MOSI"),
@@ -1501,7 +1501,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(100, "PG4"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOG4"),
 		STM32_FUNCTION(3, "SPI5_MISO"),
 		STM32_FUNCTION(4, "SAI3_FS_B"),
@@ -1517,7 +1517,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(101, "PG5"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOG5"),
 		STM32_FUNCTION(1, "TRACED3"),
 		STM32_FUNCTION(2, "HDP3"),
@@ -1531,7 +1531,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(102, "PG6"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOG6"),
 		STM32_FUNCTION(1, "TRACED4"),
 		STM32_FUNCTION(2, "HDP4"),
@@ -1546,7 +1546,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(103, "PG7"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOG7"),
 		STM32_FUNCTION(1, "TRACED5"),
 		STM32_FUNCTION(2, "HDP5"),
@@ -1561,7 +1561,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(104, "PG8"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOG8"),
 		STM32_FUNCTION(1, "TRACED6"),
 		STM32_FUNCTION(2, "HDP6"),
@@ -1578,7 +1578,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(105, "PG9"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOG9"),
 		STM32_FUNCTION(1, "TRACED7"),
 		STM32_FUNCTION(6, "UART5_TX"),
@@ -1590,7 +1590,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(106, "PG10"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOG10"),
 		STM32_FUNCTION(1, "TRACED8"),
 		STM32_FUNCTION(2, "HDP0"),
@@ -1603,7 +1603,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(107, "PG11"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOG11"),
 		STM32_FUNCTION(1, "TRACED9"),
 		STM32_FUNCTION(2, "HDP1"),
@@ -1617,7 +1617,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(108, "PG12"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOG12"),
 		STM32_FUNCTION(1, "TRACED10"),
 		STM32_FUNCTION(2, "HDP2"),
@@ -1631,7 +1631,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(109, "PG13"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOG13"),
 		STM32_FUNCTION(1, "TRACED11"),
 		STM32_FUNCTION(2, "HDP3"),
@@ -1647,7 +1647,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(110, "PG14"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOG14"),
 		STM32_FUNCTION(1, "TRACED12"),
 		STM32_FUNCTION(2, "HDP4"),
@@ -1662,7 +1662,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(111, "PG15"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOG15"),
 		STM32_FUNCTION(1, "TRACED13"),
 		STM32_FUNCTION(2, "HDP5"),
@@ -1677,7 +1677,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(114, "PH2"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOH2"),
 		STM32_FUNCTION(2, "LPTIM2_CH1"),
 		STM32_FUNCTION(3, "SPI7_RDY"),
@@ -1693,7 +1693,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(115, "PH3"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOH3"),
 		STM32_FUNCTION(3, "SPI1_NSS I2S1_WS"),
 		STM32_FUNCTION(7, "UART7_RX"),
@@ -1706,7 +1706,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(116, "PH4"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOH4"),
 		STM32_FUNCTION(7, "UART7_TX"),
 		STM32_FUNCTION(8, "TIM17_BKIN"),
@@ -1721,7 +1721,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(117, "PH5"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOH5"),
 		STM32_FUNCTION(5, "SAI2_FS_A"),
 		STM32_FUNCTION(7, "UART8_CTS"),
@@ -1736,7 +1736,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(118, "PH6"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOH6"),
 		STM32_FUNCTION(2, "LPTIM2_IN2"),
 		STM32_FUNCTION(5, "SAI1_MCLK_B"),
@@ -1751,7 +1751,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(119, "PH7"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOH7"),
 		STM32_FUNCTION(3, "SPI1_MOSI I2S1_SDO"),
 		STM32_FUNCTION(5, "UART4_TX"),
@@ -1765,7 +1765,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(120, "PH8"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOH8"),
 		STM32_FUNCTION(3, "SPI1_MISO I2S1_SDI"),
 		STM32_FUNCTION(4, "SPDIFRX1_IN3"),
@@ -1780,7 +1780,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(121, "PH9"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOH9"),
 		STM32_FUNCTION(4, "SPI6_NSS"),
 		STM32_FUNCTION(5, "SAI3_MCLK_A"),
@@ -1793,7 +1793,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(122, "PH10"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOH10"),
 		STM32_FUNCTION(3, "SPI1_SCK I2S1_CK"),
 		STM32_FUNCTION(4, "SPI6_MOSI"),
@@ -1806,7 +1806,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(123, "PH11"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOH11"),
 		STM32_FUNCTION(4, "SPI6_MISO"),
 		STM32_FUNCTION(5, "SAI3_FS_A"),
@@ -1818,7 +1818,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(124, "PH12"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOH12"),
 		STM32_FUNCTION(3, "SPI3_NSS I2S3_WS"),
 		STM32_FUNCTION(4, "SPI6_MISO"),
@@ -1829,7 +1829,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(125, "PH13"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOH13"),
 		STM32_FUNCTION(3, "SPI3_SCK I2S3_CK"),
 		STM32_FUNCTION(4, "SPI6_MOSI"),
@@ -1841,7 +1841,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(128, "PI0"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOI0"),
 		STM32_FUNCTION(1, "TRACED14"),
 		STM32_FUNCTION(2, "HDP6"),
@@ -1856,7 +1856,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(129, "PI1"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOI1"),
 		STM32_FUNCTION(1, "TRACED15"),
 		STM32_FUNCTION(2, "HDP7"),
@@ -1872,7 +1872,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(130, "PI2"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOI2"),
 		STM32_FUNCTION(4, "LPTIM1_ETR"),
 		STM32_FUNCTION(5, "SAI4_SCK_B"),
@@ -1885,7 +1885,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(131, "PI3"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOI3"),
 		STM32_FUNCTION(4, "LPTIM1_IN2"),
 		STM32_FUNCTION(5, "SAI4_SD_B"),
@@ -1898,7 +1898,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(132, "PI4"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOI4"),
 		STM32_FUNCTION(4, "LPTIM1_CH1"),
 		STM32_FUNCTION(5, "SAI4_FS_B"),
@@ -1910,7 +1910,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(133, "PI5"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOI5"),
 		STM32_FUNCTION(3, "SPI5_MOSI"),
 		STM32_FUNCTION(4, "SPI1_MOSI I2S1_SDO"),
@@ -1924,7 +1924,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(134, "PI6"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOI6"),
 		STM32_FUNCTION(2, "MCO1"),
 		STM32_FUNCTION(7, "USART3_TX"),
@@ -1936,7 +1936,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(135, "PI7"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOI7"),
 		STM32_FUNCTION(7, "USART3_RX"),
 		STM32_FUNCTION(8, "TIM2_CH1"),
@@ -1947,14 +1947,14 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(136, "PI8"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOI8"),
 		STM32_FUNCTION(16, "EVENTOUT"),
 		STM32_FUNCTION(17, "ANALOG")
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(137, "PI9"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOI9"),
 		STM32_FUNCTION(2, "SPI7_MOSI"),
 		STM32_FUNCTION(3, "SPI2_MOSI I2S2_SDO"),
@@ -1970,7 +1970,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(138, "PI10"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOI10"),
 		STM32_FUNCTION(2, "SAI1_SCK_A"),
 		STM32_FUNCTION(3, "SPI1_SCK I2S1_CK"),
@@ -1986,7 +1986,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(139, "PI11"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOI11"),
 		STM32_FUNCTION(3, "I2S2_MCK"),
 		STM32_FUNCTION(6, "UART8_TX"),
@@ -1999,7 +1999,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(140, "PI12"),
-		STM32MP_PKG_AI,
+		BIT(STM32_PKG_AI),
 		STM32_FUNCTION(0, "GPIOI12"),
 		STM32_FUNCTION(3, "SPI4_NSS"),
 		STM32_FUNCTION(8, "FDCAN3_RX"),
@@ -2011,7 +2011,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(141, "PI13"),
-		STM32MP_PKG_AI,
+		BIT(STM32_PKG_AI),
 		STM32_FUNCTION(0, "GPIOI13"),
 		STM32_FUNCTION(3, "SPI4_MOSI"),
 		STM32_FUNCTION(5, "FDCAN2_RX"),
@@ -2023,7 +2023,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(142, "PI14"),
-		STM32MP_PKG_AI,
+		BIT(STM32_PKG_AI),
 		STM32_FUNCTION(0, "GPIOI14"),
 		STM32_FUNCTION(3, "SPI2_NSS I2S2_WS"),
 		STM32_FUNCTION(6, "MDF1_SDI1"),
@@ -2037,7 +2037,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(143, "PI15"),
-		STM32MP_PKG_AI,
+		BIT(STM32_PKG_AI),
 		STM32_FUNCTION(0, "GPIOI15"),
 		STM32_FUNCTION(3, "I2S2_MCK"),
 		STM32_FUNCTION(4, "UART4_RX"),
@@ -2052,7 +2052,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(144, "PJ0"),
-		STM32MP_PKG_AI,
+		BIT(STM32_PKG_AI),
 		STM32_FUNCTION(0, "GPIOJ0"),
 		STM32_FUNCTION(3, "SPI5_MOSI"),
 		STM32_FUNCTION(5, "PCIE_CLKREQN"),
@@ -2067,7 +2067,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(145, "PJ1"),
-		STM32MP_PKG_AI,
+		BIT(STM32_PKG_AI),
 		STM32_FUNCTION(0, "GPIOJ1"),
 		STM32_FUNCTION(7, "USART6_RX"),
 		STM32_FUNCTION(9, "TIM8_CH1N"),
@@ -2080,7 +2080,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(146, "PJ2"),
-		STM32MP_PKG_AI,
+		BIT(STM32_PKG_AI),
 		STM32_FUNCTION(0, "GPIOJ2"),
 		STM32_FUNCTION(5, "SAI2_SD_B"),
 		STM32_FUNCTION(7, "UART9_RTS"),
@@ -2092,7 +2092,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(147, "PJ3"),
-		STM32MP_PKG_AI,
+		BIT(STM32_PKG_AI),
 		STM32_FUNCTION(0, "GPIOJ3"),
 		STM32_FUNCTION(3, "SPI5_NSS"),
 		STM32_FUNCTION(4, "SAI2_FS_A"),
@@ -2105,7 +2105,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(148, "PJ4"),
-		STM32MP_PKG_AI,
+		BIT(STM32_PKG_AI),
 		STM32_FUNCTION(0, "GPIOJ4"),
 		STM32_FUNCTION(4, "SAI2_FS_B"),
 		STM32_FUNCTION(6, "MDF1_CCK1"),
@@ -2118,7 +2118,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(149, "PJ5"),
-		STM32MP_PKG_AI,
+		BIT(STM32_PKG_AI),
 		STM32_FUNCTION(0, "GPIOJ5"),
 		STM32_FUNCTION(3, "SPI5_MISO"),
 		STM32_FUNCTION(4, "SAI2_SCK_B"),
@@ -2131,7 +2131,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(150, "PJ6"),
-		STM32MP_PKG_AI,
+		BIT(STM32_PKG_AI),
 		STM32_FUNCTION(0, "GPIOJ6"),
 		STM32_FUNCTION(3, "SPI7_MOSI"),
 		STM32_FUNCTION(5, "SAI4_SD_A"),
@@ -2145,7 +2145,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(151, "PJ7"),
-		STM32MP_PKG_AI,
+		BIT(STM32_PKG_AI),
 		STM32_FUNCTION(0, "GPIOJ7"),
 		STM32_FUNCTION(3, "SPI5_MISO"),
 		STM32_FUNCTION(5, "SAI2_MCLK_B"),
@@ -2160,7 +2160,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(152, "PJ8"),
-		STM32MP_PKG_AI,
+		BIT(STM32_PKG_AI),
 		STM32_FUNCTION(0, "GPIOJ8"),
 		STM32_FUNCTION(3, "SPI5_SCK"),
 		STM32_FUNCTION(6, "SAI4_CK2"),
@@ -2173,7 +2173,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(153, "PJ9"),
-		STM32MP_PKG_AI,
+		BIT(STM32_PKG_AI),
 		STM32_FUNCTION(0, "GPIOJ9"),
 		STM32_FUNCTION(3, "SPI4_RDY"),
 		STM32_FUNCTION(8, "TIM12_CH1"),
@@ -2185,7 +2185,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(154, "PJ10"),
-		STM32MP_PKG_AI,
+		BIT(STM32_PKG_AI),
 		STM32_FUNCTION(0, "GPIOJ10"),
 		STM32_FUNCTION(8, "TIM12_CH2"),
 		STM32_FUNCTION(9, "TIM8_ETR"),
@@ -2198,7 +2198,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(155, "PJ11"),
-		STM32MP_PKG_AI,
+		BIT(STM32_PKG_AI),
 		STM32_FUNCTION(0, "GPIOJ11"),
 		STM32_FUNCTION(3, "SPI5_RDY"),
 		STM32_FUNCTION(4, "SAI2_SCK_A"),
@@ -2212,7 +2212,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(156, "PJ12"),
-		STM32MP_PKG_AI,
+		BIT(STM32_PKG_AI),
 		STM32_FUNCTION(0, "GPIOJ12"),
 		STM32_FUNCTION(4, "SAI2_SD_A"),
 		STM32_FUNCTION(7, "UART9_RX"),
@@ -2227,7 +2227,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(157, "PJ13"),
-		STM32MP_PKG_AI,
+		BIT(STM32_PKG_AI),
 		STM32_FUNCTION(0, "GPIOJ13"),
 		STM32_FUNCTION(4, "SAI2_MCLK_A"),
 		STM32_FUNCTION(7, "UART9_TX"),
@@ -2241,7 +2241,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(158, "PJ14"),
-		STM32MP_PKG_AI,
+		BIT(STM32_PKG_AI),
 		STM32_FUNCTION(0, "GPIOJ14"),
 		STM32_FUNCTION(3, "SPI4_SCK"),
 		STM32_FUNCTION(8, "FDCAN3_TX"),
@@ -2252,7 +2252,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(159, "PJ15"),
-		STM32MP_PKG_AI,
+		BIT(STM32_PKG_AI),
 		STM32_FUNCTION(0, "GPIOJ15"),
 		STM32_FUNCTION(1, "TRACED7"),
 		STM32_FUNCTION(2, "HDP7"),
@@ -2266,7 +2266,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(160, "PK0"),
-		STM32MP_PKG_AI,
+		BIT(STM32_PKG_AI),
 		STM32_FUNCTION(0, "GPIOK0"),
 		STM32_FUNCTION(3, "SPI2_MISO I2S2_SDI"),
 		STM32_FUNCTION(4, "SPDIFRX1_IN2"),
@@ -2281,7 +2281,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(161, "PK1"),
-		STM32MP_PKG_AI,
+		BIT(STM32_PKG_AI),
 		STM32_FUNCTION(0, "GPIOK1"),
 		STM32_FUNCTION(3, "SPI2_MOSI I2S2_SDO"),
 		STM32_FUNCTION(6, "MDF1_SDI2"),
@@ -2296,7 +2296,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(162, "PK2"),
-		STM32MP_PKG_AI,
+		BIT(STM32_PKG_AI),
 		STM32_FUNCTION(0, "GPIOK2"),
 		STM32_FUNCTION(3, "SPI7_NSS"),
 		STM32_FUNCTION(5, "SAI4_SCK_A"),
@@ -2311,7 +2311,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(163, "PK3"),
-		STM32MP_PKG_AI,
+		BIT(STM32_PKG_AI),
 		STM32_FUNCTION(0, "GPIOK3"),
 		STM32_FUNCTION(3, "SPI7_RDY"),
 		STM32_FUNCTION(6, "MDF1_CKI1"),
@@ -2325,7 +2325,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(164, "PK4"),
-		STM32MP_PKG_AI,
+		BIT(STM32_PKG_AI),
 		STM32_FUNCTION(0, "GPIOK4"),
 		STM32_FUNCTION(3, "SPI7_MISO"),
 		STM32_FUNCTION(4, "UART4_TX"),
@@ -2340,7 +2340,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(165, "PK5"),
-		STM32MP_PKG_AI,
+		BIT(STM32_PKG_AI),
 		STM32_FUNCTION(0, "GPIOK5"),
 		STM32_FUNCTION(3, "SPI2_RDY"),
 		STM32_FUNCTION(6, "MDF1_CKI0"),
@@ -2355,7 +2355,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(166, "PK6"),
-		STM32MP_PKG_AI,
+		BIT(STM32_PKG_AI),
 		STM32_FUNCTION(0, "GPIOK6"),
 		STM32_FUNCTION(3, "SPI7_SCK"),
 		STM32_FUNCTION(5, "SAI4_MCLK_A"),
@@ -2371,7 +2371,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(167, "PK7"),
-		STM32MP_PKG_AI,
+		BIT(STM32_PKG_AI),
 		STM32_FUNCTION(0, "GPIOK7"),
 		STM32_FUNCTION(6, "MDF1_SDI0"),
 		STM32_FUNCTION(7, "USART1_RX"),
@@ -2389,7 +2389,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 static const struct stm32_desc_pin stm32mp257_z_pins[] = {
 	STM32_PIN_PKG(
 		PINCTRL_PIN(400, "PZ0"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOZ0"),
 		STM32_FUNCTION(3, "LPTIM3_IN1"),
 		STM32_FUNCTION(4, "SPI8_MOSI"),
@@ -2404,7 +2404,7 @@ static const struct stm32_desc_pin stm32mp257_z_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(401, "PZ1"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOZ1"),
 		STM32_FUNCTION(3, "LPTIM3_CH1"),
 		STM32_FUNCTION(4, "SPI8_MISO"),
@@ -2419,7 +2419,7 @@ static const struct stm32_desc_pin stm32mp257_z_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(402, "PZ2"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOZ2"),
 		STM32_FUNCTION(3, "LPTIM3_CH1"),
 		STM32_FUNCTION(4, "SPI8_SCK"),
@@ -2433,7 +2433,7 @@ static const struct stm32_desc_pin stm32mp257_z_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(403, "PZ3"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOZ3"),
 		STM32_FUNCTION(1, "DBTRGI"),
 		STM32_FUNCTION(2, "DBTRGO"),
@@ -2451,7 +2451,7 @@ static const struct stm32_desc_pin stm32mp257_z_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(404, "PZ4"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOZ4"),
 		STM32_FUNCTION(1, "DBTRGI"),
 		STM32_FUNCTION(2, "DBTRGO"),
@@ -2468,7 +2468,7 @@ static const struct stm32_desc_pin stm32mp257_z_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(405, "PZ5"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOZ5"),
 		STM32_FUNCTION(2, "MCO1"),
 		STM32_FUNCTION(3, "LPTIM3_ETR"),
@@ -2482,7 +2482,7 @@ static const struct stm32_desc_pin stm32mp257_z_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(406, "PZ6"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOZ6"),
 		STM32_FUNCTION(1, "DBTRGI"),
 		STM32_FUNCTION(2, "DBTRGO"),
@@ -2497,7 +2497,7 @@ static const struct stm32_desc_pin stm32mp257_z_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(407, "PZ7"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOZ7"),
 		STM32_FUNCTION(4, "SPI8_MOSI"),
 		STM32_FUNCTION(5, "MDF1_CCK1"),
@@ -2510,7 +2510,7 @@ static const struct stm32_desc_pin stm32mp257_z_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(408, "PZ8"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOZ8"),
 		STM32_FUNCTION(3, "LPTIM3_IN1"),
 		STM32_FUNCTION(4, "SPI8_MISO"),
@@ -2525,7 +2525,7 @@ static const struct stm32_desc_pin stm32mp257_z_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(409, "PZ9"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		BIT(STM32_PKG_AI) | BIT(STM32_PKG_AK) | BIT(STM32_PKG_AL),
 		STM32_FUNCTION(0, "GPIOZ9"),
 		STM32_FUNCTION(2, "MCO2"),
 		STM32_FUNCTION(4, "SPI8_RDY"),
-- 
2.34.1


