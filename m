Return-Path: <linux-gpio+bounces-9886-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F6C96F22C
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2024 13:02:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF9361F255F0
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2024 11:02:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B0421CB32F;
	Fri,  6 Sep 2024 11:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="quSSEhD4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2041.outbound.protection.outlook.com [40.107.94.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB26F1C870E;
	Fri,  6 Sep 2024 11:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725620494; cv=fail; b=apU50j6yvuCziywo/Br+bHKtwaaQnbfwpjySkkcUKWV+YTwbXScNy5Gio7KouvDqLnrVsThZHYwcsxdgyGfgV5ZgqJIo+Ni348fBplexRWCs1OiW9VleOuvJNZMfxr6BF0NzI5XZxS8/vE2m4ZcCc85/UlPabLhcfnkUTke6eos=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725620494; c=relaxed/simple;
	bh=AZmbmTGYyEkxslSIN36zVWNfSczfPcUxLeHhMgM7ROM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UGW3KYOMb8GfMwsiEg+a83hTu+CcRWluxOkyivsQaG62/P8xg946CIbTNqbjBxOUjOBMbOSskwiCo513kjeIUqimtcGIQtPavq4umHVLE0tsylpnJSN8if8uxTCLJ3H/5R04svFNuWzhTMO2BxytVorFJqBReqzwDJ/IjfU3RPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=quSSEhD4; arc=fail smtp.client-ip=40.107.94.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WiEIop+Ih3SwQVCEniiA2KY+7L/mwAmQEhNi1nhdxngeli7BwwaqPGQ6SQUnIrd8rs6WjrnR5X38U2jsDRvnWaU9A+kkTuNQqPRnLR6rhO96e9BKuMOOWpzO3xzGKXJcHB6MgD/qYsBescw39c2vCpOuCf8rq6z6pY86FBrXdsK6WhRPRR2hbIGVCN+Hij+RfT074NrIwyPKt9PzvFqZ6zkJxb/Xu9L8J+ZOeerGYuGp3J89ZUBXVzDnSfUDWzgyanhbOeBlPqw2k52dF/TYPRYawp67kx7sZaWOi6t73aSLkcqAsKZZFClpZB5fDKUBxw30Whz5WuOxgNh+Ra91Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6hi06G0MBKfeWgajsyOAfkXMObi0dFqrI9CNnzqdLpE=;
 b=dpcUQq0k8uoQZdyvUsR9P4ZXie3ZgY83cFmaT9gitui0epgrL00fU6j2E/njP+lSutk+PbvSr8Y4lHU57tQqXuC5dmBV0Oy1VN7/EcQ59muKuwwQuNsVGwtKrVf2+3RQe8CsKAhvw5uHZ5UOzCLHvD9dLBdnH0t1sUKB+NbSu9gvYpGGNyR2Mil1JOFCVSHtWcHEZjYoPsWUPbNoAz1BnRpxnypAzTAsMyT8JEFHlaIHpFyklf7apz7Iu+gCg4ghH9OH155y9as9cAmchUDYNjLpnugWVDvgmbaJWymkebYGL8B6sCv2g3pw8BbCVZf1a4oxTFpGQ4CPkcySbl0f/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6hi06G0MBKfeWgajsyOAfkXMObi0dFqrI9CNnzqdLpE=;
 b=quSSEhD41tZzpqk24DJ5RPGl0daK21krnzOz5UdQ52SBPGXBCtz9COTPemap+8AEBsYVKY5MZwaciHCtvrIHEYFi7x02mlPlV5JW2apo3FzeY2B4smJRrvKC9H3BtcmoAQVHb9jKYQZKIoOdi6uHUa9oiVtaZL6EO2qXn8MmNuU=
Received: from MW4PR03CA0212.namprd03.prod.outlook.com (2603:10b6:303:b9::7)
 by SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.23; Fri, 6 Sep
 2024 11:01:29 +0000
