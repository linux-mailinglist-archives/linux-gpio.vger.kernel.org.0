Return-Path: <linux-gpio+bounces-22538-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3D4AF04C6
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jul 2025 22:28:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 637161677ED
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jul 2025 20:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F0C7263C6A;
	Tue,  1 Jul 2025 20:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="ql2KdHXl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2120.outbound.protection.outlook.com [40.107.237.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825942EE263;
	Tue,  1 Jul 2025 20:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751401672; cv=fail; b=UGuOehTl9n36UBL8JWYqWJXfhN8vfyUjBQYkFgCp0HaxmUYZPwi7uLY2YxAz/UBo/QwpSq/1cJwjXqikTA4JdbNnjGWeLpIhpQ2ZnmVj/t6delaAF8uvTwHfZtixguTraBAN2A2fAvISOI+o04Lq1+SnQ6fuEOnGhjQUsfdalFY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751401672; c=relaxed/simple;
	bh=76okLidoJP6XC526Dh0oE+YzQ6GEuPrslK8PDO1ML0M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VDJV5VotvKytDREATwJ9JwI92e1WSoZHU/fpwckzLwOSStpAXQsjD7qP+L2aqINjmsgeTS8Z6ZWkCqfpmHI7jRtz+Uu72Prh6lZRgs0IjCQJabFZ085cuXagFDLdEWeT+vrzIge9N9CcXOOe5R6/Gqf9lU89nxK/EDB9uzfYbEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=ql2KdHXl; arc=fail smtp.client-ip=40.107.237.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rcsSZBCrQayKU36jHu/Df3UVNg2aibUEQmPskTq0dNQ/d9CXgsfsJiRZ3o/DZVmOenB1f3iqTE5S2BPSXP7qlP+zShf9S/r9WFo2wLjSJPAGE5poW5zdp7QW6FpZb/YVZMreAYvSLa/66sXuD/GVe8yBrLm/86HZfW3GAww2U68nM22hRvxM4J+l1IT7+CvA8Duer2BSFyeUXMA8jjlZTe0ts/F6wE9RTgnOplajjGpJMMqt3VImJsLrecl56ujm21A+o9vSPnQJNc/yw2vRTFvHerU1l3JHBzr5XIxMck9zf2Ow6re7IOF3MNcjz1aOcfCSLUqZmHvpbEun5EqOvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fC1wGXkjTgm9sdaH+SO0MwS6z+c/SPQ7G2aTB/7FYSg=;
 b=IX1HFVA/+/xF8ChL9SfrP07AaEiRu3Nw/0DhQoE/NjhuQA4HGdOAQeSNxpUHfRQrT9ppkS3uoUEBl3+krRN25iHmbCDU0BMiOLWbktp5VCo8d9l5Yz1mfZrq2u2IPRckyEDFrtbTJGejcyLNKDS4096GxlqIMVqMO4+q8MGxsKlWAJ5FOqwCfMAPnijpqh808B0447qmgNXaQsTWMeDwF883ITgiwbE3MjHX4EUANW6fG/FvbuTBZ+j3c02Ujc2ZoK2JwIC3+FTaKtHv6bQSHIodiwkcEV1tyFhS/uUM2bUYRmA0IpoMMGpKmuR7kyc/Rmzhu7wAmqJuVOJmbk4f3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=amd.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fC1wGXkjTgm9sdaH+SO0MwS6z+c/SPQ7G2aTB/7FYSg=;
 b=ql2KdHXlGm0zmQGRNO7d6DiNehKMDdJznEDcAGSnobhI1a0WCxfEVIUpI6AJOshaQelY+6yY9mjpDCiBEXcm9ipR5GINtJNIF6YvI2R4/Q+KwQhUSsGcSRiqqsRj7h6+rWlnvifljmPwzenfpSlev0zzpzDaWI2usIh++swhVDkEs7Qsf+ZayAdJlVZaQHI0TARdqjOcr7fErEO5NlFkoRX3heJn8lYfaoTQqyaf9H6kMtzBQfccyxd4gXNLIRmI5z2oBxTPVODBNTh4G78jJR8bDtMWIV0nmjx3qcvLNL+BENwHjMB+FLlrZKkdtEjCbHvq/05ICfAHvXUQFYjXxQ==
Received: from DM6PR14CA0042.namprd14.prod.outlook.com (2603:10b6:5:18f::19)
 by SA1PR18MB4695.namprd18.prod.outlook.com (2603:10b6:806:1d6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Tue, 1 Jul
 2025 20:27:46 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:5:18f:cafe::41) by DM6PR14CA0042.outlook.office365.com
 (2603:10b6:5:18f::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.20 via Frontend Transport; Tue,
 1 Jul 2025 20:27:46 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.1.1];
