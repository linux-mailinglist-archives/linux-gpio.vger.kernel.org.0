Return-Path: <linux-gpio+bounces-27056-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7980FBD706A
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 03:57:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DF2C54F52C7
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 01:57:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 221D3275AE4;
	Tue, 14 Oct 2025 01:57:22 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023088.outbound.protection.outlook.com [40.107.44.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EC126AA94;
	Tue, 14 Oct 2025 01:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760407041; cv=fail; b=cSfBwncbINK8TKA34FBXRwL2l1EJ+Kv1Wu1mDXhQ4ueqWC8+GZijmg7eHNYzKMPPY3HhH0C1QzBMp3YXeBZOwwVvSzJTSd2+tyHLLdudXNzYtqaQO2Tt2fDDCfeOXedCcslU/HkXaYXsIvk1vjDjeFSsnmAI7jRO/MlUTt6RR7Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760407041; c=relaxed/simple;
	bh=MD32g4PTEgpGO1tfwKxUw+F3R9Z3oSd1VfX67jNwx24=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ljh/qc8ygGe8F0ouexor7mG74OHCOpYN9t6gqFXVQH+y0TjZk7HIxh2MPJa7e/mOh6HnjHuqecc+Yd2TB4mZzoLHApo25NaSb+G2PpOKNPtmDpM4BRaT4AwI36mV7I4E51PINQiqSLlNPoZizsWORH2HlTorW8/Go7suFgUw7D0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P2OybgoVYUGPtXL6UGSbgdM+21/Ao10nbQOqdz64CEm4SqhIM4YtYviE4fI+1AKtdFDbf32PvxaWE1ekFe4PcReCvGQ7EeXL4I1G1KLccewLrDO6lBvDf5lUAvF4MSpm1U+7WbfqJUbY22TQ/jjOd6kXz+JIoVr8w35YljGShW/IcduYCZU3u8XJOQInNjljvvwxIZereQjIRzb5yhNkJckhRfSQn1FQkvk3C06Sj+4E6eoYF3pNiSsVDj1kyKVCmhklSoAFziy3/+5wv7mScGNw1cXxaEuX6UJteZKP0eH+3XncpTBjQUUmGcfqSD7Wpkkt+2P+BKUdOUTS5qzaQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bocl/cl/PAclFg1NfVQoER/2tIMqCbVC3m7dPbUq0Mg=;
 b=dUSWqAJeSygStzEImA7Cyba7XQdPKyIlZRvhTzu6SEduhYc8WjVcOswM4gsLbyc1Z1bjt4nEcmHTmHd0lcWIvoqGMW8Q3898sT30CFs4rbw540ntVt2i1rLZdkLwM2fNOyc4RVQgjbZ0NSMLxlMMruCOoEduoy1jKoCmJSBi8JJCbHJ26+ieUAA6xcCLzGxdYZwypE/FheBlmRY5dZISUDjvgrxrXE+x6dtXzYXkrBXSzDxAuyOZJBMUGpwITRZF0OrRt5m7lv7ixkQmVnGkdZ1e7M+6qV9PX1X2NZ33w1EtOaFlRZADE++VLW/yNJwk0/1wZXoRI1x9UKxWX5nRLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI1PR02CA0043.apcprd02.prod.outlook.com (2603:1096:4:1f6::19)
 by KL1PR06MB6555.apcprd06.prod.outlook.com (2603:1096:820:f1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 01:57:13 +0000
Received: from SG1PEPF000082E7.apcprd02.prod.outlook.com
 (2603:1096:4:1f6:cafe::a4) by SI1PR02CA0043.outlook.office365.com
 (2603:1096:4:1f6::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.13 via Frontend Transport; Tue,
 14 Oct 2025 01:57:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E7.mail.protection.outlook.com (10.167.240.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Tue, 14 Oct 2025 01:57:12 +0000
Received: from localhost.localdomain (unknown [172.16.64.196])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 4B71741C0152;
	Tue, 14 Oct 2025 09:57:12 +0800 (CST)
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
Subject: [PATCH v3 0/3] Add pinctrl support for Sky1
Date: Tue, 14 Oct 2025 09:57:09 +0800
Message-ID: <20251014015712.2922237-1-gary.yang@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E7:EE_|KL1PR06MB6555:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: de4af0b6-e5b9-49d5-de21-08de0ac4fe60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?T4w45ZFhHtUT1kMU7zyDSS/boORFeiu2kEOiB1jdiAdn81XBfjvOtFVkHGVt?=
 =?us-ascii?Q?oLlEf5Y/IOC7HNU5yv7H2AM4KqeLPAw8kwyFMOMBvFOby3P1HrSGWqbfjCXZ?=
 =?us-ascii?Q?DH+FwXXbuL2Dyy0Le3+aQO1oEPYLkQEXj1NhwPuw1zo9wgglHgptavyde+K8?=
 =?us-ascii?Q?bAglu+fwCefSI2j7AMH6kju57mxW1X6A1W3VrTadwhMYaOD5UUok0g+vZsSG?=
 =?us-ascii?Q?1/SEzwGSXDz833uJwBUaVI5AwgRQaFto93K4MVE+lcR7J8bPlNuAa3fvc2L2?=
 =?us-ascii?Q?gsuHms2DFh+34v8NpW+2J13qn1AUkGXsJEPnNEKqAem3dCe2/bk/YnenbM6E?=
 =?us-ascii?Q?KJgV297uyhM6+D5XbKaEGUWwIsFfChoERrSy8q53Por5HrlnYkv6jQbif6H8?=
 =?us-ascii?Q?GLMrTsygy6RcTLRkeq/1wkBSwP0kB3KWo4wyaLJDmmSt9IoAcZJQ7cqPe4+1?=
 =?us-ascii?Q?uW6dgiIDNfaFlEgJ5d+8+ME0vzU89y7nlaK4VRzFaeDlPE/OMV4Q59T5dcpM?=
 =?us-ascii?Q?QUdWDaR2+quaqwc2TKvMOEGqtsJOkVULLgaVTogUjYBgh6+nrLQQ4DLhyKql?=
 =?us-ascii?Q?U/sb0cSXgPqUYM9XcuOvPK1TVXEQQV02X0/FS/pqO5dGAzH04K2axgwR7gyD?=
 =?us-ascii?Q?sKQ++ZgRtk3eeI0rCENpUzbKr58yf+CNhaHS+3bF2/sHqcxFnnE/lWGTLWzU?=
 =?us-ascii?Q?WFfvYdCW9GJVjZD0QIdp5VNMrVispRk6NCP7KmBpI/ohratJGDCvQ5gHtcam?=
 =?us-ascii?Q?kz93sm/RPHft0AGv+P62Mq/Yp90ENEjTVGpV9sDdIW5oSrzEEeCJQ6c7yLee?=
 =?us-ascii?Q?JAsmsGFq5Ll8TA0ciCF0deq/kwwddxR/5geiF2WYlrPbjFRtEwajSDYaTO4V?=
 =?us-ascii?Q?xwBftC2KWYeKP+Tknwno4h0PtzDWfGwcYWmnXwm6qPqjwJ5LfGOQunwoXAnV?=
 =?us-ascii?Q?7m/ZD/p8K7+aDSVa7ae59xaXHhqotLMhz9nDZ+6hY3XJvjPtMuQZjd2zYoT0?=
 =?us-ascii?Q?Bh776d4TOZCQjqrChrF5mhCXqr1rlU4elLQi6JaophvxRao8ULIexDi0l0Xv?=
 =?us-ascii?Q?B0J8mAR8KJaAecbKGztOaMRYOyTeYEvOpTcZ4l/OexIwZ88dqpCYkM5WbA2X?=
 =?us-ascii?Q?7CpP10D1p8MCRW3AzX0eYZ8UhC62RxMpY/HMS+Ssm7E7EeGbueqS1w+K/NV6?=
 =?us-ascii?Q?+tED0Xn80WeiVXGmINCnHNejyG1i4LFi6Y37rVe2AllGmf3/Y4RGC+35gr7e?=
 =?us-ascii?Q?iuCAOzNDTcZdaztinjfRSgrIEwMvZnUTo4NDIWR5V9SnaBtA1E8VtMRWrKiO?=
 =?us-ascii?Q?zBhihY8xpp/s4ziUbRGbQK3HNJZAsBpOv7SAeiRx1KMrG3JsxoEA0eWHsOKm?=
 =?us-ascii?Q?ijP5heUet28bOJl9318xz5I4/DdZRgaYdpB2EpWMY9c0372cLGpE0CTM9hxT?=
 =?us-ascii?Q?T3VHiz0dhjfjFaW6RcU5FNGBXU4lrnTrssnjT+DpFJM2jX4TrbjOQ7k4Bksz?=
 =?us-ascii?Q?RFzUMjJ6BJLf0C1FAl/5+fRoN9gYiU+Our1dfZ8re/rYEffstbNBA3FLr57a?=
 =?us-ascii?Q?tx0bgmK8+qNzOZPvCtA=3D?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 01:57:12.9028
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de4af0b6-e5b9-49d5-de21-08de0ac4fe60
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6555

Patch 1: Add dt-binding doc for pinctrl on Sky1
Patch 2: Add pin-controller driver for sky1
Patch 3: Add pinctrl nodes for sky1

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

 .../bindings/pinctrl/cix,sky1-pinctrl.yaml    |  84 +++
 arch/arm64/boot/dts/cix/sky1-orion-o6.dts     |  32 +
 arch/arm64/boot/dts/cix/sky1-pinfunc.h        | 417 +++++++++++++
 arch/arm64/boot/dts/cix/sky1.dtsi             |  10 +
 drivers/pinctrl/Kconfig                       |   1 +
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/cix/Kconfig                   |  14 +
 drivers/pinctrl/cix/Makefile                  |   4 +
 drivers/pinctrl/cix/pinctrl-sky1-base.c       | 558 +++++++++++++++++
 drivers/pinctrl/cix/pinctrl-sky1.c            | 559 ++++++++++++++++++
 drivers/pinctrl/cix/pinctrl-sky1.h            |  48 ++
 11 files changed, 1728 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml
 create mode 100644 arch/arm64/boot/dts/cix/sky1-pinfunc.h
 create mode 100644 drivers/pinctrl/cix/Kconfig
 create mode 100644 drivers/pinctrl/cix/Makefile
 create mode 100644 drivers/pinctrl/cix/pinctrl-sky1-base.c
 create mode 100644 drivers/pinctrl/cix/pinctrl-sky1.c
 create mode 100644 drivers/pinctrl/cix/pinctrl-sky1.h

-- 
2.49.0


