Return-Path: <linux-gpio+bounces-22678-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C571DAF66A7
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 02:23:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 601087AAA58
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 00:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B51319C558;
	Thu,  3 Jul 2025 00:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="P2BCGfbZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2116.outbound.protection.outlook.com [40.107.236.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D7F179A3;
	Thu,  3 Jul 2025 00:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751502174; cv=fail; b=kVyivPfL/eDDWL3uScrx7L7Jg7fR0T+yhAP2E2qLWS8pv1exKEIyxORCGL8YU/EpM1OeEWCJnyXPK4ku0I65hdvfGo3h6jASeQZUBlbT/XY5XKpeafKR0YuJ2XOCELTRtYlENqyEyfExFq7nb5JdB/w6C8LbWICerIQ7hWFcPFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751502174; c=relaxed/simple;
	bh=gdIU8hH1VeyoHvN2LAzqUd9OmNgn2XDZhwtH8VPlpXA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=URkpu/0qD0z6ASL1N11KigRbVXsehnyEfddrRtjPiizqX32tGcxJOaNWiUukgOndYU9cS7Oq8O9VQS+rR/42OI3DgdkoYbgzxzpoHZCX7f1RbaN6TGhihBx12Ge4pC9Mv1bKk4YQWYmh1/1F7PKYN5EDgUxZRF3huQ6rma22kec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=P2BCGfbZ; arc=fail smtp.client-ip=40.107.236.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jL4vxr2eT6YAhYF2tkieT4KFk0IOSbd1qcY32HMsvZNXrd5TlGQBvZahIGd346wBrSoivtHJ+uEn9Q7gYH6yicE0eA/GXtV20Yp91DLSCp9QMU0pypoiR9R8La0JWIgdI+0m00+2Y+HbCExncYCssXBGuM/MmnUw+ru8TOIjWTeuhyF5QOR88n4Nl6y3W5uMydjtN87EinrDR2+a//1oC+/SRCRvpevuQ9cAM0Q3OKS4mUfQeHIGAoRmjFOYJtLbYzMsG4PuUaTFrnUuXm6A9XxdC0+EJysnjoWlWHmxkypKUNnwu9ykOPclruRejEjMl1XsezDqREm5eOhEWgl2KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=25aPx42UQxB9aMkth+WU/YgvjSqj2UiZivFyPcEOnfk=;
 b=QKg2rLwVx+6Ztlvz9uQQ5iMttqMUrDSu3DPC/rpFmWe6v7XfPW9qk/MVxZcEc/tB5nBhNkmcdo51DfdqvROfGiX3JT34R6rBzooG+yj6qQ88hH+Uxhh8rkhlsFvisiS+SvDojEHqFdw+1mjPUCA1Qtnld7rFcZO9d7EMal/ps26Y2jwnvScWnWYNCvjG07MzdUAcQ/yzEvPrCmPvk/4lPXK6BNIDE65f2mc+4fa4qoWu0XUsciASR1kq02hH1/hRmSIfg1aHOUhcOKKcDt/WeoZ9A3y2YZJe4wwlIuk1KNldHC6JJgjva46lpdj1IbDauHD1ZUTqexv13+Duy7/6EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=25aPx42UQxB9aMkth+WU/YgvjSqj2UiZivFyPcEOnfk=;
 b=P2BCGfbZZdcdO8aXYdHGNj2q/WxKJstZ6zPVgGIIQ/zx04q4FPTDa20nMtdgVvPG9bbFqDzT15401t71BEVveEr/HnhAlcRV2saDJPTkgOP9pWExhxr/DfNHE7CZHZXH7kWpoNlRhU3BzeHim1f5KRx6WMS71NOZHLzPvMm2hdC9U77bibRqhJa8GnwLBqqQiRLFxAdzLFhq6i+bCJiY6hz9Esyk5gm9G726ZUwY4Qy3Wpjl5ES7oGq+GVm/xIfHGbujz1Od1kGVTH5c1nJyr3H1F6o+cOlvS4+Sb/9GEaaBO6jQxonng/H0OJ1cKfNC+iVXmbUVcI1+Be4KVOHF6Q==
