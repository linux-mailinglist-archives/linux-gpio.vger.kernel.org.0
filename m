Return-Path: <linux-gpio+bounces-21615-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 29700ADA726
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 06:32:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3867A3A8A5A
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 04:31:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36E011C1F2F;
	Mon, 16 Jun 2025 04:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="Rumq+mOQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2102.outbound.protection.outlook.com [40.107.220.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDA71A0BF1;
	Mon, 16 Jun 2025 04:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750048315; cv=fail; b=dTKPR14Cat4FtnPOUtjJmOeo/7xLluiWiafQX9nePyznXLsg7eE1rfN74ePpnDUxGb/Ly7t8Gsd1iZetIlDJOqiysXgTm6PQQKtyNTqn4COJdowQfuWRFF6aTmG80cNwFc70yvk3YsBa6mmZiGbtq6kCjm9LUQe0hgh4UxRndjg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750048315; c=relaxed/simple;
	bh=k2bg1Idbmpr7InDb5GGMHb0LUKQqJAT8NkVZyKNijmk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pt+hY5ynEdyhpXQkhcH2ILi7TA89u6Vjugq7GykW94m8tlnmyTJ2ZS6xsySVYQ9OqrePmGe0X9M5c/hmzSOWx4JP9z+Zt5Gag0Ukbfbn5oXZGJ0fJjd6Uwea1v50AgKPONmBgS8QQkJrNOXZD7nuxBDDE0gVFi/8kvv9znkO2Sc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=Rumq+mOQ; arc=fail smtp.client-ip=40.107.220.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cyu3w8O7ef08U+L6ug8uhAWyJKWpIKYQRVzZJN6TMvWKe3tIeDL8fCxoK15OLkwks85UFCgki5/YkbuACN3I79Wg+sAhtkFUGb/E5q0D2A8S3gy4JB9y1DWO7jNYQCjx9xeaW4xAGkOFydJZN+aJ90kFf7z/QlAuZTcp3w5IiDswUovv5sZAydx9e0ZwATIx95s0OgW1WG7ahNba1UYBoj9CWu6m5L+9UIETmQ/HSFuaTrQh28kIqGUyWos1xzimtQSRUhRAZzsv7SnJbn4dibXZMmTt7daPt65uAie4PdHSgTT9Wc1HFK02KyrTd8bg11RQ9oOszC7G8QC/hvnqCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LgF8+PR+/dKwRsE/gY6SrakSd+MSYhaWICfnygds71k=;
 b=svUopiH+d5DTs11Ha+BeFREUcFvwrC0c3F1eoexEdHUjUkxxmsUS9mX4NHqlsodo1xKS1Mwkb6JCc9dvF4i2Al033xRZukNtMR2ToL8vBTamc5nTQgZ5k1J/wLOkAnK/usohVftoFzISc8BMteJAW/rtr0/Iw4nubzFWPqhIct7oOI37/p8ACpLeSPwM+dyHwrm0FDzgGfoD9SUIqJHKNBkQnbyZtdlYP0iwI6lHckJT++MKCcIi4FME1QuIPb1NoWAMsZ+7uB63TUb0zYU3ut09mfNMxgG10mUXH68ytKyYTt+ghaddXO4B9UK0BbjBvO5LEl6oMLsflDctW83nVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LgF8+PR+/dKwRsE/gY6SrakSd+MSYhaWICfnygds71k=;
 b=Rumq+mOQQinBZ1UWCfzn7gk06utwBN4XmM5Atb4GP336Af5Jy8cF/3JY0RhwIpPZAKCG/965GylCUJHWAIZ844IYr+lHumwgCrkt4I9BTYGEsT2Vg6ysqy+49sd8CY60plFiva/aVbeYn7Ex4nSMgBuiad8w6B3V2Dcit8qufiSaFtKYSw4DzND+BNFqt79kOX31OqMYJn34+y6LwiPjlTCAU80+Vh70K3+1XuTCn1EO4+U6a3vic0RXCyNGB9rzYmXxqTKUkmcdRhlP+bSydqW5mIrocos85wArnCVzu+zFlZ/WozLyy2L8LxjF1zpZdgMjzY+9GsWeYtwJNISFgA==
