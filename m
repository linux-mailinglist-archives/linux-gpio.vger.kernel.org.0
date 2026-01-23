Return-Path: <linux-gpio+bounces-30964-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FENHG8Yc2mwsAAAu9opvQ
	(envelope-from <linux-gpio+bounces-30964-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 07:42:55 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE4D711B1
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 07:42:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A0357301F14C
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 06:42:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E95DD33E345;
	Fri, 23 Jan 2026 06:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VUq3Qnbb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013008.outbound.protection.outlook.com [40.93.196.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC7B3396F1;
	Fri, 23 Jan 2026 06:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769150550; cv=fail; b=uriGLaxIJlz0VmPirJSnWCqYZHRZLdkKKn7hy28TCwhmuaNj+rRKkgBw6ouIk6Ia5v5OUlkPlc5BRN69A0sTP/vLQnyL6eeRolxVSxZObrZePf8+JD8kWDOmke4r/KAwy7P/1ezYa40WEE68HQB8HB0n5eDrmqAoDSn4A+h9TnQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769150550; c=relaxed/simple;
	bh=VkX+Ux75PPAPtqNUSzk6GbeEliTOjsupM4O5BfGawlk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NENadhjT/ebpQquVQi5Bh5FtXfXfOOt8bZ1+mbgIsMROVYIo7jaTv3amnd2f53sccGImVdc7YOQ7mLJeNGRvq0hZlrE8FOZpN3SJI6evmewILbtlCxH4SLBnxny572u4iHNfjP34mMlZlZ5RWgV8dKda7MiFOl+lk3x/emQW0Ws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VUq3Qnbb; arc=fail smtp.client-ip=40.93.196.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pQOAvI4YiQvlQ+NLMhL1smNBdCipqMzC6FC2hM6F44wgnEcwBHt16rS3N3S8Or1EaOolygL8kU+8NLnwtgFwzPnPCclvj0KSmE0AZc4iyd5MOb74J+jhqMq6Pwrw3I+ZcwORk/DJP+bydyIvC8GKLpayAU03yI9debOSSmzvBQ6TmectllXbZdo7GqVUF/GZj2bfEd21h9gLr6Eik4zYj8YTsje98PVi+70ytzGaTmSpWFdVx0n8Nvwug8gYiK8C1x/bJuLVlk5TeNEFBOz18g0acDq8REGXK5ij2+mzAI21D5GOEzN3ta75H0ouSW5CVVATx0wsMxFLZZrFKrLfhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gjWi/Ij4lVSbtjk+PhaRmq4G7zNTNXBsFsqlWQ5B9oE=;
 b=zKFWcRoo3olc7MBz5QO1q70cw7mO7L4o4dY8d9klmxXYotgrcqJlFohwCzcEMZuAPNJgHEdVe32y2KGqcz2Jr4nK3dUk7h/PBRm+BKWVmBzspvv+q92+UHhJUp8eShMPyj4RTz9VZx/kAg9o4qb/3H/3+FVSxXaZDV1j4ENWaByYwWprHIRB4gmebVoy2vuwtShrdGg/cFolBN3qKqAUSESr+w43ocq9wxcpHYPFFUDLxn+h7KjC5tUOsG7AeiGS49SuY4bmUfbhHERotsDeKTv9AwZAhRdnWHfLyCmdLdzwtOne9MFZRq0HoxkjJLqsxKUQjMk4EaSsrHCkz49zhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gjWi/Ij4lVSbtjk+PhaRmq4G7zNTNXBsFsqlWQ5B9oE=;
 b=VUq3QnbbgXpGZoFDTcvYyeCnl595uSE27wZMqQQ9K07o4OFuPBByKCKMf8sQrGIjmzxqw4BqLKVoWvBNIBueqIk09Cz+yW2cqDpmmbDcMIx82iLj8lqU6Ij++IUNMP4ZmNeSaD2CBV3UV2I+Rd2GTf0sV10KOLPma/8ct4Ly2m2jyYI10nXeWYHj1OGQQddpRB1n1ACaOugUpZE01bePjGUnY0xnyKIZ19XFSz+5sa9dzYkxsHO9sXxV351QMpd+aPSaTMVyoO85jMPQEx+szi/HwjH/qTp9r+YVpAT8F+mE7jqQGEo8pw+URafNdsCEPphxHRj0iuf93PgRyizh6Q==
Received: from BY3PR10CA0010.namprd10.prod.outlook.com (2603:10b6:a03:255::15)
 by SA5PPF8ECEC29A9.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8d5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 06:42:24 +0000
Received: from SJ1PEPF00001CE6.namprd03.prod.outlook.com
 (2603:10b6:a03:255:cafe::83) by BY3PR10CA0010.outlook.office365.com
 (2603:10b6:a03:255::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Fri,
 23 Jan 2026 06:42:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF00001CE6.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 06:42:24 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 22:42:08 -0800
Received: from localhost (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 22:42:07 -0800
From: Prathamesh Shete <pshete@nvidia.com>
To: <linusw@kernel.org>, <brgl@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<robh@kernel.org>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <pshete@nvidia.com>
Subject: [PATCH v2 3/3] arm64: tegra: Add Tegra264 GPIO controllers
Date: Fri, 23 Jan 2026 06:41:40 +0000
Message-ID: <20260123064140.1095946-3-pshete@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260123064140.1095946-1-pshete@nvidia.com>
References: <20260123064140.1095946-1-pshete@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE6:EE_|SA5PPF8ECEC29A9:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dfbb495-b6c8-43b0-86fa-08de5a4a913d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|82310400026|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Wk5DWUFnbXFHWWdEUjBjSjFPL3BjM2JGc2h2OUFCczVuT1BQSDY2WXVpMnVy?=
 =?utf-8?B?dWdHUFBpOU42dGYramo3b1c1MlVRakZSWnJYdDF3V0FOYnhlZW1NdWF1S0tQ?=
 =?utf-8?B?SDkweDBoTVdXdmtyL1pEQlN3MldPZHo2Y1A0MVNySk92UVROeVFmTDQwN1Ji?=
 =?utf-8?B?bUlpRGI5UnZ1WVh6Q1Fmb296TzFFdDdQL1lnLytDOXFJUmhpWVNhU0JaeEp6?=
 =?utf-8?B?SU1Ya2w0T0lUODR5bFk2cWpPQ0gzandsQ3NnWmY1cVM0ejJ5M2hnNU9NM0dU?=
 =?utf-8?B?UHcva0xCdXlhTjNxeTB1NWQwcitYWjlXa0JFdFRzMEZmOXFEOHdNblA0WUJU?=
 =?utf-8?B?cG9reWdRWit3Y05pM2FmY21oTllzVVhkMkgvVjk1VDg3dkJMcWhRSGRjZGpa?=
 =?utf-8?B?NkMwcjZZeDZBSlNnRGUwYWxYOVFlT1ZZMU1ESEJHL0RrQ0xFVHRVaUFBajV5?=
 =?utf-8?B?WXhWbEp0SWxZTCtWcVBpNlNmQUFsZG81Y29UeVdiclZNQ0NyaTVORFE2cjlo?=
 =?utf-8?B?MEVCYmdPcXowYUpIdm5xa0ZvdWxSaHYvcVh4RzFsaEd6d0pxNEpLV1RWdTZv?=
 =?utf-8?B?M21HUFJNeVNWbC91ZnZmMUJFWUxzNVAwaDNLZThkNFJvWVE4L1dmWkpLYVJ5?=
 =?utf-8?B?aXNkSXFRUVV5dktOS0gxb1Ixb1h3dEZNSTc4QzlWTWxMajNTVTVaY0hXUUtT?=
 =?utf-8?B?NUd2ZUNqZjFiVVVFcEhHUXFsMHpUNjlJSk4rMWdoQWdrajBJVzZCa1lla2JB?=
 =?utf-8?B?VldYZlFUWUpSR3podWhRcW5uMnpMbVMzT3RRWVcxZi9EbHVKTHJhWVRPLzlx?=
 =?utf-8?B?b3RkV25ZM0V1OWgxOHlRU3prOWplMENBUEhhZ2cvSGVBN0dPY1gza2dRZVJX?=
 =?utf-8?B?aDczdVdoL0pXbWtvT1JybDhEQ2h5U0RuRGRCSFNQdEo5SnFYMFV3RVYxeFJO?=
 =?utf-8?B?bTI2MS9FU21vTHhsQVlVUVgyWFB2ZmJscGhQK3ZLdE1QblN2UCtIRUxzb1NJ?=
 =?utf-8?B?bWxpUCtKZVZTeTBoUlRwcVZ1M3VaVjZ4K0taNmdVVEE2Zml3bG9lTnV0eXZS?=
 =?utf-8?B?NkROaEtwK1RCVFBscXd4a0FzaFJPeWhuSVNRdEJYcStpdmRsMjJ3WG5zd2dB?=
 =?utf-8?B?RnpaSTM3TEI2dlB3Z1ByQlVDSlRoSjZCZ1ZMMTJaSzEreXFObzJMZ21BRit2?=
 =?utf-8?B?Y0VCQWxhamZUUkwzeFNXeUJFMVBkOHdubFZEcmtuYXozRGp3K2FJc0oybGZu?=
 =?utf-8?B?T2RlYVV3bTk3VTMyWnpxbmNpbkhDUGJLT3JTSjZLS3FraHI3aWVDbWlhSTBk?=
 =?utf-8?B?OHlkL1NHL2p6Z0ZGY2IzdUVleTRXeFRjK1E3NWVQZ0lYelNFQWxoell3MW02?=
 =?utf-8?B?SUt5VlUvbndTYzkya0FtcGo3VnVBRHBpWGpPaVpRMXhoamlXdTBEU1A4aDhh?=
 =?utf-8?B?aDhPbmQ0bWVkRkZzVGIzaDNNNllvRjh5SFhSR2x4S0NweFZwd2xQMFVReEI4?=
 =?utf-8?B?ZHpPS0NRTzc1MFR2NlBPTWhRRUIzTEdka2ZrQUpIWE8vR3ZpOXR2QTlWRlls?=
 =?utf-8?B?VW1qc0JDN1RlZFpJakVLSm9LR2EraE5sRk1oU1pqYWtod2UrTWZwdEE5eGMv?=
 =?utf-8?B?VmJBV3J6WlNHV05BYWc4YnNmM2lIdzZoSUJ3SVk3RnR6bXBCK0dQekZhajR4?=
 =?utf-8?B?cnJ5YWl1TkpiQ21EQnR4SkMvY1ZSN1ZoT3R6MEc1di9XTVp2YjF1cDRRdDFF?=
 =?utf-8?B?SDk3NGFLVHBpTmdtb3gydUVQSHNPekJTVTN0S2V2SHpkN25pN1JmT0kyTmp3?=
 =?utf-8?B?dTZSczdPMTZ1NnNUSzFTajVQeWlZUTVyWTNSUEdySEJ0am55Y01LYVgrMXY1?=
 =?utf-8?B?b0pJOU5qUCsrTjlUQWpFNVRNbitzL1c0VWIxMENwNzZFUFEzMWJwZXorZmZO?=
 =?utf-8?B?NjRJZXdEd0M5SVpscFI4ZlRGbFpKcTdHbG90TnNqSmRWeithejNoM05kRnNM?=
 =?utf-8?B?SVdiZWtpOGhQZGs3QkQ5eFVDb1NPUFVxLzlXYlF4Z1JUamtDSUkzMXQzY3Bq?=
 =?utf-8?B?bzh2aHpxTUtuUTA1MjZWOXdsWFdkeXN4YlNkcmErKzNRbmp6d1liTWdNY0pE?=
 =?utf-8?B?NUI2d1plV25DNkhrNjBuUEFpMERMUk1TN282em5meFEza0R2aHpoUThDcGNS?=
 =?utf-8?B?Mi9YWldiOGFEcGVIWFArYU9CN0JRY3VOR3VUbzJzdlIybFN1cXlwK21OcElM?=
 =?utf-8?Q?UunpLvy23zIvq+X6TojJ81UIOQzDAdWZ9MIYAUM5v8=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(82310400026)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 06:42:24.2605
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dfbb495-b6c8-43b0-86fa-08de5a4a913d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF8ECEC29A9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30964-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,nvidia.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cf00000:email,Nvidia.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.126.165.224:email,nvidia.com:mid,nvidia.com:email,c300000:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pshete@nvidia.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 2EE4D711B1
X-Rspamd-Action: no action

Add device tree nodes for MAIN, AON and UPHY GPIO controller instances.

Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
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


