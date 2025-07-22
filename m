Return-Path: <linux-gpio+bounces-23656-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 303B4B0E4D2
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Jul 2025 22:18:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06BB5580775
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Jul 2025 20:18:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ADDF2857E0;
	Tue, 22 Jul 2025 20:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="F3GIfv8t"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2127.outbound.protection.outlook.com [40.107.220.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDA028541C;
	Tue, 22 Jul 2025 20:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753215399; cv=fail; b=OE8fIC8wRxPm85H4YIrnCaEhghyND8WPyMrQ6Uobtc205MZFb2t78Cp9nmBTPiMiMiI1PAjifJSjhmiXDMs5hSYF5oLKp4pi+T/JRwKPnu6xLy2DcAg6a4w8dL8G3umYd0aEmDOF72d0VY5hZRDFYHYr1aO2h2Od95/B2tlcQjw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753215399; c=relaxed/simple;
	bh=h7/reQekMZR33wAXmkF5fcG5ZASoES1o8MpTsQBpBy0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kvUfK8NHOkW0KBH3Fu1kWisWROtk3Ggle5hgyyImRzOdGH5VLqNJ+084qPyxAsj3TBmtuiRtgJcGbER/JenaLkLc3C8ABvJOcGEAdXZ+prUVYNQ8LD6+pIAw/CLcpC+dz/sZViqDaNblDkfbaE7UpZzCNcsqYvk9XtUoScf1TjI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=F3GIfv8t; arc=fail smtp.client-ip=40.107.220.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=doGBkg8NCAAry4OvPEQB4PQXQp16+jAZ2Kyj4JUaANsMwENVMEiqVbnTkMB66fAJmlJdusbvWSOldUdlMmokb02BNdEDHYvZHqiMb/Uv3tJeh1tqYB6C6L0PDBVavrs9tIbdW4+JDRwIBLpq82jg+V6LQgdGA2dZnSgXaZll1j1wRbSDhMOaAH5Ghfrzx0OSWoYkL1tlrt8Hl/ItX/dmbxGKhREcLeghwcUkFEcyHyIxH7+6hmbWIi/Z9R3UuRpIejkkdaw884zMuXEoxswQ3180/2lPGDxu9R+YAgA4Q41LOXXp04XCKBpcnyIe/BKwGJgL/RtIxy4Lff0XMWH0qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4eGSMBpgEbEaJCnQ0epbgv38LSg+oygYq6YuZdlPPI4=;
 b=QKuV6O0UperZ6ybEMFe4xWXIF01UOEpqikyA46pmGelXslHgCqplCUp2mpnPhx8nx0iQJsT3DK8TFV+sJz5lj3ouYUSh6mP7Dj1RcBwwk5FnGQehQcNTpK7Q0weXPxwpVCMqlce/IV+Epb3r5jNuBfU1SnGzwovMJtp4l59lUedx7AJRaBl0OVdfWX40rpkCR8/HNFMtwRXf65GeFCHyhYjx6ezyc2KnQwxjBRgCOm6MuaErpSf57E8iv3BjXZg2uRYZsR7+squQPDmI87hVTKoDGOVvlgpjgB0ptFy8iZOekJer/zG1ojzS1CVOcypGGx/iHgO223vWwLjktnFwpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=arndb.de smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4eGSMBpgEbEaJCnQ0epbgv38LSg+oygYq6YuZdlPPI4=;
 b=F3GIfv8t6P+JNMthWfB5IubkVoA9dpsDkk+ZBzQX9MqIyY7lsFLkvDaRY/Obh12EPy2/m+U5hINX7SQ+jNuzOWhhOW6PrXFl3LdJM2HwM5IGmweUNSQGWdVJMG/FQebWLRftjBWYRL4xKfUQ++vvC1omybfOlFAwJPVjHgFr0d9Y39Fm6kQktgxOT1YdftPudk13O/j/YWdcVnjVBXR6f0BGIIDVMzE8bPu1k3Ibh7dAu6jnKGfXgN6mOEXBm1FPpsQYfcRTRXVUDyR6Bkg1yXxUem5CzWXyeTcu5DKmyyBQUn8lAllytB4uwTSkLc8zdHbDoppAJRh1VrPyyMiRPw==
Received: from CH0PR03CA0029.namprd03.prod.outlook.com (2603:10b6:610:b0::34)
 by DM6PR18MB3684.namprd18.prod.outlook.com (2603:10b6:5:2a0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Tue, 22 Jul
 2025 20:16:16 +0000
Received: from CY4PEPF0000EDD7.namprd03.prod.outlook.com
 (2603:10b6:610:b0:cafe::81) by CH0PR03CA0029.outlook.office365.com
 (2603:10b6:610:b0::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Tue,
 22 Jul 2025 20:16:15 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.1.1];
Received: from [127.0.1.1] (50.233.182.194) by
 CY4PEPF0000EDD7.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Tue, 22 Jul 2025 20:16:14 +0000
From: Harshit Shah <hshah@axiado.com>
Date: Tue, 22 Jul 2025 13:15:35 -0700
Subject: [PATCH v6 07/10] arm64: add Axiado SoC family
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250722-axiado-ax3000-soc-and-evaluation-board-support-v6-7-543979a60ccf@axiado.com>
References: <20250722-axiado-ax3000-soc-and-evaluation-board-support-v6-0-543979a60ccf@axiado.com>
In-Reply-To: <20250722-axiado-ax3000-soc-and-evaluation-board-support-v6-0-543979a60ccf@axiado.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 =?utf-8?q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>, Boris Brezillon <bbrezillon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 soc@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 Jan Kotas <jank@cadence.com>, linux-serial@vger.kernel.org, 
 linux-i3c@lists.infradead.org, Harshit Shah <hshah@axiado.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=858; i=hshah@axiado.com;
 h=from:subject:message-id; bh=h7/reQekMZR33wAXmkF5fcG5ZASoES1o8MpTsQBpBy0=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBof/GDrA4rQ3eIjOxhFzIZ0q6qVuFgsUeuRnX3a
 Sn+0MNO2siJAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaH/xgwAKCRDxWHMRoTLV
 +6BtC/9+UX8TeiJkN5gl9KRLaWS5i9BGlwe+vj+Wngm3uyZ3IUpmrP11jDz7NAY2gAoFnmi++ZZ
 Lnr5clEzvnAZ15Da1NRkURceqW3AAyxLzsQjTC1nQrOJ8M3/pT1gEQ/tx5yXOVw99R3WZsNPDlr
 CAI6PeoHXDZO/kqnNGgrBqxu4kgmHeCBZc/Lyuwe9jb0BLZjIG5lTjbb5AYCHPu2lPqlzwSUT7D
 DZ6Mcyrnqy7nUeHw6zyNF92QJwAK/Pu4ct6gV1pzmrVtuyLMu0f4Ixga68F9hBYZPJ7581SAUA1
 hNnJyXDDdn03LQQJOGYk9HehDJFGX826MMMQUvr0SXaR5WuGVffKDN4XZKv9BIhQry4HUWdSCje
 S8j03k+oQgw/nk62NRfPEdrStAeQc0y3LpO0UadCD4W0zljzMHxM8miv3KDJHIwSQZLP8pD4U/F
 hctfqmWecBhCGsnfgZaJmNaIiphH/EWmQ7HVgAqOWLS+6vVVkngLVrmEJLfNIHMr+M8vg=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD7:EE_|DM6PR18MB3684:EE_
X-MS-Office365-Filtering-Correlation-Id: d1dd0c20-f62a-4a68-d530-08ddc95c9c81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dGQwYU5aWEJpSFVJbGhOVXRYaDFJbWNUSE9CSEFLby9oK1oxcG04cU4yaU1F?=
 =?utf-8?B?b1gwOG8zUzg2MklQbHpxWHhQUlhnKzFtaGVvMlg4c1NJM2VibTFIL0xJaG82?=
 =?utf-8?B?UzBpRTV2VmhXZTFzQ0ZibC9nTUZrV0tGSEZEcVVwRVdnK0Iva1I4NHY4ZzdE?=
 =?utf-8?B?aHZ0VzVtdnVBdzd1bVdLQW5wWFRJb0tUYUtoZGhpaVAveWxFUmNuUVBLNzRX?=
 =?utf-8?B?SlhGWlFBcGlzY2pURmNhRG5qME1oUDZXTDNyaXlhSzFLK0pEMStDbGF5UVQz?=
 =?utf-8?B?anBBR2toNVQ2ZjZRdEF3L0pwd0NtNklyZ3kxQ2FZMHoxQVdmOVc4M2hHWCti?=
 =?utf-8?B?a0lWeVZvMi81TDN6RlZlKzlzTXJVQTl3M2xQU25zaDJKay9JRTVrSmhCUUlv?=
 =?utf-8?B?d3ZlOHFtUmhiMFNBZnZzTDdVMnVhMWdJYUlnOXJ5aS9mZE5mRjFwNHZBelBt?=
 =?utf-8?B?L05PWUloOVVzdUpNSkJadjlOV0NjRHR1dDdTMDJvYmFUbHlQd2tUR2NqdVpP?=
 =?utf-8?B?ajZaYnh3L25aVzVBcTFVbHI2MTFYVXJ6S3k0RHFYWGFTWXlGZDNlQ0tUVDJU?=
 =?utf-8?B?cGxDTWJFN3lVTHl3dGt6ZEh3emkwVzV5USs1QzVLWFFTejhGZU5lUkg2bVFT?=
 =?utf-8?B?QjgyUStSYnNEeWJXKzFtMDVlOXBDTVNwYU9Ycm1DQWdnUUpoanJBVjFESTM1?=
 =?utf-8?B?Z2EvMCtkeHBJM3lKb3pOa29USS9YWkpqa3Fwc29tbkxBMGI1UWQ4WmNlQ3By?=
 =?utf-8?B?Vmc2VkMrTVpYaE9qemN0cnl6S3hBY2d1T05Eayt2YWNya3BJTUM2eVVERWpw?=
 =?utf-8?B?cStaQ3ZRZno5UnJvc2V3UzhyZkhLU0JzZWRDTmZLQ25VM29ORHZFYXFNcmRk?=
 =?utf-8?B?emxxS1VlNEtyTk9QVmZjNElzUmZiN0tSbWdSeWJVZ1l6STJoV24zRkF1blAz?=
 =?utf-8?B?SnB1b29SSklKZG04NlU5Smx0Q3NpZFJiTm1Td25OZUMrOWhyQ1FiWUJITDAy?=
 =?utf-8?B?M2tDYUxUaDBIbXBmQmN4VGxtNDk5UlQ4TVR1ckxwSENuTmsrSzFDUnlrdW83?=
 =?utf-8?B?aGVFN2JYQk43Y1IwdDhQNG5RM1FQNGt4Y3VsNC85REVsYmhJbmtYb2orSVJ1?=
 =?utf-8?B?VmEvZm82Wi9OVExsbUdwZlF2NDMzZkJudE5VN2FZNUhNRnM4Y1NpOWNXMWZp?=
 =?utf-8?B?YVRQcjlnWVhjT2VCT0lETjM3bDVDOTBkbm5oeFA2eUlBZkt6UFBDSW05Y3hl?=
 =?utf-8?B?Q0M0bURRQkorTXRUV01uekJueURrQXJYVWhLMDUwNG1RMkk5VDZVbzZWR1dC?=
 =?utf-8?B?U2JvSTUreWxlaWlTeWwySDRVVzErZWpNcS84Zk5SYmJ5TmdaMFpieHNNOCs3?=
 =?utf-8?B?d003Z1BRWDZaWnNhdklLVGNXM3JseUF4WkpRSjlHTnBYdnFqSlJkQ095MmFo?=
 =?utf-8?B?eVFpV0Y4NzlJV3JodFJSZ0gxTFZ4VzcxcjBuYkdPZmxTL0Z0MkU4WmxxYUpM?=
 =?utf-8?B?M1VGam1oQU53d2xqQ1BTWHN5OFo5TU0zdmxOUW05ejFUWVBsbDlnMngzLzM2?=
 =?utf-8?B?b2wrS2NtZmVOR3VlREFUYTBsZGpBb2grVFp1K0xsdTh4b2phR0dTb0x4cGVM?=
 =?utf-8?B?ZHdYMmZXSWo0N2dWRDA3YjhiSDFCYlM2SkVoeGVIa3FWK3JCaDZVU3pncDVx?=
 =?utf-8?B?NnRXdTVWSDB6TjB5RTZ6bzZXZWgxZzdzcnJvOVBsMHFaVUw1eTdOVkpUcVVk?=
 =?utf-8?B?SHcwV2NrVmN0dWNZazRFcHNaUXlEOXgzWnhFbmFsME9YY2k2SjNUQk5iUnpo?=
 =?utf-8?B?bFdGYUFQMWJRWVdIVkY3akpJSkJrOWcxWmdLeUpXNVNkUldHNUgxa0hRU3Fk?=
 =?utf-8?B?a2VRakovVTRsbWw2dW5BM2NtMzJ2YW4wQkxjZFcvZ0JRQ1JRbmdOSE03d29v?=
 =?utf-8?B?Mjd1dUYvNXQ0S2lzR0NFV0p0dlVCdlp5OHlCc1BhWXZkSWluUU1WSjlBNHc1?=
 =?utf-8?B?SjJMMmdINWxqVU1VNlUzRi93cmZhTHIrU3NqejVoOGZPNGVYUXFlRkdGRkhV?=
 =?utf-8?B?QWwxTk12Z2h4N3RWWXBlYXRNLzhiUmo1K0lZdz09?=
X-Forefront-Antispam-Report:
	CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.1.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(7416014)(376014)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 20:16:14.9139
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1dd0c20-f62a-4a68-d530-08ddc95c9c81
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.1.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3684

Add ARCH_AXIADO for the support of the Axiado SoC for arm64 architecture.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Harshit Shah <hshah@axiado.com>
---
 arch/arm64/Kconfig.platforms | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index a541bb029aa4e1bee095ab3f44e3a52294905616..e998e1aff0fec4aca5e3bf2d0410f2578e25cb1d 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -40,6 +40,12 @@ config ARCH_APPLE
 	  This enables support for Apple's in-house ARM SoC family, such
 	  as the Apple M1.
 
+config ARCH_AXIADO
+	bool "Axiado SoC Family"
+	select GPIOLIB
+	help
+	  This enables support for Axiado SoC family like AX3000
+
 menuconfig ARCH_BCM
 	bool "Broadcom SoC Support"
 

-- 
2.25.1


