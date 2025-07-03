Return-Path: <linux-gpio+bounces-22753-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C70AF7FCB
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 20:22:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1BBF356661D
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 18:22:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 027F22F4315;
	Thu,  3 Jul 2025 18:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="rGOyCGqZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2099.outbound.protection.outlook.com [40.107.92.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9822F3C13;
	Thu,  3 Jul 2025 18:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751566871; cv=fail; b=eFBcaeKBjBMpUqh9Q9fOYott4nXgHtGOt4e4UyFFsUsQ9d0bYCMsN8cWd3qAZFKZ6px6bSfGFwcun3yZIACXoE8zDoys7Fh+roqNS7hCZHNohtLGKnpgkXidfYpHvDu9jG0QJAl/O+HgEoP4N2DnSjGqX6V/SV36CMCMsuvVRxQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751566871; c=relaxed/simple;
	bh=oqOLnsGva+wPWKBV0xaL81/LgRPcT7TGX2bClTkgOcg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lq2dR4RJJJ7PMcF4vBFz+3yJhBeeOST9ewvpkfTM86HjWy7ITvAgbWZourcoUIDrM++oFavhJJEymCubnRHcjFwiTAYecP7Tnl9fYiyOf+o3vCuJbZ2QuPAAHTRJW7Pqriy2aynariTfngtJ/NKzLFlv8jJkUjiXV9AdHqLalU8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=rGOyCGqZ; arc=fail smtp.client-ip=40.107.92.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pBOiVcfxhcTjFlb0BW0b4voxpzBwMbR/Rwtc50O122W5219V80BA9iI4uGXL/LNBd39xzviGXi8Lfd34DHiFCoa3V9NO1EujA8jrEig1AEzcEmWqjvUFvhPe+EGYwA9ti86b7+C19bTPC+n4DhQe4UNxsqh7v8pDjGa0GvBezsUFSYgA3vfYtYTOvNM2WAoRCN2zXZMJPhh60pz3V+DKhknyfiq/YCEIjk+C/qd5bNyJLJRgEylQz4FFqtm4VEMwsOkwlQ4xSBnDfHO8CfYIY+xyEACAZDXifrvkd/em+g04cwhm988yPfLcawXuju6ohkxpv0vXBOrLj0A7rIaAqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f7lcAcGYGvrReVuHrp2eFsA2+XgaPwSGUTAKG89xnGI=;
 b=ptQzhMS1wtd0P5MRgBx9TbZMiTWX1Xl9xqaBQa2ls3R6ETtTTgxN88J1EfbXb+Bece9JvK8+UNZA6Oc3WNyVWT9bQdy+ku/ROK/tpfTuYVBtUp+ONFIFJSTPpN94QdnepCg6LkTWuQ3ccuPbGAzvNgI0PLMPOTQjgjhHeQJhh3jHQUoRB6N2Senps74K78spwUpx6vNH1QYh4UkW8s/QDqNUXvl8dYz5VarFD1BmwVLe6iOMZdAwHxzlMEe1Y5ADk0Tjjw20Hc6qvj14JDukCmbtc51MABN87L9OmYcIy49ABiFLQLrmB+U8cft7/F3yb6HG0dEuwuRqsTrUqtCU3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f7lcAcGYGvrReVuHrp2eFsA2+XgaPwSGUTAKG89xnGI=;
 b=rGOyCGqZq5aqQBoDm85Y7PXzs3/mryqDAS589hiqfmDgzKOeIrWaNDOGi0A2xTsH+cl95ZyjdN1b6I/DOEYBJuIa3+jmbRY+Xf5kYXZofDoeq4rkG5okaZHSAA/sDMDmfz6QX3PrEC3McuADOXf5wpRoIifzFytUpNHpPCZBl5iulR0qLFsmAHwAQ9euQselMt1ooxinn34Iows+eRipqE+UjQwqVqZNowRNC/7n45Kldm7D40gbbaoHvc7o8ePT0XDbTWEoJ50tsS55AXdhkxVUeh//V85p1rNOcd4w0HEK7vizM17RfNweyc4xKBWlgTpC+wiZbUOrqdP2gTBL4Q==