Received: from [127.0.1.1] (50.233.182.194) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Tue, 1 Jul 2025 20:27:44 +0000
From: Harshit Shah <hshah@axiado.com>
Date: Tue, 01 Jul 2025 13:27:25 -0700
Subject: [PATCH v4 01/10] dt-bindings: vendor-prefixes: Add Axiado
 Corporation
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-axiado-ax3000-soc-and-evaluation-board-support-v4-1-11ba6f62bf86@axiado.com>
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
 Harshit Shah <hshah@axiado.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=878; i=hshah@axiado.com;
 h=from:subject:message-id; bh=76okLidoJP6XC526Dh0oE+YzQ6GEuPrslK8PDO1ML0M=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBoZES8R3pd/brlUg8PpT6w/7N0wr5VLWnHC4o+A
 7CMaRVkeESJAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaGREvAAKCRDxWHMRoTLV
 +0IlC/9UBV8DlPtbWvQ5faIU4I0Qtc1CqanZtzeHKW/2UfqILbTID436rObG//r49Deopkr1LnI
 bKP1gMQV1SVnxEbmHEvvWUhiqIIIjsC7ucr8vjFZAERaJxuNvt2vVz7/p94GjmnBjG+OX08UOwx
 lELUd5d/SjpMaNNBHEvW+TYDJ8e0fedQcN3Yoc18bJr42cY+I5o9ztw6VQsHjWlhWbkDip95OZY
 TH1slTknWNYH3QJaQ5TzfKb6gtxPIv2TQx1dU5y18dRprHspvzHt2Fd8xcpk/V5YC29EzeDjiZH
 Knua8X4WibL/Eo70WNh5nUTEVBK6JpAtY9el1wEL3f3+7DPoJsylDKuGKfT7wIKuC/HAZRRQF9E
 HasZCKna+SaBl1rEOx6xA7qqycwHkaDt3Ckzxe7V0t0KepJmjaMi4UXMKbdmCuTVIZKCwDqpEa6
 XVZK0cvuyuMFQ7V/UF9+sl+1vEzcal+1wZ4y4w+bKJIh0VZs9HellM/PCNoawmpI/8dXg=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|SA1PR18MB4695:EE_
