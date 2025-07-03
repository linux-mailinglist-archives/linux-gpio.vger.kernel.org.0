Return-Path: <linux-gpio+bounces-22750-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 87308AF7FBE
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 20:21:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E24C7566282
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 18:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC26A279327;
	Thu,  3 Jul 2025 18:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="jtQrH0gY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2102.outbound.protection.outlook.com [40.107.92.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601C62F2C67;
	Thu,  3 Jul 2025 18:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751566865; cv=fail; b=PXMIxOmCtJv1UyFQCBcgbb/rlBRJiRRzP6h20sKL2U1Lw/p4LwzDP93BKNP2UJAa6r0LNo8Vmd047+tgq3Gj7NNCMDARvQkSTs7QYuGstffAjJTJYa5uX65E/qO3YCMlse1Ndxwyw74DLh8n95RuI/NtXWxJLcOX3JgTctymut4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751566865; c=relaxed/simple;
	bh=+LkKLNtqktZs6BJGxQlls9eAbfyJLYkPhSllbV6tgWc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wxv1Lu58ImuF7sBI88g50RIGbaGrATZcY2Xcimg4oGpkhtMza5/mR/0Nx4XYRH7sGTQDdLJ5bXglpxSAqyYogOzFfUZ9mgf/BBqU/m7D6ps4lSWh84Z8Jgfd5WmCC4rSy8VEOItbJ+j0XclivAdhVynLPIW0I5av67lsValmk20=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=jtQrH0gY; arc=fail smtp.client-ip=40.107.92.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nl+0xef1ud0CgChWYR8k9LwQ+RlEDBamOLSxXckdj6nUpVR8gYGttrQ+lWq1e5xexNDTBck7X9xOCRwQ4jadGbQQFe+fySAlQZvdHepfS+kAvnc93M5nooAxuW9FfDlV0TeT4kuDae7YvdsP2OuxAI3wo+8lJ0zFcinjZYLeeNi9LqkwTjKWdOgPsGLdxcV7uMPwEo7zZPB4XrFzLqBmiRN5KlC8DMGt5n3OkAX/TIHNoIhVY9lfQQcxMRx5YaB4H6jVpuRw8YzW2kAg1Np+yfPUurXeCFqn/N2kbsuCrTvHsHtJxlfA4F2k/V1EdoOIrVkut5pNpi8s6n2xV3osXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=thl99V5yXVMyPjXj7U7dTdtpXeFku2vCWOdg+nvR78Q=;
 b=HV2QfYSmsTN4b7ugUyIShPV28FC5ClcCG6sg+1uQSDa0EsIgr72bL8jqe5Cnn3qOmors1KnMUK5/ckPmWH+QnHGYl7cC5/vxeqYTFKn3P6BVjl0yQ7adLpcK6hdKt2+UR7duQs1PcZUkTm5FeDJ9AByE2wN/pFbnI1+1s7E54J2JQEye8QgnVSc8MtH6gsVqzdUQcp4vZ8cFLPQfkG3lU/l8k2LuTBXmEJ5NlqhHy+Js9RzchYUelRTXkc714YBG8jDLc+e8waZS/oe6ZrnXf8GkDUDfRI9RQDyeqmc2GQeD16hJSkrW6sdIMCfV93gyrOMZewLTpaZ7AVOLOVTivw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=thl99V5yXVMyPjXj7U7dTdtpXeFku2vCWOdg+nvR78Q=;
 b=jtQrH0gYmwDQO3gxvos/z1+hyZSodlQp076RWUTkR7syagVm5okaligCUj9brditI71G3qQuJiqnBNw4Zkd3b9kQPOx0XESCfmAa0CYRSyye0W33mFU/zNrXMdoHwSUf+w80MMXDkD42m+1TsKSqY9vyZ9TO8O0OQNcNK1PE5ZLAQEAamLec+ysCx6q2ctgIJeGR5uS3OMG8HNz1bC9ttNai1pVGilydPcQGC1kryQvyhfGossh6Y/Rn6CymUZ1l3NL/CTAq1FIC4uwik0SspEHbFdrmoys4Huv4gQgin3fpMeSzMbJgYdns5pl91ReB8E5zTLe+2o0U/6bTx99UZg==
Received: from BL1PR13CA0327.namprd13.prod.outlook.com (2603:10b6:208:2c1::32)
 by IA0PPF054A22988.namprd18.prod.outlook.com (2603:10b6:20f:fc04::c07) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Thu, 3 Jul
 2025 18:20:58 +0000
