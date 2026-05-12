Return-Path: <linux-gpio+bounces-36643-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJEAMqLEAmp7wQEAu9opvQ
	(envelope-from <linux-gpio+bounces-36643-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 08:11:46 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 689F051ABEE
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 08:11:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 96E4D3007895
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 06:10:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37C4F47799B;
	Tue, 12 May 2026 06:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="T8LpwkgY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011067.outbound.protection.outlook.com [52.101.52.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F3343CEF7;
	Tue, 12 May 2026 06:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778566198; cv=fail; b=kU/5M8o48OWHCG7J8ZWfjtovvN1GHaM3mMRMXBu77s6A+RTlgsfx2vZEKRdxvwuY7GG4VCEAg/ze5UsajbihHW5euFMVg2noXT1ztjlZGiUG9Q4oOzBZaMPPFwQjgCIspBCn/ECq40bHk29mw/72RnC8uhuJuKy7cCus94HTbgA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778566198; c=relaxed/simple;
	bh=Q67NjuuK3AIxvF0y6P3XvxSK0WhRZ7kZVeDGa+35Jq8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=G0/niId1vY9nf69+07mbHqdHPUlAQehwVD5Sc5IZ/s8EMQaEH1e+KiZnkKFtZjOx7QaI3XCy3G9hYEIrRE5u0AI1/lVAly2m/5uTNjE0jjckJ1Fs+983tPIvUzSXh940hLH4IeeJQOAt6aeWVLArr+02J3qR5s9tLyDjHKduPHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=T8LpwkgY; arc=fail smtp.client-ip=52.101.52.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O3hgy/7/wpT5gqPnOZbG6iQHY3OtWfxY1O3Sbh7OHxhiE5P2a+ddHr++vSAtwMzC8eo98upN7i+QQ67cOpMKMOdiApa3SHDT9IdOFhJHiBZA05WaWuwtKNuBnJj48It2YnGW6XCZx6tZn8SoA/YBCUDJxtV1CIiDrZJ3pU+m67ayxL3BNayATxTzF3n27JypZPlRUU9N4vjnt22Qw4hKV8el4TbouPl4urV+JF4WuVqNc636qusefY2GzRLeF7ZiMtnY3qzC/e/cJR3oHETN4pg1sqODChj39xyfPau98rGteHjYKXWSi8LMycP3af4vuH6gO5nCHKZ1cKK4+XKEgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yOzPw2XHxTwqLzoUDVZZqZpynWy4hiiH87kEXUIJuJM=;
 b=eh9yZySG+M6F08nF4jGZHST6i7VB9Xe2Qif6P2skk7QLw4Qn6VCNICrXdJMX9ohfHxZG14EnZrGVgxSnR9YUWSqvLHNSJIofiVVplJlnrk1jVFQrcq3iXjO1gumPjGpTHfggLO+gtvL8bm6Y3r8y3IQn11FXLEnq/bV4qiQEfdTszerzoqvmYdZ5kuVLsqC5rfq/HLPaKD2/mFQW6q/rLzeoQuXjiluayK+WrpIN1Voe8fqcwHaVT+FbaArrQf7sAu0e3Ofa4teQ7iPe6l4/KmhAzlBtxHzEFgrilFYZZnFjHDdKOYe8Woshcl+qObY+ZHxrlNeRu19m/b+33CT7sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yOzPw2XHxTwqLzoUDVZZqZpynWy4hiiH87kEXUIJuJM=;
 b=T8LpwkgYQgjoGayI8L7Nzg7AYyRmbVXoO6NYmzDbtRZM9x4Qpu/vaxEVTlLkSVVoA63H5UNg43/Nkr+4PRRqOB4PabfNETGRDN75d/1e9VVsL/NHLzT0Uz13hp0rIETD8AFqISIcu6T7qgfUvPmxktgwl68inc61lCK7NK4LKKo=
Received: from SJ0PR03CA0237.namprd03.prod.outlook.com (2603:10b6:a03:39f::32)
 by BY5PR12MB4193.namprd12.prod.outlook.com (2603:10b6:a03:20c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 06:09:27 +0000
Received: from MW1PEPF0001615D.namprd21.prod.outlook.com
 (2603:10b6:a03:39f:cafe::b0) by SJ0PR03CA0237.outlook.office365.com
 (2603:10b6:a03:39f::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Tue,
 12 May 2026 06:09:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MW1PEPF0001615D.mail.protection.outlook.com (10.167.249.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.3 via Frontend Transport; Tue, 12 May 2026 06:09:27 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.41; Tue, 12 May
 2026 01:09:22 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 12 May
 2026 01:09:21 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 12 May 2026 01:09:18 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Shubhrajyoti Datta
	<shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, Michal
 Simek <michal.simek@amd.com>, Linus Walleij <linusw@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v4 0/3] gpio: Add EIO GPIO support
Date: Tue, 12 May 2026 11:38:46 +0530
Message-ID: <20260512060917.2096456-1-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.49.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: shubhrajyoti.datta@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615D:EE_|BY5PR12MB4193:EE_
X-MS-Office365-Filtering-Correlation-Id: 532c60d1-cea9-46f2-4142-08deafed05e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|7416014|376014|36860700016|18002099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	xBx7I41X4cR7v+oX0GCH2DEXmusxI7GmxzYniNHBTrc7oq20i4m6L7X6opjY16jFxfCGJrFFsZS9teTUZpwVo54+Jkc0CM79Bb5Sq9Fb8UALa+tjgxPUeDFgRxveTeNk7gge9pc3SAA2hXZZFQ2nLk1g+U07m3yIRhS1SOTostNgleoRiM4Z/zqOTQO2X0oH02V57ZL6zKtElAgbWNOVbWXVHn/pdenWXgj7fNNdQng0H+vP8hp3wJq7Jla8Fk8SluEz85wj7fojT50iAIElfsm7odZFvfqurVr/waPbnKZDr4vjPUR+7lP2jJXHlh4Dh5Std56CT0VUCFIFycnZQ6D4R73JcMq5pvSJSAC1iC7hUfmrtDXidbOjUd4V9LcriMZ9QPuB2xv9OgJW0c0HwXxq2ciiuUTvmYfBFwDS5CeSfVaisWd8U45egAZdsWikT+h+Um6B+U3akRrZGrz2xGmdGWeUgyVDrsiP6N374RcPePJ9tFYT9KGfA7XsatSsEZXNUf9nsAbBTYprLBRysmpwCV8ERLds/rOEYkn7ATVT+W4NDcfRgCjt5CO/8tpIqeiAtd6GH0++ensaVnfA5sTmGUHsV09JsjoFzFxpD2HD0WHyjROPRMlrbcCdJZpOF0sH8v5PHEdw+uN3ymiCWkLzbIZ2AYXhS8TRJUM4b+C+JxGCSthj+Jy7O2wBABFDV8vFy7PhapX+SlsODRF73zAUsbw7uZVCd7YVBGVNqUo=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700016)(18002099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9v9r2C5SoLtA3lC77PUOs59nJD7BonmafEmX7VySFNrWNYvvz26hjtd0l4RuFSY6TEpGS6AgPxZ8wfguV1XLS9NWwSh4um/LXksrmumCtQTBoYaqI2ndV5dmRkJrT9I6ha/Afw33b441XimSTpSAmAlrHtUGOCA71zl5+wbmKJtGZNEVmimjB12EOGU9aSytnej6yPagybyH+puW3Uoh1Wqt9j468H9C6WEqOsWYtoZ+cK2CTMqy8l+Nr8Zgq0D0WABWckoe2rO6G04BlXMF1qIEIGwFttpiMEidEHqKgnleEZZ75ALSgxLhfSioonbNCxaMd3uh1UZENkbvDFsYOTrFKuX0zN2nNr4XZ7+Oiu7RWC57D6TARXJb5+/jT8Q0YboXqv/LLis3BtIgTf+y93jKozjwjuwbHmZmYhzKs628c105KIdDT470fPvM/KrO
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 06:09:27.3142
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 532c60d1-cea9-46f2-4142-08deafed05e9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW1PEPF0001615D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4193
X-Rspamd-Queue-Id: 689F051ABEE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,kernel.org,vger.kernel.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36643-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shubhrajyoti.datta@amd.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,amd.com:mid,amd.com:dkim];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

Add the EIO GPIO support.
Add the dt description and the compatible to the driver.

Changes in v4:
- Add Conor ack
- Remove the min 52 for eio

Changes in v3:
- Update the commit message

Changes in v2:
- Add new patch to sort the compatible strings alphabetically
- Add description of EIO block

Shubhrajyoti Datta (3):
  dt-bindings: gpio: zynq: Sort compatible strings alphabetically
  dt-bindings: gpio: Add EIO GPIO compatible to gpio-zynq
  gpio: zynq: Add eio gpio support

 .../devicetree/bindings/gpio/gpio-zynq.yaml     | 17 ++++++++++++++---
 drivers/gpio/gpio-zynq.c                        | 12 ++++++++++++
 2 files changed, 26 insertions(+), 3 deletions(-)

-- 
2.34.1


