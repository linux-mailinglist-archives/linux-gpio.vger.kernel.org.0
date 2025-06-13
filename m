Return-Path: <linux-gpio+bounces-21511-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 003CCAD8901
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 12:13:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66FC63B4514
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 10:13:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22FE92D2397;
	Fri, 13 Jun 2025 10:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="j3mBTLhe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2088.outbound.protection.outlook.com [40.107.244.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DEA02D2380;
	Fri, 13 Jun 2025 10:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749809609; cv=fail; b=fUneFbHu/eLutdKCRHjk+PFGLru+8jFZDzwIXpOq5WFE0Sm3vYbiOchPSNkF7yfpV65Opi5N1f+RrLXQrfYagcSrDAmC1Oz1mALMkDBbGB/3CmbGDmyHROQoolCck4zAOyMrUpK29LfQP+qogPbRY4G2w0oCsgNNLbqLqx6Dsdc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749809609; c=relaxed/simple;
	bh=Porp3/L87PdaokpFBMH3QzoSa3a15c+OlRJdI7MyIEE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JYR7yTkQfcmS6PK8lk0RW8TLL2FxysoZQ73QDC5DveEhTw8cgcZMaHYtWxmLpcNeVJkmrX4owO/ynelQAbW+M2OBxw5oMFjv8+lBGYPrBddypqDETJ0DBVwmKcO8yHA10Cj30p5tFBaSg54nY5zHAfDb3EiR0ZwHS+BPRmqtusk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=j3mBTLhe; arc=fail smtp.client-ip=40.107.244.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HjlxypH2/tzy0gK0qqDDMVRA4gCrB8EmCqdyIfkoTaWo099s/CF9F+o1rwH8Vngx8QmtJAqPlacrmMTymLuFP18FyUEi8RPLKtfUkIyQU2CTNxoSEe2gCF6tPsQtm9HCLOX9fXKQ8+4UPzVpzuNx6nyo4cZ22/xqUT7i9EWZJWXJGjx6tA8ybcr+TfcCTpTXKLDHJHvB8FKFxvTK3IDpc3MjD2Rh9OKIi+ZRtspLMNjVdVxfmG5hyRmW2py6vS325nmHoVO0lzVgUvn5SBkF5ojvElcYjcqardtB+H1Z7IQW95DJKzq+OfMNfm3LUguMNqxW7SL7eivSfqQMM52yzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fQhrER86kV77D51W9dBRr05vyvK8XEmW5e/obbwfp+A=;
 b=IL9jlo8KBY9FZaF+Ug10pE8ug13iXFK8f66OGssYpewrbjdO7aKsvFT4H2oj22tGcPOVy30nrzkgBOswNEcBhrMPV7ThGG6NE/LRQluQ6n+V8X+N6rRsBjmzmO49YYZr7rjX5WSRXbndl41919Qa+MF2B2DxOtRTqcJ81Umi9kePuKANmCxF69fGG+3Tf0w3N4gB9ll/IDsJdZn9lLSmvCNUzHOcSFI7q4SNrEX2lpMHE9T2oYneAUQPc+M8W06nMCuYdm/ASC9XBpRYk0EhgRpQ/iSQDn8ciV3BlgBJqMjo6kHnkPrhpivXWV74wObuK4mHUPPpcOK3MqZBr4Hv/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fQhrER86kV77D51W9dBRr05vyvK8XEmW5e/obbwfp+A=;
 b=j3mBTLhe4+pxP+PfteFEk01tPi1A543KFCvqMVup3WUZKlhrgKUJxiN39x/arPYBZ9JiGVYNEnsVIlbwoGI0J+rhrOSBulJG6AGzFsjxjbUAhhwepqStcbVtFJynzsHlmeeIkMjLxJAQ8gVtB7pH3WZbNSvhek7RYsLkK7IJip8=