X-MS-Office365-Filtering-Correlation-Id: 28968446-1342-4ddc-110e-08ddb8ddbd6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700013|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?enFydFhENTVHem0wMW5TOG5EVGtjcnk5RlNwQXFNVWRHZVlXbjh3ZEdRcStU?=
 =?utf-8?B?cUtadzA5Q2JzTEk2K3NSVFB2Q3ZUYzZJR29CMWNURktzWnNwNWdra2w3c1Rl?=
 =?utf-8?B?ZU9OeHBOQm03b08zdUFCTXZPMFpqOWtBd2FXbWE2eHRpcXBpdmQ3Y2RFaTRI?=
 =?utf-8?B?ZEFvZ0JOU09GTkNLSHBMTjBFZm9DdjQ2RnZvTUhWaE0yWG9WL3dWekdxSy8x?=
 =?utf-8?B?Zmp5VkdHU0dFTjVUTlA1UldJOWtKczNmcmdtaVl3SGM0YUhGTDhHZTdjZEVk?=
 =?utf-8?B?MlVsUEpDT1ZXaWRmOGJLV1lmek1TWmdUK0lBQmQwVlNSaTFmMXBaMXV5OGp0?=
 =?utf-8?B?VXNFYlVaOVJmSURGQWI1eFpZSFpNWnZnRTB1czY1b1l3SGxlNUZrTXI0WS9t?=
 =?utf-8?B?b2l0OVBCY0g2TnYwbnJ2azZwcy9PRzE1MWd0K3NwQ3JkS25sak5tTnFHKzZl?=
 =?utf-8?B?UlFXZ1RVMUNYQkNuUjI4MzBQcTZ0Mk9KZ1hoaEtuM01SU1RObzhQam5zTGFL?=
 =?utf-8?B?anp6ZlVwOTZITHp6MUkwbEdobmV4M0JHYXB0WXJ3Q2hmajlTbm90WTc5ZFl2?=
 =?utf-8?B?ZTVxdVc0YzFDU2F5WVAxUnI4RG5LZXhaYzhpZVZ3V1lLUmRUcjBKdllkMTBH?=
 =?utf-8?B?RysxM3NBMjlmOHhoQVViZjZCb3N2bWt0NDdxVndJRTZ4SjBvdXFheEFEWDU2?=
 =?utf-8?B?WkNJZm9wQUNOK1I5T0tabDdmUUg2NmorZGluNU10NlM5V200V2Fqbld0STNt?=
 =?utf-8?B?OTVNTDE2dU9zZjNjMldqTExZZ3IxZ1U4ZGIzNVdvMWpXaEVRV1ZLazhXZjR1?=
 =?utf-8?B?cFFsbDdPbzA1ZHEyeXd0K0JoVEJ1RWQ0Z0FjaU96SWJxQUxsV3d2UTVrczJU?=
 =?utf-8?B?MTdZUlFmY1ZFcVZrcnRJZWhRZTJPd3Bqc01NS1pVNXJpMENWMHhYcXRsSllX?=
 =?utf-8?B?em5La1NNdk1aTWNLM21lYS92TEVXeWJHYkZ0YU5MSWVUTWNFN3dOYk1nZDFl?=
 =?utf-8?B?QjhTYkg2Z29qSGk2Q1JOUExvOUYxMlBYa1M4OE9jWUhYSVZ1NWFrS08ra3BX?=
 =?utf-8?B?aldGUXlZdWxLOWtwc3ZJeHpTLzIxZEkvbjNTemtsS0c0aTNpTEFuOTJHLzRj?=
 =?utf-8?B?RTExOFkyeEFqRU5keVFNYmVSb1hZcjV1aEdHWjBuR3dFdHluNDFvR1E5ZnhT?=
 =?utf-8?B?NmVSMlZ0NjVKYUtWaG5tR2QxdWd5eW5rMlhQTEo3TjE3eE9XQ2JEd21IeFRs?=
 =?utf-8?B?bk12S1hqYy9ZK0NBK3FxblhLRVRneHJTMU10STBlZmdSSUNwL21HaXpjc3hW?=
 =?utf-8?B?bUhZa2UvQVFXazBzdlRYZURFdVpFRUpJdDNSREhkL2lGS0JpQmxVZXBMWlhP?=
 =?utf-8?B?clg0VHJLa2p4L3lvdEgrdTFNMnNyamhqU2J5MXdqdi9yc0thNWJvNkFNVlY5?=
 =?utf-8?B?cGdvKzdveVB4M0FsT29jc3JWTnUySHdveEF3Q3l3RWFlZzFsRnlQSjFtYWlC?=
 =?utf-8?B?b0wyR3ltdTRlOWtoMU1PZ3JhdUhnVUlFL1Q1SWRXR3F5eEt6YUdrZ21aazM4?=
 =?utf-8?B?ZlVkRDFXT1RUQm5wclQvbDVPZ2xqazdoN2VRa0FmQTdiR1RGMzVEUUNwc3g3?=
 =?utf-8?B?LzltakFwaEROUjJlVUtBNEhZOHZpdVA5K3BlYzRZbVdrcXdrSWdWTmdQaVFK?=
 =?utf-8?B?MnhrY1dtZ0ZNZlJwWStYRkJvVWFuNmdnZHRYc1AzbmxiUG1lSU43dEg1blRw?=
 =?utf-8?B?bU44OEFEbEhaVTQydGNVYy9xZmF2WXA3Um83YzlVQWpsUzdhci9JVHNUYU5m?=
 =?utf-8?B?ME4vSkVRRzFGaElmWDJKZFQvWVRVV3h2Uks2aU1ndVloQWY0NnltR2RWM2R3?=
 =?utf-8?B?aHFMaVJINUV5RXlyUWRrQ0NjRjFMVkJCZUZCcCtuVHN6ZlFSZ0RuamdUYjBs?=
 =?utf-8?B?UWdUdHZ3dkpSejFiUWZZVHFiMmhkZTlWYUNXeG1zUFFpU3dMOHBDQVhCa0JO?=
 =?utf-8?B?U2JUNVNGUjN3PT0=?=
X-Forefront-Antispam-Report:
	CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.1.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 20:27:44.9629
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28968446-1342-4ddc-110e-08ddb8ddbd6c
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.1.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR18MB4695

Link: https://axiado.com
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Harshit Shah <hshah@axiado.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5d2a7a8d3ac6c666c8b557c2ef385918e5e97bf9..5ada930c79e3b32ff1bf194ee66bb4bdb08d539e 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -200,6 +200,8 @@ patternProperties:
     description: Shanghai Awinic Technology Co., Ltd.
   "^axentia,.*":
     description: Axentia Technologies AB
+  "^axiado,.*":
+    description: Axiado Corporation
   "^axis,.*":
     description: Axis Communications AB
   "^azoteq,.*":

-- 
2.25.1


