Return-Path: <linux-gpio+bounces-21133-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E639AD2EC4
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 09:34:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F77518936DC
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 07:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A915F27F170;
	Tue, 10 Jun 2025 07:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="iFAOY6Sx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2078.outbound.protection.outlook.com [40.107.94.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063AD279346;
	Tue, 10 Jun 2025 07:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749540885; cv=fail; b=iaRNt2sl/948l1tCkrCqoWogOib4Wx+aM/gmhUpRukVk9+NQrcYfQl3mvpzdlMm4Ad3QMaVqJmxenEMKkGbuF7b8JNRocqtY4LszTftRzyAeNHV8e+jsy7y7VrGspzvhQwScFli4NknIZ5ZBH6ZTIF9PhiCZO8q503IJbRiCgcA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749540885; c=relaxed/simple;
	bh=MMcDQ01bLSUATUGDhbUHh+QSfPLgHb5EhVRX3EgyVYA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=R7H2m8TomRAtUy09pslwzqspFYkMlnG+APpoMgMXwExHPYK2p983/SgCsmobNDH6c7x2enmVoNiW/FRi4s1QVZ251OCrsA2blPm8QbGSHu4vfag+aQKozUEH2xlTqm7uEedUvE5R+jOfqLrje7hloGedqDW3br/P3UWInlRdPb4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=iFAOY6Sx; arc=fail smtp.client-ip=40.107.94.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bInQnWDIz1V72hWPYrR5MFm6AsA4ObHdABOtP6lGIZ8PvjKg8diTZff+fCZNQYDxN54UBeV5YsEEQNBGYXs/NateI4agnqiRpiPdF5NSIeGOKY8b7wn243HTtnaxctwou/pdoE1Kzl3Ke7N0T54ROOCHHXzN+khk120qfDOxvRdu91o2x++0+qPvmS80BUFgZMToCmO5Ufu7Kcr7F7Qdne8DmtUgyn0v2+6igaI99T3TbVubCTp8ItrMnjHZ8nxkWSBk0Fkcu1OmBhmpZUCrg/I/cPDx50zKAN3HIXhY9uMw8BDaSFb6/5t6RONqLtqKcYshTMTxRYxjkE4jwjbbUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yAcPWhJOD2uC+8nD7DYGGpOcWzqUQnKUKJG27J3Ym1M=;
 b=xIXQ9jkh4ia39OsWb+RUYY5DFBIFc3SETMD4jeGXTcAGobzU17z8h7khWrnnPNuH41pUqNA+9DNBjfdtuhzphcVxkGFI5ErkLvaWL3OJPLrC16/z3euow9Tk/KqqbePzmbbvGMiWB48vDEewdBmiWKK9ib5ksVDSrLy2FpURNtW9Qw9vn2/RD4sKxf9C6KTJKGh4i5/Hh85vwR+/HmMUIoQBEieyxMYpFmVGR8FFKECEN7ql4Ha7CcJ/fof17N3ErZOUz/ztUTWSMggNE2fvdcT5cx0cuXp+lnpljolC5K1PgvjCY0IdiX9+laEazfY8V0w6FeVhcizhBAu5zkNIQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yAcPWhJOD2uC+8nD7DYGGpOcWzqUQnKUKJG27J3Ym1M=;
 b=iFAOY6SxyieqLQbrW08ehJaX0t2doNWQ35t9lTx8ZuMhz9K4aalSLptGErRZsK38e/fUfWvAUQzX/YubBIVp0sg5crRGgYRQveb6XfJ8qBmOG5ikJVgQ0gqInZeOenz9XmO4JTifjab4E7OEvR0hFXmGf7wGOX7688lk6wWQV7U=