Received: from BL6PEPF0001AB75.namprd02.prod.outlook.com
 (2603:10b6:208:2c1:cafe::67) by BL1PR13CA0327.outlook.office365.com
 (2603:10b6:208:2c1::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.12 via Frontend Transport; Thu,
 3 Jul 2025 18:20:58 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.1.1];
Received: from [127.0.1.1] (50.233.182.194) by
 BL6PEPF0001AB75.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Thu, 3 Jul 2025 18:20:56 +0000
From: Harshit Shah <hshah@axiado.com>
Date: Thu, 03 Jul 2025 11:20:45 -0700
Subject: [PATCH v6 03/10] dt-bindings: gpio: cdns: convert to YAML
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-axiado-ax3000-soc-and-evaluation-board-support-v6-3-cebd810e7e26@axiado.com>
References: <20250703-axiado-ax3000-soc-and-evaluation-board-support-v6-0-cebd810e7e26@axiado.com>
In-Reply-To: <20250703-axiado-ax3000-soc-and-evaluation-board-support-v6-0-cebd810e7e26@axiado.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Jan Kotas <jank@cadence.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 =?utf-8?q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>, Boris Brezillon <bbrezillon@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 soc@lists.linux.dev, Jan Kotas <jank@cadence.com>, 
 linux-serial@vger.kernel.org, linux-i3c@lists.infradead.org, 
 Harshit Shah <hshah@axiado.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4292; i=hshah@axiado.com;
 h=from:subject:message-id; bh=+LkKLNtqktZs6BJGxQlls9eAbfyJLYkPhSllbV6tgWc=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBoZsn/EFUSrkc1Z4iJIRHVGXTv6KNsF80kiko8w
 PLanLApscqJAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaGbJ/wAKCRDxWHMRoTLV
 +80HDACYVNTYHYAwPoqmMJPmBsbX7427aD5VxyiMJ1rywz8vCmHvhCAdGF/dDeAdqLOrHqWbhBf
 th9vPFrLey+LUFrgRkMoHZOCT3UiRfF1lWleoa9a8P33mdFsc8eyNqNyr3hS1faJ3AUxWyDl2R8
 1KXpu7jSjZnUFA1FNzPHm6nWajJO5XEkJIlT+A7VgLdPLOvPzxppfxJgjOp9CNu5qiZI2CMxCkp
 rN0GB1QY7/WJDKSJaVkrzTkYJqcwYAbRmdla0qF/NvcdI2C2d/UJNML4RNWzHrwVFP5wWJq0seD
 POa9G1yLBuOyKWvbE3sePyRLNlAugiDYTHv34uUulC3EH6epM42hYz0SXHCbs4VzwfweNFXp3kC
 mCvCjQAwrThKUqvNi+Mk5kJOtqTt+jZ5HRwBvWOS42K5JyYXSnlfsFGOuR+9NCNImM/msQpI1E0
 2o1Oj1odlZyzwMeinSdoBsagW2M6rCJjYSyXCtcdnkXfJ+xvU5xmhm5KXxtwYEx/acb6s=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB75:EE_|IA0PPF054A22988:EE_
