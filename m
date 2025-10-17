Return-Path: <linux-gpio+bounces-27236-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E42BE7001
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Oct 2025 09:47:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6F5AC504D35
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Oct 2025 07:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3D952566DD;
	Fri, 17 Oct 2025 07:46:54 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023086.outbound.protection.outlook.com [40.107.44.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE43A22DFA4;
	Fri, 17 Oct 2025 07:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760687214; cv=fail; b=glRHPfh3jsLS+AuiKeNeNFBqvwSXL81vms+DyM5YER7dIBDbWciYqjmxCEDgMc6LFQjJKoB8JuPNd+qVJ43mr1lTcutZVltJ1jgmz1wFL5uEbXEHYXZ2VAKyuYmHbHSec3w3cWi9JQwPDiPDPO5FfQGfPH8vKiZAdaknUWRhUQk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760687214; c=relaxed/simple;
	bh=JPG6SSLyC+ESJkrFc7geu05/G7tmErO1dkT1ix/vxSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hId6n3NB74zzpW8epdw+qYMmlfF6tqSo/o6PS+x5Q4VUmzSTvAZzUpFJG4NpdTqwMiCm99vgB7SA+wSM1xTIzHHzWYyhoPlvEZHPvBFjBUD2XwXP2O8hIDQ4gHOjvrk5pWBvtOyvJ0tDPGwuIBPtEdHALdTI52f2LPDX3jWYFv8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MefhjDH69cDTBz+cR9FGToLAEaMj++sdAbVtactKzfO6WIb8Q4NUpq6qCPjcvrzQy/Ceywp9xfCyY3uOQShl1ZyhIaL+e72JlajOmjP0J+BUtK8p/Ln4/coyV6GTeCYgd2VnaxeVwavyBz4Rffi19cLvnItIAlcuAS6BvAJk3JUUzjJFqG7Okxe2kZ8slp3ExNy+O7bDe3H6sUzH16sG7uO+jNOTJxTzuOOXuIGTAyxx9JZEbVGPOGFanN047C1v60T5Wwzmmxv9p1DwIOAzkUMKgLYs9trZ25zHW8lLXCzyUo9oYZ+hnLny/hNA7Ex3Xw/D0Hiz2yMXVe6aAA0mUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3tvxCvy53Nd2u9uv4h1/Z8p3w7ai/Crv2fKXgAl5unM=;
 b=MMpFr3k+eIMxoh3T+w4TaTjCpmaPdLv1SL6aLq2UByd/D+mLY5t+kgXGkeRxdc7XHwuPur2+mjURJXF10rQbwsgP5h/YvWCJDHut4vdW1UHnS170SZhkoYcP07aCUwExWk1jbWpWfUSght8es7bxcySR2Q1UcajKvADuji7iRpAO30xDBPeaTfDP5gZrKTC0QX577z7MB2PRwuEE27PQCgEP3Fjh7xAREag57pxUZGxtHN9tcS1hLzwH/vvsZW+4ly+X/k+EWLyiRZ8dAN9sUEkazQd0iamLVTBjyxg1CBQZNE82C9UBxKOCCix/yunCU0JbfzPTVEmwhhv3pj01PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PSBPR02CA0003.apcprd02.prod.outlook.com (2603:1096:301::13) by
 TYSPR06MB6315.apcprd06.prod.outlook.com (2603:1096:400:40f::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.12; Fri, 17 Oct 2025 07:46:49 +0000
Received: from TY2PEPF0000AB8A.apcprd03.prod.outlook.com
 (2603:1096:301:0:cafe::a) by PSBPR02CA0003.outlook.office365.com
 (2603:1096:301::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.13 via Frontend Transport; Fri,
 17 Oct 2025 07:46:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB8A.mail.protection.outlook.com (10.167.253.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Fri, 17 Oct 2025 07:46:47 +0000
Received: from localhost.localdomain (unknown [172.16.64.196])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 838E341C0152;
	Fri, 17 Oct 2025 15:46:46 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com,
	Gary Yang <gary.yang@cixtech.com>
Subject: [PATCH v4 0/3] Add pinctrl support for Sky1
Date: Fri, 17 Oct 2025 15:46:43 +0800
Message-ID: <20251017074646.3344924-1-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB8A:EE_|TYSPR06MB6315:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1e88dfc2-370d-462f-b202-08de0d5153ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?j+1UliJsvAyf76joDycBlTR0+ZNISm8udGi1yu/BaSzaoxSUeKzQtNFrI/9L?=
 =?us-ascii?Q?9bCAcjJOw+s+KvLP8xgwSFy5fP5HFM9+4oW+ZZg98UIOi3eoCp2Z/lyckydR?=
 =?us-ascii?Q?A3yC1x7i74gFIv2Oc5Q3JVSkb1g9dTcVwMT+KnoBzh/rS/59MPVA6rxWpBgO?=
 =?us-ascii?Q?jY7yXZ7pQejfOd3+Iq03l/2NaOQe0kTDGxixqOVsW71CR+pkpD9ZQK2Uor6s?=
 =?us-ascii?Q?u0hmg0IKoZiSAbgTCDN1VBoMlTW3YBKG4uk/Igynnhsa6edJrYV4P1OYBvTd?=
 =?us-ascii?Q?yvpZANj0t709jtNORdT8SFFJ1yBCNW10ISV+UuzUlQijeF+TvXLyaw19G4Cq?=
 =?us-ascii?Q?wd5Bp+F2OxlHAJYS7Yi2U6jbK8Qxuf2VhsBIgBhDDS3k6SQvCGJ0iuUYEQQ8?=
 =?us-ascii?Q?+osNLdqBvOSUb6lbrDEjrX08d2T3hW2JDwSXIp5SMMg8Znv9XhNQibhFZvJZ?=
 =?us-ascii?Q?fda/RHqnk2h95GD+iLERv8uwQMMCoBCLT22aymisPezQYmLmTr7KHo8306HB?=
 =?us-ascii?Q?6jIwpLRzdeHeJ7mA0/V2CLrWUxlFeqi0A0rrNl9vzzLI9fvLu06d2/6Xyc5x?=
 =?us-ascii?Q?eNzKno194CBiyfE07WQFKWQz3DQRi4IZBrkjoJPxS2zNHo/5V3BuW6SwkDSJ?=
 =?us-ascii?Q?0OucFTiZWEEi+ZUq9o+cVq3Aep0DL4Hxi/Vj0DH8SoM3ICmG28hEsiG4bmxk?=
 =?us-ascii?Q?H9Eeq5HeISB4zwJbgl/ltvrlpIhXpcfidyhl56PfwfBvF5oifCbjp9Vz2Of9?=
 =?us-ascii?Q?WE2bJIIzsVCTvKg0Ok5lsrryK7KM0O1QbzKw1VevEahu7rZeRGrAJJ1EKz2n?=
 =?us-ascii?Q?DmeMZXk7+cbl0nVLZQBan+ODYDxxc2jl2gKD+YaP0X+S/ZBCS0Yz/5s3Chq/?=
 =?us-ascii?Q?2jdIdwljuSigrpU7ekOeVc+QSSOPnFUdyInIP3E7DDRju3Rc0vu1a1MAB5i+?=
 =?us-ascii?Q?JDPkcBsBcc63iu6GfacDTeM/VoD619CsB6FCMquB7PJIWoYm+uBOJDdkGXVf?=
 =?us-ascii?Q?n0klrqNscGSKpScrwpLJQkIv16uxN2uKJJG7cQv9u6g0KCgV+hBk8dAup5qq?=
 =?us-ascii?Q?fPpoOLcgCojVtpCb4MnYj2WxZqfuuE+nR6KJNyl7X9FDBkswOkc/wjHHK+QP?=
 =?us-ascii?Q?0qvNsl2r5f3xfU8EuFVoexiD7cFXCNI9dS9TY7Ul/rqq8eF+jgLxw1NAMF1m?=
 =?us-ascii?Q?1RLKmBy/gq3wqjqgcmMZ6uamD5F89pkhIobj0avXupJRnoDUIGttA+RBKqv0?=
 =?us-ascii?Q?TmSCiTZo7udWCX4qdAFUcSodi+TFpDlYKTKxWOt/vQrscOAuEHhLxeblOCEL?=
 =?us-ascii?Q?7XmbbxgqgtfclpSmhuSLlGOb+eF+wL7H9dENINCjrNgjoPBjLMe4jgrc1XL7?=
 =?us-ascii?Q?9FiRXvCdCyonZRIYlH9H6/qLIj29fRvQrdptLqhteDyvnvfVmn6NrXFfKKIf?=
 =?us-ascii?Q?Jo5UhFTbg74k5nhELuFkygx6LuBLLNTwjUNCkYjWTPtym+ogPL1dwK90UAuL?=
 =?us-ascii?Q?GGTNujECEyfdo8FO9GyG483dkVuGL++84iggDDFjqeT35WUk4ewdEsmPHbJQ?=
 =?us-ascii?Q?Hxo63wC8Mn0jp0M0gWs=3D?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 07:46:47.8035
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e88dfc2-370d-462f-b202-08de0d5153ae
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB8A.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6315

Patch 1: Add dt-binding doc for pinctrl on Sky1
Patch 2: Add pin-controller driver for sky1
Patch 3: Add pinctrl nodes for sky1

changes for v4:
- Pass dts build check with below commands:
make O=$OUTKNL dt_binding_check
make O=$OUTKNL dt_binding_check DT_SCHEMA_FILES=cix,sky1-pinctrl.yaml
scripts/checkpatch.pl 000*.patch
make O=$OUTKNL CHECK_DTBS=y W=1 cix/sky1-orion-o6.dtb
- support driver_strength = <8> (mA)
- Fix dt-bindings style


Changes for v3:
- Pass dts build check with below commands:
make O=$OUTKNL dt_binding_check
make O=$OUTKNL dt_binding_check DT_SCHEMA_FILES=cix,sky1-pinctrl.yaml
scripts/checkpatch.pl 000*.patch
make O=$OUTKNL CHECK_DTBS=y W=1 cix/sky1-orion-o6.dtb
- Re-order the patch set, and move dt-bindings to the 1st patch.
- Refine the pinctrl driver with SKY_PINFUNCTION macro
- Fix warnings when make dt_binding_check

Changes for v2:
- restructure the pinctrl driver to support pinmux=<..>
- redefine pinmux macros
- move header file from dt-bindings to dts
- fix the code-style issues

Gary Yang (3):
  dt-bindings: pinctrl: Add cix,sky1-pinctrl
  pinctrl: cix: Add pin-controller support for sky1
  arm64: dts: cix: Add pinctrl nodes for sky1

 .../bindings/pinctrl/cix,sky1-pinctrl.yaml    |  94 +++
 arch/arm64/boot/dts/cix/sky1-orion-o6.dts     |  32 +
 arch/arm64/boot/dts/cix/sky1-pinfunc.h        | 418 +++++++++++++
 arch/arm64/boot/dts/cix/sky1.dtsi             |  10 +
 drivers/pinctrl/Kconfig                       |   1 +
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/cix/Kconfig                   |  14 +
 drivers/pinctrl/cix/Makefile                  |   4 +
 drivers/pinctrl/cix/pinctrl-sky1-base.c       | 573 ++++++++++++++++++
 drivers/pinctrl/cix/pinctrl-sky1.c            | 559 +++++++++++++++++
 drivers/pinctrl/cix/pinctrl-sky1.h            |  48 ++
 11 files changed, 1754 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml
 create mode 100644 arch/arm64/boot/dts/cix/sky1-pinfunc.h
 create mode 100644 drivers/pinctrl/cix/Kconfig
 create mode 100644 drivers/pinctrl/cix/Makefile
 create mode 100644 drivers/pinctrl/cix/pinctrl-sky1-base.c
 create mode 100644 drivers/pinctrl/cix/pinctrl-sky1.c
 create mode 100644 drivers/pinctrl/cix/pinctrl-sky1.h

-- 
2.49.0