Received: from MW4PR02CA0003.namprd02.prod.outlook.com (2603:10b6:303:16d::30)
 by MW5PR12MB5623.namprd12.prod.outlook.com (2603:10b6:303:199::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 10 Jun
 2025 07:34:40 +0000
Received: from SJ1PEPF000023CB.namprd02.prod.outlook.com
 (2603:10b6:303:16d:cafe::39) by MW4PR02CA0003.outlook.office365.com
 (2603:10b6:303:16d::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Tue,
 10 Jun 2025 07:34:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023CB.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 10 Jun 2025 07:34:40 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 02:34:38 -0500
Received: from localhost (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Tue, 10 Jun 2025 02:34:37 -0500
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
Subject: [PATCH] dt-bindings: gpio: gpio-xilinx: Mark clocks as required property
Date: Tue, 10 Jun 2025 09:34:31 +0200
Message-ID: <dba4f2c39a25b54010c292c36e349cb289d6cd98.1749540869.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1470; i=michal.simek@amd.com; h=from:subject:message-id; bh=MMcDQ01bLSUATUGDhbUHh+QSfPLgHb5EhVRX3EgyVYA=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWS4P+AwnqeqblsZ57Sx0EH026v7X6ZPSZw8xSCGiWMW9 3rxXF6FjlIWBjEOBlkxRZbpTDoOa75dWyq2PDIfZg4rE8gQBi5OAZjI5b8M/zQiYlk7PML35CWd ZnjdIdHiPTv2N/uT+IcOU3PWlVydZMnwT3PrgYWz1imsDvLNSylRuiy6R3/Z+ZtvGVRvLM/6xWI uzQYA
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: michal.simek@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CB:EE_|MW5PR12MB5623:EE_
X-MS-Office365-Filtering-Correlation-Id: ef8ca43e-fbb2-4634-d517-08dda7f1429b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|36860700013|376014|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?37YNhr7wbfCCRWORyYjxQQJWGUlLGMTiPnqw7/jwj1vx1G/yN1hTffu+fdgZ?=
 =?us-ascii?Q?ZOJYACb8lM4dv80TEPdM14SnI1NdTa4LbwUZC2WAqwbdg7v/PVXMfmmylhBI?=
 =?us-ascii?Q?ap5iVUOqe9/19YN5dINxo1RccT1b6D4rbOrMsl3Cgb0XnhlrwvhZGt9y/Uup?=
 =?us-ascii?Q?9yhiqetQN5B+2+FzT1phrQ1hYrRV7FTtjrA+RWuUz4mHwrBOfnXGj0/UVlvE?=
 =?us-ascii?Q?Tj3f6gyNpZcqm0YfT4RNg4FxT3KaKBsYJ1YmcSLoIVLLFJCkvfTxuowSnU0m?=
 =?us-ascii?Q?3ioVnXpPavdJeAinJjdGnZEf7gkaYCg0GD/PLJu5aqF/lbGG9I5NEkbzk/aO?=
 =?us-ascii?Q?JQSz2AL8IvCafZ6RzLpcsqeinEX93z6lwKTO324gPboq9tb5wkYbj+Yt67mY?=
 =?us-ascii?Q?1Ln5g+IAayVqbJXrRSZyJb6/WHYU+mDWU7iSNmg10/Gy7UJTMk7ZFtaeKX/W?=
 =?us-ascii?Q?1DVjAf4fO8UNTnQDrwM2mLOb/StwcAHDB9/J3d+CbHwu7/tWJQsPrE33FEP1?=
 =?us-ascii?Q?E84Na6BB+0kVdKGYUfjbuGkNUhwSxpIOHuhl7DetkZIbqY4ii4QI4ZpYIkcV?=
 =?us-ascii?Q?6DqaS9X8i9FCCeU+HzEQ7jaja/fT1clQo915LCynpsbZlgPxyQy0PLdIo420?=
 =?us-ascii?Q?KYP5YI4OWTtE07dcS+XaEZ7+HSFGb5uGsA4UsWYPtX7fqzcb/ZZT8hLFpa0Q?=
 =?us-ascii?Q?K+K4OVyuSKjy0tWlTItmZ0zJa5Z/BmTkhzZzXFDg4TIEygly5aL3x64pLMXm?=
 =?us-ascii?Q?634FZo0ol4P4u3SAccYFZjOghZzNQj3vLJHmB+aSp107QkhDyc84TzbM5eFZ?=
 =?us-ascii?Q?ENJjrsg/2L64HTC9xXv+rQJuyIscoSUzZr9LtUgHd+oqQEp+FTmDpxyYktBK?=
 =?us-ascii?Q?v1q8tFxfNX6cMHTSTLmjYwwNg3tVPjpLB2Qcg0eLwrFCoH6JGfhPwK9wnbym?=
 =?us-ascii?Q?R8qjioFRb6k1jUSwuI8rFsScqk5dfwYqMAwJnNdcv/BjRiZXhDyD0bn0pq23?=
 =?us-ascii?Q?1wxgIsc6NWElEFWNnraKd6JtWXo9OVk2bH7KosWovOAnbDdt/Peri9Aw2i+8?=
 =?us-ascii?Q?ZgdDKHHWPJ5uJ+2W3rqcy5UvMS3seSq1oNkMsjI4FHA+rChjw+A7rpW5dWZR?=
 =?us-ascii?Q?Ixn50M0FHiqkE4L0OM8hvXVt0iUtby5gX+a9ziZfaBgPU2d4eXNAWi/AOlSX?=
 =?us-ascii?Q?vT68o2Yt0SHomEgZ7cAbEeZueERIpcV9SMBWDp7c5qx3TvBJDgrpS/xBT7Io?=
 =?us-ascii?Q?1J9scigGVJeCRrN0mk8fu3VweI5CAA/IGdkE15CrsvxOq8Q8yYVjaeTM0V/B?=
 =?us-ascii?Q?LaVkjeiBgRxO2+XBpIooCKaWfOcvmnusNZJohkkeyJekp7l5RbS6ZuijP3ku?=
 =?us-ascii?Q?+l4NuKl1TO2RNVPYyPpSTo9NWl5Td9x1teMvRJJfXn+YplsGZCkoUf1T2b5w?=
 =?us-ascii?Q?Vta6AUjN8cZ4/+xDvHhokK2pVzqiqm+Sgtyu2JZGGuM24RLGjXcSIA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(36860700013)(376014)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 07:34:40.1607
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef8ca43e-fbb2-4634-d517-08dda7f1429b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5623

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


