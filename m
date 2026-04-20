Return-Path: <linux-gpio+bounces-35250-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WK7uMtD65WlwpwEAu9opvQ
	(envelope-from <linux-gpio+bounces-35250-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 12:07:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 772ED4292FB
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 12:07:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 24F04305A893
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 10:06:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAD0D392838;
	Mon, 20 Apr 2026 10:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="W1VZoDkd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012049.outbound.protection.outlook.com [40.107.200.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DF937FF57;
	Mon, 20 Apr 2026 10:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776679597; cv=fail; b=A/1rdImNj1kshEXZZD1rjiKlaCiSEgaLOOrKsXNvvtoooqjCqs5x4v8Xu7g3LmspP4aO+tNUbTIlFmNJFw/Se7zQRR80IRokwfSC9XB/5huELW168pXj+hnJ2qYDICkujmDY2l0uG483WoFMKI9doA0ogdgH9JtATMQK0E5yJdI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776679597; c=relaxed/simple;
	bh=YNmO1mCkGU+t2APILPQ5KTMOq/w79c2vNzdQXlhz9b4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J4SJIasTIVYS+WFW2278WMvG2r5Eff91QUcimJzNXbPbdDMjzywTV+G8h6xbgumWHAI9M3erO1On1wvcMNnFulEZ/ApnasGtjnirydnhl4qzdMPCjQjlc5OnaATGrwnPbKpI+/xvexGiAJ7LOs9s18Tnk2WHvA0HxPOfoTiTQFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=W1VZoDkd; arc=fail smtp.client-ip=40.107.200.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZHQ0uFgm2xWhuXdGro0j642epF57e6FM04jh1pVwNAThawwXO1kqJAb4ViijTPz8ImNN5elIWl9pMf5jDrgMgH7zG6mgTvdueJXHCJi9421PlEmD4Xw6l/UyQH5atWpxMXMO2SgtJMcuyazrSuHStTZ0UNMHkXACUnmFj5bQPjkCSWSXey5YT9ZBzkZO8lX7lqSsgbcvOfXNSXRmPQr062az2g5eVVvyfusXrNVu0Ph6cNU551jTAX5i6EoG9JXiC3ZakU76nBSfO8XmVxZSX7n5+Ix4K3uVep/50rMJVGR/q45GWe//hsrkFEosKOq/5IRUjt+7bizqdAIflMdbJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LN8umb8volXX6gjIJ2fVLdidhoSO/tiwH4vK0wjFx4I=;
 b=XsIn7Kb6D+0a6cQ8yQkfdNcAfHNlQqySFPrQ7GN6q9WMvPrB9zrSbwlQf9OWjNddxiYtR3AdHZWUpP8CjClVU5TbjhQ6I4UfVI7lFrZFYz3WSPYIgA6NVXeeIkP57lJjjboKCybMfJhQw1Gx2Fry/HeSBUnrFZQTD/7ZNFVteDu1Km7Z2fJYo8bKh41om5CQTUTzC3203sPollKrM5MjV/YoS2THMlihjo5Xj27omF+K2AuqvbDqB7pFQxmz0wdVBkTqYWpN4tjTrn0S6mpHWkUN1KZ5aoQu05m7grxbPHa1JyTSfdxWp6hVQdel5wBW4Kou4QctR7W6uymtP9FZBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LN8umb8volXX6gjIJ2fVLdidhoSO/tiwH4vK0wjFx4I=;
 b=W1VZoDkdjCaWzhPFGymn5PVFXGxWy6LNGCZf7rEIt3aMtjA7TAhalmPA4bRj9xQbQNVT4e1ecDDnosTy0Cs13x3t2yuT47G562v5fb6sfgTjuWo1sibZ43HAlhRkHcEJH4cz8ZkaQ6/HxIu8NY3UhH5SznWjELMHJSCPvIyBqckKCKm4MU6bQh31qTN3sAgqxH5+RS9QvPKgru3jcdkJkiEEwcMZjz66CI0otmjmzd/sanTM0Y9CbOc9mmcqVFGAo4DIZrGDgLNjEId8HXXGvyfGgYlzHsoC+9EoQqsSUPdDaChRPwNLUgr8+9bwQ2IXUch4iICtc4hvEdCe0yHSEg==
Received: from BN9PR03CA0699.namprd03.prod.outlook.com (2603:10b6:408:ef::14)
 by MN0PR12MB5763.namprd12.prod.outlook.com (2603:10b6:208:376::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.12; Mon, 20 Apr
 2026 10:06:29 +0000
Received: from BN2PEPF00004FBC.namprd04.prod.outlook.com
 (2603:10b6:408:ef:cafe::a) by BN9PR03CA0699.outlook.office365.com
 (2603:10b6:408:ef::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 10:06:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF00004FBC.mail.protection.outlook.com (10.167.243.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 10:06:29 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 20 Apr
 2026 03:06:11 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 20 Apr
 2026 03:06:06 -0700
Received: from build-pshete-noble-20260401.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Mon, 20 Apr 2026 03:06:02 -0700
From: <pshete@nvidia.com>
To: <linusw@kernel.org>, <thierry.reding@kernel.org>
CC: <pshete@nvidia.com>, <jonathanh@nvidia.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <webgeek1234@gmail.com>,
	<rosenp@gmail.com>, <linux-tegra@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/6] Add Tegra238 and Tegra264 pinctrl support
Date: Mon, 20 Apr 2026 10:05:55 +0000
Message-ID: <20260420100601.343707-1-pshete@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBC:EE_|MN0PR12MB5763:EE_
X-MS-Office365-Filtering-Correlation-Id: e114ebe3-0e23-4157-4e47-08de9ec47de4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|36860700016|82310400026|13003099007|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	53FESsq9Job+CUv9uVZD9iMLucCEI8e6z+30BF8kFHKHOI1eQlnJrbx2eJbI9xYXgchfPCJrWVUxNvhqdw5e3syadc932bvteN7FZfCC7kSz41csvpPd3XHQJCPoko0gJtCuvbftqBpEVNX7PO37TFRWONo8rNFc0MAidGbPia5NFZTqW4lcTmEGJjRFjkTejAaFBCeBlXQhWluOim0q60lrGxPRnZFVJtEo1mmtohbCjswQ/l9kXhY2SVnzyguoFGkjsZ4lYGADQEvDzieCmLveTPtLL18YaiH3b0WAQhGvauwf6L7JJk3zmCPWWi7N3V2E/V5q//YARyQuNtQuiMcLVCRbCiSjNCa0CYoNQ9B0mYXZze1HxgbAU1SzgtTl8qUrmLBnE42BJtoC7HWZRXsSLr5iDlDH/R+l9xQ1qz02g2jeNu3NgEQBA84sGNL1brgMt4metkmlTGSAkseeyrzSOF/0jDc6SgfqRdSHI/R7KNqcHAMhMoXc+wzwQu8IfB2BiFSHA2O0WA5W8ii/5QYR/NeKFJLq2cKO4j/ouo9+zdfgUIxbRdmwM7qSriT7u0RmSNeWMb0Fpbzhnowb1Y6ljUzv19rhN5dPQAjMXm4oqZfBcCgdGQZJNBFbakicdj7MDsrj74Jbid1S2+w9eaw4wWjxIJapqVLr9gzrP9pBRME+BkKQ1PbLA4JE4bWWHLIm+o+bcE3gXE5d+F/u45DlU8gHX2dPJtCnhAHjd6XYYR+ahpbi2FmbJ6/9WKrHvIcd9DQlH+Mf+9nzjVLC+Q==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700016)(82310400026)(13003099007)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RaOOfE4Bb67vvQGiy//L3prpXE8gjQ4dSPkIytqQp1xmRNjfZJ4TWxr6xFr39jwDSrw7ENOwiDtvDu4KB2AsxBIoL8Oh55Lb4tXuFakfAMr8tbFG9RYATrLHIA6Ooj5R3i2rU5LcfA/H6c9h9DE5e5fSZWQpXjtKmEKvnDDPVevG3nKlHJp0hAz8ONDJeQlX4PKvPwMiiJgKRNjBPQG+JgBaS1shXrdJagFVyJ94mFoNyqtV6sGa5Z/MLt1FRpbJGssxBMh1Gc+s/ukVve5jOEX/TynKl1noF74h5GmUDVDGBKiilv/vt68fymSfcqkORLIisrU/s2sED2WWCezkIdmfNxypVIHilddnsXKbqV81Jil4FZ+XDQZg4JL1U96prSZEJage6hbsc2p1osOM02WPtcNgyPZrzi0J1Ed81TCd5zBUOb5yjrspJiRrNdnR
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 10:06:29.4182
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e114ebe3-0e23-4157-4e47-08de9ec47de4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5763
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[nvidia.com,kernel.org,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35250-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pshete@nvidia.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 772ED4292FB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Prathamesh Shete <pshete@nvidia.com>

Add pinctrl driver support for Tegra238 and Tegra264
along with the corresponding device tree binding
documentation. Additionally, export tegra_pinctrl_probe()
to allow the drivers to be built as loadable modules. 

Changes in v2:
  - Drop the "arm64: defconfig: make Tegra238 and Tegra264 Pinctrl ..."
    patch and instead add 'default m if ARCH_TEGRA_{238,264}_SOC' to
    the PINCTRL_TEGRA238 / PINCTRL_TEGRA264 Kconfig entries so the
    drivers are auto-enabled as modules.
  - New patch "arm64: tegra: Add pinctrl nodes for Tegra264" that
    describes the three Tegra264 pin controllers (pinmux_main,
    pinmux_aon, pinmux_uphy) in tegra264.dtsi.
  - dt-bindings (Tegra238 and Tegra264 pinmux):
     * Add 'required: compatible, reg' to the top-level schemas.
     * Switch 'unevaluatedProperties: false' to
       'additionalProperties: false' on the top-level schemas.
  - Reword commit messages to use imperative mood

Link to v1:
https://lore.kernel.org/linux-tegra/20260409131340.168556-1-pshete@nvidia.com/

Prathamesh Shete (6):
  pinctrl: tegra: Export tegra_pinctrl_probe()
  dt-bindings: pinctrl: Document Tegra238 pin controllers
  pinctrl: tegra: Add Tegra238 pinmux driver
  dt-bindings: pinctrl: Document Tegra264 pin controllers
  pinctrl: tegra: Add Tegra264 pinmux driver
  arm64: tegra: Add pinctrl nodes for Tegra264

 .../pinctrl/nvidia,tegra238-pinmux-aon.yaml   |   82 +
 .../nvidia,tegra238-pinmux-common.yaml        |   73 +
 .../pinctrl/nvidia,tegra238-pinmux.yaml       |  219 ++
 .../pinctrl/nvidia,tegra264-pinmux-aon.yaml   |   80 +
 .../nvidia,tegra264-pinmux-common.yaml        |   84 +
 .../pinctrl/nvidia,tegra264-pinmux-main.yaml  |  167 ++
 .../pinctrl/nvidia,tegra264-pinmux-uphy.yaml  |   78 +
 arch/arm64/boot/dts/nvidia/tegra264.dtsi      |   15 +
 drivers/pinctrl/tegra/Kconfig                 |   20 +
 drivers/pinctrl/tegra/Makefile                |    2 +
 drivers/pinctrl/tegra/pinctrl-tegra.c         |    2 +
 drivers/pinctrl/tegra/pinctrl-tegra238.c      | 2056 +++++++++++++++
 drivers/pinctrl/tegra/pinctrl-tegra264.c      | 2216 +++++++++++++++++
 13 files changed, 5094 insertions(+)
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


