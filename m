Return-Path: <linux-gpio+bounces-35566-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKcvLgBo72lZBAEAu9opvQ
	(envelope-from <linux-gpio+bounces-35566-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 15:43:28 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B3251473A22
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 15:43:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C16783004C8D
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 13:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D31973CE481;
	Mon, 27 Apr 2026 13:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DzwDOrPa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010012.outbound.protection.outlook.com [52.101.56.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506523CBE91;
	Mon, 27 Apr 2026 13:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777297389; cv=fail; b=Z9p31R5Psbc+gq3JZke0kAdbmfhGFSXkwDqbu7r1ixtZFfkqK3Ybeo5R1SVEg0I35E9SzG9Nn7BqRFIUL0/W8V/vXsx353Q7vIx0+ek4ls2A/XaEwx3jK1jW3KgulI8jV7ZVGM8FEKx6FyvceXT87sEhk/bnBDLeOsjs6MT8IZI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777297389; c=relaxed/simple;
	bh=IA3XrQohtZRVfX+gyPo/XLEmt7yslTe9e+lK15Xw6DI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ueo7uPjpFNXF74CZ7BImgd/i7hNHHarER+iGLUjWFm4AbjzjvlD4eQ0p/OM5HfXjlhspSAQdH4MUj9Hv8Y4HMX7qaV8K5b4tXueitzb2KuN14ygGlyXexBFp3xan8ExSsRNbWBCk3dwTSjbDRJYbNUJJm6upcVu5PjWLPSVXM0Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DzwDOrPa; arc=fail smtp.client-ip=52.101.56.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E46I+LNEl0DTxQDl2pKIyhUVBi5dJwAE4wcPV/kuelyXK9RmVGJL/wSsUzrsaj5qQRTGcNhgRkoRc7n1XLx6LC5wcvHfc6xcoSYOzP0Jzv7/HqeVp+/L1q3Gn48YgU1ccjiBePh/Ml3I3ptN8BNXHfilgrowGaf2vkp3Xuy05jtDtyYH6f88ZGUusl5STWT2zr3ZIZi4y9Z53wf9rE1bQygeePBIVgn0T8P8OhdCkt1elYUkHfQBOfOgq0saUowiQOOQbjCgx/bpv9/3xcNmL6ZTYqDkSrgqJthR8BdOuFiS6M6srumAtZeXZvPeuYcZzPmgPk73y1GHINln+UMugg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q6mOysEq/IicqGGyaQA/DEmuPsTnLgPFbWxvumi0ZI8=;
 b=ylE6GPjj9WPDXmTkf2iC9VtaZXWyGe9TQbeMNsakzY8EpblbKUo+awBDuPSmiwwbBOLMm9IGTWncRSzLSBdLVgbEDNGRkWcpVfSZpdQjapTbl+Mfb5tzhEO5GX/BGOxhFrV4GKLqNyHpIiGRiluRQKILBvLCYPXTtezsSXXPsjX8SpVSyLwsAzeSshPKE8f5xfZHP4OoKRgaZ4DOa1NSs1rJzrEt1IFJ+mrmoyA0Ms92VEONvxJUUWoCY3RAtpRMtKDDUlyyGkmKhl+1j+I0ei15EYCxjK5oXFnpxuSuPbzLV68fbfutmA0LPznin1pkPsK6m5APCATcvRosLu2cTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q6mOysEq/IicqGGyaQA/DEmuPsTnLgPFbWxvumi0ZI8=;
 b=DzwDOrPasOg1a8t0vh6Ko2R766TmP6p/rQghrKofP2MUvLm1p4h56k3rnSjlWcC5yzgvGVITj22Mq0cZ5FzNz3HF7fv0lmI1z7SLI6KuR4I2+058CokMj9OUSM8WCOiwcFUqtwCWhQM9q3OW0Gx5vt5YvtQD1l55eXvkeh/zTH+3hGtl4RfGM4j1yCWIFza536+uy6GH3l5KwkQgiWYkLNsAyzUmnZsB9tBcROiRjOaluaKchRqOuqKrRXHcQ0ocKNFitrHLeqM7naWiBTjIp/nW9fc9HL0pW37p15V+Q2PfN4yYbVdFh0A08IHMQhWGwORwiwxv6zQ3dpzcArzt+A==
Received: from SJ0PR03CA0090.namprd03.prod.outlook.com (2603:10b6:a03:331::35)
 by DS0PR12MB8043.namprd12.prod.outlook.com (2603:10b6:8:14d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.13; Mon, 27 Apr
 2026 13:42:57 +0000
Received: from SJ1PEPF000023D0.namprd02.prod.outlook.com
 (2603:10b6:a03:331:cafe::b1) by SJ0PR03CA0090.outlook.office365.com
 (2603:10b6:a03:331::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Mon,
 27 Apr 2026 13:42:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF000023D0.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Mon, 27 Apr 2026 13:42:57 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 27 Apr
 2026 06:42:38 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 27 Apr
 2026 06:42:37 -0700
Received: from build-pshete-noble-20260401.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Mon, 27 Apr 2026 06:42:34 -0700
From: <pshete@nvidia.com>
To: <linusw@kernel.org>, <thierry.reding@kernel.org>, <pshete@nvidia.com>,
	<jonathanh@nvidia.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <webgeek1234@gmail.com>, <rosenp@gmail.com>,
	<linux-tegra@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/6] Add Tegra238 and Tegra264 pinctrl support
Date: Mon, 27 Apr 2026 13:42:25 +0000
Message-ID: <20260427134231.531222-1-pshete@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D0:EE_|DS0PR12MB8043:EE_
X-MS-Office365-Filtering-Correlation-Id: a49ec09e-168b-4830-f9e1-08dea462e442
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700016|376014|82310400026|1800799024|56012099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	/qBnluvD4hWuef9fYSFIJ5cZqWR6YNexY+NJ4uWs4cPlf7Dllzvm4V+QpyrMDazTL4EesC+TIrBg+73Pkz27P3GdtyswslgVYd5eztf55C7idZSQ9s4aAjFkAT5M6raHo2UBpgqzwDsEKwnYIGB8t/H9Tkyw5zf8SCR/tWDmNRp5sKf1wMs2L6TV1QS3g8SrLLlQVE9c2zr/Gmjl+8L5BXn07NYCqdNJ1fTT8ZWWIvRd4EtASuPW5+ETo4wheGRm+vZ+4swkxeQwEzzmEpuCKV0oUqLQlvSHmSYkyN3NiyIz8XY0aRPIwYhae9YT9z0zz1TKjfvjKMA0XdVUbD0BAi0MzT+33qu3QVRP9YBuPLRPHsUF+lV4S2yQcxpR+0EzkktKUl/NZ/q+dPYBaOnGKlZZNc2ibPn937BZT5tlwYHOo0NuxvlwsMm4YrrbTfXQMS0VfUfSx9JIrkeK8bbM6GzOE/sdiTb4yJtuNrYDQMVAL2ktM2VKsJ5lPTuGc8G4sV3THb/b/f8xR322N5q0U4QkAhLy3IGNyJhTx5qanC8Nl/o7q7ATpoepNbx/igg3eQX2YDh0vNSCXM03WLz8iOeff8RObGhPF5b0u1n0y7XxpsxkASCQdAHntRXUIpcHkjVCpvjeatXllMIJac4sRKidtJ+qPHFjiagltw2xD6ItLsyv4WCMtP1xQU4txp1X9ClZpwfkhKRGuiFw0VueXq878aZ7UyTmQ7ScRDlEqAurzbMgmFLLtNVS9iombv3y5pxBYkAxxarBX4b6pru7vw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(36860700016)(376014)(82310400026)(1800799024)(56012099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fvGSe2DeIPYxzmkfKbHE8/OtWIPVJn5JbUlOdFAV4Oci5vB+yDfUOwNeYgAnJOrZFoxDNC/9eWNXupKhbeNl8klOJwGbjotxUCg8q4eTVL9hJyuhknyv6TgkCZ9Zn6/+0iFcVbPWtWnjrTqxPRBH9OElDtGONhVJgdFYvLAb0hwaWIhkfGIekJcxuaWp6dFp+8+qNk4gBP9W5Cz0MDZWuVglIZlT++3EhS9koRNN/wH9YyIJscaQKCk7m9Go1yD9hSc9i+d1L6p2Cytwn8VEUrj4O/qptvc9Ohzoh6/5TyuRAh3K2FMBki0J/9peq9YAlPccNC1aKAXnjnBqUvv8W6laEu4W00uepPuDI8GqEIYM62Lsf95MWpYjzQeqw43sUndbr88NweNNraJhF37gyyIrH6vz6ypPoYWY0NH2IBfKMRmDwW6X49buXEeyU5p9
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 13:42:57.5075
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a49ec09e-168b-4830-f9e1-08dea462e442
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8043
X-Rspamd-Queue-Id: B3251473A22
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35566-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pshete@nvidia.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,nvidia.com:mid,nvidia.com:email];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]

From: Prathamesh Shete <pshete@nvidia.com>

Add pinctrl driver support for Tegra238 and Tegra264 along with the
corresponding device tree binding documentation. Additionally, export
tegra_pinctrl_probe() to allow the drivers to be built as loadable modules.

Changes in v3:
  - Wrap commit message to 75 chars per line (v2 was too short).
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
  - Reword commit messages to use imperative mood.

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


