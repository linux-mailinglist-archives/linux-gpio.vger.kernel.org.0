Return-Path: <linux-gpio+bounces-32647-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOuuI0ufqmlLUgEAu9opvQ
	(envelope-from <linux-gpio+bounces-32647-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 10:32:59 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9345A21DFA1
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 10:32:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2ADEB301CEEE
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Mar 2026 09:32:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80E3A3264F2;
	Fri,  6 Mar 2026 09:32:46 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023134.outbound.protection.outlook.com [52.101.127.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4318F306B05;
	Fri,  6 Mar 2026 09:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772789566; cv=fail; b=FjYfEAOUU3X/h0cbnGLDGLoXzsa5ZmRgi7ybg17EjKKCIfFvlro5ggfHErsqQ83QY1qZJtPf1cXLrN/93/bwflH2RZolTyZ4BMD0/4W8PvvqljUsTZvKYvqkELVBD9LPW3LCTbYpmaNeSKhOP2QjE+FegE6iDVwT9936JJ/ajGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772789566; c=relaxed/simple;
	bh=AWW8nyqXHJV3FUhpYwPYazm0ImlfZcImC65uPSWLR+8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=b6sgIro3IGo+vpI/X8xc05OvVnCfAWsCGAuqcdXT7jv5s4l19xGHAIPa1aJiAba+TLT55xo+C6saDEuYHLlPXD8m+CJJ2YqmY3h/4vJC5ow/v5RbNSTot4lXmKMyp3rxhB5MH/Letprf8oug6pqxh5kD4qqo17L8L9rZIrb9IZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OfMWM8gm1/aWs1wDTMy7Vw/RSAeNIjoBCO8K/6cWGEl79UMbfie2H1KECj3H1Yx5UuQj9taFYSrVW0rGJwzXhXj2SiRLpf75M4jPKqz/tuTCsyTIWSv47Qmcrr9qnJuyiKQlFb6U1R4PBnrMwQ4+SEUod2LPc/ImEEo7EcPZAyCeNy9bpiKjg+UEvl4VO7j2sN06kgu5HZgANVmucQ7rxxsr5ATf2F7j75WMHGMeHnWE5zeHoUG6Nf3vlq4N91TwuWEXs7FNAQ4hQmj8yQbtuyWyie4byj7+VWEwFSHdeK+UDVulX3wqy1IGJMIeyE37pfPxrD3brH9XgnoG2bfosA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7rS24h4QB918GzpxTWAa+f1Sqx202ROJHuuPNhsCtp0=;
 b=Gi8vw8BPlQtv4DEpQ6oG1PPyXvl4rV04VJH9syK0IANvDBdpB0znCREsGx8VaiPf6EnDl5zPB+L8mvmJy3GkzB7Efvds+lWU8Bhn39FJaMXpSY/+DbRG22iR0Y9LwBV+7pdEo6wnTERRmPJUkCqe1j1UlsK79e92uBfkmQd+j8Cygf7MfgKzEH0Ox65q2j+zTW6iY4SM9+VTPd+ZiZ7VsTY4i05KUP5QyWdj2g+3w8EzbiTJNbvYAQAPvUlPrNHeMzO9hLEgG5ZewS7B6KLQkMfnOljf0XRS2XtXbnqZrPH9DEZ9VKpPsorrIRveOA+B8VZOihPpW+obGgxaIs2EAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR02CA0128.apcprd02.prod.outlook.com (2603:1096:4:188::20)
 by TYZPR06MB7120.apcprd06.prod.outlook.com (2603:1096:405:b5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 09:32:40 +0000
Received: from SG2PEPF000B66C9.apcprd03.prod.outlook.com
 (2603:1096:4:188:cafe::c8) by SG2PR02CA0128.outlook.office365.com
 (2603:1096:4:188::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18 via Frontend Transport; Fri,
 6 Mar 2026 09:32:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66C9.mail.protection.outlook.com (10.167.240.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Fri, 6 Mar 2026 09:32:39 +0000
Received: from ZicharPC.. (unknown [172.16.64.205])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 04A7541604E0;
	Fri,  6 Mar 2026 17:32:39 +0800 (CST)
From: Zichar Zhang <zichar.zhang@cixtech.com>
To: linusw@kernel.org,
	brgl@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	peter.chen@cixtech.com,
	fugang.duan@cixtech.com,
	jank@cadence.com
Cc: cix-kernel-upstream@cixtech.com,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Zichar.Zhang" <zichar.zhang@cixtech.com>
Subject: [PATCH 1/2] dt-bindings: gpio: cdns: add clock-names property
Date: Fri,  6 Mar 2026 17:32:37 +0800
Message-Id: <20260306093238.2715269-1-zichar.zhang@cixtech.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66C9:EE_|TYZPR06MB7120:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 43c93e35-f6a3-4d0f-1efb-08de7b634f7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|36860700016;
X-Microsoft-Antispam-Message-Info:
	2Uhv6sMKyeUebJ5r99QjQUXOSzkS+8PQq78fNIb9n8sMUmDiw+8Y9UbIzJYdHx2zs/1umLv2NHbJVmYK2O8hnchaOkGECDLwX8btpSBHMD2HcpwHDcfd7zex+H/8zGkCWqszpOCyMpp77P1hxIFPJiYnsju2VNF6jafz8l6kK7iUPVM/zaaZmqMDpZikC0iS9cdK4hnXm7UMyQGxFzkxPTIjsziDUxZDwssuaIYhLugvPrPEIMAwdbQ9eve9/jnf8zF7wIW9dAF0q1oW3s4jtev5NDR0xF3jT7scYx6OmIkn92WmwOoSQI+bFQCY6QXju25EZYO6IKd6gVcNaS1OJcD8PvSuDBuDYM1MIwSoKxwyD4omOcMaE8DUBvf+eNyTpQZj7vjca7FkWwClR0FGGZJY2hkl5xAoJ4lqNQ/ghaoDI3jHGHL5lslEQmBMUjZuAFUFIaWINXK8DMFP8skKEgHkj5EqsfcQik/slHG0pt0zhFXJZluBV6GgjOEzS7T0bTf18yRjzmXN06/AxWwidpsKowbcS6ppf0ULY6DrJNvvVrr3XzsA1atfx28dE8X/Dme4DG0CYMxfGN2vmV4b7722VLwMGuzW6iT3gWirz4WrVebF383XMLKzO8x4HIDf0PIBCQIlRwsOwIDho5+r9Gg6Z3VASesVSDkKC4af+ES0wGJtge5P3zRg9kH9CfjnVHMwOwOdcz45VwHnZLnQet1W5Bd1NPRM6N4GQR5S8tTty9IP5lBOW8uSGS3ZYevgMCObJuxAvjnIL4AxcVeHKQ==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5ZmG6w4HogLtCZ5XKLJo1cbWP4IhdHBHxVXfozLWSkxLStY7ZPzFpBQOVFmgd5UtH4i/A96Q40WYn1aisnsiDpYhFXUNKK7v7WwF5AGPjfsvVgO5A23I9x7aENVbjghNlwj3q0O1oBPSrG/Wj8ghzsbNyKTA2uaPDpBwlY4I50ORkZapWXQWICgLrCcNwin55pMZ4NAO7wRUMZlr9RDFcDhgFOPBS9PYDijKBu2dWgNNLSovIgrKHB5cwy9iUp41zRFgZBI8jgfCTD7rQQecfKO67chGTLe6kLF7LRp1K83W8alHOlxtsbq/fRCucVd4cwmC+Yig6PiV1Law4aghfahdN/qS6UBL1/U7LRajNz1U13f1k3QZUXt9mV2/K4rCD0lbwVb8igl2F4+p7TdOLQcKXwMtI7Z6F75IXsCb0BLJiyVUfNPa+Y3b3YF9aQ5/
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 09:32:39.6810
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43c93e35-f6a3-4d0f-1efb-08de7b634f7d
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66C9.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB7120
X-Rspamd-Queue-Id: 9345A21DFA1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DMARC_NA(0.00)[cixtech.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32647-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zichar.zhang@cixtech.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: "Zichar.Zhang" <zichar.zhang@cixtech.com>

Add the optional 'clock-names' property to specify the name of the GPIO
controller's input clock, aligning with standard clock binding conventions.
This complements the existing 'clocks' property and ensures proper clock
handling in device tree descriptions.

Signed-off-by: Zichar Zhang <zichar.zhang@cixtech.com>
---
 Documentation/devicetree/bindings/gpio/cdns,gpio.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml b/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml
index a84d60b39459..c242b31edcbf 100644
--- a/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml
@@ -24,6 +24,12 @@ properties:
   clocks:
     maxItems: 1
 
+  clock-names:
+    description:
+      Optional name for the GPIO controller input clock.
+    minItems: 1
+    maxItems: 1
+
   ngpios:
     minimum: 1
     maximum: 32
-- 
2.34.1


