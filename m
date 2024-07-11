Return-Path: <linux-gpio+bounces-8177-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D16E192E4D0
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jul 2024 12:33:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86DC9285201
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jul 2024 10:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E60CF155A59;
	Thu, 11 Jul 2024 10:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ltAteSsU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2074.outbound.protection.outlook.com [40.107.220.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0443AC0C;
	Thu, 11 Jul 2024 10:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720694009; cv=fail; b=sAWeiv/aDymMPytwlSkNx5Q+RN9tL5L53AUFKGnJYwSyOZNgWebJKy7htStGTcqQDgT6iIGld8DQGIEbQnSrC5iETX6n1r8/8kIRWLLmG4wE//9zlX/fqlHpTOg1byXVic88Q0iznzS4Llf/xBdttn2Mhk9/FRK3ZZHn+ec9LyM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720694009; c=relaxed/simple;
	bh=0+kax599RdHc38Zoe1ABV4tJUupIuAvG+XWt0nE/p88=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XqEAM0+IqgTl0o3DoFqQKTxcQSLIVBpvDa76RYv7TcctPii5S7IPySHW5NUI0tKTQx0ivctlZLHE9HRctbCYXlmyrQosZ5MGzB5J0f0XiTQj3QnmrPa+4msZYRL/P4IUZySb1jw1oic93WlhR21fjLkrarXzF/bEmWEDsdzTplA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ltAteSsU; arc=fail smtp.client-ip=40.107.220.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yAGmJB9HEcYKDOzQP0DOHRJHnAoJR0Ehyf54ss3g8cQUsT4oCDMgb4OZPop5DKscOgqv3eBUeydkK4cbaZuDyYjpRoB7WbLF+patfGG/FPJbsqflATH3ZkMTYmRi4lYkz8frqhtVmCSQ844Pjav3T1F5XePgqxBlb9zuuvMrXXkz7IrE5Jz6MY2mIcZLywOHaWejv/tlqU3A2UPO3PLxEsaLkzU6gccdJo/Z5733D6rBjSmNa+eA3aF7ggY8yEas3GyoNV1alPDlPBfnu7CnrBAjCmtcrXUMEnVDkaB8OsXg2gKDMkrd4F+JjZahrfve6xZeifZchlkU7WhRHiuZ5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pB1MzmPckoO78de6eLDWCrIHnfQPotYNNARMFGL30Z4=;
 b=TuPnYwuipt1rJA2jf+YTSZSS4Z/d5/MaEOv7/IMcak75g4Sbdwl55t3PagTdEQSZwBH20eOBUgheIxBrK5t9Yp28Gn9TF7MZsvnPWFjXrslxjR/pVRWRSkHyALYqPfIq7rgfOCNXOm8Y0Q8qKpdq1bBhbXjbyk8kNhLMbt9orFNZZr03K+QXjmSd/ADkJpfgLdqaf76J/2QfGUPeGlKjnjF2VKn7lMkiznuHJKvd41JWdSaUerBlWxsES0WWIGhTw0c/MmTpoatcmXLSRLn0hMZ+76vBk76eREyP1u95YOB1rN43Fr1ntaGo7a87Ls5LoBLXy1sW4SCTVP8HdE1ZtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pB1MzmPckoO78de6eLDWCrIHnfQPotYNNARMFGL30Z4=;
 b=ltAteSsUPKSRURjw+ogw8+MsLkLHc3yj02XhciXPonJCnJNV6jJOJY+kPSwn6s1tqNCyyNWPmIVUAJndsj3lRaTeH/CsqjPX6IDJACxlIDnE1vhwkOlwHsGvyfc9BGOB01ZsxQLmUDOOqN2S6GyFWWggC1lY8u5n1+XnkC/v8hE=
Received: from CH3P220CA0011.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1e8::26)
 by PH0PR12MB7816.namprd12.prod.outlook.com (2603:10b6:510:28c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Thu, 11 Jul
 2024 10:33:24 +0000
Received: from CH2PEPF000000A0.namprd02.prod.outlook.com
 (2603:10b6:610:1e8:cafe::5c) by CH3P220CA0011.outlook.office365.com
 (2603:10b6:610:1e8::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.23 via Frontend
 Transport; Thu, 11 Jul 2024 10:33:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF000000A0.mail.protection.outlook.com (10.167.244.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7762.17 via Frontend Transport; Thu, 11 Jul 2024 10:33:24 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 11 Jul
 2024 05:33:22 -0500
Received: from xhdlakshmis40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 11 Jul 2024 05:33:18 -0500
From: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
To: Linus Walleij <linus.walleij@linaro.org>, Michal Simek
	<michal.simek@amd.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, "Jay
 Buddhabhatti" <jay.buddhabhatti@amd.com>, Dhaval Shah
	<dhaval.r.shah@amd.com>, Praveen Teja Kundanala
	<praveen.teja.kundanala@amd.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<saikrishna12468@gmail.com>, <git@amd.com>, Sai Krishna Potthuri
	<sai.krishna.potthuri@amd.com>
Subject: [PATCH 0/3] pinctrl: pinctrl-zynqmp: Add Versal platform support
Date: Thu, 11 Jul 2024 16:03:14 +0530
Message-ID: <20240711103317.891813-1-sai.krishna.potthuri@amd.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: sai.krishna.potthuri@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF000000A0:EE_|PH0PR12MB7816:EE_
X-MS-Office365-Filtering-Correlation-Id: cbcdbd8f-f2ad-4ffb-aa63-08dca194e4c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|7416014|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?URD6l8eCn+qcNMPFHCjLuLOK955vq5rU1IJNq3dZQqRf+X5pL0hznSUL8KOs?=
 =?us-ascii?Q?Q9P9t3mtxPS8QwUC//2i+24OB6AhCKnyNZiVeAgTbhMe0OsHtgR2bR19HXTq?=
 =?us-ascii?Q?DE5OGhTkejkUJ16MEhA8AVAU/Ph5ioq8+dQx5Xa6rbyLdx+DmhbNHVW0xbA1?=
 =?us-ascii?Q?DNjL7ahhHi616rI62A6hu6cwa10JcJPXNLjjNllHrottKGBi/nG1bSMiDZu7?=
 =?us-ascii?Q?35ToYBf78VtQSlv4Gk+uchJq7fPh7po6wkoZvC4i0jQXoiDmFHO0aeg3/BNF?=
 =?us-ascii?Q?FY18jOIiJZa9R1C8+bX4IzqZOvDrjYfg4RDIXP2DP2EPcJ6aniAXfFTcl+iW?=
 =?us-ascii?Q?BD+gbl5vdMf8sbxT9t7/IZSUvSU71+nQlUER+mk+OXWEQRzztZnHEf9tUl0C?=
 =?us-ascii?Q?td8JICMUVLmshqxCGQGmm7d5WcfSXuo6BWrCqUQhPgusGS4+UOzRKmMIZveH?=
 =?us-ascii?Q?4zY6wcrUicpAc8m9aGizYj9/Z1olkNanTsInltM7AplEVmAMpvGVdbneNkqy?=
 =?us-ascii?Q?94nyjU6vZloYAzNXzmcVHgyWfLtOQ6ZJ5WJRH6asFh+xxEE6mjmJ/iNhC7cr?=
 =?us-ascii?Q?AYRpLW6nwvtqsFtgk7dFS61SfUcp2or8RHA/A0nUEm43OiFTbNCszXODX/9O?=
 =?us-ascii?Q?clzysUDWdKMzAj9I/LasDnErllAKrmcTrhoSijKGXwts2nnKEuSd8K0z+sjH?=
 =?us-ascii?Q?bIPLFcHUa8wvcbr1+1/w+nbEcLUWnhpBttr/nZ3nqcux+6QiAthtiuAJ7PPD?=
 =?us-ascii?Q?m+WnPchdoO7lq8DQN69MLR5OgkxdVsWIFOwPwdC+Q8ywufSoRjgegGrXHMjq?=
 =?us-ascii?Q?2S7Hh4/ou8GRUSn1DKgOh8nuXlv8PnI/PAl+t8xEGNi5GVIdFU9K7vD4bSJQ?=
 =?us-ascii?Q?pC8HYcct8Iv0D+6oQbreWJZp4TM0ezYX/OH1pkyhAE7l4Ca6D7n9BPVxPh5z?=
 =?us-ascii?Q?lw4SOzUBAnl9MFO5V/iuf7glUWSDEXJTBp/B5+8h+BT588kYFYzx/PtwVEpJ?=
 =?us-ascii?Q?hJcFFplSA800PS9awYuUJ9fa9CY6XcPSTb7p7MHU5jMW33ektpdtdCYiktdR?=
 =?us-ascii?Q?KRXJHlssW+z0zFDT/wZkcyT36ccvRdl1krDtA+h1KLp4u53HrBLcUlcBYI8F?=
 =?us-ascii?Q?W47WUclbaZsMXfZKrbjOIMldBNceZ/o4q1UXuXUSvPoX48NB9waX8zg7IhJi?=
 =?us-ascii?Q?Kgb/ud2qGgFHqnuBFLIezUAVvhduE5xHwqypA0F1blnTCSfJhPbf7mGzwG7h?=
 =?us-ascii?Q?u0Mv4cK1SS4z2QEk1AUHWjgwxunoacSuWtC6U1weYrsw7O0ZLrSp8cnf3DvL?=
 =?us-ascii?Q?1PhM945QYW9pPQ7tv7l4Txp+sXhzkNHdL/Tl6wtxhYHp5ey76iYQK+V5bvi3?=
 =?us-ascii?Q?BwozAArjqn8P70DkZHlQssq7ByceRrkj73sjUhMJ5whYXQBxa5CQxixbjTZz?=
 =?us-ascii?Q?QA79BQEUshwB29l52WbPVyA/3YuvfJxH?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(7416014)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 10:33:24.2643
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbcdbd8f-f2ad-4ffb-aa63-08dca194e4c0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF000000A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7816

Update the binding and pinctrl-zynqmp driver to add Versal platform
support.
Add Get Attribute ID in the Xilinx/AMD firmware driver to get the pin
information from Xilinx/AMD Platform Management Firmware.

Sai Krishna Potthuri (3):
  dt-bindings: pinctrl: Add support for Xilinx Versal platform
  firmware: xilinx: Add Pinctrl Get Attribute ID
  pinctrl: pinctrl-zynqmp: Add support for Versal platform

 .../bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml | 509 +++++++++++-------
 drivers/pinctrl/pinctrl-zynqmp.c              |  91 +++-
 include/linux/firmware/xlnx-zynqmp.h          |   1 +
 3 files changed, 416 insertions(+), 185 deletions(-)

-- 
2.25.1


