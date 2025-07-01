Return-Path: <linux-gpio+bounces-22541-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 016A3AF04D1
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jul 2025 22:28:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C84DC484559
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jul 2025 20:28:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDA342EE962;
	Tue,  1 Jul 2025 20:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="WuoBUbIU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2132.outbound.protection.outlook.com [40.107.223.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45BB2EF2B4;
	Tue,  1 Jul 2025 20:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751401675; cv=fail; b=KRk/UPeoPffFZBxogPXNTzKECyDIoD1X8f+vi0iLNQZzf0pl6f67DCzalq7fFg+em5SHHvyBJ3C2RVQ/RnmnNln648e+3pcFzeBlieRKacUi+tPj57vNj4iMAAg8Ze5/NfNbOqhVEKsyYjoqbSIlEWfDwK9r3zlM4pijzjguWoU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751401675; c=relaxed/simple;
	bh=+LkKLNtqktZs6BJGxQlls9eAbfyJLYkPhSllbV6tgWc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WOAMekbZ2ZZE7qx5U2Kn9t9AAHukgIGS/R5GRBvfC/aVJipryIDV7HIYRf5T/aZglXTZ/QTB1gwIgpi5u7+Os2t59XGp/XZpy2R1GIDfMA4Fty4bDtsVqBgeU4l4KZFsEGTmpJqfRge/C4EQdXew8Rza6+bqTpkvy0NGDssVCt8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=WuoBUbIU; arc=fail smtp.client-ip=40.107.223.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oX1GvxZ44Vh5tbXY8KoDwyBBdZm88fh7XKW+tdBYYrNE6KOJQCixt+wWMXL4sjkY9ylewbLIGeTL5owg3ip+A9itekEWcrcG2q31OgZRtcfMM7HYvvq8/cVxEiGH9ADw1nKcsZSqYqMhWzQENQ4b4v7+tVu3zP6hporoFqrZPWoGd7lnoD3jpmpDR9oHDi4QI/B+ZpGiNiLkU6S4SMfd1+nz9KN2YJu1kzhw1FYuXYTcnlVBxW9ISixn9vA7eMwdSmcKQItO/tfE/vDh7F8ZPuWsyPVrvSwcOIvQi5r0jXhx1c9u8llo1pIB4zC6F6A3+7btgrxtZX24TqEdEmY+ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=thl99V5yXVMyPjXj7U7dTdtpXeFku2vCWOdg+nvR78Q=;
 b=HJxxitXgP2eKJd0MhD+mzTaA98Q5TQPs8QXOyHQKm6a7A3OXBFQl3YY0WUZ5cS5bjnrLGVY/UpNfuUFbWIpjpJ5hTf6dzhXsJNMyeb2w0y3m4qo+6WFVUAVej4R68KuhEWIt1iflxD/9b/zAWt7PakIUDdrJBMIfsY/6Y9czhh8jCgmGMNmTy/1TieTqdvoCFObpSP5zGcWkf1PS56qsvq4uKylQENmT3gpBDIIOSkRLmkKrb+tmiIRNEp1vA0fMjnIVQu4vRjWy/e39v4jU7qrJdk5uxSgkRwKy5BYMich0KUFHgxrrZBL5FGhVWeQ5mjoq+3oJRPXgNDCswvG4tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=amd.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=thl99V5yXVMyPjXj7U7dTdtpXeFku2vCWOdg+nvR78Q=;
 b=WuoBUbIUAaVCYu2XmN1HBLQBRW5XmXkxJ+1EIkPD4rZYAJq60R4Klwa+7jS5UpLd49Deu67tHV+ft8onD0+U3GgLmUo4cSvJA959vpQl/ZG+WoA4Sls/l83MjqrBDgxrYVAhA3XUu09ovcOGpE6mkfxCi53q0jeCHxptzY6AhW6Gg49IBHw7mC3Hf1JxqTnOoAnKSR1BhUCTPZ3M1WNJzVDzhZvzHDu/fXoCBRgfY9QORqRfnUXlwmzwKhHMbfNju1TT5nXJQxD+dZv6yY3YOcQElYvcr7Cq1PBxrBiIyBLWX4YQqoEoWj7WeNn/s1gbcnuSvzkmuxseVw2Qt5mBuQ==