Received: from MW4PR03CA0101.namprd03.prod.outlook.com (2603:10b6:303:b7::16)
 by CO1PR18MB4651.namprd18.prod.outlook.com (2603:10b6:303:e6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 00:22:47 +0000
Received: from SJ1PEPF000026CA.namprd04.prod.outlook.com
 (2603:10b6:303:b7:cafe::98) by MW4PR03CA0101.outlook.office365.com
 (2603:10b6:303:b7::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.20 via Frontend Transport; Thu,
 3 Jul 2025 00:22:47 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.1.1];
Received: from [127.0.1.1] (50.233.182.194) by
 SJ1PEPF000026CA.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Thu, 3 Jul 2025 00:22:47 +0000
From: Harshit Shah <hshah@axiado.com>
Date: Wed, 02 Jul 2025 17:22:34 -0700
Subject: [PATCH v5 05/10] dt-bindings: serial: cdns: add Axiado AX3000 UART
 controller
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-axiado-ax3000-soc-and-evaluation-board-support-v5-5-6ade160ea23b@axiado.com>
References: <20250702-axiado-ax3000-soc-and-evaluation-board-support-v5-0-6ade160ea23b@axiado.com>
In-Reply-To: <20250702-axiado-ax3000-soc-and-evaluation-board-support-v5-0-6ade160ea23b@axiado.com>
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
 Harshit Shah <hshah@axiado.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=929; i=hshah@axiado.com;
 h=from:subject:message-id; bh=gdIU8hH1VeyoHvN2LAzqUd9OmNgn2XDZhwtH8VPlpXA=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBoZc1SRESjQOOwormXEgb6yIIvv5WOSSYnkYfti
 XviKGtmb7iJAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaGXNUgAKCRDxWHMRoTLV
 +/DODACRep2QrG/dDiuUE7Jrtw50ULz7xLPlDWvqVFOwjhbcY72UD+36MQM7sKv+Y2U8YyNRBdh
 EoJRFy5i0q+gH5QQmAtUoI2Mb8PE2AvnMVunnAyndKPo9JhtRj+WHCLKoCPSdpKMlU4pOJMIiJv
 zdAr75jAn8ZZ+QwPSyB7rABF518KmH4A378t3zQmJzRGyrOst/RCTVqYgofmzPSjKdXJJXcukvf
 CmB7Z0z7oDf/a5RxDzlctgHVxXTeuNp50h7qIzgJbFXTzIl11mDCcthnz5DTmNmOaEYHMSy/BZT
 brQj3JCxLx/eUc/Qmo/ojs6SYuiCrYsYYINcFx7P9GsDY9ttBouDbP0B0Y5y2TWSlYOKD4VieLI
 C3cT6Zn6zXQ7xY0fwb9dvyIdzd9tKKfLPX9CHiHqpkmN3xkIInFPYvQ13h4hUqhEnROAArTJW4A
 BA18J4iJ7s9tkY2tq06THHiROCLA4B/EJQWyW6MH+76AZQErXGvVNHBpsN+jeaDW7BLZE=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026CA:EE_|CO1PR18MB4651:EE_
X-MS-Office365-Filtering-Correlation-Id: 7465a014-d74b-44cd-d8d6-08ddb9c7bd0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OGlNRVlJNVp5K3NmRk9YeXdSR1RpWmcySnN4OUtpSFVlMW5zNjVuNG1DYlVQ?=
 =?utf-8?B?YnM3UE1WQVlCM2wxQzlVV2M1Y2pKU2hlTUVGNTNWWXhsSG5IdlFSd0UvOVIz?=
 =?utf-8?B?bk5ZUDVIdmxzT2RpZ0RCbnlqbWlDWlRYVDBJSXZSUHQzM1VuSmlJZWVCczBL?=
 =?utf-8?B?QlVFUDBHWGxQeW1sdXY0THhRcFpweDN0amhoNUgydFdpWEd1OTh5VUk3Y2M5?=
 =?utf-8?B?QVZqVWtUQXVySzRiVG9BT2RrdlpoUkprRmg5SVZBeHNYRElCVExFRmlMUlhJ?=
 =?utf-8?B?TmZCeU01Ym9JODV0Mk1icUFxUi9WYS9udWNvZUE5d1lnVzc3bDFDQTFyWFow?=
 =?utf-8?B?MWtjMHVIY2l5Yk9HZjEzUklTUWJaNzFQSm5BSUlZWmR2dGhlTUNCeVBuQjc0?=
 =?utf-8?B?UFlMZndyMUFLd3ZkdUlBUXRzSnF5Tnpta1gzWmc2d1NLc1FzanVDeDdsMVo1?=
 =?utf-8?B?b1EvN2ZTTFFzZGFMMEZnVFF2bWRidEp2dG9RZ1VyRmQzNjArcHREUmxCdnZl?=
 =?utf-8?B?RGJ1bTRHUEQzVlZWVnBBVWdsT3VQcmJrcE12SlhpdCtRRDArbG4zQmRvNHdY?=
 =?utf-8?B?aXdTNkZrQTdXU3ByZElVU1FLR2lNd2VMem92REVZMDhoMTgwSjQrcmxxOWpk?=
 =?utf-8?B?WFFhcGxuems5bkhOY3BDY2l2RFJ2bndvSjZtRkhNenpOV2M4K1ZDaFZ4OC9q?=
 =?utf-8?B?ZE02c1VXaGQ0K0tEd1V1VG5wYng3SjlUUk1zQ3F3TmFmQlhLem9kbDh2Uk9w?=
 =?utf-8?B?SFB5aktYY2JZdHhZVDloVDJ3UWRMaldvS0dnaGFtWFFJaWNEa0tnbmtnY0Vs?=
 =?utf-8?B?cjZHY2kyVlh3M3pmdStxcGRRTWhsdk5ZSDhLOE8wUXVjdzRZbVZVdHBpU0Er?=
 =?utf-8?B?NmJ3R1kzNUVaV1UycndFV1lMZmNVYTR4aS9KeGs0K1ZxR3BKaUNaYVpoaUxx?=
 =?utf-8?B?U2RrdWJndC9nVjR2WTFiWDNkNVVCb2ZaVzFPRUFVZ3hCanlUOEVxV2pNb2N4?=
 =?utf-8?B?RkZoR3VsNW9uOHVyaVRRN1YvRWx4OVRjTnUxU05hb08xYm1OZTJZbXVockFn?=
 =?utf-8?B?OGh4U3RsNXJpZlFRUERSUERBaVNSZ2N0ckFjeW84bFg0aGxhWWRZUmppWEgx?=
 =?utf-8?B?WldKM0VVdDZ4dlVVWXZrNWdWaG8ySmtIRUZ5UCszaTFVMGRDUGVvY2kvcFVN?=
 =?utf-8?B?ZFRqSXJmNmlYT3NMU3JMdUJBTm5hbEQxM1cxRXFuSlFFa2k1eVZ1b3I2MTND?=
 =?utf-8?B?bEtxSlJ0SWcwaUlJUzN5RmtpSFg2WEFmcFIxcnIxbnkvN0FZNHFHRFA3R3RF?=
 =?utf-8?B?d2pHbjVQaTJKODFHMTBKeWpQSk5oYlczbjRHZlZaMUFiM2dISkZQMU1VaFMx?=
 =?utf-8?B?RHZrOGZmdmE4SmRFK0NFVjBsWk1aamlEMUJIY04wMTVuSVc0amZiVThjbUY4?=
 =?utf-8?B?MGx6WHVxOE9NN2NENmhNdk94blZLWGpVRHg5bDRaUmdPMlczaDlOMjE3SVl3?=
 =?utf-8?B?VDE0ZUNLRVBNakJPWUcrcHZWR1ZnWURrT1l1R2ZSbkRGZG04eW1BNmcrSkov?=
 =?utf-8?B?QWJCeWFFZUcxNmJIU0taWmsyd3JRUTlzSWh3NGtEOWE3YWcwTDE5R1B5dmQw?=
 =?utf-8?B?THBFVjhyaG5KTTA0RjViZ1VKSWErLzcvbCtqZWFYTkplT1d6WlQ5cUp5bmwy?=
 =?utf-8?B?aTVFVHR6bWxJNnRhSjg5WG92aXNPUlp1LzdqUWU1aVZRZDkxaWFRaE4yaGpp?=
 =?utf-8?B?SWRpZE1MNVdMTFZoRHpoSXNGc29QVTNqcjgzSUlzT2ZKL05QTlVVbVlQTVVN?=
 =?utf-8?B?QnVabUtIV0xKWDAzckh1YzM2ZjBQaC9IckNORjNmOWorMnFEMGpmdEREQWhu?=
 =?utf-8?B?Y3JITkpIODJqNTZ3SHNsek40VWtPWGRKZlRJRjhYVnVIOXpWSE0rcEtSU25a?=
 =?utf-8?B?dzRVUFhaeXNjbTRaalhlSWtYbHhYRVFqeVc4dHVMemNyZ3J3WnB2TGc0eE5Y?=
 =?utf-8?B?a3psbXlncndMZ1FHdWVuazN4TEsrOHB1UTZSTGJiU3VQdENEeW5XL3FERDA1?=
 =?utf-8?B?U2ZGdWxDRG50NlF4UEg0MHlrR3R2QXc5UVFPdz09?=
X-Forefront-Antispam-Report:
	CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.1.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 00:22:47.7117
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7465a014-d74b-44cd-d8d6-08ddb9c7bd0e
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.1.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026CA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR18MB4651

Add binding for AX3000 UART controller. So far, no changes known,
so it can fallback to default compatible.

Signed-off-by: Harshit Shah <hshah@axiado.com>
---
 Documentation/devicetree/bindings/serial/cdns,uart.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/cdns,uart.yaml b/Documentation/devicetree/bindings/serial/cdns,uart.yaml
index d7f047b0bf24c444e2d81e0156fb01a89207ee2a..fdd2c7d78f924cdcc5c0a23fcceedaa92937e840 100644
--- a/Documentation/devicetree/bindings/serial/cdns,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/cdns,uart.yaml
@@ -12,6 +12,10 @@ maintainers:
 properties:
   compatible:
     oneOf:
+      - items:
+          - enum:
+              - axiado,ax3000-uart
+          - const: cdns,uart-r1p12
       - description: UART controller for Zynq-7xxx SoC
         items:
           - const: xlnx,xuartps

-- 
2.25.1


