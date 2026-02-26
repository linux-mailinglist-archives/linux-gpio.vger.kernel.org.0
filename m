Return-Path: <linux-gpio+bounces-32212-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNLFHgshoGkDfwQAu9opvQ
	(envelope-from <linux-gpio+bounces-32212-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 11:31:39 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2F11A4490
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 11:31:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 46C3A301E9A6
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 10:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 485433A1D18;
	Thu, 26 Feb 2026 10:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="k1N+7nNL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013005.outbound.protection.outlook.com [40.107.159.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D302F39E6DF;
	Thu, 26 Feb 2026 10:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772101857; cv=fail; b=P/YRcK7xe2lfRv+wRnK6DLX1preDpsqaVPyAMV471KzKE6MBzXGWlgp5JEm90TGyy9zDu8xLGuuetPUrrYGslvjuXdGHSmM6gBmEUcMd95oHC5XKyuIiUUP5xfwf5ZqziN0JJ54cL/Rc9UZ2ZEhSrtfdLXhM9lq5jyhzdUsc4GA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772101857; c=relaxed/simple;
	bh=OJbSZlCJK9jUjbr2rMrjJmZYT77F70FBLNk2TEgSh7A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=YQfQq7tcG+c3xJqxmaRk5mr+7X3k8W50s/qB31TxXOuBHyR2MEG5gysIUAygT1UmOZtOEC0hCXxLVsNjK8dR+VSavZyrhs6K3MBxx4yf1Te246HPXQzAPMz+nPiyiGXrxm76269zai6dSZeLirJeV8hcIj1oaGbENzuMPPJf+V4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=k1N+7nNL; arc=fail smtp.client-ip=40.107.159.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kyfmq36lcHGHprLpu5HmdJOjGuSiR72QStsHFyv3DSYOJh5esVIU876XAkcO9Wk4FbHCh0ZM8DTEQW9kNnccmfhk/hFNqkhbYVMrdelhCkWvSwtaYv2oB9BEoANNiOp7+IrDLdWOjLiq+T+CJqYzMya4miQwL82sW6wYxgSwL27d9bRlQyChuUBqutVxWho/ObQdrnCTr3baDsqUTgQ3nrr6r7oUsN2yi6u1YRMGwRvZ/1jfUW2vJHQBxkWW8VXOWkcNY1d3M3wyaYaj1oknGWNLHk8ouETLH8OYFx2ttGmV7KkgvGSRT/6078+2QmYozvMwprIsVDYX7Z5osHsyJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TcmxFEFAmIFAw5UbuXrmG81Aqnt9Am9FBldjx37idqo=;
 b=x9k2tVDC19m1+CaJwbdbetDrJ8QVIqmDGPRwx1Qyeqk1FXpRpFFE1onnP3qIWPg2nDuF0J5OaJ7mdS3Fbch0eOCpYcm80JZG4JTcIHFefoxOKS3HcCvEuhesnGwrTIBwXebEK57AnHtaf2qvL+VyBe3kbqKTtu0AI7THXz5njasYvpJeX58OO2RecPCqZlN0C/HeTYe0x9z1dZgFzREr2AjwJkLN2q5T8CRQ+EUBMHfiHUFP6X1JB/tkIAXoRircaal2QWNaeTdNofYElz9cQmGH2VGFn2BaOxFH5YjEvz+n7fMY2A/MQcH4sGVEJ2yaP91y0FQvhDwo0pKptH6+uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TcmxFEFAmIFAw5UbuXrmG81Aqnt9Am9FBldjx37idqo=;
 b=k1N+7nNLGP9Aed3TBcTWb3Ce2va2u8rxoTy7c+CXWhosrfoolF7E3QD8nW7R7WYAEyCIQztNDhRVz1N3yH5G/u4ofnUULDMfecXs8OqW2/4cPNzDw17vMgo11+UVKmRUyyeh48DMJ6QJ0eNE6grEyOK+Uh5MwGgf3RBk24oj/nF7v+09/MIK/LDoXzVwI16Wzvbo6UcPzj5UtrL7cloXTaxj5O3WApRE6mT0ydBksNGUJM0nuS2mmQJXqgHtp81QNhd8+7HBVTz8Y0uuqYJY4xGdOPFe2pKVJxqN7sJSV4z1a9lEN4d4/tbdzsoWUuV1tSle7/alnDuETr5OJ9ki3w==
Received: from DU7PR01CA0007.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::7) by GVXPR10MB5910.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:150:4::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 10:30:45 +0000
Received: from DU6PEPF0000A7E3.eurprd02.prod.outlook.com
 (2603:10a6:10:50f:cafe::4c) by DU7PR01CA0007.outlook.office365.com
 (2603:10a6:10:50f::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.26 via Frontend Transport; Thu,
 26 Feb 2026 10:30:47 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF0000A7E3.mail.protection.outlook.com (10.167.8.41) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 10:30:43 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 26 Feb
 2026 11:33:01 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 26 Feb
 2026 11:30:42 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Thu, 26 Feb 2026 11:30:17 +0100
Subject: [PATCH v6 02/12] dt-bindings: pinctrl: document access-controllers
 property for stm32 HDP
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260226-debug_bus-v6-2-5d794697798d@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7E3:EE_|GVXPR10MB5910:EE_
X-MS-Office365-Filtering-Correlation-Id: 186bd62d-14dd-4df6-d873-08de752218cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|36860700013|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	tOUqQmLBEjRn18Ey+CDsubuHJ95AV6OSI0rloYTFPm50kkimaN3oxRPpxTGK3OhGJKtH/vT8yk4wFEauDF+RlOR8QlEfbzBhrE7Hr6B4wnpFrMx5Bqe2XNnC47u5tyeRgAHx0QQtXZ2eKTTyZns2+fBiAZdJOzq24UP77iynwxfcVmf6uIC1XNeqNvq/p6AOu66qkI8VLH9IJ40aRti3IextCnnM3nzcTBkDk205x/0/NGVTDf21xBvEsELitl/3VtT139ZL01GuYetkxNxhxBw4tDyfbPuH2ClF4X/Qx2G9gpNNybl3ryggnQU2JBgB/6VSA4uZM2+PGhkGMpfBPQXdt2keekMASkNewa3JZQU+zAE/wM1qmZ+ZVuQp2/X2ES7kkfRBZsbprFusviLpC1JcK8hrkddUeO0LInEqyni2FEjl+rMdhfjAHzGBfu0SiGE44O7+hkVeXvA0hp6yxopZ+lco21FEG5ktRDtnNp1uOn1XhttZI1nlvnaZFqY0+PqbwEtQsMR0BslBVw3EashJke8vj23LUrCnOrJ3YdoAPLJBA8jEXFzioprwsiNYgbEkybY9n1WbwW1NiNHuS5Eqx8Yy+6Ke15yUZVWk7OTOAdMmo5928fHH4OYGVL1Q825urpfKf3UoH5wZ/H9FYHa5k6YUxeMmut04KsNnKwGGKDXqKaeyjh1WMixDE8yt4ORGjjTTCnKRrAIbwlgTBfSS/U0NJ0dzqYUgDOHyllUUlkCmcq76xWao2onu57DOD+IcxvqU3ssYZuETDTKFSamQJUEYqUU4dszKNQ4cuMUCbuczYHkRbunosNAy+DYnN8IyBXZoudLQS6GkF2t7rc/elukX8Y5G8nBCSOZQqNk=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6saD+RoR3y7SO7vCjnb2baCIjMbpm4wnmp0w5D/wfes3UXgKcCgnWA+rC9Xi7mKMyXJne4DfJ1SPXMfLyxS/jEfbGjobxS3XVCdSzkKizPjyZk8uLeBfHKY3P09RgtVSCjstb+DhwGpN4eWuTvWzklfKu6quwAEg1m6803k6n6rxyGv8v/mCYQZ7KhszcHgXfX64DqNh4ZGgMqB7HkdryYdK/rkKKQMTR7KpxFo3g8P61Uw7QW7VdbpxdMHQHHQLZ1q/AnZ1+uWynTo5IfbpVMOqSran1SMTPCtDtvpWKtgHOfp6kj+8XG+s6uz0CAfmxrV0uwy8N6IPekE4tdVWdhieBRno5u2qwSrpTsGr1C+ddmA1/IcO9ZF5n2Ix1EGdjuVjPEO9L8mTNzSZW31ecex3JTomBnlcS9pF0srVXlL2qiaVW4qmv+C1cWmSaTxq
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 10:30:43.7520
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 186bd62d-14dd-4df6-d873-08de752218cd
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7E3.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB5910
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32212-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[arm.com,linaro.org,kernel.org,linux.dev,gmail.com,foss.st.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:mid,foss.st.com:dkim,st.com:email];
	DKIM_TRACE(0.00)[foss.st.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gatien.chevallier@foss.st.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: EC2F11A4490
X-Rspamd-Action: no action

HDP being functional depends on the debug configuration on the platform
that can be checked using the access-controllers property, document it.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Acked-by: Linus Walleij <linusw@kernel.org>
---
 Documentation/devicetree/bindings/pinctrl/st,stm32-hdp.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-hdp.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-hdp.yaml
index 845b6b7b7552..8f8b4b68aaa3 100644
--- a/Documentation/devicetree/bindings/pinctrl/st,stm32-hdp.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-hdp.yaml
@@ -27,6 +27,12 @@ properties:
   clocks:
     maxItems: 1
 
+  access-controllers:
+    minItems: 1
+    items:
+      - description: debug configuration access controller
+      - description: access controller that manages the HDP as a peripheral
+
 patternProperties:
   "^hdp[0-7]-pins$":
     type: object

-- 
2.43.0


