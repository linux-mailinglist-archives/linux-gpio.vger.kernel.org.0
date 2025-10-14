Return-Path: <linux-gpio+bounces-27094-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EE8BD9E0A
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 16:06:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5E60192375E
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 14:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ADAA31578E;
	Tue, 14 Oct 2025 14:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="keLp4VnY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6665F314B7C;
	Tue, 14 Oct 2025 14:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760450729; cv=fail; b=fGraY64pbaORmu2dqC8l7ISa6ApVWqSYapclgfBCUlysFgvAWY6T7wVu+GA4OVyRWJ1Npd1CQLHs0hJl4wPvsps09uYnIFozrS3vq7q3M5/ehE6odlSafMgdmO/ssWl4Gdi9aFq1bMtXdXmWVV2ThjdsP+oJYclHDjK5KTycOL0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760450729; c=relaxed/simple;
	bh=5iV7BKrurl3pryP9eS9ZuIyC73nLmZHSYlNffLJ2u4U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FtT7bjm0F8g7G2Amn8IjUK8fiLpgI8XqZ1isuU8XJrXntMYl4Rcvo5FJ8loRLqe+CV71QEQuj+8jbAM56bFcB7oECeuNcf4cWKKuGx3aDNv9zwM+hmy1w6LjXrYuk81HsiNGxP9gK696AAohhNYHf5flio0uP8OFa7yVDtartQY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=keLp4VnY; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59ECua4a003506;
	Tue, 14 Oct 2025 16:05:00 +0200
Received: from osppr02cu001.outbound.protection.outlook.com (mail-norwayeastazon11013044.outbound.protection.outlook.com [40.107.159.44])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49qfbtc8j0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Oct 2025 16:05:00 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QHFmvtbBtdbmL7sLtAUbwKPfa8YGCQ5xqQH6G54erfO76RRxB+9QjSYCqAHxw2x7QesWhfZNeJljsdiElA/ducJWhAHeAlhNu7Yi+FFHT+JvLIZGBf9xNwtA43E/t07V+CZgkF/+PW77kBD93s0S6dBTGJ1/4sQBqZrlvKeAGzOztnPD6oUF4sgeC1n2SULF127iEm5tCJFWYCYjMLnFyWftW0ycoqUWZ/uav7yoAV0aTODNu6Pp3i0r5wsj+0OgiDFRiPKNk0W0YO2SQplPI0ah73qLaubDQJYvGpnhfWjgFBzxYpI/g8QzhQPUmEF2CUPvL75sP1nalAV+AyhzOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yLtmss8g3YYvSxgvm4yzb6UjqZ6hnLIVxWr+eh4zo+w=;
 b=HqUu68QlYZmVNvSZQkH7s0jkQ2uRuoER2R+OYHnq4gL4b6zFbfHAc729wrXdWE0jO74wBn3UP1PKsnNUB+j5yGsnAfIOE68yzkldHPY3Mn+6Gl7AuCwgOgvK+pWODYyKI8VY0yBeXwjAz06yAbNsgjjxwWHcNdu/JpDv06Z1zu1hDD288K7wsWV/iIjddWgwqyW0ggl4v35+8l0mfMG1ttFtv1d+G3thVRpvbsyZrrUp7ipd2/54vttlOJPzwKC+U4zOej0Tx5GQXucc4lwbh1wK39gzi3NBqTawg2kf9wooSoL0kPVrGV8ajGBuwBMSUlsnUQP5LdIUIJ2J3e32xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yLtmss8g3YYvSxgvm4yzb6UjqZ6hnLIVxWr+eh4zo+w=;
 b=keLp4VnYr+HFJ7heIzIu8Q0ye9scf9Sws+Xk9U0CNe/kxxQ0aCqwIXKPzWUvFlXICSUzSg7E52UyXVBitPQNmT3uTkC8A+FjbY9umsjAPLmGt0y1EeM1fI/RkWSGzcXivhuePUj3H9oYeuLZmUooOMh3F1dk6CrFgzWooRVV/oteZI/HIciP3pT7aPGuPNIvb6R+hxN5b/5Q+7PmkboprgqX8V7sTcAHBLmknQ2xoeETPHHmFR8rALT23I9IiOgEoslT8wopaPck/1Y3h6YW7kS6K/zF/AEvggX+t8bK+bTKf3Romhks9/s5nZGR4kw1pA5vK1FXqm7y24hZCsghgQ==
