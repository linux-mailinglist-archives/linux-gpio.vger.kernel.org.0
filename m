Return-Path: <linux-gpio+bounces-9884-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AC896F21C
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2024 13:01:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E483F28770E
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2024 11:01:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A50F1CB150;
	Fri,  6 Sep 2024 11:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="GB7Jrt3/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2052.outbound.protection.outlook.com [40.107.236.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2BF14659F;
	Fri,  6 Sep 2024 11:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725620483; cv=fail; b=QjicKcOgu3OaAj2oiBWvsWu5I+Ld1SILygW0mg2oPPOcWRpjeGSAcm5TCdUKYwMgOK8fEuJOQSwbbmawY83SnzHmqUh/pb0L1kq/pboF76ORoxFyCd0ftVKZ9hLTNEauA2kjZQgxW5Nbvc9s9KKyYQ3GbayIFOI8NpNK4+1JDQA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725620483; c=relaxed/simple;
	bh=fptIxTNBQGNsqSEAvSK4wXfFM/iQIyrsjN8WWDO7AcM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iPNUVSuAu8ioayUWtk+EVwVzOIgIPaD/q35Nlied1uOdxvkh3v3qqd0aXVU1ptA8xv2CH2/BiU7/IV7Mttq2zvBAi7lol82maiM9sT+hYSL9m8RZN276Hw83uEiaToL9VvxlcvzmpDIWlDc9DQrCe/Nl9LCdkBtdwddUuuApyxA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=GB7Jrt3/; arc=fail smtp.client-ip=40.107.236.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YOE7sTSQ4Ox/AAWQio0X0AaSTZ2KI0TfT5uAAt9dEPjE1B9ls1XIM6c45tPjMDaD4R7rK1j/ep8wYN6qk39WS+Xap0JUjR4o9r7fknqqwKFNHUn9gebkR7KrLJy89EE2XPEhrzJI4yZF0yUAGNGCXi12xIPwVpRo2UcOKNOQbpPnbB0w4FKqmUAhT/4m2fhKE2uz0TOJqSmrKj+7u6VnPYkaAvmiXMABkS3pXqmQk6gJhMSa2Fnu77YN4gJZVMJBJiStnn55wBEpNSeSZ4gXsCA2hOS/SGoI/Qrdylwk6MTVu8Bl58B9MDMcn4bRE7bWjth4baKXpuyx64FgJbk34A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lANt2n9cyJY/NNGbOqaBe5qMIuOU8pwLzSDdXH+H/Oc=;
 b=h7C1oNuAPQjQiCWp3kMJ/qXJ9r3UwQFBdFaWg9iKnPmRBoBFthpfTE1v5fZCbIKCeYfdjQ5R78Zxqe0H55SyS36CKk/4zvYnYMh1qpUyXIunR2CxbmHLkwq/oas+Idd1s/1UQQ70gveICpv6MRCygYyViUSe8eRCfshhdHdXBHUfrFIOEsevO3kwWRW3149i69ir9IzC+kcnKj+MoZYROBQnSG6n5gSdzIgNvXGfFNaccdAJ1sIHxyqucdO0qXG1V+DfTxwepipSIK5TUufPCbUdqtFwWs8UES8fs5cyBr2aGgh/szo3kLlqUKkvoQLPLySWmE3tEku3T0OU8ZqCuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lANt2n9cyJY/NNGbOqaBe5qMIuOU8pwLzSDdXH+H/Oc=;
 b=GB7Jrt3/ecGkMJeNxaWGA8N1koTSlCH8wK6LDPr7y3Qk+ZtrLN/j75mEgYnVERSG58NybUghXljvzNemZim4cNql4fGgFhS5d3UUeab7V2y/qhlXaWw56kXOocE3LFMIgs8zepWM+YoZGTguce69fEXOE3L99TnU1KAD+GppUqc=
