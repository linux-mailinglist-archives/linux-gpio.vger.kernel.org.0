Return-Path: <linux-gpio+bounces-32221-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDRxCTgioGkDfwQAu9opvQ
	(envelope-from <linux-gpio+bounces-32221-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 11:36:40 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B97861A4625
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 11:36:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F6CE30C9DE7
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 10:32:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EADA3A7857;
	Thu, 26 Feb 2026 10:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="SIPS9EVa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011017.outbound.protection.outlook.com [52.101.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241DE2522A7;
	Thu, 26 Feb 2026 10:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772101945; cv=fail; b=BR0lyQhslpTuatGgat2S1JTyRuF8K4X6p4uM8tBkMKBk4YMZYj7uwWpBpOB7chttvza/ppHRvTAm45GrzcfUff4bvfLJr7yv6yknjjCYzcbhQpXtR7nodPmHl1asT5N2CQYhWN0dScQ4LkmwkizFjmWIJrvF1xJHAAyu6/7Ss+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772101945; c=relaxed/simple;
	bh=dlLbiAhXsiFI1d1rQybEDPWUcsyZ51ewIur3uzzmEco=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ef7Zn3WeQn6tE63kGE/srFraHb9p+9IDbF12D5z2ol9sdrgNHW+2TfbMpC4q9nzZau2sqSKW0+sjKQScYozW9saE+gdUPodzGVk3gXOGznv67FOWDVA1w3PjcqeF7keoO8JQVpL4TxilLbYYjEUHzI9dJ1kat2rvX30lPXy9pgk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=SIPS9EVa; arc=fail smtp.client-ip=52.101.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HbsYsGBIbgJoDppmSw2nwKh/e0gQePBwU0jaoQl5dFtgpdZXOxhS1Qc5rWefTrR2ZaJ69amoQ2ZyPOEN0KnwBBld3NdoFE8GKp7bFz9HZkAnBk4wZ3wrJzpctaEwgPj/FBkxpbvdGXVa5UEyR9uQgE/TpxQA8QoaC01luNgyeV3AgTpif735Di1PH0voQrKx1LV0XGLWL6uL0k6e1QdDv0ITEI26yalJ4+ljOoX9UDiJTnSxCMl71OMKLeKJXwCqFUDGPzMnDWGfrZtKyiqWCRqXXDudmbAusu/MvbqLofQaj6WkQeWM6u+KOgBtJbIst3lBPVitrpSZRBao/kdGZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bAFyc7vOA2nOtp3hxGi1netAb9KvXOb7ypO70KPv3X8=;
 b=XLPD4ieAzUdm1f15zoomaPrQxYHV5+CF9/ywiAaa3UkYmEAaYhxGwBfVbTBTvcbwnZQOxDuOpCqv+e1TY149PH57KtlNFD5U/ZoLhGsuiujtIHjHqst3q5zPXfB8dcaaZq61V+iEVSVS9uUiDe3p3E+QhN/vNJSzVFPWTlHGX0R4Af+l7xkn9/s8AcPY1zDoJ2WAW82DkJE/byBuvA6qiX31qURHmLxkjOf7snTA7FFTBvSfFPcldftP9AHR1FXKmtYqKhNCoOD1emadzD34pB5Dh2kW122M4OZUXWROkWLYpMmgOYm6xg9nb5V7LBPMLeq+4YhZtIRyEa7D0E+jyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bAFyc7vOA2nOtp3hxGi1netAb9KvXOb7ypO70KPv3X8=;
 b=SIPS9EVaWjtQ98BnPd3ewjrBM4QIf0c+6L5Jv9WeyWN8LfSd9rSYYgRBqEd2HM6tpZfNzKqcNx29AMjGGohJwEpTt+3JJywIUcJWymZ1pr4RAttRefsECCmNnUT7hppGERt/XG7n1I5S/tPUf15o3ZFg3z0Q5yTl1Z0hR85KYGgWCwCaDCL0rHf6fASOJJA62zP+nyVjE9tb5VOSBzzrW82/PvyJa4MQc0UvN5KMYRPWQRHRKnwXMxbtybu/ZrJvku19lgrh/Kap9HLTIiARv/KG8HOxx5jc1AkIlSfPO3WAdJoTpUvbcXBgyvDUaJci7ur1lTCrDE19nu2umo+0/A==
Received: from AS4P190CA0045.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d1::16)
 by AS8PR10MB7522.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5ad::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Thu, 26 Feb
 2026 10:32:20 +0000
