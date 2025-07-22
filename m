Return-Path: <linux-gpio+bounces-23647-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F0ABFB0E4AE
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Jul 2025 22:16:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F08C567EA4
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Jul 2025 20:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A5F628540F;
	Tue, 22 Jul 2025 20:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="v4M9dlgn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2103.outbound.protection.outlook.com [40.107.236.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7A42690D1;
	Tue, 22 Jul 2025 20:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753215375; cv=fail; b=a3Ct3i6ODyRpBb3YL88szjdrRnfc0Ho/h0PsjiEhJagqdXLpvNPSXskwj61Fqz2Jmd7GGg8utBWuxPAb4zz0FpYYRXPnKZQ6o0FbKeUpLrdYxVKYKP+tu/g4acOaVsZjZC7qnEZ+1v8cUWaCvFbPdtG4oExYaGSga2cfY+FXzFY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753215375; c=relaxed/simple;
	bh=+LkKLNtqktZs6BJGxQlls9eAbfyJLYkPhSllbV6tgWc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JozzRHRzvd3c9OWq6t0ZATPKMLjTMR6PvOrEoy3sEo7t+HRdKL4jgMxgAINNIwQuSrLMHifulcwADcxCcxdhrVOusMS1d0leBg4qEavWBT4Ecyp5BlQlxeWLvvptDxgJ2nvDaiZy667xqo04x3iXnmuWutr8EK2VNLkL8sE3IVA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=v4M9dlgn; arc=fail smtp.client-ip=40.107.236.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RpybPujYvpiM+2N9FQVMa+DQbQcxXpyaKKZUqfAGFVEWVrkNOfe4r+N5B0RCIysHDMxNgdx0ZB3xKq2XMJnD29kYpZNhO/PApUED945qkDS6t1DOGT00YZ5gXfFCQ2veKjfunhcGp4EiyRa2sDL3wvCvxdL/nUzan8qoZrCXiactThaEbYAJOYV7SHQfF8DaOGhpfYGUIezExAj/2YWzm09oXY0xcUKu/YvQKrtYx1DWgfwaarEY/EYEIbC/s7ICrwQTq/a4CwNk2kg+iJd5lmL1UHQMHNdUfSrBSCUuk3gfbO2N9zAl+RodTX4RGRkM3nZDnwiC3nW+wrf21E2lAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=thl99V5yXVMyPjXj7U7dTdtpXeFku2vCWOdg+nvR78Q=;
 b=clgyg9KTRxBEgb7jdjr2177qfm2E2ZHK4H/oUjgukTJb19al1KTapZurEjVknqc9gdORp1VmnQQ3xQU4+2xSgeJkYrWdsEm6nfkE8KsyUs2Szu7yoqMKxT7/TAN3145to0D0ndMvAcam3QxlfbFJRaTU8lVxMcTNzp7IB09lFOl/64MC7e6OSNwN3yLhG+8itJLUrky7jCcP/kb01iwgy42sDu0ADGNZ71oclQ9I2xxZBEqFAPwSVAgA1qnLJx13Gg07eTlbEnituPBwL6/MkYoG25rSP8iFls27+JPsosug9PVyf7c44X/yXe98k3d9y7r33gO8O8r6hIeu34/jOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=arndb.de smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=thl99V5yXVMyPjXj7U7dTdtpXeFku2vCWOdg+nvR78Q=;
 b=v4M9dlgnl/ofyV6KHgl1UDixgm9mH4y4A2BJ91CJzXrz9HBQt3EHoG1XZFony8viZORxKyBxwkMvTlzbNGTZfkPfBnlOyZqXkGIBycz9ufUvoJCVe8AHVf9SoLKM6Dz5uyczGtDuHfrfSTXemMp2CiscJBWbLDNRe2778SrsxxrTcNR1zNt5doX/JBEVLTFZPMNxjhnaj/2HWdM4DRsnvc7MqORH07RRPkFKR+sRMdd5S8am8oQE+6VxVbyqshZSEuPNYUsLSgSFQjCDZIUy8oXst0e5QUw7xbcCtV+sv+Nt3Izyaux2911hvo3wFFisW3Pvq2aQ53TVwouKv+M3JA==