Received: from BN0PR04CA0128.namprd04.prod.outlook.com (2603:10b6:408:ed::13)
 by SN7PR12MB7910.namprd12.prod.outlook.com (2603:10b6:806:34b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Fri, 6 Sep
 2024 11:01:19 +0000
Received: from BN2PEPF00004FBA.namprd04.prod.outlook.com
 (2603:10b6:408:ed:cafe::40) by BN0PR04CA0128.outlook.office365.com
 (2603:10b6:408:ed::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17 via Frontend
 Transport; Fri, 6 Sep 2024 11:01:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBA.mail.protection.outlook.com (10.167.243.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Fri, 6 Sep 2024 11:01:19 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 6 Sep
 2024 06:01:19 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 6 Sep
 2024 06:01:18 -0500
Received: from xhdlakshmis40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 6 Sep 2024 06:01:14 -0500
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
Subject: [PATCH v5 0/3] pinctrl: pinctrl-zynqmp: Add Versal platform support
Date: Fri, 6 Sep 2024 16:31:10 +0530
Message-ID: <20240906110113.3154327-1-sai.krishna.potthuri@amd.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBA:EE_|SN7PR12MB7910:EE_
X-MS-Office365-Filtering-Correlation-Id: f249b168-6166-4952-366a-08dcce633cab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?npJHc2bTOYbX5WxlTL8px9XMCFhhAAMiINIvQJyVbjaILbhNNp2A0LqUlGTR?=
 =?us-ascii?Q?1mH+IOWp2m2fRzgtNfGXLAR2NAP3YJKB1XJ6bCbGH6EWXXLU5VGM1543sP7V?=
 =?us-ascii?Q?mdzrpjcoMljQu6ekzQAayF5YAsEn4z2WmCbs4vsx+/LeuGE9vCoYvkWcTdJI?=
 =?us-ascii?Q?JqyUPgcfU42v+wsmDUymvcJNqKJpBQ5Xfs/xhylOt/5+M3FlAnA3J4UzWftx?=
 =?us-ascii?Q?n20O/Uk3JGLKupG3gJnB3ocRoQvWzeplSVPq9iK02+GOJ+DPtFGJen5KE7KQ?=
 =?us-ascii?Q?W1a9rRGIZ57YcVogkvfpBb9NfVDeZJh9TLwk5StQr87ewmC/e02KXgVpGBFi?=
 =?us-ascii?Q?ewdw6OkiFCDA8BO1ECvHi8NltA/2q5HZiFkVRJztSfgWAwk4sV/WMuZl29Ng?=
 =?us-ascii?Q?1+e83TbaqWYVqpaUxF4acVu+0MEJd6hKo8hbAAt0g/TK07e4wXQbHd1KAx8C?=
 =?us-ascii?Q?Te4A2khfVXqkznvk2rivBB+p8FTRJ3ZbZ+t35PkccRdlBUa3YJ5x/79LTN7E?=
 =?us-ascii?Q?hrx1fMWY7V5oHjtAL05z7RXt3tRfnZRu00RQcU6Lm5TZXF3aXuIyYRTqEGnG?=
 =?us-ascii?Q?HqqTgGiJdw5iHQv7v8Qka9IWhhRENHG2ffRVsGHRUcvtrKwwGEAVZxnQuaBk?=
 =?us-ascii?Q?TYAqN1SlrpctSZBOTkw+6T3Tfa6sSjcvEXaGhbUOVRKHn9Fddk41cEVZQFLl?=
 =?us-ascii?Q?Is+I8wHyXibXlwSdwIFwbcOc92SbKhzkJLqZrSOPGBtLDThMYf85MMvUezQh?=
 =?us-ascii?Q?/9kFSELxefS3UymVjuzH9BHHL2ool8CsrADxAcr/HwEJ/tOJWYZQv7UD29k8?=
 =?us-ascii?Q?qzwjVLIYjxsAcVqjujkcEcECmm1OTZ8nNxUajeyVvNOByIycXhBuzza0eur1?=
 =?us-ascii?Q?PymWq1rR5zrcicK/EUeOL3QpgQO3jSzQPk0WbCta5pakw+jiENB3rhaTiMeV?=
 =?us-ascii?Q?b7CT+BiEbGPFog1j2L153+NbzyZCcBPlswEo5WWrIcS+/bxLtrBLSg84QnG4?=
 =?us-ascii?Q?CB+pZz5PUAu0IajI2ABPf8F42A7q44sAvIrU1oDtIgNvOM31jymQiycBemdL?=
 =?us-ascii?Q?zYEsGRuwW1oU2NwL8Rc47ZmeYRvLmR+t7i6Ka7G0uhZQ9yMUUFS4SuvSlilV?=
 =?us-ascii?Q?rUWIwpuJuKJR+gdA56HtQGZ+Rp5uzn3qA8vB+zViwAQ5i0l0WdZsJoi72Xcl?=
 =?us-ascii?Q?NRV7F1dgjFAXBtF24xUlHuBxo/zwOuP4xLFz+1l8sTCpKFyDAnsVuWOxuQSe?=
 =?us-ascii?Q?FocT5YWSnwVaBPL5/LtqbGUtNNuQijF1XkyyLF2nhXVdz1OlWkTEVA/zUZ80?=
 =?us-ascii?Q?bJbWp55VhcCnOLgnjPyop2W1rax/Onn1nDQj3fzKNibgO5tU4Jn6qrd4p3k3?=
 =?us-ascii?Q?96JFzrBfUQmZAzNaURyHWDAMkpnCIqkO3Q3M1jJm8MnGzPd8IZ532b79QHQL?=
 =?us-ascii?Q?ZhejjIvUP3C67myDHZhIY5tatEgZOTlB?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 11:01:19.4080
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f249b168-6166-4952-366a-08dcce633cab
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7910

Update the binding and pinctrl-zynqmp driver to add Versal platform
support.
Add Get Attribute ID in the Xilinx firmware driver to get the pin
information from Xilinx Platform Management Firmware.

Changes in v5:
-> 1/3 - Used the pins and groups properties references available in $defs
         for properties in "mux" (suggested by Rob).

Changes in v4:
-> 1/3 - Defined minItems for the properties, dropped the blank lines,
         dropped unused labels and unrelated nodes in example node, used
         correct email address (suggested by Krzysztof).

Changes in v3:
-> 1/3 - Mentioned all group names in conf node and also defined the
         conf node properties in $defs (suggested by Rob).

Changes in v2:
-> 1/3 - Created new binding doc for Versal platform (suggested by Rob).
-> 1/3 - Update regex for pins properties to make sure it always starts
         with "LPD" or "PMC" string.
-> 3/3 - Used firmware API to get platform information to differentiate
         platform specific code (suggested by Jay).

Sai Krishna Potthuri (3):
  dt-bindings: pinctrl: Add support for Xilinx Versal platform
  firmware: xilinx: Add Pinctrl Get Attribute ID
  pinctrl: pinctrl-zynqmp: Add support for Versal platform

 .../bindings/pinctrl/xlnx,versal-pinctrl.yaml | 278 ++++++++++++++++++
 drivers/pinctrl/pinctrl-zynqmp.c              |  97 +++++-
 include/linux/firmware/xlnx-zynqmp.h          |   1 +
 3 files changed, 371 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/xlnx,versal-pinctrl.yaml

-- 
2.25.1