Received: from DM6PR14CA0042.namprd14.prod.outlook.com (2603:10b6:5:18f::19)
 by SN7PR18MB5263.namprd18.prod.outlook.com (2603:10b6:806:2ed::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Tue, 1 Jul
 2025 20:27:49 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:5:18f:cafe::b7) by DM6PR14CA0042.outlook.office365.com
 (2603:10b6:5:18f::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.20 via Frontend Transport; Tue,
 1 Jul 2025 20:27:49 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.1.1];
Received: from [127.0.1.1] (50.233.182.194) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Tue, 1 Jul 2025 20:27:48 +0000
From: Harshit Shah <hshah@axiado.com>
Date: Tue, 01 Jul 2025 13:27:27 -0700
Subject: [PATCH v4 03/10] dt-bindings: gpio: cdns: convert to YAML
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-axiado-ax3000-soc-and-evaluation-board-support-v4-3-11ba6f62bf86@axiado.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4292; i=hshah@axiado.com;
 h=from:subject:message-id; bh=+LkKLNtqktZs6BJGxQlls9eAbfyJLYkPhSllbV6tgWc=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBoZES9aoPy7H2GXF4kmTXfOVl+diAoFSnxXBruf
 HBOky6cYZyJAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaGREvQAKCRDxWHMRoTLV
 +4mgC/9pcSCdImApvwYfe8fsulDRCFsbHItSzt+Q6CZSv38Q9ZD/P5CDF9PXcVfYvv9uqv4qf+f
 Hcl1u0eX9JOMAeFuHPsA715AriKSi+vXu7WOZi1/NctJ14pWw7Bpz99Po9edmSpSi311fZC2y2a
 4lOY4sUcDytFF1qppHOaiIM+yoPu01RxXDcGn9kekvwk1VlC5rzM5zdvCUwQ90+9Iohb+kZ2hpS
 YDxLpPOj+LVY4K0RvoyKqqjiHIWwq+mT/WxTlQeTDVPNRcP4Gw2rI+2LHeC+GNLQYNBoRae4iUz
 MHpkBsRq1BoSm/31iQAbVBam5okPC1cwByQmlzRDN2aiymehBisaJy0HvgQjhiMrKUN6ljbFvln
 OwjvzB5kT6npxUJ1QNkBVeoJh7TN/a97sNO7f/C4YsW3apdP0nmvjrjDva8GIttisg4Ismdsh6+
 uX4KCXjDni2v5mmepXeuVwvPvKE9ZHI9L51Rty+Qtx9LusPlWQRmcHmy7SmuaodbdZzik=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|SN7PR18MB5263:EE_
