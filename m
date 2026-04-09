Return-Path: <linux-gpio+bounces-34940-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFxRBL6m12noQwgAu9opvQ
	(envelope-from <linux-gpio+bounces-34940-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 15:16:46 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C873CAEE9
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 15:16:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 59D27301BEE4
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2026 13:14:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B21713D16FD;
	Thu,  9 Apr 2026 13:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bCP7MtHW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011023.outbound.protection.outlook.com [52.101.52.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263393CF689;
	Thu,  9 Apr 2026 13:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775740453; cv=fail; b=Q/Hjfk0ulI8Jy9lNWgymXRaa5+uUZJ80fTvF0KZ2UqIlvtNSy7z9tdWKxHCK47rC5kSInYFRgl/DigYc/bKW6xDXakZw8ZvO4iZS/4M1dwchUCPHr2xba2NexOF0LgFgR9Bsd7NCZcCSsrvcekIUR5uSEUT2ZNTXyM69twYGz/g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775740453; c=relaxed/simple;
	bh=y3k2MTH/V20YaScEfnYfj1k4W6qok+PYeP1aeAmAnEo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LkQFf9p96/e8tBfmIBFVahFOC4jNZwXtpn17oBKELS3tMtqMdJ7n+LdhM71DjXLY4MirCbolixvD2HiS3AuE1a65mbReZRx2CuGS+++GQazxaL/nMV78q8Ox9csTwcUIVec+SsXU/215BcbhXYkj19jZIijojTX+jVW52CG4dxI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bCP7MtHW; arc=fail smtp.client-ip=52.101.52.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B2aM6DV6PZ24r/ji+BRXSX8wbqof90pkoO9TdLsDULD5J/OP0qIrlnTTkL3zJaRrjI0a2sBx1RSzKBM4XTwA+0pmBw3rhG8OPAP17uD7FdVTSyDS5KPSrHyQHgjYSMYvrOsdGIENkIqD/rcbejsgUAkQp130gX/FUN9MedtocE06/V+LzwGLfkXlybrs2Fe9Pm4hmnZ8RvvEBiN4FHLlb9Cakz/sRGnim5rAw/q29TdpeS0tRVIWds65nnhm9d4CyEqFaWMDWXlbXHMNdDweLOreI4EpcQFyrqf0sfMh2jANWU6JzZjaKBtb1GYISJXKgwXBEkdSGFlm+NijLdAgqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bMFdiyF0G7RthAXLYKfMZnCo+LDMFn8sSVW8vSABuak=;
 b=cmJlMf35DlgjDUPl6mgNb35gX3rLtVXccsC+U8zDUDxYmDj3uOIzP80S+EVoN/qoGa479B302I9841lUijyy2XQS51TPngGnIEhT50Z0+LKvMdmqLpf0YitlDnk01RACBOKUCeHJP6lAFJBHsU1orkqjeACdPHvnNNfL7JMtrqGUWzDYu2tdXDIT37s7WFzrBKYYCxWMR7cuYJjOb8gpwO85fBQD4TFDkDlBKGk/bSCbLfpkNkgj9oy6zwnRsZuQB6XZepArcbRMvDg8yih2qguh1QVsWhtw89mYA3AbKfyPfyL8N4MmF7W77Nvo2iKO8mG+xJLxNM++nIrG0wUl4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bMFdiyF0G7RthAXLYKfMZnCo+LDMFn8sSVW8vSABuak=;
 b=bCP7MtHWP4Q08BC5g5oICgEU3BcpdHxEvDgZfCGWexYqEUqUyvu0rKuiGM/+PD9S9hS+3Fd3TXq+LGG8h5hxeO/A+i9hIJ5wL1B17LpAfXe32mZFne5QorEg6giY74nqPOBLYyxPiK6WC5RRAx7skb07K+3ba0yuZnb0tA3/MEmy66v5IFj8CSl/ovEXd+hkNMJZxXUWZH+JY7Uhuv+yx7kPwNHWhguxKlUCQ3FYwCZ94nJmbzOtQ4u54CVAYlC64zI+jQa1m99jqwIknJxe+6PnlKOrAL0auudegrNT1XpeWtmEnNClL6JPPPxyuS0LHuyW6zctravOGLPbmoIkhA==
Received: from MN2PR14CA0025.namprd14.prod.outlook.com (2603:10b6:208:23e::30)
 by MN0PR12MB6223.namprd12.prod.outlook.com (2603:10b6:208:3c1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9791.32; Thu, 9 Apr
 2026 13:14:07 +0000
Received: from BL02EPF0001A0F9.namprd03.prod.outlook.com
 (2603:10b6:208:23e:cafe::d6) by MN2PR14CA0025.outlook.office365.com
 (2603:10b6:208:23e::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.42 via Frontend Transport; Thu,
 9 Apr 2026 13:13:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0001A0F9.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 9 Apr 2026 13:14:07 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 06:13:49 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 06:13:48 -0700
Received: from build-pshete-noble-20260401.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Thu, 9 Apr 2026 06:13:42 -0700
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
Subject: [PATCH 0/6] Add Tegra238 and Tegra264 pinctrl support
Date: Thu, 9 Apr 2026 13:13:34 +0000
Message-ID: <20260409131340.168556-1-pshete@nvidia.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0F9:EE_|MN0PR12MB6223:EE_
X-MS-Office365-Filtering-Correlation-Id: a47d32c1-7ce7-4e67-0555-08de9639e17c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|36860700016|82310400026|921020|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	AxMaqLyoHHDnz0QaYSVIQvszovUUwBRPZF5XqHcyeO/gkFPuiYCBVkhWh6c+/2uhOognoorhNMJ5CPFJuulkHEkC3PjFD9WpumLp0PkKg3MRGKIsoQbB4I29a2tk43lz0xbIT0srdcw3xKITlQhh9gLnr1X/3TS6KN6MRcVyw57r5nohxob+no6jl8Am1KsxVRKEB4bZ9paRYN1i2PwpSYpcR0PYygNPQUutT0f8SV0UJE60jq09lYdZJ6XHv0a9nkG0m+KdukXxlZoZ2UC6cTi1nC67meWKzneroduQpPB2SQvxFrerXqbibMWD1YSq90NLQhvpmXbxyfHQmk+5iXdYpwuWudzTTc/8gobUnlT+1OmhqMxYlHMi906GJEXN7o2msJjA56Ny1kDW5akZM5Jw0V7YB52IIVridTz6XcoQkbhsrMO8PMZTnovhtjoq9wGGP89Up26jDvl9o28pLfCj8WxnLmRuB2JxKNbRKBp0qG8lJWUHho2FPEH/b9qw6Hz8fHP4bSc1djxdgS0k8RpPWg3xSeV2ZLc7tHoFtGHp9FjREpdx6TSVHHqx3MzW15UvTtGnHGpWcLkl0Qk2Bbo9j3Z8NOjTmH9pTiPbL9IsW3sjj8dGEyYtsdWUWQRHWmH61lwi1fw5g9sDmD8+ijdBUL1ulwygdBuRj2vnSqZOq0O24ESqkfRcc51hwtbJ12j8d5orFw8LcDLqmKXzEJBF9xEb8GTnOC3g2ZM7+4gp63tMiw4vEMmTSu97stvy2YNXNuaAPKj8W23Thluzb6McCmbYKk6pJpQYXTk+hMkLJvXtX94ThxbvpdGGGw2g
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(36860700016)(82310400026)(921020)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9laysP4MsAIV3CAzmspxMX0HeGf8EHt9uyw9cEvs1NNFaDelJRjQWftDojil6tnxsUmttVTfdRp0bsYSET75Ur/yf+NNgy5b3sAjraRgEGbQ4z+g9MsXWmZtQYzlcwGKTH0Wn82rkg8GdL3DrfvL/iQJqoXwluaNG3jKevDIs8iShDWrq+UFK47GHCwt7K91lb1zw/xthLxtG7GDyNKNynvFPCSxZmV2uyNp8ZRJe8ECJ9PMcr/GUaRtTf71op5ivTq44YuECOVlpBdkR0d7v/Oo40MyN2dsyGPF5DA7vrQftaNgn8sFgcdFZQ4yweCq7kyLfe3L9SzmetZex+GsDnE4guzr4hyvlfE0MNJcemqPxUCik9PjnkNu4zeWfVI55a9l0Cue5HePlHjgAtSk1pExPiOjh3ZG4mlxmR29uoBH8VBz7KCNeqX1Y4+t7Mz4
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 13:14:07.1519
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a47d32c1-7ce7-4e67-0555-08de9639e17c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0F9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6223
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34940-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,arndb.de,oss.qualcomm.com,kernel.org,linux-m68k.org,nvidia.com,renesas.com,fairphone.com,amd.com,bp.renesas.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pshete@nvidia.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 95C873CAEE9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Prathamesh Shete <pshete@nvidia.com>

Add pinctrl driver support for Tegra238 and Tegra264
along with the corresponding device tree binding
documentation. Additionally, export tegra_pinctrl_probe()
to allow the drivers to be built as loadable modules. 

Prathamesh Shete (6):
  pinctrl: tegra: Export tegra_pinctrl_probe()
  dt-bindings: pinctrl: Document Tegra238 pin controllers
  pinctrl: tegra: Add Tegra238 pinmux driver
  dt-bindings: pinctrl: Document Tegra264 pin controllers
  pinctrl: tegra: Add Tegra264 pinmux driver
  arm64: defconfig: make Tegra 238 and Tegra264 Pinctrl a loadable
    module

 .../pinctrl/nvidia,tegra238-pinmux-aon.yaml   |   78 +
 .../nvidia,tegra238-pinmux-common.yaml        |   73 +
 .../pinctrl/nvidia,tegra238-pinmux.yaml       |  215 ++
 .../pinctrl/nvidia,tegra264-pinmux-aon.yaml   |   76 +
 .../nvidia,tegra264-pinmux-common.yaml        |   84 +
 .../pinctrl/nvidia,tegra264-pinmux-main.yaml  |  163 ++
 .../pinctrl/nvidia,tegra264-pinmux-uphy.yaml  |   74 +
 arch/arm64/configs/defconfig                  |    2 +
 drivers/pinctrl/tegra/Kconfig                 |   18 +
 drivers/pinctrl/tegra/Makefile                |    2 +
 drivers/pinctrl/tegra/pinctrl-tegra.c         |    2 +
 drivers/pinctrl/tegra/pinctrl-tegra238.c      | 2056 +++++++++++++++
 drivers/pinctrl/tegra/pinctrl-tegra264.c      | 2216 +++++++++++++++++
 13 files changed, 5059 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra238-pinmux-aon.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra238-pinmux-common.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra238-pinmux.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra264-pinmux-aon.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra264-pinmux-common.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra264-pinmux-main.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra264-pinmux-uphy.yaml
 create mode 100644 drivers/pinctrl/tegra/pinctrl-tegra238.c
 create mode 100644 drivers/pinctrl/tegra/pinctrl-tegra264.c

-- 
2.43.0