Received: from AS4P250CA0023.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:5e3::11)
 by VI1PR10MB3566.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:131::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 14:04:58 +0000
Received: from AM4PEPF00027A67.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e3:cafe::36) by AS4P250CA0023.outlook.office365.com
 (2603:10a6:20b:5e3::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.9 via Frontend Transport; Tue,
 14 Oct 2025 14:04:57 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 AM4PEPF00027A67.mail.protection.outlook.com (10.167.16.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Tue, 14 Oct 2025 14:04:57 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 14 Oct
 2025 15:57:52 +0200
Received: from localhost (10.48.86.11) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 14 Oct
 2025 16:04:56 +0200
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
Subject: [PATCH v3 01/10] pinctrl: pinconf-generic: Add properties 'skew-delay-{in,out}put'
Date: Tue, 14 Oct 2025 16:04:42 +0200
Message-ID: <20251014140451.1009969-2-antonio.borneo@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A67:EE_|VI1PR10MB3566:EE_
X-MS-Office365-Filtering-Correlation-Id: c1667dfd-5a8d-4043-1573-08de0b2aa861
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|1800799024|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HpNMssQuTcDg8LukvRbPrDXv6FHVV47s5L3D12qJ/rm/kCFNt1YNc8nHa4s8?=
 =?us-ascii?Q?88GM5Ct5Q4ITlN5sOfvf5sk5lTtBlmPdQpfH2+mQU5u4/Uguh3o/x4OA8Y+O?=
 =?us-ascii?Q?cgBNXJ7HbZkpHEdGvNRo/kfoM5MmzuWcH/vX5lnjJE8hygQqbDWcrSqMK3Dd?=
 =?us-ascii?Q?7krxG9UV5j94O6q8kHzoIGAOFQsgdWeDi/9vBhSpd5pW6rFTQvAuARaaEK56?=
 =?us-ascii?Q?15JIbFuMtO4T1XIYoJZZoFZbnJfQD7IAG27oe2TrE6+ZSuZiaxDebNl6Vzof?=
 =?us-ascii?Q?Ck403RJF2hrVoV/Kbt+ib9cR2eZ19K1/uZSi/b1K31uSRC9rsROT8Gf6QZKq?=
 =?us-ascii?Q?IJzjlisp5GueYoEw0d/1skkuOitftQcoC4quNcAFuuUyT12UktCsmaDwCvk1?=
 =?us-ascii?Q?0hYrgfX73cb7pumJtZPBYst+ukgDYupJeegr3TNK6jX6KSXgQyjvMX7NvCYu?=
 =?us-ascii?Q?UGGuMXzyKVyp2NGFEG/50H+1hHWUAY7yJLMjcgrp+iPnvjRi4s8slM7RMFdc?=
 =?us-ascii?Q?2n8e672BmEnRaiD6WJvwFZ/j4iREaaHRaLljcgLPJYf5PkaZ+uy+O1pVp4Hb?=
 =?us-ascii?Q?NJQL36KtGO1i9rQlZFa5PYq5YxWTLnFkreGiZsRBy/Adfmyvc4FmsTKN7vgl?=
 =?us-ascii?Q?9gnyThPACK2wi9fIN+lPpnJWbTrcTys8jw5yvi3s/vpqGUzA0QjDwOW9DEHs?=
 =?us-ascii?Q?0mvlkAQBlTZ6VAktfWn7lvaEXjUSHrhz1JjJhZUL1mIl+knbgvW7u8DSvCoU?=
 =?us-ascii?Q?JsDtMTgRfERAcHuJNbGUdBBSrlDu32XA6d1E+avn8FzWj6MGuUcHNIqdqhnV?=
 =?us-ascii?Q?rTpqhMCKHYnz05rLwvzn7lEFIIlFkQDT+gAe7MkLeN/BQ3BS7vvf2GbxMRYP?=
 =?us-ascii?Q?KRrOrUhpP3uE/I6/12tZaZeCvT/rZKQl0y4pk2MH6vKksXyPeWJ4cfteq52d?=
 =?us-ascii?Q?jI84MBw/HI2MFz7NaeR0I+P9FQj/h/igiS7ftI32hYjfQDpSGb0ukvh0x/rc?=
 =?us-ascii?Q?UcuurHGLlTuClZkwKVSSvmSqNgUGIEOAJpbayZj5smkFpg9U3RSXjDOMNSQf?=
 =?us-ascii?Q?v3gKl0/VBXSJF4fJ4XMDWKfHuuGJePE+chro30/dj3/2c99NTf+imhrgXZXX?=
 =?us-ascii?Q?QqVDkIqeGmhAGzQQdmzbTkswQV7RDmNWHBBVKvf1cixo7z8YYeuzQ6mfl6oQ?=
 =?us-ascii?Q?p6n6dCOmk5vrR2mzI/UPhYlOVp/cXRHjwOoqEosgnS6Ek+KpmqtmtCQvU20l?=
 =?us-ascii?Q?orCr1gv06EKIw7VZ7n0QAQz9Iix3ncNRf3scIWG5kv2f7vwPTf97ZQeGR8WK?=
 =?us-ascii?Q?IL1S/ChimHsa1w/9HxQLFGbVnELoV7oSq/JSl3ihO7QK8zqtUyib4lfS86Gg?=
 =?us-ascii?Q?l/lcd4Ba3QP4fiQ61y7R+leB7Iw5XFIS9TLpL4uewg2A6np3ROV8GJDsdVjL?=
 =?us-ascii?Q?KU4rl7qu2cm5wXxtksnwwCAe4VFYSRJxUho9/H2m3GCK9j+COW30YaEY2FFf?=
 =?us-ascii?Q?hWaBBwcABnY3TuHoldnIjssk/Qom6P5DyrQFzpSzeCnWNfvC/Ae7a2IG9Vld?=
 =?us-ascii?Q?F6KqoblULZwDjOVTX3sgTM7vlDDAzG48Hm8dioFm?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.44;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(1800799024)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 14:04:57.3468
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1667dfd-5a8d-4043-1573-08de0b2aa861
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.44];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A67.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3566
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX2FS1osIM+74G
 lT0tTLyoH6YxvoPJcRYClHUxsykgkbwxKKNzq1roBtC2RxOVm1tLD7eVbcqsImFf+hgDhZ+H6Iz
 LuxWuLWZnS+wEfUmi0Eg5nRyYz3daDPniRBud4LQdkqkwIMrGpgxR6EO/iH2tyGHYC5K3zUIX/Y
 xRPqu7LdTi+yfWvVQiks37sqCRw/3vN6YhbfJKXcZpXChkRDiTrSDDIKFf++AlcGs21u9dq7snx
 c6hfmvFLAW3azoBaF5LoI8b2uM98FQG84VSkFmj+1YB+jjfOjx92uZH7tT9/xQlL816OhsL4e94
 i2/qGAslfWKxaGsojU+TTXmvxMzMYtup5SelxwWX1AAfuUvRizfGdQd18KtrVSX71wrLvcaCDr+
 2omDcBOsGOnvjvHH6DAlclElFbpGUQ==
X-Authority-Analysis: v=2.4 cv=Jun8bc4C c=1 sm=1 tr=0 ts=68ee588c cx=c_pps
 a=XAY7+HngwFVe3IvMTNpLPg==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=y9YUpebZf6kA:10 a=x6icFKpwvdMA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=w25x4uixzSbVIWrOvq4A:9 a=T3LWEMljR5ZiDmsYVIUa:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: Jpzqk71z0Wg3ut8Hf_l-T3ySZpANfpBN
X-Proofpoint-ORIG-GUID: Jpzqk71z0Wg3ut8Hf_l-T3ySZpANfpBN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018

Add the properties 'skew-delay-input' and 'skew-delay-output' to
the generic parameters used for parsing DT files. This allows to
specify the independent skew delay value for the two directions.
This enables drivers that use the generic pin configuration to get
the value passed through these new properties.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 drivers/pinctrl/pinconf-generic.c       |  4 ++++
 include/linux/pinctrl/pinconf-generic.h | 12 ++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
index 5de6ff62c69bd..8caec29e40a7c 100644
--- a/drivers/pinctrl/pinconf-generic.c
+++ b/drivers/pinctrl/pinconf-generic.c
@@ -54,6 +54,8 @@ static const struct pin_config_item conf_items[] = {
 	PCONFDUMP(PIN_CONFIG_SLEEP_HARDWARE_STATE, "sleep hardware state", NULL, false),
 	PCONFDUMP(PIN_CONFIG_SLEW_RATE, "slew rate", NULL, true),
 	PCONFDUMP(PIN_CONFIG_SKEW_DELAY, "skew delay", NULL, true),
+	PCONFDUMP(PIN_CONFIG_SKEW_DELAY_INPUT, "input skew delay", NULL, true),
+	PCONFDUMP(PIN_CONFIG_SKEW_DELAY_OUTPUT, "output skew delay", NULL, true),
 };
 
 static void pinconf_generic_dump_one(struct pinctrl_dev *pctldev,
@@ -190,6 +192,8 @@ static const struct pinconf_generic_params dt_params[] = {
 	{ "sleep-hardware-state", PIN_CONFIG_SLEEP_HARDWARE_STATE, 0 },
 	{ "slew-rate", PIN_CONFIG_SLEW_RATE, 0 },
 	{ "skew-delay", PIN_CONFIG_SKEW_DELAY, 0 },
+	{ "skew-delay-input", PIN_CONFIG_SKEW_DELAY_INPUT, 0 },
+	{ "skew-delay-output", PIN_CONFIG_SKEW_DELAY_OUTPUT, 0 },
 };
 
 /**
diff --git a/include/linux/pinctrl/pinconf-generic.h b/include/linux/pinctrl/pinconf-generic.h
index d9245ecec71dc..6ef0b343f3424 100644
--- a/include/linux/pinctrl/pinconf-generic.h
+++ b/include/linux/pinctrl/pinconf-generic.h
@@ -112,6 +112,16 @@ struct pinctrl_map;
  *	or latch delay (on outputs) this parameter (in a custom format)
  *	specifies the clock skew or latch delay. It typically controls how
  *	many double inverters are put in front of the line.
+ * @PIN_CONFIG_SKEW_DELAY_INPUT: if the pin has independent values for the
+ *	programmable skew rate (on inputs) and latch delay (on outputs), then
+ *	this parameter (in a custom format) specifies the clock skew only. It
+ *	typically controls how many double inverters are put in front of the
+ *	line.
+ * @PIN_CONFIG_SKEW_DELAY_OUPUT: if the pin has independent values for the
+ *	programmable skew rate (on inputs) and latch delay (on outputs), then
+ *	this parameter (in a custom format) specifies the latch delay only. It
+ *	typically controls how many double inverters are put in front of the
+ *	line.
  * @PIN_CONFIG_SLEEP_HARDWARE_STATE: indicate this is sleep related state.
  * @PIN_CONFIG_SLEW_RATE: if the pin can select slew rate, the argument to
  *	this parameter (on a custom format) tells the driver which alternative
@@ -147,6 +157,8 @@ enum pin_config_param {
 	PIN_CONFIG_PERSIST_STATE,
 	PIN_CONFIG_POWER_SOURCE,
 	PIN_CONFIG_SKEW_DELAY,
+	PIN_CONFIG_SKEW_DELAY_INPUT,
+	PIN_CONFIG_SKEW_DELAY_OUTPUT,
 	PIN_CONFIG_SLEEP_HARDWARE_STATE,
 	PIN_CONFIG_SLEW_RATE,
 	PIN_CONFIG_END = 0x7F,
-- 
2.34.1