Received: from BY5PR04CA0007.namprd04.prod.outlook.com (2603:10b6:a03:1d0::17)
 by LV3PR12MB9353.namprd12.prod.outlook.com (2603:10b6:408:21b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Fri, 13 Jun
 2025 10:13:24 +0000
Received: from CO1PEPF000044FA.namprd21.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::14) by BY5PR04CA0007.outlook.office365.com
 (2603:10b6:a03:1d0::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.22 via Frontend Transport; Fri,
 13 Jun 2025 10:13:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044FA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8857.0 via Frontend Transport; Fri, 13 Jun 2025 10:13:23 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 05:13:08 -0500
Received: from localhost (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Fri, 13 Jun 2025 05:13:07 -0500
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@xilinx.com>, <git@xilinx.com>
CC: Bartosz Golaszewski <brgl@bgdev.pl>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij
	<linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, Shubhrajyoti Datta
	<shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, "open
 list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
	<devicetree@vger.kernel.org>, "moderated list:ARM/ZYNQ ARCHITECTURE"
	<linux-arm-kernel@lists.infradead.org>, "open list:GPIO SUBSYSTEM"
	<linux-gpio@vger.kernel.org>
Subject: [PATCH v2 2/2] dt-bindings: gpio: gpio-xilinx: Mark clocks as required property
Date: Fri, 13 Jun 2025 12:12:53 +0200
Message-ID: <cbde9b9e2b0f9d12fdd1ba24fddb1543159357aa.1749809570.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <8407ef56b11632c1a7abfce8a4534ed8a8ed56cc.1749809570.git.michal.simek@amd.com>
References: <8407ef56b11632c1a7abfce8a4534ed8a8ed56cc.1749809570.git.michal.simek@amd.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1562; i=michal.simek@amd.com; h=from:subject:message-id; bh=Porp3/L87PdaokpFBMH3QzoSa3a15c+OlRJdI7MyIEE=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWR4/1w5Y1PGFgvv29uP1v2aJf61weLhW4Xdy69s7f+56 5217Bzxwo5SFgYxDgZZMUWW6Uw6Dmu+XVsqtjwyH2YOKxPIEAYuTgGYSOpMRob5zys3TKj52d/W u+jce00T/WvCr7qylofIssfymjdJp/xiZDg2q/j/i5t3otaziH2ddoo55piE/K1dTCfcNdyL+5/ 7fmYCAA==
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: michal.simek@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FA:EE_|LV3PR12MB9353:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f78aacf-0f81-428e-cd4d-08ddaa62ee7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|7416014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?c3LyD9v9UAlTTj+glmnFVutCMXXIKTcfpWu80CIMu6QhFCqOuw8KnqgfLfso?=
 =?us-ascii?Q?dKOTzbElnk9vfLrrlX6zEqps9h3WfbjPm/RC6f3YeDlJmvHvGE74qoK1EFXS?=
 =?us-ascii?Q?xmsav2b6PIp0gSCylj8QHbXC/MnHjv4GddImv+RfeDdqkShQUgqmF9PHHFnp?=
 =?us-ascii?Q?0e6aVR4VL6mfDUKPJUohkCQi7bPeP+hHLwOmq/o4OZz9mu8qoervNYDrhXHJ?=
 =?us-ascii?Q?VqTfL5ffyKxhcWk30EEngECeifInkS/X71+tDradSIsYmy/hD88UXL+aDwzo?=
 =?us-ascii?Q?CZYx+aCimpHfQV5Acaa764oZE3Lczn3rQ49noFZyaQMxdyO7IhrVjNU1olV/?=
 =?us-ascii?Q?geCfWP6+/5zmBaJIQpRpU4it/Uli3Ggv1OmsdHwesBljkM6y4GvvFKM6mRBx?=
 =?us-ascii?Q?i6ApFNnD8BjHsixHmfAnvtJh7eMv2a3g8kRvTYEf+pryRTkUGGihKlBTsRId?=
 =?us-ascii?Q?eAHbAcOTUr2fxDjzHtDWo77Ba3siZI6xtFvghuP8E/uyrNLlNpZFuInxHT97?=
 =?us-ascii?Q?5Aj3B5w0Nw07GIW2lpGQU+nmgzAI5uiKzBap4q92hjy5ajGUga0J9EL8AAmU?=
 =?us-ascii?Q?NyeOnr4JABWTWyX210GhJaaexYQTu3DFS8HMoXtufoPfljB5s0DUtZWNa6pt?=
 =?us-ascii?Q?ZWSwL37wIwGSiAj+E3bRQmWlkcYL0ggbePfBDDV6smV3FrYWKxoSfOykz033?=
 =?us-ascii?Q?RHrCh+/4AikJL7Xesq07wDpGIAEOc7Nm2VLDaSKgFGrfgJub+E/oJHWCQczu?=
 =?us-ascii?Q?7CthGhf1MV4Wox152rfCDE05EHIHulw/P2/Mwv1gYraFScuurDNvRxdP69TS?=
 =?us-ascii?Q?P9gVh2NAtQqEp4HVbghbDz4LD5gflr9lwrEUdiZx2fHAkLlxd6Gkv98jYJ21?=
 =?us-ascii?Q?DgQxJDcFvDm0QFAxUDXj8ovna6HUpdu7cJAQbkslxg2iaAynt07UM3AZYaXG?=
 =?us-ascii?Q?TjPPkjXAYAE+IpVztxa41JiJxt+8XrTz3ZpSADkRfXJ06eVIXQyvfSSc3dOw?=
 =?us-ascii?Q?scYEfxf1BmvcgbJ7Du7wM2odunVdc57aSuNkjCMBln/j5I68VLRKqvbYJPfY?=
 =?us-ascii?Q?D14g4HifR9M6Vp9x83JkTT6AbPWIpYi9RHpU6edGkvwzK6VcE5UHJFGmGwEc?=
 =?us-ascii?Q?aFxmcOJXP66WsrpECRfoA8N6nT6atzNhVRuIQ1BQV+KVwE9Xkw8UgGxS4LZO?=
 =?us-ascii?Q?QIXhvHRFhjbUJed81ksx+6L/UpoFuvUfWAVeD/ivJZBWcmzWE6AlPokgXCoB?=
 =?us-ascii?Q?uYGLgGSY60U9GH4KbT8RgDBB/arPcAN6QLbG/VL3HzPND6pbYwXcWNMUzr9t?=
 =?us-ascii?Q?ZcxIIUbWHST3NLaO3Z75zRbYsvIAdBb+GibA3cwHHjGBC0gkKG68hj1bncu5?=
 =?us-ascii?Q?NnwST7yo4wvzdCASNfYDG1OdkE27doQzK01siLfTZuwPxr75eZ+9snsBsoFk?=
 =?us-ascii?Q?kLr4L1VUtY9XColkaS7AnBaRN43oaAs18CCubz8TEl4VO+j9UogLTOlrovLH?=
 =?us-ascii?Q?jdfP61inblcgBQAAChI4hfBQ5T5cVnJ2oX4anqVM9HwXZBymz6tgTwHfvw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7416014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 10:13:23.9616
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f78aacf-0f81-428e-cd4d-08ddaa62ee7b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044FA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9353

On Microblaze platforms there is no need to handle clocks because the
system is starting with clocks enabled (can be described via fixed clock
node or clock-frequency property or not described at all).
With using soft IPs with SOC platforms there is mandatory to handle clocks
as is explained in commit 60dbdc6e08d6 ("dt-bindings: net: emaclite: Add
clock support").
That's why make clock as required in dt binding because it is present in
both configurations and should be described even there is no way how to
handle it on Microblaze systems.

Signed-off-by: Michal Simek <michal.simek@amd.com>
---

Changes in v2:
- Add fpga region patch to fix issue which was introduces by this change

Based on discussion at
https://lore.kernel.org/lkml/20241002-revivable-crummy-f780adec538c@spud/

Actually this shouldn't be only targetting GPIO but also for example
xlnx,xps-timebase-wdt-1.00.a but I would like to check it first on gpio
before starting to check other bindings.

---
 Documentation/devicetree/bindings/gpio/xlnx,gpio-xilinx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpio/xlnx,gpio-xilinx.yaml b/Documentation/devicetree/bindings/gpio/xlnx,gpio-xilinx.yaml
index 8fbf12ca067e..7af4eb2d1858 100644
--- a/Documentation/devicetree/bindings/gpio/xlnx,gpio-xilinx.yaml
+++ b/Documentation/devicetree/bindings/gpio/xlnx,gpio-xilinx.yaml
@@ -117,6 +117,7 @@ properties:
 required:
   - reg
   - compatible
+  - clocks
   - gpio-controller
   - "#gpio-cells"
 
-- 
2.43.0