Received: from AM3PEPF00009B9F.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d1:cafe::33) by AS4P190CA0045.outlook.office365.com
 (2603:10a6:20b:5d1::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.24 via Frontend Transport; Thu,
 26 Feb 2026 10:32:22 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM3PEPF00009B9F.mail.protection.outlook.com (10.167.16.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 10:32:20 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 26 Feb
 2026 11:34:27 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 26 Feb
 2026 11:32:19 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Thu, 26 Feb 2026 11:30:26 +0100
Subject: [PATCH v6 11/12] arm: dts: stm32: enable CoreSight on the
 stm32mp135f-dk board
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260226-debug_bus-v6-11-5d794697798d@foss.st.com>
References: <20260226-debug_bus-v6-0-5d794697798d@foss.st.com>
In-Reply-To: <20260226-debug_bus-v6-0-5d794697798d@foss.st.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan
	<leo.yan@linux.dev>, =?utf-8?q?Cl=C3=A9ment_Le_Goffic?=
	<legoffic.clement@gmail.com>, Linus Walleij <linusw@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, <cristian.marussi@arm.com>,
	<jens.wiklander@linaro.org>, <etienne.carriere@foss.st.com>, Sudeep Holla
	<sudeep.holla@kernel.org>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009B9F:EE_|AS8PR10MB7522:EE_
X-MS-Office365-Filtering-Correlation-Id: 624309f7-4250-4187-0691-08de75225236
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700013|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	5Sz07frF1e5R150aXL2faNIG+miCZSqj6cpsAD5IWpKPs75YEbUJdsVdWo9ZNPX6dwifjGXpMrEIA3Ym4YuBLyN/dvHqIZQ7Ym3HAzdgMvhozbEba81FsDdwpFCygVt6BrhRcIR7JXXnejdDoy7s6QwQfveAKRz516TYK6bcjcY7u+tCQhiU+N9wNaSGDcqSHrVGiWJGVIk+7BD5cd6CkE3Dojo00hOYaAMZC84lQLLpgvc9cGGMUm9cXIh9SOfCou6Er8mIdep6GAvsqflrcUpKsuidtB+FJM2bt7fNkWi3UYhvML+/S/ltMjWPBXpyvbtLJgQqM5D7FCDQGJj2ob/8SHgACJd0qgwmRZ9+2DwybHx1xUJvJkHgsxT//m+nPsR9JJfWE8CvgV+hidCIs7XFan/zkZNxMJXNZbXUnvpa+8CPhs/rF9jgjCeZjOeGCLfsPe6CsFwG8d/6t9kVX4udgQvkSdaEd32GhuuwpJ8Mpmkp2GlZvU9ZsYg3eUhVQO2AxNdRuJ51qfpg6Umv2C2ZH/h2ejulv2S3Gt1S/asi0xaPmoOZeFuTdL2Gp3bI7iWVrz4pSwPjhp5hyZBTwm4p0dVPkZLXHVt/U+b2A855zQ1M9/l0eliTu+LltFl2wRfDCU0NS5hoFhSNmOyfJ8R+xuk/Ju44t/2nqYSvKey66i+EyGHUJnWBT4PS1Vzf5uf1HbOwQ4pkTbWildnzHGpSMtRtQONHcDpmgrO8tnIno06wCru6V7DfcMSQuE9C0X9fCEFVY+P3nqV8kSfD7zdoE8m5MSqxl8ufYguy6yOb7TT6ujhVo0rkWXq8naEVAvG/7yPieooLK7pB1t4Zggqoeld5iHOc2i4GzvGGDdI=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0Je7t8V4vlc5iu1KZcZaVaI9OQ0B2aXRQsrbyuXnJbMtDz0XhVhDuj1z3HFUGg+RfMYsprXuoSsFi2VwPDY4KuyPfvwkXcE9CiodISU90SbkyZL/dthtaKJCMDkyqGoeTfzXHEeBZQXxZ6O1cGCIrj33bTM2tA4I0yzTt1eRDhpFX8WZKw7Q5AUe5sIEROiaKC2itYMBAdCV7/sF6t6J+CTeH/91NjBfSBiTEN2vYyRbCmc+YowriFk8Q4nKs0TKNYtHSWyxwGn/wKCMuTkPUBimJ1/4ZIP9AAxnquwhu6/85+DUHmn18idFgKJwteQX/1T4F/a8xe2h1KpFGO6EbrmzrQ2AQ1Mb2LWI2efcw8mxuS9hbAUmn+DziUPj4mA4fKv0/GHolpgnGtguaOlgOwBe9VAXU1OjKS8N6KpXPMugrabTvZKurhm8dLFHW306
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 10:32:20.0818
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 624309f7-4250-4187-0691-08de75225236
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009B9F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7522
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32221-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[arm.com,linaro.org,kernel.org,linux.dev,gmail.com,foss.st.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:mid,foss.st.com:dkim,st.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[foss.st.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gatien.chevallier@foss.st.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: B97861A4625
X-Rspamd-Action: no action

Enable CoreSight peripherals on the stm32mp135f-dk board.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp135f-dk.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp135f-dk.dts b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
index 0a47687bd9ed..4d4cec8b86ac 100644
--- a/arch/arm/boot/dts/st/stm32mp135f-dk.dts
+++ b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
@@ -187,6 +187,26 @@ &cryp {
 	status = "okay";
 };
 
+&cs_cti_trace {
+	status = "okay";
+};
+
+&cs_cti_cpu0 {
+	status = "okay";
+};
+
+&cs_etf {
+	status = "okay";
+};
+
+&cs_etm0 {
+	status = "okay";
+};
+
+&cs_tpiu {
+	status = "okay";
+};
+
 &dbg_bus {
 	status = "okay";
 };

-- 
2.43.0


