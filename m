Return-Path: <linux-gpio+bounces-23866-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FAEB13D9A
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Jul 2025 16:47:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7EA147AC52B
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Jul 2025 14:45:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C45BF24C676;
	Mon, 28 Jul 2025 14:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="O0WBTVyV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2085.outbound.protection.outlook.com [40.107.96.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144691C862C;
	Mon, 28 Jul 2025 14:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753714016; cv=fail; b=sN8GkIKm9ceHUrX0ABwJjYpZnoDvoSdBvqrfll1zwZ6SsYG2MkcZIrxknVe1GwTs1QbYT1Ix0XzBwiRCuc+Q7FZEvpC0Hokrc7tpUL1O5cuvMEiKgY0ghAOQagOOYSVGs/FqqKcpm8pmkch6GKDmGu84KnAjUxMjYoO1oTleM4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753714016; c=relaxed/simple;
	bh=HxWej+jOJ2r6EuMI0mBRipCDEVAn6LWdcJ/exh0ynZg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=skuxEaZdutzFBktPDW34wWq1niKtPV4cXYNY5S1PXm07sk/YihdojIz6uJxSx6g8nSELbIA2SwmSnA7UKbFlafb/EFv3R6yXe6OF6PVMuPrLQZ9pZobDG6vnF31x7MkN9jVtWBwIa6uab6FGZxmNuz1+LJlTK1JycVY42LMVDJk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=O0WBTVyV; arc=fail smtp.client-ip=40.107.96.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vOkF++Ve5HLa4HR5NwE+XybI7woVaB4baigMLw6kyTAM3ROUgD5TE74XhzGzb1GY7FapO8cWO18gx9RJKss0rsOBqzUMLI5OCqvoXbak8ds6KPuzMlRnzjeF6LNY6tNSaU5+r2RThpMUziwOaznLqv6erz1WgBgQZq6yj307hxLkbDSWXX44LxuECBRC4NPTB7mgs7brdVK6Zj1BrAObAw5tw1PZ6ZD6/7X+THMkqzqBVReDoCQFCfjBAMia3PD7Yngr9mwRQ4v/A/Wmdk65sasDrKxB4MJvg2i0M7nMffQtdYmp5NjlJ6UKxMyjPZv/KcxPtXgTkClVyK6AvwbWLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8vomd38G+sOSGPBAT4H5bCJsQ7l+vIkyN94lF13lPOs=;
 b=yNumOgnyqrr1JFsK09eOfdw+VlbsL37WciCgWpeOVnmIJ2iUaKZAHi4ASxzDZ24o34QkvKiKa7YdYM4X/yUPQVOXDWU4y5Wn8f0Lfhli/++gn23Z58eegAorb+/5i01xikEDCOkUpHPkaK97Fc0OUTg+PE7tgRXs0q8hz2oUheLnWdEKdJDBCKzaJEN37XbzpaZhoQqVkAfJv3TnfBDQJXeipM8OohGoY7CjmP3GEAN0kosvrYzXuYQmJ8QvV5QgiLU+TbV06DvJnySHykHK5fAuZbiPevCFbLuqCAA+Hmj5s5ckT5zAGKDZMySWl4gAkcbs4zEhDGoGBLVEfowd2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8vomd38G+sOSGPBAT4H5bCJsQ7l+vIkyN94lF13lPOs=;
 b=O0WBTVyV/eeQgRKeExLnckG1ks0y5XBy78DsO3QTz1wUySkJRXBNSLmpOeNFNi5pYU54WseVrBZRruJtoNNEyiXl64bDFEq4e1Sd5kDENt8n5yVWCwlaJM9MhDxZIwpoaOjLFDh/M7z3KxTmU9rr9z2H8JHDPrJUnucETF2F3dB367ntxoZq4No8A1nK325RzUhw/VzZLjV2824rTF4oeesK/jH1EE5B2ROkKADGBBuqApmpLKyXIpAPoU9TAYhESPcuSo67opew8+ZCipcl6Bywmt+hr4PBu8ObZoXZtUoTlVn5MMW5a4qj3IRWTkVWT+384lbawx01nQraSe0P4Q==
