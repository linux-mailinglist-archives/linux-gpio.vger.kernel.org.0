Return-Path: <linux-gpio+bounces-31097-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKqEGmNHeGnWpAEAu9opvQ
	(envelope-from <linux-gpio+bounces-31097-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 06:04:35 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0274B8FEE6
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 06:04:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC318301CFB1
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 05:04:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CF1E328610;
	Tue, 27 Jan 2026 05:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ftKqYtnH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012055.outbound.protection.outlook.com [40.93.195.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953C92C0285;
	Tue, 27 Jan 2026 05:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769490266; cv=fail; b=Leri6Waay3O7NT/5IDhoViqP1vNfPVEodb1bWVsMcUHOkGbDAIefEKmVedA4um347zueuxS+BS3aWFbSnThqTDpodQgUUHz+awu7DspUBcHWbxLPGDMeBa0LT5Lga9eTi9giXLxrxL96mc/MlL7dmau/lE8SjgLap3HxSFjUS/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769490266; c=relaxed/simple;
	bh=e64opGKISaRCQGszfF7EJSi9zcB5UlQcp50fnwO5DnU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=vB0n4MTDM01D0pg3gkgIjwOdckbB2wYCZHCJ9x6R/O14lMtD1y6FbOpS0REPHr4Aw4i5/ChDcUZNvXpk4Z48xLpm8Yn+CsV+dVzT8ZBHFJ8ZeTcrOsco8Vgd6U54WhTVr4r7TfMGFQSOnkxO+8v5gd7dB+I8p8eGMZ0cNiluUV8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ftKqYtnH; arc=fail smtp.client-ip=40.93.195.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=um3JrP7Ra/+h8PCpMwEk0/Cv5UMkJSZfr8hrAdx3tRTwxLHmCtskxqny+iWChYdcCGdQrgadeb5hooZXNBhmKwMdIX5I8I723Yf2fXK5ajSg0z8BQlsP3OTBlg2q7Qi9rhZzJGQ3pV5XoZdr/EPGzW/cAsIQ84vvgjRfzzYQ+tKAO63FiXl4RJjM+B8diWYuu9icqSAWv2aQEuuep4bxt3yFTelKsTedVtbx7hIiyfQHhr1rCwLQxQrgnPeL/YSGGDWym8lbznuB9tg2b5meIjXWl3G4lnSGC7XFfAi23skmWXg6eZgcKRRbLWcWaPXfaTyjW00AXkevh62Vpg6NYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZfvDdHrJ4oR6mI71rnHdERSuGxQEwCnRjfMeMiKvohk=;
 b=CvOay1eTgBmNqf8fItyKfDLL/aKLcR82BGMNfl3/+dkFhQTZlrfyAZhiVBSVahAZuxbKrEcX+EO0mQK6HWfIwgCrQq46PJb0AeLHmcnH8dDWJYCt2wMzItnc8OrGSJrt6hCQ4xmVWaZ16jxYbh66k0t9BTFs1f1lIITWkOTvqeNPz9hgsLt3JZCpTeNOQmC9wj490RdloWbyKbtxO5GdkL7rWbHirlzqMMID9txU61BB3TOVxiE6inLPJmNPjvKhrG2UH3185K+Np5owOwHyyzUQQm19xo/uCPNP001BLNMIqWgaqMBDZHHpT7mk3dZ51X+KlTQMhYFNaXYfYN1mzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZfvDdHrJ4oR6mI71rnHdERSuGxQEwCnRjfMeMiKvohk=;
 b=ftKqYtnHHsnYAq8+QXP5hn/FU+D5d1rTYbhoyfdHXkrojcyPcTY64bLvUkQSxHcFHfkmkU+3h/nSq9GGco5Hy41O9mCOgp7KMxFId59K3Xua7HwmsiFXeYT0fR0cPKyyHIMNqD4rLabhIXMnWlLthI8qgkcy6evvI9uTm/6zBAbmsqMBXZo8jP/RkGG2khv0m0RmGDgrKa2KLbK/GwPPNauys0HJ9WYSvmEqr5iczq+6hKjOXeHZwBkzLx1kOVauT2zxhRAMv45ZsHlA1EZMxGBvdSBtmfN02Gitow2hNHOVWvUgmow4sfdpIvRiBinEIBp8FeAdxvx1Q+nsl/t+QA==
Received: from DM6PR01CA0024.prod.exchangelabs.com (2603:10b6:5:296::29) by
 PH7PR12MB7284.namprd12.prod.outlook.com (2603:10b6:510:20b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Tue, 27 Jan
 2026 05:04:18 +0000
Received: from DS3PEPF0000C37C.namprd04.prod.outlook.com
 (2603:10b6:5:296:cafe::2c) by DM6PR01CA0024.outlook.office365.com
 (2603:10b6:5:296::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Tue,
 27 Jan 2026 05:04:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS3PEPF0000C37C.mail.protection.outlook.com (10.167.23.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Tue, 27 Jan 2026 05:04:18 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 26 Jan
 2026 21:04:05 -0800
Received: from localhost (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 26 Jan
 2026 21:04:05 -0800
From: Prathamesh Shete <pshete@nvidia.com>
To: <linusw@kernel.org>, <brgl@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<robh@kernel.org>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <pshete@nvidia.com>
Subject: [PATCH v4 1/3] dt-bindings: gpio: Add Tegra264 support
Date: Tue, 27 Jan 2026 05:03:56 +0000
Message-ID: <20260127050358.1136279-1-pshete@nvidia.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37C:EE_|PH7PR12MB7284:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ff6560f-5ac9-4a65-88c4-08de5d618696
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NElCT1g3Q1ljZVAwOUNQSHRFeXpud2pzSWZiQ2RCU0xzUTdPUTdMekM2UjM2?=
 =?utf-8?B?UDNKeFpMWGhGbmZhUWFhclJlMERRRjRrSEpvMWY3VmlKQUJZcG5YTUIrQlE1?=
 =?utf-8?B?dHM1ZWp2cVBxR1RoeU8vZmxZSllITjlvQ0hwU2FtRUhBVkZaeWpFWXZFaFFO?=
 =?utf-8?B?NWQ1YXN3SkFkc3FvNnhNeGozUzZuUHRmbURmMmVrR1FucVIwWUt1OS8rOTBG?=
 =?utf-8?B?ZUxOd25YVUxxZ0d2bC9DYjVKdUJNYlNmVUNoMmVldlF4dWJWZHJRczB1TXg4?=
 =?utf-8?B?bjMzamNPeUNaSko0WkdNaExoWjN0TmVPbnEwUlRzOHd2dTIzczVDeUlqczNS?=
 =?utf-8?B?UlFVRzlsV0cwQngzSk9LQ2djYy9LOUY3RWhZT1hUM2wxY04wYkgrMFpERUFM?=
 =?utf-8?B?OWs2VmlnMFRBQlQ5bmVJVDRKalQ5YUhHbmJaZmRSSk1zRDRHa0JXUktRelFF?=
 =?utf-8?B?ZW1sMis4Z1N5UVVIUEZSSDJ1NzBUY0pyZEZ1L1g0MitRc2pWN1Zob3lMQUx1?=
 =?utf-8?B?eHRXczJOZGh2dHZFMlV6MHpBMVJUNFozOW1mQ1R1ajR5S1B1SnlZS0ZRK285?=
 =?utf-8?B?TkxrcURhTzJXendQaEdCZVBhVXY1NGtIamJzdTRjUmF5S1JMazdEMVNGS2dJ?=
 =?utf-8?B?VGFEOSswK1IySXo1UHU2NlB1YU53UGJORjRUQmhadGdDaFBBRGxRTGtwUFo5?=
 =?utf-8?B?RXdSenJxRFdUbk1QY3g2K3pLakdzdkpnNDh1WmRaYkx5VURMaXdoTy9tMEd1?=
 =?utf-8?B?VU9tM3BDdHNxZHBhUmRQOGhRTjhVK2JNL0lCVEVsaWxVUGRDNjZ4dUhXTjZN?=
 =?utf-8?B?bFZHZWlNS2h2U0RaaUZjUURDVmdKbUJGQW9JL1BtNytUd3djNWp1S3g2N1Z0?=
 =?utf-8?B?VVJKMklIemRyR3d5bDd4eHl5U3BjS2ZKWUJkSlpKQm5zN0o0eW4ycVIvaTM3?=
 =?utf-8?B?dWZ0bjQyNmNsVjVxOTlQSUU0bGNpSG5uYU5INFg0TGtTR2N1Y28zbmd2Zmcz?=
 =?utf-8?B?b3hDajduTmg2eWVLSzhTek5ONXl0ZlovaW01ZEpKS25BSEN3VHkrSlM2UU81?=
 =?utf-8?B?b0Nrbjl3Nzh6U3c4MTFKK2c2eGN6RjBvOXdEenFONmxRYzMxakpEc3U4TWVv?=
 =?utf-8?B?OHFkUUhJM2k2c3JaRzZKZnZLRlVmNmVLM3ZMUHpScHFFQmpsdWtPL3R0aG02?=
 =?utf-8?B?Mk9JQkZleWVuN2JaZHpoY21Rb1VKMy8vNi9KekJGN3dOdFhMbWNDSCtQVTQz?=
 =?utf-8?B?TUNRMldrRXFTaHQ0aTJMcUhxb1NsTkVRLzZEK0IvQW1SNnAvK0JBMEJaa0d0?=
 =?utf-8?B?Zzl1N1NrNVVBdlZOaEhUT2x0dm5TUkY2bTB4dnp3ZmY1SUVFTWF6cnRWVitU?=
 =?utf-8?B?SlV1dk1hRVZGZUhQbWJUMlhHNXVMMmZLUUhOLzQ0NjBLQkZIRjVvaEZWSkNS?=
 =?utf-8?B?UzFVOFJtSFBYTGYrQ0FlY2szQlNSZW1LemU3ckhTUXRvSC9mb0ZVQWJiRE11?=
 =?utf-8?B?U255bVFQOHNHVDFtRlRNQzNoVENaSVpmTXljTTQ5WEEyeC9lcWtpVWV1K3BB?=
 =?utf-8?B?SDFkaVBGaTE0WG9nd3duN2t1RlRSMXVMUXFOdVlOcGh5dysremZsRTVnOXpm?=
 =?utf-8?B?ZlE5Y0I0dTJHSjRMQjM1MnhIWVQ0NU1IY0FzRDZCM1RBT3lqODEvQmUza1dM?=
 =?utf-8?B?ODVYRjRSaVh1TTlxYkM5aURBYlgvNk1tRzE4Slh4b3FUY1RPeUVSbmszbTgz?=
 =?utf-8?B?eFgyRFM3YUpsc1drT011OFBYc011WWNHUjdvMnl6NkdwOWdUQU5NRDUvV250?=
 =?utf-8?B?b2tHdjhmbWsra2xXblJpL0pDM2ZLaGdMVDBLZ2dXZEQzZmdreUZmSlJaTnJG?=
 =?utf-8?B?ZmoySXZ6czZFZnRBcHdaMzdlWm1Bc0h4QytpRHJuV2p6c3hyVHJlUXJFRHBB?=
 =?utf-8?B?M210eWU5TVlaMEsvL2gwTUdsQVZLNjJJd2MvblMwQ1FQVGRWR1lPL2E3RHpQ?=
 =?utf-8?B?eXFBRzViSDB0MnRDb285TE52VDRCMmtvL2tEYWlZelNPcHNYWFFHdFZreFlG?=
 =?utf-8?B?aU9USGk1MytwZlU3QjlZWkxLeDNXZC8rZWV4d0xOaE1pQVliMS9rNzF1Zmpa?=
 =?utf-8?B?K3duS1F4TlQrSEhkK01FSmVldXl4dzdxbmF4K2pvY3IzR2NMTktTcFFXaE1K?=
 =?utf-8?B?a0FSOUxVVGR3c0pXb3JoS1NBUDBVN29DMm44aS9KZ25wV1d1ZzFvdGtIdDI4?=
 =?utf-8?Q?XbimDnq0cvmkl5RYrUcL3Rv9oGYFhsWfEeD149YBU4=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 05:04:18.2855
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ff6560f-5ac9-4a65-88c4-08de5d618696
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7284
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31097-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,nvidia.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pshete@nvidia.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 0274B8FEE6
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
Changes in v4:
  * Drop local $ref for wakeup-parent (use dt-schema default) and inline its description.

Changes in v3:
  * Fix DT binding SPDX license to GPL-2.0-only OR BSD-2-Clause

Changes in v2:
  * Update DT binding to use “wakeup-parent” (drop custom nvidia,pmc).
  * Require “wakeup-parent” for Tegra264 compatibles in the binding.
  * Rename header file to "nvidia,tegra264-gpio.h".
---
 .../bindings/gpio/nvidia,tegra186-gpio.yaml   | 22 +++++++
 .../dt-bindings/gpio/nvidia,tegra264-gpio.h   | 62 +++++++++++++++++++
 2 files changed, 84 insertions(+)
 create mode 100644 include/dt-bindings/gpio/nvidia,tegra264-gpio.h

diff --git a/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml b/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml
index 2bd620a1099b..17748dd1015d 100644
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
@@ -110,6 +113,10 @@ properties:
       ports, in the order the HW manual describes them. The number of entries
       required varies depending on compatible value.
 
+  wakeup-parent:
+    description: Phandle to the parent interrupt controller used for wake-up. On
+      Tegra, this typically references the PMC interrupt controller.
+
   gpio-controller: true
 
   gpio-ranges:
@@ -157,6 +164,8 @@ allOf:
               - nvidia,tegra194-gpio
               - nvidia,tegra234-gpio
               - nvidia,tegra256-gpio
+              - nvidia,tegra264-gpio
+              - nvidia,tegra264-gpio-uphy
     then:
       properties:
         interrupts:
@@ -171,12 +180,25 @@ allOf:
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
index 000000000000..63a3541c2fb0
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


