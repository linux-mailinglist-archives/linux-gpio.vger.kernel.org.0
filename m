Return-Path: <linux-gpio+bounces-34945-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKl4Cxyo12noQwgAu9opvQ
	(envelope-from <linux-gpio+bounces-34945-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 15:22:36 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C40C13CB0BE
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 15:22:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8B37B30568BE
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2026 13:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0A5F3DBD51;
	Thu,  9 Apr 2026 13:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="C5EfZ9cx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013018.outbound.protection.outlook.com [40.107.201.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04683DB632;
	Thu,  9 Apr 2026 13:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775740505; cv=fail; b=bh/W6+SIX5yPIz7OPqzBI0Ms1HqQeUFJL4CFSbTseROH3/uuqJ5zr3iusqQ7dZ1M1wJZZ2Etv6Fiq2BtoBTw8pQt0IvHR9u+jZeUH3nxu+PsB8CzCTKOHsAUN4bQiTq5qb9JR799mMklkPbg1WpkZNFQQRmoO4J1+aPXiJW17pY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775740505; c=relaxed/simple;
	bh=7azImmaqtCWniZfcwqZ/qkO1VbUUFfFo4wDSqYm03Uk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c8tYxvyOH1W40UZGrj1AVLwQWfOKvp0YF+fuZdYRgBcHajQUfFJTjcM7u/cOhUC1yESdIIywtVp5UoiJtwTmwwwles7BY2RLSjSamWGm90iuoyc+Uf1/+s0RKbjeZVUYhRJiIKK8UU1a2dGH9i6IQav77WMhSYYBSnWHa+JVlN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=C5EfZ9cx; arc=fail smtp.client-ip=40.107.201.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TImT4lY5ltr5ecG5Hv4lVejkbr9speUtsyQSlpCb+ZjOv76I6cSlW/EstrR49lPgQlbWuEtECNUsHaiA4rp5oYnfQNH/AB9i+dMwNQe9aULdcXX/8ZstVeJDTqg5G4z0rsdnTxxoSkItXItrYCmGHau0uV7wO+XwiXCzI9N2N6MDmkyGBceCtc2wKuGEd4kNZVxNY7vw4yO4jPyJZ8X+FKW1GyYEHbysTZhx0Ezmwc+gCVpmFCch0Gg/bX94CVWI+qG4v23Q6Ium9fF9UGivMB2jA1r85GcNpP80DYwiMRboMBNiAzlRft1Zbxj4k+Osj7hxebx3I/Zxv6YfZxOrOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RrTB1+su5jibU2+0ik0W00/kPhiNv7Gc+DtXgJTkn3I=;
 b=CfqmXUTw4N8TE0mEUSiWlnXDR1LE+/NIWZ+JmlmVEcMhL1l7wEsgU/rON8ElUFB77Z9B8cFFw1hdsPuVKA/74zFE4FH/F+qJ7WgpH5AYGOKK0MK/HeYB2NtXoZQVdmOL6NHDejdi4cVHx1EKMISkFe2wV/ERtfet5yIZ+RNkaSM8tz7JWoU+xK7QCwIKxBMarYn9AeIkxBN/xZR5OU5egaxQYM1dfFtV/tHrTrAlQF5CyD2zRh5knK+gTzIwE3s8SNYrZ7PAmsEBiGGl3B3J6bX7mxPqnbvSGrYodxZjzoht7qWQn/4mhvl3MBe9mp+LCuGxoxOdKHwZ8fn0tjOiEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RrTB1+su5jibU2+0ik0W00/kPhiNv7Gc+DtXgJTkn3I=;
 b=C5EfZ9cxlH3vTEUoFNhEryhPh8Hcg+NmMSeICOwwj65VzMG083YcD9G8pQsUUxZDyT/03I4SNjKs9TMPpOMZFU5/CuhGkUbxg5sl9Jwn5svkPVmVdmCfPBwtl4RX0L5OW7vztYQlw7nzYrBkqjvcjQDds5gffJ+3wkvwAwvDvMX2iuXBopHNbQ3XxregF5WLrlEwBRM1i8W3MHsXkpOrjJafRk9wrHN406NCw0lOwv/b0dYO9Kc+5wqL2iDJPqNFKRHJw/+e32fBNvxVtF8gqWIJRFOViLfpeixpIR5SbdKRWx5Yf3X2eo60BHlCcSL/YCMQorDeDM5FN/JZ0r/IuQ==
Received: from BLAPR03CA0152.namprd03.prod.outlook.com (2603:10b6:208:32f::16)
 by DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 9 Apr
 2026 13:14:56 +0000
Received: from BL02EPF0001A100.namprd03.prod.outlook.com
 (2603:10b6:208:32f:cafe::76) by BLAPR03CA0152.outlook.office365.com
 (2603:10b6:208:32f::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.41 via Frontend Transport; Thu,
 9 Apr 2026 13:14:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0001A100.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 9 Apr 2026 13:14:56 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 06:14:33 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 06:14:33 -0700
Received: from build-pshete-noble-20260401.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Thu, 9 Apr 2026 06:14:27 -0700
From: <pshete@nvidia.com>
To: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<arnd@arndb.de>, <bjorn.andersson@oss.qualcomm.com>, <conor+dt@kernel.org>,
	<dmitry.baryshkov@oss.qualcomm.com>, <ebiggers@kernel.org>,
	<geert@linux-m68k.org>, <jonathanh@nvidia.com>, <krzk+dt@kernel.org>,
	<kuninori.morimoto.gx@renesas.com>, <linusw@kernel.org>,
	<luca.weiss@fairphone.com>, <michal.simek@amd.com>,
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, <robh@kernel.org>,
	<rosenp@gmail.com>, <sven@kernel.org>, <thierry.reding@kernel.org>,
	<webgeek1234@gmail.com>
CC: <pshete@nvidia.com>
Subject: [PATCH 6/6] arm64: defconfig: make Tegra238 and Tegra264 Pinctrl a loadable module
Date: Thu, 9 Apr 2026 13:13:40 +0000
Message-ID: <20260409131340.168556-7-pshete@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409131340.168556-1-pshete@nvidia.com>
References: <20260409131340.168556-1-pshete@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A100:EE_|DM6PR12MB4123:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e085bab-54b7-4cef-5f9e-08de9639fea9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|82310400026|36860700016|921020|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	HKDoGrP6RkRlNt/zzhBSTOi3bs4SX5m8/9cZ2XyViB2v5eo1hc8fM5/w8R6dBheMGG+2JQ74OlUSSi1ucpDU5Wut6oBnr8LT73D/1x9xjd2zZn/ngdbRLRyUG85dKvyBlUSdOMb1DMkDPJh56EnPuTMAXhclBv9IeCZrXLGxNJKGsFTEYEBI4UmnfhklkwhL4zwXheKi5p8PRRyMtF7411bykcwgB+D24vmNAXuqa6XQfb0X97StBSx4zTtnJpUFg1kaGGGnivEsGRFWi4llW6a8IFIy0iTCUrIh9cFCaXyxbBjTQHDZn6cQ43tKTwQ6pPQde55XxIUFKe0DMmJJWh5SWASv7jnr4IQ12GqaCBCN1ywWQmQJx9hSxcGENKbzmWv8OkLBHD47vKYY7dFKKRb2O7SgYPjZxmt63m6MytAskvhlwkyOqrm/h12ux1fjUB3/8v03eXzNKMtLIXGWXn0O+/2YRFsz9aDgr+6rA/5eU4BU+VtzgPzQIQzni31X2XFrZUjoigQ5S1hKb6qZjzkZHgSPVgXegWbAivUtvIPjMAG7h3bvWMawX4k2bjtWqxgY5BBft6xsx9KXo3H4Y8CQ3RdoayAtvdOBhik5hGAbWnWD9oFdXLBPLMSCzNBgmP/6+QweJrD+fhQJvv/QCzPRcQP9CZGgy3h/4ShAus0C+oD2ClLoG3CTGB7pviEoR2mDfQ5rEfEMsZX44vqh8EYK8I0pPa6kYKdrlzW3Sa+65KlX3SgmxOLmELWlcQfJ8TV1u15hVAMI+EomFHZKw2/WUtS/lQAO9AFbzLmYy9Y3HFpgP0Qb9o9ix+9/fTBu
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(82310400026)(36860700016)(921020)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Z71rfcACDc6Mnm5JeFb+hRp0YsDVcXJcneXLD68wYmQG8QkQ3SLCTDoqHjejChr7wUobIBXHL4rl7hUtlAegAt5S/ENgp8HN2E7pI0dzN0iaqrqP9RyrEh1maw47v0WczBNdD/cY2s26Y4Ylbzf8FgGDv87xi86oRHzWuqPJsYLA74IDvM5/6Tdynqu9Kn2y23c2gEbF7rMST4mwmjsKI5iAKZMoIUylzWWIsZhPP+QV436JUic6BSL8Yumbye8fWlZ6dfPlVM6CYhj0i/Z5T0HWN8Xb2iiJOHrdHAxo2ItFMFF9Jhj7JbqfRe5Ped9UKay+850VWbUsq9Qsn1985yYM1PJ0PC/CCdTBIOdinJ/eHsg4W35GsUC8OQO1an4zBXhZmnSml1RDKwE/2BOSosb6g1dMANWZpGfhiQWWQ498T3rZ31ZwaixDVSEQcZdO
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 13:14:56.1131
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e085bab-54b7-4cef-5f9e-08de9639fea9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A100.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4123
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34945-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,arndb.de,oss.qualcomm.com,kernel.org,linux-m68k.org,nvidia.com,renesas.com,fairphone.com,amd.com,bp.renesas.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pshete@nvidia.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: C40C13CB0BE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Prathamesh Shete <pshete@nvidia.com>

Building the Pinctrl driver into the kernel image increases its size.
These drivers are not required during early boot, build them as a loadable
module instead to reduce the kernel image size.

Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index dd1ac01ee29b..f525670d3b84 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -711,6 +711,8 @@ CONFIG_PINCTRL_SC8280XP_LPASS_LPI=m
 CONFIG_PINCTRL_SM8550_LPASS_LPI=m
 CONFIG_PINCTRL_SM8650_LPASS_LPI=m
 CONFIG_PINCTRL_SOPHGO_SG2000=y
+CONFIG_PINCTRL_TEGRA238=m
+CONFIG_PINCTRL_TEGRA264=m
 CONFIG_GPIO_ALTERA=m
 CONFIG_GPIO_CADENCE=m
 CONFIG_GPIO_DAVINCI=y
-- 
2.43.0


