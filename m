Return-Path: <linux-gpio+bounces-24302-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1B1B22954
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 15:55:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5AEC683D20
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 13:42:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06AA127C84E;
	Tue, 12 Aug 2025 13:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UEBpgjB+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2064.outbound.protection.outlook.com [40.107.93.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCD627E1B1;
	Tue, 12 Aug 2025 13:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755006014; cv=fail; b=kBmt+y23VqZTB3V0x3Bi3HyvAHrwpt1m79rQVU+0b1FsNmP1xjAEGmSsN9iIV17rHM0dv9dDJXULvoYPpIDed3JDyOWIEu8o1kShnFH/ZiFo+SHVBr7OFw1WUcDSLtYIjUXxYQzmA+bSCgnKEla/o1/FZoH1K9xNZmfsF+hf1cE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755006014; c=relaxed/simple;
	bh=oUPyT0eyXCQnke8YA+XTQNCTIh9mP6zI3zQNsiyv6LM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hbbO/LPfQquzFrfQxBqASMObWZmNAeJ6q6fkLulidjW+Mp3tUiGKE11saWOGScLnadG4oPsaMaROuVqRHyq7NSR3/pOxTyRZunT/JfFKogiSHtKXfmicd30t3cNZ/pmrO11AOi3aRFU3exdvqOcnyAQf0GZIzSoQZwBAox20dzE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UEBpgjB+; arc=fail smtp.client-ip=40.107.93.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rBRXrtoSeXa4IevcqNZvEuxuOOg2t1BSOy6/8Raa5XaL2IJWJ+7MNFaR9PB5p4KxrxrXdGVsXhNUrnlhqcyMCdIVtsvwE/uQ9HX42rIkP5uTCJjQIwdN0j2Blz0q2KJesJeE3jhgP3yUW/32sBEANIrrLgNjXee1uPCGsKEHVaEwvbOyz3+aAiELQN67cF0wwhlt52s9Kw8sdfUnwf+5tUAXxH4NS47xLmFgqwFQbK3skqjKJYiJ9+U7IR1z6K6C7S7NtXyOqbave01tCb3FAk7gk62ttJAIjWxKY1/LgWxL0GLAfUOmzvnwzkm76II9D706ngLdLk6sk/V4q/GBEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8nqTVwdawRobUbXqE6c/QKkHjtLWHiYY5kY5DAAFOuc=;
 b=Uv2SMhDm07WpM7tIHX39H+wW00+6BahQJgphC6Qs5xYEyCdIJmsqqk8EajuUpbPFRGbmlprVly37WqNYVZxVZLG7xOd5+qxcKQU9dmkSBGGXjsc9hGEXzWrud60zqM5VFd7d6K6pRqYXoTav+VhPnLrbRJi1ne2ICMWJQmq+2IFLAOuBqwbniT1Ij3WOqexKcXBQgsXPPHLLTnlRhTvEwABcYvCcVgLvQFkIVdGem1kIO6MrJ35BY7LmRsQH4chc9qxIeXMglxj0m9FTuZpF+1x+jTsrnkD4/j4CQ4grRJLFMBC6iWNZ0jpbdPNRX4KqQfd+Kg9uhLDQ9xqXkwz0xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8nqTVwdawRobUbXqE6c/QKkHjtLWHiYY5kY5DAAFOuc=;
 b=UEBpgjB+nvZbEQBQguq3jSNnak8dNZ4M7Zxd/EjBSpfPZdudH5uDcYmmGq2GiWEIIPi/75M+eCR7zbPS6BZMQrBnM6IaH4hmx3aX0HJVG+yyBhckesGcyP22ImaAnAG3ELeifwmh+g80TG1ylJS5t3wQBAsTtvMWujlfe5vPxkTWYqwq0o3aSSeskPUqjZ1aA3MGxqF+W+sqnwKxmeGufWktXhjm+ulq/K0ZV4oOjTRrJyuvztSE/MJ2JYOCrcCrKc2UwkzLahb8yp5TFGxVy1HrmxlHYrMm8bo0WOdNcYcyhRKe94aLewEB9+PcSEKr2g+pvgEiEFTdnMrlFP8p1A==
Received: from DM6PR11CA0032.namprd11.prod.outlook.com (2603:10b6:5:190::45)
 by DS0PR12MB6415.namprd12.prod.outlook.com (2603:10b6:8:cc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Tue, 12 Aug
 2025 13:40:10 +0000
Received: from DS2PEPF00003445.namprd04.prod.outlook.com
 (2603:10b6:5:190:cafe::5) by DM6PR11CA0032.outlook.office365.com
 (2603:10b6:5:190::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.14 via Frontend Transport; Tue,
 12 Aug 2025 13:40:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS2PEPF00003445.mail.protection.outlook.com (10.167.17.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.11 via Frontend Transport; Tue, 12 Aug 2025 13:40:10 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 12 Aug
 2025 06:39:56 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 12 Aug
 2025 06:39:55 -0700
Received: from vdi.nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.1544.14 via Frontend Transport; Tue, 12
 Aug 2025 06:39:54 -0700
From: David Thompson <davthompson@nvidia.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>,
	<andriy.shevchenko@linux.intel.com>, <mika.westerberg@linux.intel.com>
CC: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "David
 Thompson" <davthompson@nvidia.com>
Subject: [PATCH v2 0/2] gpio: mlxbf3: revert device name logic
Date: Tue, 12 Aug 2025 09:39:50 -0400
Message-ID: <cover.1755005277.git.davthompson@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003445:EE_|DS0PR12MB6415:EE_
X-MS-Office365-Filtering-Correlation-Id: 17cfafcf-4046-4965-519d-08ddd9a5c213
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TwVlKqz4eU+3U1Di5r4aqmjyUayWlXSGoNk+geWQww1aX7c10Y2iZUwZcprN?=
 =?us-ascii?Q?HcYUtokmV3HzFaEJ2gbb4crbwHXcj6y3HZU5Iu6/98bz+MDgn6HwdvediPVg?=
 =?us-ascii?Q?lzJetrUBg2RtmWEHKuuB7c4VJ9y5hdnUz+Dnwx1PQGrlxuCQYAwdJJX/Sjcr?=
 =?us-ascii?Q?8ItmgI0zoR+x5ogjnYKb3QbMZtp00Q09PCrOO2RV4ngyEN16GO2wKO914wAN?=
 =?us-ascii?Q?LFTV9nULCs47kle+nFcNm8cYuBE5fVnZgGnqpaIxAIF1nAO6e5+7K9ZsS+I4?=
 =?us-ascii?Q?yMkn5zZZy4rlWaXQnKOYxyLKRYTiOyM7Lvv6eUwmkZx3sOwVUWp6Y8Hqr5dm?=
 =?us-ascii?Q?UTWEiQxP9qGzq0ldu9cdUpLhd3dxOtxa3GPxcGd4d6urnZXgRFXNJJyzL3TU?=
 =?us-ascii?Q?vpuCDGrZiuronlFfns5mlv3KUeN7i8p/34NUy44H4tQsLu/VJqcJlc2L8+6B?=
 =?us-ascii?Q?hp9H6wqQPvCZv1PsG56r4WFxEELban7pvrd291UoAsyjJmS7wjeR3uAf+uB5?=
 =?us-ascii?Q?5Wc1xEjIK2bLnE7L+6ad94dieuu0KvSvpwtmy5GNlTUbOVZBsgoPfjjiOR4p?=
 =?us-ascii?Q?IjAUS47Uv4MTgQEdqCkcKwEh0kNKr/o91NKsVpve4DaaGdv6iMxxebpxZT+s?=
 =?us-ascii?Q?hFgdci4YJq8e4grCFbN5hCKsyopM/MejwQi7yEqm+n7jCLVLCRg173G0zEPv?=
 =?us-ascii?Q?U5oIZU4aBOkeh8WfkBnWY57/f2RTC7ozE6Asok1BQ6vj7Tq7ipF7u+KVhgUA?=
 =?us-ascii?Q?/NPmZnFkQoNLyZE6bqVSwACOgE3SHmE4U8RbsW/7TgrmLnKwuxqqD5wUw5HZ?=
 =?us-ascii?Q?os0WsOQMfXZymZjmHJ6obNHQHIrfOUPTvU/t+sr4i6Egph5kno7yAoNmPnA4?=
 =?us-ascii?Q?ByAmoIG96HsaLrvdYE7suDMWpIpJTeFLFKOs/Lmx8idR8D2l6hlYQlXyEB2f?=
 =?us-ascii?Q?U1vvxzsDBEZYL9/9tYCRo2PWNiwFv+LAmhgydnzlyuroJLBi9xsracc0BGKU?=
 =?us-ascii?Q?8RbUfQ66/0mUnfnBf6Szt0bfSUrWCxcuEFfyE+FY6zE8Le1w/IHPabzrZgHG?=
 =?us-ascii?Q?e26pGITdazSCONxFU0WTaPYTN8xXmQswbDWfUi4Bbl7jS8H1M5UhrORstLmc?=
 =?us-ascii?Q?/MOoPoW9kLafj/7GZApD/MpUx6oF+xGY+gsQwMOAVrlWcck0/+zO4KKA/6lK?=
 =?us-ascii?Q?ldcD8s/IC8AuUnlFf097zm9MVKSZDlUBIoyTL4i9MewkLFOorZtl3kbJbWuR?=
 =?us-ascii?Q?CrBwVAOrmGOnTswB2K9cfGXVJkiLwx3cYCyL3iNk7JO8g5JqlPSJ/iUCYG+3?=
 =?us-ascii?Q?NbA473Cv6Mc+MXrYZi8FgIsYaA6fINxcJxwcBGpdLk6+0Xx8hLs0td30hHtn?=
 =?us-ascii?Q?onq+HNe1dfiAhoAQvvEcAKa8a/XvJkVCi6o7PpmJSrpq+7Ak6IlAo2HC8fID?=
 =?us-ascii?Q?WJ4pacCgjT34IkoG7NKTF5kfLXlhbjpYbeSKZX4DLfMuan/SzSixP1/XI/RC?=
 =?us-ascii?Q?E5qEi8Vp8JQvwKySByTcafmdJ2F5gIgJaNml?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 13:40:10.3900
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17cfafcf-4046-4965-519d-08ddd9a5c213
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003445.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6415

This series reverts the use of device name processing
in the BlueField-3 GPIO driver "probe()".  Instead, the
kernel API "platform_get_irq_optional()" should be used
to prevent errors being logged.

v2:
- Added "Cc: stable@vger.kernel.org" tag to patch 2
- Added "Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>"

David Thompson (2):
  Revert "gpio: mlxbf3: only get IRQ for device instance 0"
  gpio: mlxbf3: use platform_get_irq_optional()

 drivers/gpio/gpio-mlxbf3.c | 54 ++++++++++++++------------------------
 1 file changed, 19 insertions(+), 35 deletions(-)

-- 
2.43.2


