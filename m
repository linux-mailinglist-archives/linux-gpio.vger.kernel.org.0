Return-Path: <linux-gpio+bounces-22751-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3528DAF7FC1
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 20:22:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94BEB1C84EA3
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 18:22:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F5832F3644;
	Thu,  3 Jul 2025 18:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="tp1Nv5U8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2105.outbound.protection.outlook.com [40.107.220.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6C92F3620;
	Thu,  3 Jul 2025 18:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751566868; cv=fail; b=k8KORDxXoopXd06pOeW8np6vPSecnK05g6rjiLI9sedmGF6Y2kIbOAIC0FZXH5LZ4k8huQxQJMZqhSNhnv2s7V8OsZmJdFOVXvVjq91NC2vFdvcEL57ZIMXzosQ+YGVsARauZ33ahaIviJUj3AAl+dTClvQYteKf7KeSQ7pwjlk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751566868; c=relaxed/simple;
	bh=adxtPfuT8FPQ+5sboBQVDCz5OzPOlxqIPJVE/b5sCIo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I27rV4j/zByxaP06kKPlHZmAPk0Y6cyG0t9TZ3Iq1mYCc70if1lvT//QooXtC2Ve5ol47ZvDIoMCirAETIdayvdd5imptEyPdkl3wPKEOUwWDpNEtVPOv1R04MR4RIusG8bf1TIvYOBv0h1uBq8I6uKh6d7lvKRca1I3cbR/YWQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=tp1Nv5U8; arc=fail smtp.client-ip=40.107.220.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cGBNkvD+GbwRnoS76if9/q+lRuAgYCT0aOVXDJf/LbQXOWz6RM5jnlQeYKqsudrn28e1ZV2KZRzdx7RJR/7M+W9oHm28kRgiGBb4I5qELrTcz5YXFM9S7AJPZ+TGCUVixFbfmfqBuIrAGL51jr0r/J4mIuMfIZwLdaCJX4gDvWUgKcVDI4jGuAuXtT/erXCsXqmi/9T/UGULsZ4tK7kX0VsQ+cl16G+2RagQI66ERt4UBmRju8D62BXt5hZlT/ASGYwS5DULSEDJVyieLv/RaAl53gq2X7S3LXNjOSxL7xTRUAT+dEZzNydAEtYc9LPPV/ruQL7JE8y9Fwa8BzSJZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vsDP6PVtoIWI7YeU2EAUTl/slazwVN3pambVCjSH8Ys=;
 b=D35xWkfEyJt38zMPNEkEIEywzDkH2z6VZCEdqikeEIAgJ7d9cAen9IBu/FVZRXANZQ9GRLpdD1Vq4H//PJrifWRWi2Ws7HHdtpyjI+wUc0Y6BE/6g1Ga+uGvNVJfYCsP3rSgAgBjVOsL9UghhvWbUSqLEbWu//UM9mn1x8Cq6ATh7omuqnTPgcoQ1yIG/a953VhwY6hbWqXTJneUTqXVbZ4lHnIBSNSRmw+OIyQfmuajo/0w9srlaD9irdNbI4UCJnW3A7odvjYkN8RHZXXyj+KmPxBgmhpmu8qCFAU3h7r0Ve79S84mUkf4ljzZ6ZUSK+re4E6ZWFanO3DbjACkAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vsDP6PVtoIWI7YeU2EAUTl/slazwVN3pambVCjSH8Ys=;
 b=tp1Nv5U8k61d1kfb0MDUCb6kGUdr4KVJ7VCDT8TweRErjKoDhLYfZtoHg3NqpiYkBxvlbAufW1pBATBZkq4MmIr1tpEyxll/fp3mMVKYjV26Cx2uZCp19FZ0n5/csmGq+aWhMWN5OJvJo2IZ0oZJXEpdR+14H13eZdKJHwFJ4WGGisz6w729RDxsZj5AwgJEhMZRDRWZnDOD04UuxdnGHij12aZUgYsa0oDtvsdxMAfhx+ROm9HuJIV7hbr6RHzzVPxJzL/hk21mbGmMY8tIn+LpmjwYEqslBoP/RjZ7DbRuEUrk+KEutTpmv/DhJy2LBlNIVSGQ2tOVh2sJtZgOEA==
