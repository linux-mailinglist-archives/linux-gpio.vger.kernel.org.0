Return-Path: <linux-gpio+bounces-32218-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJwHGMMhoGkDfwQAu9opvQ
	(envelope-from <linux-gpio+bounces-32218-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 11:34:43 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B12EF1A459D
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 11:34:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 53739305F3CE
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 10:31:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D5B23A7829;
	Thu, 26 Feb 2026 10:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="KvDjeT/2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013030.outbound.protection.outlook.com [40.107.162.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E583A7845;
	Thu, 26 Feb 2026 10:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772101914; cv=fail; b=YvbSuiqtnYNla6CdJ249KtuY8rtAmgmYKxcvr5pUoUWV1uCGlF+56ir+yjJ3MepCA9dVAbXq5IF90ECEg59QO7HFOoYJ2lin26/ec09DKNevpNA+1HchLG1JRrAzUGIPhihu09qCKduNhBzlPkHZK5vj68kj4q3fp3O0CUhspLo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772101914; c=relaxed/simple;
	bh=CyH7V2y4vXjmLp7/kVxyVA0M6HUgXqHRpR5YTJM0U38=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=sLzNxm+a/n1ciYasrN28RMWaHCLmI3bbUjCDC9adVmHyALmNYIL9I7Qob99rPdP0DPZ4I1eiWGkS/nWvrRE2BMvuAZGQ7lqhtnF4epTMMasI8dW6gvWhwuOKBH3SUjkwTMwexvalBZGVFWy4nvTe7XyOwMRTJ9hdi3zj1kEJLxA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=KvDjeT/2; arc=fail smtp.client-ip=40.107.162.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rQxiVTaiUr65k/JfXJtem3ECnXwCNYKtvvHiCUD4oi6yCYI3/t6FU7/ivh8+vsoZ0fEQoocCiWSQYRpkvVN4L3ldzVSib2+zDCKXbdxo9ruM8E+90Xs+sI0zzaof2lXM8+7/XDwFvV/r/67dE39lQfG6ZgNG8p4Jz22nj1jIJ/CiEkzTd1RFk1HtPX3jlUYDWMdGMo9Rd3ytTSJMEZtmXxRc0QgBGNyUlH+DosWkgn7axYusSs7TzR7Nu4SbhBdziDcVViy3rHAJWHeGV9jL03gW8Fr5JfqsTLX2mnb8ljCRhn/97u0SHsWN1uvXUcnsNC7RP6bhae2wnhKbGB62HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7yfcKdJ8UV1sLhFrjZe8+ZeEdGD7kNqlg5Bcfg5fU6E=;
 b=E2Scwj7NuMSBpFj7PM1dGFCyaEDeft7q4k2cH9EGUflRj/XN4TAO2PVyDw194Z6jWjQRfrYvb0vo1ueKkpfAwaSMUWtHD1aQWEX7RdoerBPzmFiBdHzg82/H0ZBtKacYXt1AmFT0tZWyM7/Nm22OgcyHQXEGleyFo7Ay1UVX0eT9rHuGXgrLnoiNuOVY0/9pSCiZN73K0wSNtfEMZPm8m2ZQSq6GDU3TCEP3ks5zkHjMp8vsvgFqXKeeCrZ0CjmZqc08k9L3OdeBgB4Eip8vWE3/g9Kd8EX+S7g/W9weeoA3zP5eW/wlWeCZt29ub/ilmjaXShYXMDPwiA4VoI5EVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7yfcKdJ8UV1sLhFrjZe8+ZeEdGD7kNqlg5Bcfg5fU6E=;
 b=KvDjeT/20mjP2bFZuXYqNS+A66bp8zmTHKLVYWtpJTarlsK3p3Ec8vvqbdPTrrV1PndhHN56aa2FL2xqTJsvHMFkzrWNvRLX7zGvqQEaQh2mREMbXT+zjz+mMO52Xz6yetsm0AK16Iyh7SS57HDPJLiMVm7ZNCJmmuFK1NM5jeKIitJ641D9R+gDVAcj1n86xmpOWyq4N1yeFv/0wzu0Qr26llSO571CkrJztauOwGiacbI8OE6zyzdcqLiDoQWieBzqr73bi798iJaxP4BCPjeDMgChqoJYmUAubxIu0X0PznUB6DQJDeG/6zLIm/CA047ILuV0pauiiLqyJpnn5A==
Received: from DUZPR01CA0351.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::12) by VI1PR10MB3614.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:800:13e::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 10:31:48 +0000
Received: from DU6PEPF0000A7E2.eurprd02.prod.outlook.com
 (2603:10a6:10:4b8:cafe::3b) by DUZPR01CA0351.outlook.office365.com
 (2603:10a6:10:4b8::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.26 via Frontend Transport; Thu,
 26 Feb 2026 10:31:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF0000A7E2.mail.protection.outlook.com (10.167.8.42) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 10:31:47 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 26 Feb
 2026 11:34:05 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 26 Feb
 2026 11:31:47 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Thu, 26 Feb 2026 11:30:23 +0100
Subject: [PATCH v6 08/12] arm: dts: stm32: enable the debug bus on
 stm32mp1x boards
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260226-debug_bus-v6-8-5d794697798d@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7E2:EE_|VI1PR10MB3614:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d1b3ded-e430-45a8-1037-08de75223f09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|7416014|1800799024|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	XyxXCWTB1zTcCet2F70fZyNeHFdhMi0Qv8bE4LEn7Ybxnzx/tqKDq2v8uPI9o4XmO16VI7Fjb/AzVZQGPEMP2EHoPyQ+uRiWUdSPD/AkNX1VvR3g576aq5aJdPPN/9UZfg3sBZbsftBtCp8JEXX/PbFxzNAXwHpy5kflGqEDpfr/UewYMw21hvLo8WXzXMi5PTC/dPa+GTzfMiZ9UiNymSC5BOff8xJeGEeek03E8efaDiznISW/FwMCahCPWv7m9D9d1VAMWjZVPgzrUjbI/Ru5haaoiJUMQRsBVLLVGNl2XnKQgCnbXaR2zllAqRidgH1AFR9OlfGPZryjtwYpmLSfzfHwsRLP7eNasUmXdAmTiDCJuufV5SE9F9IRQ71+0SOXs/JhsrkGT70M393Kxw4WnxigbfX/dc60aCqBpxeAeN0BUQFamg1v7ieRpNXAdn5axRoE5zFrHH7i0V5ZOem9kUsCt4ilF/k4y/zsU+V+5v06V71kHsZoM3RR5SzoCDft1fa3FH2SjPJIP3DTKspp1AexjNcTpMINteRwwc1GI0GQnzmVOa10gsPXXyjWke3ud+qdEROqCU9FG1qA9t+WKdml2YX3rK0F8sPIFtWbtDHtCAaBhAm5n2joiRjnmLnCv+nP7I2aZZO4wq88zKCy1R7cGw8sjah6IuFg//h21VyxYSMeimNzIBTobjFXi3n4cUYAz3NYPP3+i8GcGkHg+qd7AQLFHnP+dh+njRNbgjAnhC8zOf+fdaRFklr/E7GaDPNb3NDReS8UPiO0J98AN9cpMtjwS+TbjKbTZe6bmQLqp992ColEfbYTfOXRf8WBabhbNi1HRXW3f9pD5pJEcupkEoaWhiQAGjz1pqg=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(7416014)(1800799024)(82310400026)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	coPVxx07mut1cNztnewiixikjPcTtZsHWDsVUxau1gnqaaXylzhpSw3lKq3KOUPsWVyHlmunRvw0pFTtXDzby6OIkm3h9NPJ/keM/koIGGAp8xaKO3xD9f0FDziOGG2eoSLlppG7opkZ47jxyiUP5uSqQMBuYw2t/hTnjVhzUAUd2DoaNE2lvIgQxQUDj3AHcv42TRTsN6EmWoEFgKYhJJrNlBfb50xTqP8LEGiGpqltcGQaD9+B3Jxpwq4UexF6oxnbZVTDCzFNZEO2d1g027qjlmFMMFPspd5Bn3efTx1RWmMs9K2JRDfZ0OFeUVTO/6dzmYhzu3KFFIvP/tpFBwGmqEVYyAgG6dMgaVgQQnqod/kSkUgt4tubgHft2QfVffZya/wpWFq1HakeCS2t0IDvKFesVkJU3KMyZ6wlCLHhFIC+0vdPiOlBH+1/6oox
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 10:31:47.8974
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d1b3ded-e430-45a8-1037-08de75223f09
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7E2.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3614
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32218-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: B12EF1A459D
X-Rspamd-Action: no action

On stm32mp1x boards, enable the debug bus so we always try to probe
the debug peripherals, if their status and the debug configuration
allow it.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp135f-dk.dts   | 4 ++++
 arch/arm/boot/dts/st/stm32mp157c-ev1.dts  | 4 ++++
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp135f-dk.dts b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
index 8dcf68b212b4..0a47687bd9ed 100644
--- a/arch/arm/boot/dts/st/stm32mp135f-dk.dts
+++ b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
@@ -187,6 +187,10 @@ &cryp {
 	status = "okay";
 };
 
+&dbg_bus {
+	status = "okay";
+};
+
 &dcmipp {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&dcmipp_pins_a>;
diff --git a/arch/arm/boot/dts/st/stm32mp157c-ev1.dts b/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
index 4e46d58bf61f..d91b4ba79527 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
@@ -81,6 +81,10 @@ &cec {
 	status = "okay";
 };
 
+&dbg_bus {
+	status = "okay";
+};
+
 &dcmi {
 	status = "okay";
 	pinctrl-names = "default", "sleep";
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
index 7ed2b01958fe..98b27b5d1311 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
@@ -155,6 +155,10 @@ &crc1 {
 	status = "okay";
 };
 
+&dbg_bus {
+	status = "okay";
+};
+
 &dts {
 	status = "okay";
 };

-- 
2.43.0


