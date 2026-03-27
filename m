Return-Path: <linux-gpio+bounces-34231-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id y9woJ2YQxmnwFwUAu9opvQ
	(envelope-from <linux-gpio+bounces-34231-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 06:06:46 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DC433F34D
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 06:06:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6BF013034B10
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 05:06:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6DB1322522;
	Fri, 27 Mar 2026 05:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="DjZJTve0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012001.outbound.protection.outlook.com [52.101.43.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D682D8DCF
	for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 05:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774588003; cv=fail; b=j+CP/q+Y7KiRGVyGotdokeqQckm+UKHecBMPpy1y07SEYpsyNuVcM/vG9Xrh1zg7lNvwvvTqdxCquOex3UPMKA0ZRXMfm4j+aFCwR6f9rzCn+k9SbhBn9oVG1RAV/zFqIwq50Ai6n3gWjYyAp1WRRkwubx1SMGFXDrCFACe4DfQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774588003; c=relaxed/simple;
	bh=zd9WS+2FfBpt76rRYcxIZkV/HgAox7xOkmeFppw+cXc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MKU1ywkXddZIYVLEKn44FOs7MK1cPqybyIFFlMC623RLNq7oSC2YoUQDPQFadl81bJ/ov9p7FFgEyJchvSiB6LHpko30vUNd9y3BjG4gNBalo+2IzHZmyeAw4FoCSUklLpzTsr53X7qvCU1Os516r4MdI7ymct1EJrHBPp4NqCg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=DjZJTve0; arc=fail smtp.client-ip=52.101.43.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HP3b79FhNlhGwYhVH9yB43wjx/hRZeh+YcccWpaGaT0HhglhaC8D1Xjw8l/56oQ7gsAofTAEB9epXCRKtuJe6toRV5uN4A3S5XKMcK4eFMiXmT++/qyJ2LxFSZmaK6w0wsMON2/Mfr8w8FajOIyN+HHda9I2QLD+P4H7V7jPIXvIVzSH8a7dekR3NeM74lsJOX6kp/ZsqCh2J0Ig3g/iBaJcOzjEv4hPU5telaPkv5yiCkUgeyfn75/cZVJSop21mjjsLD96HkTxbmBQcN6BdLDAH8Q8mqWy7HilxbDPMPM1ViReEzdtDvvZ8TkZNewZ2hdG2aRv8dhJIjOVCuzqqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0H3UZ1qoeFffYO1sFgfc/bBqDUGjzs9QHHfzBHtlV9g=;
 b=E/PkOxzGvLlEK2XcXSXNnoR9x60DJCa+3h0Qx5exGUTMf/BhfKJ5pDf9jFvFNy4tMufQcXQpZlGeLcvyEFbh/WRJEfgHuv+wxtihBi4wFqQxfzIbo15BC5l8SLFQIUdzDgaznvhNy7ZsIoU7uedVeth6SbrqpyViAixL/xmeGwKxquu/MDpLAiJcF/RWS2Wnkc4Wcp4Y8B46X9RjuC6R1R3YLOgHdaggB4zaraPFYWjL8sulMfoE2WsP/N9Hmk/z3VeGNUBpbhgzjE8CTMOmfw/ha/CoBDM51a1phAMOvznL/uAc+gUjpkslEGawAF3reECWOfHDzqVHnD8SqAe1nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0H3UZ1qoeFffYO1sFgfc/bBqDUGjzs9QHHfzBHtlV9g=;
 b=DjZJTve0y2gmmCpOkKWO7RbZb3+QS4FgP5ThIk+yN9VBN6aoeZcwtsA+ClmxSW01eMHnpd3bZ0UsMgO9syjkBFHDWC3iPHsAw3fPxfEsesIy6HTmvs47n45oSZ4sE5HdqpjGC+Dli/ujWw7lUFZev6mA/Yc91fFxSfmyWDgLEOM=
Received: from BL1PR13CA0096.namprd13.prod.outlook.com (2603:10b6:208:2b9::11)
 by IA1PR12MB9737.namprd12.prod.outlook.com (2603:10b6:208:465::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Fri, 27 Mar
 2026 05:06:39 +0000
Received: from BL02EPF0001A102.namprd05.prod.outlook.com
 (2603:10b6:208:2b9:cafe::4c) by BL1PR13CA0096.outlook.office365.com
 (2603:10b6:208:2b9::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21 via Frontend Transport; Fri,
 27 Mar 2026 05:06:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0001A102.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Fri, 27 Mar 2026 05:06:39 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 27 Mar
 2026 00:06:37 -0500
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <Shyam-sundar.S-k@amd.com>, <linusw@kernel.org>,
	<linux-gpio@vger.kernel.org>
CC: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH RESEND] pinctrl: amd: Support new ACPI ID AMDI0033
Date: Fri, 27 Mar 2026 10:36:16 +0530
Message-ID: <20260327050616.3816318-1-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A102:EE_|IA1PR12MB9737:EE_
X-MS-Office365-Filtering-Correlation-Id: ac4aa3d3-5a18-4f81-e908-08de8bbea106
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	tlTlw0DwcxerAeJBdTugdFarhp9q+kiuD+ao3q/UyTFn3ueUcenZVySC6fqRtExKac+qwpB6jul8lyCAyn8aL6huS/U2exuqS9O5qpo58/SweviYAZSn+eD8I2MEpaCe9Ts7BV6trO+V8t7Lo5O0VjBr8Bzalsv1HcTybFv+2rwlp+zSr22zO2Pbyz1p3qjz7L3Tyg1uDDPX8tDAVil9vyMJ+FkAS6KOvdORvk63L9vdU1KiGGE8pTbyQ/XzTkXR5SEoPMLAVsLNkOKrECBzx8Cl7rbHur4mQXCqEP3zg3/tbpkXX5sS96gAvZbCuyRVZejrjiUKUMFQelBxeXY5Mc5+kWK9I2rBi8f+BIubUCoL8CQvIPO1YpMYLeOzsmteoaaIgr7yEcmOZTrIJBLgyYfHESF1W+a2xNxx43eQ8n9zsrPBN4PZNqbGd/JpdGhxQsBho+U1+YOTPjOLHPAcvmAqN9C3ZTEvN5MSl6MV0YMBB2jIEbszTX70tT7g1oc3s8191fZWwTa49XSpPoNFa17vna3wFnKYdLymtAdA7etq1ltebohUkXkriKImhA+/Q3q/N4uUEEVJ9ZrokTl8Z8aXjpFhMTZhQyvUWKoBNv7NuxKwXwSfxyLoLFAMttbR43BrgytoJ5MyCJONhiBU7i0lQhhp2MWKuzJFmEBV3Qp4q/b16NiYPqVwHITQJ8kjAEoMHo7knQPeXvnuQ5Oc4ha6C7vzChwK++2eCVh0uSK+Dzaf3cH/Dlsk4zd7Ucb0f9485xrqChJ1KUFQGd0yKw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GbulwdUUWwFyPuWm3jfwfu00nI6s+czNUgc31lV/lPdv1/cgD2jQR6lgLSzt89TrIQQDdU4nsQRQYL2YyTIIvUQa5Q1qr/xGlrscIdbrXkjwwTRb3rkhnNKLVkhXlBxY3J+3sIfx9CvnZuIrhMmeuc0z2SzW5KGmMUbm/8xGrheoSzwY2o/F5rEYzDw4dl2UGS6SmkQ/7+10eSSQ6A/nATUrzRV5BTCBIV5zO+mCkYGhKVuuaxARD+6aSCxZnOantMc8PadJlDlPBil40VYRrfUy4B30Ky3HN3f1w6UlP/ai7ZcueD3IkeG3DBndABTGcZz15RJxZVmPpV01vYlS+4apdq/cSFyh1pNUG3OYVOezBUeK1oLxlC2VKk9M6wY9HMnOJtSwYVGQtyazYHFXT+iSlsb/Psfzar1Exl+4t9DxO96fBpadhEBLhedmuYnm
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 05:06:39.4396
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac4aa3d3-5a18-4f81-e908-08de8bbea106
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A102.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9737
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34231-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Basavaraj.Natikar@amd.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,amd.com:dkim,amd.com:email,amd.com:mid];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E3DC433F34D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add AMDI0033 to the AMD GPIO ACPI match table.
This lets the driver bind on new AMD platforms that expose this HID.

Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/pinctrl/pinctrl-amd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 2af94ef56434..e3128b0045d2 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -1274,6 +1274,7 @@ static const struct acpi_device_id amd_gpio_acpi_match[] = {
 	{ "AMD0030", 0 },
 	{ "AMDI0030", 0},
 	{ "AMDI0031", 0},
+	{ "AMDI0033", 0},
 	{ },
 };
 MODULE_DEVICE_TABLE(acpi, amd_gpio_acpi_match);
-- 
2.34.1