Received: from CO1PEPF000044F8.namprd21.prod.outlook.com
 (2603:10b6:303:b9:cafe::74) by MW4PR03CA0212.outlook.office365.com
 (2603:10b6:303:b9::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.16 via Frontend
 Transport; Fri, 6 Sep 2024 11:01:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044F8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7962.2 via Frontend Transport; Fri, 6 Sep 2024 11:01:28 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 6 Sep
 2024 06:01:27 -0500
Received: from xhdlakshmis40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 6 Sep 2024 06:01:23 -0500
From: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
To: Linus Walleij <linus.walleij@linaro.org>, Michal Simek
	<michal.simek@amd.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jay Buddhabhatti
	<jay.buddhabhatti@amd.com>, Praveen Teja Kundanala
	<praveen.teja.kundanala@amd.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<saikrishna12468@gmail.com>, <git@amd.com>, Sai Krishna Potthuri
	<sai.krishna.potthuri@amd.com>
Subject: [PATCH v5 2/3] firmware: xilinx: Add Pinctrl Get Attribute ID
Date: Fri, 6 Sep 2024 16:31:12 +0530
Message-ID: <20240906110113.3154327-3-sai.krishna.potthuri@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240906110113.3154327-1-sai.krishna.potthuri@amd.com>
References: <20240906110113.3154327-1-sai.krishna.potthuri@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F8:EE_|SJ2PR12MB9161:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ff70d05-a146-41b6-6d79-08dcce634231
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NXyPqWCu+AVA/iRA/ZcWF/lT5jZiMxYAR8DkBRvDnYKSr4ItopTURX5kPzgc?=
 =?us-ascii?Q?UmwL9i2y6G4FtS/kd8C/4kZhRj3CNZpJNgjbXh1YuRCmdbkoD1inxNciQ836?=
 =?us-ascii?Q?eF7CkB1Fjf5/ZiaQOcJynZ8XlrYD7NRD1kloeyAaw21+imuuKjy0ELn7qtPC?=
 =?us-ascii?Q?xHCibXIeUQ6F+QUgnEdA0gB1XkKS66gEM2Ehtt/NZMdkIRjifTbB6JJN+aPX?=
 =?us-ascii?Q?4BkC2zdv81R6jdQ0FIEPcsJUz/7ZTnXEjzLllftojGtFw+F6n6UjwX2NvV8S?=
 =?us-ascii?Q?c796Dyj0IS/EYnfSZCD0C/pbdf1HfEqe/ZKK5k14ST7H2C7ctM69xefkKTva?=
 =?us-ascii?Q?yioOhbGVuV3EgdBWDeaQJJ3JCIwRLJpyHka/jFhniLbdaBnfk1wBcxvH73nz?=
 =?us-ascii?Q?GXsQtKZPXqoasx/wDOxCTt1kTR5HoaxQxuN+KxakCG2fzFuZocEZDVpU8V/q?=
 =?us-ascii?Q?QZgR0NjnkAyaq0wwmk0iYIAsjNFCLch9rS0BG9VLS9eZjt8QWtzsFAtcFW4Q?=
 =?us-ascii?Q?kQL2jDvSx1G4cB0W8RKM1fPmiYKnfxCielalgAi9bAFs9BhvvrjW2ax0vshG?=
 =?us-ascii?Q?1IQYB1FzHgILR9qVUXFinYbrV+IgCZu9Gk+cRd3dWaMQA0QAl33dAkTllFEC?=
 =?us-ascii?Q?ciPH631RZf8eY0mAvuag1xjTKK2vH5NUdg14iHvzdOU68sO4u9anqaYATVpn?=
 =?us-ascii?Q?xa9Ws447WXD3QyG4sZRJ/kI1CINrpDjoxAT4bBXq1j0KMlwT5cbdtCu/wkvQ?=
 =?us-ascii?Q?8SdzBPhD6DaqdLBOptg4JEQOgJFjhTbP+TM5ATS1UDpgY5wW6TBgba3ihlNy?=
 =?us-ascii?Q?QJ1+QlrFPH5nheLHfhg4A1T2vLJ4mDeK3iyquOjQ3X5moG2/cF1XYDTG5/gF?=
 =?us-ascii?Q?eSEFvIoZtwl9tRxIyYJZA51/eiJenGoA0D3SvudgHiGcKWg+68CQKqdzpiZN?=
 =?us-ascii?Q?rIkP5G1RBlcSNQmYotRjeNDe7ResGV8dXFELwquRZAtkDO+xlLEA1F74gQDp?=
 =?us-ascii?Q?BbAGAPhMivz7NX5tv7XJbbLlPJxiYmEU10OW/lGEuyXWYn9J8HztUxSOQzvw?=
 =?us-ascii?Q?X7WRLDbn/f3RLVCl3k02/J4DGmmevEMtn43fjlanx2H6KAaw56R7frk7BtMh?=
 =?us-ascii?Q?v5HmZzkeuggexR9BDv3c1NMgh5kDSxhgoL3WC3kul6WIoJepsIsDOgDz6+fp?=
 =?us-ascii?Q?M/7kzc4THqnf5OBkLzNfvsdzB5aVcxB9l9FPnaqmuqz764CvaCrZjj+XcGXh?=
 =?us-ascii?Q?l71cz+L0BvshtkbVEZU4c2AtASFj5NEryFwLdMGXxNLGY6BQE5h7qxKpSwyG?=
 =?us-ascii?Q?4u0qKSJtlb6hDF8I/QW1TSFvqOCKi3/a8nOs6IhNGKByqbK8JpgxMMwCAOr5?=
 =?us-ascii?Q?UM0IJknVw8R9Uss1RDhgo1kR6575Pi8cjoc6pdMGvMp7hriAwVECmOqn1GVA?=
 =?us-ascii?Q?pB+na3R8FlwCtoybAH6EP3I0mVcQOm0W?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 11:01:28.5668
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ff70d05-a146-41b6-6d79-08dcce634231
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9161

Add Pinctrl Get Attribute ID to the query ids list.

Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
---
 include/linux/firmware/xlnx-zynqmp.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
index d7d07afc0532..3b4ce4ec5d3f 100644
--- a/include/linux/firmware/xlnx-zynqmp.h
+++ b/include/linux/firmware/xlnx-zynqmp.h
@@ -238,6 +238,7 @@ enum pm_query_id {
 	PM_QID_PINCTRL_GET_PIN_GROUPS = 11,
 	PM_QID_CLOCK_GET_NUM_CLOCKS = 12,
 	PM_QID_CLOCK_GET_MAX_DIVISOR = 13,
+	PM_QID_PINCTRL_GET_ATTRIBUTES = 15,
 };
 
 enum rpu_oper_mode {
-- 
2.25.1


