Return-Path: <linux-gpio+bounces-22546-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B86DEAF04E3
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jul 2025 22:29:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 451281891248
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jul 2025 20:30:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3E7F2F198E;
	Tue,  1 Jul 2025 20:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="m+rfbqpg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2090.outbound.protection.outlook.com [40.107.92.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C4C2F0E31;
	Tue,  1 Jul 2025 20:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751401686; cv=fail; b=E7oxxIOzQ4YAd8njGafEUaXWsfhcaNNGAJ60V8R5ZZkmj9wsWXGPDbJcaN1XiTSLT09/NK31qO8RX1VJJRkX/6fOsJ3bPl5u3nMUMJz3Qq7P+UyCBcHzXXkp3PSOnARYGI8X005fyh70oOuXEgo2LcIt4jLE5c8brqoNAvWFvBk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751401686; c=relaxed/simple;
	bh=GYTfWwydoEqjOb5pm/+K+xUxE68sq0M+YWOMHMJ7pb8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nu3d4cbuvV7zf9U9Orwg2/T8OJ1KfpVfwHriMrax6JtrvjdvaaS5L0fPBRCaX+JAivv0qBmCmZT/mP4tcER47MaKovn1GNLuuSqLrS+v4X0lq+4Hm46VJc6GH/0NFekhYCWWxQfdmSb4oXt5qpz7+DUr92StllzTZL3+gyUtmNY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=m+rfbqpg; arc=fail smtp.client-ip=40.107.92.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DLXovW6ZBrSobXP0LlPhTXxU+Jv20Xp3MUqknqttwve2ZlCIXXoopj1Rtb5GXt3NGnM/9Okl2AwPjp3fN7CxS3R0but2+uKYwL/FGLsNRISm6aV87kW5nvjv1fDoLIqoTKTvE9BEvmg4jUiFeBgbrdVNa1cgTrpf2wklkTe6BBq6BXhJJR4vO31S8ToQkKX0F/YAzt7WFTKQzr5B7y7CYA7zaX/SiawEQA8FY7pIWKI5FH1+bFMaFlHPOAPFQYWIiX0/st06gqU7M3dMh40sAtD/IRDXYPkII8HfseP+3roV9inKHjmW3ZIGvIIRN1HN5ABjS5mP/Wln5U2Q+SB3xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6/RlS2B/u8t10UcGCVxLrdmGRS3VhEcVQs+BmdJwEfk=;
 b=sCtmEdgDDxZYSD2w7fHXeiK6dOJQGavN9c3Pl11uVNJb6DjM4/s+VpIG/v96FCD3xSGjXxu/9JKz2jFDq7YbzY92mXM45AXdM7EB6W2t2ry8DfDjF5lTbBzB+NMBGx/mdPUNjQZEKPd2qdOSndYyG0KExWrTkDBlZhw8FJDDSOuAv5AP7D/W4uNrjqJvb5NGIlvnLClFwacSHFpglOP1gdHbnUXaoqWqxmEW/3UU0diPPa0XSzO/eHDrx8EvedP/z1556dvgQQQG82bzpu2RvY2LoXFb3d79LAkLrmIgNCoMOWAE6n8Xa9F6Rxod/qVzqNXIdBfED6/VH65qkCKH6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=amd.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6/RlS2B/u8t10UcGCVxLrdmGRS3VhEcVQs+BmdJwEfk=;
 b=m+rfbqpgW5WqXKPNjR5ThN+WgjoBKMPaBmz14Ol6a2N24QCB7zDuFqfBuCXMzs7BtgY6mOZJnlTZrx83XugFCsPhhRglgDf9Av0y2apjJT7wKI4aAJe+hSzyHFTLniJ9Oe+lg6JaSP1HGtB44fvqofBTao844cFdX6FfEgyj3zD8BsRasiODJc58tD4vkhCEeuxqN3wwnkLnYa4JXMHkDVAYDVms/TbcaScOh68mHHA6p/k2/3FyfcSCSaXT58fS+T9nmu25CMbblogu/OJnTNoStbZmFbS/CjXl2t326XMTeejU4sQTfkZoL7TlvsO9GwCGQqgXeO++yEmiJqsMWA==
Received: from DM6PR14CA0068.namprd14.prod.outlook.com (2603:10b6:5:18f::45)
 by CO1PR18MB4537.namprd18.prod.outlook.com (2603:10b6:303:fc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Tue, 1 Jul
 2025 20:28:00 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:5:18f:cafe::b3) by DM6PR14CA0068.outlook.office365.com
 (2603:10b6:5:18f::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.30 via Frontend Transport; Tue,
 1 Jul 2025 20:28:00 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.1.1];
