Return-Path: <linux-gpio+bounces-8179-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CF90C92E4D7
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jul 2024 12:34:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C72D284C3D
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jul 2024 10:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A56F915920B;
	Thu, 11 Jul 2024 10:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qSauhvhC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2053.outbound.protection.outlook.com [40.107.237.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55DD158DDD;
	Thu, 11 Jul 2024 10:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720694022; cv=fail; b=CVAEIUD1FuKbRIVmwL4V0kciureOVUQoZ95axZZj5TkHgaN+ASDUz/nLyuTdxVpsphdLEv3xlcrqpgo2HmzO/3M7sfDn+RAgMU6GZYMG2Jkq9iRkgoaGsiWUlhaLpmbxqMnKS03mooepIpARj3/ydGhPSYuXzEsEEZanEE8k4d0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720694022; c=relaxed/simple;
	bh=W7ci1t89oBAVvGl4Yvmy4ZhLj1U+yDUB2HpoMC+NX6Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E41VdMRxf7kDAN96+KdvJQGjd6Tx/THnou2Aa2KHTy1lc4AJhZpNc2Fm3ka6DIHnY6XU785HmC2bTVnTdKP7LPFKPxVQZs5+Ehno6ZvNoNoTBRonDh/6X/mmEe67xqNEjGsUoJ6keV5c5nz6E7H9YA7lP4KvRc9uGVEWUBEkb78=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qSauhvhC; arc=fail smtp.client-ip=40.107.237.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S/bBiv35xElOCQ+E3qsbPwYgnm5u0Fv7n8SirMo5Rp/tbymVd2BU4aMTwxfbaGUimhTsXHvzvDBAVfucf9ZUln38+sJ/1/uFHVkc1cqJ6WZxqoOWSvIrWU8acPMqCdJV9kn8+6QNftpEyM034tF5YW8n8e51eNxpySl89H6vvgEKZbFz5/xGbJyMqlXdwy3hXZfsTEneH9/gq88LgWD+CwTdvYrxGEydFwz4MO7HGOnBZ8vvw0SPn/+bKE2Gex0OvwBxvoOKq7hmWiVtTV1TX4hVVV3pbzYo8mrbD8eYSNTiPMrkdDcFWyxWHYV4dO9ptHqccfZ5hBxhTy4mK3Lxkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1KcGTbDUi0ccrrJBN196pNbz0bDkn2Q0RXz8zqzARdk=;
 b=SGJxcyLceFujTfXZLR0231WfmlG4upAt1EG+79R63r99GuIzKz2gxgeviz3NZZLgxhRgRQuayvidvMYdB4WtL6qnwA7qrdt0YDUEBsL4Z57JWG5jN9D5qLeTjPk8DUl7xvWGyGLRWwu1GtQeKFk905tlM2c7NDsPoedwhUdR9Nbz/U0LsfoZlsttRO9jlCg6lWnhZq5vZ3bZZoH2k7bsVOlPNFVge5SDbOWkVzwuk/aiux3ALU3dNWrKkh0J1gMfwKNtdTwe4qEH/aQLzNh2mXFCQpRf9vjJIuTubc2BoYMdkMV3CGmbrZf/2vz4Jd1AH7Pngysxc1FcKDMySoBBmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1KcGTbDUi0ccrrJBN196pNbz0bDkn2Q0RXz8zqzARdk=;
 b=qSauhvhC4bskG24A/50S3gB55ZcxwcuIJqLFPKyxIOH5LIfFmZ/sFb9rk6B8EOgZv0M7y0VihVB6a205PjS8F8M1IOdKm3xsQiiY97tPdf3i8ZmV9C4KrLX1LC8vMmWcYs5pV1xmgoKhpTr9gu3QHTUhsSRR2IQfMSbLb+xMui0=
Received: from MW4P222CA0006.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::11)
 by PH0PR12MB8098.namprd12.prod.outlook.com (2603:10b6:510:29a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Thu, 11 Jul
 2024 10:33:36 +0000
Received: from CO1PEPF000044F1.namprd05.prod.outlook.com
 (2603:10b6:303:114:cafe::ab) by MW4P222CA0006.outlook.office365.com
 (2603:10b6:303:114::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.22 via Frontend
 Transport; Thu, 11 Jul 2024 10:33:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044F1.mail.protection.outlook.com (10.167.241.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7762.17 via Frontend Transport; Thu, 11 Jul 2024 10:33:33 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 11 Jul
 2024 05:33:31 -0500
Received: from xhdlakshmis40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 11 Jul 2024 05:33:27 -0500
From: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
To: Linus Walleij <linus.walleij@linaro.org>, Michal Simek
	<michal.simek@amd.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, "Jay
 Buddhabhatti" <jay.buddhabhatti@amd.com>, Dhaval Shah
	<dhaval.r.shah@amd.com>, Praveen Teja Kundanala
	<praveen.teja.kundanala@amd.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<saikrishna12468@gmail.com>, <git@amd.com>, Sai Krishna Potthuri
	<sai.krishna.potthuri@amd.com>
Subject: [PATCH 2/3] firmware: xilinx: Add Pinctrl Get Attribute ID
Date: Thu, 11 Jul 2024 16:03:16 +0530
Message-ID: <20240711103317.891813-3-sai.krishna.potthuri@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240711103317.891813-1-sai.krishna.potthuri@amd.com>
References: <20240711103317.891813-1-sai.krishna.potthuri@amd.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: sai.krishna.potthuri@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F1:EE_|PH0PR12MB8098:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e818b66-dbff-443e-bd68-08dca194ea71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AnDv/HCmh///AApagxVugPi3cWAhYaTWwzamWFf0AB9pJ4aB57jHMgI0A67H?=
 =?us-ascii?Q?+CeCS1zmCtNzn+/pWxyrEiMUHSRlj1SP2KeAeue8PVGMX2hHE2FVW7UOkCl+?=
 =?us-ascii?Q?8J+uElXm2CsV357XDRb2WrRBHShg5A904pTP0p+qz5AvmcMg2UN6BToWS7VH?=
 =?us-ascii?Q?tLox56vhad0El5W37RAiqaL6ZUausssBffVk9AEfhmTxIgclZ1z3m7n/aD4P?=
 =?us-ascii?Q?3uTzXdOCRIOLRZFc+rhqmy8gN/K4A717sfLqRbeJG4uD8+nUzGuZJ90o+18n?=
 =?us-ascii?Q?d6ki96Tq0d7ZYUhhZ8eU9karxsnkPXQbdBKtMaX2OfRoZhwKFZZH+v6DjH9g?=
 =?us-ascii?Q?wIG8aJhZQYtN8xwNKoHWP6y6+LIZG96dl22JmhCC1QCPgyw0/IFYTO3FjXvd?=
 =?us-ascii?Q?7rQYUjeg1SK+yjIAnAgwqjlvgCRwwGZPNfYWQ+0Gb1RXvw95ve0YRVgOl76X?=
 =?us-ascii?Q?M7zeUF7PqQ9lea9EjSivRk1ELZffe2ObwzB1l4DLVIsyhvGCeKhi/BhIimKO?=
 =?us-ascii?Q?VdBJzyQtkzaLAkYeIA1N12SWSSYhysuJrf173qy2PG+bPQY9+jI/KJV/fmTq?=
 =?us-ascii?Q?L7kMTtGYv3I1wNkbFxKK0EnLkA5kbBz1kAwnzhCreDhbWOsuu1i6KrkGcZci?=
 =?us-ascii?Q?E6v90eKWbje34UV7APe1LfRz+w5ojdeF5oINAJGWi5mQp8hqnoFGCu0DZIts?=
 =?us-ascii?Q?wtUXQiPJ8rdRGWS1HjWiioa/U1yAq2q4x/x9SIz4tqc0Zr8fg+X6BBvg9Dlt?=
 =?us-ascii?Q?jiKm99Bc+ZgsfLjppxPcvU0RcDwI1emyHrPVcENT3EeM+LY25tcTZ1hnxE4Y?=
 =?us-ascii?Q?TiqBWqhB9DFOAkzNXBgdvZzzXB8OgRDRroOvK/z5yvFQy0Mfd6Y3lmZywfx6?=
 =?us-ascii?Q?xJ5vxA0gAAdBk8f0AnYFtBwbJjc9lMla78fd8mJew0LmOu8CxURqb2GQNuqz?=
 =?us-ascii?Q?q+pXkhtWxKM1LRtDavS1M2bEk/bRJChYkHwGx/Fs2aCRZvUQ1ce1qFow9+1E?=
 =?us-ascii?Q?Q8T7X2VuOkCPTP9HniojiJIrj6qvpItaear6B1hNRiCwanEZCKd8A9BbAxVd?=
 =?us-ascii?Q?eTiwTQ6IAaV/HpAP7AVVb4GCD60HaVF0oDWgnzzwExPxoIl6ixks1gachpjf?=
 =?us-ascii?Q?MD9LM1eYAkLwu/CY7TNhBugYi8sDjeNJZbUUmB5Z0h2atLHxB03SgBod/JMl?=
 =?us-ascii?Q?5CEXpKjkwkxWTn9RSm9pg3UVDz7cWAfyVV8NYym4CSlTq9soOkZh9EC75bH6?=
 =?us-ascii?Q?psUdue709UqLg2xTckDh6kUHP2EZ41AmGN3ZDO0QGFpz9ualCCMreEswqtc7?=
 =?us-ascii?Q?R/Cxk2noP/ZJ+krKY34byedQPOfHAOx7+M1JTW05WyrvgtkASyj2yucyL6qi?=
 =?us-ascii?Q?a2biLY++jvB8fEj3sV0UGP6qz0kVX57sM/+WuOfhUAvtx40B2eoztHH50KlX?=
 =?us-ascii?Q?6vpddLaJyqRy6PLg2ij8NHVqkEgRBYYg?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 10:33:33.6884
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e818b66-dbff-443e-bd68-08dca194ea71
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8098

Add Pinctrl Get Attribute ID to the query ids list.

Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
---
 include/linux/firmware/xlnx-zynqmp.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
index 1a069a56c961..9b8735548aec 100644
--- a/include/linux/firmware/xlnx-zynqmp.h
+++ b/include/linux/firmware/xlnx-zynqmp.h
@@ -235,6 +235,7 @@ enum pm_query_id {
 	PM_QID_PINCTRL_GET_PIN_GROUPS = 11,
 	PM_QID_CLOCK_GET_NUM_CLOCKS = 12,
 	PM_QID_CLOCK_GET_MAX_DIVISOR = 13,
+	PM_QID_PINCTRL_GET_ATTRIBUTES = 15,
 };
 
 enum rpu_oper_mode {
-- 
2.25.1


