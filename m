Return-Path: <linux-gpio+bounces-31099-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MG5RC3FHeGnWpAEAu9opvQ
	(envelope-from <linux-gpio+bounces-31099-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 06:04:49 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 998B58FF11
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 06:04:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8C98D302BA31
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 05:04:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A0CC32861E;
	Tue, 27 Jan 2026 05:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="h6zE3QIl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012012.outbound.protection.outlook.com [40.107.209.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B714A328608;
	Tue, 27 Jan 2026 05:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769490280; cv=fail; b=VLrGzLjwo/A+5exope0sfUkkCciWrKZukIeByo0JnLg4mVZB+gVQlrmgtwFUNSwYT7tIEJuzvhorMyAfQQVzFmOms9V014OOQpIP4Gnh8ucXx5dL0kmNIZdc8rjmxH4tuVIaq/SmHbo+ztxlb8fV2R8yFMOg5U1fHv63rHtpfwQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769490280; c=relaxed/simple;
	bh=044D9XlTxrs02Sy1EaPlOhDtVXdZOBC3pjVTahmY3E4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iFUYVmebJGP90dgGUJxt1I/T9sr5vTisuP8cDFKvNPjQ/2bk18gEMdoj/oME7UJQunmjB7mM2gLaZ8TJh6OJNuDXnWod11mzxk2z7v7Z3EzvD+cXoZFJ7/yn0zf7dPUjJ1NeBgobZF+SgyPGNPxJmHXg03fSEJ+EcTL0FNyRKZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=h6zE3QIl; arc=fail smtp.client-ip=40.107.209.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W2eiegZrIjLxCWWY2Bb5aDmxnuE+LjVVk9ORRrt1SS/lLQ1W4X/XlBLy5xyLoEDq6xTY5lBaHIfSnqNsyV2kR316mc3x0vvdy3Lyw5Sp8RrwScku9EIGnXXyA3Qh2Fzy4oB8FcHJEqggcJML/y6Bpz9EoyBGkXFrG8Tr3dV+BwXICbaoscOAzt8fF1kAmf2URR/71GzFhQaobiZMK2Lr4e+/fOnfQA1284B2Yiyg4hrgjh1XiLLYm4vZpo5ZDmCLTciV2BUvHz6N6gWFn+0ez4LVquvNHFnYhk8NYmCYkBlbshTb8TNSkidkZklmcblzMhLjCERChUx1hathz4eaCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=noqUG0bgzb0Mz26bny+vYut7xyNQTS0q20oZpC/B5Os=;
 b=Y5YXc2OIeUV9yLVdPPYTWmo7ble2jI5/7S1urjQqhQgKxIJl/r/XG9aVGvRPQtzregNln5a/PJnML8l1HllmNwSIBV2wTBEXK3JPI3woHgvirX5CF4DRwrQe5PkXrukKdlyJT7se0HqYNd+DPEDO5ccFgBg4fYN2dXLr6oCOGGXIMuOdz4QIbcVcsBVCY1V94CQquF+Sljvo3VOwxDY81v3JB8gVCOmnYQj3Q9xkmSUoFBxq5YM78SRSBOAJurKdKyLrVdBtJh13Et98ivSYdhIb2eL9VqIuuaVFyX8OBIF4UIo9Lk8cRvdIsXaKLETmUPdHBT4a3TwWoTExI7dJKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=noqUG0bgzb0Mz26bny+vYut7xyNQTS0q20oZpC/B5Os=;
 b=h6zE3QIlwhChXVcSp2oLhCfW4Bmj9OA3soMJBb+TK8lxLDfUgK0bPOh96o+MZgEiDNYB1FC1/8OMaO9DyqXNvIwh8gDsN34HYoqVcSQhqg8HMaAm3BtgWyJ/IIgSp2rNwBFOHYvtYFr2jP4mBYvOh57FJg0nvAXMOlA5w8PtU3gfv0cXEWqH5uAuGs7T68beHosmRZWZDE95YN7EOqeHRjer7I3NXyWHxEiF3aYgz/3Xqc1SMG9/FjPfVSp+B0WhbmEXyoBtTn34OmB91RTp4W+uZdB4EFPVzC++QAVsWZ1HSaJISG187oagX21tdlED7pnzyu612EWGCg8GdB7z3g==
Received: from BLAPR03CA0068.namprd03.prod.outlook.com (2603:10b6:208:329::13)
 by SA0PR12MB4400.namprd12.prod.outlook.com (2603:10b6:806:95::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Tue, 27 Jan
 2026 05:04:34 +0000
Received: from BN2PEPF000044AA.namprd04.prod.outlook.com
 (2603:10b6:208:329:cafe::a1) by BLAPR03CA0068.outlook.office365.com
 (2603:10b6:208:329::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.14 via Frontend Transport; Tue,
 27 Jan 2026 05:04:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF000044AA.mail.protection.outlook.com (10.167.243.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Tue, 27 Jan 2026 05:04:34 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 26 Jan
 2026 21:04:24 -0800
Received: from localhost (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 26 Jan
 2026 21:04:23 -0800
From: Prathamesh Shete <pshete@nvidia.com>
To: <linusw@kernel.org>, <brgl@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<robh@kernel.org>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <pshete@nvidia.com>
Subject: [PATCH v4 3/3] arm64: tegra: Add Tegra264 GPIO controllers
Date: Tue, 27 Jan 2026 05:03:58 +0000
Message-ID: <20260127050358.1136279-3-pshete@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260127050358.1136279-1-pshete@nvidia.com>
References: <20260127050358.1136279-1-pshete@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AA:EE_|SA0PR12MB4400:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ed4d0be-9bd0-4521-0c13-08de5d61900a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NDFqajRPejFPd2JCczNTMXFHQWtvVkxzV1hJTnBIMlFIRXZ3b2ora1gxMzhO?=
 =?utf-8?B?UU9XMTZBMVlYQ0hwZUpVM2JldCtYMVc3cXFGdUcxb1d2TGx2bnhscWw3bk9R?=
 =?utf-8?B?QkJaUEc5ZWt6WWNrTHRYOWZRUnhHcENycHhVZ1I0MS8vOHhCVitCVGJxUHly?=
 =?utf-8?B?NlVqOHBQU2dNSzBSZU9nUDdwZzBPM2UrRmh6RC9sNE9JUS8yaGZaRXpoZytZ?=
 =?utf-8?B?QUtpeVg5NFVGbmlBWDM0SEdMcTk2TXoxb0VWVUNDTzFhNExZNVdnbmhtUHF4?=
 =?utf-8?B?SDRvOXIrOElFMlNoY29pUElBRVVrSTJoVi83KzI5dEJUK0Vja0dJL1hQYmVw?=
 =?utf-8?B?ajE5dkJNSWE5QzJieklIWUNuYS9xY3RJeEttUHJMRFRnbVlGaU5VUWxTV3ZG?=
 =?utf-8?B?cXdMV2Q1cG9RZnpMWElITVYwUEtYaFJOQWZrNzZFcDlIUEMxQjMyWGFqVFFZ?=
 =?utf-8?B?dHVBeTFleS95bGFGdG9CQk5vL2RUWnJVVzRDMHdJbG1vZmdxalFKMGxZeS82?=
 =?utf-8?B?N3UxUUlJRGlSeWtZV2dpRHFIM1NoTlYyejFCMlIwODdjb0wyK0EybDIrbVBW?=
 =?utf-8?B?UzZjRTFEK2dTV0RSekNvajNlRk1RTUNzSjhOZWlsOTJSSG0vRmMrNGU2a0Rn?=
 =?utf-8?B?cGdMbklXcTk2L1NBNm5leStyV01xVXFsQWJSOGUwNStKT0JnVmlVNHB3Tk1F?=
 =?utf-8?B?NFBUL200SWVjaW16cVFkaVQvYmZueHBwZ0c1N0hDb2MzRVhPeXlHZi85ZldG?=
 =?utf-8?B?T0tnMmc0UExqbHdpZ0pZTGd5YWhISGkwdDVadzhLQ0RMQmxqbWIvZEpxSUZJ?=
 =?utf-8?B?UlNZSjlNUFhkd0NTZDdEcXZ2S1BaZDJFMk92c1hQcWlXdUJEUVBFaEJiWklv?=
 =?utf-8?B?eGpNR0xJR3FwbE4zeENWb0NyWEJ3eHR5aG9xVHRQeUpCK3Exa0hlVG9Ha1BJ?=
 =?utf-8?B?MXA1TWNFZWxYQXlGbDkzTzQzZGtaWXI4Z2dMRnB3YzlDL2pyTFR6bTZ1NXo1?=
 =?utf-8?B?T01GbFJTSkZZWE5Pa2N6QmxKSDV3SHZRWkxwSFZOOERrUU4xZkNjWno0Ny9p?=
 =?utf-8?B?UmVwaS9wRHRibWpMRTlGYVlQTzhTTkhtb0dzYkVIY3drN3lnVWxBMFIwQmxO?=
 =?utf-8?B?MUZqQkhMTkZZTlhrK2NjU01QNTBTaEg4VHNGczFFbFJJN2c5SVJCMGNGbnRW?=
 =?utf-8?B?cUhiNXFtMWIvSFR4OFV0L1B5TXNybkV3dlF0bXZGMVU5Wkl5UXVTa1I0LzB4?=
 =?utf-8?B?a29lQVJUS3FwbVFYV0YvUzJDUXk4ajlrZDRPOVVoOGpSR29PNU9hdTlUNnNs?=
 =?utf-8?B?QXlNY3VicTN6RGhTL1lyOWVYZWxNN0YrZlcvblhZZ2FYaHJ1bHpMN3pKbDV0?=
 =?utf-8?B?dkNhanF0ZG5RUWFmL1NYUlUwbEluTytyVmJDazNyUHE2MVc2NUxFNVRzMzZ6?=
 =?utf-8?B?RXk1N09Eb1dLTHJKL3plQlQyWXA1RzFydisvbDM3ZFhoakVXN1RLWkpTbnZ4?=
 =?utf-8?B?Mnl4dXU1WFJTeGs3dGFOdnBxbFpIeXpnb0hWYVlmNjJLaTBtT20xQzR3cEhQ?=
 =?utf-8?B?Y0FOWXlyOVBzMkVYNXpaQkNuTUJIZ1dwa0xVYVJYenZNQmVNSjZtdjJTcFVj?=
 =?utf-8?B?OGFTRGZoZG16RldlNnl4bUtFam1hZHl5YlI0ZkZFQkR2dmxHYU1XdTUxY0Va?=
 =?utf-8?B?VlRMZFh4Q1A0Vk11Mm0rdk5TQzRnMWdPWm5scHZSVnJPVjU4SnB3UkRPbGJl?=
 =?utf-8?B?ZWlMOXJOeWR2MWpyc0MydS9ETXRyV1FzVEwvMDVxdmJaemkyMFVDQllvN0Ux?=
 =?utf-8?B?VGVqSUY2ZjBaU2pwRGpTS1VHY1hFRmx4S1hoZVRnU2crME9kdktBQ0U0SGQ0?=
 =?utf-8?B?WkxCbjB4QXZxR284Y3QrbUY4OHBxNXgwbGlTcXNQaDVvR1F6UExpUklFdGE4?=
 =?utf-8?B?UkY2T2ZkQVR3MU96TzVMYXp0cVNnL3dUVVNrbGU0bzNnZ1NFNkNDZnFXNk8v?=
 =?utf-8?B?V1ZIcTNTaFgxUzN5eWR4dU5NUVF3L2xhbTNzY0pyTXEwRTc3R2d5cWk1c3pF?=
 =?utf-8?B?NVNkdGVPNkRuK2RTQ2lMYXpBZkdIdTVGanRIaWpqYkpMVjJ2ZXJqdzRrb04w?=
 =?utf-8?B?Uk1iS21IckxtTkRvajNHc0hydkRUSlBSSkZYd2c3Sk5OQU44eURhVGZKb0JM?=
 =?utf-8?B?TGtDdGIwVlRlSFBad0ZlTjkvV2Vic1B4MDk5MWtiTDdYVW83V0RCaWdSRU9h?=
 =?utf-8?Q?gH/ZLnAFfG4Reo+q/hB2DfEyDuvF7YuOfrTWzv8a64=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 05:04:34.1103
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ed4d0be-9bd0-4521-0c13-08de5d61900a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044AA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4400
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31099-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,nvidia.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pshete@nvidia.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[0.126.165.224:email];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 998B58FF11
X-Rspamd-Action: no action

Add device tree nodes for MAIN, AON and UPHY GPIO controller instances.

Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
---
Changes in v2:
  * Update Tegra264 GPIO nodes to use “wakeup-parent”.
---
 arch/arm64/boot/dts/nvidia/tegra264.dtsi | 88 ++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra264.dtsi b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
index f137565da804..cf4de2c517fa 100644
--- a/arch/arm64/boot/dts/nvidia/tegra264.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
@@ -3277,6 +3277,50 @@
 			status = "disabled";
 		};
 
+		gpio_main: gpio@c300000 {
+			compatible = "nvidia,tegra264-gpio";
+			reg = <0x00 0x0c300000 0x0 0x4000>,
+			      <0x00 0x0c310000 0x0 0x4000>;
+			reg-names = "security", "gpio";
+			wakeup-parent = <&pmc>;
+			interrupts =  <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
 		serial@c4e0000 {
 			compatible = "nvidia,tegra264-utc";
 			reg = <0x0 0x0c4e0000 0x0 0x8000>,
@@ -3347,6 +3391,22 @@
 			#interrupt-cells = <2>;
 			interrupt-controller;
 		};
+
+		gpio_aon: gpio@cf00000 {
+			compatible = "nvidia,tegra264-gpio-aon";
+			reg = <0x0 0x0cf00000 0x0 0x10000>,
+			      <0x0 0x0cf10000 0x0 0x1000>;
+			reg-names = "security", "gpio";
+			wakeup-parent = <&pmc>;
+			interrupts = <GIC_SPI 538 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 539 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 540 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 541 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
 	};
 
 	/* TOP_MMIO */
@@ -3726,6 +3786,34 @@
 
 		ranges = <0x00 0x00000000 0xa8 0x00000000 0x40 0x00000000>, /* MMIO, ECAM, prefetchable memory, I/O */
 			 <0x80 0x00000000 0x00 0x20000000 0x00 0x40000000>; /* non-prefetchable memory (32-bit) */
+
+		gpio_uphy: gpio@8300000 {
+			compatible = "nvidia,tegra264-gpio-uphy";
+			reg = <0x00 0x08300000 0x0 0x2000>,
+			      <0x00 0x08310000 0x0 0x2000>;
+			reg-names = "security", "gpio";
+			wakeup-parent = <&pmc>;
+			interrupts = <GIC_SPI 843 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 844 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 845 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 846 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 847 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 848 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 849 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 850 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 851 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 852 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 853 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 854 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 855 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 856 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 857 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 858 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
 	};
 
 	cpus {
-- 
2.17.1