Received: from [127.0.1.1] (50.233.182.194) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Tue, 1 Jul 2025 20:27:58 +0000
From: Harshit Shah <hshah@axiado.com>
Date: Tue, 01 Jul 2025 13:27:33 -0700
Subject: [PATCH v4 09/10] arm64: defconfig: enable the Axiado family
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-axiado-ax3000-soc-and-evaluation-board-support-v4-9-11ba6f62bf86@axiado.com>
References: <20250701-axiado-ax3000-soc-and-evaluation-board-support-v4-0-11ba6f62bf86@axiado.com>
In-Reply-To: <20250701-axiado-ax3000-soc-and-evaluation-board-support-v4-0-11ba6f62bf86@axiado.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=706; i=hshah@axiado.com;
 h=from:subject:message-id; bh=GYTfWwydoEqjOb5pm/+K+xUxE68sq0M+YWOMHMJ7pb8=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBoZES+uGHQnSaESKCGAY4lpUYWV3My3mEY5pJNP
 Wey0bZSdfWJAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaGREvgAKCRDxWHMRoTLV
 +0G9C/4gDZ7ibY4iIRqa00WtzmCP8LBzyAMw9FA9L5UxXNU/k5hgdJ0D+mTLLqSMNgX+YrKHXPh
 NOUjQN4e6THGOUUAJvn7MYc0sFn5qs1LwaY5Rlqh0xbkhQ3ChebLP6aP3V9UxQ4ZZxyIyjv1ebu
 dqV6Anwa/AMxq4lXyzhYhdZMgGsbQg0NowYFkkuzctk0l0ZvmjEZo+bWU6rhv1Wsas5LNCf1q1+
 9xORCQU/fjUczUl2sxOnW+Trwhi3ZpzXFuf7xuRggs0UXoQvJqgJ6h9+upS+QLgcrO5KzCMYpiU
 iPySKRzwU3d/s0UkCXDypBFDTa4LKkk8SrSIRQM8lemEkQUGEAIrnZYUwVD5gCSmYf/h/XWbY/e
 McCUz/ktmAjNgRa/xAIXx2bDkFkTWB/6Xwn29lvjm0eeAf7jBOVSIq6p8todtkWo2Yz35+3zfQj
 sdtalel1WN7mTlcWvd6EMRR0Wry8KPasea9hCbY1cKKfaZXAHUJJD+7B2xvaHH1XYQWIw=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|CO1PR18MB4537:EE_
