Return-Path: <linux-gpio+bounces-34230-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eXYJOrEPxmm9FwUAu9opvQ
	(envelope-from <linux-gpio+bounces-34230-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 06:03:45 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDB533F33C
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 06:03:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 743E53021E53
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 05:03:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 672902D8DCF;
	Fri, 27 Mar 2026 05:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="HHoET7Oy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010011.outbound.protection.outlook.com [52.101.201.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E466E215F7D
	for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 05:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774587821; cv=fail; b=seSfZB3FHUI13OL6T7KuaQJzEzFLBMOuXT1OIgqONPbSsUWJQ22cyk+UHsKXHyaJrENgAcchvLjT4nBnGlm9nX4hnAlPe0q9vLwEnTLbEFRDKxWWiYMhjDV7G0z2X8/SspiRol9JEfxlgi1Gddlu7NpFtdi0J/71cWTRI2Ct03k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774587821; c=relaxed/simple;
	bh=zd9WS+2FfBpt76rRYcxIZkV/HgAox7xOkmeFppw+cXc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=arUgZQ1eIrN4yvcQtzMiHjpSS7z51vNXNmRCJtmxeFw9CskBp3kkvtlU4+yy8nwok9jgO6s/AP9U82pthudHyQA29K/acRaaTKxhS+eVj4wXA56bfSnrFT/gUlcWNaSrJK56xoHFVtH9p8SQx3Kv6Tj4pnVOmmPkXSCgr0xyAW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=HHoET7Oy; arc=fail smtp.client-ip=52.101.201.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FYDOgFtoF0I1AKxSViDsue8uKp60thwiETkq6rS4m+IFzSssuamj5P5jY1WsJikxQMnxYVNdE4fMbj0r7HaPe7XhMFo3++SHdK4ZlQ6Hbbpw7cR4rNs2OM9WR2GSTquaDiBBvs8JlaoavTRvQqT+o5up+2NHjciAK1uhrV1zCw2YI4Bsr3+ndhLhcU5EoAv9Ol+GbSlzayXNfHJUH/v2i1OX/E09VC3Qv6bvwM6ED5p2Z715ejuwrLt8/rJCfQ0Wo3zJKQjrArdPS9usXrH6P2Tw8fH2x1gVSAzvVGIq3YduK+nU+7sueTZqRrkBcLgMky+hC/OLgmPWMyXAsOG7YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0H3UZ1qoeFffYO1sFgfc/bBqDUGjzs9QHHfzBHtlV9g=;
 b=ACI5zYIkUHQx/F6WK3KvU307gn4Z/AEVm4y+DJYNJhGQ7RZy7ku3j5CM7FOmG6At6H/OGUk+QbfCzFY7A71NrA4WFTyJegXVqaAfzRfXz8y6bQLtEuft3S88xqE99RQtOadqzcIwY1M0YPAUoPbfgc1muVLjixhZGtACzZPY77EjN/sxZ1hjL1A3RbnKS+hRU21SKIIeuYNlh3G+a6yA+w+SfVumpwQg+4QiAcdZzVRxiyu0ZMPZ0JIAxsCcSOmrQvu5+rO+lfBPiSQN8E3J2K9ImYaj76EJ2cu24x0qHvi5bbDs4zhqEjHYTxKQWZviedOzdFTV5ucaAShucMzIvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0H3UZ1qoeFffYO1sFgfc/bBqDUGjzs9QHHfzBHtlV9g=;
 b=HHoET7OywJh4PPA/waTyjWJvdm/9S/Qi5bsTb2IYHYSVoL7HTEg7LZfD8WR3TCW4Vh1soXL39mKhvZSivbbMYs8TVu3VWg6/NhUZ63zQlnvi65H3b+xIRSGLW4Vi9+pWiJP6MzT35ewJcKA8aIoXcO4c8gXs1DHWPUnfoXMsLtM=
Received: from CY8PR19CA0018.namprd19.prod.outlook.com (2603:10b6:930:44::15)
 by PH7PR12MB5999.namprd12.prod.outlook.com (2603:10b6:510:1db::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.8; Fri, 27 Mar
 2026 05:03:32 +0000
Received: from CY4PEPF0000FCC1.namprd03.prod.outlook.com
 (2603:10b6:930:44:cafe::c7) by CY8PR19CA0018.outlook.office365.com
 (2603:10b6:930:44::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.23 via Frontend Transport; Fri,
 27 Mar 2026 05:03:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000FCC1.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Fri, 27 Mar 2026 05:03:31 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 27 Mar
 2026 00:03:29 -0500
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <Shyam-sundar.S-k@amd.com>, <linusw@kernel.org>,
	<linux-gpio@vger.kernel.org>
CC: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [INTERNAL PATCH] pinctrl: amd: Support new ACPI ID AMDI0033
Date: Fri, 27 Mar 2026 10:33:14 +0530
Message-ID: <20260327050314.3816219-1-Basavaraj.Natikar@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC1:EE_|PH7PR12MB5999:EE_
X-MS-Office365-Filtering-Correlation-Id: e6c0e71d-9804-4067-c919-08de8bbe3155
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	3pY2BMKpXo9sILJTnYCHOkUSSmSUO2vbzPK0JMrn4Tcm+GbT5KBGfJnfRHLmNZNoEQ05PQ/0ds80zarkeqW5B+gIOEQxusNcojBE7tnAvsLqnJazMuDcZMdGNTfPwd6HW4eodcfUz+P1DQO6iGO2gScCLiSAnC3K2scc6KOhsvir1afTziFHq4JBw0x7GjqOLb2dgYkQmvN0H09tQMdZAd697R4//FBaZokh+9temI4AVu1hT4Zbl9YvnAOEMoDFnkclZJCoeQnVK5ELsggUg1TGHf93SMiRZ/hld4Eu9ekTdEn7lln+2bGsLGqB2ARGekxhXbvNOnIrsS4qAvFZlQmp5cKOqbvp0N5H+jpr489j2ZjiGT5JATCmG2UdGIUTSlxLUr1ztX38a6Xdl20zMoH8rzdNKmLjicad4DkuEWfd7GqDDEBI3i/5aRYtamWp9bDvbpN5gudRJdhF4z8ToN97fGkOwX79bXxbNyeBFUDUABnlfUI8WQ0RqAq84fpp5KPUVRUvdGif7JDo3PVzZBBfBpk91Asx9BxGV5ZudRVeojJ0AMglm4W2WdIYXpdZxAlsqDViq0Md2HGPSMJMJ9TR0P0GUN7vwiuaEPLaUqq9iJ/UmRZnZXvtldua9eIjAReDKBlOAQuu3h0i49yYAyuIlem4bweM7LwRueuDomGK11hq0kP1IKYtNhMPvC8y+Z15sHbBBFE0o6GitzyBT6wmUrh0LCzmdJm92gUoJjTtGFnYJ1avu6KxyahN0cDrD+phnNmdBEfRfe3Bmz55kw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	B9h1eUaVGMyYGyu0rxD2EXzkJzmlcNQMSBX+MouoL+TEWaWlpc+WoAxwxjoQQ4WFqnaSXpxWa7VBElJmYrthIAq3TfKvSfI8BUdAvyEHFDvbR0JX0PckOxHS1EQesl4c0MEAxoTujrsRR4KSJ9AEPoBOj+7ZcypBsODkKew+O7o/3cLHWYjkWdnw2br9R8TTpVP4u0RwG5bPSodKjbeupJdvaLX5kyJejU7gLwm5sBYaxZOaiMAhMd4DOeXY6w6ZGc7duK4AlVVHej7J56XdY8p8osudA/xaV52REyly/Q7D48wnh7d2DtjfPNYExsKACjBZHED/JxXcBpFIde6yKvxpu6JgUSyssra3sMh+Q/D8yANmuxZHMp6q7AYHdrBBMN930P4hnlnEzSW9frdR+GyKiG8LKs5LP6utP51wZHKqseqTjGGIj8qzz6rkPmVB
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 05:03:31.9812
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6c0e71d-9804-4067-c919-08de8bbe3155
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5999
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-34230-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Basavaraj.Natikar@amd.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3FDB533F33C
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