Received: from BL1PR13CA0304.namprd13.prod.outlook.com (2603:10b6:208:2c1::9)
 by LV3PR18MB5722.namprd18.prod.outlook.com (2603:10b6:408:1ac::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Thu, 3 Jul
 2025 18:21:00 +0000
Received: from BL6PEPF0001AB75.namprd02.prod.outlook.com
 (2603:10b6:208:2c1:cafe::83) by BL1PR13CA0304.outlook.office365.com
 (2603:10b6:208:2c1::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.12 via Frontend Transport; Thu,
 3 Jul 2025 18:21:00 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.1.1];
Received: from [127.0.1.1] (50.233.182.194) by
 BL6PEPF0001AB75.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Thu, 3 Jul 2025 18:20:59 +0000
From: Harshit Shah <hshah@axiado.com>
Date: Thu, 03 Jul 2025 11:20:46 -0700
Subject: [PATCH v6 04/10] dt-bindings: gpio: cdns: add Axiado AX3000 GPIO
 variant
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-axiado-ax3000-soc-and-evaluation-board-support-v6-4-cebd810e7e26@axiado.com>
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
 Harshit Shah <hshah@axiado.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=935; i=hshah@axiado.com;
 h=from:subject:message-id; bh=adxtPfuT8FPQ+5sboBQVDCz5OzPOlxqIPJVE/b5sCIo=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBoZsn/uU25/9/XvEdkw3u3wCEP5SGkhRX47iHP6
 wZkAhawjSSJAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaGbJ/wAKCRDxWHMRoTLV
 +5MGC/0U0yQZBkFC8SpOUdesFEOfNWVx5rcOcCZjwXtLJzpOmTfyhKHXYAt1rvZzl5mGOe1zl9+
 z0AzgTVCv3EmGNMQ6a+3VRUBLXRQJtavz1po7LHz/M47PXhQ3Cm0vl+B9oyMCST5mlfL3QYDXat
 jAc50TH+quyoe2l0NoNEw5qDSLc7zU1sMwrv8ebU5B/8pz3QXU28U3wXxfW9oXyhPT5WTuaBJTI
 jEnlBXKIYyJkjtsPRGjF0PsSurBIh9P/6Al+R6nJ/JW01DcR3cCJJO9xD4FeIro+C8WigUT7pAp
 6VMMAOp1yfENowZKa7MF4w7FnOLyYwtb8p19vKy8n77OPNtllI/b9OlggkbKx16fN2J8Qhyiry/
 3JYqlskwP1z9m3/zweAK6MB+h2KNekzKQGwDbkqa3ld/JlRNKYUGUhPqmPP9Kp0PRQquvGHD7pO
 B+T/M1UJop8zyxtf45vjfdcwAYwif+7aZcOfSFd0uPWP3vVpkNVMVxI8pqFXBRH2PowSc=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB75:EE_|LV3PR18MB5722:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f1f4ea4-4053-4177-c45a-08ddba5e5d21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cUdFYUQzWkN1V2R6b0k4aWtkUkFnRVFRWURucFVBVlIvMGxEY0h3ejh1SU42?=
 =?utf-8?B?eDhoQ2xDQk9vL1lHY1lhWXpYcDh1ZytVYlJsWHYvUnBpY3dHNldQZ2FDa3Vq?=
 =?utf-8?B?YU0zcGtlbFlZakRYTkUzcWZNanRUUkpWOXRyeGdvVEU1ckVCamthV1c4aS9M?=
 =?utf-8?B?c0VmVExPQktWWmU5QzdqbHgva1VlNWZxeWM0OEtQOTFQamk5b2FBeUpUYmNZ?=
 =?utf-8?B?RjJyeGRFbmMwYnhwMEdXdFlaMFJFdC9oK3lvZzg4S0ttWGJMNjdmM0FxVThs?=
 =?utf-8?B?UjdQSDBocjRHWE90OEVWTFJROHU4NXNOK05RMWhQMWRCRTRKRGRuUVdJU2Mr?=
 =?utf-8?B?M0FhR3pFVE05Sm8vZ3c5dEhSUnpiVDZBcG5GTGo4WEk4WWhZZXc1d3M4Ulh0?=
 =?utf-8?B?cmowNXM0QmQzQWJyNlpQTUdKSldmb3NVS29vVnd1RGV2enhOa1RqUS9DekFI?=
 =?utf-8?B?Sldrb3FuUWVFWlM3S1lxZ21NbkU0b0YwNE5PZ3FhVGorbjZBOEs3cWJtSmRj?=
 =?utf-8?B?aE40VlF4eTdIanlqaEhlYUtBeDd0M0RWY1M5VHIrYjZKd21JbXN5Yy9JUXhJ?=
 =?utf-8?B?eXhFdHU1V1loaGRsK3dzYlQwZnU0VXR1NVpnRERINlhZQXVBa0RYcUU2bEcy?=
 =?utf-8?B?WGJGZ1NCZVNBajg5MTdsZzNaV2p4dzRKcmx4cFVBQVNZRXovNE9VeDhMOFpj?=
 =?utf-8?B?TVphY0FEb1Z0bGVwdjMrUGZZZW9xUHYzUEtjUGxrYXBHN0ZEdUcrL1YwdmR4?=
 =?utf-8?B?R0JjL0NBREMrU0thb0JIVzRIVjJPb2tta2ZJeDRFd090L1RDUy9GV0huVGY5?=
 =?utf-8?B?Mk81UnYvQ2J2R0lhSnJJWGxRRHNmUmt0TWJYZ3RUSktmaHlYOHQ1cUUrVTZp?=
 =?utf-8?B?N3BEb0N1SlNDRWpmZUxqTHJOd0VIZmtPallEeENyQ29lOXpiZ2dLS3RwSGxE?=
 =?utf-8?B?MEI2SndrcGtiMjZWMkFoaWE2NVdYUHd6QndvVjRQMFJDTmJMeUtPN2V2VDhx?=
 =?utf-8?B?Tjc5dWtZdWlOcEFiN1VwKzZQUFVrQVM5Q2R5eXpyMlBTZzV4MC9WRG9wT3hv?=
 =?utf-8?B?ZDRuTzdsSFkxNXFwYTNxZmJNcTRaWVM1U0l6TXNkTkdiNnlyT211OUM1dVo3?=
 =?utf-8?B?SFF6eVRCOTBIMnkvUG1ERitFajJodE05MUw1SmJyUGtSdFI1MkVUc1hyOCtD?=
 =?utf-8?B?amp0cmY3TTZRMmJhNFc1NFVEZ0dnWG04MFRPK1VxbHpRSWtlTEVSYTBzRVJp?=
 =?utf-8?B?RDJEbXNxdVV2bE9VbnMvQWljWDM3bmthRXdKTVBFNE5ENlFXNm9acnoxQkov?=
 =?utf-8?B?c05CS1BMcXoyL1JCVjFqWEhsUzMyNzRuckN5VzVuRWs0Lys4OUFvWUxpY2xQ?=
 =?utf-8?B?VjJwTFJ2Wm54a0c2cHlDaVcyVE1CcmVSRUUwSVhNMzB5NDlpbWEwVCtvbHcv?=
 =?utf-8?B?U1Bmc1FTL1hvK2FSOCt2ZU54WFRRZGJveGk3UmJuOUxHa0Q2ZlozdUVMcTJu?=
 =?utf-8?B?ZUxXMkFrWTQxVnFvZElEVTI4b0pzQlpaRG5IZ0kxcXlWWXE3dWVlcVhTdi9s?=
 =?utf-8?B?WkdaTVhQZG1nd1c5Y0JaclZQSmJIM3FGdll3a214bCtWVmtOZ2V5VUd5bkZD?=
 =?utf-8?B?ZlFRSmZuVVJQaG1OUkNwUDN4TjhOTWwyYUVRa09BY1J3bTZKeFJ6eWw0SmJt?=
 =?utf-8?B?eHZpL2p1dGRFSE1ldUlwdWQrNEZOTkhTaU40WFpXZG1HeUg1b0Uxb1hrOXc3?=
 =?utf-8?B?QjROcCtGWkJWSGFwbWsxU1ZWeVkvL3RHaWljVGQ3bXA0NW16Q28zc0NmendO?=
 =?utf-8?B?SEU4SUhCeGxZdkI3UTVScWFmaHgyWlJVSjhTZGp0TW1sdVdQV05BQmRhM2ND?=
 =?utf-8?B?WUlUcmhzVmVqMVhxSDQ1Ull3OGVYUjU1cWVnMmdUcmxXV1lPSkJKYkduR1NV?=
 =?utf-8?B?endGOHFkNEEzSDRhT2dXcWNvdVB3dDZmdEtJUWowVTVma2F5aTNxcUk2UG4r?=
 =?utf-8?B?YWR5T2RyblI3OHNUNHJ0bDRXTCtORlpCSDNkWU1FTW5XaE1pQ0l0Y0FzTGtC?=
 =?utf-8?B?Y3djRExzc0lvaDIzblI5TGhodk91cm1LeEVSdz09?=
X-Forefront-Antispam-Report:
	CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.1.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 18:20:59.1158
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f1f4ea4-4053-4177-c45a-08ddba5e5d21
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.1.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB75.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR18MB5722

Add binding for Axiado AX3000 GPIO controller. So far, no changes
are known, so it can fallback to default compatible.

Signed-off-by: Harshit Shah <hshah@axiado.com>
---
 Documentation/devicetree/bindings/gpio/cdns,gpio.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml b/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml
index f1a64c17366500cb0e02a0ca90da691fd992fe7d..a84d60b3945952a1991492064ae6494df91c966f 100644
--- a/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml
@@ -11,7 +11,12 @@ maintainers:
 
 properties:
   compatible:
-    const: cdns,gpio-r1p02
+    oneOf:
+      - const: cdns,gpio-r1p02
+      - items:
+          - enum:
+              - axiado,ax3000-gpio
+          - const: cdns,gpio-r1p02
 
   reg:
     maxItems: 1

-- 
2.25.1