Received: from BL1PR13CA0327.namprd13.prod.outlook.com (2603:10b6:208:2c1::32)
 by MN2PR18MB3591.namprd18.prod.outlook.com (2603:10b6:208:264::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Thu, 3 Jul
 2025 18:21:05 +0000
Received: from BL6PEPF0001AB75.namprd02.prod.outlook.com
 (2603:10b6:208:2c1:cafe::6c) by BL1PR13CA0327.outlook.office365.com
 (2603:10b6:208:2c1::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.12 via Frontend Transport; Thu,
 3 Jul 2025 18:21:05 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.1.1];
Received: from [127.0.1.1] (50.233.182.194) by
 BL6PEPF0001AB75.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Thu, 3 Jul 2025 18:21:03 +0000
From: Harshit Shah <hshah@axiado.com>
Date: Thu, 03 Jul 2025 11:20:48 -0700
Subject: [PATCH v6 06/10] dt-bindings: i3c: cdns: add Axiado AX3000 I3C
 controller
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-axiado-ax3000-soc-and-evaluation-board-support-v6-6-cebd810e7e26@axiado.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1008; i=hshah@axiado.com;
 h=from:subject:message-id; bh=oqOLnsGva+wPWKBV0xaL81/LgRPcT7TGX2bClTkgOcg=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBoZsn/cWHY+iKm2lNeTooGrq+q8khAPlO3Inw0y
 oBqivAixh+JAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaGbJ/wAKCRDxWHMRoTLV
 +84fDACGKyLFDg8PlV0zKfaswDtqnUPAm/AS5OUwC29beSejtOW2Xgfo2WgpvWsB/G83eyv/LJH
 M+NQgTWRFVGyJC37gUAv1pYJ1n6EHICH8ccLv+p2g2a9DPiDbeDHCRSS/sUMtTSqZh7Ft+tH0X3
 rR/VwIFPlcIuaWHhMeawaXQoBJtzaN/4iMqhgENjYNK/YlKou20kggCRqmJWnBeOp2CWyNEZMPb
 oSjgxNGUAHF3kpddqgZ8kE2imotulniCGj63e6E4FFxzlhTpYSp+7PsynLwSfd0td2/P6n9R418
 +H1/Y8+768tNTiGLW6xWskd7qG/epaUEGBn9kOeeeOp8KCL4WNgPRN8N4uaeNYtozmzcGhtQKuq
 i/mO2vVZ2et1Ii0rqPPl1gI4rSK7M7I6OaC4N2beBixoUAqGtY8ec+v1a/QYL2QZvsjRAqRn4ab
 RuTivmiq97lFD3v0RF/fanQXTwNLiySiZmGutD7s1Gp2+GgtBtRXqU0ZCl5eRBQhcueJg=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB75:EE_|MN2PR18MB3591:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c739af8-dd18-4193-e671-08ddba5e5fed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RTF4Q0xlczYzeDFLRHhZUXhjQ095bUZZNEZ2ZFIvQWlkYXhhYjBLN09xT3ov?=
 =?utf-8?B?V1RzdHMvMTBMTTZIUUFxamNiKy9jalJQNEo2aTN6MnppU1QzRkNBYWJWTjNN?=
 =?utf-8?B?UzV3NDJEQ1pqeStQTk43Nm92d2RUbXFyLzdXQXMrQnRxMXM4WTAvT00xeVU5?=
 =?utf-8?B?QVJPWEZyTjR5dk9aZ1hxNWRCcHhVOHhka01qSWpWN0tqZVpnOFppa3E1c2lz?=
 =?utf-8?B?UDVVYitXbjBjTVprL1JiK3lsNWZzWFVkdHNhOTlNakxBYThSS2MwbDJUTXpD?=
 =?utf-8?B?VnNEU2FLTVd6U3VoV0JFVzVBSFR2WGliQVpYVGNUcUVyM2RWb3ZtS2ozbjJx?=
 =?utf-8?B?T0c1azh5c01uMGY2Qko1MXpvVGtiZUsxYnpiaERoWENNU1oxamZrL1U1ZE4y?=
 =?utf-8?B?WGpnbDdnRlVhZkxUOXlkM2Y2OWU0Y0ZZWVA3M1JvN0RTOEdzTDljbFY4NC9y?=
 =?utf-8?B?MnhtWGRsZ3Z1UHlJNldDVldXTmtKNkpBaXZxckM4TW4zYVUvdTJvQzN5V05D?=
 =?utf-8?B?UzF2Q21UdjM2eWQ1VkhVbVRvdDc3YnM1M3JlMFlONUV6WnE1NVpCQ0QyNmRw?=
 =?utf-8?B?MFUyOVN4R0ZiS3hHU2RhVkVqYXM3YllSTHY2OGF6czdhOVlycmI2Q3JCa1kx?=
 =?utf-8?B?cTl6dnk1cDNSdlJtRUdISWsrQ2FQWStZZnp6YldKeURHQnZZYWlHSCtsL1ZF?=
 =?utf-8?B?cVI2YTNyM09LWklZdDZLdHNtdkxtcGNyZzFkS0h2TCtZVUlHOW5HTFI3Q1dz?=
 =?utf-8?B?NStsdnlyUkowQWM3QlcxdGRVVThLa1VkbUJ1dUdYQ1pPS2tsT2pCNlphU3hT?=
 =?utf-8?B?SG5QRVcxMGhKdFdPbGsraURNR0tCVEhQSnc1MTVkN0V6eTgzcUFiMUg3SHYz?=
 =?utf-8?B?N3F6MHoraWtUaWIvN28xTVlDWFFwYTkxZEhHZ241cHFTNjd6cHd5bjNEakcy?=
 =?utf-8?B?c1R3dUZiWWJnVjFGRFBiVDRBV3Y1dWlXb2JPa2ZuNXB6SDJCWnVmTjhkSS9R?=
 =?utf-8?B?aFZaZlhaZEcvM2VrVUUyR2tlU21scFFLSm1YS2VHUGdpWHNwNndZRFpVd2dh?=
 =?utf-8?B?VTlkd21ac1V0cDgwVVFQWkcyL1BaR25hcFd6eTcwQzFhK0JGa0NQUVUvQlpL?=
 =?utf-8?B?U01xRXpsVnpXT1dCazFzRXg4NWNxemQreTRxZEVYVzhZaHhxYVpuRkQ2Mm9E?=
 =?utf-8?B?WC9lNWc3OWJwNHArL2VVRU0rbGQrRGlmYm95LzREdFYxb2xYcHNoNFlkRlNM?=
 =?utf-8?B?MWhEUXl6c0xZSEN2N29OSFRYWUtkOEQzTk13elozc2k3THJ2ZTZocVNwVWJP?=
 =?utf-8?B?U24wWFc3Yk1DbGNqNTF1QXpvYzg3QXNCdGs0VndxS0JKWUJ4aGphR2cwZ3BD?=
 =?utf-8?B?eW9aZUdpN1lib3Eyeno3RWYzZ1NLSWRqUWd0Mm1LN2RuVlh6SGo0blpmTlVY?=
 =?utf-8?B?VnYyMlloaWhId25tdm1zMk9iSmdkbEwreUx2RmlOSW5lTjBIYm05UzdhV1VK?=
 =?utf-8?B?b1VJbkNCSkRPZnFmemlsVUtxdHlvazdONzdMejl6S0FKcUcvL2tNcHhuMWZM?=
 =?utf-8?B?U3NGN1BpcjlCVlkxa2RRTDl4WWhabG5Jb2w3eFRyczR5YVVvWHZHaHpIVFBG?=
 =?utf-8?B?QWpXQW81WDVXSFpmRHNGZHdYNEJ4T1dUTnhoSnVkUkFOKzNrV2JDVDU5Y0lK?=
 =?utf-8?B?K0xDaXNURXZPN2lmSytkNWNYM3c0bWRYNGZtdndoQlJUZTRSQktEb0dtUEJV?=
 =?utf-8?B?TWlnZElXSUlNemswamovV0ZHR21SUVk3Q1lpVjVlandMQjdCWWpyZDBYbGpu?=
 =?utf-8?B?cFNkekN0UDZFMEw3REpuZkdXSDVoeW5rdzM5NkIydzNad3hvN041L3JDaGNl?=
 =?utf-8?B?U1F3d0pQMWVHZ2JYdU9xa1g1dDRyd1U2TENGcTlzQ3crOWk3bWtidjZGN1hj?=
 =?utf-8?B?bHNYNmdid0tBbVlGVVBmSDlNMXFIRGl6UkQ2U2NFMWo0UTlqN0N2T3VBOUkx?=
 =?utf-8?B?cVQ4Y2V4V2NqZGpQclI4bkpwMW9YaVZVSXNNK0VYMjl6cnpGMmFZVjVQNHdn?=
 =?utf-8?B?M21UZHNKMkJsWDdBYmNkbE82aFB5aVltRzlqZz09?=
X-Forefront-Antispam-Report:
	CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.1.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(7416014)(376014)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 18:21:03.5574
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c739af8-dd18-4193-e671-08ddba5e5fed
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.1.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB75.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB3591

Add binding for AX3000 I3C controller. So far, no changes known,
so it can fallback to default compatible.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Harshit Shah <hshah@axiado.com>
---
 Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml
index cad6d53d0e2e35ddaaad35215ec93dd182f28319..6fa3078074d0298d9786a26d7f1f2dd2c15329a7 100644
--- a/Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml
+++ b/Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml
@@ -14,7 +14,12 @@ allOf:
 
 properties:
   compatible:
-    const: cdns,i3c-master
+    oneOf:
+      - const: cdns,i3c-master
+      - items:
+          - enum:
+              - axiado,ax3000-i3c
+          - const: cdns,i3c-master
 
   reg:
     maxItems: 1

-- 
2.25.1