Received: from MW4PR03CA0076.namprd03.prod.outlook.com (2603:10b6:303:b6::21)
 by LV3PR18MB5662.namprd18.prod.outlook.com (2603:10b6:408:1a5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 04:31:48 +0000
Received: from SJ1PEPF00002327.namprd03.prod.outlook.com
 (2603:10b6:303:b6:cafe::f8) by MW4PR03CA0076.outlook.office365.com
 (2603:10b6:303:b6::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Mon,
 16 Jun 2025 04:31:48 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.0.1];
Received: from [127.0.0.1] (50.233.182.194) by
 SJ1PEPF00002327.mail.protection.outlook.com (10.167.242.90) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Mon, 16 Jun 2025 04:31:47 +0000
From: Harshit Shah <hshah@axiado.com>
Date: Sun, 15 Jun 2025 21:31:34 -0700
Subject: [PATCH v2 1/6] dt-bindings: vendor-prefixes: Add Axiado
 Corporation
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250615-axiado-ax3000-soc-and-evaluation-board-support-v2-1-341502d38618@axiado.com>
References: <20250615-axiado-ax3000-soc-and-evaluation-board-support-v2-0-341502d38618@axiado.com>
In-Reply-To: <20250615-axiado-ax3000-soc-and-evaluation-board-support-v2-0-341502d38618@axiado.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 soc@lists.linux.dev, Harshit Shah <hshah@axiado.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=831; i=hshah@axiado.com;
 h=from:subject:message-id; bh=k2bg1Idbmpr7InDb5GGMHb0LUKQqJAT8NkVZyKNijmk=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBoT54w5xDAQVjfhynJQzhz1DXs2BEqmm1w5FgPq
 8h1Lofqq8OJAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaE+eMAAKCRDxWHMRoTLV
 +7xfDACPHeiiIXIKgXYPXJJHjvNIn7waYZdwbnTjYuj3xmeM222g5wphraWArNx2NEVrYRCdd/B
 sJKPFH0NolldRWNo/9rul4VRTcxX15vqQQgSIMvVuMKkq9ux0668ngdEOaK79iGQhX8PxMf36NE
 +8S0ATMA+i1IuAeNPX3JFApqnMEceFUv7Pwp+abShz+esfGQpriht8eNE5Haw8DXR2gds6Ltro9
 oyvOeDXDdrah0mGcMoawipXqMtXxkW3yTCEXFp56csG0Tz5H0uLrQPlQboLqr6SG4yMV9qcjQpm
 yQavX9pi8ZQD0KfZGJ/BCReP2kAU0ZiDtz9mOqh4gfJvIiFSmwc+8dp/dfvOx6RpsxnmZsgnlUD
 cV42z1Z8pNlXKxIMLJB0xLLsO2X6G7ptXFcCKJ/YRci9lLjNR95nmeN5Gq4H3P6Oz8aj3KaFeIH
 s+AsXu5n9chxU/+Tn4ohFZxwRZ9i7F+HMX0b19l1FiTks/wETOga4TJCr5Bb8uTdWILBU=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002327:EE_|LV3PR18MB5662:EE_
X-MS-Office365-Filtering-Correlation-Id: b1cfee37-4450-4832-5f35-08ddac8eb513
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|7416014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WFBUMnl0N1hia0hFbitkZW55RUJycGIzLzZoRkJzRFFNQ2dFT29ZRVlCVFZu?=
 =?utf-8?B?NysvOXQwa0ZWRi9Wbi9ueEJUU1M3YWE1YjVsTWZTblFya0o5SExpM3d6NkIz?=
 =?utf-8?B?cHNSa2pHUERUTkxjUCtJZm5yNzBLdi9lY1dpMEdjWHZqK29LV2lwcXhwTWhI?=
 =?utf-8?B?YWN0QXU5bDltUFdNTWZGZ2xjV1Vnc1FsaVBxb2lBQlFPZ04zSVZCOWxKSXFR?=
 =?utf-8?B?QnJFRlVKdG96UkF3RmM3RHFwS2ZVQXo0bkVScCtlY2cxa2RDbFg5QUlkUDFM?=
 =?utf-8?B?eU5IV1Mzd0lkalVFOTU1UXE4MTcvVHNvOHV3TTB2ZnhQWkp0cFptNHhNbnJh?=
 =?utf-8?B?ZW95UHcwc2RkY1lCYUlKaElva282MkVZdEpIRE5WdDJVQXdmQ2FsVnlpYkRr?=
 =?utf-8?B?eWZDdUFLYjJENmp3eUtkMlRydWVYb3RtOVdXcVlEa2RWZy9MazNZdUc2RDNS?=
 =?utf-8?B?Q0lEK3ZpbnBGTUREbSt2Um5tTXV2R2w3Yk11dEgraXg2RnljV0ZVa3RzL1Vx?=
 =?utf-8?B?MVo5dGVzeTM4Tmh0WnZWTDltcWtpUGNsb0NacE9aeUJTaU9RTnpRSXhGZnQz?=
 =?utf-8?B?OXNFZFI0eUQ3SC9EN2JKY1hmY0tPT0NLWFNJTUJxdmRNZFNieXlzRlpDaGlT?=
 =?utf-8?B?OTFZOTdVUy83ZDhwZmE4VmdJb3ZDOElTMjlSRUowaXB5bGxwdlY0cEQwdUFa?=
 =?utf-8?B?bHBGOU5mMm12VGovMTF1WTc5eEJSZmk4Q29JUC82ZVBHRlplcnBZeDExR2Q2?=
 =?utf-8?B?V0UxZzdQa0JLWU5yL1ZGNGRjbnlHU2hEb2wrRVN0NWVjalVObGl6dng1aTZp?=
 =?utf-8?B?ZUtiR09VbjU0SzJpclhQYnN6THVTcFk2S0JZd3QrcUJFeHVzZG5FUU0rQVVU?=
 =?utf-8?B?aVc3TEJGWFpxaUlRWGNwOFVBMHZpM1lveG9wUHRaZEZpUmp1UHpFcCtNVFhl?=
 =?utf-8?B?Ukd2cUdmZFQvYlNGd3pMUjAyVDNzTFY4VjdybFlxSmtKNHpUMXhXTG51ckJp?=
 =?utf-8?B?MzkzaWxpNW0xeHgvRVMxd2JFMjFxZmxjdThDVmdKckVtMGc0Q0I5NnN2aHM2?=
 =?utf-8?B?MmlJSVZ2ZUhhdTBRYkZGUlVyakxRVVVLaHh2bkVhRjNKdm9ISWg2d3gvaVBY?=
 =?utf-8?B?R1o5YzRRdll5Tm96V0JvYkVLRkY1eHBLbnFPMzIxbzN2WEdPVEdMUjRseStO?=
 =?utf-8?B?OVRJWmJCOWRhWVh2RDF4b1pIaWI3cFIrT3NYOSs3dElSM1RPa3AvMXZncjBL?=
 =?utf-8?B?bElDemkxYlpVS1EyQUhkcWVaVDFNMU1XcjU4NmNJZ0hEdGJvaU1jM1k4TGVZ?=
 =?utf-8?B?cmQ4emhWOWh4RWVVb2dXb1YxVGg2bGZGaXBWVDFjV1VCemFLNnVyYTUwc2dY?=
 =?utf-8?B?NlBOTTNXUHFmYXRFajEzY1BqSmtYRHNZZkxGeXl1WUVOQ2lZQS94VDd4aWVw?=
 =?utf-8?B?Ry9COUJjYlNyM0gxeUs3T2JITjhDdjdnamdLYldxNkE3Q0dTek92SkZWNjg1?=
 =?utf-8?B?OXV2YXFXV0NxcDhVb0tKWlJXSzRBNGVPZC94TVQzbXU4YnJyOFdGVis0ZjBk?=
 =?utf-8?B?VEw3TDFKSFhzM25WcHhwUjNBUmplR0t4T3ZLQlowMGZ0dVoyZ0ZEUDJUQUJi?=
 =?utf-8?B?a0VkdDNyZW56SmhSTjdiaERPTk5wakJpZGZpNDRlZXhLZ2I3bkMrdGl1UHF4?=
 =?utf-8?B?VGlpbUdHYUUzSkR0cmpPN2ZkSGRTcllxZzEyYWp4ZjB0VVRaTlRQc3FPQlVG?=
 =?utf-8?B?U2pnWEpnN3ErdkFRZ2lxdG42aFdMSHlpTVpoRHI1R2RrS2xpQVUvOVhhOWpY?=
 =?utf-8?B?aDNZWE9JaTZtV011UEpNdDVQMXg4VGt1ZE0rTVY1WnVEVGNNbDQzNmNjWVBR?=
 =?utf-8?B?b044clMvMnF0eVBDczZPVlgzWWd1V2JKeXFRY1MydDJlcFN1UWhlSkNIU1pT?=
 =?utf-8?B?VjRXbC9FZW15Y0FNU1VERURQMy9kd3lielZ5MkN2ZGNUOUh1SW1YVTBmMmVx?=
 =?utf-8?B?UmdTQW8va3pnPT0=?=
X-Forefront-Antispam-Report:
	CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.0.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(7416014)(1800799024)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 04:31:47.9215
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1cfee37-4450-4832-5f35-08ddac8eb513
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.0.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002327.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR18MB5662

Link: https://axiado.com
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


