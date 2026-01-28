Return-Path: <linux-gpio+bounces-31201-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MtfEiXPeWnezgEAu9opvQ
	(envelope-from <linux-gpio+bounces-31201-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 09:56:05 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E68899E81A
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 09:56:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C8E0A3034287
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 08:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32A8833B6E0;
	Wed, 28 Jan 2026 08:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="eX+7ln9p"
X-Original-To: linux-gpio@vger.kernel.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011057.outbound.protection.outlook.com [40.93.194.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B41933ADB9;
	Wed, 28 Jan 2026 08:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769590314; cv=fail; b=pwQ4n4oWz51b+bZWjH/w+wH965IUHZ5VlpD19lPPX2QvaLGbbctLDG9k+YMkXCPiNp/znZG8Giw0UXI6DJAvwmi9euu5prHfQDoTLEXyk0x0AYOhNoBEjpbbAedbvXmmCKO9Hq9CLebmuBncq/aYBN/BP5UsUJCs08NbNFlHt8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769590314; c=relaxed/simple;
	bh=044D9XlTxrs02Sy1EaPlOhDtVXdZOBC3pjVTahmY3E4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ntIX32C4MaIuKa5+2igBSMEnWMTrgsMva9EKosuCbcvFQY4qd/Dw5nKse121l4oKi5CjjzaoJVHdslXtnRSeX/uv0TPbdKrFT0bR2gyXut66fZz+lOssoBli8mdCWKcTmZpkBIIJ2fACWQKQ5dOULdFj2gh2b4DSbd+tEg4PsO8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=eX+7ln9p; arc=fail smtp.client-ip=40.93.194.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lextneU2GKDGp1S+LBN4epJ2kcYt+x/qLNBblQ42PBP0+GHa+Xjz5nQGQuDHryaTz+fG2x5DujAFvE6rJkxNMsY3bdGR2J4i0z5D8WUTBS2tOR975TDHiBxRGgX46jCBRr0hcZsJIvoGCxxkI4kDDqlXkZeYxXmNYPEZKdwxwtRAJ8BBUMpLo0sqAsCHPER08+wTqa84kYgjQEO6IZvfF/HalAE5THDvCKxBfeUcESLp/QZbDTgvVblsvFdJa1Q49YBSy4GJob5VOpMsBu6/x+sAnA0caTWNSEdh5GfO6Ctvfw2Khw4ANZ2GtgY1ysyjeAw/lDcU77Lyx9XJQkqZ9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=noqUG0bgzb0Mz26bny+vYut7xyNQTS0q20oZpC/B5Os=;
 b=Zf6tcbNIIyD6gnuxxJ2hjHEEaoQPNrAOUWSCw+A8a8W+9vcWpjD2IQeV+VFIb9xCNYmOVfpRM3SO5RhPEhucXUB+PcsMFCnkU5s/ok5Oro6JcuZj4u5Dxnj4tQOB181eWAkMF1DXeSHLgDUGFYRuNBFJl28ht9YmjsBV9QsUI7O0kwJ2e4NVCk8luGPK2JVh3I7GELvpYvQ/gz355zKOmswlSzkZMNpHe9SU2B9BgTYASd74eIPAPLOPEGpPDQeaevA6dVtyPEfTM9dNde9sEYPYnv5G5dzx6oPey6aWaNeCZ+mZ7/c9ZvEg3IStu3nIyWW5hFtZzygNIhJoDrBrlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=noqUG0bgzb0Mz26bny+vYut7xyNQTS0q20oZpC/B5Os=;
 b=eX+7ln9p0X9hGoaIsKUFs6ETrqWIyx6SOmfQr6WPRdC1oZ68Cz6tYYuiNdvCIwSzWhWMc7K6wcZMT9VQi3fxdchhaYuBMquxxUxY33Jw7sExMccsfy1kdcvK633GPWHYDk+AHYtmD11teMOeoqr6K2YmFBx3dO5y55jC2ZQoGWX0jI8hAVKW1U01KxlhREsNYMB4s2cGe1PlxpTJXGczmhGS4N9tTarbzkdUsHSEbqOpaUp2367wFA2iUcRyUkQnSTs1bQ51jKzUw0l+z7Kw9bx2J/UGmVGYvTTmJPr6TmaCn+lBES/OOF5S7YBYKBVQ2wNNrDIPSfRyv675QY+aiA==
Received: from SJ0PR13CA0190.namprd13.prod.outlook.com (2603:10b6:a03:2c3::15)
 by MW4PR12MB7431.namprd12.prod.outlook.com (2603:10b6:303:225::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Wed, 28 Jan
 2026 08:51:44 +0000
Received: from SJ5PEPF00000209.namprd05.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::b2) by SJ0PR13CA0190.outlook.office365.com
 (2603:10b6:a03:2c3::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Wed,
 28 Jan 2026 08:51:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF00000209.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Wed, 28 Jan 2026 08:51:44 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 28 Jan
 2026 00:51:31 -0800
Received: from localhost (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 28 Jan
 2026 00:51:30 -0800
From: Prathamesh Shete <pshete@nvidia.com>
To: <linusw@kernel.org>, <brgl@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<robh@kernel.org>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <pshete@nvidia.com>
Subject: [PATCH v5 3/3] arm64: tegra: Add Tegra264 GPIO controllers
Date: Wed, 28 Jan 2026 08:51:14 +0000
Message-ID: <20260128085114.1137725-3-pshete@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260128085114.1137725-1-pshete@nvidia.com>
References: <20260128085114.1137725-1-pshete@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000209:EE_|MW4PR12MB7431:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f7e5ba5-fa03-4732-9ec9-08de5e4a76b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V3RBWDFKQ1YzSVZtN0MwdjByazVoMGZ2eldGZDZ5akhaSnNGRnVjV0VsZUdt?=
 =?utf-8?B?NHluZ3lnS3ZmR3lVOGYyeGJrakFSajVTTzFWdzlia3dnbUdLdjlvUjFQcjRq?=
 =?utf-8?B?NzdkMXVYRk5NdSsvMWN0YjUydzA4Q0FPQVZwSU5sVkJ3QkhCR2tKS2hLYXlG?=
 =?utf-8?B?TVBmU2tkYkJyS1d0UTArRXVXSW1xd0M0WjU5ODIrT05HSW1aYkRoZkRkMk03?=
 =?utf-8?B?OHdveUtQM2t3S1N0N0hsM0hLK1MxVVpORUtmbVYyQ2c1Q1NIS2hGOEttZTZH?=
 =?utf-8?B?cE4vLzZRRllRRGRXdnFic2JmT1dtT2VIRGhXNXBURTh6Yjd2YThVN203TFky?=
 =?utf-8?B?NnN6TlZ0TzdRZGJ5TEs5cTN2Q1F0dHFmdzAxSnROaTVXdjlYRlN6N25OMWEw?=
 =?utf-8?B?MnE3V1RZYURJQWJ6c0JJNmxCd2ZKVTBrNEUzTmxoSWNvTUdQcHMwSVliNHFm?=
 =?utf-8?B?ODBDY1RPOGNGaHBjSXRkUTZIbFhYbWFVMkZ1ZS8zMVRSNUM1UGdKbUFzTTFh?=
 =?utf-8?B?cm9IT1BRNXhFNjJyUjFQVEhrUVFkNXJ6cnZQYzNscWQ4cllrR1FRYXo3N2Nk?=
 =?utf-8?B?RnpKVmpwTmVDWGswUkNWWXpPN1E4NFVHYU8rZG9VTjBaOTlVSVRWWkF6RzJG?=
 =?utf-8?B?YUFlWkEvaW0wblVVUklGQStDMWtuZndwRXJuNjRxUXhFaFAxRHlEbTVvN0VB?=
 =?utf-8?B?ZExTTHFjdE4vK1lOUWgvVkhNSzI4MTE0Sy80bGhQQWhWZ0RCdTNWT3BmM0w3?=
 =?utf-8?B?UmI0bmhkMHBwY1Y1VjZhYW45YzJPV2FoY2FFNUJ2WUZ1VUJiei84cHZ1eHVu?=
 =?utf-8?B?VmRCQlJOb2wzeVRSamdqNVp3c2tZZjM3NGZVaHFNRnI0dmdrd1dyUVVWQVo4?=
 =?utf-8?B?NC90aXZiWHFaWXZaS0Y1NHhpaWlpYjhkODR6bmFnYTZhZVhXSlZ5YUxoZ0Nj?=
 =?utf-8?B?cXFuNXBoS2hJVWdqUENBR0FaT2NjN2IvVW1nakhOSHVOMDRYUlVyaStJNDg2?=
 =?utf-8?B?K3NkZkorVEJaTXpKb2ozcHo0RjYzVm80L2JGOFFlNmRpQjBzbUEyZWtFdFBZ?=
 =?utf-8?B?VTR6OTVQc3M4WW1IWGVjalBkYkdoZ2pULytrRmhKdERxRnRYMmRtMWN5dFJ3?=
 =?utf-8?B?TVozTUFpU0hjVGZZQjJSYzJReXVQMHhZWlYyMUlyYVBPc2VzOCtjclhjZzFn?=
 =?utf-8?B?M1RYbHh2QUg2VjgwZFBUd3hrOUtzNTA1dkZWU0xtb2pNQkdHRFI5YVh5blFU?=
 =?utf-8?B?WXcxZS9XL2ZHNjQxUFFHSVFGYzBrZlc1TlhxT0xicm9JSTdBQkNnSXZuUk1r?=
 =?utf-8?B?b3NkMDJ6WEN2SjlxbS9VOVJpK1JMWWhaTUJOcjFqYSs4ZWkwTzAwbUxld1ZY?=
 =?utf-8?B?OUxYeU50MEM4MDFqeTUxTFh1dlpyZjRGVi93YWlvSGtZaE9SclJ1UWpLOUh0?=
 =?utf-8?B?WFk4R01DVTBsVlFJcWtORkVFd3NGY1F0QWNEelRuMG1BZEY0dTFpU3EzNmkw?=
 =?utf-8?B?NE5CZlhhNVFxbFJQUFJlVnh4dENtOFNvKzhEMnVUUXNZaldpV00vQjE1L2ha?=
 =?utf-8?B?ZGlUN3k0VEZRYVhWdk03cGdwLy9INGRWRGw2ZXRrM3Rvc0Zxek52bkcza2tq?=
 =?utf-8?B?L0d1OEVPaTNDdWVSZFJQWkh4bURGdGV3eE16MjlHVlh5dlpKZVBMRGFVczhC?=
 =?utf-8?B?dVlRRkRzaTFnV2VDZThTaldrdFVmYVE3WXNHbHl2T2ZLdS8yRVBRMkx5MkhG?=
 =?utf-8?B?TGM2WWQrdWhMZklxMUNwTTUzeGV5N3hiWUE5TnJxTmpQaFp6SlZmakkyOG1B?=
 =?utf-8?B?THJIT3NObERUcmhETzlyWXRxNC9DYnJWQVJ3TlNGcVlZaDIxQUJTMEkrUHRL?=
 =?utf-8?B?bVVpc0JnV2ZxTWFXRXFWVVRqTnVRL2IydjRubFdVT0hzRGx0aTVpKzkxYVBz?=
 =?utf-8?B?MmM0V0QyeEc5aFJrcWdZWGFQK3pkOFBLYlRjaGJ3MDNpQlZIZnZSVmo1azFM?=
 =?utf-8?B?RDNkRmlMdGdUeDhscmthbWNIelQrdGlERTI4ZTh5cjh1RlpFNFZYZWhUYkRj?=
 =?utf-8?B?aUgyUjZmemV4UGUvSHVNeUJ5MWtUc29BUnJ6NENoREJ3YWVOVkhwcWJPZFoy?=
 =?utf-8?B?ZXdMSkJkMktpMnBnOEZmTWJqQUdJZXF5TmVGekU2MGlxM0N2bTlXeXlRN3dZ?=
 =?utf-8?B?RnpsTTFmSGpXUGxLZzErY3ZuVnNsTTZnWlRTV3MzYUlzeXF5d3JSYVRkS0tx?=
 =?utf-8?Q?ZluL3Hj5qxIUd6U1GuLB+yOh75Io2C/t2GhqKaOlPo=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 08:51:44.5160
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f7e5ba5-fa03-4732-9ec9-08de5e4a76b6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000209.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7431
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31201-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,nvidia.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[c300000:email,cf00000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pshete@nvidia.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[0.126.165.224:email];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: E68899E81A
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