X-MS-Office365-Filtering-Correlation-Id: abaf4021-5f1f-47d4-063d-08ddba5e5bdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VVE1UExTRVpJYVREYVgxaVFzMjBpRjEzSm8xNFp2UFpxSHVKZTJqeFNScFpj?=
 =?utf-8?B?NWhxSVJPMXU5cEVzNTBqRFRyZ1VhTDBrMWNPVEcyRWdCK1FGWk50Zm9zSjdj?=
 =?utf-8?B?SWpFS3ZNajR6TDV6aEx6ZXhWWVM2blNnVmZHZ2hZSnYyOU9xVVZuZm82REY4?=
 =?utf-8?B?bllpeUdaSlBoME4zOVRwODNFTTZJWi9WYlRXZHhCcHVBREFXcUhBamFOREVL?=
 =?utf-8?B?UnQyVGQ0KzAvdUV3eHJnR0NFdTFhTWpGNnk5blZOc21UWEh3YzhoRldsMjhp?=
 =?utf-8?B?TTNBZmpKUmlXdG9CZFhJYjFVbzdrd0xta3FET3ZXR251VnUzWC9PRHJVTDgv?=
 =?utf-8?B?WHBDL1h1ajM3TG9FOXBTbHU0RWxvZjVuazlmRnYzNmkrSHFnNlI3SFM0SWQx?=
 =?utf-8?B?UENpRG93d3BNdnlVL2Zsb2xiU0x1aGRiWWhTKzlBSzh3QStOei82QUxaOEVa?=
 =?utf-8?B?TVUyL0xlNThFcFB2WkxUT2dlZkdyOVhTTlhPNkphTmplZlBTWHpnc2crYWRC?=
 =?utf-8?B?R2NZU2p3bWlLQjlOYU9ZeHhhaE9mU2R3eW4vTXVNU09YcWw0Q0xVUnYzbGVz?=
 =?utf-8?B?Q0E4UXhKdm0rVlFPRXN0dEdDZjhsTlhISVFsZ002dDdSOUJMZTFFNlowM3Ju?=
 =?utf-8?B?bHlHMVpIQWJ5NHRQWnlvWTd5aGxZL0J2VFhQY1c0eFE5V1Evb1B4RFdjMkR6?=
 =?utf-8?B?VkNDdGJsK1dBaFFZQWxSR3ZVaXZ1NDZKKzhIM3ZMamd3bmo4ZlJubkNPckZu?=
 =?utf-8?B?ZFdMRExUSGo3dStYeUh3MTFRMk4rU2x5NlRLWE5JT3BwQk9yeGdQSkthZVJ3?=
 =?utf-8?B?cmZLc2lFT0NRY0ZWY1pDZHgyV3pPUkIvSnZiY3p3ZTA0QzBob0ZWLzJBRVov?=
 =?utf-8?B?RXFxcVJOQzJaSWF6MlBhZFZZVkp2bk1RR2Y4WFU4dWtzWnRCMkhrM3Fld0lV?=
 =?utf-8?B?a040NlN4TTRWYVBHY09CYzZwQVp6TENKRzVlRk1aS0l2eUZsdXNVNUZ2TUJL?=
 =?utf-8?B?U1J2ckNWbGthUWlCQURBSFN4UjR6enNwVU5UTmZtWGozTjdhbG1IRExwbnRB?=
 =?utf-8?B?aHdPSCtmcngrc3RPL1JCMFhFa2NrajYzNFh1dEd2cVVwUGJRT2VNekVBZDVm?=
 =?utf-8?B?c3lrMG1iZ0FMcFVqSVlFWVFvVXkyaE1hTEJmVWZiaUZhZDBraCs2MUpEamNa?=
 =?utf-8?B?YllDZk92ZDFLSEMzbUJUdkNraUdwZ3dCdTRwbklrU3Mxa3ZLNEczUWxmcFlU?=
 =?utf-8?B?bzRhbU4zVjYxZHNGN21ZbE0yRUpyK3ZkRlFKeE9vWFZWTTFpRkFRQnpRM25s?=
 =?utf-8?B?dXJYOVJhOWxlL0t1THM4OWtNK0NYSEExem1tNlNWZHU4VFN6a1I5TTN4bHpk?=
 =?utf-8?B?UUthLzRlLzVOR05Qa0hIaHRzSkJRQXFCdExaMFZrS3ZINHJ1SklINWFkbjFS?=
 =?utf-8?B?Mlo4VWNtbVlKV25HaUtiRS9jVGdmaVEwWjlKVWYvOGYrY3FYZVNMNW9UcnpK?=
 =?utf-8?B?dzQ0UzIxcUFsclRRQzN4NHpNTFJocVVpM2preW5UYnEzcEVpTzZYcGZDTG5K?=
 =?utf-8?B?alJzLzMzbmZXRjc2WFNzMVMwYk9tbkhhSG53d014WGROTDk0ajgvYjMxdThO?=
 =?utf-8?B?SlRSUk85cjhNQWNRZFVaVHRQS1V3NUJIcXNHSEY2RXJEcndUcGMvOHBWNUNJ?=
 =?utf-8?B?dVd0cmcvMkRSd01VbEpPWWVFUmljQ3VJVUpPOHQ1Yyt3QVU4V0RIdkRzTFlt?=
 =?utf-8?B?T0pleXd6a1J2ZDA2eUMyVjJTd1V2RndqL1QvT3VXSjFKU0VQYU0rWEVDQ014?=
 =?utf-8?B?QnRLSlVyWUpCOXJnSjBRM2MvTU03T0lhSVU2b1pkUUd3QXZ3TDNJQ3JjNWly?=
 =?utf-8?B?RmtCTWRpNUVTY1dRYmJielI4QjcrR09ka0RwcllyaGVWNjhLdEFvZ1pHckYv?=
 =?utf-8?B?NElKcU9jRmJDTUQ0YWp5MFltMFpUWjdSd2Q3a0RiWUlpRjdKZ1p4R1dTbjM4?=
 =?utf-8?Q?eapaaiDfdEsdl6GmHsoH+USl+3pz4o=3D?=
X-Forefront-Antispam-Report:
	CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.1.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 18:20:56.9358
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abaf4021-5f1f-47d4-063d-08ddba5e5bdf
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.1.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB75.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF054A22988

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


