Return-Path: <linux-gpio+bounces-13974-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D00229F4F85
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 16:33:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B58807A9DD1
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 15:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10DFA1F75B3;
	Tue, 17 Dec 2024 15:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FxCwTytY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2080.outbound.protection.outlook.com [40.107.94.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438E51E519;
	Tue, 17 Dec 2024 15:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734449605; cv=fail; b=AEbkI4vhDTqMxIPQbsMQ6ZXrq5RE+PE6CUVBkbTa0IOQBVPEwI+MDrl7Cc0CHvMJ4vxLB3mCZpQ96ihXFjERu+uZbbTimxvsmmKgBVSKjKBvzONOMnoHdT8jjKTUoF5EWMrgM6k4nX0o9tw50uHxPVx9YkjEIz/SEdE7EWUnObw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734449605; c=relaxed/simple;
	bh=YkyPoFu8rP+dg+T7TGC+YMM2fe+gko5Emj6mArXL9EI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TNJr1oQhvpDg6is6NxhUrASNHBE8SCHn2jbzTXLU5p8H4XZPhxKxK8qqagHSXSx5GXG3dZ03u1xtFs/liEJUM9hQlbbTeJ4SmBREt3nGKNn4iqmXvyfgW0AegSpAr9LovPERD7LjKZJ1PB9OtpzR2jepeb36TaLhDZ7bvzkODaQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FxCwTytY; arc=fail smtp.client-ip=40.107.94.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fpUKzxyLlRnnrwvpfdAZUiZLJATU2VNt9IP7jMgJ4egwLrEqXhCWJazldLn5QP1pbfOWWa7TJ+iTLWjAHk38jupcZV7nsQZhEQ/K4pNtC7QvJWXuqTgl7+f6SVEvpsX+WkHl9Qep5ko14rYRDEsvGAN5rs0eL7cQ3n13guwkQNNQI/WkIkDnl1Ie7ScunoRlhxF1V0pMVRYHe/QojUYzpkYfeRADxsjVsjCu+5H+MM4tRNxzdFJmBBA/87T44sYDQI1ly7hKnF1aOQi+CMdK6qa86ofA195c4aX5zN3pKhbVe3Nycs5Vv6KmPMtIG4roIgVS11yciC50c8uFnVR7Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oq4lgdeIRZIIYbioe9dbdbYiKz8x104zEvM/4Pk8yQw=;
 b=t4WBabrQmAvlRfnoaqGgBx+Ob9t0LbH/5Nbl3DwajbhNqKaEAn//Qh1ucdnhPG3KnHfIfiWCuACgSTwNnvJxg8kubRQfHzDckYmlaMR+yS6z+22m+7MmCXXuTbKkQ044bijhNol84c3+CrVKIV5vra759x3Ssm6AfQpjLHt6sweZpU4APSPtFgQDDEWGVUhOZtIRi29qJfiSLYnD6S4kwS5onQt73M0tn0ScAH/xSMkBfrhhRT4bzvUBHqJImsdQ4NrKisHVyWrYJi0NeZqUSA9O8XX662hC6yvd5cMnPhNuRWJBjoQD8j8CTPmt4P9vPo+kJjS/biofmBhdDb+usw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oq4lgdeIRZIIYbioe9dbdbYiKz8x104zEvM/4Pk8yQw=;
 b=FxCwTytYV3lP27OXReKF8FY1QMyad8EqHN7npSzsGitw62zu8ke/WUiXcoz8ZCx7KedfPs6kyaZFqlx5h2h1e8mVz5/7mk1xWv/ct3NghYKMlMmM1Y7DtBMCF73EW7UnZmqBQh6mS91xmrwe+/0XpU+UtXOVL3CKsN7zMqEJF/Vio+mfgYy0KDactuJFmtBufF+gZ8IKS3CdHyZAGoC74mFGeUH0kyayr110E49WJd8Svx1Pd3jRTiI8f67TOTnnFNHjxzyMYJQaKKiAT/heA9Am8H+8x/UhKOu+AScssq9JhH/cEPRmgevGFsi4AGNUeH96gvVLS6SM5FDRe4ymsg==
Received: from DM6PR12CA0001.namprd12.prod.outlook.com (2603:10b6:5:1c0::14)
 by SJ1PR12MB6266.namprd12.prod.outlook.com (2603:10b6:a03:457::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Tue, 17 Dec
 2024 15:33:18 +0000
Received: from CY4PEPF0000EDD7.namprd03.prod.outlook.com
 (2603:10b6:5:1c0:cafe::97) by DM6PR12CA0001.outlook.office365.com
 (2603:10b6:5:1c0::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.22 via Frontend Transport; Tue,
 17 Dec 2024 15:33:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000EDD7.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8251.15 via Frontend Transport; Tue, 17 Dec 2024 15:33:17 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 17 Dec
 2024 07:32:55 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 17 Dec
 2024 07:32:54 -0800
Received: from pshete-ubuntu.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 17 Dec 2024 07:32:52 -0800
From: Prathamesh Shete <pshete@nvidia.com>
To: <linus.walleij@linaro.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <pshete@nvidia.com>, <peng.fan@nxp.com>,
	<linux-gpio@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2] pinctrl-tegra: Add config property GPIO mode
Date: Tue, 17 Dec 2024 21:02:49 +0530
Message-ID: <20241217153249.5712-1-pshete@nvidia.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD7:EE_|SJ1PR12MB6266:EE_
X-MS-Office365-Filtering-Correlation-Id: dee695ac-4371-45d0-1c80-08dd1eb0217a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1QH6fQKRs4NJ57x8ffrtnqaAF2xgPeJJ+qa3/FPW7G/Lk0iqsCNiYj/XxATf?=
 =?us-ascii?Q?jPuF+DUVMfwhDcFt/8WHsn83nkYmwCMOD50JrJf2REb1hg3UOLnZNakRYyWf?=
 =?us-ascii?Q?AYRXym2hAFRCD7fX6OWJk6NFsIZZXH7nG78EPCAva/hkBSAri7veo/uPOzYp?=
 =?us-ascii?Q?Z3HO2/plGvcGxSpBVJo3hmZ75PTW207/yHixzZFX1A+UvrBsOURxC6uVY7Za?=
 =?us-ascii?Q?jNQ25DUKGk8PTdQLC0iAsJN05hCmGFCZjJcu1Z+1fy2pWcDuOeoccpN18iff?=
 =?us-ascii?Q?UWkHGzLOjN13JPZo78ZKMQ74R4pr8BzJj5qqzopQ8uqn/8RcgqAQGwhHCNL/?=
 =?us-ascii?Q?3ylMBwGvj5+pIpImgb+xiwtAWuBRPSAn7eCQH8KrfmBtQRUhNU2+9T2yGKEI?=
 =?us-ascii?Q?tcleZezcR2xGdCzOfnKF8IGghlJU6cH166dNhUoqJuKrqz9VGHRTEVYMuBES?=
 =?us-ascii?Q?pKLTivr95M+64OTAl9bUeXFk5Tv/mQ0tL1fLYPY6qMiY0dkpS5DrFYJ7I7NP?=
 =?us-ascii?Q?90dJKF9RNsUZrD1NHNjIdVpTlJYTDx4eGE0ce7sdDc8FWfVtQP1KGa3KzL3K?=
 =?us-ascii?Q?+3KDcoCtvf6LirhaxarY41WoB+xLPReABSq0GKlcF0vT4QkWvUT0E+bXuC7C?=
 =?us-ascii?Q?C/8Tzq9TuhUMNnHDzNViZdQfukgUxHJrEstjF01007HprBg+OW9/ltVN77GX?=
 =?us-ascii?Q?QolW7KMzsPAksIwQs7AIY2GfrxavWDG7AdXowA9L5bM8DPubwhbKYzq/bnsQ?=
 =?us-ascii?Q?/QvCVfCnqlWtoBmLkxaHm3C32xmVtprkdUe5mB5ex9jYy2aDDSrZpjoCa+aE?=
 =?us-ascii?Q?9XTw3s8ue8ruS18dwknj/ZtMhXCYcn0SCO7qAby9dkSNfghaJIf8NsDyK0YN?=
 =?us-ascii?Q?rv7+iE/lwyXL0VJcbZI1Fd5L1YliU2MeZVfartRPbzmo9You8newuqLxJawJ?=
 =?us-ascii?Q?CV6/a4OZJCOOyVAlCooTjcGQMv0w0B2bKyCvKEYVqLotTSsgG4to8DQKX3HX?=
 =?us-ascii?Q?JI+okpC+vPV8A5oysH/jA0SqkhR24BES0w+mH+VUJowmHZdBXM04nJqWaC0K?=
 =?us-ascii?Q?/I8OcQ60WFH1Pv+XgpT8Ur4t8otyFYqDhhhEJ36inFaDx9jYqeSbslO15u+H?=
 =?us-ascii?Q?YYwB1ZRWByr+u9J8A2h5jkzHqhnQ33hKxrQnvcN87PSpb54bN28mPBHs8J6v?=
 =?us-ascii?Q?s00Tnmy7j5t7IGZqVHpa13oC9eT4gA2W0EsP9RfB9+VA/jgywiEebVpBXaU1?=
 =?us-ascii?Q?LJio+NRt38NwU0Vzf0tnDIt57mwAiyreNaBZa7DV9lhSCirNojVnHarTTUfE?=
 =?us-ascii?Q?vuMg41E+mWT7R4msGnU3SBe54iRvVXpS1F5Zq4gQ6SoLMEws0ntMML2Y85f/?=
 =?us-ascii?Q?C35y7m204yey5YQZT2MoWCUAwDCmmTffbUNFGh9yPY/+lnjHMk7G+5GEw15a?=
 =?us-ascii?Q?fjPx/ZGlQhQf7HKhTQ/rV7vhREAAU9T984kRTPi6wKzDOtuRQNetpwLrqV6u?=
 =?us-ascii?Q?LXVBmsH9/Q51tb4=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 15:33:17.9644
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dee695ac-4371-45d0-1c80-08dd1eb0217a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6266

The SFIO/GPIO select bit is a crucial part of Tegra's pin multiplexing
system:
- When set to 1, the pin operates in SFIO mode, controlled by the
  pin's assigned special function.
- When set to 0, the pin operates as a general-purpose GPIO.

This SFIO/GPIO select bit that is set for a given pin is not displayed,
adding the support to retrieve this information from the
pinmux set for each pin.

Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
---
 drivers/pinctrl/tegra/pinctrl-tegra.c | 11 +++++++++++
 drivers/pinctrl/tegra/pinctrl-tegra.h |  2 ++
 2 files changed, 13 insertions(+)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
index 9523b93008d0..46728f19fa8e 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
@@ -96,6 +96,7 @@ static const struct cfg_param {
 	{"nvidia,slew-rate-falling",	TEGRA_PINCONF_PARAM_SLEW_RATE_FALLING},
 	{"nvidia,slew-rate-rising",	TEGRA_PINCONF_PARAM_SLEW_RATE_RISING},
 	{"nvidia,drive-type",		TEGRA_PINCONF_PARAM_DRIVE_TYPE},
+	{"nvidia,gpio-mode",		TEGRA_PINCONF_PARAM_GPIO_MODE},
 };
 
 static int tegra_pinctrl_dt_subnode_to_map(struct pinctrl_dev *pctldev,
@@ -476,6 +477,16 @@ static int tegra_pinconf_reg(struct tegra_pmx *pmx,
 		*bit = g->drvtype_bit;
 		*width = 2;
 		break;
+	case TEGRA_PINCONF_PARAM_GPIO_MODE:
+		if (pmx->soc->sfsel_in_mux) {
+			*bank = g->mux_bank;
+			*reg = g->mux_reg;
+			*bit = g->sfsel_bit;
+			*width = 1;
+		} else {
+			*reg = -EINVAL;
+		}
+		break;
 	default:
 		dev_err(pmx->dev, "Invalid config param %04x\n", param);
 		return -ENOTSUPP;
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.h b/drivers/pinctrl/tegra/pinctrl-tegra.h
index b97136685f7a..a47ac519f3ec 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.h
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.h
@@ -60,6 +60,8 @@ enum tegra_pinconf_param {
 	TEGRA_PINCONF_PARAM_SLEW_RATE_RISING,
 	/* argument: Integer, range is HW-dependant */
 	TEGRA_PINCONF_PARAM_DRIVE_TYPE,
+	/* argument: Boolean */
+	TEGRA_PINCONF_PARAM_GPIO_MODE,
 };
 
 enum tegra_pinconf_pull {
-- 
2.17.1


