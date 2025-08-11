Return-Path: <linux-gpio+bounces-24210-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A374FB213A5
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 19:51:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 95A7F2A5241
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 17:51:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65E6E2D47FD;
	Mon, 11 Aug 2025 17:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OVxebSm0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2078.outbound.protection.outlook.com [40.107.92.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCA42D372A;
	Mon, 11 Aug 2025 17:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754934666; cv=fail; b=Bs1r/h0H0kZ9Sia4sz6U4d678njX+HOXHRkTnlUcIfLHXUZDX5vdhXDlu9r+WDia7dBMmfKaF8olvwnBX6l3Od4JwVPi/7/5xXqW1LLF4dsrEKF8jhfpMXCoSHRGYpM28mt0wpg2+W5R1o/4RSoPSX6m+T8lY667g92C/O4PD/0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754934666; c=relaxed/simple;
	bh=0wlUXw0wCYCbbyFxKSQs53t296hALyfqTraSKyuLp10=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=r+CcBY98/qVYVOvZ7AnOLJTe+KCpnf/0fKuM50MQ1CAm+bGi//pNWFFsll572lS1At32PjOtk168tbrsKeO3ooBPMgI5m3XbMk5yDdRQDjsIlfIS7gJA0Y66y4Fnr+uVUgHlwRNlJD0cEjfUMooQ/yL5M3f+IwQoAu5CGYN+fls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OVxebSm0; arc=fail smtp.client-ip=40.107.92.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ft4bsYLFxVLs+NE7zpqF/YGDy6NUZfQ/oF25NpCnpA+Wix40lCqFWmMHJpjHPs5sCY65XjeQuJlCckS7jBVhTEOtRRPF0rabCOTIgovHufJNY4ww+aUvNdA94nMxkkPmBr2F1wEybduO8lLfxPL03a1W/KmIYCHK7KtSHVIgL90I/hvCcpp+2qdMdTSSXZs65CmXyb/QX/l71l5GrtYk8uJuk9AwyWh+mrjwKDGkmk0g+g8K2fP2MjNVSQCFTnl6DhMVXxYBIMlZ496q7gdD4UYcxHWaVCg2hx1V0BRge33Fa4Wgr0DFXpzqee7GHE+HbfMfCMMusB+WWP9gYfJPcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HzJSvH2xy+EA67nbU3D+sYl5SXcgqh7Sjkkh+SpuDWA=;
 b=tGB6RLRg9ddl7gLqQ0a/Eo//219bcQbRN9VoEURfyIlO1wQ1RAIzPflij2+VmXvtHz2nNpHPJaoIO0G6tCEhFE7O6Kohrxvq59RxAIyWaI3XK85QWlmyEltKvLOv3RtghDIb6SVOWENAmop4O3cuVBedHR0wqJnTMXW9E3NWiOTJIzrLc4H5SjGAco5i4abEFZbZR2pekqZjcjLyJ8zgyKwtPlvzTANGHqTMBlCF74D8D+9cqlDjTw7/AIWwezBxtsJ5vbN0z3bD8F+dwnNrHDwiA1MQMn1jvNZzXDXNmJJ4/LFtctiYXtA/YalB73PPn/GKx/FoNq6/lW0tqN1MoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 216.228.118.233) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=temperror action=none header.from=nvidia.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HzJSvH2xy+EA67nbU3D+sYl5SXcgqh7Sjkkh+SpuDWA=;
 b=OVxebSm0Gx/vnGdTHa03CN7iLt1DDSWhgQ6O0f2HJBpzHfw1jEcBpdPUSNTdIFrvpWB1Z4yXq00XfZVj8MR8CIovFg2SPm7u6ndiCyv78LC0D1JSrnp3gKNGViD9LZlSfIRtoKD/Ykh644kXj4pSMu0Kvt992mzpDEx60RsqD1lbZpETIuDerLSianjeQe/ZMhfjQa/8AiNcBFoMFORp27VEjbdVJScdCSp7+wRHVxZ7izzExBNbaB0QzmgyCDY6CSegNSnBYrJg2Tr92Yd30ldrxZYqy8L2s/nfq3ENWf2tJA/cDq//xAeYnGFKSzoA/zpN3fsks5cazTO1ann/Iw==
Received: from BN0PR03CA0017.namprd03.prod.outlook.com (2603:10b6:408:e6::22)
 by DM4PR12MB7766.namprd12.prod.outlook.com (2603:10b6:8:101::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Mon, 11 Aug
 2025 17:51:01 +0000
Received: from BN2PEPF00004FBE.namprd04.prod.outlook.com
 (2603:10b6:408:e6:cafe::bf) by BN0PR03CA0017.outlook.office365.com
 (2603:10b6:408:e6::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.20 via Frontend Transport; Mon,
 11 Aug 2025 17:51:00 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 216.228.118.233) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=nvidia.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of nvidia.com: DNS Timeout)
Received: from mail.nvidia.com (216.228.118.233) by
 BN2PEPF00004FBE.mail.protection.outlook.com (10.167.243.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.11 via Frontend Transport; Mon, 11 Aug 2025 17:50:59 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 11 Aug
 2025 10:50:51 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 11 Aug 2025 10:50:50 -0700
Received: from vdi.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Mon, 11 Aug 2025 10:50:49 -0700
From: David Thompson <davthompson@nvidia.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>,
	<andriy.shevchenko@linux.intel.com>, <mika.westerberg@linux.intel.com>
CC: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "David
 Thompson" <davthompson@nvidia.com>
Subject: [PATCH v1 0/2] gpio: mlxbf3: revert device name logic 
Date: Mon, 11 Aug 2025 13:50:43 -0400
Message-ID: <cover.1754928650.git.davthompson@nvidia.com>
X-Mailer: git-send-email 2.30.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBE:EE_|DM4PR12MB7766:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d19a674-bf93-4786-27e4-08ddd8ffa198
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DKfpzxNqeyOti413frNw1kPkdLaFuoeYUyEw0o0v1BCxwcSKKwl36OlT0arf?=
 =?us-ascii?Q?45j3TcSCMM8DPVdY5I9DGqAgHUh8SWI0QGmfSGjsmEeL5qEckXejLBt+xXS4?=
 =?us-ascii?Q?SV2kUfVIlmjfBl5xHHLD8db72KuU0ukI9+/zlkggedVKmzuXw0dsZ69oyOVZ?=
 =?us-ascii?Q?n05ynC1aLL5x4nvBh/3xdKooTxTIwjiihNkQ0ixinTAEnqtTo7zH7Cymotq4?=
 =?us-ascii?Q?NnUb+L2jUYe5UyMzK3uXUXmPassxxk+u6TPi3XiE7mdaFuyCpz4WWzh/F1PT?=
 =?us-ascii?Q?38BuRZOZpbK/Bm9iFStw6zhQxSgfjQfN1K1JFucTtYbzKp26W1gijTtprW+z?=
 =?us-ascii?Q?gdKCWs4qdHqMzZsOVKmPJ/HHMqIZQHSxHdGy5XV5fj9wpgj3Q2QY2pXyJdQl?=
 =?us-ascii?Q?AjDys5qs8ns1lPPIrxlOBo0AOzhyHi/VDJ/RUPd0f2OMLiup9XbTjPLwS8Gh?=
 =?us-ascii?Q?LRS1rp46xPRjWPJDKgOpUhQgDKpfIaMb+hZb3i8MoNx+z2cyA6GJlZmCqfQ6?=
 =?us-ascii?Q?OE8pv6rzGMK9Lh+KC6zRQkUpixS7bM9/DOY7p7H5J8A9v8nkJetzjXybuLjX?=
 =?us-ascii?Q?S4fHdmMBxvg/w9+qp6JLuGgU3kjxokBXbEJv8wHu0/yo4aNvk6lfk1ErR7V/?=
 =?us-ascii?Q?xlNE4opFrR82ZaZEysYBq2K1wWDPaw2P9NE5BRiwDaeGVSzZwrsYGr9PHZMc?=
 =?us-ascii?Q?17ZOFTzq3d+HQHynQF2W6Hr9v6RoZzD12XRR8cLdpZs6F7SHTiQQYuhTAXTa?=
 =?us-ascii?Q?WnzCC5+aO0tVngVISTHK467BNtHs6Vwf/5Ur1y0PYGRPCPUeF5WWBgouNMGZ?=
 =?us-ascii?Q?k9I5vq9GjeZsCmz0m6Yd8sf2z3XcA7dj+fFVx8RyB/1ZjI8RZWQMmeQTti1B?=
 =?us-ascii?Q?DPaP3623eFNJDqdYE1cKQuS/MNO34Fj4HD0Okaa8BxVKZyNSglS5SlIDl179?=
 =?us-ascii?Q?P7m7BENVAOMZs3xW70ctn+lGfkQfRy4BQVSW8LCertMnFc5DPPKyQE4aBhk4?=
 =?us-ascii?Q?RrINmigv+9NY4hm7EKA0MDRQNdM8FppTf0ZHdzh1FQGh4L6kvqCydUTErQu4?=
 =?us-ascii?Q?TpRENTDsTJ7/O6Zs7VGIddoiQHe8HJzT/j2L2G/6yW3W3/K1jWPLGFIDM9L0?=
 =?us-ascii?Q?xzZvfPFiYiIYNZCZUTp3C2a87AlbUX7+U9kchlTOF6AjZDrqCZ/DSH041qSm?=
 =?us-ascii?Q?X/+LRqD4nSlGRcTHt7pL2Nixf0dMY59qPgrhYqE7IswuMFHURGNr86bxNocj?=
 =?us-ascii?Q?eriQqAVLX8awZwio512zdT77uhWdrKSz6qKKhd0NfK2ixwX2W+eqWwhfcJN8?=
 =?us-ascii?Q?kZISSRw53NTkexlKFqudaPlqAPjGwQnfcvZVmgzE7HEx2GtCU/kE6uMfXAu6?=
 =?us-ascii?Q?DWTyw6j3fvSpf7YtaH91bF9u1KQZ73Wj/2FyDwl6BXdjUibg/SumrZxVXTv9?=
 =?us-ascii?Q?qNIkNL2TSoa8k15PT3lzXMbj4A4OwcsNRbSt/JTTg60GfNLq1vCWKWQefctN?=
 =?us-ascii?Q?hI8mxx+wfUfZdqmNSZ0UPt1bsFm7SMHN2Tfn?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 17:50:59.4597
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d19a674-bf93-4786-27e4-08ddd8ffa198
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7766

This series reverts the use of device name processing
in the BlueField-3 GPIO driver "probe()".  Instead, the
kernel API "platform_get_irq_optional()" should be used
to prevent errors being logged.

David Thompson (2):
  Revert "gpio: mlxbf3: only get IRQ for device instance 0"
  gpio: mlxbf3: use platform_get_irq_optional()

 drivers/gpio/gpio-mlxbf3.c | 54 ++++++++++++++------------------------
 1 file changed, 19 insertions(+), 35 deletions(-)

-- 
2.43.2