Received: from CH0PR03CA0015.namprd03.prod.outlook.com (2603:10b6:610:b0::20)
 by IA2PR18MB5849.namprd18.prod.outlook.com (2603:10b6:208:4b0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 20:16:09 +0000
Received: from CY4PEPF0000EDD7.namprd03.prod.outlook.com
 (2603:10b6:610:b0:cafe::4b) by CH0PR03CA0015.outlook.office365.com
 (2603:10b6:610:b0::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Tue,
 22 Jul 2025 20:16:09 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.1.1];
Received: from [127.0.1.1] (50.233.182.194) by
 CY4PEPF0000EDD7.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Tue, 22 Jul 2025 20:16:08 +0000
From: Harshit Shah <hshah@axiado.com>
Date: Tue, 22 Jul 2025 13:15:31 -0700
Subject: [PATCH v6 03/10] dt-bindings: gpio: cdns: convert to YAML
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250722-axiado-ax3000-soc-and-evaluation-board-support-v6-3-543979a60ccf@axiado.com>
References: <20250722-axiado-ax3000-soc-and-evaluation-board-support-v6-0-543979a60ccf@axiado.com>
In-Reply-To: <20250722-axiado-ax3000-soc-and-evaluation-board-support-v6-0-543979a60ccf@axiado.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 =?utf-8?q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>, Boris Brezillon <bbrezillon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 soc@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 Jan Kotas <jank@cadence.com>, linux-serial@vger.kernel.org, 
 linux-i3c@lists.infradead.org, Harshit Shah <hshah@axiado.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4292; i=hshah@axiado.com;
 h=from:subject:message-id; bh=+LkKLNtqktZs6BJGxQlls9eAbfyJLYkPhSllbV6tgWc=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBof/GDAzDf9aDzxOoZl6+F2xMxIc64jOzDTBLhP
 +6oLLgrYRuJAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaH/xgwAKCRDxWHMRoTLV
 +5s0C/0YLnnc/EgwpXY3xBYKQAkpoUffmmjb2dYv05SgeH+/YE5TTSWA3TciByWF5Ld8sryN6Iq
 QFCV/ZGEcl/A/Lu56/tUndEQO/WMlJye7F1/A8LO3kvFPmnbpzDwXRR9pKy1VzB6kJib045h59X
 fMj6rPY7KQhKrXVYjJ6ewGPzMQC5xy8PANZjAyjj2NhuT24lME0GN+8+Hywy8T01+zQun32t/Xa
 mSp2WNz0IfzGRWWYgu5h47X63dnyDX/8mxIbkmr9DrgLN3mEvgfFVgxu0rg8AuL8ucqQ70RI//v
 YnVVnABBTJHKH9wEX9E8dN/kEPjJqfWpnC6kw91xuCQaQiMt3EAHVarEjuHLqFm4//2kn+VE9Ur
 vcoRraCyH/cI7UbDgovf5o1NdCslPLV8WFNmanpnrY4omT0jrRSk7DDUyqCupawUSO7jOrtGeZJ
 QauXIQfSHnlDMlSkn+702mR0HED7QCiJV6KqUA60nky8l0TFIVLjP7u7gtNdLSgQYGOdw=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD7:EE_|IA2PR18MB5849:EE_
X-MS-Office365-Filtering-Correlation-Id: f7174f6e-9670-49f5-7991-08ddc95c98c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|7416014|82310400026|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aVVWRDZFTEZycnlSalFLZUw0TzQ1ZjFLdS9ybFNtRzBqQytIK2FwWDY0cVNz?=
 =?utf-8?B?UEhBK0NHaURMaDlvVFd1WElPWU11K01OSXBVZGRKZFZZQmxxZEdZNEFXbElQ?=
 =?utf-8?B?cTR3Z0Y4THAzMERMZVlSVGRhQ2hSUkZ2RWw1ZU0yYTZObGNsVkt2NmQ5ZTN6?=
 =?utf-8?B?cEtoNTJBcnlRaFkrRmJrRUwrclZzVkkwdVhBTzl6bjc2Z2ZCSSthSlMyZGVP?=
 =?utf-8?B?cnozcUVyaklKK0t6WXdxRlZ6RXJjVmpvY2N0R2pnUGg2TjZNMmNWbjJnSURS?=
 =?utf-8?B?QU4rU0JuMTExYW9QZ3VnUjVHNVNiK0kyaWU1SUZQQUpFaW5HQjh6NXJtTnlO?=
 =?utf-8?B?OGMzLzdtMnQrT3pubTFZclR4QW0xOXE2VnVaV1IzTHAwaFhjc0R6QWIzOGJI?=
 =?utf-8?B?NWVjR1daUElTcEVYUW00cnJORFlSNlJweG1JK2R4R2NwaC9wSUtDa0Q1RW4r?=
 =?utf-8?B?TXd6Vm1TM2FRTDJ1OWEwb3dSRThYSkYvb3EvdW5nRUZSNXEyb0pURlRqRWVS?=
 =?utf-8?B?aFlqc21vMFRmSHFKM0JYTDZHMkQ2QTVLNTZkTFREekNxek9TeUhEVTVKbkIw?=
 =?utf-8?B?V2RjamlmU1dJUklpdHZscHRWSTRBQkdTb1Z4YlJIQUk4dVFOUFdRVldTZEJj?=
 =?utf-8?B?RDB6WlFMQVJtelg4ejJNSHZPRWx3U1dlMDl6c3dmWTVrVGNyemQya3N6Ym1r?=
 =?utf-8?B?VGt5Q2hYcTkxcTF6RGhsSEVTdHB0dG1aTURJS0tLRXFKRkthZ2ROcHBXZDdr?=
 =?utf-8?B?WjJDZWdrVzhON0k5UkR2dk1COHMzV3pldzQ5Ly9XcWZsVk9oemdwOXpVL0tO?=
 =?utf-8?B?VVZWZ1lSL1J5elVZUFJKMWdJbCsxemlIclVYRUQvbFhCMlBjWHFOMng4K3Ns?=
 =?utf-8?B?MHJrVUJTQkJhekpZVVZLVmJJT0dGM1hTbHNxSlRGVmZtbGhQd21FcUZEK09x?=
 =?utf-8?B?anpFM0pjNXdvcnlQRnJuQXBKYlpYMkR1SFhVbk96VWdqWVl3Nzd3emdzakE2?=
 =?utf-8?B?RE15d3NNMzhuNldyaGdGaGJpSEEwQnA5SUVWdFhCTEFwQU9aYm1DdlNNcFJC?=
 =?utf-8?B?djZXU1EyQTcwZ1psbHVtV1lRU2xiOHdpTTNzVitVN3ZDUnZ4Ujc0eHNtUkls?=
 =?utf-8?B?WGl4V3VncEJRaGEzQjJwUlZIQjZoQ3duOC9kQkxuM3JDc1RYcEJRUjNPYlpi?=
 =?utf-8?B?eEhDRTFRN2wrb2ZweU5yalVyK1R4ZkNOZS9CenVPQnk0RlB5bkdBWitlU1pE?=
 =?utf-8?B?R2FuRjF1cWZLYkpOMVBsQU5SSlNJckc1dHQ1d2lramhEMUJHRDFpZ2dhMXRV?=
 =?utf-8?B?b2dGdWl2WmdlYWEzOE13aXpERm1ubm00RkhYOVQyL0JZUG4wTVYreEJtZTJ2?=
 =?utf-8?B?bW84aGhBQU00QlFydXhEaVN5RFFUekdaRG5LK0dpNU96VG96dFR6Y2ZtelZ0?=
 =?utf-8?B?REIyK1FNMUZ1cU1DY2ZyUy9SU29CTVJYRnJPMlkwbnZCNjEwd29QTG5yaUZN?=
 =?utf-8?B?K2pjTjF6bnlOZkxXNzlKU3BUdVFIYmFCTERvaC82TXNNUlhSYUJKTTZObU9O?=
 =?utf-8?B?c3UwMVUwcDV0Y1IzeHJUTlZhZS9ML3NVbHZvNjFqRElVU1ljZ1RJYTRhWERB?=
 =?utf-8?B?ZWI2ZU5ERmROREdPeVQzZ0t4Q216WGxDWllFaGUwOWJnVytxa0FtODVVRC8z?=
 =?utf-8?B?MUJ4UzhHTlhBd2xaWjluNEhRcGlLUXdaWHYvbVF4R0NnY2VCTFZ5UTNkc2JL?=
 =?utf-8?B?cUUyZEdxYXZ0KzE5ZFNRM0lmS2x4bEZCeTkzS1ZMNTdhclVNSDZNUDFUbGln?=
 =?utf-8?B?WGloa00zSGZiV1lBRncwSVVsWHkxZE1TNWdoaE9pYzhTaHFPaHdPaXdqWEtM?=
 =?utf-8?B?N2IwTHBucFordmN3STJzMEJDSVFNYTN4dGJrNEptbXhaM2U0eHIxTFRBbDJo?=
 =?utf-8?B?MWVRbDMvbjA5SkZVZHdPYmRadW1uOHVKOWN1ajVjUEYrVzJwZlphb2xZOGc1?=
 =?utf-8?Q?mdnKJxzhQ62eOm+bzzzpXRiQWXLZcU=3D?=
X-Forefront-Antispam-Report:
	CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.1.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(7416014)(82310400026)(1800799024)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 20:16:08.6529
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7174f6e-9670-49f5-7991-08ddc95c98c8
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.1.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA2PR18MB5849

Convert Cadence family GPIO controller bindings to DT schema.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Harshit Shah <hshah@axiado.com>
---
 .../devicetree/bindings/gpio/cdns,gpio.txt         | 43 ------------
 .../devicetree/bindings/gpio/cdns,gpio.yaml        | 79 ++++++++++++++++++++++
 2 files changed, 79 insertions(+), 43 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/cdns,gpio.txt b/Documentation/devicetree/bindings/gpio/cdns,gpio.txt
deleted file mode 100644
index 706ef00f5c64951bb29c79a5541db4397e8b2733..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/gpio/cdns,gpio.txt
+++ /dev/null
@@ -1,43 +0,0 @@
-Cadence GPIO controller bindings
-
-Required properties:
-- compatible: should be "cdns,gpio-r1p02".
-- reg: the register base address and size.
-- #gpio-cells: should be 2.
-	* first cell is the GPIO number.
-	* second cell specifies the GPIO flags, as defined in
-		<dt-bindings/gpio/gpio.h>. Only the GPIO_ACTIVE_HIGH
-		and GPIO_ACTIVE_LOW flags are supported.
-- gpio-controller: marks the device as a GPIO controller.
-- clocks: should contain one entry referencing the peripheral clock driving
-	the GPIO controller.
-
-Optional properties:
-- ngpios: integer number of gpio lines supported by this controller, up to 32.
-- interrupts: interrupt specifier for the controllers interrupt.
-- interrupt-controller: marks the device as an interrupt controller. When
-	defined, interrupts, interrupt-parent and #interrupt-cells
-	are required.
-- interrupt-cells: should be 2.
-	* first cell is the GPIO number you want to use as an IRQ source.
-	* second cell specifies the IRQ type, as defined in
-		<dt-bindings/interrupt-controller/irq.h>.
-		Currently only level sensitive IRQs are supported.
-
-
-Example:
-	gpio0: gpio-controller@fd060000 {
-		compatible = "cdns,gpio-r1p02";
-		reg =<0xfd060000 0x1000>;
-
-		clocks = <&gpio_clk>;
-
-		interrupt-parent = <&gic>;
-		interrupts = <0 5 IRQ_TYPE_LEVEL_HIGH>;
-
-		gpio-controller;
-		#gpio-cells = <2>;
-
-		interrupt-controller;
-		#interrupt-cells = <2>;
-	};
diff --git a/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml b/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..f1a64c17366500cb0e02a0ca90da691fd992fe7d
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/cdns,gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cadence GPIO Controller
+
+maintainers:
+  - Jan Kotas <jank@cadence.com>
+
+properties:
+  compatible:
+    const: cdns,gpio-r1p02
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  ngpios:
+    minimum: 1
+    maximum: 32
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+    description: |
+      - First cell is the GPIO line number.
+      - Second cell is flags as defined in <dt-bindings/gpio/gpio.h>,
+        only GPIO_ACTIVE_HIGH and GPIO_ACTIVE_LOW supported.
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+    description: |
+      - First cell is the GPIO line number used as IRQ.
+      - Second cell is the trigger type, as defined in
+        <dt-bindings/interrupt-controller/irq.h>.
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - gpio-controller
+  - "#gpio-cells"
+
+if:
+  required: [interrupt-controller]
+then:
+  required:
+    - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    gpio0: gpio-controller@fd060000 {
+        compatible = "cdns,gpio-r1p02";
+        reg = <0xfd060000 0x1000>;
+        clocks = <&gpio_clk>;
+
+        interrupt-parent = <&gic>;
+        interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
+
+        gpio-controller;
+        #gpio-cells = <2>;
+
+        interrupt-controller;
+        #interrupt-cells = <2>;
+    };

-- 
2.25.1


