Return-Path: <linux-gpio+bounces-30989-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNzvLJxKc2mHuQAAu9opvQ
	(envelope-from <linux-gpio+bounces-30989-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 11:17:00 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1240F742AA
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 11:17:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A49E0326793B
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 10:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B36637F11B;
	Fri, 23 Jan 2026 10:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CqVMueNG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013051.outbound.protection.outlook.com [40.93.201.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D94F3112DB;
	Fri, 23 Jan 2026 10:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769162939; cv=fail; b=Tx6d90sX/723ykvIuOjbUe2k9A02/IE3KCRWmXFvijSA1HUAOkimjbweTzMxSYDTSfyvEa4eWngrTX38SptluWCD5I7e42SINFLxFh3qlrJb/hRdp+lTjtO2FZZHtnK6Kr7sokn1PoLqD+tJOEyrGw4tcFfb1fCLPzeLWjlhbMY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769162939; c=relaxed/simple;
	bh=qbAT2BsTF0oRNczN1blqMm9W5+YplhKev6kOdrZTsmA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=er01sZqS2lXtXx0R4LTlmQKjxkPDKvasCdnEJIqyQxLn1o/gPTZWQm8/quwx82MT2V+iePRoFNpKO7BZBZQNLjsgPeqPQHofyTPemifW1d4bo02KcabN7Dc6ehQn5yPN/Q0w0JXsZz6jzOgmEgFGmqBmMa0DTmSU76XCmOwxtk8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CqVMueNG; arc=fail smtp.client-ip=40.93.201.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m7KJb/qXY9ddcyPNrjHmuNdRDKyN9Fq5bt4ggRbkQhD2Z2chC4K3/rM0Cm9C0veJSu+cDdYOg1KSgX5rUla7VzZRvlBxIWdE66GJjG4KCY45uC1KYy3CSy2ydPvXJrtGJX3WDoaOt8AiZoKpz7UzcWKSZIj1cG19PgIvMwKgjhZg48wkZ7/lp8JGfle1SBegIl4y5oWQNUsIteIiQjNF8CEPDh2nclfcfcGYP+aZy5biR5LIUAyWcM6Bn58xSUaI+sdDkeSHPqimiOrs88arpKfG8kROACewu/WNIFoR7XrvBM6Xdvb/+nGP6sGrvQu9qMZfEff4mfx886XHr4+lDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RzWtxtO9n4jDol2vNQgJGRmTPKQX+RF+NqAE37zRss8=;
 b=eM4/pseuCI/uiSGpBSOhAL1BaG5LJrxor89FSKL6EAPjVff+weqf+k3MQHgFfOrkU1HW0y8OrimbAgFB+dLs/WajEzg5yJUYOd7Ig+yiu7k69SIzSDIpHfftmhiw9NGgMK1hBWSXhAiOHHT1d6kT19E0scGVJ6gLoCN6gxGSiRPXwcv0mKc/aXqhqO5jlZ2ocM8238Vcdb65yDeu1CWMClry29X/vuyrBgmIbOJKUuDq3xuQqWAu28UCf32fpjkv7dtY5Zk1uh5yI6HZK1XCUJXs/pVfN/cyF1uh/lngSe7x/Jbb05T/alQRWT6Mr5uoqOuVaPLBG78qlBwoIfmUUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RzWtxtO9n4jDol2vNQgJGRmTPKQX+RF+NqAE37zRss8=;
 b=CqVMueNGbZB2VK6pnBoNVuxyZ1/tsUvVzjdnBZj6e9c5S8M4maqTuBoCdtrRC9q7/dP2M9X0XEXTu1ngfzSC6Zxpx46BV3ilRnS7XzyjXFnpi7gFWDvWeaW47mwebeHjF0TBZzwHw6c9aYpzFEZQujscrXqf1iYFiHvZ7q3RCe+4wUBXHv2FoYiAvbTqW8l59p24tlOdGnE2CCbCseHEstauLZnCBAYrdxZ57hpqkj9BPsRI6QtlwR9fYxezPwMJmbLUm+3MTEHXVNm0CxhJ5fGlxU0Z2SO//iSzL7GcZyCBr4OHWPc4dxAwVDHMV/BgR6+zJUEM7ovb4yRpM50URg==
Received: from SA9PR13CA0065.namprd13.prod.outlook.com (2603:10b6:806:23::10)
 by SA3PR12MB9160.namprd12.prod.outlook.com (2603:10b6:806:399::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Fri, 23 Jan
 2026 10:08:43 +0000
Received: from SA2PEPF00003F67.namprd04.prod.outlook.com
 (2603:10b6:806:23:cafe::b3) by SA9PR13CA0065.outlook.office365.com
 (2603:10b6:806:23::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.2 via Frontend Transport; Fri,
 23 Jan 2026 10:08:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SA2PEPF00003F67.mail.protection.outlook.com (10.167.248.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 10:08:43 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 02:08:32 -0800
Received: from localhost (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 02:08:31 -0800
From: Prathamesh Shete <pshete@nvidia.com>
To: <linusw@kernel.org>, <brgl@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<robh@kernel.org>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <pshete@nvidia.com>
Subject: [PATCH v3 1/3] dt-bindings: gpio: Add Tegra264 support
Date: Fri, 23 Jan 2026 10:08:22 +0000
Message-ID: <20260123100824.1109150-1-pshete@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F67:EE_|SA3PR12MB9160:EE_
X-MS-Office365-Filtering-Correlation-Id: 346d045a-afef-4947-6db6-08de5a6763f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZS93ZkJMbFBubkUvT0RJcG1YenB6b2t5eU93OWxOcHlqTnZKbW1vdHBNa3BW?=
 =?utf-8?B?OWhaM1c3Mm84U2c2cG4za29panNBWTI2cm5iU09sNlk5cEZlTjVXRVBYOGpv?=
 =?utf-8?B?RmtLdlh4ek43V3pBY2dqcG8vcUZwK0EzUTlTbWpvMXViQ0JDbFFrNldtN3A5?=
 =?utf-8?B?bVFueVdHTkVncmgzcHNhdDFRMFdNTGRDT0NHMU9UL0JpWGhKbTlNOFpwU1Yw?=
 =?utf-8?B?OHdvRlhCK3p0Qm5LZUw3aGF6Q2JVL2FwdXVmeGh4VFBheXBqL1YraFNkSFlk?=
 =?utf-8?B?NEZUc2FYU2plUlhKT1pCL3pqSkxLMk5FK25uZVI3QnRoVXh3U2tYem1DWjlJ?=
 =?utf-8?B?T3ZiUCt2NXEydTJhSlNCc09BbU1RVDcxZ0xNNVJNRVJSSWVDSTJORHdMMFpt?=
 =?utf-8?B?KzZyL2pENTYzc1VoNFF4aWF5S1Brb0tJNXMydnh3RXNGNE9mNlVGbmxVcmV6?=
 =?utf-8?B?UlQ1bmdHVlpjcVpIWTRHMkxncGxja3hUMEMrTkdtZEp4dmhjQ3JCWVBTNTRk?=
 =?utf-8?B?TklyTkszbUhqVmhvQzRNNWZNWGFKblAyendDcjM2UjcwTXkvK3VyOC9QUkVh?=
 =?utf-8?B?ckQ5WWZIaEtGV29LeFczTGRmQlByRWZuK1JDWGl3R1VWNlh4NFJpdFJDNVNU?=
 =?utf-8?B?QkxYZTFXaG10TFI5L3FaRFIzVjQxaHF0MXY4MDdIQnZHOC84ZnczM1M1YnVK?=
 =?utf-8?B?Y01admIvaGgyTTQrVUZkck45blBzMjNBcFZ1QW1MeFdVcWVma3lYZEUwb2JS?=
 =?utf-8?B?NDVHN2xaaDQxTEwweDhyYnhVeVZiTUpNcXc3aVhwRGJzWTdPalFlQzZrVkgy?=
 =?utf-8?B?VWJLdXpIWktWRW1PWUxJK0VtVzJqVE9Vd1JJTkFkaDZEbENCR2pZM05sRlFm?=
 =?utf-8?B?NFQ5eGhqb2pKVkl5MGtOZG5aT0JVZFByWHd1aHhsb2ZmT2lJQncwTUpKank1?=
 =?utf-8?B?bGEvRUdXS1JqTUtBWFNZV2luNXdpQ0tTN25wYVR3NlZlWEcvMlc2OUlkTlBo?=
 =?utf-8?B?UldPZXI0V3ArMmhFOWZiT1E3T3pLS3pidFJLcCtzMTdjUTM0aXA0RXliZmFN?=
 =?utf-8?B?OWIrQU5TTDMvYkhrNDBIbFdIUFlFSVM3WjlBMW1vUEFhcCt1UzA5dk8wTGxi?=
 =?utf-8?B?K1FPKytqVENkMzlsb3VxSTNwS3VEMnhDSkUzUEhWeTV6YmZNajNTbTcvRFpu?=
 =?utf-8?B?ZGV3c1RFaEhJVVBsWUU4dmw1Z09oWWVzYTJVZHpPZWtjQng0WFNpWHdBaEhh?=
 =?utf-8?B?dmhPSlZncXFMakRzZitPVmRJb3ZZZzVXd2dWNllOUHhGTzZJaExYSEhKZFhY?=
 =?utf-8?B?SVkxUUtBOVlaYWZwUlJ2Y21hMmxEY3k2YmU3bVJKRlB1MWxuTWhJZlJvZG5t?=
 =?utf-8?B?MGlKdFdMVkgzSS9meGN3NWlwV0RtTlVOSFBCaCsvc2FiNm9taDAxTUdvTCto?=
 =?utf-8?B?RFBIUHQ1OHpRMTZWMWZmbGhzWWdFSnpwcjBJSk5SZG50UnJuL0NHaHdrL3Nl?=
 =?utf-8?B?Qi85Zi9ncno3Z1E3MkpCeG9sbG1JUEdGZHZsUGszWkdNZURpVE4xYTNwS011?=
 =?utf-8?B?RDV3MDR5T1VKRGQyOFRyVkxKenhKaDM5QmJva01TWDB5QmlyUmpoNHA0V29P?=
 =?utf-8?B?UjRkQVZ4Q3JCQUplZTV6aUZBaUpuS0tCRktzQ21HSmdhTTVaUEQ0NTVjQmtv?=
 =?utf-8?B?elFkS2ozbnRrZE9XR1VDMDYvV25kWlNQSjJoVVlLTXNYc1pZcTY0S0dxMmt0?=
 =?utf-8?B?OWx1OHlkTGhWelk4cllaMGFsbjZZNTRsTFJqQTRKWWFoL2o4ZFR4R0NTd0Vu?=
 =?utf-8?B?aTdqSE1CbXl4bjhNaGJndnJmY1dwNEI4SW9FMk5oa21nRWFaVzhYWG9JUHhR?=
 =?utf-8?B?b1NibHhzcHBiSGljdjBMTjA0TTVRWUNOMFR4WGloN2pwODhBbENjUDBnQkp3?=
 =?utf-8?B?bmZXRWxvRW5JMGpOd2EycVAxdTF2UDVIV2I1S2Vva1ZEK2p3NkhDa3h1RTNq?=
 =?utf-8?B?NGZQMFVOUWtHanpqQkJDVFJPRHN3dCt6OVFWY09QUXJKRS9PNnFrZHRUWmxx?=
 =?utf-8?B?OTUyWmlIdUdDZjY1Slo5L2oxd0h6OEZSTm1nM3dnLzVCejJnR3ZBNWo3anJW?=
 =?utf-8?B?MzRKRGZ6WTdabHNUM2lHekVOMS9nZU5MencwcWlQYVV0Z2ZuZm5kNHJGN0Qv?=
 =?utf-8?B?Z0NnRjcvM1J0NDlvQjNDczdpOGdLTldKbzhSdUtLcXZKZGFNVGxCTDB5dFNU?=
 =?utf-8?Q?O/PdMYYKF20x0t/lSVIZscsPaGVNgVL+3lBSkKq7K8=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 10:08:43.6670
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 346d045a-afef-4947-6db6-08de5a6763f4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F67.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9160
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30989-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,nvidia.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nvidia.com:mid,nvidia.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pshete@nvidia.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 1240F742AA
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
Changes in v3:
  * Fix DT binding SPDX license to GPL-2.0-only OR BSD-2-Clause

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
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
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


