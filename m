Return-Path: <linux-gpio+bounces-23655-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F37B0E4CE
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Jul 2025 22:18:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 984546C604C
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Jul 2025 20:17:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCA1828A40A;
	Tue, 22 Jul 2025 20:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="u1/QcR0V"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2102.outbound.protection.outlook.com [40.107.244.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED05288C3B;
	Tue, 22 Jul 2025 20:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753215386; cv=fail; b=FyJ/bmSsaROkuriS9clduCYBgZ31smpLkTUJ5BnTMdI2fN74nSfzfTxbOxR7tirTIYeqoky5VnDYwcQQ/lPJZ1zPeZjtiuk/Kc+y8fdZa+IvxxTAsEdNcAeLE3Nqz0afBpfr/9L5+Q6bCp/EyVaGAKfbVz7dSENFupd3mIc54Dc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753215386; c=relaxed/simple;
	bh=GYTfWwydoEqjOb5pm/+K+xUxE68sq0M+YWOMHMJ7pb8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ucpml68658rwqUbRMQLzGCBfeMlGqYxz81NW/s+SY/ekLfZ3bj76+DuZ8dUIxPMHUTQ/wIMnPCsJmJgkj10m2k6hDMTqcQQzzjNnLhDjWha3UKyVl39md1blvxFeqUt72bRIjl1T28ybcNgtyny5WeYSwY4a2O3qhQe6KmXzcEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=u1/QcR0V; arc=fail smtp.client-ip=40.107.244.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eQ49Wuvhc7JuArKOPuUfja9bx7q5rcDT76lCpgcZIkhstzBZasS9OSF8M0euxmjqPIF+HUp5v9W9ZQQM0TNXQRa5GPLuZKFZ2gEfzFEqp5tj+blo8Rp+lJCgMB3kVrC7ot/E1OF+RYVeVuSfFqMO9nXq66GDPHUZIq8KxuTfj6OraER1hKaElfZhj4dy8Uq1muZqJ24TTtv4KLZG0YfR4uxQH9/VxXp7ER7amGZwPUoA8atNET6GA1yVaNfuTgVhuYNHJjzy1SXok4z8LW6njctiWJ31aTEV1alU2TX0pUEDjgw/IW2XUDBHS9Ti5pISSOGh2cOy8mncsthwSHuDVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6/RlS2B/u8t10UcGCVxLrdmGRS3VhEcVQs+BmdJwEfk=;
 b=o1WQVr7tPCkvh82avy+oM6+Cotb80M9VT4KRatPk267LG3EpiAtXeeVG8MZnvolBOVhznYZOPGeRkoY1Eh98vQ3Lo7bOYsRlHh96PcQfi95QrE3iZ3LUJa7/qYT/044fzRstEdRXFKL5vnnQAUTNm538KPWiqzvI/rRYTNvDMkI8JrCLLt4B7KErMZ7dlgDciNgZNDgZmysLmFmKOLg+GNdScJUwNhVqeR5Itt/5Q1aR9lR8kBQbeBPZIWrePrE2lccDMRmXK7RIGBnagiMxSHore2sqjJ0H2U97sJvbX5O6vj+lcPSTnmfbkvlrhQz8Ek/wOsR20F8yQL+Yz5psWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=arndb.de smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6/RlS2B/u8t10UcGCVxLrdmGRS3VhEcVQs+BmdJwEfk=;
 b=u1/QcR0VzQhuGzih+xXVr7+h8AxPZEqyWzE/Ir6kRUA/yU6H8fLhPE6IMuGRDD3w/lA5eXe8HqsaeRvVcAXay/FwsYuyOwO2Xu9rEV19mBiGnF6wwefbN4COcyuaw/lrnKFk8zL7B3nKBIYWVRPMYpk1ftBACTnUlB1dTo2z5J0/1QVEuPZUY4B/A8cCtCvc3jigA13Pxwj6WFpyVVwYC+rZxVRzTxk2ybfjFurzcyW+9Jq+cVIrcO8IwO5X2B3t9Bg+Xu0Swm1in/N85yj0St5Hp3VpKvHaKBRgBnPLCYtOamdhMhAkh98RcYii1uaM+tyvvmjQMYMUndhtMoop6g==
Received: from CH0PR03CA0019.namprd03.prod.outlook.com (2603:10b6:610:b0::24)
 by CH0PR18MB4338.namprd18.prod.outlook.com (2603:10b6:610:d1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 20:16:18 +0000
Received: from CY4PEPF0000EDD7.namprd03.prod.outlook.com
 (2603:10b6:610:b0:cafe::c3) by CH0PR03CA0019.outlook.office365.com
 (2603:10b6:610:b0::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Tue,
 22 Jul 2025 20:16:18 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.1.1];
Received: from [127.0.1.1] (50.233.182.194) by
 CY4PEPF0000EDD7.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Tue, 22 Jul 2025 20:16:17 +0000
From: Harshit Shah <hshah@axiado.com>
Date: Tue, 22 Jul 2025 13:15:37 -0700
Subject: [PATCH v6 09/10] arm64: defconfig: enable the Axiado family
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250722-axiado-ax3000-soc-and-evaluation-board-support-v6-9-543979a60ccf@axiado.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=706; i=hshah@axiado.com;
 h=from:subject:message-id; bh=GYTfWwydoEqjOb5pm/+K+xUxE68sq0M+YWOMHMJ7pb8=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBof/GEkX9gpGlEvGqQ3bl7MQn6fwlk9/YMNs8Nu
 LhWmqoOABSJAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaH/xhAAKCRDxWHMRoTLV
 +2CKC/9TmrULrZaknVKRzpAlUClqQrZAca73sX78wArMB5uo+l/vI20Qdd2K7Rr87Pp+KWTksPg
 2wMHdW5f/c9cRuSS2vzLSBt33sVeWNFpmowcvq/E4DdvnyL2CAVvTY/n/rm3fsKrVPfNtRlriFk
 kfojeb5aloN+cu1oP5YNU01ETOMS/WEjcris9vU/LUvNTPGlhc+wkD87I8qlpX1b9X8p1I0FTbF
 JC/GxWawcH1Dt4saEk1NBNeh2FfF+fGqKuDbKKjWHCIBjKN/EpBtgATdxuvoIng/F3TyMVVdDi6
 wg7+Y88LrDyuukmfowp/pMC3NHoZkAfQeBqQhPGbhtWRw5KqVMZ+cOh6o+kF7imxiRAg/WTDVEi
 c3kFMN2Pe3FX/tJ0rqmv4ZyVbqC78El5mpSr5nQOWTvGA5MYoatUkowR1PAgjgZC6HbvrkFaEQB
 1hSiyBx9chjkHbaH1JkCF646RU++pzlL8PoPqubm49SpxGH51Ms0fmZMNyL8ClCO2KieU=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD7:EE_|CH0PR18MB4338:EE_
X-MS-Office365-Filtering-Correlation-Id: 647ecbf6-f578-47cb-59aa-08ddc95c9e1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|36860700013|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QWlaeWxZcnp2dkV6TThHbDM3cG40NldpcDFaT09zZ1VsTERWVWY2NnVnWjBV?=
 =?utf-8?B?OEJyMkp5a2JGSXFkN201eTVLdDlLMHhYSDRwUlJMa3pXc2FKTjJCOFdYdTda?=
 =?utf-8?B?M3M0Z3NlVTlCUTJYNHh4dGZGcUdtRWtWNGJpWkFrU29WUUFta2pVeXc5NVRa?=
 =?utf-8?B?Y2lVcGU3OXNUMkJpbzFnQVB6ZEU0R3Z6VFM4aGtGbFJZK3lLcFhMbjRsZGJW?=
 =?utf-8?B?UzR6UFRxWmphQ2JrQnpoTEc5aFBzdTBuVWJPUitHanpMMXpaMWJnNTJ1R3cw?=
 =?utf-8?B?UGhPZXQ4Y1R5eFVUSnBmcTNvUTNuVnFzd3pvVVEweHhMZnhidHBpeUhIRld5?=
 =?utf-8?B?MDdFMGVtOXNtYjQ5Y1E2elY5d1h0eFJIczBQeklGdDhSdTBKQmZEWGZLNDJH?=
 =?utf-8?B?QXBMVWc4NU0wMTR3MExFNW9IVStZaWZDMEZtNUNCVFQxb0grbzgxekQxVUFy?=
 =?utf-8?B?cndiN1VwM210SDZIM0JNSzYrcGh4VzFTK0lldWhoZUt3S3hjb0g1NUNlUDlv?=
 =?utf-8?B?RCtBbmVKSFJuUmtOVXNycFJmOUtoK1pVQlc5QmF1S3VxNVBVbjVCVTQxQ0V3?=
 =?utf-8?B?Y1d3Y3ZoTHNObjkrM0U0cTk4UWJUQnJUTm9BQXA2UjB0OFBZTksvRHAwZzVs?=
 =?utf-8?B?clRMZXhZZ0tINnE1RFM1MGh4YzlDU3pxcU1RUk1PWDlZV0FwQW9GV1FaSjJy?=
 =?utf-8?B?Z204ck5UbEpoM0FQaWJ0NFRXSTE3VDZhR3BidnE0MVh5TzU4eW1mSmdwczBB?=
 =?utf-8?B?WGRGdUl2Y0MwR3ZNbUJubWc0dURTUG1Mem5DbnIzRGp0TnNjNGc4dXhOd2t5?=
 =?utf-8?B?VlB2RmNWdlNZc20yMThKemtKQnVVZmdYUmFvakNpQkREaUl4SEF4ckNsZ2hh?=
 =?utf-8?B?VUdHYlJORVdZdWk3ZTJ6UE9QTkp3UkIvZ0svSVl0NXdHZjNjYktEbmtDUGNu?=
 =?utf-8?B?MnFxZi9FeHZPOVBJdUFHVlhtYWMxbFJWSzA2QVVhRDZCWVkzZmovaDE3SGEv?=
 =?utf-8?B?cWd1aXZleDg5UXRYZndQTVNQKytzeWJONGtYZm94eG1leFdFRlNycFVyNnBD?=
 =?utf-8?B?KzMvSlI0RDFIWG1ub3hkc2cwRStiMTYxZWRxMFlrL0VOeUNlTjgxYU9pQVJM?=
 =?utf-8?B?Ym1wd3JhQUJiV3owUFpnVDlmenVuVzg3dUVjV2FFTldCVWFkYWRoLzRQRS9G?=
 =?utf-8?B?RUtLQ3BOUVQ1SHJEOXdJcGRNVzg1bU4wS3J5cHE4cjdWVnQ2QlZUYmR0U0RQ?=
 =?utf-8?B?NCtsbnd5bGI2ZDNVdkhWTWxhdGU3QTJsTUJaSCtWVDhJNURsZUFEUHJsOXdZ?=
 =?utf-8?B?UXpzSy9SbnorWDJqTEVMVUpGa1VlZFZ5ak80V3BrbjNScWwrMmR5Q09OWWh3?=
 =?utf-8?B?Z0MxenQ3bUJVelljR2d4YlBLV1l5dGIxTTN1MHVvcmxwdmo1cTNpMlFHYnF0?=
 =?utf-8?B?S2VQeU93VmsydlYrazJmcHhlZGVBUUR1dEJaMFRRQ202V2tudU1FUDlsejhJ?=
 =?utf-8?B?UUhGWVMxUFFwU2tKbHZiaXF1azBNS3lpemFRR1hqdkw4WWRPT1NiNEFVNGkr?=
 =?utf-8?B?SllYSWVYV1ZaY2EzalkvUWtNeWpkSHkzWG81N2xoMmQ1OStETjkvbkdmQ1lF?=
 =?utf-8?B?TDlRN0pqaHNrbzFYTUVnUUVEQ3dPd3pza3RoT1R4dFpmSEpWbVZMT25Ra0lN?=
 =?utf-8?B?RzJqb3FCOGI2YjRnSDFVMkFGRDVvMytqRXkwOEhMck9NWkRvVWNmenRWdUJo?=
 =?utf-8?B?TFdwakJ3bS9lTk1ZU3kzTjIyeHowUjV1RDV3UkxXMk5VekcyWkpzQjczVEN3?=
 =?utf-8?B?NnJXRlFjcGEycDByRzRhZmNiUlUySGxleTdsOXN0dG5ZekpmMTZTQjZ2Q09B?=
 =?utf-8?B?RHJpT2hNWnhtVHlSUmVsSExBaEIxVE9WdURHTFRFOVNTODYrN0VaK1BaNUxC?=
 =?utf-8?B?MUVvZzEreEJ4QnhMS0dESmN4bFZ5UHJZZjFZb2hiejRlY0hGWm4zc1F2K2Ix?=
 =?utf-8?B?dlM0M1piMXlicFpNRWNHcWsySFpld3Q2Q1JiQkR6SjV0R3hhaVVCOW13VXlC?=
 =?utf-8?B?aXVTUnc4ODBvYjRqWTF0Qjc3V2FOaGg0UVlYdz09?=
X-Forefront-Antispam-Report:
	CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.1.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700013)(82310400026)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 20:16:17.5683
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 647ecbf6-f578-47cb-59aa-08ddc95c9e1a
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.1.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR18MB4338

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


