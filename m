Return-Path: <linux-gpio+bounces-30962-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6KoWEEgYc2mwsAAAu9opvQ
	(envelope-from <linux-gpio+bounces-30962-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 07:42:16 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B74787115F
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 07:42:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 12178300681A
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 06:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D74B332EB9;
	Fri, 23 Jan 2026 06:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="c3hHGhsu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012027.outbound.protection.outlook.com [40.107.209.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB3F2D6E61;
	Fri, 23 Jan 2026 06:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769150531; cv=fail; b=lMXnJisThZXIxicXIsZRdtEHw3mOm9FGETR6giczflVzrt1jZfOOjEDeHXCeJiMKUj2FRt5tzFJj7UroduHxFcz6wNHhukqw/DU2HTAhcKNAJQwq5KbndOiWCrTkvArVqVKyP6RTyxaNnBH1Bjyt2J9JVyp49eXbu4HSC1+oBk8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769150531; c=relaxed/simple;
	bh=EWXH6lhsYmM5OQ6pKNgPpkFmjN9yvA4UhiRsEF1PdYc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=i25IuyUJsr0W14AQ1qrMcSi0yXZlCAkQg1EEXTZmWxVKOvVtbhrZHT47oRTLZtTuV2vpJ1Ala9NUfFkrACsUl0C223VchY5vKjolkgn3aO0WOaMTnc61Ju7rT1bItwQZU36aDENG0F8bllTDvJj96MM5Z2iimEH8xOm/bwPCmp8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=c3hHGhsu; arc=fail smtp.client-ip=40.107.209.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L7PEVRCfMrKmKQxsUckZV/7gvUwxGIZVPb5ewIGg86MbaBLifgiQ5Sn2c4E8ZA4RjUoEb2YLwfee36DrZlDLDuW3YhpBR8z1TSYBNCkh7EdxODSdBkWulbeOLoJqE8Df7kzOcu/UwbnWC5h8pw9oMUHtVv+UzfIV0mc0JuHPgiw8WR1vIDaNEEdko+p3Ao0fqfWS1Qm43UAKNFU80uhdPgikxjC1L8Jkhh8OjkzQTGU5HE2WgT3yQ7RfLEGWx3OC0nbRVNgGCRJ2px5dpySrmFlZLsy9W+HIxR33Dc1cui3+cjJkTCIj2cCHy9uyPF3yGxuNjQKufNCpEmzCnxMsTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hGTDCoNaHgOdbALek1LUUBkrqbpWC+OUyPmvM5GeUJE=;
 b=rIYp1UIFLfed/cwivM9UfG1hKVVlSaYyxAJBh9nMKdRANZD6mI1jxFSYPMShP77Cm+Cea5lVwtzh4B3jpYmlWaejpXoDdZuhC/eBgGeqZMFoq83f009PxJtFgVsZuFoHcHRzWxVgNAnELkuU2KMjq1jHS0rozbkR9tIHZ6YEuFXKl6z37GbsUjEA/IXWhyoeR+PPVI//PzpHXegKz7Z+684tYTZfp8F8mj0HrF/NbtDSV7U5SBRIVD2bZvbGxZ8wPY46voVMjGADfgXoPo0YmOxITm3ux9MvJo+snTX0gMfeQsip3zo2j4CID9JC9w9CSENG+fd0DOxleyd3Ue6rFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hGTDCoNaHgOdbALek1LUUBkrqbpWC+OUyPmvM5GeUJE=;
 b=c3hHGhsuX6DY9f6R2pdeEZ9g2o/frhtHsMZqe0LTSDtOB8bzfJQazXwjGtf9JVg9i9YFfb2bTHXmk6hCsOOBYj0jndybItx0UvMwFFt9zBawEgvoo3wEQ7Zh7ntPl3qN++At6x+ZI2XRXVjsKbyBkZXbq6KPAmCFquwwgjp/5sK9li+ds0DPqnk0ud1gMW4V/9ysHa69qHiXcVcTZtL6U+nccOP5MsRIJ9lRHVlsjfh+aTdyIDQ2dDzwibUGTcorf8elyxFQJESya1xPCc2yjE6KtUhI7Qq913i9FqToTc0P39FziJFgw9qdig4gdpALSrxaSkFfK+T4B7x4fM/ocg==
Received: from BYAPR05CA0091.namprd05.prod.outlook.com (2603:10b6:a03:e0::32)
 by DM4PR12MB7549.namprd12.prod.outlook.com (2603:10b6:8:10f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 06:42:03 +0000
Received: from SJ1PEPF00001CE4.namprd03.prod.outlook.com
 (2603:10b6:a03:e0:cafe::ab) by BYAPR05CA0091.outlook.office365.com
 (2603:10b6:a03:e0::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3 via Frontend Transport; Fri,
 23 Jan 2026 06:42:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF00001CE4.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 06:42:02 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 22:41:46 -0800
Received: from localhost (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 22:41:45 -0800
From: Prathamesh Shete <pshete@nvidia.com>
To: <linusw@kernel.org>, <brgl@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<robh@kernel.org>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <pshete@nvidia.com>
Subject: [PATCH v2 1/3] dt-bindings: gpio: Add Tegra264 support
Date: Fri, 23 Jan 2026 06:41:38 +0000
Message-ID: <20260123064140.1095946-1-pshete@nvidia.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE4:EE_|DM4PR12MB7549:EE_
X-MS-Office365-Filtering-Correlation-Id: c90e9dd0-66cf-4f68-3c76-08de5a4a844e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q1ZyYUc0SEE0V21PbDZIejhQaWpEdkhIQkNvUXRyb1hUSEc2eE9jWDJVblp5?=
 =?utf-8?B?dmJFYzZtWlgwN1YyeWpJTXhoU2Q3Rmd5ejE4b0JmRHFobWRCbjkwMVY0Qi95?=
 =?utf-8?B?Q2s4NzhoK1NGVytBSDBlbTNoOWlWOTQ3RlR3VFpFVERiZjBTekx4eEtpREI0?=
 =?utf-8?B?eGc0TklpNUlBMzA1RWtSaElJV1UrVjl6SjNYckNwS1FoQU5VelJONng5T05E?=
 =?utf-8?B?amh3Mk1SR1VySVU3VXJ3QVdPRGNuUzJYbmRHSm9DVDVodXVacURqVkJiQXNl?=
 =?utf-8?B?YmtFOXlFNU1xVU5ZSVRFYUpqeHExa3YwQlNhL0NoSms0bFBiMkJSSHh6VFBx?=
 =?utf-8?B?bzJUaFBGWlY1WUNtY05oS2labmxSTFFpMlF4alFnMllXYk9FK2ovVTFEN0J0?=
 =?utf-8?B?aFJCV3hUaHNnYnd2VVp5ZGJvUjRXK2dqWVJUQ2d5SldzcExFTEhNVmRBbC83?=
 =?utf-8?B?bURqTG1xQXExYlJIcUkzNFJGUnAwenN1Y3k5eWNIUjhzb2lnOHlIbHYyZ2V5?=
 =?utf-8?B?bCtLaEtzdWd0NFhYeGp3STdSa05YL3hnRG5qMlV1VjVVcjlBQlFDcUorVnFT?=
 =?utf-8?B?SjhDR3VmTjNaQzFhOFBqSFRCWXRSWGJIU24vOW5ZL0tXREFZNWlucURvb2VU?=
 =?utf-8?B?ckdSK2FLdlloMTVGelBLNXZWKy9CN0FZeGFkTEpISkVCTGtZQk1GbUNUNW1y?=
 =?utf-8?B?c2IxZS8raWxmQ2s5RnZnZldGN3MxUXp6YWNEWFNZSGxvMnNXRzJsNTVkbGdl?=
 =?utf-8?B?cDk2S3VDU2VUZjVRVlc4RUs4Vlc1azlMZGN0UWRGbE1EcVVrTnZyc2pNLzFL?=
 =?utf-8?B?Z29SZ0tFQTBvVUdxQUxuR2poL0tURWZ4alZYVXN0UTVJSE9WeStIZU9KMXlx?=
 =?utf-8?B?SVRhaXI4NmR2aDh2QnZjQzMzcDVSUVhGLyt2M1VudElDeTI1aGliYlR6bDVx?=
 =?utf-8?B?WHVqdHZ4N0VZbVYyUGNGdklIeGptLzRxUEQwdFFYSDdJQ1hhM1RhVTJERTBL?=
 =?utf-8?B?WTVuaXNoL1NVazBaVnVNR09kVWIrUTFlRmwzbWI2RzlUL3BtVFZWUDhjemIv?=
 =?utf-8?B?a0p2V012ZXBKNTZrQmVCeUFwcnFuWHdDaWdHUm5IaEx2NXFCZU11bm9ET2c1?=
 =?utf-8?B?MldTRW1vMXhUbGIrRXVOQ0Jva1VpRnhlSFNTMS9waGQwNFFwU3NjNFYwRGsw?=
 =?utf-8?B?Ti90eDdRUWF4REZNSW80TjVvK1ZRNWVEL28yZUVOSHBFeWIwemZmK0owTisr?=
 =?utf-8?B?Y1liSU1XaG5wVW9WMzRDK2RRTmdKWTNSamZtb2hTVlE5YXAzY3lvZ1FjNzBa?=
 =?utf-8?B?aGt0S0hSUDJTaXRINUNnd0thRmpEdUY5WEorMUxXM2Y4ZlA2dFBDS0lKbDFC?=
 =?utf-8?B?NkZwdFVJQU50TDhzL21XUmpNNWFXQUdUdlhGOGdqSHNjaFA2bU56NTRYUVVI?=
 =?utf-8?B?UUF0T21sSkdKVVVxWkdYNk5sM0VaUGRLdTk2a0VTUUFvcXh1NnJ0bFptQmV4?=
 =?utf-8?B?QWk5VDN5bVh6SE1xWDJmSU1lak15dHF0R3FyZ1oxVHNJMlovbkY2UjBtazNx?=
 =?utf-8?B?MEdwRzNneGZJVEcyeWp6NlA1UWhIWUZTakJTbTlnNXFicjU1bG5lVXRVOVEy?=
 =?utf-8?B?cWNaenpXdDRzaU8zaG5aWVJZVmdTS2JFNk0zTFNYWGpSRDJoT0hOdG82UmNQ?=
 =?utf-8?B?cjBRakI3VU9WL0daYnM2MXNMSnRnL1NnOUk5eENkbDRVYkorRWR3RHZ3MmYr?=
 =?utf-8?B?NzBGMlVSd1VPQzNpU01Cekljdk9rTHNNVXBZL1Z0dWhyVjZKK0dkSzV0ejRz?=
 =?utf-8?B?OXFud2hlbVB1Q1ZXcTF3THJQcVNscm1qSjNlemdId0FZUmR3cUcwdkpueEpG?=
 =?utf-8?B?S2NSenFseXM2VUYveHd6WG5DeG5RWGVyRjVJckdKbEJBTzNtRkQ5SkdRZEg0?=
 =?utf-8?B?blV2N0FnVnFjbWk3MHZRYVB6Zi9JeGF2RUlHOFBicGg2WjBuMk13ejc2VUx5?=
 =?utf-8?B?U3RSNFJvN0p6b3hmN1lkU2h6T24rMWJVT1p1bXRTMG9xTTlyd1lNbDZlRk5E?=
 =?utf-8?B?cUNVNjNmTlptRHlmVnhtVVdyU0hiaXZyU2lsY3hSQWdVUFMrZ1FHb3ZaQWNh?=
 =?utf-8?B?bitOdlRoUFU1R2pHQ29qVCtSME01NktYNktFdTBRNm5qN1UyMFhsUTBvaW5D?=
 =?utf-8?B?Qk5NQlhFNFpRUmJXVFkram9tN043NS9lanBqK2NrV2x0TVJ0USsrYmhxT0tt?=
 =?utf-8?Q?7mNu6Y5fqSY24+sS/8foxkbHUSLMZUCirTKQvUwSo4=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 06:42:02.5730
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c90e9dd0-66cf-4f68-3c76-08de5a4a844e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7549
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30962-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,nvidia.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,Nvidia.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pshete@nvidia.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: B74787115F
X-Rspamd-Action: no action

Extend the existing Tegra186 GPIO controller device tree bindings with
support for the GPIO controller found on Tegra264. The number of pins
is slightly different, but the programming model remains the same.

Add a new header, include/dt-bindings/gpio/tegra264-gpio.h,
that defines port IDs as well as the TEGRA264_MAIN_GPIO() helper,
both of which are used in conjunction to create a unique specifier
for each pin.

On Tegra, GPIO wake events are latched and routed via the PMC.
Document the standard DT property, wakeup-parent, which is a phandle to
the PMC interrupt controller that provides the parent wake interrupt
domain for the GPIO controller. If the property is absent the driver
falls back to a compatible-based lookup.

Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
---
Changes in v2:
  * Update DT binding to use “wakeup-parent” (drop custom nvidia,pmc).
  * Require “wakeup-parent” for Tegra264 compatibles in the binding.
  * Rename header file to "nvidia,tegra264-gpio.h".
---
 .../bindings/gpio/nvidia,tegra186-gpio.yaml   | 24 +++++++
 .../dt-bindings/gpio/nvidia,tegra264-gpio.h   | 62 +++++++++++++++++++
 2 files changed, 86 insertions(+)
 create mode 100644 include/dt-bindings/gpio/nvidia,tegra264-gpio.h

diff --git a/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml b/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml
index 2bd620a1099b..b74fc3a8d80d 100644
--- a/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml
@@ -86,6 +86,9 @@ properties:
       - nvidia,tegra234-gpio
       - nvidia,tegra234-gpio-aon
       - nvidia,tegra256-gpio
+      - nvidia,tegra264-gpio
+      - nvidia,tegra264-gpio-uphy
+      - nvidia,tegra264-gpio-aon
 
   reg-names:
     items:
@@ -110,6 +113,12 @@ properties:
       ports, in the order the HW manual describes them. The number of entries
       required varies depending on compatible value.
 
+  wakeup-parent:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      Phandle to the parent interrupt controller used for wake-up.
+      On Tegra, this typically references the PMC interrupt controller.
+
   gpio-controller: true
 
   gpio-ranges:
@@ -157,6 +166,8 @@ allOf:
               - nvidia,tegra194-gpio
               - nvidia,tegra234-gpio
               - nvidia,tegra256-gpio
+              - nvidia,tegra264-gpio
+              - nvidia,tegra264-gpio-uphy
     then:
       properties:
         interrupts:
@@ -171,12 +182,25 @@ allOf:
               - nvidia,tegra186-gpio-aon
               - nvidia,tegra194-gpio-aon
               - nvidia,tegra234-gpio-aon
+              - nvidia,tegra264-gpio-aon
     then:
       properties:
         interrupts:
           minItems: 1
           maxItems: 4
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra264-gpio
+              - nvidia,tegra264-gpio-uphy
+              - nvidia,tegra264-gpio-aon
+    then:
+      required:
+        - wakeup-parent
+
 required:
   - compatible
   - reg
diff --git a/include/dt-bindings/gpio/nvidia,tegra264-gpio.h b/include/dt-bindings/gpio/nvidia,tegra264-gpio.h
new file mode 100644
index 000000000000..689cf5c67c0c
--- /dev/null
+++ b/include/dt-bindings/gpio/nvidia,tegra264-gpio.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (c) 2026, NVIDIA CORPORATION. All rights reserved. */
+
+/*
+ * This header provides constants for binding nvidia,tegra264-gpio*.
+ *
+ * The first cell in Tegra's GPIO specifier is the GPIO ID. The macros below
+ * provide names for this.
+ *
+ * The second cell contains standard flag values specified in gpio.h.
+ */
+
+#ifndef _DT_BINDINGS_GPIO_TEGRA264_GPIO_H
+#define _DT_BINDINGS_GPIO_TEGRA264_GPIO_H
+
+#include <dt-bindings/gpio/gpio.h>
+
+/* GPIOs implemented by main GPIO controller */
+#define TEGRA264_MAIN_GPIO_PORT_T  0
+#define TEGRA264_MAIN_GPIO_PORT_U  1
+#define TEGRA264_MAIN_GPIO_PORT_V  2
+#define TEGRA264_MAIN_GPIO_PORT_W  3
+#define TEGRA264_MAIN_GPIO_PORT_AL 4
+#define TEGRA264_MAIN_GPIO_PORT_Y  5
+#define TEGRA264_MAIN_GPIO_PORT_Z  6
+#define TEGRA264_MAIN_GPIO_PORT_X  7
+#define TEGRA264_MAIN_GPIO_PORT_H  8
+#define TEGRA264_MAIN_GPIO_PORT_J  9
+#define TEGRA264_MAIN_GPIO_PORT_K  10
+#define TEGRA264_MAIN_GPIO_PORT_L  11
+#define TEGRA264_MAIN_GPIO_PORT_M  12
+#define TEGRA264_MAIN_GPIO_PORT_P  13
+#define TEGRA264_MAIN_GPIO_PORT_Q  14
+#define TEGRA264_MAIN_GPIO_PORT_R  15
+#define TEGRA264_MAIN_GPIO_PORT_S  16
+#define TEGRA264_MAIN_GPIO_PORT_F  17
+#define TEGRA264_MAIN_GPIO_PORT_G  18
+
+#define TEGRA264_MAIN_GPIO(port, offset) \
+	((TEGRA264_MAIN_GPIO_PORT_##port * 8) + (offset))
+
+/* GPIOs implemented by AON GPIO controller */
+#define TEGRA264_AON_GPIO_PORT_AA  0
+#define TEGRA264_AON_GPIO_PORT_BB  1
+#define TEGRA264_AON_GPIO_PORT_CC  2
+#define TEGRA264_AON_GPIO_PORT_DD  3
+#define TEGRA264_AON_GPIO_PORT_EE  4
+
+#define TEGRA264_AON_GPIO(port, offset) \
+	((TEGRA264_AON_GPIO_PORT_##port * 8) + (offset))
+
+#define TEGRA264_UPHY_GPIO_PORT_A  0
+#define TEGRA264_UPHY_GPIO_PORT_B  1
+#define TEGRA264_UPHY_GPIO_PORT_C  2
+#define TEGRA264_UPHY_GPIO_PORT_D  3
+#define TEGRA264_UPHY_GPIO_PORT_E  4
+
+#define TEGRA264_UPHY_GPIO(port, offset) \
+	((TEGRA264_UPHY_GPIO_PORT_##port * 8) + (offset))
+
+#endif
+
-- 
2.17.1