X-MS-Office365-Filtering-Correlation-Id: 9714e4f2-a129-43d7-b2e2-08ddb8ddbf70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700013|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OU9FME44dzhValZuNklqUW04Y3NPeTZGRElzeGRUeXY2eS9BZytCdGhjR1BR?=
 =?utf-8?B?WitQbzJyckZBa24yL3FiR0xxbXpYLzYyQXNUR2JiZE5OTlpsa3BiQ0o3Wmlv?=
 =?utf-8?B?ZE1lWVBBVnpOKzA3VlJqaU1xOFF5Y0sxM2RTQTdNLzVOQ2lFTUFWQkE2WnRp?=
 =?utf-8?B?ZWNHOWRIRS9SZ1JwMVl4bStwbU5FcjZDOEsvQjNvcUxiTzZYUnd0Z0E0cGlq?=
 =?utf-8?B?OENGUjRSNEVKSzE1eGtZeFJGeURJamtLS0VobUs1Rk5KcHVuZTloZHFRam5N?=
 =?utf-8?B?b1JTdVdCYktFaWNuQnUzbzM2STV0dy9zUFgvZEZHdmRBcGFqTGZ6bHIrdTkr?=
 =?utf-8?B?aUtmWVBnaHhOaHNUU0MranZhZXhiK29kbGhGc21DZUVrckJFbFFKRHRVT25D?=
 =?utf-8?B?eUk5VE90cTdvL2Z5UFhtV0NkT1pic2Fmdnlyd1h3bnljUVZlRW9GTnVld1M3?=
 =?utf-8?B?dUJvUVZNWmNteEdtRndIeWNjVWt5YWl5azQvWk03bnZxenRac0daUVdUMjZB?=
 =?utf-8?B?NEpDTWNSMVdaNGtlMDRJamJWWWw1dzNpV3JrRjRZYUk1TVNPc1haTUp4TmxZ?=
 =?utf-8?B?MG5PSGVlQ20waGt0dVJUMVlsd3VYU2pCcmRVam5zVHV5KzRHZlZiMXZjaHp2?=
 =?utf-8?B?WjlWeUZmcjFZZG9xclhNblN0Y2c5cGdJWWZpZ0xpOGpzRXY4ZG00aUU0YVlT?=
 =?utf-8?B?S2dvZGh1UXRSc3pWcFRzSU1KNjNuSGlwTzlOY1YrVGpIeUZlMndYSzNneFdn?=
 =?utf-8?B?eVFKRTcyTjNkM1VUamRnTDBzR0ZlU0Z1Z2lIaFNoSjFaZnZYbzJSUG04a2FV?=
 =?utf-8?B?RE0xb2dqVllPd2UrWUJqSDdxdEw3cG56VWxPQm5xZjBYdGczM2o5eE5Tek9L?=
 =?utf-8?B?bVA3c3pjczh6dHVBNUdoR2Y5bmozVFFvamFjd0hkRTRXUkM2M2Zqa2puV01m?=
 =?utf-8?B?RkFNM25jcHZVd3lNUkE3TFFNa2VJWS9hUVZXSy9QR0VtSGpjbjFqSmE1SDBu?=
 =?utf-8?B?M0xWTTVzK3hDaENDbm12dHYvVFp4d0ZENG15eFRkczlxd052eGhOOTU5UDZL?=
 =?utf-8?B?bDh4ZnhjNmF5L1o4MWRVY2ZBcGl1VFphNjhOYkNDb3A1amFQMWdnRW9ocHlW?=
 =?utf-8?B?V3JyQnU2emp4dGtTek1VaVVsdW8yUlU3T3lxMGdLa3hxNEQ2YUdGZ1UxT0g2?=
 =?utf-8?B?NUNuRzhpQjBrMXJjZTB5SU9nbVNwUFRTenRGQ3Q1amhFM1ZFQ21SRWxia3hk?=
 =?utf-8?B?WTVzRDVubHhnOTc4Y1RKcWk0QWpna0x0L2V2K2dnLzZlMEpBUUxjWnluMmVv?=
 =?utf-8?B?ajB3VDZtMDV0Z04xbmNXL01PUnBndXpGNlNvakM2UWtXcjdSeTNUeUZxVHpx?=
 =?utf-8?B?Q2hqam1FQmxEODhwQnRTaWt3YUNKd2hDN0RiTWx1QXNzV3pQcDF5dUtPejBv?=
 =?utf-8?B?cUtRSSsveTRPQVVhcjRHblJ2SFlpLzBkR3B1aW0vdGRiOXlnUjNQR1hkV2pC?=
 =?utf-8?B?b2ZZVkRQTEE1SjhDSjNTYzZSaExZbjJRMDNnVDIycWVNSmtTTmxNcVNtdlEz?=
 =?utf-8?B?WnEvZUoxOTFZVk50RjIxNzkvY043TitGZ09XQmcyTGhjaEU5d1h2T2t0d2tW?=
 =?utf-8?B?RWJxREtCaHd6UUd5L0dTTkpPQ3psTU5TVzJlTTZTZXdIUTlDQXRaeE1pb05K?=
 =?utf-8?B?K0pqUWFITE9vZGFyazZURHJ4c01aMjBiQVorTC9jVllVV0x3Vy9SdFdpTnpa?=
 =?utf-8?B?RytxYmtHL1doSyt0ekd4elV1N0I1MTZhUS90a1ZmWEk1Wjg3Tk43WWFGTlov?=
 =?utf-8?B?RU9UV29PQ0tBSzRieFdOMU9leDFlUytGdjd2NG5YeVdJMjlkMU5ybzA1WSs5?=
 =?utf-8?B?Vm5FajB6clFSVVFrbTBwREhEMDI0WmZzQ1NFVCtCM0liN1NCR1BQQUlFRFdm?=
 =?utf-8?B?V0NOM1F2MENCTlhIZTIvVmNoL0J5SXd0SURYaEozdkVRRmJmMHU1K2ZkQjVT?=
 =?utf-8?Q?mw9l9FQbXHCxYiIAliJc+qPQAGagqg=3D?=
X-Forefront-Antispam-Report:
	CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.1.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 20:27:48.1710
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9714e4f2-a129-43d7-b2e2-08ddb8ddbf70
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.1.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR18MB5263

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