Received: from BN9PR03CA0355.namprd03.prod.outlook.com (2603:10b6:408:f6::30)
 by CY8PR12MB8411.namprd12.prod.outlook.com (2603:10b6:930:6e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 14:46:51 +0000
Received: from MN1PEPF0000F0E1.namprd04.prod.outlook.com
 (2603:10b6:408:f6:cafe::54) by BN9PR03CA0355.outlook.office365.com
 (2603:10b6:408:f6::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.22 via Frontend Transport; Mon,
 28 Jul 2025 14:46:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MN1PEPF0000F0E1.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8989.10 via Frontend Transport; Mon, 28 Jul 2025 14:46:50 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 28 Jul
 2025 07:46:32 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 28 Jul
 2025 07:46:32 -0700
Received: from vdi.nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.1544.14 via Frontend Transport; Mon, 28
 Jul 2025 07:46:30 -0700
From: David Thompson <davthompson@nvidia.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <davem@davemloft.net>,
	<asmaa@nvidia.com>
CC: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<stable@vger.kernel.org>, David Thompson <davthompson@nvidia.com>, "Shravan
 Kumar Ramani" <shravankr@nvidia.com>
Subject: [PATCH v4] gpio-mlxbf2: use platform_get_irq_optional()
Date: Mon, 28 Jul 2025 10:46:19 -0400
Message-ID: <20250728144619.29894-1-davthompson@nvidia.com>
X-Mailer: git-send-email 2.30.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E1:EE_|CY8PR12MB8411:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d9ae838-3355-4538-5918-08ddcde5961e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0qT8mMJdWJRddzpRwH0610Uo7qApM9a6yAJUAqh9Ue/P68RWT0AurKIqHt4Y?=
 =?us-ascii?Q?+tkD8zd9IslFBNAsd8CFKOrw9kxMX4inkKhtBL52eeH3g+20OSozFlW4JorC?=
 =?us-ascii?Q?kfQLeWW52036bizYRHoyBE3W1CDRSXl6gbcw5CZ8egBbT2ei/Qjn245lURNO?=
 =?us-ascii?Q?W/wpXqn64RVz/9bNeNgKVxd8G3/12MpSW4z9LqAqh7UKZlZKN/z2nKGVFZdP?=
 =?us-ascii?Q?ca5licSkoUjflcuqc0PLY/pK2qwMD0WL+ysSFHILN6ztU0qHmTVVphSIOWxu?=
 =?us-ascii?Q?wMAu/AZHML+M6qrHBJDrud6OsF1u+WuwLBH/li+iGeCLmqS+/QS1hvDBseIl?=
 =?us-ascii?Q?QtdPyVSMWDaC9fKaEWrMxRuySUozr+JkgrKeZaiCK2J/lqXA4P44iBIuluUW?=
 =?us-ascii?Q?Jw/e7331vCYtC1P2dni66x1AhYIPlmKS+osaTxwJBv/LJ4ifmBVOV0eRPn6P?=
 =?us-ascii?Q?+fDtEgxU4E8Gf0I5itMFzPyD07TaThxjVn2tGv9wCWDTlK/cbg4xuJFD1WVW?=
 =?us-ascii?Q?hHhPzUSBGxS3l8UCNf9/laoAR2BSsTofUIF0LkRangpIasIT91IqxkMun029?=
 =?us-ascii?Q?O+oVBPEizVXijk7RzJMkrfsW+UcqwsfxMZ1O+Hg7vfYRCCx/1xxBDPeybHE+?=
 =?us-ascii?Q?KLXul9bO28vggAVA2hwvlJ2EBdX07OpW4hsr1Lr7EGiXvR7k6SFqtMYUNcb5?=
 =?us-ascii?Q?REtjXQ+NCAjOzOECNFvlgfnSjvV/sWX149WPTirstsHtxuPw4RR+q4ZVGRnm?=
 =?us-ascii?Q?ynescFRKegbMPZw/QF+fijF/7xPmSJ70kfldbdanQmiO7MCaO45USqVlbPOL?=
 =?us-ascii?Q?6zFoekCmTsBU5Hm4E+0/fnCaPWccZECqZ0HtXNOatUhTaPioTJo7taqKG0Z8?=
 =?us-ascii?Q?tekfWWpfO9iUTIl1oFzh2p/jEMTGhgycVfAeiIrIY5PVIKWKqB99R8xmDs7S?=
 =?us-ascii?Q?hGI1lPQwop/M6HZF5P7sCKrzIqBcxYrohvSWP0ZAllwVjj4CXPvySh1ZhSTd?=
 =?us-ascii?Q?IInY+y6QsUikCuYQ/7JWAMdDFZTUC78mu/IZK57l+huPxCRyUfY73ra+ob2W?=
 =?us-ascii?Q?5gtYJCHKWjs7jgDUaWJUNKCEmKvzGfFV8nIiyYUMwE1JAsh6qFKQ+wq5izLn?=
 =?us-ascii?Q?w7wTi38vGssqZMOYXS89M3xGp8fNkscZPrbSlQb6Xa5Rimj7uTyCUfNK7dxv?=
 =?us-ascii?Q?y1robIEsKrDIPW5EiZTsKK6Fr0i6G8tUVxz7vAD8tI63mEZ1NbaCt+Bn7KO9?=
 =?us-ascii?Q?Fyf12CtreAG7u6p4jWgyNDoJzQzqtqUsVWajPVYyGaUh57DVynwKBOzSaYaY?=
 =?us-ascii?Q?tCwWdDFsMEFrLuud/SGnK4Yl1VpUfiu9B/vFMLS/72eLpKjS9lxu6E4FhHtv?=
 =?us-ascii?Q?VwPU0JihMnfsGaJ4A7g4HQNDCiwvDfek9dCaLpHkig5sD67auumhTQJx/OoU?=
 =?us-ascii?Q?3O0ihgOocb2oIVaxQFMo8eYTu9j42qoEhP0ffZliGWNaMXXsFNogGY/72TgH?=
 =?us-ascii?Q?ZKUjblbr+xALf+N563l7qVEwgBSKrcWpQ07j?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 14:46:50.4250
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d9ae838-3355-4538-5918-08ddcde5961e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8411

The gpio-mlxbf2 driver interfaces with four GPIO controllers,
device instances 0-3. There are two IRQ resources shared between
the four controllers, and they are found in the ACPI table for
instances 0 and 3. The driver should not use platform_get_irq(),
otherwise this error is logged when probing instances 1 and 2:
  mlxbf2_gpio MLNXBF22:01: error -ENXIO: IRQ index 0 not found

Fixes: 2b725265cb08 ("gpio: mlxbf2: Introduce IRQ support")
Cc: stable@vger.kernel.org
Signed-off-by: David Thompson <davthompson@nvidia.com>
Reviewed-by: Shravan Kumar Ramani <shravankr@nvidia.com>
---
v4: updated logic to simply use platform_get_irq_optional()
v3: added version history
v2: added tag "Cc: stable@vger.kernel.org"

 drivers/gpio/gpio-mlxbf2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mlxbf2.c b/drivers/gpio/gpio-mlxbf2.c
index 6f3dda6b635f..390f2e74a9d8 100644
--- a/drivers/gpio/gpio-mlxbf2.c
+++ b/drivers/gpio/gpio-mlxbf2.c
@@ -397,7 +397,7 @@ mlxbf2_gpio_probe(struct platform_device *pdev)
 	gc->ngpio = npins;
 	gc->owner = THIS_MODULE;
 
-	irq = platform_get_irq(pdev, 0);
+	irq = platform_get_irq_optional(pdev, 0);
 	if (irq >= 0) {
 		girq = &gs->gc.irq;
 		gpio_irq_chip_set_chip(girq, &mlxbf2_gpio_irq_chip);
-- 
2.43.2