X-MS-Office365-Filtering-Correlation-Id: 06c3a943-e40c-4cac-fbfc-08ddb8ddc5ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TVhEZDJ2NGJmZ3RYUTRLa0pzTTdNNXNtM3hRNElmZ0VpdXJ2T1BmK3N6Rmpj?=
 =?utf-8?B?MHhlSGZ2U3BRQUxSSUlGNTFhcEdQUFRwWTcyQU9rL1lJdE9HYzFKbmlrMTJG?=
 =?utf-8?B?YjBjK1crR0VXbjlTNkFZVkFvS3FSeHl6a2ZJZjZHdnBidStPVitiQXVrampH?=
 =?utf-8?B?RTNTSk1YWWc1NkJSWmN3QS9GWEFyL3c4K0dKSkVFMmNGbmNHRWhXU3R3YXhW?=
 =?utf-8?B?UDl5S0dIWDBJZWcrWENlY3BGaVlxYVdDQTdaZjBna2VaZ1NlTGtCWllIQTVR?=
 =?utf-8?B?Qmd5eUNHRW5xTEMrMWtqbERHNlEvY1k2RVl4TWcxNWR6SDFpRTg4ZGtoOXRT?=
 =?utf-8?B?dkNJVjhUR0ZZOFNUQXVvM2hDWlY5QlVyLzI0MHU3T1Y1L0pLR2Zxay82SXFv?=
 =?utf-8?B?ckN0WTZPTDVaU1NSaTVnL2ZNMjNvZVUvMTJDeUhZNGl6MUUxY1hibC9JWUQ5?=
 =?utf-8?B?a3dzOHZEeDdRQkJEekpHSGZhRFM4MXN6Z0pXNUd3eTh1T3FCSzAxMXB1ajcz?=
 =?utf-8?B?bTVRTzh1TXQybVJvaFYveFNiVlltUEhHcmRWUnp3VlpxeEQxd2o4Si9LaTN2?=
 =?utf-8?B?UUpRNmtaQXAzSWFZNGxnR2xZWEQvaDRYMXFIemxEQmVBbTBReTJadHNodjdp?=
 =?utf-8?B?Vjdqb3Roc1JEeml4V0lYTHh1MDJCdFE3aW5EK1VrUXh3ZlV1Qy9kVVU3UkdS?=
 =?utf-8?B?VVl6UVgyMElNb3VqeVlySEY2RmMxZG9IdTY2MEFYazhlcWxGSkVVNXJ2RGpT?=
 =?utf-8?B?NlZzM0ZPZTA4NE02K0NSbERMVk10bEtDK3RFNWN5bXI1UUJDdWNkb2llNDdU?=
 =?utf-8?B?TCtUVG5mNXVhT1N5aE1tUng4cVpIc1hiR09aZVpvRlhxenpaSm1rN3ZXSWxO?=
 =?utf-8?B?SHpqQ01hekZvdEdreHhzdnFUMmpxQ2VoVTlLUjUzbnc1Q0dXWHp2elFyRWha?=
 =?utf-8?B?eFYySFFQM1lEM1AyVm5EamJFTk56WEN1WGdqU2d6ZHI2NXpKL1dVVExQcEpY?=
 =?utf-8?B?ZmhHWXdYTXZjTm9yWVVKa0JNRjJlanpYWmFJUkVZZ3RjRWlDVlMvbFVkckJ3?=
 =?utf-8?B?THRBVnpJZk90d0pHbHNOc2hIWHJrQlZqR2pXWFVWOTZTUnNzTTNLMGszR0sv?=
 =?utf-8?B?YTJ2aXN0SXNmejE0RUs2NGFneE9Cd3FHRVZuZGhTQWgreW9rS3FvcHBFeGZn?=
 =?utf-8?B?a1B1MFpTYVV3Y2FCTVNyYmJ5MUdTKzJYT1pxZktPdEVUSjNkaEw3WmhLWVVl?=
 =?utf-8?B?N3VQUnJNdU5nakxWc3hMTDJSSkZYMTdPaUV4UWtUbUlsNWN5VmFYdXNtRnhE?=
 =?utf-8?B?TEQ0VnF0QU1kUVRzRlVrbnFUNkQ3dmdXbzZDS3dHd1VDTnRCNVNlNjV5emhG?=
 =?utf-8?B?aktKS0FPWFVXZFFqSEdQZVNMWVl4YklBNERWWjRhWUdOdWFqNXQ1dDlucHhp?=
 =?utf-8?B?eDZIMzBRS2J0YWlRLzJOV1dvWjBBdUR3b2NZWTBkSlZLaXdVWVBqZStLQUE1?=
 =?utf-8?B?NG5rQWZqY3hmaloydWdqYytyVzlVeWZTK0pEMG40OWtXeG1NUWR6OVhuSU5z?=
 =?utf-8?B?eWhFQ28xcE5KbXB1NkppWlFtYXR5d05TVzdKZnR4T01TWmhOUWhqSFNUWlFF?=
 =?utf-8?B?b3EvS0pQUzdJRjFiN3pGOVpQNnZiM01MQ1NnN2ljTGFvTVFubUJodWl6cEpt?=
 =?utf-8?B?cEZLbFdtREF3TWc4WGttS2FiMUoybHA2MXpZTzR5aHNOU1hOODJKdXYwQ1c5?=
 =?utf-8?B?dlBzeGZWbVlORkxpZ1Nyd0x5WFV0aGNKNHRyYmxhM1BMVWFubkRlV3dXQmQ5?=
 =?utf-8?B?eDM5QWZvM053Uk5vbXlvamIzTy9zZ0lWMXplcVViVE02MGYrTmxIelMvKzFI?=
 =?utf-8?B?OUIwdCsyRm5iWXdtejNWU0gzcjU3ekc5SWFoOGZuMmJ1OEdVZ3pBTDNBMVJz?=
 =?utf-8?B?bDJ4S0w1dVIzTllsYkdQMmhKN1pIRnFpWFlzOW1yZi82RVRvYUVmVERoc0ZI?=
 =?utf-8?B?YlR5STJBRXNieXMvK0dPaXdoRmtuNXhlR0t3cDM4bGRmSk0wT2VXQWVYUzcv?=
 =?utf-8?B?SVVrYmJ4eU5xTGxoNm9ObW9vUjdKQ0ZXSlUrQT09?=
X-Forefront-Antispam-Report:
	CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.1.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7416014)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 20:27:58.6101
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06c3a943-e40c-4cac-fbfc-08ddb8ddc5ac
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.1.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR18MB4537

Enable the Axiado SoC family in the arm64 defconfig.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Harshit Shah <hshah@axiado.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 897fc686e6a91b79770639d3eb15beb3ee48ef77..96268ade08aff844ad833c18397932a059db5499 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -38,6 +38,7 @@ CONFIG_ARCH_AIROHA=y
 CONFIG_ARCH_SUNXI=y
 CONFIG_ARCH_ALPINE=y
 CONFIG_ARCH_APPLE=y
+CONFIG_ARCH_AXIADO=y
 CONFIG_ARCH_BCM=y
 CONFIG_ARCH_BCM2835=y
 CONFIG_ARCH_BCM_IPROC=y

-- 
2.25.1


